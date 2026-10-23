#pragma once
// A copper shape = a core (point, segment or convex/simple polygon) inflated by a radius.
//   circle      -> point   + r
//   track/oval  -> segment + r (capsule)
//   rect        -> polygon + 0
//   roundrect   -> polygon (shrunk) + corner radius
// Distances between shapes reduce to distances between cores minus both radii.
#include "geom/Geometry.h"

namespace xr {

struct Shape {
  enum class Kind { Point, Segment, Polygon };
  Kind kind = Kind::Point;
  Vec2 a, b;      // Point: a; Segment: a-b
  Polyline poly;  // Polygon core (CCW or CW, simple)
  double r = 0;

  static Shape circle(Vec2 c, double r);
  static Shape capsule(Vec2 a, Vec2 b, double r);
  static Shape polygon(Polyline p, double r = 0);
  // Rectangle of full size w x h centred at c, rotated by angle (radians), with corner radius cr.
  static Shape rect(Vec2 c, double w, double h, double angle, double cr = 0);

  BBox bbox() const;
  Vec2 center() const;
  bool contains(Vec2 p) const { return coreDistance(p) <= r; }
  double coreDistance(Vec2 p) const;
  double distance(Vec2 p) const { return coreDistance(p) - r; }
  // Distance from the boundary of `this` to the boundary of `o` (negative = overlap depth approx.).
  double distance(const Shape& o) const;
  double distanceToSegment(Vec2 s0, Vec2 s1) const;  // to a zero-width segment
  // Outline polygon approximation (for rendering, Gerber regions).
  Polyline outline(double tol) const;
  // Distance from p along unit direction d until leaving the shape (0 if p is outside).
  double rayExit(Vec2 p, Vec2 d) const;
  Shape inflated(double d) const { Shape s = *this; s.r += d; return s; }
};

}  // namespace xr
