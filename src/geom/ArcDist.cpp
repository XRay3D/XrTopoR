#include "geom/ArcDist.h"

#include <algorithm>
#include <cmath>

namespace xr {

bool ArcCurve::spans(double angle) const {
  if (std::abs(sweep) >= 2 * kPi) return true;
  // The angle from the start in the arc's own sense, in [0, 2 pi).
  const double rel = sweep >= 0 ? normalizeAngle(angle - a0) : normalizeAngle(a0 - angle);
  constexpr double kSlack = 1e-12;  // (an end is on the arc)
  return rel <= std::abs(sweep) + kSlack || rel >= 2 * kPi - kSlack;
}

BBox ArcCurve::bbox() const {
  BBox b;
  b.add(start());
  b.add(end());
  for (int q = 0; q < 4; ++q)  // the circle's extremes along the axes that the arc passes
    if (const double ang = q * kPi / 2; spans(ang)) b.add(at(ang));
  return b;
}

double distPointArc(Vec2 p, const ArcCurve& a) {
  const Vec2 d = p - a.c;
  const double far = d.len();
  if (far > 0 && a.spans(std::atan2(d.y, d.x))) return std::abs(far - a.R);
  if (far == 0 && std::abs(a.sweep) > 0) return a.R;  // the centre: every point of the arc as far
  return std::min((p - a.start()).len(), (p - a.end()).len());
}

double distSegmentArc(Vec2 s0, Vec2 s1, const ArcCurve& a) {
  const Vec2 e = s1 - s0;
  const double len2 = e.len2();
  if (len2 == 0) return distPointArc(s0, a);
  // Where the segment's line crosses the circle: s0 + t e, |s0 + t e - c| = R.
  const Vec2 m = s0 - a.c;
  const double bq = m.dot(e), cq = m.len2() - a.R * a.R, disc = bq * bq - len2 * cq;
  if (disc >= 0) {
    const double root = std::sqrt(disc);
    for (double t : {(-bq - root) / len2, (-bq + root) / len2})
      if (t >= 0 && t <= 1 && a.spans(s0 + e * t)) return 0;
  }
  double d = std::min({distPointArc(s0, a), distPointArc(s1, a), distPointSegment(a.start(), s0, s1), distPointSegment(a.end(), s0, s1)});
  // The foot of the perpendicular from the centre, when it lies within the segment: along its radius.
  if (const double t = -bq / len2; t > 0 && t < 1) {
    const Vec2 q = s0 + e * t;
    if ((q - a.c).len2() > 0 && a.spans(q)) d = std::min(d, std::abs((q - a.c).len() - a.R));
  }
  return d;
}

double distArcArc(const ArcCurve& a, const ArcCurve& b) {
  double d = std::min({distPointArc(a.start(), b), distPointArc(a.end(), b), distPointArc(b.start(), a), distPointArc(b.end(), a)});
  const Vec2 cc = b.c - a.c;
  const double far = cc.len();
  if (far < 1e-9 * std::max({a.R, b.R, 1.0})) {
    // Concentric: where the arcs face each other they are the difference of the radii apart. They do when an end
    // of one lies in the other's span (or one spans all).
    const bool facing = a.spans(b.a0) || a.spans(b.a0 + b.sweep) || b.spans(a.a0) || b.spans(a.a0 + a.sweep);
    return facing ? std::min(d, std::abs(a.R - b.R)) : d;
  }
  // The circles cross at two points, mirrored about the line of the centres.
  if (far <= a.R + b.R && far >= std::abs(a.R - b.R)) {
    const double along = (far * far + a.R * a.R - b.R * b.R) / (2 * far);
    const double h2 = a.R * a.R - along * along;
    const Vec2 u = cc / far, n{-u.y, u.x};
    const double h = std::sqrt(std::max(0.0, h2));
    for (double sg : {-1.0, 1.0}) {
      const Vec2 x = a.c + u * along + n * (sg * h);
      if (a.spans(x) && b.spans(x)) return 0;
    }
  }
  // The points of the two arcs on the line through the centres.
  const double ang = std::atan2(cc.y, cc.x);
  for (double ta : {ang, ang + kPi}) {
    if (!a.spans(ta)) continue;
    const Vec2 pa = a.at(ta);
    for (double tb : {ang, ang + kPi})
      if (b.spans(tb)) d = std::min(d, (pa - b.at(tb)).len());
  }
  return d;
}

}  // namespace xr
