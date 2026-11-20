#pragma once
// A pad as the wires see it: its centre, its long axis and its half sizes. TopoR lays a wire from the
// pad's centre to an inner point near the pad's end, and out through that end. Measured on its results:
// - an oval: the centre of the rounded end, whatever the wire (a pin 1.9 x 0.3 with a 0.3 wire — centre,
//   then (±0.8, 0); the pads 2.1 x 0.8 of the arz boards with a 0.2 wire — (±0.65, 0)); the wire leaves
//   that point in any direction;
// - a rectangle: half a wire's width short of the end, at the lateral offset of the wire outside, kept
//   within the copper (5.6 x 2 — centre, (2.65, v), (2.8, v) with |v| <= 0.85 for 0.3 and 0.6 for 0.8);
// - a round pad: straight from the centre.
#include <optional>
#include <utility>

#include "core/Board.h"

namespace xr::topo {

// The pattern's edge point lies on the pad's boundary, a rounding away from it: this far beyond the
// copper a point is still the pad's.
constexpr double kPadEdgeTol = 1000;

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
  // `sign` (±1 along n): an oval's — the centre of its rounded end; a rectangle's — half a width short of
  // the end, at the lateral offset v (kept within the copper).
  Vec2 innerPoint(int sign, double width, double v) const;
  // ... and the point of the end's edge straight beyond it.
  Vec2 edgePoint(int sign, double width, double v) const;
  // The frame of a pad that is not elongated, for a wire leaving across its axis: the axes exchanged.
  PadFrame turned() const;

  // A rectangle's corners, for the pads that take a wire at them (cornerExit below). The corner a point of the
  // boundary lies on, as the signs of its place along n and t: on the corner's rounding, or (a sharp corner, a
  // rounding narrower than the wire) within half the wire's width of the corner along both sides. None: on a side.
  std::optional<std::pair<int, int>> cornerAt(Vec2 boundaryPoint, double width) const;
  // The inner point of a wire laid from the corner: the centre of its rounding when the wire fits there (the wire
  // leaves it in any direction and stays in the copper, as from the centre of an oval's end); else half a width in
  // from both sides.
  Vec2 cornerInner(int su, int sv, double width) const;
  // `q` is a corner's inner point (to a micrometre): that point.
  std::optional<Vec2> cornerHeld(Vec2 q, double width) const;
};

PadFrame padFrame(const Pad& p);

// Whether the pad takes a wire of the width at its corners («Настройки подсоединения проводников к КП»,
// PadConnectSettings): a rectangle, and every pad does (AllPads), or its corners are rounded by more than half
// the wire's width (what TopoR's automatic mode allows), or its pad stack or the pin itself is listed.
bool cornerExit(const Board& b, int pad, const PadFrame& f, double width);

}  // namespace xr::topo
