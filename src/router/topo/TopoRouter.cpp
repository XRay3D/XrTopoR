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

#include "core/Connectivity.h"
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
static const bool kTriVia = std::getenv("XR_TRIVIA") != nullptr;  // vias on demand inside triangles (experiment)
constexpr double kOffLayer = 10 * kUnit;      // each edge crossed on a layer the net is not assigned to
constexpr double kNarrowCost = 0.5 * kUnit;  // a crossing at the minimum width («подрезка»)

// rows x cols table indexed as grid[r, c]; the columns grow with the mesh (vias split triangles).
template <class T>
class Grid {
 public:
  Grid() = default;
  Grid(size_t rows, size_t cols) : rows_(rows, std::vector<T>(cols)) {}
  T& operator[](size_t r, size_t c) { return rows_[r][c]; }
  const T& operator[](size_t r, size_t c) const { return rows_[r][c]; }
  size_t rows() const { return rows_.size(); }
  size_t cols() const { return rows_.empty() ? 0 : rows_[0].size(); }
  void grow(size_t cols) {
    for (auto& r : rows_)
      if (r.size() < cols) r.resize(cols);
  }

 private:
  std::vector<std::vector<T>> rows_;
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
  double f = -1;     // position along the edge where known by geometry (edges made by a via); else ordinal
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
  int edge = -1;                   // that edge's global id (a split may renumber the triangle's edges)
  int before = -1, after = -1;     // the crossings on either side of the gap: the gap index itself moves
                                   // when the path crosses the edge again earlier in the commit
  int vtx = -1;                    // vertex nodes
  int chordTri = -1;               // triangle holding the chord leading here (-1: start / layer change)
  bool via = false;                // layer change through a new via at vtx (or in viaTri)
  bool narrow = false;             // edge entry at the minimum width
  bool transit = false;            // via arrival on the old layer (not expanded)
  int viaTri = -1;                 // a new via placed inside this triangle (at pt), on demand
  bool goal = false;
  Vec2 pt;                         // where the path is: the crossing's fixed place, a vertex, a via spot
  Vec2 cpt;                        // the same for the length cost: crossings spread evenly over the edge, as the realiser lays them
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
  // Narrow-ended SMD pads (the end narrower than width + 2 clearances): wires leave them straight
  // through the end on a stub (see the realiser), so the stub's room in front of each end is part of
  // the pad for everyone else. Outward end normals and the stub's reach beyond the copper.
  struct PadExit {
    std::inplace_vector<Vec2, 2> normals;
    double reach = 0;
  };
  std::vector<PadExit> padExit_;
  std::vector<char> cornerOk_;  // pad corners may carry a track end (corner radius >= width / 2)
  std::vector<std::pair<Vec2, Vec2>> interval_;  // free part of each edge (canonical direction)
  std::vector<std::vector<int>> vertEdges_;
  Grid<double> hist_;
  State s_;
  std::vector<NetJob> jobs_;
  std::vector<int> padCluster_;  // pads joined by the wires kept on the board (Connectivity clusters)
  double presFac_ = 1;
  bool hardCap_ = false;
  // Soft planarity (PathFinder for topology): crossing another net's chord is allowed at a cost in
  // early passes; the nets involved are ripped up and rerouted until the crossings disappear.
  bool softPlanar_ = false;
  double crossPenalty_ = 0;
  RouterResult res_;

  // The mesh grows as vias split triangles: every per-vertex/edge/triangle table follows, and a
  // snapshot of the routing state carries the mesh of its time.
  struct Full {
    State s;
    TopoMesh m;
    std::vector<Shape> vshape;
    std::vector<std::pair<Vec2, Vec2>> interval;
    std::vector<std::vector<int>> vertEdges;
    Grid<double> hist;
  };
  Full snapshot() const { return {s_, m_, vshape_, interval_, vertEdges_, hist_}; }
  void restore(Full f) {
    s_ = std::move(f.s);
    m_ = std::move(f.m);
    vshape_ = std::move(f.vshape);
    interval_ = std::move(f.interval);
    vertEdges_ = std::move(f.vertEdges);
    hist_ = std::move(f.hist);
    treeStamp_.resize(m_.verts.size(), 0);
  }
  void meshGrew();
  void computeInterval(int e);
  // A via placed on demand inside triangle t for the current net: where it fits (nullopt: nowhere).
  std::optional<Vec2> viaSpot(int t, double* penalty) const;
  mutable std::array<size_t, 7> viaStats_{};  // calls, blocked tri, vertex obstacles, copper, neighbour vias, keepout, chords
  // Other-net chords of t (layer li) the straight chord P-Q crosses; -1 if it shares an end vertex.
  int hitsGeom(int li, int t, Vec2 P, Vec2 Q, int qVertex = -1) const;
  Vec2 endPoint(int li, int t, const End& e) const;
  Vec2 crossingPoint(int li, int edge, int cid) const;  // geometric where the crossing was laid so, else ordinal
  // Splits t at p for a new via of the current net; existing chords are re-laid through the three
  // new triangles. Returns the vertex.
  int placeVia(int t, Vec2 p);
  void unsplitIfClean(int v);
  // Lays the chord P-Q of `wire` through triangle t, which may have been split in this commit.
  void addChordWalk(int li, int wire, int t, const End& a, Vec2 P, const End& c, Vec2 Q, int* cidAfter,
                    std::vector<int>* partsOut = nullptr);
  bool checkState(const char* where) const;  // XR_CHECK: wires' triangles match their crossings
  std::flat_map<int, std::inplace_vector<int, 3>> splits_;  // old triangle -> its three parts (this commit)

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
  // Positions along an edge are fractions of the whole edge (v0 -> v1); the free interval's ends
  // in those terms.
  std::pair<double, double> freeRange(int e) const {
    Vec2 o = P(m_.edges[e].v[0]), w = P(m_.edges[e].v[1]);
    double len2 = (w - o).len2();
    if (len2 <= 0) return {0.5, 0.5};
    auto [a, c] = interval_[e];
    return {(a - o).dot(w - o) / len2, (c - o).dot(w - o) / len2};
  }
  Vec2 edgePoint(int e, double f) const { return P(m_.edges[e].v[0]) + (P(m_.edges[e].v[1]) - P(m_.edges[e].v[0])) * f; }
  // Where a crossing put into gap g of an edge's list would lie: midway between its neighbours.
  double gapFraction(int li, int e, int g) const {
    const auto& list = s_.cross[li, e];
    auto [fa, fc] = freeRange(e);
    double lo = g > 0 ? s_.crossings[list[size_t(g - 1)]].f : fa;
    double hi = g < int(list.size()) ? s_.crossings[list[size_t(g)]].f : fc;
    return (lo + hi) / 2;
  }

  bool inTree(int v) const { return treeStamp_[v] == stamp_; }
  bool isTarget(int v, int li) const;
  bool isJunction(int v, int li) const;
  bool isViaSite(int v) const;
  // The radius a free site stands for (reserved fanout sites counted as their via from the start was
  // tried: too pessimistic, the sites of neighbouring fine-pitch pads exclude each other anyway).
  double siteRadius(int) const { return 0.0; }
  void addPadToTree(int pad);
  void addVertexToTree(int v);
  double heuristic(Vec2 p) const;

  std::optional<std::vector<SNode>> search(int pad);
  void commit(const std::vector<SNode>& path, std::vector<int>& joinedPads);
  int insertCrossing(int li, int e, int gap, int wire, bool narrow, double f = -1);
  SpatialIndex copperIdx_;  // pads, fixed vias and kept wires, for placing vias
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
  // Via candidates are pre-seeded in the mesh (a staggered grid of sites). XR_TRIVIA instead places
  // vias on demand inside triangles, splitting them: topologically sound, but the realiser lays the
  // wires worse on the sparser mesh (MinVia 205 vs 5 violations), so it stays an experiment.
  mo.viaSites = o_.useVias && NL_ > 1 && !kTriVia;
  m_.build(b_, mo);

  padShape_.resize(b_.pads.size());
  cornerOk_.resize(b_.pads.size());
  for (auto [i, p] : std::views::enumerate(b_.pads)) {
    padShape_[i] = (!p.copper && p.drill > 0) ? Shape::circle(p.pos.v(), p.drill / 2.0) : p.shapeGeom();
    // TopoR rule: tracks attach to the pad anchor; corners only when they are rounded enough for the
    // narrowest wire the net may use (fine-pitch pads are left from their ends, narrowed).
    Coord narrowest = b_.classOf(p.net).trackWidth;
    for (LayerId l : b_.copperLayers()) narrowest = std::min(narrowest, b_.minTrackWidth(p.net, l));
    cornerOk_[i] = padShape_[i].r >= narrowest / 2.0;
  }
  padExit_.assign(b_.pads.size(), {});
  for (auto [i, p] : std::views::enumerate(b_.pads)) {
    if (p.drill > 0 || p.net == kNoNet) continue;
    const Shape& s = padShape_[i];
    const NetClass& nc = b_.classOf(p.net);
    double envelope = double(nc.trackWidth) + 2.0 * double(nc.clearance);
    PadExit& ex = padExit_[i];
    ex.reach = double(nc.clearance) + double(nc.trackWidth) / 2.0 + kRealizeMargin;
    if (s.kind == Shape::Kind::Segment && (s.b - s.a).len2() > 1 && 2 * s.r < envelope) {
      Vec2 d = (s.b - s.a).normalized();
      ex.normals.push_back(d * -1.0);
      ex.normals.push_back(d);
    } else if (s.kind == Shape::Kind::Polygon && s.poly.size() == 4) {
      double l0 = (s.poly[1] - s.poly[0]).len(), l1 = (s.poly[2] - s.poly[1]).len();
      double shortSide = std::min(l0, l1) + 2 * s.r;
      if (std::abs(l0 - l1) >= 1000 && shortSide < envelope) {
        int k0 = l0 < l1 ? 0 : 1;
        for (int k : {k0, k0 + 2}) {
          Vec2 a = s.poly[size_t(k)], c = s.poly[size_t((k + 1) % 4)];
          Vec2 n = (c - a).perp().normalized();
          if (n.dot((a + c) * 0.5 - s.center()) < 0) n = n * -1.0;
          ex.normals.push_back(n);
        }
      }
    }
  }
  vshape_.resize(m_.verts.size());
  for (auto [i, v] : std::views::enumerate(m_.verts)) {
    if (v.kind == VKind::FixedVia) vshape_[i] = Shape::circle(v.p, b_.vias[v.fixedVia].diameter / 2.0);
    else if (v.kind == VKind::Track) vshape_[i] = Shape::circle(v.p, b_.tracks[v.track].width / 2.0);
    else vshape_[i] = Shape::circle(v.p, siteRadius(int(i)));
  }

  // Free interval of every edge: the part not covered by pad copper.
  interval_.resize(m_.edges.size());
  vertEdges_.assign(m_.verts.size(), {});
  for (auto [e, me] : std::views::enumerate(m_.edges)) {
    computeInterval(int(e));
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
  padCluster_ = Connectivity::compute(b_).padCluster;
  copperIdx_.build(b_);
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
    case VKind::Track: {
      const Track& t = b_.tracks[mv.track];
      if (t.layer != layers_[li] || (net != kNoNet && t.net == net)) return std::nullopt;
      return ObstInfo{&vshape_[v], double(b_.clearance(t.net, layers_[li])), -2 - v};
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
  const MVertex& vu = m_.verts[m_.edges[e].v[0]];
  const MVertex& vv = m_.verts[m_.edges[e].v[1]];
  int pu = vu.pad, pv = vv.pad;
  if (pu >= 0 && pu == pv && b_.pads[pu].net == net_ && b_.pads[pu].onLayer(layers_[li])) return 0;
  // Between a pad and its fanout site only the pad's own net passes (the stub to the via lies there).
  if ((vu.sitePad >= 0 && vu.sitePad == pv) || (vv.sitePad >= 0 && vv.sitePad == pu)) {
    if ((vu.sitePad >= 0 ? vu.onlyNet : vv.onlyNet) == net_) return 0;
    blocked = true;
    return 0;
  }
  if ((m_.edges[e].blocked >> layers_[li]) & 1) {  // a keepout boundary or a kept wire
    if (m_.edges[e].net != kNoNet && m_.edges[e].net == net_) return 0;  // crossing its own wire: a junction
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
  // The via itself must keep its clearance from the vias and pads at the other ends of its edges
  // (fanout sites of neighbouring pads lie closer than a via pitch).
  {
    Shape via = Shape::circle(P(w), viaR_);
    for (int e : vertEdges_[w]) {
      int other = m_.edges[e].v[0] == w ? m_.edges[e].v[1] : m_.edges[e].v[0];
      const MVertex& mo = m_.verts[other];
      if (mo.kind != VKind::ViaSite && mo.kind != VKind::FixedVia) continue;
      auto o = obst(other, 0, net_);
      if (o && o->shape->distance(via) < std::max(viaClr_, o->clr)) {
        blocked = true;
        return 0;
      }
    }
  }
  for (int li = 0; li < NL_; ++li)
    for (int e : vertEdges_[w]) {
      // Wires of other nets crossing the edge: the net's own need no clearance from its via.
      EdgeUse u;
      for (int cid : s_.cross[li, e]) {
        const Crossing& c = s_.crossings[cid];
        if (s_.wires[c.wire].net == net_) continue;
        u.sumW += c.width;
        u.n += 1;
        u.maxC = std::max(u.maxC, double(s_.wires[c.wire].clr));
      }
      if (u.n == 0) continue;
      int other = m_.edges[e].v[0] == w ? m_.edges[e].v[1] : m_.edges[e].v[0];
      auto o = obst(other, li, kNoNet);
      Shape via = Shape::circle(P(w), viaR_);
      Shape otherVia = Shape::circle(P(other), viaR_);
      bool pathVia = std::ranges::contains(pathVias, other) && !std::getenv("XR_NOPATHVIAS");
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

void Router::computeInterval(int e) {
  const MEdge& me = m_.edges[e];
  Vec2 a = P(me.v[0]), c = P(me.v[1]);
  double len = (c - a).len();
  Vec2 d = len > 0 ? (c - a) / len : Vec2{};
  auto exitOf = [&](int v, Vec2 from, Vec2 dir) {
    int pad = m_.verts[v].pad;
    if (pad < 0) return 0.0;
    double x = padShape_[pad].rayExit(from, dir);
    // The stub in front of a narrow end reaches further along edges that leave the end forward
    // (XR_STUBREACH, experiment: consistent with the realiser's stubs, but it costs the QFP escape
    // capacity on Arcs, 86 → 185 violations).
    static const bool kStubReach = std::getenv("XR_STUBREACH") != nullptr;
    if (!kStubReach) return x;
    for (Vec2 n : padExit_[pad].normals)
      if (double dot = dir.dot(n); dot > 0) x = std::max(x, padShape_[pad].rayExit(from, dir) + padExit_[pad].reach * dot);
    return x;
  };
  double ea = exitOf(me.v[0], a, d), ec = exitOf(me.v[1], c, -d);
  if (ea + ec >= len) {
    double f = (ea + ec) > 0 ? ea / (ea + ec) : 0.5;
    interval_[e] = {a + (c - a) * f, a + (c - a) * f};
  } else {
    interval_[e] = {a + d * ea, c - d * ec};
  }
}

void Router::meshGrew() {
  size_t nv = m_.verts.size(), ne = m_.edges.size(), nt = m_.tris.size();
  for (size_t v = vshape_.size(); v < nv; ++v) vshape_.push_back(Shape::circle(P(int(v)), 0));
  vertEdges_.resize(nv);
  size_t e0 = interval_.size();
  interval_.resize(ne);
  for (size_t e = e0; e < ne; ++e) {
    computeInterval(int(e));
    vertEdges_[m_.edges[e].v[0]].push_back(int(e));
    vertEdges_[m_.edges[e].v[1]].push_back(int(e));
  }
  s_.viaNet.resize(nv, -1);
  treeStamp_.resize(nv, 0);
  hist_.grow(ne);
  s_.cross.grow(ne);
  s_.use.grow(ne);
  s_.chords.grow(nt);
}

Vec2 Router::endPoint(int li, int t, const End& e) const {
  if (e.vertex) return P(m_.tris[t].v[e.local]);
  return crossingPoint(li, m_.tris[t].e[e.local], e.cid);
}

Vec2 Router::crossingPoint(int, int edge, int cid) const { return edgePoint(edge, s_.crossings[cid].f); }

int Router::hitsGeom(int li, int t, Vec2 P0, Vec2 Q, int qVertex) const {
  int n = 0;
  for (const Chord& ch : s_.chords[li, t]) {
    if (ch.net == net_) continue;
    if (qVertex >= 0 && ((ch.a.vertex && ch.a.local == qVertex) || (ch.b.vertex && ch.b.local == qVertex))) return -1;
    Vec2 a = endPoint(li, t, ch.a), c = endPoint(li, t, ch.b);
    double o1 = orient(P0, Q, a), o2 = orient(P0, Q, c), o3 = orient(a, c, P0), o4 = orient(a, c, Q);
    // Proper crossings, and an end of P-Q lying on the chord (a chord along an edge, met by one that
    // starts on that edge): topologically a crossing as well.
    auto on = [&](Vec2 x) {
      double len2 = (c - a).len2();
      double tt = len2 > 0 ? (x - a).dot(c - a) / len2 : 0;
      return tt > 1e-6 && tt < 1 - 1e-6;
    };
    bool crosses = (o1 * o2 < 0 && o3 * o4 < 0) || (std::abs(o3) < 1e-6 * (c - a).len2() && on(P0)) ||
                   (std::abs(o4) < 1e-6 * (c - a).len2() && on(Q));
    if (crosses) {
      if (!softPlanar_) return 1;
      ++n;
    }
  }
  return n;
}

std::optional<Vec2> Router::viaSpot(int t, double* penalty) const {
  const MTri& T = m_.tris[t];
  ++viaStats_[0];
  if (!T.inside || T.blocked) { ++viaStats_[1]; return std::nullopt; }
  Vec2 A = P(T.v[0]), B = P(T.v[1]), C = P(T.v[2]);
  double la = (C - B).len(), lb = (A - C).len(), lc = (B - A).len();
  double per = la + lb + lc;
  if (per <= 0) return std::nullopt;
  double maxClr = double(b_.maxClearance());
  // The incentre, pushed off the vertex obstacle that lacks room, until the via fits or it leaves.
  Vec2 p = (A * la + B * lb + C * lc) / per;
  struct VO {
    const Shape* shape;
    double clr;
  };
  std::inplace_vector<VO, 3> vo;
  for (int i = 0; i < 3; ++i) {
    std::optional<ObstInfo> o;
    for (int li = 0; li < NL_ && !o; ++li) o = obst(T.v[i], li, kNoNet);
    vo.push_back(o ? VO{o->shape, std::max(o->clr, viaClr_)} : VO{nullptr, 0});
  }
  for (int iter = 0; iter < 6; ++iter) {
    int worst = -1;
    double wm = 0;
    for (int i = 0; i < 3; ++i) {
      if (!vo[i].shape) continue;
      double m = vo[i].shape->distance(p) - vo[i].clr - viaR_;
      if (m < wm) { wm = m; worst = i; }
    }
    if (worst < 0) break;
    Vec2 away = (p - P(T.v[worst])).normalized();
    if (away.len2() == 0) { ++viaStats_[2]; return std::nullopt; }
    p += away * (-wm + 1000);
    if (!m_.strictlyInside(t, p)) { ++viaStats_[2]; return std::nullopt; }
  }
  // Copper that is no vertex of t: pads, fixed vias and kept wires by the index, routed vias of the
  // neighbouring triangles by their vertices.
  {
    bool ok = true;
    BBox q;
    q.add(p);
    LayerMask cu = b_.allCopperMask();
    copperIdx_.query(q.inflated(viaR_ + maxClr + 2 * kNmPerMm), cu, [&](ItemRef r) {
      if (!ok || r.type == ItemType::Zone) return;
      int on = itemNet(b_, r);
      if (on == net_ && net_ != kNoNet) return;
      double clr = std::max(viaClr_, requiredClearance(b_, net_, on, cu));
      for (auto& s : itemShapes(b_, r))
        if (s.distance(p) < viaR_ + clr) ok = false;
    });
    if (!ok) { ++viaStats_[3]; return std::nullopt; }
    for (int nb : T.nb)
      if (nb >= 0)
        for (int u : m_.tris[nb].v)
          if (m_.verts[u].kind == VKind::ViaSite && s_.viaNet[u] >= 0 && s_.viaNet[u] != net_ &&
              (P(u) - p).len() < 2 * viaR_ + std::max(viaClr_, double(b_.clearance(s_.viaNet[u], layers_[0])))) {
            ++viaStats_[4];
            return std::nullopt;
          }
  }
  for (const Keepout& k : b_.keepouts)
    if (k.role == Keepout::Role::Route && k.vias)
      for (const Shape& s : k.shapes())
        if (s.distance(p) < viaR_) { ++viaStats_[5]; return std::nullopt; }
  // The chords of t keep their clearance from the via: those passing between the via and vertex V
  // will cross the new edge (V, via), which must hold them.
  double pen = 0;
  Shape via = Shape::circle(p, viaR_);
  for (int i = 0; i < 3; ++i) {
    Vec2 V = P(T.v[i]);
    double free = vo[i].shape ? vo[i].shape->distance(via) : (V - p).len() - viaR_;
    for (int li = 0; li < NL_; ++li) {
      double sumW = 0, maxC = 0;
      int n = 0;
      for (const Chord& ch : s_.chords[li, t]) {
        if (ch.net == net_) continue;
        Vec2 a = endPoint(li, t, ch.a), c = endPoint(li, t, ch.b);
        if (segmentsIntersect(a, c, V, p)) {
          const Wire& w = s_.wires[ch.wire];
          sumW += double(w.width);
          maxC = std::max(maxC, double(w.clr));
          ++n;
        }
      }
      if (n == 0) continue;
      double need = sumW + (n - 1) * maxC + std::max(viaClr_, maxC) + (vo[i].shape ? std::max(vo[i].clr, maxC) : 0) +
                    n * kRealizeMargin;
      // Wires in the way are pushed aside at a price, like an overflowed edge: the nets concerned
      // are rerouted in the next pass. Only the last, hard-capped pass refuses.
      if (need - free > 1) {
        if (hardCap_) { ++viaStats_[6]; return std::nullopt; }
        pen += presFac_ * kUnit * (1 + (need - free) / (sumW / n + maxC));
      }
    }
  }
  if (penalty) *penalty = pen;
  return p;
}

int Router::placeVia(int t, Vec2 p) {
  // Chords of the old triangle, on every layer, with their geometry, before it is split.
  struct Old {
    int li;
    Chord ch;
    Vec2 a, c;
  };
  std::vector<Old> olds;
  for (int li = 0; li < NL_; ++li)
    for (const Chord& ch : s_.chords[li, t]) olds.push_back({li, ch, endPoint(li, t, ch.a), endPoint(li, t, ch.b)});
  // Ends as seen from any part: vertex ends by vertex id, edge ends by edge id and crossing.
  struct GEnd {
    bool vertex;
    int id;  // vertex or edge
    int cid;
  };
  auto gend = [&](const End& e) {
    return e.vertex ? GEnd{true, m_.tris[t].v[e.local], -1} : GEnd{false, m_.tris[t].e[e.local], e.cid};
  };
  std::vector<std::pair<GEnd, GEnd>> oldEnds;
  for (auto& o : olds) oldEnds.push_back({gend(o.ch.a), gend(o.ch.b)});
  for (int li = 0; li < NL_; ++li) s_.chords[li, t].clear();

  int v = m_.splitTriangle(t, p, VKind::ViaSite);
  meshGrew();
  int t2 = int(m_.tris.size()) - 2, t3 = t2 + 1;
  splits_[t] = {t, t2, t3};
  s_.viaNet[v] = net_;
  vshape_[v] = Shape::circle(p, viaR_);

  // The old chords again, through whichever parts they pass now.
  // A wire may pass through t more than once: its chords here take its occurrences of t in wire
  // order; re-laid from the last occurrence backwards, the earlier positions stay valid (the first
  // part keeps the old triangle's index, so a search for `t` afterwards would find it instead).
  struct Job {
    size_t old;
    size_t pos;
  };
  std::map<int, std::vector<Job>> perWire;
  for (size_t i = 0; i < olds.size(); ++i) perWire[olds[i].ch.wire].push_back({i, 0});
  std::vector<Job> jobs;
  for (auto& [wi, list] : perWire) {
    const Wire& w = s_.wires[wi];
    // Chords in wire order: by their a-end crossing's place in the wire (a vertex start comes first).
    auto rank = [&](const Job& j) {
      const GEnd& ga = oldEnds[j.old].first;
      if (ga.vertex) return -1L;
      return long(std::ranges::find(w.cids, ga.cid) - w.cids.begin());
    };
    std::ranges::sort(list, {}, rank);
    std::vector<size_t> occ;
    for (size_t k = 0; k < w.tris.size(); ++k)
      if (w.tris[k] == t) occ.push_back(k);
    for (size_t k = 0; k < list.size(); ++k) list[k].pos = k < occ.size() ? occ[k] : w.tris.size();
    for (auto& j : list | std::views::reverse) jobs.push_back(j);
  }
  for (const Job& j : jobs) {
    const Old& o = olds[j.old];
    const GEnd &ga = oldEnds[j.old].first, &gc = oldEnds[j.old].second;
    // Ends carry global ids (vertex or edge) in `local`: the walk resolves them per part.
    End a{ga.vertex, ga.id, ga.cid}, c{gc.vertex, gc.id, gc.cid};
    int cidAfter = ga.vertex ? -1 : ga.cid;
    auto& wt = s_.wires[o.ch.wire].tris;
    size_t pos = std::min(j.pos, wt.size());
    if (pos < wt.size() && wt[pos] == t) wt.erase(wt.begin() + long(pos));
    std::vector<int> parts;
    addChordWalk(o.li, o.ch.wire, t, a, o.a, c, o.c, &cidAfter, &parts);
    auto& wt2 = s_.wires[o.ch.wire].tris;
    wt2.erase(wt2.end() - long(parts.size()), wt2.end());
    wt2.insert(wt2.begin() + long(std::min(pos, wt2.size())), parts.begin(), parts.end());
  }
  if (std::getenv("XR_CHECK")) {
    // Straight sub-chords of the parts must not cross: dump the split when they do.
    bool crossed = false;
    for (int part : {t, t2, t3})
      for (int li = 0; li < NL_ && !crossed; ++li) {
        const auto& chs = s_.chords[li, part];
        for (size_t i = 0; i < chs.size() && !crossed; ++i)
          for (size_t j = i + 1; j < chs.size() && !crossed; ++j) {
            if (chs[i].net == chs[j].net) continue;
            Vec2 a = endPoint(li, part, chs[i].a), b = endPoint(li, part, chs[i].b), c = endPoint(li, part, chs[j].a), d = endPoint(li, part, chs[j].b);
            crossed = orient(a, b, c) * orient(a, b, d) < 0 && orient(c, d, a) * orient(c, d, b) < 0;
          }
      }
    if (crossed) {
      std::println(stderr, "split of tri {} at ({:.3f},{:.3f}) -> {} {} {} made crossing sub-chords; old chords:", t, p.x / 1e6, -p.y / 1e6, t, t2, t3);
      for (size_t i = 0; i < olds.size(); ++i)
        std::println(stderr, "  L{} net {} wire {}: ({:.3f},{:.3f}) -> ({:.3f},{:.3f})  a {}{} c {}{}", olds[i].li,
                     b_.nets[olds[i].ch.net].name, olds[i].ch.wire, olds[i].a.x / 1e6, -olds[i].a.y / 1e6, olds[i].c.x / 1e6,
                     -olds[i].c.y / 1e6, oldEnds[i].first.vertex ? "v" : "e", oldEnds[i].first.id, oldEnds[i].second.vertex ? "v" : "e",
                     oldEnds[i].second.id);
      for (int part : {t, t2, t3})
        for (int li = 0; li < NL_; ++li)
          for (const Chord& ch : s_.chords[li, part]) {
            Vec2 a = endPoint(li, part, ch.a), b = endPoint(li, part, ch.b);
            std::println(stderr, "  part {} L{} net {} wire {}: ({:.3f},{:.3f}) -> ({:.3f},{:.3f})", part, li, b_.nets[ch.net].name,
                         ch.wire, a.x / 1e6, -a.y / 1e6, b.x / 1e6, -b.y / 1e6);
          }
    }
  }
  return v;
}

void Router::addChordWalk(int li, int wire, int t, const End& a, Vec2 P0, const End& c, Vec2 Q, int* cidAfter,
                          std::vector<int>* partsOut) {
  // `a.local` and `c.local` are global ids (vertex or edge) here; resolve against the parts.
  auto addChord = [&](int part, const End& x, const End& y) {
    if ((x.local < 0 || y.local < 0) && std::getenv("XR_CHECK")) {
      std::print(stderr, "bad chord of net {} in part {} ({},{},{}) of tri {}: a {}{} c {}{}; parts:",
                 b_.nets[s_.wires[wire].net].name, part, m_.tris[part].v[0], m_.tris[part].v[1], m_.tris[part].v[2], t,
                 a.vertex ? "v" : "e", a.local, c.vertex ? "v" : "e", c.local);
      if (auto it = splits_.find(t); it != splits_.end())
        for (int pt : it->second) std::print(stderr, " {}({},{},{})", pt, m_.tris[pt].v[0], m_.tris[pt].v[1], m_.tris[pt].v[2]);
      std::println(stderr, "");
    }
    s_.chords[li, part].push_back({wire, s_.wires[wire].net, x, y});
    s_.wires[wire].tris.push_back(part);
    if (partsOut) partsOut->push_back(part);
  };
  auto local = [&](int part, const End& g) {
    return g.vertex ? End{true, m_.localVertex(part, g.local), -1} : End{false, m_.localEdge(part, g.local), g.cid};
  };
  auto it = splits_.find(t);
  if (it == splits_.end()) {
    addChord(t, local(t, a), local(t, c));
    return;
  }
  const auto& parts = it->second;
  auto has = [&](int part, const End& g) {
    return g.vertex ? m_.localVertex(part, g.local) >= 0 : m_.localEdge(part, g.local) >= 0;
  };
  // Both ends in one part (a chord along a new edge, or within the part): no walk.
  for (int part : parts)
    if (has(part, a) && has(part, c)) {
      addChord(part, local(part, a), local(part, c));
      return;
    }
  // The part the chord starts in: holds the start end and the first bit of the segment.
  auto partAt = [&](Vec2 q, const End* must) {
    for (int part : parts)
      if ((!must || has(part, *must)) && m_.strictlyInside(part, q)) return part;
    for (int part : parts)
      if (!must || has(part, *must)) return part;
    return parts[0];
  };
  Vec2 dir = (Q - P0).normalized();
  int cur = partAt(P0 + dir * 10.0, &a);
  int end = partAt(Q - dir * 10.0, &c);
  End prev = local(cur, a);
  double tPrev = 0;  // where along P0 -> Q the segment is now
  for (int guard = 0; guard < 8 && cur != end; ++guard) {
    // The internal edge of `cur` the segment leaves through, ahead of where it is.
    int exitLe = -1;
    double bestT = 2;
    for (int le = 0; le < 3; ++le) {
      int e = m_.tris[cur].e[le];
      int nb = m_.tris[cur].nb[le];
      if (nb < 0 || !std::ranges::contains(parts, nb)) continue;
      Vec2 u = P(m_.edges[e].v[0]), w = P(m_.edges[e].v[1]);
      if (!segmentsIntersect(P0, Q, u, w)) continue;
      double den = (w - u).cross(Q - P0);
      if (std::abs(den) < 1e-9) continue;
      double tt = (P0 - u).cross(w - u) / den;  // along P0 -> Q
      if (tt < bestT && tt > tPrev + 1e-9) { bestT = tt; exitLe = le; }
    }
    if (exitLe >= 0) tPrev = bestT;
    double f = -1;
    if (exitLe < 0) {
      // Degenerate geometry (ends inside the own pad's copper fall on one point): a chord between two
      // edges that share a vertex V hugs that corner, i.e. crosses the new edge (V, via) next to V.
      int via = -1;
      for (int x : m_.tris[parts[0]].v)
        if (std::ranges::all_of(parts, [&](int pt) { return m_.localVertex(pt, x) >= 0; })) via = x;
      int V = -1;
      if (!a.vertex && !c.vertex)
        for (int x : m_.edges[a.local].v)
          if (x == m_.edges[c.local].v[0] || x == m_.edges[c.local].v[1]) V = x;
      if (via < 0 || V < 0) {
        if (std::getenv("XR_CHECK")) std::println(stderr, "chord walk lost in split triangle {}", t);
        break;
      }
      for (int le = 0; le < 3; ++le) {
        const MEdge& me = m_.edges[m_.tris[cur].e[le]];
        if ((me.v[0] == V && me.v[1] == via) || (me.v[0] == via && me.v[1] == V)) exitLe = le;
      }
      if (exitLe < 0) break;
      f = m_.edges[m_.tris[cur].e[exitLe]].v[0] == V ? 0.0 : 1.0;
    }
    int e = m_.tris[cur].e[exitLe];
    // Gap on the internal edge by the crossing point's position among the crossings there.
    Vec2 u = P(m_.edges[e].v[0]), w = P(m_.edges[e].v[1]);
    if (f < 0) {
      double den = (w - u).cross(Q - P0);
      f = (P0 - u).cross(Q - P0) / den;  // along u -> w
    }
    // Among the crossings there by position.
    const auto& list = s_.cross[li, e];
    int g = 0;
    for (int k = 0; k < int(list.size()); ++k)
      if (s_.crossings[list[size_t(k)]].f <= f) g = k + 1;
    int cid = insertCrossing(li, e, g, wire, false, f);
    auto& cids = s_.wires[wire].cids;
    if (cidAfter && *cidAfter >= 0) {
      auto pos = std::ranges::find(cids, *cidAfter);
      cids.insert(pos == cids.end() ? cids.end() : pos + 1, cid);
    } else {
      cids.insert(cids.begin(), cid);
    }
    if (cidAfter) *cidAfter = cid;
    addChord(cur, prev, End{false, exitLe, cid});
    int next = m_.tris[cur].nb[exitLe];
    prev = End{false, m_.localEdge(next, e), cid};
    cur = next;
  }
  addChord(cur, prev, local(cur, c));
}

bool Router::checkState(const char* where) const {
  if (!std::getenv("XR_CHECK")) return true;
  int bad = 0;
  for (auto [wi, w] : std::views::enumerate(s_.wires)) {
    if (!w.alive || w.v0 < 0 || w.v1 < 0) continue;
    if (w.tris.size() != w.cids.size() + 1) {
      if (bad++ < 5)
        std::println(stderr, "{}: wire {} net {}: {} triangles for {} crossings", where, wi, b_.nets[w.net].name,
                     w.tris.size(), w.cids.size());
      continue;
    }
    for (size_t i = 0; i < w.cids.size(); ++i) {
      int e = s_.crossings[w.cids[i]].edge;
      if (m_.localEdge(w.tris[i], e) < 0 || m_.localEdge(w.tris[i + 1], e) < 0) {
        if (bad++ < 2) {
          std::print(stderr, "{}: wire {} net {} crossing {} is not between its triangles\n  tris:", where, wi,
                     b_.nets[w.net].name, i);
          for (int t : w.tris) std::print(stderr, " {}({},{},{})", t, m_.tris[t].v[0], m_.tris[t].v[1], m_.tris[t].v[2]);
          std::print(stderr, "\n  cids:");
          for (int cid : w.cids)
            std::print(stderr, " e{}({}-{} f{:.2f})", s_.crossings[cid].edge, m_.edges[s_.crossings[cid].edge].v[0],
                       m_.edges[s_.crossings[cid].edge].v[1], s_.crossings[cid].f);
          std::println(stderr, "");
        }
        break;
      }
    }
  }
  if (bad) std::println(stderr, "{}: {} inconsistent wire(s)", where, bad);
  // Lists sorted by position, and straight chords of a triangle that do not cross.
  static bool reported = false;
  bool reportedBefore = reported;
  if (!reported)
    for (int li = 0; li < NL_ && !reported; ++li) {
      for (int e = 0; e < int(m_.edges.size()) && !reported; ++e) {
        const auto& list = s_.cross[li, e];
        for (size_t k = 1; k < list.size(); ++k)
          if (s_.crossings[list[k - 1]].f > s_.crossings[list[k]].f + 1e-12) {
            std::print(stderr, "{}: edge {} L{} list out of order:", where, e, li);
            for (int cid : list) std::print(stderr, " #{} f{:.3f} net {}", cid, s_.crossings[cid].f, b_.nets[s_.wires[s_.crossings[cid].wire].net].name);
            std::println(stderr, "");
            reported = true;
            break;
          }
      }
      for (int t = 0; t < int(m_.tris.size()) && !reported; ++t) {
        const auto& chs = s_.chords[li, t];
        for (size_t i = 0; i < chs.size() && !reported; ++i)
          for (size_t j = i + 1; j < chs.size(); ++j) {
            if (chs[i].net == chs[j].net) continue;
            Vec2 a = endPoint(li, t, chs[i].a), b = endPoint(li, t, chs[i].b), c = endPoint(li, t, chs[j].a), d = endPoint(li, t, chs[j].b);
            if (orient(a, b, c) * orient(a, b, d) < 0 && orient(c, d, a) * orient(c, d, b) < 0) {
              std::println(stderr, "{}: tri {} ({},{},{}) L{}: straight chords cross: {} ({:.3f},{:.3f})-({:.3f},{:.3f}) x {} ({:.3f},{:.3f})-({:.3f},{:.3f})",
                           where, t, m_.tris[t].v[0], m_.tris[t].v[1], m_.tris[t].v[2], li, b_.nets[chs[i].net].name, a.x / 1e6, -a.y / 1e6,
                           b.x / 1e6, -b.y / 1e6, b_.nets[chs[j].net].name, c.x / 1e6, -c.y / 1e6, d.x / 1e6, -d.y / 1e6);
              reported = true;
              break;
            }
          }
      }
    }
  // The first pair of crossing chords, if any.
  static int lastCrossings = 0;
  int crossings = countCrossings(nullptr);
  if (crossings > lastCrossings) {
    for (int li = 0; li < NL_; ++li)
      for (int t = 0; t < int(m_.tris.size()); ++t) {
        const auto& chs = s_.chords[li, t];
        for (size_t i = 0; i < chs.size(); ++i)
          for (size_t j = i + 1; j < chs.size(); ++j) {
            if (chs[i].net == chs[j].net) continue;
            double a = endCoord(li, t, chs[i].a), b = endCoord(li, t, chs[i].b);
            double c = endCoord(li, t, chs[j].a), d = endCoord(li, t, chs[j].b);
            double lo = std::min(a, b), hi = std::max(a, b);
            if ((lo < c && c < hi) == (lo < d && d < hi)) continue;
            auto endText = [&](const End& e) {
              return e.vertex ? std::format("v{}", m_.tris[t].v[e.local])
                              : std::format("e{}#{}", m_.tris[t].e[e.local], e.cid);
            };
            std::println(stderr, "{}: crossings {} -> {}: tri {} ({},{},{}) L{}: {} {}-{} [{:.2f}-{:.2f}] x {} {}-{} [{:.2f}-{:.2f}]",
                         where, lastCrossings, crossings, t, m_.tris[t].v[0], m_.tris[t].v[1], m_.tris[t].v[2], li,
                         b_.nets[chs[i].net].name, endText(chs[i].a), endText(chs[i].b), a, b, b_.nets[chs[j].net].name,
                         endText(chs[j].a), endText(chs[j].b), c, d);
            for (const Chord* ch : {&chs[i], &chs[j]})
              for (const End* e : {&ch->a, &ch->b}) {
                Vec2 q = endPoint(li, t, *e);
                std::print(stderr, "   end {} at ({:.3f},{:.3f})", endText(*e), q.x / 1e6, -q.y / 1e6);
                if (!e->vertex) {
                  int edge = m_.tris[t].e[e->local];
                  auto [ia, ic] = interval_[edge];
                  std::print(stderr, " edge {}-{} interval ({:.3f},{:.3f})-({:.3f},{:.3f}) f{:.2f} list {}", m_.edges[edge].v[0],
                             m_.edges[edge].v[1], ia.x / 1e6, -ia.y / 1e6, ic.x / 1e6, -ic.y / 1e6, s_.crossings[e->cid].f,
                             s_.cross[li, edge].size());
                }
                std::println(stderr, "");
              }
            for (int k = 0; k < 3; ++k) {
              int vv = m_.tris[t].v[k];
              std::println(stderr, "   vertex {} kind {} pad {} at ({:.3f},{:.3f})", vv, int(m_.verts[vv].kind), m_.verts[vv].pad,
                           P(vv).x / 1e6, -P(vv).y / 1e6);
            }
            lastCrossings = crossings;
            return false;
          }
      }
  }
  lastCrossings = crossings;
  return bad == 0 && (reported == reportedBefore);
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
  const MVertex& mv = m_.verts[v];
  return o_.useVias && NL_ > 1 && mv.kind == VKind::ViaSite && s_.viaNet[v] < 0 && (mv.onlyNet == kNoNet || mv.onlyNet == net_);
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
  auto keyVia = [](int li, int t) { return (std::uint64_t(1) << 62) | (std::uint64_t(li) << 58) | std::uint64_t(t); };
  auto push = [&](SNode n, std::uint64_t key) -> int {
    auto it = best.find(key);
    if (it != best.end() && it->second <= n.g) return -1;
    best[key] = n.g;
    nodes.push_back(n);
    int idx = int(nodes.size() - 1);
    open.push({n.g + heuristic(n.cpt), idx});
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
      n.pt = n.cpt = P(v);
      push(n, keyVertex(li, v));
    }

  size_t nNoNb = 0, nBlocked = 0, nNoGap = 0, nPushed = 0;
  // `geom`: the chord starts at the node's point inside t (a via placed there), so crossings are told
  // by geometry rather than by perimeter coordinates.
  auto tryEdge = [&](int from, int t, double s, int le2, bool geom = false) {
    const SNode& n = nodes[from];
    int e = m_.tris[t].e[le2];
    int t2 = m_.tris[t].nb[le2];
    if (t2 < 0 || ((m_.tris[t2].blocked >> layers_[n.li]) & 1)) { ++nNoNb; return; }
    bool blocked = false, narrow = false;
    double cc = crossCost(e, n.li, blocked, &narrow);
    if (blocked) { ++nBlocked; return; }
    std::optional<std::pair<int, int>> gx;
    if (geom) {
      int mm = int(s_.cross[n.li, e].size());
      for (int g = 0; g <= mm; ++g) {
        int h = relaxed_ ? 0 : hitsGeom(n.li, t, n.pt, edgePoint(e, gapFraction(n.li, e, g)));
        if (h == 0) { gx = std::pair{g, 0}; break; }
        if (h > 0 && softPlanar_ && (!gx || h < gx->second)) gx = std::pair{g, h};
      }
    } else {
      gx = exitGap(n.li, t, le2, s);
    }
    if (!gx) { ++nNoGap; return; }
    ++nPushed;
    int g = gx->first;
    int m = int(s_.cross[n.li, e].size());
    SNode c;
    c.li = n.li;
    c.tri = t2;
    c.le = m_.localEdge(t2, e);
    c.edge = e;
    c.gap = g;
    {
      const auto& list = s_.cross[n.li, e];
      c.before = g > 0 ? list[size_t(g - 1)] : -1;
      c.after = g < int(list.size()) ? list[size_t(g)] : -1;
    }
    c.narrow = narrow;
    c.chordTri = t;
    c.pt = edgePoint(e, gapFraction(n.li, e, g));
    c.cpt = intervalPoint(e, (g + 1.0) / (m + 2.0));
    c.g = n.g + (c.cpt - n.cpt).len() + cc + gx->second * crossPenalty_;
    c.parent = from;
    push(c, keyEdge(c.li, t2, c.le, c.gap));
  };

  auto tryVertex = [&](int from, int t, double s, int lv, bool geom = false) {
    const SNode& n = nodes[from];
    int w = m_.tris[t].v[lv];
    if (n.atVertex && w == n.vtx) return;
    int crossings = relaxed_ ? 0 : geom ? hitsGeom(n.li, t, n.pt, P(w), lv) : chordCrossings(n.li, t, s, double(lv));
    if (crossings < 0 || (crossings > 0 && !softPlanar_)) return;
    SNode c;
    c.li = n.li;
    c.atVertex = true;
    c.vtx = w;
    c.chordTri = t;
    c.pt = c.cpt = P(w);
    c.g = n.g + (c.cpt - n.cpt).len() + crossings * crossPenalty_;
    c.parent = from;
    if (isTarget(w, n.li)) {
      c.goal = true;
      push(c, keyVertex(n.li, w));
    } else if (m_.verts[w].pad == startPad_ && startPad_ >= 0 && (m_.verts[w].kind != VKind::PadCorner || cornerOk_[startPad_])) {
      // Another vertex of the start pad: the wire may leave the pad from any of its vertices.
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

  // A new via inside triangle t, reached from the node's point: the path changes layer there.
  auto tryVia = [&](int from, int t) {
    if (!o_.useVias || NL_ < 2 || !kTriVia) return;
    const SNode& n = nodes[from];
    double pen = 0;
    auto spot = viaSpot(t, &pen);
    if (!spot) return;
    int hits = relaxed_ ? 0 : hitsGeom(n.li, t, n.pt, *spot);
    if (hits < 0 || (hits > 0 && !softPlanar_)) return;
    SNode c;  // arrival at the via on the old layer (not expanded)
    c.li = n.li;
    c.viaTri = t;
    c.chordTri = t;
    c.pt = c.cpt = *spot;
    c.transit = true;
    c.g = n.g + (c.cpt - n.cpt).len() + hits * crossPenalty_;
    c.parent = from;
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
      push(d, keyVia(li2, t));
    }
  };

  size_t expansions = 0;
  while (!open.empty()) {
    auto [f, idx] = open.top();
    open.pop();
    SNode n = nodes[idx];
    std::uint64_t key = n.viaTri >= 0 ? keyVia(n.li, n.viaTri)
                        : n.atVertex  ? keyVertex(n.li, n.vtx)
                                      : keyEdge(n.li, n.tri, n.le, n.gap);
    if (auto it = best.find(key); it != best.end() && it->second < n.g) continue;
    if (n.goal) {
      std::vector<SNode> path;
      for (int i = idx; i >= 0; i = nodes[i].parent) path.push_back(nodes[i]);
      std::ranges::reverse(path);
      return path;
    }
    if (++expansions > kMaxExpansions || (expansions % 4096 == 0 && cancelled())) break;
    if (std::getenv("XR_DEBUG5") && expansions == 1) nodes.reserve(1024);
    if (n.viaTri >= 0) {
      // From the via, anywhere in its triangle.
      for (int le2 = 0; le2 < 3; ++le2) tryEdge(idx, n.viaTri, 0, le2, true);
      for (int lv = 0; lv < 3; ++lv) tryVertex(idx, n.viaTri, 0, lv, true);
    } else if (n.atVertex) {
      for (int t : m_.verts[n.vtx].tris) {
        int lv = m_.localVertex(t, n.vtx);
        tryEdge(idx, t, double(lv), lv);
        for (int lv2 = 0; lv2 < 3; ++lv2)
          if (lv2 != lv) tryVertex(idx, t, double(lv), lv2);
        tryVia(idx, t);
      }
    } else {
      double s = gapCoord(n.li, n.tri, n.le, n.gap);
      for (int le2 = 0; le2 < 3; ++le2)
        if (le2 != n.le) tryEdge(idx, n.tri, s, le2);
      for (int lv = 0; lv < 3; ++lv) tryVertex(idx, n.tri, s, lv);
      tryVia(idx, n.tri);
    }
  }
  if (std::getenv("XR_DEBUG5"))
    std::println(stderr, "search failed: {} expansions, {} nodes; edges: {} no-neighbour, {} capacity-blocked, {} no-gap, {} pushed",
                 expansions, nodes.size(), nNoNb, nBlocked, nNoGap, nPushed);
  return std::nullopt;
}

int Router::insertCrossing(int li, int e, int gap, int wire, bool narrow, double f) {
  int cid = int(s_.crossings.size());
  const Wire& w = s_.wires[wire];
  double width = narrow ? double(w.widthMin) : double(w.width);
  auto& list = s_.cross[li, e];
  gap = std::clamp(gap, 0, int(list.size()));
  // Every crossing has a fixed place on its edge: given, or midway between its neighbours at the time.
  if (f < 0) f = gapFraction(li, e, gap);
  s_.crossings.push_back({wire, e, width, f});
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
  // The chord's start, as a global end (vertex id, or edge id with its crossing) and its point.
  End last{true, path[0].vtx, -1};
  Vec2 lastPt = path[0].pt;
  int lastCid = -1;  // the wire's latest crossing: new ones go after it
  int viaVertex = -1;
  std::vector<int> placed;
  splits_.clear();
  auto pointOfEnd = [&](int li, const End& g) { return g.vertex ? P(g.local) : crossingPoint(li, g.local, g.cid); };

  int wire = newWire(path[0].li, path[0].vtx);
  for (const SNode& n : path | std::views::drop(1)) {
    if (n.chordTri < 0) {  // layer change at a vertex: an existing one, or the via placed just before
      int v = n.viaTri >= 0 ? viaVertex : n.vtx;
      if (n.via && n.viaTri < 0) {
        s_.viaNet[v] = net_;
        vshape_[v] = Shape::circle(P(v), viaR_);  // occupied site now blocks like a via
      }
      if (s_.wires[wire].tris.empty()) {  // reuse the empty wire opened at this vertex
        s_.wires[wire].li = n.li;
        s_.wires[wire].v0 = v;
      } else {
        wire = newWire(n.li, v);
      }
      last = End{true, v, -1};
      lastPt = P(v);
      lastCid = -1;
      continue;
    }
    int t = n.chordTri;
    if (n.viaTri >= 0) {
      // Arrival at a new via: the triangle is split at its spot, the chord ends at the new vertex.
      int v = placeVia(t, n.pt);
      viaVertex = v;
      placed.push_back(v);
      addChordWalk(n.li, wire, t, last, lastPt, End{true, v, -1}, P(v), &lastCid);
      s_.wires[wire].v1 = v;
      last = End{true, v, -1};
      lastPt = P(v);
      continue;
    }
    if (!n.atVertex) {
      int e = n.edge;
      // The gap as it is now: right after the crossing that was before it, not past the one after.
      const auto& list = s_.cross[n.li, e];
      int gap = 0;
      if (n.before >= 0)
        if (auto it = std::ranges::find(list, n.before); it != list.end()) gap = int(it - list.begin()) + 1;
      if (n.after >= 0)
        if (auto it = std::ranges::find(list, n.after); it != list.end()) gap = std::min(gap, int(it - list.begin()));
      int cid = insertCrossing(n.li, e, gap, wire, n.narrow);
      s_.wires[wire].cids.push_back(cid);
      End c{false, e, cid};
      addChordWalk(n.li, wire, t, last, lastPt, c, pointOfEnd(n.li, c), &lastCid);
      lastCid = cid;
      last = c;
      lastPt = pointOfEnd(n.li, c);
    } else {
      End c{true, n.vtx, -1};
      addChordWalk(n.li, wire, t, last, lastPt, c, P(n.vtx), &lastCid);
      s_.wires[wire].v1 = n.vtx;
      if (m_.verts[n.vtx].pad >= 0) joinedPads.push_back(m_.verts[n.vtx].pad);
      wire = newWire(n.li, n.vtx);
      last = c;
      lastPt = P(n.vtx);
      lastCid = -1;
    }
  }
  // The trailing wire started at the goal vertex is empty.
  for (int w = int(s_.wires.size()) - 1; w >= 0 && s_.wires[w].v1 < 0 && s_.wires[w].tris.empty(); --w) {
    s_.wires.pop_back();
  }
  for (const SNode& n : path)
    if (n.atVertex && s_.viaNet[n.vtx] == net_) addVertexToTree(n.vtx);
  for (int v : placed) addVertexToTree(v);
  if (!checkState(placed.empty() ? "commit" : "commit with via") || std::getenv("XR_TRACE")) {
    if (std::getenv("XR_CHECK")) {
      std::print(stderr, "  path of net {}:", b_.nets[net_].name);
      for (const SNode& n : path)
        std::print(stderr, " [{}L{} {}{}{}{}]", n.transit ? "T" : "", n.li,
                   n.viaTri >= 0 ? std::format("via@{}", n.viaTri)
                   : n.atVertex  ? std::format("v{} k{} ({:.3f},{:.3f})", n.vtx, int(m_.verts[n.vtx].kind), P(n.vtx).x / 1e6, -P(n.vtx).y / 1e6)
                                 : std::format("t{} e{} g{} ({:.3f},{:.3f})k{}p{}-({:.3f},{:.3f})k{}p{}", n.tri, n.edge, n.gap,
                                               P(m_.edges[n.edge].v[0]).x / 1e6, -P(m_.edges[n.edge].v[0]).y / 1e6, int(m_.verts[m_.edges[n.edge].v[0]].kind),
                                               m_.verts[m_.edges[n.edge].v[0]].sitePad, P(m_.edges[n.edge].v[1]).x / 1e6, -P(m_.edges[n.edge].v[1]).y / 1e6,
                                               int(m_.verts[m_.edges[n.edge].v[1]].kind), m_.verts[m_.edges[n.edge].v[1]].sitePad),
                   n.chordTri >= 0 ? std::format(" c{}", n.chordTri) : "", n.goal ? " goal" : "", n.via ? " via" : "");
      std::println(stderr, "");
    }
  }
  splits_.clear();
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
      vshape_[v] = Shape::circle(P(int(v)), siteRadius(int(v)));
      unsplitIfClean(int(v));
    }
  s_.failed[job].clear();
}

// A via vertex nothing uses any more merges its three triangles back, so that the mesh does not
// fragment over the passes: no crossing on its edges on any layer, and no chord of its parts ends
// at it.
void Router::unsplitIfClean(int v) {
  const MVertex& V = m_.verts[v];
  if (V.kind != VKind::ViaSite || V.tris.size() != 3) return;
  for (int t : V.tris)
    for (int li = 0; li < NL_; ++li)
      for (const Chord& ch : s_.chords[li, t])
        if ((ch.a.vertex && m_.tris[t].v[ch.a.local] == v) || (ch.b.vertex && m_.tris[t].v[ch.b.local] == v)) return;
  for (int e : vertEdges_[v])
    for (int li = 0; li < NL_; ++li)
      if (!s_.cross[li, e].empty()) return;
  // Chords of the parts, as global ends, to be re-localised in the merged triangle.
  struct G {
    int li, wire, net;
    bool av, cv;
    int aid, acid, cid_, ccid;
  };
  std::vector<G> keep;
  for (int t : V.tris)
    for (int li = 0; li < NL_; ++li)
      for (const Chord& ch : s_.chords[li, t])
        keep.push_back({li, ch.wire, ch.net, ch.a.vertex, ch.b.vertex, ch.a.vertex ? m_.tris[t].v[ch.a.local] : m_.tris[t].e[ch.a.local],
                        ch.a.cid, ch.b.vertex ? m_.tris[t].v[ch.b.local] : m_.tris[t].e[ch.b.local], ch.b.cid});
  int t1 = V.tris[0], t2 = V.tris[1], t3 = V.tris[2];
  if (!m_.unsplit(v)) return;
  for (int t : {t1, t2, t3})
    for (int li = 0; li < NL_; ++li) s_.chords[li, t].clear();
  for (const G& g : keep) {
    End a = g.av ? End{true, m_.localVertex(t1, g.aid), -1} : End{false, m_.localEdge(t1, g.aid), g.acid};
    End c = g.cv ? End{true, m_.localVertex(t1, g.cid_), -1} : End{false, m_.localEdge(t1, g.cid_), g.ccid};
    s_.chords[g.li, t1].push_back({g.wire, g.net, a, c});
  }
  for (Wire& w : s_.wires)
    if (w.alive)
      for (int& t : w.tris)
        if (t == t2 || t == t3) t = t1;
}

void Router::routeJob(int ji) {
  const NetJob& job = jobs_[ji];
  setNet(job.net);
  ++stamp_;
  targets_.clear();
  targetBox_ = BBox{};
  std::vector<char> done(job.pads.size(), 0);
  // A pad joins the tree with every pad the kept wires already connect it to.
  auto markJoined = [&](int pad) {
    addPadToTree(pad);
    int cl = pad < int(padCluster_.size()) ? padCluster_[pad] : -1;
    for (size_t k = 0; k < job.pads.size(); ++k)
      if (!done[k] && (job.pads[k] == pad || (cl >= 0 && padCluster_[job.pads[k]] == cl))) {
        done[k] = 1;
        addPadToTree(job.pads[k]);
      }
  };
  markJoined(job.pads[0]);
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
    markJoined(pad);
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
    for (int cid : w.cids) pts.push_back(crossingPoint(w.li, s_.crossings[cid].edge, cid));
    pts.push_back(P(w.v1));
    // A waypoint per chord keeps the sketch inside its triangle: the chord's middle, nudged towards the
    // centroid (through the centroid itself the chords of one big triangle would all meet).
    for (size_t i = 0; i + 1 < pts.size(); ++i) {
      rw.sketch.push_back(pts[i]);
      if (i < w.tris.size()) {
        Vec2 mid = (pts[i] + pts[i + 1]) * 0.5;
        rw.sketch.push_back(mid + (centroid(w.tris[i]) - mid) * 0.05);
      }
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
  ro.tracksAsObstacles = true;  // wires kept on the board
  // The realiser on the router's own mesh (XR_UNIMESH): consistent slots, but its bends around pad
  // centres and merged radii are not better yet; kept for the obstacle-only mesh to come.
  if (std::getenv("XR_UNIMESH")) ro.mesh = &m_;
  auto st = realize(b_, wires, vias, ro);
  int narrowed = narrowToFit(b_, before);
  res_.vias = int(vias.size());
  res_.length = 0;
  for (size_t i = before; i < b_.tracks.size(); ++i) {
    const Track& t = b_.tracks[i];
    if (t.isArc()) res_.length += ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length();
    else res_.length += (t.b.v() - t.a.v()).len();
  }
  res_.log.push_back(std::format("realised {} wires ({} alive of {} total), {} arcs, {} narrowed crossings, {} tracks narrowed to fit, {} overflowed edges, {} apexes dropped, {} guard bends",
                                 st.wires, wires.size(), s_.wires.size(), st.arcs, st.narrowed, narrowed, st.overflowEdges, st.droppedApexes, st.guardBends));
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
      int wb = -1;  // -1: a static obstacle, kept wires among them
      if (o.type == ItemType::Track && o.index >= int(firstTrack)) {
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
  size_t verts0 = m_.verts.size();

  std::optional<Full> best;
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
    // The last pass enforces capacity strictly, first come first served. XR_HARD=<n> makes the last n
    // passes hard: the later ones rip up the blockers of what failed and try again — more connections
    // (Placement 270/270, Arcs 209 vs 204) at the price of conflicts (MinVia 5 → 16), so one by default.
    static const int kHardEnv = std::getenv("XR_HARD") ? std::atoi(std::getenv("XR_HARD")) : 0;
    int hardPasses = maxPasses > 1 ? std::clamp(kHardEnv > 0 ? kHardEnv : 1, 1, maxPasses - 1) : 0;
    hardCap_ = pass >= maxPasses - hardPasses;
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
    // All picked nets are ripped up first, then re-laid in a shuffled order. XR_RIPONE: PathFinder's
    // way, one net ripped up right before it is re-laid so that it sees the others as they lie; measured
    // worse here (Arcs 216 vs 90 violations: every net detours around all the others, the wires come out
    // 20 % longer with more vias) — the overflow swings either way (Arcs: 327, 166, 166, 103, 285 edges
    // over six passes), a history proportional to the overflow does not settle it either.
    static const bool kRipOne = std::getenv("XR_RIPONE") != nullptr;
    if (!kRipOne)
      for (int j : queue) ripup(j);
    int done = 0;
    for (int j : queue) {
      if (cancelled()) break;
      if (kRipOne) ripup(j);
      routeJob(j);
      if (o_.progress) o_.progress(++done, int(queue.size()), std::format("pass {}", pass + 1));
    }
    int fails = 0;
    for (auto& f : s_.failed) fails += int(f.size());
    int over = countOverflow();
    int crossings = soft || std::getenv("XR_CHECK") ? countCrossings(nullptr) : 0;
    checkState("pass");
    int score = 3 * fails + over + crossings;  // a failed connection costs more than an overflowed edge
    if (std::getenv("XR_OVFEDGES")) {
      std::vector<std::pair<double, int>> worst;  // (over, edge)
      for (int li = 0; li < NL_; ++li)
        for (int e = 0; e < int(m_.edges.size()); ++e)
          if (edgeOverflow(li, e)) {
            const EdgeUse& u = s_.use[li, e];
            double cu, cv;
            bool ou, ov;
            double free = freeLength(e, li, s_.wires[s_.crossings[s_.cross[li, e].front()].wire].net, cu, ou, cv, ov);
            double need = u.sumW + (u.n - 1) * u.maxC + (ou ? std::max(cu, u.maxC) : 0) + (ov ? std::max(cv, u.maxC) : 0);
            worst.push_back({need - free, e * NL_ + li});
          }
      std::ranges::sort(worst, std::greater{});
      for (size_t i = 0; i < worst.size() && i < 8; ++i) {
        int e = worst[i].second / NL_, li = worst[i].second % NL_;
        const MEdge& me = m_.edges[e];
        const EdgeUse& u = s_.use[li, e];
        std::println(stderr, "  ovf edge {} L{} len {:.2f} over {:.2f} wires {} sumW {:.2f} ends kind {}/{} viaNet {}/{}", e, li,
                     (P(me.v[1]) - P(me.v[0])).len() / 1e6, worst[i].first / 1e6, u.n, u.sumW / 1e6, int(m_.verts[me.v[0]].kind),
                     int(m_.verts[me.v[1]].kind), s_.viaNet[me.v[0]], s_.viaNet[me.v[1]]);
      }
    }
    res_.log.push_back(std::format("pass {}: rerouted {} nets, {} failed connections, {} overflowed edges, {} crossings (present x{})",
                                   pass + 1, queue.size(), fails, over, crossings, presFac_));
    if (std::getenv("XR_VIASTATS")) {
      res_.log.push_back(std::format("  via spots: {} asked, refused: {} blocked, {} vertex obstacles, {} copper, {} vias near, {} keepout, {} chords",
                                     viaStats_[0], viaStats_[1], viaStats_[2], viaStats_[3], viaStats_[4], viaStats_[5], viaStats_[6]));
      viaStats_ = {};
    }
    if (score < bestScore) {
      bestScore = score;
      best = snapshot();
    }
    if (score == 0) break;
  }
  if (best) restore(std::move(*best));
  res_.log.push_back(std::format("mesh after routing: {} vertices ({} added for vias)", m_.verts.size(), m_.verts.size() - verts0));
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
    Full s;
    std::vector<Track> tracks;
    std::vector<Via> vias;
    size_t conflicts;
  };
  std::optional<Snapshot> bestGeom;
  presFac_ = 8;
  hardCap_ = false;
  // An unconnected pad outweighs conflicts by far: those the refinement repairs, a missing wire it
  // cannot make.
  auto failedNow = [&] {
    size_t n = 0;
    for (auto& f : s_.failed) n += f.size();
    return n;
  };
  for (int round = 0; round <= o_.maxPasses && !std::getenv("XR_SKETCH") && !std::getenv("XR_NOFEEDBACK"); ++round) {
    auto conflicts = checkRealized(tracks0, trackWire);
    size_t score = conflicts.size() + 10 * failedNow();
    res_.log.push_back(std::format("geometry round {}: {} conflict(s), {} failed", round, conflicts.size(), failedNow()));
    if (!bestGeom || score < bestGeom->conflicts)
      bestGeom = Snapshot{snapshot(), {b_.tracks.begin() + tracks0, b_.tracks.end()},
                          {b_.vias.begin() + vias0, b_.vias.end()}, score};
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
    restore(std::move(bestGeom->s));
    b_.tracks.resize(tracks0);
    b_.vias.resize(vias0);
    b_.tracks.insert(b_.tracks.end(), bestGeom->tracks.begin(), bestGeom->tracks.end());
    b_.vias.insert(b_.vias.end(), bestGeom->vias.begin(), bestGeom->vias.end());
    res_.vias = int(bestGeom->vias.size());
  }
  if (o_.optimizeIterations > 0 && !cancelled() && !std::getenv("XR_SKETCH")) {
    OptimizeOptions oo;
    oo.iterations = o_.optimizeIterations;
    if (!o_.ripupExisting || !o_.nets.empty())
      for (auto& j : jobs_) oo.nets.push_back(j.net);  // the wires kept on the board stay as they are
    oo.cancel = o_.cancel;
    oo.progress = o_.progress;
    auto r = optimize(b_, oo);
    res_.vias = int(b_.vias.size());
    res_.length = r.lengthAfter;
    res_.log.push_back(std::format("optimised: {} via move(s), conflicts {} -> {}, length {:.1f} -> {:.1f} mm",
                                   r.viaMoves, r.conflictsBefore, r.conflictsAfter, r.lengthBefore / 1e6,
                                   r.lengthAfter / 1e6));
  }
  auto drcCount = [&] {
    DrcOptions d;
    d.unconnected = false;
    d.widths = false;
    return runDrc(b_, d).size();
  };
  res_.log.push_back(std::format("DRC before refine: {} violation(s)", drcCount()));
  if (o_.refine && !cancelled() && !std::getenv("XR_SKETCH")) {
    // The grid refinement: every wire still in violation looks for a path around the copper as it
    // lies now, over the whole board if need be.
    RefineOptions ro;
    ro.cancel = o_.cancel;
    ro.progress = o_.progress;
    for (auto& j : jobs_) ro.nets.push_back(j.net);  // the nets routed here, not the wires kept
    ro.layers.assign(layers_.begin(), layers_.end());
    auto r = refine(b_, ro);
    res_.vias = int(b_.vias.size());
    res_.length = r.lengthAfter;
    res_.log.push_back(std::format("refined: {} wire(s) re-laid, {} repaired, {} moved to another layer, {} via(s) removed; DRC {} violation(s)",
                                   r.improved, r.repaired, r.layerChanges, r.viasRemoved, drcCount()));
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
