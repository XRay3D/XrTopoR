#include "geom/Shape.h"

#include <algorithm>
#include <limits>

namespace xr {

Shape Shape::circle(Vec2 c, double r) {
  Shape s;
  s.kind = Kind::Point;
  s.a = s.b = c;
  s.r = r;
  return s;
}

Shape Shape::capsule(Vec2 a, Vec2 b, double r) {
  if ((a - b).len2() < 1e-6) return circle(a, r);
  Shape s;
  s.kind = Kind::Segment;
  s.a = a;
  s.b = b;
  s.r = r;
  return s;
}

Shape Shape::polygon(Polyline p, double r) {
  Shape s;
  s.kind = Kind::Polygon;
  s.poly = std::move(p);
  s.r = r;
  if (!s.poly.empty()) s.a = s.b = s.poly[0];
  return s;
}

Shape Shape::indexedPolygon(Polyline p, double r) {
  Shape s = polygon(std::move(p), r);
  if (s.poly.size() >= 48) s.index = std::make_shared<const PolyIndex>(s.poly);
  return s;
}

Shape Shape::rect(Vec2 c, double w, double h, double angle, double cr) {
  cr = std::clamp(cr, 0.0, std::min(w, h) / 2);
  double hw = w / 2 - cr, hh = h / 2 - cr;
  if (hw <= 1e-6 && hh <= 1e-6) return circle(c, cr);
  if (hw <= 1e-6) return capsule(c + Vec2(0, -hh).rotated(angle), c + Vec2(0, hh).rotated(angle), cr);
  if (hh <= 1e-6) return capsule(c + Vec2(-hw, 0).rotated(angle), c + Vec2(hw, 0).rotated(angle), cr);
  Polyline p = {Vec2(-hw, -hh), Vec2(hw, -hh), Vec2(hw, hh), Vec2(-hw, hh)};
  for (auto& v : p) v = c + v.rotated(angle);
  return polygon(std::move(p), cr);
}

BBox Shape::bbox() const {
  BBox b;
  switch (kind) {
    case Kind::Point: b.add(a); break;
    case Kind::Segment: b.add(a); b.add(this->b); break;
    case Kind::Polygon:
      if (index) b = index->bbox();
      else
        for (auto& v : poly) b.add(v);
      break;
  }
  return b.inflated(r);
}

Vec2 Shape::center() const {
  switch (kind) {
    case Kind::Point: return a;
    case Kind::Segment: return (a + b) * 0.5;
    case Kind::Polygon: {
      Vec2 c;
      for (auto& v : poly) c += v;
      return poly.empty() ? c : c / double(poly.size());
    }
  }
  return a;
}

double Shape::coreDistance(Vec2 p) const {
  switch (kind) {
    case Kind::Point: return (p - a).len();
    case Kind::Segment: return distPointSegment(p, a, b);
    case Kind::Polygon: return index ? (index->contains(p) ? 0.0 : index->distPoint(p)) : distPointPolygon(p, poly);
  }
  return 0;
}

namespace {

constexpr double kNoCutoff = std::numeric_limits<double>::max();

// As distPointPolygon / distSegmentPolygon / distPolygonPolygon, the polygon's sides from its index; exact up to
// the cutoff (of the cores' distance).
double indexedToPoint(const PolyIndex& ix, Vec2 p, double cutoff) { return ix.contains(p) ? 0.0 : ix.distPoint(p, cutoff); }

double indexedToSegment(const PolyIndex& ix, Vec2 s0, Vec2 s1, double cutoff) {
  if (ix.contains(s0) || ix.contains(s1)) return 0;
  return ix.distSegment(s0, s1, cutoff);
}

double indexedToPolygon(const PolyIndex& ix, const Polyline& big, const Polyline& small, double cutoff) {
  if (!small.empty() && ix.contains(small[0])) return 0;
  if (small.size() >= 3 && !big.empty() && pointInPolygon(big[0], small)) return 0;
  double d = kNoCutoff;
  const size_t n = small.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) {
    d = std::min(d, indexedToSegment(ix, small[j], small[i], cutoff));
    if (d <= 0) break;
  }
  return d;
}

}  // namespace

double Shape::distanceToSegment(Vec2 s0, Vec2 s1) const {
  double d = 0;
  switch (kind) {
    case Kind::Point: d = distPointSegment(a, s0, s1); break;
    case Kind::Segment: d = distSegmentSegment(a, b, s0, s1); break;
    case Kind::Polygon: d = index ? indexedToSegment(*index, s0, s1, kNoCutoff) : distSegmentPolygon(s0, s1, poly); break;
  }
  return d - r;
}

double Shape::distance(const Shape& o) const { return distance(o, kNoCutoff); }

double Shape::distance(const Shape& o, double cutoff) const {
  // (The cutoff is of the shapes' distance: the cores are further apart by the two radii.)
  const double coreCut = cutoff < kNoCutoff ? cutoff + r + o.r : kNoCutoff;
  double d = 0;
  if (o.kind == Kind::Point) {
    d = index ? indexedToPoint(*index, o.a, coreCut) : coreDistance(o.a);
  } else if (kind == Kind::Point) {
    d = o.index ? indexedToPoint(*o.index, a, coreCut) : o.coreDistance(a);
  } else if (o.kind == Kind::Segment) {
    d = index ? indexedToSegment(*index, o.a, o.b, coreCut) : distanceToSegment(o.a, o.b) + r;
  } else if (kind == Kind::Segment) {
    d = o.index ? indexedToSegment(*o.index, a, b, coreCut) : o.distanceToSegment(a, b) + o.r;
  } else if (index) {
    d = indexedToPolygon(*index, poly, o.poly, coreCut);
  } else if (o.index) {
    d = indexedToPolygon(*o.index, o.poly, poly, coreCut);
  } else {
    d = distPolygonPolygon(poly, o.poly);
  }
  return d - r - o.r;
}

Polyline Shape::outline(double tol) const {
  Polyline out;
  auto addArc = [&](Vec2 c, double a0, double sweep) {
    if (r <= 0) { out.push_back(c); return; }
    auto arc = ArcGeom::fromCenter(c, c + Vec2(std::cos(a0), std::sin(a0)) * r, sweep);
    auto pts = arc.tessellate(tol);
    out.insert(out.end(), pts.begin(), pts.end());
  };
  switch (kind) {
    case Kind::Point: {
      addArc(a, 0, 2 * kPi);
      if (!out.empty()) out.pop_back();
      break;
    }
    case Kind::Segment: {
      Vec2 d = (b - a).normalized();
      double ang = std::atan2(d.y, d.x);
      addArc(b, ang - kPi / 2, kPi);
      addArc(a, ang + kPi / 2, kPi);
      break;
    }
    case Kind::Polygon: {
      if (r <= 0) { out = poly; break; }
      Polyline p = poly;
      if (polygonArea(p) < 0) r::reverse(p);
      size_t n = p.size();
      for (size_t i = 0; i < n; ++i) {
        Vec2 prev = p[(i + n - 1) % n], cur = p[i], next = p[(i + 1) % n];
        Vec2 d0 = (cur - prev).normalized(), d1 = (next - cur).normalized();
        double a0 = std::atan2(d0.y, d0.x) - kPi / 2;
        double a1 = std::atan2(d1.y, d1.x) - kPi / 2;
        double sweep = normalizeAngle(a1 - a0);
        if (sweep > kPi) sweep = 0;  // concave corner
        addArc(cur, a0, sweep);
      }
      break;
    }
  }
  return out;
}

double Shape::rayExit(Vec2 p, Vec2 d) const {
  if (!contains(p)) return 0;
  BBox bb = bbox();
  double hi = std::hypot(bb.width(), bb.height()) + 1;
  double lo = 0;
  for (int i = 0; i < 40; ++i) {
    double m = (lo + hi) / 2;
    if (contains(p + d * m)) lo = m; else hi = m;
  }
  return hi;
}

}  // namespace xr
