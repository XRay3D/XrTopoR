#pragma once
// A constrained Delaunay triangulation of points with constraint segments, as plain arrays: the CGAL
// object is built, read out and discarded. Shared by the topological model and the router's mesh.
#include <utility>
#include <vector>

#include "geom/Geometry.h"

namespace xr::topo {

struct CdtInput {
  std::vector<Vec2> points;
  std::vector<std::pair<int, int>> constraints;  // point indices
  // Per constraint: 1 separates the inside of the domain from the outside (the board outline), 0 is a
  // wall inside it (a keepout), 2 is a rigid edge of the triangulation that may be crossed (a pad's side).
  std::vector<char> border;
};

struct CdtTri {
  int v[3];   // point indices, counter-clockwise
  int nb[3];  // neighbour across the edge opposite v[i] (-1: none)
  bool inside;
};

struct CdtEdge {
  int v[2];  // v[0] < v[1]
  bool constrained;  // a border or a wall
  bool rigid;        // a pad's side: kept in the triangulation, crossed by its own net
};

struct CdtResult {
  std::vector<int> alias;       // per input point: the point it coincides with (-1: itself)
  std::vector<Vec2> extra;      // points the constraint intersections created (indices follow the input)
  std::vector<CdtTri> tris;
  std::vector<CdtEdge> edges;
  std::vector<std::array<int, 3>> triEdges;  // per triangle: edge opposite v[i]
};

CdtResult triangulate(const CdtInput& in);

}  // namespace xr::topo
