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
#include <set>
#include <ranges>
#include <unordered_map>

#include "drc/Drc.h"
#include "router/topo/Realizer.h"
#include "router/topo/TopoMesh.h"

namespace xr::topo {

namespace {

constexpr double kUnit = 1e6;  // congestion cost unit: 1 mm of track
constexpr size_t kMaxExpansions = 400'000;

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
};

struct Wire {
  int net = kNoNet;
  int li = 0;
  int v0 = -1, v1 = -1;
  std::vector<int> cids;
  std::vector<int> tris;
  Coord width = 0, clr = 0;
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
  RouterResult res_;

  // Current search context.
  int net_ = kNoNet;
  double width_ = 0, clr_ = 0, viaR_ = 0, viaClr_ = 0;
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
  double crossCost(int e, int li, bool& blocked) const;
  double viaPenalty(int w, bool& blocked) const;

  double crossCoord(int li, int t, int le, int cid) const;
  double gapCoord(int li, int t, int le, int g) const;
  double endCoord(int li, int t, const End& e) const {
    return e.vertex ? double(e.local) : crossCoord(li, t, e.local, e.cid);
  }
  bool chordOk(int li, int t, double s, double e) const;
  std::optional<int> exitGap(int li, int t, int le, double s) const;
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
  int insertCrossing(int li, int e, int gap, int wire);
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
      return ObstInfo{&padShape_[mv.pad], double(b_.classOf(p.net).clearance), mv.pad};
    }
    case VKind::ViaSite: {
      int vn = s_.viaNet[v];
      if (vn < 0 || vn == net) return std::nullopt;
      return ObstInfo{&vshape_[v], double(b_.classOf(vn).clearance), -2 - v};
    }
    case VKind::FixedVia: {
      const Via& bv = b_.vias[mv.fixedVia];
      if ((net != kNoNet && bv.net == net) || !bv.onLayer(layers_[li])) return std::nullopt;
      return ObstInfo{&vshape_[v], double(b_.classOf(bv.net).clearance), -2 - v};
    }
    case VKind::Outline: return ObstInfo{&vshape_[v], double(b_.edgeClearance), -1};
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

double Router::crossCost(int e, int li, bool& blocked) const {
  // Edges between two vertices of the wire's own pad lie inside its copper: never a constraint.
  int pu = m_.verts[m_.edges[e].v[0]].pad, pv = m_.verts[m_.edges[e].v[1]].pad;
  if (pu >= 0 && pu == pv && b_.pads[pu].net == net_ && b_.pads[pu].onLayer(layers_[li])) return 0;
  double cu, cv;
  bool ou, ov;
  double free = freeLength(e, li, net_, cu, ou, cv, ov);
  const EdgeUse& u = s_.use[li, e];
  double cc = std::max(u.maxC, clr_);
  double ends = (ou ? std::max(cu, clr_) : 0) + (ov ? std::max(cv, clr_) : 0);
  if (!relaxed_ && width_ + ends > free + 1) {
    blocked = true;
    return 0;
  }
  double need = u.sumW + width_ + u.n * cc + ends + (u.n + 1) * kRealizeMargin;
  double over = need - free;
  double cost = hist_[li, e] * kUnit;
  if (over > 1 && !relaxed_) {
    if (hardCap_) {
      blocked = true;
      return 0;
    }
    cost += presFac_ * kUnit * (1 + over / (width_ + clr_));
  }
  return cost;
}

double Router::viaPenalty(int w, bool& blocked) const {
  double cost = 0;
  for (int li = 0; li < NL_; ++li)
    for (int e : vertEdges_[w]) {
      const EdgeUse& u = s_.use[li, e];
      if (u.n == 0) continue;
      int other = m_.edges[e].v[0] == w ? m_.edges[e].v[1] : m_.edges[e].v[0];
      auto o = obst(other, li, kNoNet);
      Shape via = Shape::circle(P(w), viaR_);
      double free = o ? o->shape->distance(via) : via.distance(P(other));
      double need = u.sumW + (u.n - 1) * u.maxC + std::max(viaClr_, u.maxC) + (o ? std::max(o->clr, u.maxC) : 0) +
                    u.n * kRealizeMargin;
      // Wires already crossing the edges at the site cannot be pushed aside by a via: hard block.
      if (need - free > 1) {
        blocked = true;
        return 0;
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

bool Router::chordOk(int li, int t, double s, double e) const {
  if (relaxed_) return true;
  double lo = std::min(s, e), hi = std::max(s, e);
  for (const Chord& ch : s_.chords[li, t]) {
    if (ch.net == net_) continue;
    double a = endCoord(li, t, ch.a), c = endCoord(li, t, ch.b);
    if (a == s || a == e || c == s || c == e) return false;
    bool ia = lo < a && a < hi, ic = lo < c && c < hi;
    if (ia != ic) return false;
  }
  return true;
}

std::optional<int> Router::exitGap(int li, int t, int le, double s) const {
  int m = int(s_.cross[li, m_.tris[t].e[le]].size());
  for (int g = 0; g <= m; ++g)
    if (chordOk(li, t, s, gapCoord(li, t, le, g))) return g;
  return std::nullopt;
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

  auto tryEdge = [&](int from, int t, double s, int le2) {
    const SNode& n = nodes[from];
    int e = m_.tris[t].e[le2];
    int t2 = m_.tris[t].nb[le2];
    if (t2 < 0) return;
    bool blocked = false;
    double cc = crossCost(e, n.li, blocked);
    if (blocked) return;
    auto g = relaxed_ ? std::optional<int>(0) : exitGap(n.li, t, le2, s);
    if (!g) return;
    int m = int(s_.cross[n.li, e].size());
    SNode c;
    c.li = n.li;
    c.tri = t2;
    c.le = m_.localEdge(t2, e);
    c.gap = *g;
    c.chordTri = t;
    c.pt = intervalPoint(e, (*g + 1.0) / (m + 2.0));
    c.g = n.g + (c.pt - n.pt).len() + cc;
    c.parent = from;
    push(c, keyEdge(c.li, t2, c.le, c.gap));
  };

  auto tryVertex = [&](int from, int t, double s, int lv) {
    const SNode& n = nodes[from];
    int w = m_.tris[t].v[lv];
    if (n.atVertex && w == n.vtx) return;
    if (!chordOk(n.li, t, s, double(lv))) return;
    SNode c;
    c.li = n.li;
    c.atVertex = true;
    c.vtx = w;
    c.chordTri = t;
    c.pt = P(w);
    c.g = n.g + (c.pt - n.pt).len();
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
      double pen = viaPenalty(w, blocked);
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
  return std::nullopt;
}

int Router::insertCrossing(int li, int e, int gap, int wire) {
  int cid = int(s_.crossings.size());
  s_.crossings.push_back({wire, e});
  auto& list = s_.cross[li, e];
  gap = std::clamp(gap, 0, int(list.size()));
  list.insert(list.begin() + gap, cid);
  EdgeUse& u = s_.use[li, e];
  const Wire& w = s_.wires[wire];
  u.sumW += double(w.width);
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
    w.width = Coord(width_);
    w.clr = Coord(clr_);
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
      int cid = insertCrossing(n.li, e, n.gap, wire);
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
    u.sumW -= double(w.width);
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
      for (int v : m_.padVerts[pad]) {
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
            std::println(stderr, "   tri {} edge {} ({}-{}) free {:.3f} ends {}/{} blocked {} cost {:.2f} nb {}", t, e,
                         m_.edges[e].v[0], m_.edges[e].v[1], free / 1e6, ou, ov, blocked, cost / 1e6, m_.tris[t].nb[i]);
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
    rw.clearance = w.clr;
    rw.sketch.push_back(P(w.v0));
    for (int cid : w.cids) {
      int e = s_.crossings[cid].edge;
      const auto& list = s_.cross[w.li, e];
      auto pos = std::ranges::find(list, cid) - list.begin();
      rw.sketch.push_back(intervalPoint(e, (double(pos) + 1) / (double(list.size()) + 1)));
    }
    rw.sketch.push_back(P(w.v1));
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
  auto st = realize(b_, wires, vias);
  res_.vias = int(vias.size());
  res_.length = 0;
  for (size_t i = before; i < b_.tracks.size(); ++i) {
    const Track& t = b_.tracks[i];
    if (t.isArc()) res_.length += ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length();
    else res_.length += (t.b.v() - t.a.v()).len();
  }
  res_.log.push_back(std::format("realised {} wires, {} arcs, {} apexes dropped", st.wires, st.arcs, st.droppedApexes));
  return st.trackWire;
}

std::vector<Router::Conflict> Router::checkRealized(size_t firstTrack, const std::vector<int>& trackWire) const {
  std::vector<Conflict> out;
  SpatialIndex idx;
  idx.build(b_);
  double maxClr = 0;
  for (auto& nc : b_.netClasses) maxClr = std::max(maxClr, double(nc.clearance));
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
      double req = requiredClearance(b_, t.net, on);
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
  if (clearedZones) res_.log.push_back(std::format("{} zone fill(s) cleared (refill in the source CAD)", clearedZones));
  setup();
  res_.log.push_back(std::format("mesh: {} vertices, {} triangles, {} edges; {} layers; {} nets",
                                 m_.verts.size(), m_.tris.size(), m_.edges.size(), NL_, jobs_.size()));

  State best;
  int bestScore = std::numeric_limits<int>::max();
  std::vector<int> queue(jobs_.size());
  std::ranges::iota(queue, 0);
  int maxPasses = std::max(1, o_.maxPasses);
  for (int pass = 0; pass < maxPasses && !cancelled(); ++pass) {
    presFac_ = std::min(64.0, std::pow(2.0, pass));
    hardCap_ = pass == maxPasses - 1 && maxPasses > 1;
    if (pass > 0) {
      std::vector<char> pick(jobs_.size(), 0);
      std::flat_map<int, int> jobOfNet;
      for (auto [j, job] : std::views::enumerate(jobs_)) jobOfNet[job.net] = int(j);
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
    int score = fails + over;
    res_.log.push_back(std::format("pass {}: rerouted {} nets, {} failed connections, {} overflowed edges",
                                   pass + 1, queue.size(), fails, over));
    if (score < bestScore) {
      bestScore = score;
      best = s_;
    }
    if (score == 0) break;
  }
  if (bestScore != std::numeric_limits<int>::max()) s_ = std::move(best);
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
  for (int round = 0; round <= o_.maxPasses && !std::getenv("XR_SKETCH"); ++round) {
    auto conflicts = checkRealized(tracks0, trackWire);
    res_.log.push_back(std::format("geometry round {}: {} conflict(s)", round, conflicts.size()));
    if (!bestGeom || conflicts.size() < bestGeom->conflicts)
      bestGeom = Snapshot{s_, {b_.tracks.begin() + tracks0, b_.tracks.end()}, {b_.vias.begin() + vias0, b_.vias.end()},
                          conflicts.size()};
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
