#pragma once
// Routing mesh: one constrained Delaunay triangulation shared by all copper layers.
// Vertices are pad centres and corners, via candidate sites, board outline points and the boundary
// points of routing keepouts and points along the wires kept on the board. Per-layer occupancy (which vertex is an obstacle on which layer) is
// kept by the router; keepouts block the edges along their boundary and the triangles inside them
// on their layers only.
#include <vector>

#include "core/Board.h"

namespace xr::topo {

enum class VKind { PadCenter, PadCorner, ViaSite, Outline, FixedVia, Keepout, Track };

struct MVertex {
  Vec2 p;
  VKind kind = VKind::ViaSite;
  int pad = -1;       // owning pad (PadCenter / PadCorner)
  int fixedVia = -1;  // board via index (FixedVia)
  int keepout = -1;   // board keepout index (Keepout)
  int track = -1;     // board track index (Track: a point along a wire kept on the board)
  int onlyNet = kNoNet;  // a via site reserved for one net (fanout site in front of a pad's end)
  int sitePad = -1;      // the pad a fanout site belongs to: nothing else passes between the two
  std::vector<int> tris;  // incident inside triangles
};

struct MTri {
  int v[3] = {-1, -1, -1};   // counter-clockwise (math orientation)
  int e[3] = {-1, -1, -1};   // e[i] = edge opposite v[i], i.e. (v[i+1], v[i+2])
  int nb[3] = {-1, -1, -1};  // neighbour across e[i] (-1 = none / outside)
  bool inside = false;
  LayerMask blocked = 0;  // layers on which the triangle lies inside a keepout area
};

struct MEdge {
  int v[2] = {-1, -1};  // canonical orientation v[0] -> v[1]
  int t[2] = {-1, -1};
  bool constrained = false;
  LayerMask blocked = 0;  // layers on which wires may not cross (keepout boundary, kept wire)
  int net = kNoNet;       // of a kept wire the edge runs along: its own net crosses it freely (a junction)
};

struct MeshOptions {
  double viaPitch = 0;      // nm, 0 = automatic
  double viaDiameter = 0;   // largest via used (nm)
  double clearance = 0;     // largest clearance (nm)
  bool viaSites = true;
};

class TopoMesh {
 public:
  void build(const Board& b, const MeshOptions& opt);

  std::vector<MVertex> verts;
  std::vector<MTri> tris;
  std::vector<MEdge> edges;
  std::vector<std::vector<int>> padVerts;  // pad index -> its vertices

  // Local index of edge `e` inside triangle `t` (0..2) or -1.
  int localEdge(int t, int e) const {
    for (int i = 0; i < 3; ++i)
      if (tris[t].e[i] == e) return i;
    return -1;
  }
  int localVertex(int t, int v) const {
    for (int i = 0; i < 3; ++i)
      if (tris[t].v[i] == v) return i;
    return -1;
  }
  // True if the triangle traverses edge e (local index le) in the canonical direction.
  bool sameDir(int t, int le) const {
    const MTri& T = tris[t];
    return T.v[(le + 1) % 3] == edges[T.e[le]].v[0];
  }
  int locate(Vec2 p) const;  // inside triangle containing p, or -1 (linear walk)
  // Inserts a vertex at p inside triangle t (a via placed on demand): t becomes (A, B, v) and two
  // triangles (B, C, v), (C, A, v) are appended with the three edges (A, v), (B, v), (C, v); the old
  // edges keep their indices. Returns the new vertex. The triangles' layer blocks are inherited.
  int splitTriangle(int t, Vec2 p, VKind kind);
  // Barycentric sanity: p strictly inside triangle t.
  bool strictlyInside(int t, Vec2 p) const;
  // Undoes splitTriangle for a vertex that still has exactly its three triangles: they merge back
  // into the first (which keeps the old index); the other two triangles, the three edges and the
  // vertex itself are left dead (inside = false, no triangles). Returns false when it cannot.
  bool unsplit(int v);
  bool dead(int t) const { return !tris[t].inside && tris[t].nb[0] == -1 && tris[t].e[0] == -1; }
};

}  // namespace xr::topo
