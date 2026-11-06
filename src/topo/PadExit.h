#pragma once
// A pad as the wires see it: its centre, its long axis and its half sizes. TopoR lays a wire from the
// pad's centre to an inner point half a wire's width short of the pad's end, and out through that end
// (measured on its F5 results: an oval pin 1.9 x 0.3 with a 0.3 wire — centre, then (±0.8, 0), the centre
// of the rounded end; a rectangle 5.6 x 2 — centre, (2.65, v), (2.8, v) with |v| <= 0.85).
#include "core/Board.h"

namespace xr::topo {

struct PadFrame {
  enum class Kind { Round, Oval, Rect, Other };
  Kind kind = Kind::Other;
  Vec2 c;         // centre
  Vec2 n{1, 0};   // unit vector along the long axis
  Vec2 t{0, 1};   // across it
  double L = 0;   // half length of the copper along n
  double W = 0;   // half width across
  double r = 0;   // rounding of the corners (an oval: W)
  // Longer than wide by half again: its ends are its short sides.
  bool elongated() const { return (kind == Kind::Oval || kind == Kind::Rect) && L >= 1.5 * W; }
  Vec2 local(Vec2 p) const { return {(p - c).dot(n), (p - c).dot(t)}; }
  Vec2 world(double u, double v) const { return c + n * u + t * v; }
  // A point of the pad's boundary lies on an end (a short side, an oval's cap) and not on a long side.
  bool onEnd(Vec2 boundaryPoint) const;
  // The inner point of the pattern for a wire of this width leaving through the end on the side of
  // `sign` (±1 along n), at the lateral offset v (kept within the copper): half a width short of the end.
  Vec2 innerPoint(int sign, double width, double v) const;
  // ... and the point of the end's edge straight beyond it.
  Vec2 edgePoint(int sign, double width, double v) const;
};

PadFrame padFrame(const Pad& p);

}  // namespace xr::topo
