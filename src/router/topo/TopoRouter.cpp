// Topological router.
//
// Topology database (per copper layer, over the shared routing mesh):
//   * every mesh edge keeps the ordered list of wire crossings (canonical v0 -> v1 order);
//   * every triangle keeps the chords wires make inside it (edge-crossing or vertex endpoints).
// A new route is legal when none of its chords crosses a chord of another net inside any
// triangle; given the entry position, the exit position on another edge is therefore forced.
// Capacity of an edge = free distance between its endpoint obstacles; overflow is negotiated
// (PathFinder-style present + history costs) with rip-up and reroute.
#include "router/topo/TopoRouter.h"

#include <algorithm>
#include <chrono>
#include <cstdlib>
#include <flat_map>
#include <flat_set>
#include <inplace_vector>
#include <mdspan>
#include <numeric>
#include <optional>
#include <print>
#include <queue>
#include <random>
#include <set>
#include <ranges>
#include <unordered_map>

#include "core/ZoneFill.h"
#include "drc/Drc.h"
#include "router/topo/Optimizer.h"
#include "router/topo/Realizer.h"
#include "router/topo/Refine.h"
#include "router/topo/TopoMesh.h"

namespace xr::topo {

namespace {

constexpr double kUnit = 1e6;  // congestion cost unit: 1 mm of track
constexpr double kCrossHistory = 3.0;  // history added to the edges of a triangle with crossings
constexpr size_t kMaxExpansions = 3'000'000;
constexpr double kOffLayer = 10 * kUnit;
constexpr double kNarrowCost = 0.5 * kUnit;  // a crossing at the minimum width («подрезка»)  // each edge crossed on a layer the net is not assigned to

// rows x cols table with row-major storage, indexed as grid[r, c] through std::mdspan.
template <class T>
class Grid {
 public:
  Grid() = default;
  Grid(size_t rows, size_t cols) : data_(rows * cols), rows_(rows), cols_(cols) {}
  T& operator[](size_t r, size_t c) { return std::mdspan(data_.data(), rows_, cols_)[r, c]; }
  const T& operator[](size_t r, size_t c) const { return std::mdspan(data_.data(), rows_, cols_)[r, c]; }
  size_t rows() const { return rows_; }
  size_t cols() const { return cols_; }

 private:
  std::vector<T> data_;
  size_t rows_ = 0, cols_ = 0;
};

struct End {
  bool vertex = false;
  int local = 0;  // vertex or edge index inside the triangle
  int cid = -1;   // crossing id for edge ends
};

struct Chord {
  int wire = -1;
  int net = kNoNet;
  End a, b;
};

struct Crossing {
  int wire = -1;
  int edge = -1;
  double width = 0;  // the wire's width on this edge (nominal, or the minimum where that is all that fits)
};

struct Wire {
  int net = kNoNet;
  int li = 0;
  int v0 = -1, v1 = -1;
  std::vector<int> cids;
  std::vector<int> tris;
  Coord width = 0, widthMin = 0, clr = 0;
  bool alive = true;
};

struct EdgeUse {
  double sumW = 0;
  int n = 0;
  double maxC = 0;
};

// Everything that rip-up & reroute changes; copied for best-solution snapshots.
struct State {
  Grid<std::vector<int>> cross;    // [layer, edge] -> crossing ids, canonical order
  Grid<std::vector<Chord>> chords;  // [layer, triangle]
  Grid<EdgeUse> use;               // [layer, edge]
  std::vector<Crossing> crossings;
  std::vector<Wire> wires;
  std::vector<int> viaNet;                                  // per mesh vertex
  std::vector<std::vector<std::pair<int, int>>> failed;     // per job: (pad, nearest net pad)
};

struct NetJob {
  int net = kNoNet;
  std::vector<int> pads;
  double estLen = 0;
};

struct SNode {
  double g = 0;
  int parent = -1;
  int li = 0;
  bool atVertex = false;
  int tri = -1, le = -1, gap = 0;  // edge entry: entering `tri` through local edge `le` at canonical gap
  int vtx = -1;                    // vertex nodes
  int chordTri = -1;               // triangle holding the chord leading here (-1: start / layer change)
  bool via = false;                // layer change through a new via at vtx
  bool narrow = false;             // edge entry at the minimum width
  bool transit = false;            // via arrival on the old layer (not expanded)
  bool goal = false;
  Vec2 pt;
};

struct ObstInfo {
  const Shape* shape;
  double clr;
  int group;  // same group (pad) = same physical obstacle
};

class Router {
 public:
  Router(Board& b, const RouterOptions& o) : b_(b), o_(o) {}
  RouterResult run();

 private:
  Board& b_;
  const RouterOptions& o_;
  TopoMesh m_;
  LayerList layers_;
  int NL_ = 0;
  std::vector<Shape> padShape_, vshape_;
  std::vector<char> cornerOk_;  // pad corners may carry a track end (corner radius >= width / 2)
  std::vector<std::pair<Vec2, Vec2>> interval_;  // free part of each edge (canonical direction)
  std::vector<std::vector<int>> vertEdges_;
  Grid<double> hist_;
  State s_;
  std::vector<NetJob> jobs_;
  double presFac_ = 1;
  bool hardCap_ = false;
  // Soft planarity (PathFinder for topology): crossing another net's chord is allowed at a cost in
  // early passes; the nets involved are ripped up and rerouted until the crossings disappear.
  bool softPlanar_ = false;
  double crossPenalty_ = 0;
  RouterResult res_;

  // Current search context.
  int net_ = kNoNet;
  double width_ = 0, clr_ = 0, viaR_ = 0, viaClr_ = 0;
  std::vector<double> widthL_, widthMinL_, clrL_;  // the net's width (nominal, minimum) and clearance per layer
  LayerMask assigned_ = 0;             // «Назначение цепей на слои» of the net (0: any layer)
  Coord viaDia_ = 0, viaDrill_ = 0;
  std::vector<int> treeStamp_;
  int stamp_ = 0;
  std::vector<Vec2> targets_;
  BBox targetBox_;
  int startPad_ = -1;
  bool relaxed_ = false;

  bool cancelled() const { return o_.cancel && o_.cancel->load(); }
  Vec2 P(int v) const { return m_.verts[v].p; }

  void setup();
  void setNet(int net);
  std::optional<ObstInfo> obst(int v, int li, int net) const;
  double freeLength(int e, int li, int net, double& cu, bool& ou, double& cv, bool& ov) const;
  double crossCost(int e, int li, bool& blocked, bool* narrow = nullptr) const;
  // `path` leads to the node placing the via: the vias already on it count as obstacles too.
  double viaPenalty(int w, bool& blocked, const std::vector<SNode>& nodes, int from) const;

  double crossCoord(int li, int t, int le, int cid) const;
  double gapCoord(int li, int t, int le, int g) const;
  double endCoord(int li, int t, const End& e) const {
    return e.vertex ? double(e.local) : crossCoord(li, t, e.local, e.cid);
  }
  // Number of other-net chords of triangle t the chord s-e would cross; -1 = impossible (shared end).
  int chordCrossings(int li, int t, double s, double e) const;
  bool chordOk(int li, int t, double s, double e) const { return relaxed_ || chordCrossings(li, t, s, e) == 0; }
  // Exit gap on local edge le with the fewest crossings (only crossing-free ones unless soft).
  std::optional<std::pair<int, int>> exitGap(int li, int t, int le, double s) const;
  int countCrossings(std::vector<char>* netsInvolved) const;
  Vec2 intervalPoint(int e, double f) const {
    auto [a, c] = interval_[e];
    return a + (c - a) * f;
  }

  bool inTree(int v) const { return treeStamp_[v] == stamp_; }
  bool isTarget(int v, int li) const;
  bool isJunction(int v, int li) const;
  bool isViaSite(int v) const;
  void addPadToTree(int pad);
  void addVertexToTree(int v);
  double heuristic(Vec2 p) const;

  std::optional<std::vector<SNode>> search(int pad);
  void commit(const std::vector<SNode>& path, std::vector<int>& joinedPads);
  int insertCrossing(int li, int e, int gap, int wire, bool narrow);
  void removeWire(int w);
  void ripup(int job);
  void routeJob(int job);

  bool edgeOverflow(int li, int e) const;
  std::vector<int> blockersOf(int job) const;
  int countOverflow() const;
  // Realises the topology into tracks/vias appended to the board; returns wire index per new track.
  std::vector<int> realizeAll();
  // Geometric check of the realised tracks; returns the wires involved and the spots.
  struct Conflict {
    Vec2 pos;
    int wireA, wireB;  // wire indices into the last realisation (-1 = static obstacle)
  };
  std::vector<Conflict> checkRealized(size_t firstTrack, const std::vector<int>& trackWire) const;
  int penalizeAround(int wire, Vec2 pos, double radius);
  std::vector<int> realizedWires_;  // s_.wires index of each RealWire passed to realize()
};

void Router::setup() {
  for (LayerId l : b_.copperLayers()) {
    if (b_.layers[l].plane) continue;  // plane layers carry their net as a pour, not tracks
    int idx = b_.layers[l].copperIndex;
    if (o_.copperIndices.empty() || std::ranges::contains(o_.copperIndices, idx)) layers_.push_back(l);
  }
  NL_ = int(layers_.size());

  MeshOptions mo;
  mo.viaPitch = o_.viaPitch;
  for (auto& nc : b_.netClasses) {
    mo.viaDiameter = std::max(mo.viaDiameter, double(nc.viaDiameter));
    mo.clearance = std::max(mo.clearance, double(nc.clearance));
  }
  mo.viaSites = o_.useVias && NL_ > 1;
  m_.build(b_, mo);

  padShape_.resize(b_.pads.size());
  cornerOk_.resize(b_.pads.size());
  for (auto [i, p] : std::views::enumerate(b_.pads)) {
    padShape_[i] = (!p.copper && p.drill > 0) ? Shape::circle(p.pos.v(), p.drill / 2.0) : p.shapeGeom();
    // TopoR rule: tracks attach to the pad anchor; corners only when they are rounded enough.
    cornerOk_[i] = padShape_[i].r >= b_.classOf(p.net).trackWidth / 2.0;
  }
  vshape_.resize(m_.verts.size());
  for (auto [i, v] : std::views::enumerate(m_.verts)) {
    if (v.kind == VKind::FixedVia) vshape_[i] = Shape::circle(v.p, b_.vias[v.fixedVia].diameter / 2.0);
    else vshape_[i] = Shape::circle(v.p, 0);
  }

  // Free interval of every edge: the part not covered by pad copper.
  interval_.resize(m_.edges.size());
  vertEdges_.assign(m_.verts.size(), {});
  for (auto [e, me] : std::views::enumerate(m_.edges)) {
    Vec2 a = P(me.v[0]), c = P(me.v[1]);
    double len = (c - a).len();
    Vec2 d = len > 0 ? (c - a) / len : Vec2{};
    auto exitOf = [&](int v, Vec2 from, Vec2 dir) {
      int pad = m_.verts[v].pad;
      return pad >= 0 ? padShape_[pad].rayExit(from, dir) : 0.0;
    };
    double ea = exitOf(me.v[0], a, d), ec = exitOf(me.v[1], c, -d);
    if (ea + ec >= len) {
      double f = (ea + ec) > 0 ? ea / (ea + ec) : 0.5;
      interval_[e] = {a + (c - a) * f, a + (c - a) * f};
    } else {
      interval_[e] = {a + d * ea, c - d * ec};
    }
    vertEdges_[me.v[0]].push_back(int(e));
    vertEdges_[me.v[1]].push_back(int(e));
  }

  s_.cross = Grid<std::vector<int>>(NL_, m_.edges.size());
  s_.chords = Grid<std::vector<Chord>>(NL_, m_.tris.size());
  s_.use = Grid<EdgeUse>(NL_, m_.edges.size());
  s_.viaNet.assign(m_.verts.size(), -1);
  hist_ = Grid<double>(NL_, m_.edges.size());
  treeStamp_.assign(m_.verts.size(), 0);

  // Net jobs: every net with at least two routable pads.
  std::flat_map<int, std::vector<int>> netPads;
  for (auto [i, p] : std::views::enumerate(b_.pads)) {
    if (p.net == kNoNet || m_.padVerts[i].empty()) continue;
    if (!std::ranges::any_of(layers_, [&](LayerId l) { return p.onLayer(l); })) continue;
    netPads[p.net].push_back(int(i));
  }
  for (auto&& [net, pads] : netPads) {
    if (pads.size() < 2) continue;
    if (!o_.nets.empty() && !std::ranges::contains(o_.nets, b_.nets[net].name)) continue;
    NetJob j;
    j.net = net;
    j.pads = pads;
    // Estimated length: Prim MST over pad centres.
    std::vector<double> best(pads.size(), std::numeric_limits<double>::max());
    std::vector<char> in(pads.size(), 0);
    best[0] = 0;
    for (size_t it = 0; it < pads.size(); ++it) {
      size_t k = 0;
      double bd = std::numeric_limits<double>::max();
      for (size_t q = 0; q < pads.size(); ++q)
        if (!in[q] && best[q] < bd) { bd = best[q]; k = q; }
      in[k] = 1;
      j.estLen += bd;
      for (size_t q = 0; q < pads.size(); ++q)
        if (!in[q])
          best[q] = std::min(best[q], (b_.pads[pads[k]].pos.v() - b_.pads[pads[q]].pos.v()).len());
    }
    jobs_.push_back(std::move(j));
  }
  std::ranges::sort(jobs_, {}, &NetJob::estLen);
  s_.failed.assign(jobs_.size(), {});
  for (auto& j : jobs_) res_.connections += int(j.pads.size()) - 1;
}

void Router::setNet(int net) {
  net_ = net;
  const NetClass& nc = b_.classOf(net);
  width_ = double(nc.trackWidth);
  clr_ = double(nc.clearance);
  widthL_.assign(NL_, 0);
  widthMinL_.assign(NL_, 0);
  clrL_.assign(NL_, 0);
  for (int li = 0; li < NL_; ++li) {
    widthL_[li] = double(b_.trackWidth(net, layers_[li]));
    widthMinL_[li] = std::min(widthL_[li], double(b_.minTrackWidth(net, layers_[li])));
    clrL_[li] = double(b_.clearance(net, layers_[li]));
  }
  assigned_ = b_.assignedLayers(net);
  viaDia_ = nc.viaDiameter;
  viaDrill_ = nc.viaDrill;
  viaR_ = nc.viaDiameter / 2.0;
  viaClr_ = clr_;
}

std::optional<ObstInfo> Router::obst(int v, int li, int net) const {
  const MVertex& mv = m_.verts[v];
  switch (mv.kind) {
    case VKind::PadCenter:
    case VKind::PadCorner: {
      const Pad& p = b_.pads[mv.pad];
      bool on = p.onLayer(layers_[li]) || (p.drill > 0 && !p.copper);
      if (!on || (net != kNoNet && p.net == net)) return std::nullopt;
      return ObstInfo{&padShape_[mv.pad], double(b_.clearance(p.net, layers_[li])), mv.pad};
    }
    case VKind::ViaSite: {
      int vn = s_.viaNet[v];
      if (vn < 0 || vn == net) return std::nullopt;
      return ObstInfo{&vshape_[v], double(b_.clearance(vn, layers_[li])), -2 - v};
    }
    case VKind::FixedVia: {
      const Via& bv = b_.vias[mv.fixedVia];
      if ((net != kNoNet && bv.net == net) || !bv.onLayer(layers_[li])) return std::nullopt;
      return ObstInfo{&vshape_[v], double(b_.clearance(bv.net, layers_[li])), -2 - v};
    }
    case VKind::Outline: return ObstInfo{&vshape_[v], double(b_.edgeClearance), -1};
    case VKind::Keepout: {
      // Wires keep off the keepout itself (no clearance), on its layers only.
      const Keepout& k = b_.keepouts[mv.keepout];
      if (!k.onLayer(layers_[li])) return std::nullopt;
      return ObstInfo{&vshape_[v], 0.0, -1};
    }
  }
  return std::nullopt;
}

double Router::freeLength(int e, int li, int net, double& cu, bool& ou, double& cv, bool& ov) const {
  int u = m_.edges[e].v[0], v = m_.edges[e].v[1];
  auto a = obst(u, li, net), c = obst(v, li, net);
  ou = a.has_value();
  ov = c.has_value();
  cu = a ? a->clr : 0;
  cv = c ? c->clr : 0;
  if (a && c) {
    if (a->group >= 0 && a->group == c->group) return 0;
    return a->shape->distance(*c->shape);
  }
  if (a) return a->shape->distance(P(v));
  if (c) return c->shape->distance(P(u));
  return (P(u) - P(v)).len();
}

double Router::crossCost(int e, int li, bool& blocked, bool* narrow) const {
  if (narrow) *narrow = false;
  // Edges between two vertices of the wire's own pad lie inside its copper: never a constraint.
  int pu = m_.verts[m_.edges[e].v[0]].pad, pv = m_.verts[m_.edges[e].v[1]].pad;
  if (pu >= 0 && pu == pv && b_.pads[pu].net == net_ && b_.pads[pu].onLayer(layers_[li])) return 0;
  if ((m_.edges[e].blocked >> layers_[li]) & 1) {  // a keepout boundary
    blocked = true;
    return 0;
  }
  double cu, cv;
  bool ou, ov;
  double free = freeLength(e, li, net_, cu, ou, cv, ov);
  const EdgeUse& u = s_.use[li, e];
  double wl = widthL_[li];
  const double cl = clrL_[li];
  double cc = std::max(u.maxC, cl);
  double ends = (ou ? std::max(cu, cl) : 0) + (ov ? std::max(cv, cl) : 0);
  double cost = hist_[li, e] * kUnit;
  // Where the nominal width does not fit, the minimum may (TopoR narrows the wire there).
  if (!relaxed_ && wl + ends > free + 1) {
    if (widthMinL_[li] + ends > free + 1) {
      blocked = true;
      return 0;
    }
    wl = widthMinL_[li];
    cost += kNarrowCost;
    if (narrow) *narrow = true;
  }
  double need = u.sumW + wl + u.n * cc + ends + (u.n + 1) * kRealizeMargin;
  double over = need - free;
  // Other layers than the assigned ones only for short stretches (an SMD pad to its via).
  if (assigned_ && !((assigned_ >> layers_[li]) & 1)) cost += kOffLayer;
  if (over > 1 && !relaxed_) {
    if (hardCap_) {
      blocked = true;
      return 0;
    }
    cost += presFac_ * kUnit * (1 + over / (wl + cl));
  }
  return cost;
}

double Router::viaPenalty(int w, bool& blocked, const std::vector<SNode>& nodes, int from) const {
  double cost = 0;
  // Vias this very path has placed (not committed yet): a wire between two of them is squeezed as well.
  std::inplace_vector<int, 16> pathVias;
  for (int i = from; i >= 0 && pathVias.size() < pathVias.capacity(); i = nodes[i].parent)
    if (nodes[i].via && nodes[i].vtx != w) pathVias.push_back(nodes[i].vtx);
  for (int li = 0; li < NL_; ++li)
    for (int e : vertEdges_[w]) {
      const EdgeUse& u = s_.use[li, e];
      if (u.n == 0) continue;
      int other = m_.edges[e].v[0] == w ? m_.edges[e].v[1] : m_.edges[e].v[0];
      auto o = obst(other, li, kNoNet);
      Shape via = Shape::circle(P(w), viaR_);
      Shape otherVia = Shape::circle(P(other), viaR_);
      bool pathVia = std::ranges::contains(pathVias, other);
      if (pathVia && !o) o = ObstInfo{&otherVia, viaClr_, -2 - other};
      double free = o ? o->shape->distance(via) : via.distance(P(other));
      double need = u.sumW + (u.n - 1) * u.maxC + std::max(viaClr_, u.maxC) + (o ? std::max(o->clr, u.maxC) : 0) +
                    u.n * kRealizeMargin;
      // Wires already crossing the edges at the site cannot be pushed aside by a via: hard block,
      // except in soft passes where the conflict is negotiated like any other overflow.
      if (need - free > 1) {
        if (!softPlanar_) {
          blocked = true;
          return 0;
        }
        cost += presFac_ * kUnit * (1 + (need - free) / (u.sumW / u.n + u.maxC));
      }
    }
  return cost;
}

double Router::crossCoord(int li, int t, int le, int cid) const {
  const auto& list = s_.cross[li, m_.tris[t].e[le]];
  auto k = std::ranges::find(list, cid) - list.begin();
  double f = (double(k) + 1.0) / (double(list.size()) + 1.0);
  if (!m_.sameDir(t, le)) f = 1 - f;
  return (le + 1) % 3 + f;
}

double Router::gapCoord(int li, int t, int le, int g) const {
  const auto& list = s_.cross[li, m_.tris[t].e[le]];
  double f = (double(g) + 0.5) / (double(list.size()) + 1.0);
  if (!m_.sameDir(t, le)) f = 1 - f;
  return (le + 1) % 3 + f;
}

int Router::chordCrossings(int li, int t, double s, double e) const {
  double lo = std::min(s, e), hi = std::max(s, e);
  int n = 0;
  for (const Chord& ch : s_.chords[li, t]) {
    if (ch.net == net_) continue;
    double a = endCoord(li, t, ch.a), c = endCoord(li, t, ch.b);
    if (a == s || a == e || c == s || c == e) return -1;
    bool ia = lo < a && a < hi, ic = lo < c && c < hi;
    if (ia != ic) {
      if (!softPlanar_) return 1;
      ++n;
    }
  }
  return n;
}

std::optional<std::pair<int, int>> Router::exitGap(int li, int t, int le, double s) const {
  if (relaxed_) return std::pair{0, 0};
  int m = int(s_.cross[li, m_.tris[t].e[le]].size());
  std::optional<std::pair<int, int>> best;
  for (int g = 0; g <= m; ++g) {
    int c = chordCrossings(li, t, s, gapCoord(li, t, le, g));
    if (c == 0) return std::pair{g, 0};
    if (c > 0 && softPlanar_ && (!best || c < best->second)) best = std::pair{g, c};
  }
  return best;
}

int Router::countCrossings(std::vector<char>* netsInvolved) const {
  int pairs = 0;
  for (int li = 0; li < NL_; ++li)
    for (int t = 0; t < int(m_.tris.size()); ++t) {
      const auto& chs = s_.chords[li, t];
      for (size_t i = 0; i < chs.size(); ++i)
        for (size_t j = i + 1; j < chs.size(); ++j) {
          if (chs[i].net == chs[j].net) continue;
          double a = endCoord(li, t, chs[i].a), b = endCoord(li, t, chs[i].b);
          double c = endCoord(li, t, chs[j].a), d = endCoord(li, t, chs[j].b);
          double lo = std::min(a, b), hi = std::max(a, b);
          bool ic = lo < c && c < hi, id = lo < d && d < hi;
          if (ic == id) continue;
          ++pairs;
          if (netsInvolved) {
            (*netsInvolved)[chs[i].net] = 1;
            (*netsInvolved)[chs[j].net] = 1;
          }
        }
    }
  return pairs;
}

bool Router::isTarget(int v, int li) const {
  if (!inTree(v)) return false;
  const MVertex& mv = m_.verts[v];
  if (mv.pad >= 0) return b_.pads[mv.pad].onLayer(layers_[li]);
  if (mv.kind == VKind::FixedVia) return b_.vias[mv.fixedVia].onLayer(layers_[li]);
  return mv.kind == VKind::ViaSite && s_.viaNet[v] == net_;
}

bool Router::isJunction(int v, int li) const {
  const MVertex& mv = m_.verts[v];
  if (mv.pad < 0 || mv.pad == startPad_ || inTree(v)) return false;
  if (mv.kind == VKind::PadCorner && !cornerOk_[mv.pad]) return false;
  const Pad& p = b_.pads[mv.pad];
  return p.net == net_ && p.onLayer(layers_[li]);
}

bool Router::isViaSite(int v) const {
  return o_.useVias && NL_ > 1 && m_.verts[v].kind == VKind::ViaSite && s_.viaNet[v] < 0;
}

void Router::addVertexToTree(int v) {
  if (inTree(v)) return;
  treeStamp_[v] = stamp_;
  targets_.push_back(P(v));
  targetBox_.add(P(v));
}

void Router::addPadToTree(int pad) {
  for (int v : m_.padVerts[pad])
    if (m_.verts[v].kind != VKind::PadCorner || cornerOk_[pad]) addVertexToTree(v);
}

double Router::heuristic(Vec2 p) const {
  if (targets_.size() <= 48) {
    double best = std::numeric_limits<double>::max();
    for (Vec2 t : targets_) best = std::min(best, (t - p).len2());
    return std::sqrt(best);
  }
  double dx = std::max({targetBox_.minX - p.x, 0.0, p.x - targetBox_.maxX});
  double dy = std::max({targetBox_.minY - p.y, 0.0, p.y - targetBox_.maxY});
  return std::hypot(dx, dy);
}

std::optional<std::vector<SNode>> Router::search(int pad) {
  std::vector<SNode> nodes;
  using QE = std::pair<double, int>;
  std::priority_queue<QE, std::vector<QE>, std::greater<>> open;
  std::unordered_map<std::uint64_t, double> best;
  auto keyEdge = [](int li, int t, int le, int gap) {
    return (std::uint64_t(li) << 58) | (std::uint64_t(t) << 24) | (std::uint64_t(le) << 20) | std::uint64_t(gap & 0xFFFFF);
  };
  auto keyVertex = [](int li, int v) { return (std::uint64_t(1) << 63) | (std::uint64_t(li) << 58) | std::uint64_t(v); };
  auto push = [&](SNode n, std::uint64_t key) -> int {
    auto it = best.find(key);
    if (it != best.end() && it->second <= n.g) return -1;
    best[key] = n.g;
    nodes.push_back(n);
    int idx = int(nodes.size() - 1);
    open.push({n.g + heuristic(n.pt), idx});
    return idx;
  };

  const Pad& sp = b_.pads[pad];
  for (int v : m_.padVerts[pad])
    for (int li = 0; li < NL_; ++li) {
      if (!sp.onLayer(layers_[li])) continue;
      if (m_.verts[v].kind == VKind::PadCorner && !cornerOk_[pad]) continue;
      SNode n;
      n.li = li;
      n.atVertex = true;
      n.vtx = v;
      n.pt = P(v);
      push(n, keyVertex(li, v));
    }

  size_t nNoNb = 0, nBlocked = 0, nNoGap = 0, nPushed = 0;
  auto tryEdge = [&](int from, int t, double s, int le2) {
    const SNode& n = nodes[from];
    int e = m_.tris[t].e[le2];
    int t2 = m_.tris[t].nb[le2];
    if (t2 < 0 || ((m_.tris[t2].blocked >> layers_[n.li]) & 1)) { ++nNoNb; return; }
    bool blocked = false, narrow = false;
    double cc = crossCost(e, n.li, blocked, &narrow);
    if (blocked) { ++nBlocked; return; }
    auto gx = exitGap(n.li, t, le2, s);
    if (!gx) { ++nNoGap; return; }
    ++nPushed;
    int g = gx->first;
    int m = int(s_.cross[n.li, e].size());
    SNode c;
    c.li = n.li;
    c.tri = t2;
    c.le = m_.localEdge(t2, e);
    c.gap = g;
    c.narrow = narrow;
    c.chordTri = t;
    c.pt = intervalPoint(e, (g + 1.0) / (m + 2.0));
    c.g = n.g + (c.pt - n.pt).len() + cc + gx->second * crossPenalty_;
    c.parent = from;
    push(c, keyEdge(c.li, t2, c.le, c.gap));
  };

  auto tryVertex = [&](int from, int t, double s, int lv) {
    const SNode& n = nodes[from];
    int w = m_.tris[t].v[lv];
    if (n.atVertex && w == n.vtx) return;
    int crossings = relaxed_ ? 0 : chordCrossings(n.li, t, s, double(lv));
    if (crossings < 0 || (crossings > 0 && !softPlanar_)) return;
    SNode c;
    c.li = n.li;
    c.atVertex = true;
    c.vtx = w;
    c.chordTri = t;
    c.pt = P(w);
    c.g = n.g + (c.pt - n.pt).len() + crossings * crossPenalty_;
    c.parent = from;
    if (isTarget(w, n.li)) {
      c.goal = true;
      push(c, keyVertex(n.li, w));
    } else if (isJunction(w, n.li)) {
      int j = push(c, keyVertex(n.li, w));
      if (j < 0) return;
      const Pad& p = b_.pads[m_.verts[w].pad];
      for (int li2 = 0; li2 < NL_; ++li2) {
        if (li2 == c.li || !p.onLayer(layers_[li2])) continue;
        SNode d = nodes[j];
        d.li = li2;
        d.chordTri = -1;
        d.parent = j;
        push(d, keyVertex(li2, w));
      }
    } else if (isViaSite(w)) {
      bool blocked = false;
      double pen = viaPenalty(w, blocked, nodes, from);
      if (blocked) return;
      c.transit = true;
      nodes.push_back(c);
      int tIdx = int(nodes.size() - 1);
      for (int li2 = 0; li2 < NL_; ++li2) {
        if (li2 == c.li) continue;
        SNode d = c;
        d.transit = false;
        d.li = li2;
        d.chordTri = -1;
        d.via = true;
        d.parent = tIdx;
        d.g = c.g + o_.viaCost * kUnit + pen;
        push(d, keyVertex(li2, w));
      }
    }
  };

  size_t expansions = 0;
  while (!open.empty()) {
    auto [f, idx] = open.top();
    open.pop();
    SNode n = nodes[idx];
    std::uint64_t key = n.atVertex ? keyVertex(n.li, n.vtx) : keyEdge(n.li, n.tri, n.le, n.gap);
    if (auto it = best.find(key); it != best.end() && it->second < n.g) continue;
    if (n.goal) {
      std::vector<SNode> path;
      for (int i = idx; i >= 0; i = nodes[i].parent) path.push_back(nodes[i]);
      std::ranges::reverse(path);
      return path;
    }
    if (++expansions > kMaxExpansions || (expansions % 4096 == 0 && cancelled())) break;
    if (std::getenv("XR_DEBUG5") && expansions == 1) nodes.reserve(1024);
    if (n.atVertex) {
      for (int t : m_.verts[n.vtx].tris) {
        int lv = m_.localVertex(t, n.vtx);
        tryEdge(idx, t, double(lv), lv);
        for (int lv2 = 0; lv2 < 3; ++lv2)
          if (lv2 != lv) tryVertex(idx, t, double(lv), lv2);
      }
    } else {
      double s = gapCoord(n.li, n.tri, n.le, n.gap);
      for (int le2 = 0; le2 < 3; ++le2)
        if (le2 != n.le) tryEdge(idx, n.tri, s, le2);
      for (int lv = 0; lv < 3; ++lv) tryVertex(idx, n.tri, s, lv);
    }
  }
  if (std::getenv("XR_DEBUG5"))
    std::println(stderr, "search failed: {} expansions, {} nodes; edges: {} no-neighbour, {} capacity-blocked, {} no-gap, {} pushed",
                 expansions, nodes.size(), nNoNb, nBlocked, nNoGap, nPushed);
  return std::nullopt;
}

int Router::insertCrossing(int li, int e, int gap, int wire, bool narrow) {
  int cid = int(s_.crossings.size());
  const Wire& w = s_.wires[wire];
  double width = narrow ? double(w.widthMin) : double(w.width);
  s_.crossings.push_back({wire, e, width});
  auto& list = s_.cross[li, e];
  gap = std::clamp(gap, 0, int(list.size()));
  list.insert(list.begin() + gap, cid);
  EdgeUse& u = s_.use[li, e];
  u.sumW += width;
  u.n += 1;
  u.maxC = std::max(u.maxC, double(w.clr));
  return cid;
}

void Router::commit(const std::vector<SNode>& path, std::vector<int>& joinedPads) {
  auto newWire = [&](int li, int v0) {
    Wire w;
    w.net = net_;
    w.li = li;
    w.v0 = v0;
    w.width = Coord(widthL_[li]);
    w.widthMin = Coord(widthMinL_[li]);
    w.clr = Coord(clrL_[li]);
    s_.wires.push_back(std::move(w));
    return int(s_.wires.size() - 1);
  };
  auto addChord = [&](int li, int t, int wire, End a, End c) {
    s_.chords[li, t].push_back({wire, net_, a, c});
    s_.wires[wire].tris.push_back(t);
  };
  struct Last {
    bool vertex;
    int v;
    int cid;
    int edge;
  } last{true, path[0].vtx, -1, -1};
  auto resolve = [&](int t) {
    if (last.vertex) return End{true, m_.localVertex(t, last.v), -1};
    return End{false, m_.localEdge(t, last.edge), last.cid};
  };

  int wire = newWire(path[0].li, path[0].vtx);
  for (const SNode& n : path | std::views::drop(1)) {
    if (n.chordTri < 0) {  // layer change at the same vertex
      if (n.via) {
        s_.viaNet[n.vtx] = net_;
        vshape_[n.vtx] = Shape::circle(P(n.vtx), viaR_);  // occupied site now blocks like a via
      }
      if (s_.wires[wire].tris.empty()) {  // reuse the empty wire opened at this vertex
        s_.wires[wire].li = n.li;
        s_.wires[wire].v0 = n.vtx;
      } else {
        wire = newWire(n.li, n.vtx);
      }
      last = {true, n.vtx, -1, -1};
      continue;
    }
    int t = n.chordTri;
    End a = resolve(t);
    if (!n.atVertex) {
      int e = m_.tris[n.tri].e[n.le];
      int cid = insertCrossing(n.li, e, n.gap, wire, n.narrow);
      s_.wires[wire].cids.push_back(cid);
      addChord(n.li, t, wire, a, End{false, m_.localEdge(t, e), cid});
      last = {false, -1, cid, e};
    } else {
      addChord(n.li, t, wire, a, End{true, m_.localVertex(t, n.vtx), -1});
      s_.wires[wire].v1 = n.vtx;
      if (m_.verts[n.vtx].pad >= 0) joinedPads.push_back(m_.verts[n.vtx].pad);
      wire = newWire(n.li, n.vtx);
      last = {true, n.vtx, -1, -1};
    }
  }
  // The trailing wire started at the goal vertex is empty.
  for (int w = int(s_.wires.size()) - 1; w >= 0 && s_.wires[w].v1 < 0 && s_.wires[w].tris.empty(); --w) {
    s_.wires.pop_back();
  }
  for (const SNode& n : path)
    if (n.atVertex && s_.viaNet[n.vtx] == net_) addVertexToTree(n.vtx);
}

void Router::removeWire(int wi) {
  Wire& w = s_.wires[wi];
  if (!w.alive) return;
  for (int cid : w.cids) {
    int e = s_.crossings[cid].edge;
    auto& list = s_.cross[w.li, e];
    std::erase(list, cid);
    EdgeUse& u = s_.use[w.li, e];
    u.sumW -= s_.crossings[cid].width;
    u.n -= 1;
    u.maxC = 0;
    for (int c : list) u.maxC = std::max(u.maxC, double(s_.wires[s_.crossings[c].wire].clr));
    if (u.n <= 0) u = EdgeUse{};
  }
  std::ranges::sort(w.tris);
  auto [first, last] = std::ranges::unique(w.tris);
  w.tris.erase(first, last);
  for (int t : w.tris) std::erase_if(s_.chords[w.li, t], [&](const Chord& c) { return c.wire == wi; });
  w.alive = false;
  w.cids.clear();
  w.tris.clear();
}

void Router::ripup(int job) {
  int net = jobs_[job].net;
  for (int wi = 0; wi < int(s_.wires.size()); ++wi)
    if (s_.wires[wi].alive && s_.wires[wi].net == net) removeWire(wi);
  for (auto [v, vn] : std::views::enumerate(s_.viaNet))
    if (vn == net) {
      vn = -1;
      vshape_[v] = Shape::circle(P(int(v)), 0);
    }
  s_.failed[job].clear();
}

void Router::routeJob(int ji) {
  const NetJob& job = jobs_[ji];
  setNet(job.net);
  ++stamp_;
  targets_.clear();
  targetBox_ = BBox{};
  std::vector<char> done(job.pads.size(), 0);
  addPadToTree(job.pads[0]);
  done[0] = 1;
  auto markJoined = [&](int pad) {
    for (size_t k = 0; k < job.pads.size(); ++k)
      if (job.pads[k] == pad && !done[k]) {
        done[k] = 1;
        addPadToTree(pad);
      }
  };
  while (true) {
    // Unconnected pad closest to the tree.
    int pick = -1;
    double bd = std::numeric_limits<double>::max();
    for (size_t k = 0; k < job.pads.size(); ++k) {
      if (done[k]) continue;
      double d = heuristic(b_.pads[job.pads[k]].pos.v());
      if (d < bd) { bd = d; pick = int(k); }
    }
    if (pick < 0) break;
    done[pick] = 1;
    int pad = job.pads[pick];
    startPad_ = pad;
    // A pad already touching the tree (e.g. overlapping pads of the same net) needs no wire.
    bool touching = false;
    for (int k = 0; k < int(job.pads.size()) && !touching; ++k)
      if (k != pick && inTree(m_.padVerts[job.pads[k]][0]) &&
          padShape_[pad].distance(padShape_[job.pads[k]]) <= 0 &&
          (b_.pads[pad].copper & b_.pads[job.pads[k]].copper))
        touching = true;
    if (touching) {
      addPadToTree(pad);
      continue;
    }
    auto path = search(pad);
    if (!path && std::getenv("XR_DEBUG5")) {
      const Pad& p = b_.pads[pad];
      std::println(stderr, "no path from {}-{} net {}", b_.components[p.component].ref, p.number, b_.nets[net_].name);
      for (int padX : {pad, job.pads[0]})
      for (int v : m_.padVerts[padX]) {
        std::println(stderr, " vertex {} kind {} at ({:.3f},{:.3f}) tris {}", v, int(m_.verts[v].kind), P(v).x / 1e6,
                     P(v).y / 1e6, m_.verts[v].tris.size());
        for (int t : m_.verts[v].tris)
          for (int i = 0; i < 3; ++i) {
            int e = m_.tris[t].e[i];
            bool blocked = false;
            double cost = crossCost(e, 0, blocked);
            double cu, cv;
            bool ou, ov;
            double free = freeLength(e, 0, net_, cu, ou, cv, ov);
            std::println(stderr, "   tri {} edge {} ({}-{}) free {:.3f} ends {}/{} blocked {} cost {:.2f} nb {} chords {} crossings {}",
                         t, e, m_.edges[e].v[0], m_.edges[e].v[1], free / 1e6, ou, ov, blocked, cost / 1e6, m_.tris[t].nb[i],
                         s_.chords[0, t].size(), s_.cross[0, e].size());
          }
      }
    }
    if (!path) {
      // Remember the failure with the nearest pad already in the tree for blocker analysis.
      int nearest = job.pads[0];
      double nd = std::numeric_limits<double>::max();
      for (int k = 0; k < int(job.pads.size()); ++k) {
        int q = job.pads[k];
        if (q == pad || !inTree(m_.padVerts[q][0])) continue;
        double d = (b_.pads[q].pos.v() - b_.pads[pad].pos.v()).len();
        if (d < nd) { nd = d; nearest = q; }
      }
      s_.failed[ji].push_back({pad, nearest});
      if (std::getenv("XR_DEBUG5")) std::println(stderr, "FAILED job {} pad {}", ji, pad);
      continue;
    }
    std::vector<int> joined;
    commit(*path, joined);
    addPadToTree(pad);
    for (int p : joined) markJoined(p);
  }
  startPad_ = -1;
}

bool Router::edgeOverflow(int li, int e) const {
  const EdgeUse& u = s_.use[li, e];
  if (u.n == 0) return false;
  int net = s_.wires[s_.crossings[s_.cross[li, e].front()].wire].net;
  // Edges inside a pad of the crossing wires' own net carry no constraint (see crossCost).
  int pu = m_.verts[m_.edges[e].v[0]].pad, pv = m_.verts[m_.edges[e].v[1]].pad;
  if (pu >= 0 && pu == pv && b_.pads[pu].net == net) return false;
  double cu, cv;
  bool ou, ov;
  double free = freeLength(e, li, net, cu, ou, cv, ov);
  double need = u.sumW + (u.n - 1) * u.maxC + (ou ? std::max(cu, u.maxC) : 0) + (ov ? std::max(cv, u.maxC) : 0) +
                u.n * kRealizeMargin;
  return need > free + 1;
}

int Router::countOverflow() const {
  int n = 0;
  for (int li = 0; li < NL_; ++li)
    for (int e = 0; e < int(m_.edges.size()); ++e)
      if (edgeOverflow(li, e)) ++n;
  return n;
}

// Nets whose wires cross the straight line of a failed connection.
std::vector<int> Router::blockersOf(int ji) const {
  std::flat_map<int, int> count;  // net -> crossings on the corridor
  for (auto [pa, pb] : s_.failed[ji]) {
    Vec2 a = b_.pads[pa].pos.v(), c = b_.pads[pb].pos.v();
    for (auto [e, me] : std::views::enumerate(m_.edges)) {
      if (!segmentsIntersect(a, c, P(me.v[0]), P(me.v[1]))) continue;
      for (int li = 0; li < NL_; ++li)
        for (int cid : s_.cross[li, e]) {
          int net = s_.wires[s_.crossings[cid].wire].net;
          if (net != jobs_[ji].net) count[net]++;
        }
    }
  }
  std::vector<std::pair<int, int>> v(count.begin(), count.end());
  std::ranges::sort(v, std::greater{}, &std::pair<int, int>::second);
  if (v.size() > 6) v.resize(6);
  return v | std::views::keys | std::ranges::to<std::vector>();
}

std::vector<int> Router::realizeAll() {
  std::vector<RealWire> wires;
  realizedWires_.clear();
  for (auto [wiIdx, w] : std::views::enumerate(s_.wires)) {
    if (!w.alive || w.v0 < 0 || w.v1 < 0) continue;
    realizedWires_.push_back(int(wiIdx));
    RealWire rw;
    rw.net = w.net;
    rw.layer = layers_[w.li];
    rw.width = w.width;
    rw.widthMin = w.widthMin;
    rw.clearance = w.clr;
    // The sketch follows the chords through the triangle centroids: crossing points alone can be
    // collinear with pad centres (rows of THT pads), which is ambiguous for the realiser.
    auto centroid = [&](int t) {
      const MTri& T = m_.tris[t];
      return (P(T.v[0]) + P(T.v[1]) + P(T.v[2])) / 3.0;
    };
    std::vector<Vec2> pts{P(w.v0)};
    for (size_t i = 0; i < w.cids.size(); ++i) {
      int cid = w.cids[i];
      int e = s_.crossings[cid].edge;
      const auto& list = s_.cross[w.li, e];
      auto pos = std::ranges::find(list, cid) - list.begin();
      pts.push_back(intervalPoint(e, (double(pos) + 1) / (double(list.size()) + 1)));
    }
    pts.push_back(P(w.v1));
    for (size_t i = 0; i + 1 < pts.size(); ++i) {
      rw.sketch.push_back(pts[i]);
      if (i < w.tris.size()) rw.sketch.push_back(centroid(w.tris[i]));
    }
    rw.sketch.push_back(pts.back());
    wires.push_back(std::move(rw));
  }
  std::vector<RealVia> vias;
  for (auto [v, net] : std::views::enumerate(s_.viaNet)) {
    if (net < 0) continue;
    const NetClass& nc = b_.classOf(net);
    vias.push_back({P(int(v)), net, nc.viaDiameter, nc.viaDrill});
  }
  size_t before = b_.tracks.size();
  if (std::getenv("XR_SKETCH")) {  // debug: emit the topological sketches instead of taut geometry
    for (auto& w : wires)
      for (auto [a, c] : w.sketch | std::views::adjacent<2>) {
        Track t;
        t.a = Point(a);
        t.b = Point(c);
        t.width = w.width;
        t.layer = w.layer;
        t.net = w.net;
        b_.tracks.push_back(t);
      }
    for (auto& v : vias) b_.vias.push_back(Via{Point(v.pos), v.diameter, v.drill, b_.allCopperMask(), v.net, false});
    return {};
  }
  RealizeOptions ro;
  ro.mesh = &m_;
  auto st = realize(b_, wires, vias, ro);
  res_.vias = int(vias.size());
  res_.length = 0;
  for (size_t i = before; i < b_.tracks.size(); ++i) {
    const Track& t = b_.tracks[i];
    if (t.isArc()) res_.length += ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length();
    else res_.length += (t.b.v() - t.a.v()).len();
  }
  res_.log.push_back(std::format("realised {} wires ({} alive of {} total), {} arcs, {} narrowed crossings, {} overflowed edges, {} apexes dropped",
                                 st.wires, wires.size(), s_.wires.size(), st.arcs, st.narrowed, st.overflowEdges, st.droppedApexes));
  return st.trackWire;
}

std::vector<Router::Conflict> Router::checkRealized(size_t firstTrack, const std::vector<int>& trackWire) const {
  std::vector<Conflict> out;
  SpatialIndex idx;
  idx.build(b_);
  double maxClr = 0;
  maxClr = std::max(maxClr, double(b_.maxClearance()));
  std::set<std::pair<int, int>> seen;
  for (size_t ti = firstTrack; ti < b_.tracks.size(); ++ti) {
    const Track& t = b_.tracks[ti];
    int wa = trackWire[ti - firstTrack];
    ItemRef me{ItemType::Track, int(ti)};
    auto shapes = itemShapes(b_, me);
    BBox bb;
    for (auto& s : shapes) bb.add(s.bbox());
    idx.query(bb.inflated(maxClr), LayerMask(1) << t.layer, [&](ItemRef o) {
      if (o == me) return;
      int on = itemNet(b_, o);
      if (on == t.net || o.type == ItemType::Zone) return;
      int wb = -1;
      if (o.type == ItemType::Track) {
        if (o.index < int(firstTrack)) return;  // pre-existing (locked) copper is not ours to fix
        wb = trackWire[o.index - firstTrack];
        if (wb < wa) return;  // each wire pair once
      }
      double req = requiredClearance(b_, t.net, on, LayerMask(1) << t.layer);
      for (auto& s1 : shapes)
        for (auto& s2 : itemShapes(b_, o))
          if (s1.distance(s2) < req - 1) {
            if (seen.insert({wa, wb >= 0 ? wb : -1 - o.index}).second)
              out.push_back({(s1.center() + s2.center()) * 0.5, wa, wb});
            return;
          }
    });
  }
  return out;
}

int Router::penalizeAround(int wire, Vec2 pos, double radius) {
  const Wire& w = s_.wires[realizedWires_[wire]];
  int n = 0;
  for (int t : w.tris)
    for (int e : m_.tris[t].e) {
      Vec2 mid = (P(m_.edges[e].v[0]) + P(m_.edges[e].v[1])) * 0.5;
      if ((mid - pos).len() < radius) {
        hist_[w.li, e] += 2.0;
        ++n;
      }
    }
  return n;
}

RouterResult Router::run() {
  auto t0 = std::chrono::steady_clock::now();
  if (o_.ripupExisting) b_.clearRouting(true);
  int clearedZones = 0;
  for (auto& z : b_.zones)
    if (!z.filled.empty()) { z.filled.clear(); ++clearedZones; }
  if (clearedZones && !o_.fillZones)
    res_.log.push_back(std::format("{} zone fill(s) cleared (refill in the source CAD)", clearedZones));
  setup();
  res_.log.push_back(std::format("mesh: {} vertices, {} triangles, {} edges; {} layers; {} nets",
                                 m_.verts.size(), m_.tris.size(), m_.edges.size(), NL_, jobs_.size()));

  State best;
  int bestScore = std::numeric_limits<int>::max();
  std::vector<int> queue(jobs_.size());
  std::ranges::iota(queue, 0);
  int maxPasses = std::max(1, o_.maxPasses);
  bool soft = o_.softPlanarity && maxPasses > 2;
  // Soft passes first (everything routes, conflicts negotiated), then hard passes (planar, within
  // capacity) that rip up and repair what is left; the last pass also enforces capacity strictly.
  int softPasses = soft ? std::max(1, maxPasses * 3 / 5) : 0;
  for (int pass = 0; pass < maxPasses && !cancelled(); ++pass) {
    presFac_ = std::min(64.0, std::pow(2.0, pass < softPasses ? pass : pass - softPasses));
    hardCap_ = pass == maxPasses - 1 && maxPasses > 1;
    softPlanar_ = pass < softPasses;
    crossPenalty_ = 5 * kUnit * presFac_;  // a crossing costs like 5 mm of track, doubling each pass
    if (pass > 0) {
      std::vector<char> pick(jobs_.size(), 0);
      std::flat_map<int, int> jobOfNet;
      for (auto [j, job] : std::views::enumerate(jobs_)) jobOfNet[job.net] = int(j);
      // Nets whose chords cross: ripped up, and the triangles where it happened get history cost.
      std::vector<char> crossNets(b_.nets.size(), 0);
      if (countCrossings(&crossNets) > 0) {
        for (int li = 0; li < NL_; ++li)
          for (int t = 0; t < int(m_.tris.size()); ++t) {
            const auto& chs = s_.chords[li, t];
            bool crossed = false;
            for (size_t i = 0; i < chs.size() && !crossed; ++i)
              for (size_t k = i + 1; k < chs.size() && !crossed; ++k) {
                if (chs[i].net == chs[k].net) continue;
                double a = endCoord(li, t, chs[i].a), bq = endCoord(li, t, chs[i].b);
                double c = endCoord(li, t, chs[k].a), d = endCoord(li, t, chs[k].b);
                double lo = std::min(a, bq), hi = std::max(a, bq);
                crossed = (lo < c && c < hi) != (lo < d && d < hi);
              }
            if (crossed)
              for (int e : m_.tris[t].e) hist_[li, e] += kCrossHistory;
          }
        for (int n = 0; n < int(crossNets.size()); ++n)
          if (crossNets[n] && jobOfNet.contains(n)) pick[jobOfNet[n]] = 1;
      }
      for (int li = 0; li < NL_; ++li)
        for (int e = 0; e < int(m_.edges.size()); ++e) {
          if (!edgeOverflow(li, e)) continue;
          hist_[li, e] += 0.5;
          for (int cid : s_.cross[li, e]) pick[jobOfNet[s_.wires[s_.crossings[cid].wire].net]] = 1;
        }
      std::vector<int> failedJobs;
      for (int j = 0; j < int(jobs_.size()); ++j)
        if (!s_.failed[j].empty()) {
          failedJobs.push_back(j);
          for (int net : blockersOf(j)) pick[jobOfNet[net]] = 1;
        }
      queue = failedJobs;
      for (int j = 0; j < int(jobs_.size()); ++j)
        if (pick[j] && !std::ranges::contains(queue, j)) queue.push_back(j);
      if (queue.empty()) break;
      // A different order every pass: with a fixed order the same net encloses the same pins again.
      if (soft) {
        std::mt19937 rng(unsigned(pass) * 7919u);
        std::shuffle(queue.begin() + long(failedJobs.size()), queue.end(), rng);
      }
    }
    for (int j : queue) ripup(j);
    int done = 0;
    for (int j : queue) {
      if (cancelled()) break;
      routeJob(j);
      if (o_.progress) o_.progress(++done, int(queue.size()), std::format("pass {}", pass + 1));
    }
    int fails = 0;
    for (auto& f : s_.failed) fails += int(f.size());
    int over = countOverflow();
    int crossings = soft ? countCrossings(nullptr) : 0;
    int score = fails + over + crossings;
    res_.log.push_back(std::format("pass {}: rerouted {} nets, {} failed connections, {} overflowed edges, {} crossings",
                                   pass + 1, queue.size(), fails, over, crossings));
    if (score < bestScore) {
      bestScore = score;
      best = s_;
    }
    if (score == 0) break;
  }
  if (bestScore != std::numeric_limits<int>::max()) s_ = std::move(best);
  softPlanar_ = false;
  crossPenalty_ = 0;
  for (auto [v, vn] : std::views::enumerate(s_.viaNet))
    if (m_.verts[v].kind == VKind::ViaSite)
      vshape_[v] = Shape::circle(P(int(v)), vn >= 0 ? b_.classOf(vn).viaDiameter / 2.0 : 0.0);
  res_.cancelled = cancelled();

  // Geometric feedback: conflicts the edge-capacity model missed are penalised around the spot and
  // the nets involved are rerouted; the best realisation is kept.
  size_t tracks0 = b_.tracks.size(), vias0 = b_.vias.size();
  std::vector<int> trackWire = realizeAll();
  std::flat_map<int, int> jobOfNet;
  for (auto [j, job] : std::views::enumerate(jobs_)) jobOfNet[job.net] = int(j);
  struct Snapshot {
    State s;
    std::vector<Track> tracks;
    std::vector<Via> vias;
    size_t conflicts;
  };
  std::optional<Snapshot> bestGeom;
  presFac_ = 8;
  hardCap_ = false;
  // An unconnected pad weighs as two conflicts: rerouting must not trade connections for clearance.
  auto failedNow = [&] {
    size_t n = 0;
    for (auto& f : s_.failed) n += f.size();
    return n;
  };
  for (int round = 0; round <= o_.maxPasses && !std::getenv("XR_SKETCH") && !std::getenv("XR_NOFEEDBACK"); ++round) {
    auto conflicts = checkRealized(tracks0, trackWire);
    size_t score = conflicts.size() + 2 * failedNow();
    res_.log.push_back(std::format("geometry round {}: {} conflict(s), {} failed", round, conflicts.size(), failedNow()));
    if (!bestGeom || score < bestGeom->conflicts)
      bestGeom = Snapshot{s_, {b_.tracks.begin() + tracks0, b_.tracks.end()}, {b_.vias.begin() + vias0, b_.vias.end()},
                          score};
    if (conflicts.empty() || round == o_.maxPasses || cancelled()) break;
    std::flat_set<int> reroute;
    for (auto& c : conflicts) {
      for (int w : {c.wireA, c.wireB}) {
        if (w < 0) continue;
        penalizeAround(w, c.pos, 2.5 * kNmPerMm);
        reroute.insert(jobOfNet[s_.wires[realizedWires_[w]].net]);
      }
    }
    // Reroute the net with fewer pads first so it is the one that moves.
    std::vector<int> queue(reroute.begin(), reroute.end());
    std::ranges::sort(queue, {}, [&](int j) { return jobs_[j].pads.size(); });
    for (int j : queue) ripup(j);
    for (int j : queue) routeJob(j);
    b_.tracks.resize(tracks0);
    b_.vias.resize(vias0);
    trackWire = realizeAll();
  }
  if (bestGeom) {
    s_ = std::move(bestGeom->s);
    b_.tracks.resize(tracks0);
    b_.vias.resize(vias0);
    b_.tracks.insert(b_.tracks.end(), bestGeom->tracks.begin(), bestGeom->tracks.end());
    b_.vias.insert(b_.vias.end(), bestGeom->vias.begin(), bestGeom->vias.end());
    res_.vias = int(bestGeom->vias.size());
  }
  if (o_.optimizeIterations > 0 && !cancelled() && !std::getenv("XR_SKETCH")) {
    OptimizeOptions oo;
    oo.iterations = o_.optimizeIterations;
    oo.cancel = o_.cancel;
    oo.progress = o_.progress;
    auto r = optimize(b_, oo);
    res_.vias = int(b_.vias.size());
    res_.length = r.lengthAfter;
    res_.log.push_back(std::format("optimised: {} via move(s), conflicts {} -> {}, length {:.1f} -> {:.1f} mm",
                                   r.viaMoves, r.conflictsBefore, r.conflictsAfter, r.lengthBefore / 1e6,
                                   r.lengthAfter / 1e6));
  }
  if (o_.refine && !cancelled() && !std::getenv("XR_SKETCH")) {
    // The grid refinement: every wire still in violation looks for a path around the copper as it
    // lies now, over the whole board if need be.
    RefineOptions ro;
    ro.cancel = o_.cancel;
    ro.progress = o_.progress;
    auto r = refine(b_, ro);
    res_.vias = int(b_.vias.size());
    res_.length = r.lengthAfter;
    res_.log.push_back(std::format("refined: {} wire(s) re-laid, {} repaired, {} moved to another layer, {} via(s) removed",
                                   r.improved, r.repaired, r.layerChanges, r.viasRemoved));
  }
  if (o_.fillZones && !b_.zones.empty() && !std::getenv("XR_SKETCH")) {
    auto zs = xr::fillZones(b_);
    res_.log.push_back(std::format("poured {} zone(s): {} polygon(s)", zs.zones, zs.polygons));
  }
  int fails = 0;
  for (auto [j, f] : std::views::enumerate(s_.failed)) {
    fails += int(f.size());
    for (auto [pa, pb] : f)
      res_.log.push_back(std::format("failed: {} {}-{} -> {}-{}", b_.nets[jobs_[j].net].name,
                                     b_.components[b_.pads[pa].component].ref, b_.pads[pa].number,
                                     b_.components[b_.pads[pb].component].ref, b_.pads[pb].number));
  }
  res_.failed = fails;
  res_.routed = res_.connections - fails;
  res_.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  return res_;
}

}  // namespace

RouterResult routeBoard(Board& b, const RouterOptions& opt) {
  Router r(b, opt);
  return r.run();
}

}  // namespace xr::topo
