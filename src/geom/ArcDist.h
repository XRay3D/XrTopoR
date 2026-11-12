#pragma once
// Distances to a circular arc as it is — no chords. The least distance between two curves is at an end of one of
// them or where the line joining the nearest points is square to both; for an arc that line passes through its
// centre, so there are a few candidates and a formula for each:
//   point - arc:    along the radius through the point when that meets the arc, else to the nearer end;
//   segment - arc:  where they cross (nought); the ends of each against the other; the foot of the perpendicular
//                   from the centre on the segment, along its radius;
//   arc - arc:      where the circles cross within both arcs (nought); the ends of each against the other; the
//                   points of the two on the line through the centres (concentric: the difference of the radii
//                   where the arcs face each other).
// (A track's arc was cut into chords 0.2 um off the arc for every such question: 5 to 70 capsules a track, and
// the answer off by as much.)
#include "geom/Geometry.h"

namespace xr {

struct ArcCurve {
  Vec2 c;            // centre
  double R = 0;      // radius
  double a0 = 0;     // the angle of the start, radians
  double sweep = 0;  // signed, from the start: + counter-clockwise (the frame's own sense, as ArcGeom's)
  Vec2 at(double angle) const { return {c.x + R * std::cos(angle), c.y + R * std::sin(angle)}; }
  Vec2 start() const { return at(a0); }
  Vec2 end() const { return at(a0 + sweep); }
  Vec2 mid() const { return at(a0 + sweep / 2); }
  // Whether the direction `angle` from the centre meets the arc.
  bool spans(double angle) const;
  bool spans(Vec2 p) const { return spans(std::atan2(p.y - c.y, p.x - c.x)); }
  BBox bbox() const;
};

double distPointArc(Vec2 p, const ArcCurve& a);
double distSegmentArc(Vec2 s0, Vec2 s1, const ArcCurve& a);
double distArcArc(const ArcCurve& a, const ArcCurve& b);

}  // namespace xr
