#pragma once
// The sides of a large polygon in a grid: the distance from a point or a segment to its boundary and the test
// of a point inside it look only at the sides near, with the answers of the plain loops over every side
// (distPointSegment / distSegmentSegment / pointInPolygon of Geometry.h are what is called, on fewer sides).
// A copper area's fill is polygons of tens of thousands of points, asked about by every track, via and pad near:
// the connectivity of a board with four pours took 130 ms of plain loops.
#include <algorithm>
#include <cmath>
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
  // The sides whose boxes may meet `q`, handed over by their numbers (side i: poly[i-1] - poly[i]); some twice.
  template <class F>
  void eachSideNear(const BBox& q, F&& fn) const {
    if (poly_.empty() || !q.valid()) return;
    auto cellOf = [&](double v, double lo, int n) { return std::clamp(int(std::floor((v - lo) / cell_)), 0, n - 1); };
    const int x0 = cellOf(q.minX, box_.minX, nx_), x1 = cellOf(q.maxX, box_.minX, nx_);
    const int y0 = cellOf(q.minY, box_.minY, ny_), y1 = cellOf(q.maxY, box_.minY, ny_);
    for (int y = y0; y <= y1; ++y)
      for (int x = x0; x <= x1; ++x) {
        const size_t c = size_t(y) * size_t(nx_) + size_t(x);
        for (int k = cellStart_[c]; k < cellStart_[c + 1]; ++k) fn(size_t(cellSides_[size_t(k)]));
      }
  }

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
