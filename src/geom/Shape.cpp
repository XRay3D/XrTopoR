#include "geom/Shape.h"

#include <algorithm>

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
    case Kind::Polygon: for (auto& v : poly) b.add(v); break;
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
    case Kind::Polygon: return distPointPolygon(p, poly);
  }
  return 0;
}

double Shape::distanceToSegment(Vec2 s0, Vec2 s1) const {
  double d = 0;
  switch (kind) {
    case Kind::Point: d = distPointSegment(a, s0, s1); break;
    case Kind::Segment: d = distSegmentSegment(a, b, s0, s1); break;
    case Kind::Polygon: d = distSegmentPolygon(s0, s1, poly); break;
  }
  return d - r;
}

double Shape::distance(const Shape& o) const {
  double d = 0;
  if (o.kind == Kind::Point) {
    d = coreDistance(o.a);
  } else if (kind == Kind::Point) {
    d = o.coreDistance(a);
  } else if (o.kind == Kind::Segment) {
    d = distanceToSegment(o.a, o.b) + r;
  } else if (kind == Kind::Segment) {
    d = o.distanceToSegment(a, b) + o.r;
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
