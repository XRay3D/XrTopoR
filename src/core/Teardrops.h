#pragma once
// «Капельки»: the copper that widens a wire where it meets something wider, as TopoR draws it. They are not
// kept: they follow from the wires, pads and vias as these lie (TopoR reads none from a file either).
//
// A wire's piece ending at the anchor of round copper of radius R — a via, a round pad (with the design's
// «Капельки» on: Settings/Autoroute teardrops), or the end of a wider wire of its net (always: R is half that
// wire's width) — gets a quadrilateral: the anchor, a point of tangency, the tip on the wire's axis, the other
// point of tangency. Its contour is drawn with a pen as wide as the wire, so the circle touched is that of
// radius r = R - w/2 and the copper's edge runs into the pad's.
//
// The sizes, as measured on TopoR's own (AMK310_MCU_V2.fst: 526 of its 528 teardrops; Example_02, Example_04: all):
// the tip L = min(2.4 r, R + 1.2 w) from the anchor, but no further than the piece's far end; the circle touched
// no larger than 0.7 L. None when the full length would not reach past the pad's edge (a wire nearly as wide as
// the pad), when the piece is shorter than half its width, or when it ends under the pad and the wire turns
// there; none at a pad that is not round, nor where a piece begins with an arc.
// (The two of AMK310 not made: at a branch point where the wider wire ends 0.04–0.07 mm aside, on a vertex of a
// neighbour — TopoR takes the three for one joint; what it goes by is not in the file.)
#include <array>
#include <vector>

#include "core/Board.h"
#include "geom/Shape.h"

namespace xr {

struct Teardrop {
  int net = kNoNet;
  LayerId layer = 0;
  int track = -1;            // the piece widened, and
  int end = 0;               // its end at the anchor: 0 its start, 1 its end
  Coord width = 0;           // of the pen: the wire's
  std::array<Vec2, 4> quad;  // as TopoR writes it: the anchor, then the contour counter-clockwise (in its frame, Y up)
  // Its copper: the quadrilateral grown by half the pen.
  Shape shape() const { return Shape::polygon(Polyline{quad[0], quad[1], quad[2], quad[3]}, double(width) / 2); }
};

// The teardrops of the board. One that would come nearer the copper of another net (its wires, pads and vias)
// than the clearance is not made — TopoR makes it all the same: 26 of AMK310's are 0.01–0.04 mm short of the
// 0.3 the design asks —; `tight`: with those too, as TopoR has them.
std::vector<Teardrop> teardrops(const Board& b, bool tight = false);

}  // namespace xr
