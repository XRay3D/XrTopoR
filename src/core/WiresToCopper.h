#pragma once
// TopoR's «Преобразовать проводники в обл. металлизации» (polygonal routing, for power boards): the nets chosen,
// or all the nets with wires on the layers chosen, get copper areas that take the room there is round their wires.
// The wires stay as they are, inside their areas — so TopoR does it (Example_01 converted by it: 13 nets, 13 areas
// of priority 50 drawn with a line as wide as the wires, pads joined solid, every wire still there).
//
// The room is told by the Voronoi diagram of the layer's copper (the user's own way of GERBER_X3's Voronoi tool:
// Boost.Polygon over the sides of the copper's contours, each tagged with its body; the skeleton is the edges
// between sides of different bodies, the parabolic ones in chords). A body is all the copper of one net on the
// layer; a net's cell — the union of its sides' cells — reaches half way to every neighbour. That cell, drawn in
// by half the clearance and half the area's line (two neighbours' copper ends up the clearance apart), is the
// outline of an ordinary copper area of the net, poured at once: the pour itself keeps the clearance from the
// copper lying inside the outline, from the board's edge and the keepouts. (TopoR's own outlines are the cells
// themselves, a few hundredths of a millimetre apart, and its pour parts the neighbours.)
#include <vector>

#include "core/Board.h"

namespace xr {

struct WiresToCopper {
  std::vector<int> nets;        // these nets, on every layer they have wires on; or
  std::vector<LayerId> layers;  // every net with wires on these layers
};

struct WiresToCopperResult {
  int areas = 0;  // the copper areas made
  int nets = 0;   // the nets that got them
};

WiresToCopperResult wiresToCopper(Board& b, const WiresToCopper& what);

}  // namespace xr
