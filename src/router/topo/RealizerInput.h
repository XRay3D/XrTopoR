#pragma once
// The realiser's input as the drawing sees it: the obstacles of every layer, every wire's crossings of
// the edges between them in order, the wires' order on every crossed edge, the sketches and the stubs out
// of narrow pads. realize() derives all of it from the sketches (its own triangulation, a walk, the
// topological order); the model fills it from its meshes and hands it to drawRealized().
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

struct OPt {
  Vec2 p;
  double r = 0;
  double clr = 0;
  int net = kNoNet;
  int shape = -1;  // index into LayerObstacles::shapes: the copper the point belongs to (pads)
  int via = -1;    // the board via this point is (for the squeeze report)
  int owner = -1;  // the model's owner the point belongs to (the model's input only)
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

}  // namespace xr::topo
