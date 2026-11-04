#pragma once
// The dynamic side of a layer's triangulation: an edge flip that keeps the wires' crossings, and the
// Lawson loop that takes the mesh to the Delaunay fixed point (TopoR's jog_pair_bfs).
#include <functional>
#include <vector>

#include "topo/Topology.h"

namespace xr::topo {

// Whether edge e may be flipped: not constrained, two inside triangles that are not blocked, a strictly
// convex quad. `gate`, when given, may refuse more (the new diagonal would run through an owner's copper).
bool flippable(const LayerMesh& m, int e, const std::function<bool(int e, int a, int b)>& gate = {});

// Flips e to the other diagonal of its quad. Triangle and edge indices stay: e becomes (a, b), e's first
// triangle (a, p, b), its second (a, b, q), where (a, p, q) and (b, q, p) were the two. The crossings of
// the wires through the quad move with it (none yet: the wires come later). False when not flippable.
bool flip(LayerMesh& m, int e, const std::function<bool(int e, int a, int b)>& gate = {});

// b strictly inside the circumcircle of the counter-clockwise triangle (a, p, q): the edge (p, q) is not
// locally Delaunay. Exact (CGAL's predicate).
bool inCircle(Vec2 a, Vec2 p, Vec2 q, Vec2 b);

// Lawson's loop from the seed edges (all of them when empty): every edge that is not locally Delaunay is
// flipped and its quad's sides queued, until none is left. Returns the number of flips.
int flipLoop(LayerMesh& m, std::vector<int> seed = {}, const std::function<bool(int e, int a, int b)>& gate = {});

}  // namespace xr::topo
