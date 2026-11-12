#pragma once
// The realiser's input as the drawing sees it: the obstacles of every layer, every wire's crossings of
// the edges between them in order, the wires' order on every crossed edge, the sketches and the stubs out
// of narrow pads. realize() derives all of it from the sketches (its own triangulation, a walk, the
// topological order); the model fills it from its meshes and hands it to drawRealized().
#include <algorithm>
#include <cmath>
#include <array>
#include <map>
#include <set>
#include <utility>
#include <vector>

#include "core/SpatialIndex.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

constexpr int kTransparent = -3;  // a point that constrains nothing (via site, pad of another layer)
// A wall's point (the outline, a cutout, a keepout) is kBoardEdge: it keeps every net out, by its own
// clearance alone (the clearance to the board edge; nothing from a keepout: TopoR has no such rule, only
// the error of a wire across it).

struct OPt {
  Vec2 p;
  double r = 0;
  double clr = 0;
  int net = kNoNet;
  int shape = -1;  // index into LayerObstacles::shapes: the copper the point belongs to (pads)
  int via = -1;    // the board via this point is (for the squeeze report)
  int owner = -1;  // the model's owner the point belongs to (the model's input only)
  int pair = -1;   // a clasp's point: the differential pair it belongs to (own copper to the pair's wire)
  bool claspCentre = false;  // ... the centre, own copper to the pair's single wires as well
  bool round = false;  // round copper of its own (a via, a round pad, a branch point): what the nominal clearance is kept from
};

struct Side {
  int to;      // neighbouring obstacle point
  double r;    // half width of the side (pad edge: corner radius, stub wire: width / 2)
};

struct LayerObstacles {
  std::vector<OPt> pts;
  std::vector<Shape> shapes;
  // A wire never bends around the centre of a pad that has corners: the nearest corner takes the bend.
  std::map<int, std::vector<int>> cornersOf;  // centre point -> corner points
  std::vector<std::pair<int, int>> constraints;
  std::vector<std::vector<Side>> adj;  // sides incident to each obstacle point (pads, outline, stubs)

  int add(Vec2 p, double r, double clr, int net, int shape = -1) {
    pts.push_back({p, r, clr, net, shape});
    adj.emplace_back();
    return int(pts.size() - 1);
  }
  void side(int a, int c, double r) {
    adj[a].push_back({c, r});
    adj[c].push_back({a, r});
  }
  // A track that stays as it lies, as a chain of points. Arcs coarsely (0.2 mm chords, sagitta under the
  // margin): a point every 20 um made bend circles that overlapped one another, tangents failed and apexes
  // were dropped, and the wire cut straight through the fixed one (six nets re-laid alone: 155 violations).
  void addTrack(const Track& t, double clr) {
    const double r = t.width / 2.0;
    int prev = -1;
    for (Vec2 p : t.path(200000)) {
      int o = add(p, r, clr, t.net);
      if (prev >= 0) link(prev, o, r);
      prev = o;
    }
  }
  void link(int a, int c, double r) {
    constraints.push_back({a, c});
    side(a, c, r);
  }
  // How far the point's copper reaches from the point along direction d (a pad's body from its centre
  // or corner); the radius for points without a shape.
  double reach(const OPt& o, Vec2 d) const {
    if (o.shape < 0) return o.r;
    return std::max(o.r, shapes[size_t(o.shape)].rayExit(o.p, d));
  }
  int nearest(Vec2 p, double tol) const {
    int best = -1;
    double bd = tol * tol;
    for (int i = 0; i < int(pts.size()); ++i)
      if ((pts[i].p - p).len2() <= bd) { bd = (pts[i].p - p).len2(); best = i; }
    return best;
  }
  // The points that may lie in `box` (those of the grid's cells over it, a superset) and every point of
  // radius kFarRadius or more (round copper that reaches far: a hole in the board), in increasing order: a
  // scan of all of them for every chord of every wire was a sixth of the drawing. The grid is made on the
  // first query and again after points were added (a point added is not moved).
  static constexpr double kFarRadius = 3 * kNmPerMm;
  void around(const BBox& box, std::vector<int>& out) const;
  // The same points handed to `fn` one by one, in no order and some of them twice (no list, no sorting): for a
  // caller that wants the least of those that pass its own test.
  template <class F>
  void eachAround(const BBox& box, F&& fn) const {
    const Grid& g = grid();
    if (!box.valid() || g.cells.empty()) return;
    const int x1 = std::clamp(int(std::floor((box.minX - g.x0) / g.cell)), 0, g.nx - 1), x2 = std::clamp(int(std::floor((box.maxX - g.x0) / g.cell)), 0, g.nx - 1);
    const int y1 = std::clamp(int(std::floor((box.minY - g.y0) / g.cell)), 0, g.ny - 1), y2 = std::clamp(int(std::floor((box.maxY - g.y0) / g.cell)), 0, g.ny - 1);
    for (int cy = y1; cy <= y2; ++cy)
      for (int cx = x1; cx <= x2; ++cx)
        for (int i : g.cells[size_t(cy) * size_t(g.nx) + size_t(cx)]) fn(i);
    for (int i : g.far) fn(i);
  }

 private:
  struct Grid {
    size_t built = 0;  // the points it holds
    double x0 = 0, y0 = 0, cell = 1;
    int nx = 0, ny = 0;
    std::vector<std::vector<int>> cells;
    std::vector<int> far;
  };
  mutable Grid grid_;
  const Grid& grid() const;  // made on the first call, and again after points were added
};

// Constrained Delaunay triangulation of the obstacle points of one layer, optionally without
// the points of one net. Vertex info = obstacle id.

struct EdgeHit {
  int u, v;     // obstacle ids, u < v
  double t;     // position along u -> v
  bool uLeft;   // u lies to the left of the direction of travel
  int wBack = -1, wFwd = -1;  // apex of the triangle left and of the triangle entered (-1: outside)
  bool atEnd = false;         // the edge touches a sketch end point (stripped at the ends of the walk)
  double pin = -1;            // >= 0: the crossing is fixed at this position along u -> v (the model's input)
};


// A wire leaves its pad by TopoR's pattern (topo/PadExit.h): from the centre to the inner point half a
// width short of the end, and out through the end. Beyond a narrow end it goes on straight by its
// envelope: the taut path from the centre would cut the pad's own corner and brush the pad beside it.
// The wire is realised from the exit point; the stub joins it to the pad. Out of a wide end the exit
// point is the inner point: the stub is the lead from the centre and no more.
struct Stub {
  Vec2 from, mid, to;  // pad centre -> inner point -> exit point
  bool on = false;
  double free = 0;     // length of the stub the exit arc may take (from the inner point on)
  bool guard = true;   // the stub runs beyond the copper: its points are obstacles to the other wires
  int pad = -1;        // the board's pad the pattern is drawn in
};

struct RealizeInput {
  std::vector<Polyline> sketches;              // per wire, as drawn (a stub replaces its first points)
  std::vector<std::array<Stub, 2>> stubs;      // per wire
  SpatialIndex oidx;                           // the copper as it lies now (the chosen tracks are gone)
  std::map<LayerId, LayerObstacles> obstacles;
  std::vector<std::vector<EdgeHit>> hits;      // per wire, in path order
  std::map<LayerId, std::map<std::pair<int, int>, std::vector<std::pair<int, int>>>> edgeLists;  // edge (u, v) -> (wire, hit) in order
  std::map<LayerId, std::set<std::pair<int, int>>> cdtEdges;  // debug: obstacle pairs joined by an edge
};

// The stubs out of narrow pads and the sketches as the drawing wants them (from `wires`' sketches);
// fills `oidx` too.
void prepareStubs(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in);
// Draws the wires from the input: slots on the crossed edges, bends, tangents, arcs, tracks on the board.
RealizeStats drawRealized(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                          const RealizeOptions& opt, RealizeInput& in, RealizeStats st);
// The two halves of it: the drawing computed (the board is read only), and its tracks made.
struct DrawnWires;
void computeDrawn(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in, DrawnWires& d, RealizeStats& st);
// `dry`: nothing is put on the board — the counts, the length and the forces of the drawing alone.
RealizeStats emitDrawn(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias, const RealizeOptions& opt, RealizeInput& in,
                       const DrawnWires& d, RealizeStats st, bool dry = false);

}  // namespace xr::topo
