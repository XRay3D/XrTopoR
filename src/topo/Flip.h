#pragma once
// The dynamic side of a layer's triangulation: an edge flip that carries the wires' crossings over to the
// new diagonal (TopoR's 102300), and Lawson's loop to the Delaunay fixed point weighted by what the edges
// carry (jog_pair_bfs with the width-aware test).
#include <functional>
#include <vector>

#include "topo/Capacity.h"
#include "topo/Topology.h"

namespace xr::topo {

// May refuse a flip: the new diagonal (a, b) of edge e.
using FlipGate = std::function<bool(int e, int a, int b)>;

// Whether edge e may be flipped: not constrained or rigid, two inside triangles that are not blocked, a
// strictly convex quad, and the new diagonal clear of the copper of the two old end owners.
bool flippable(const Topology& t, const LayerMesh& m, int e, const FlipGate& gate = {});
// While true (a thread's own), a flip may leave its new diagonal through the copper of the old one's ends: a vertex
// being taken out of the mesh has to lose its spokes, and beside a row of pads every way to do it runs a diagonal
// past a pad nearer than the pad is wide (the triangulation of a board built anew has such edges too).
bool& flipsThroughCopper();

// What a flip of e would do to the wires: the crossings of the new diagonal in order.
struct FlipPlan {
  int a = -1, p = -1, q = -1, b = -1;  // the quad: e = (p, q), T1 = (a, p, q), T2 = (b, q, p)
  struct Run {
    int wire;
    int oldCid;    // the crossing of e it replaces, or -1
    int insertAt;  // where in Wire::cross a new crossing goes (before this index)
    double posP, posQ;
  };
  std::vector<Run> diag;            // ordered from a to b
  std::vector<int> erase;           // crossings of e that vanish
  int along = -1;                   // the wire that will run along (a, b)
  std::vector<int> wires;           // of `diag`, in order (for capacityOf)
};
bool planFlip(const Topology& t, const LayerMesh& m, int e, FlipPlan& plan, const FlipGate& gate = {});

// Flips e to the other diagonal of its quad. Triangle and edge indices stay: e becomes (a, b), e's first
// triangle (a, p, b), its second (a, b, q). The wires through the quad keep their order; the crossings of e
// that no longer cross go, the chords that now cross (a, b) get crossings. False when not flippable.
bool flip(Topology& t, LayerMesh& m, int e, const FlipGate& gate = {});

// b strictly inside the circumcircle of the counter-clockwise triangle (a, p, q). Exact (CGAL's predicate).
bool inCircle(Vec2 a, Vec2 p, Vec2 q, Vec2 b);

// How full an edge is: what its wires need over what it has (0 with no wires).
double load(const EdgeCapacity& c);

// Lawson's loop from the seed edges (all of them when empty): an edge is flipped when it is not locally
// Delaunay — or, `weighted`, when the new diagonal would be less loaded than it (need over free length),
// the in-circle test deciding among equals; the quad's sides are queued after a flip. Returns the number
// of flips.
int flipLoop(Topology& t, LayerMesh& m, std::vector<int> seed = {}, const FlipGate& gate = {}, bool weighted = false);

}  // namespace xr::topo
