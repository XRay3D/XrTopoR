#include "geom/Geometry.h"

#include <algorithm>

namespace xr {

double orient(Vec2 a, Vec2 b, Vec2 c) { return (b - a).cross(c - a); }

Vec2 closestPointOnSegment(Vec2 p, Vec2 a, Vec2 b) {
  Vec2 ab = b - a;
  double l2 = ab.len2();
  if (l2 <= 0) return a;
  double t = std::clamp((p - a).dot(ab) / l2, 0.0, 1.0);
  return a + ab * t;
}

double distPointSegment(Vec2 p, Vec2 a, Vec2 b) { return (p - closestPointOnSegment(p, a, b)).len(); }

static bool onSegment(Vec2 a, Vec2 b, Vec2 p) {
  return std::min(a.x, b.x) <= p.x && p.x <= std::max(a.x, b.x) && std::min(a.y, b.y) <= p.y &&
         p.y <= std::max(a.y, b.y);
}

bool segmentsIntersect(Vec2 a, Vec2 b, Vec2 c, Vec2 d) {
  double d1 = orient(c, d, a), d2 = orient(c, d, b), d3 = orient(a, b, c), d4 = orient(a, b, d);
  if (((d1 > 0 && d2 < 0) || (d1 < 0 && d2 > 0)) && ((d3 > 0 && d4 < 0) || (d3 < 0 && d4 > 0))) return true;
  if (d1 == 0 && onSegment(c, d, a)) return true;
  if (d2 == 0 && onSegment(c, d, b)) return true;
  if (d3 == 0 && onSegment(a, b, c)) return true;
  if (d4 == 0 && onSegment(a, b, d)) return true;
  return false;
}

double distSegmentSegment(Vec2 a, Vec2 b, Vec2 c, Vec2 d) {
  if (segmentsIntersect(a, b, c, d)) return 0;
  return std::min({distPointSegment(a, c, d), distPointSegment(b, c, d), distPointSegment(c, a, b),
                   distPointSegment(d, a, b)});
}

bool pointInPolygon(Vec2 p, const Polyline& poly) {
  bool in = false;
  size_t n = poly.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) {
    const Vec2& a = poly[i];
    const Vec2& b = poly[j];
    if ((a.y > p.y) != (b.y > p.y)) {
      double x = (b.x - a.x) * (p.y - a.y) / (b.y - a.y) + a.x;
      if (p.x < x) in = !in;
    }
  }
  return in;
}

double polygonArea(const Polyline& poly) {
  double s = 0;
  size_t n = poly.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) s += poly[j].cross(poly[i]);
  return s / 2;
}

// Hole bridging as in Eberly's ear-clipping notes: holes are merged right to left; a ray from the
// hole's rightmost vertex M towards +x hits the current outer contour at I on edge (A, B); the bridge
// goes to the edge end point P with the larger x, or to the reflex vertex inside triangle (M, I, P)
// with the smallest angle to the ray. Holes still to be merged lie left of M, so no bridge crosses one.
Polyline fracture(const Polyline& outer, std::vector<Polyline> holes) {
  Polyline res = outer;
  if (polygonArea(res) < 0) std::reverse(res.begin(), res.end());
  auto maxX = [](const Polyline& h) {
    double m = std::numeric_limits<double>::lowest();
    for (auto& v : h) m = std::max(m, v.x);
    return m;
  };
  std::erase_if(holes, [](const Polyline& h) { return h.size() < 3; });
  std::sort(holes.begin(), holes.end(), [&](const Polyline& a, const Polyline& b) { return maxX(a) > maxX(b); });
  for (auto& h0 : holes) {
    Polyline h = h0;
    if (polygonArea(h) > 0) std::reverse(h.begin(), h.end());  // holes clockwise
    size_t mi = 0;
    for (size_t j = 1; j < h.size(); ++j)
      if (h[j].x > h[mi].x || (h[j].x == h[mi].x && h[j].y < h[mi].y)) mi = j;
    Vec2 M = h[mi];
    // Nearest edge hit by the ray M + t * (1, 0).
    size_t n = res.size();
    double bestT = std::numeric_limits<double>::max();
    size_t edge = n;
    Vec2 I;
    for (size_t k = 0; k < n; ++k) {
      Vec2 a = res[k], b = res[(k + 1) % n];
      if ((a.y > M.y) == (b.y > M.y) && a.y != M.y && b.y != M.y) continue;
      if (a.y == b.y) {
        if (a.y != M.y) continue;
        double t = std::min(a.x, b.x) - M.x;
        if (t >= 0 && t < bestT) { bestT = t; edge = k; I = {M.x + t, M.y}; }
        continue;
      }
      double x = a.x + (M.y - a.y) * (b.x - a.x) / (b.y - a.y);
      double t = x - M.x;
      if (t >= 0 && t < bestT) { bestT = t; edge = k; I = {x, M.y}; }
    }
    size_t pi;
    if (edge == n) {  // degenerate (hole outside the contour): nearest vertex
      pi = 0;
      for (size_t k = 1; k < n; ++k)
        if ((res[k] - M).len2() < (res[pi] - M).len2()) pi = k;
    } else {
      size_t ka = edge, kb = (edge + 1) % n;
      pi = res[ka].x > res[kb].x ? ka : kb;
      Vec2 P = res[pi];
      if (!(I == P)) {
        // Vertices strictly inside triangle (M, I, P) would block the view: take the best of them.
        double bestAng = std::numeric_limits<double>::max();
        for (size_t k = 0; k < n; ++k) {
          Vec2 v = res[k];
          if (k == pi) continue;
          double o1 = orient(M, I, v), o2 = orient(I, P, v), o3 = orient(P, M, v);
          bool inside = (o1 > 0 && o2 > 0 && o3 > 0) || (o1 < 0 && o2 < 0 && o3 < 0);
          if (!inside) continue;
          double ang = std::atan2(std::abs(v.y - M.y), v.x - M.x);
          if (ang < bestAng || (ang == bestAng && (v - M).len2() < (res[pi] - M).len2())) {
            bestAng = ang;
            pi = k;
          }
        }
      }
    }
    Polyline merged;
    merged.reserve(res.size() + h.size() + 2);
    merged.insert(merged.end(), res.begin(), res.begin() + long(pi) + 1);
    for (size_t k = 0; k <= h.size(); ++k) merged.push_back(h[(mi + k) % h.size()]);
    merged.insert(merged.end(), res.begin() + long(pi), res.end());
    res = std::move(merged);
  }
  return res;
}

double distPointPolygon(Vec2 p, const Polyline& poly) {
  if (poly.empty()) return std::numeric_limits<double>::max();
  if (poly.size() >= 3 && pointInPolygon(p, poly)) return 0;
  double d = std::numeric_limits<double>::max();
  size_t n = poly.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) d = std::min(d, distPointSegment(p, poly[j], poly[i]));
  return d;
}

double distSegmentPolygon(Vec2 a, Vec2 b, const Polyline& poly) {
  if (poly.size() >= 3 && (pointInPolygon(a, poly) || pointInPolygon(b, poly))) return 0;
  double d = std::numeric_limits<double>::max();
  size_t n = poly.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) d = std::min(d, distSegmentSegment(a, b, poly[j], poly[i]));
  return d;
}

double distPolygonPolygon(const Polyline& a, const Polyline& b) {
  if (a.size() >= 3 && !b.empty() && pointInPolygon(b[0], a)) return 0;
  if (b.size() >= 3 && !a.empty() && pointInPolygon(a[0], b)) return 0;
  double d = std::numeric_limits<double>::max();
  size_t n = a.size();
  for (size_t i = 0, j = n - 1; i < n; j = i++) d = std::min(d, distSegmentPolygon(a[j], a[i], b));
  return d;
}

double normalizeAngle(double a) {
  a = std::fmod(a, 2 * kPi);
  if (a < 0) a += 2 * kPi;
  return a;
}

ArcGeom ArcGeom::fromThreePoints(Vec2 s, Vec2 m, Vec2 e) {
  ArcGeom g;
  double ax = s.x, ay = s.y, bx = m.x, by = m.y, cx = e.x, cy = e.y;
  double d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by));
  if (std::abs(d) < 1e-9) return g;
  double a2 = ax * ax + ay * ay, b2 = bx * bx + by * by, c2 = cx * cx + cy * cy;
  g.center = {(a2 * (by - cy) + b2 * (cy - ay) + c2 * (ay - by)) / d,
              (a2 * (cx - bx) + b2 * (ax - cx) + c2 * (bx - ax)) / d};
  g.radius = (s - g.center).len();
  g.startAngle = std::atan2(s.y - g.center.y, s.x - g.center.x);
  double am = normalizeAngle(std::atan2(m.y - g.center.y, m.x - g.center.x) - g.startAngle);
  double ae = normalizeAngle(std::atan2(e.y - g.center.y, e.x - g.center.x) - g.startAngle);
  // Counter-clockwise if the mid point comes before the end point going CCW.
  g.sweep = (am < ae) ? ae : ae - 2 * kPi;
  g.valid = g.radius > 0;
  return g;
}

ArcGeom ArcGeom::fromCenter(Vec2 c, Vec2 s, double sweep) {
  ArcGeom g;
  g.center = c;
  g.radius = (s - c).len();
  g.startAngle = std::atan2(s.y - c.y, s.x - c.x);
  g.sweep = sweep;
  g.valid = g.radius > 0;
  return g;
}

Vec2 ArcGeom::pointAt(double t) const {
  double a = startAngle + sweep * t;
  return {center.x + radius * std::cos(a), center.y + radius * std::sin(a)};
}

Polyline ArcGeom::tessellate(double tol) const {
  Polyline out;
  if (!valid) return out;
  double maxStep = (radius > tol) ? 2 * std::acos(std::max(-1.0, 1 - tol / radius)) : kPi / 4;
  maxStep = std::clamp(maxStep, 1e-3, kPi / 8);
  int n = std::max(1, int(std::ceil(std::abs(sweep) / maxStep)));
  out.reserve(n + 1);
  for (int i = 0; i <= n; ++i) out.push_back(pointAt(double(i) / n));
  return out;
}

}  // namespace xr
