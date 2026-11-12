#pragma once
// The sides of a large polygon in a grid: the distance from a point or a segment to its boundary and the test
// of a point inside it look only at the sides near, with the answers of the plain loops over every side
// (distPointSegment / distSegmentSegment / pointInPolygon of Geometry.h are what is called, on fewer sides).
// A copper area's fill is polygons of tens of thousands of points, asked about by every track, via and pad near:
// the connectivity of a board with four pours took 130 ms of plain loops.
#include <limits>
#include <vector>

#include "geom/Geometry.h"

namespace xr {

class PolyIndex {
 public:
  explicit PolyIndex(Polyline poly);

  const BBox& bbox() const { return box_; }
  // As pointInPolygon(p, poly).
  bool contains(Vec2 p) const;
  // The least distance from the point / the segment to a side. With a `cutoff`: that distance when it is no
  // greater, else some value above it (the search stops once nothing nearer than the cutoff can be left).
  double distPoint(Vec2 p, double cutoff = std::numeric_limits<double>::max()) const;
  double distSegment(Vec2 a, Vec2 b, double cutoff = std::numeric_limits<double>::max()) const;

 private:
  template <class F>
  double nearest(const BBox& q, double cutoff, F&& toSide) const;

  Polyline poly_;
  BBox box_;
  double cell_ = 1;
  int nx_ = 1, ny_ = 1;
  std::vector<int> cellStart_, cellSides_;  // per cell: the sides whose box touches it (side i: poly[i-1] - poly[i])
  std::vector<int> rowStart_, rowSides_;    // per row of cells: the sides whose span of y touches it
};

}  // namespace xr
