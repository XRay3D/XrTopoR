#pragma once
// Boost.Geometry for the copper's polygons (the pours, the areas made of wires): the types and the few operations
// both use. Internal to core: not for headers others include.
#include <boost/geometry.hpp>
#include <boost/geometry/geometries/linestring.hpp>
#include <boost/geometry/geometries/multi_polygon.hpp>
#include <boost/geometry/geometries/point_xy.hpp>
#include <boost/geometry/geometries/polygon.hpp>

#include <vector>

#include "geom/Geometry.h"

namespace xr::bgeo {

namespace bg = boost::geometry;

using BPt = bg::model::d2::point_xy<double>;
using BPoly = bg::model::polygon<BPt>;  // clockwise outer, closed
using BMulti = bg::model::multi_polygon<BPoly>;

inline BPoly toPoly(const Polyline& pl) {
  BPoly p;
  for (auto& v : pl) p.outer().push_back({v.x, v.y});
  if (!pl.empty()) p.outer().push_back({pl.front().x, pl.front().y});
  bg::correct(p);
  return p;
}

inline BMulti toMulti(const Polyline& pl) {
  BMulti m;
  if (pl.size() >= 3) m.push_back(toPoly(pl));
  return m;
}

// Union of many polygons by pairwise merging (much faster than folding one by one).
inline BMulti unionAll(std::vector<BMulti> parts) {
  if (parts.empty()) return {};
  while (parts.size() > 1) {
    std::vector<BMulti> next;
    for (size_t i = 0; i + 1 < parts.size(); i += 2) {
      BMulti u;
      bg::union_(parts[i], parts[i + 1], u);
      next.push_back(std::move(u));
    }
    if (parts.size() % 2) next.push_back(std::move(parts.back()));
    parts = std::move(next);
  }
  return std::move(parts.front());
}

inline BMulti grow(const BMulti& m, double d) {
  if (m.empty() || d == 0) return m;
  BMulti out;
  bg::strategy::buffer::distance_symmetric<double> dist(d);
  bg::strategy::buffer::join_round join(16);
  bg::strategy::buffer::end_round end(16);
  bg::strategy::buffer::point_circle circle(16);
  bg::strategy::buffer::side_straight side;
  bg::buffer(m, out, dist, side, join, end, circle);
  return out;
}

inline Polyline ringToPolyline(const bg::model::ring<BPt>& r) {
  Polyline pl;
  for (size_t i = 0; i + 1 < r.size(); ++i) pl.push_back({r[i].x(), r[i].y()});
  return pl;
}

}  // namespace xr::bgeo
