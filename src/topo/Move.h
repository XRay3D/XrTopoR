#pragma once
// The owners on the move: a via or a branch point shifted by F7 takes its vertices with it and the
// triangulation follows with flips (the wires keep their crossings, the flips carry them); a new via's
// vertex splits the triangle it lands in (the chords through it cross the new edges); a vertex no wire
// ends at goes, its star flipped down to three edges and merged into one triangle.
#include "topo/Flip.h"
#include "topo/Topology.h"

namespace xr::topo {

// Moves the owner by d: its centre, its copper, its branch point, the exits of the wires ending at it,
// and its vertices on every layer. The move goes in steps, each as far as every incident triangle stays
// counter-clockwise, with Lawson's loop over the star between them; a constrained or rigid edge in the
// way stops it. Returns the fraction of d that went (1: all of it).
double moveOwner(Topology& t, int owner, Vec2 d, const FlipGate& gate = {}, int rounds = 8);
// Turns an owner's axis (a clasp across its pair) to `axis`, its centre standing: the vertices at t slide to
// c + axis * t, as far as the triangles allow, as moveOwner steps. Returns the part of the turn made.
double reshapeOwner(Topology& t, int owner, Vec2 axis, const FlipGate& gate = {}, int rounds = 8);

// Puts a vertex of the owner (at its axis position `at`, offset `off`) into the layer's mesh: inside a
// triangle it splits it in three; on an unconstrained edge the degenerate piece is flipped away. The
// chords through the split triangle cross the new edges in their order. Returns the vertex, or -1 when
// the point is outside the mesh, on a vertex, or on an edge that cannot be split. `lawson` false leaves
// the mesh as split (an insertion undone by a removal then gives the mesh back exactly).
int insertVertex(Topology& t, LayerMesh& m, int owner, double at = 0, Vec2 off = {}, bool lawson = true);
// Adds the owner to the table with a vertex on every layer it is on; -1 when any layer refuses (the
// owner is then not added).
int insertOwner(Topology& t, Owner o, bool lawson = true);

// Takes a vertex out that no wire ends at: the star is flipped down to three edges and merged into one
// triangle, the crossings of the three spokes go (a wire that came back over an edge loses the pair).
// False, and nothing changed, when a wire ends there; false after some flips when the star cannot be
// reduced (a constrained or rigid edge, copper in the way of every flip).
bool removeVertex(Topology& t, LayerMesh& m, int v, bool lawson = true);
// Takes an owner with one vertex per layer (a via, a branch point) out of every mesh; it keeps its slot in
// the table with no layers.
bool removeOwner(Topology& t, int owner, bool lawson = true);

// The edges around a vertex: its spokes and the far sides of its triangles (Lawson's seed after a move).
std::vector<int> starEdges(const LayerMesh& m, int v);

}  // namespace xr::topo
