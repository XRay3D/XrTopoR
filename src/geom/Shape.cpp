#include "geom/Shape.h"

#include <algorithm>
#include <cmath>
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

Shape Shape::arcOf(const ArcCurve& arc, double r) {
  Shape s;
  s.kind = Kind::Arc;
  s.arc = arc;
  s.a = arc.start();
  s.b = arc.end();
  s.r = r;
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
    case Kind::Arc: b = arc.bbox(); break;
  }
  return b.inflated(r);
}

Vec2 Shape::center() const {
  switch (kind) {
    case Kind::Point: return a;
    case Kind::Segment: return (a + b) * 0.5;
    case Kind::Arc: return arc.mid();
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
    case Kind::Arc: return distPointArc(p, arc);
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
    case Kind::Arc: d = distSegmentArc(s0, s1, arc); break;
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
  } else if (kind == Kind::Arc && o.kind == Kind::Arc) {
    d = distArcArc(arc, o.arc);
  } else if (kind == Kind::Arc || o.kind == Kind::Arc) {
    // An arc and a polygon: nought when the arc starts inside it, else the least to a side — of an indexed
    // polygon (a fill) the sides near the arc, within the cutoff.
    const Shape& pg = kind == Kind::Arc ? o : *this;
    const ArcCurve& ac = kind == Kind::Arc ? arc : o.arc;
    if (pg.coreDistance(ac.start()) <= 0) {
      d = 0;
    } else {
      d = kNoCutoff;
      const Polyline& pts = pg.poly;
      const size_t n = pts.size();
      auto side = [&](size_t i) { d = std::min(d, distSegmentArc(pts[i ? i - 1 : n - 1], pts[i], ac)); };
      if (pg.index && coreCut < kNoCutoff) pg.index->eachSideNear(ac.bbox().inflated(coreCut), side);
      else
        for (size_t i = 0; i < n; ++i) side(i);
    }
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
    case Kind::Arc: {
      // Round the arc at its half-width: the outer side, the cap at the end, the inner side back, the cap at the start.
      const double sg = arc.sweep >= 0 ? 1.0 : -1.0;
      auto along = [&](double radius, bool back) {
        if (radius <= 0) { out.push_back(arc.c); return; }
        const double from = back ? arc.a0 + arc.sweep : arc.a0;
        auto g = ArcGeom::fromCenter(arc.c, arc.c + Vec2(std::cos(from), std::sin(from)) * radius, back ? -arc.sweep : arc.sweep);
        auto pts = g.tessellate(tol);
        out.insert(out.end(), pts.begin(), pts.end());
      };
      along(arc.R + sg * r, false);
      addArc(arc.end(), arc.a0 + arc.sweep, sg * kPi);
      along(arc.R - sg * r, true);
      addArc(arc.start(), arc.a0 + kPi, sg * kPi);
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

namespace {

// The greatest t >= 0 with p + t d (d a unit vector) in the disc / in the rectangle of half-width R along a - b /
// on a side of the polygon; negative when the ray misses it.
double exitDisc(Vec2 c, double R, Vec2 p, Vec2 d) {
  const Vec2 m = p - c;
  const double bq = m.dot(d), disc = bq * bq - (m.len2() - R * R);
  return disc < 0 ? -1.0 : -bq + std::sqrt(disc);
}

double exitBar(Vec2 a, Vec2 b, double R, Vec2 p, Vec2 d) {
  const double L = (b - a).len();
  if (L <= 0) return -1.0;
  const Vec2 u = (b - a) / L, n = u.perp();
  double lo = 0, hi = std::numeric_limits<double>::max();
  auto slab = [&](double x, double v, double x0, double x1) {  // x + t v within [x0, x1]
    if (v == 0) return x >= x0 && x <= x1;
    double t0 = (x0 - x) / v, t1 = (x1 - x) / v;
    if (t0 > t1) std::swap(t0, t1);
    lo = std::max(lo, t0);
    hi = std::min(hi, t1);
    return lo <= hi;
  };
  if (!slab((p - a).dot(u), d.dot(u), 0, L) || !slab((p - a).dot(n), d.dot(n), -R, R)) return -1.0;
  return hi;
}

double exitCapsule(Vec2 a, Vec2 b, double R, Vec2 p, Vec2 d) { return std::max({exitDisc(a, R, p, d), exitDisc(b, R, p, d), exitBar(a, b, R, p, d)}); }

bool convex(const Polyline& poly) {
  const size_t n = poly.size();
  if (n < 3) return false;
  int sign = 0;
  for (size_t i = 0; i < n; ++i) {
    const double o = orient(poly[i], poly[(i + 1) % n], poly[(i + 2) % n]);
    if (o == 0) continue;
    if (sign == 0) sign = o > 0 ? 1 : -1;
    else if ((o > 0) != (sign > 0)) return false;
  }
  return sign != 0;
}

}  // namespace

// Where the ray leaves the shape. A disc, a capsule and a convex polygon with its rounding are convex: the ray
// from a point inside leaves once, at the furthest point of the ray in any of the pieces the shape is the union
// of (the discs at the ends or corners, the bars along the sides, the polygon itself) — by the formula. (It was
// forty halvings of the ray, each a distance from the point to the shape: a tenth of F7's instructions, asked by
// the capacity of every edge at both its ends.) A polygon that is not convex may be left and entered again:
// there the halving stays.
double Shape::rayExit(Vec2 p, Vec2 d) const {
  if (!contains(p)) return 0;
  switch (d.len2() > 0.25 ? kind : Kind(-1)) {  // (no direction: the halving's answer, the shape's size)
    case Kind::Point: return std::max(0.0, exitDisc(a, r, p, d));
    case Kind::Segment: return std::max(0.0, exitCapsule(a, b, r, p, d));
    case Kind::Polygon:
      if (!convex(poly)) break;
      {
        double t = -1.0;
        const size_t n = poly.size();
        for (size_t i = 0, j = n - 1; i < n; j = i++) {
          // The side crossed: p + t d = poly[j] + s (poly[i] - poly[j]), 0 <= s <= 1.
          const Vec2 e = poly[i] - poly[j], w = poly[j] - p;
          if (const double den = d.cross(e); den != 0) {
            const double ts = w.cross(e) / den, ss = w.cross(d) / den;
            if (ss >= 0 && ss <= 1) t = std::max(t, ts);
          }
          if (r > 0) t = std::max(t, exitCapsule(poly[j], poly[i], r, p, d));
        }
        return std::max(0.0, t);
      }
    default: break;
  }
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
