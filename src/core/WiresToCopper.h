#pragma once
// TopoR's «Преобразовать проводники в обл. металлизации» (polygonal routing, for power boards): the wires of the
// chosen nets, or all the wires of the chosen layers, become copper areas that take the room there is.
//
// The room is told by the Voronoi diagram of the layer's copper (the user's own way of GERBER_X3's Voronoi tool:
// Boost.Polygon over the sides of the copper's contours, each tagged with its body; the skeleton is the edges
// between sides of different bodies, the parabolic ones in chords). A body is all the copper of one net on the
// layer; a net's cell — the union of its sides' cells — reaches half way to every neighbour. That cell, drawn in
// by half the clearance (two neighbours made areas end up the clearance apart), is the outline of an ordinary
// copper area of the net, poured at once: the pour itself keeps the clearance from the copper lying inside the
// outline, from the board's edge and the keepouts, joins the net's pads and vias solid, and leaves no neck
// narrower than the wires were. The wires go; the fixed ones, the zipped pairs and the serpents stay as they are.
// A net whose connections the areas would not keep (a neck the pour could not hold) stays wires.
#include <vector>

#include "core/Board.h"

namespace xr {

struct WiresToCopper {
  std::vector<int> nets;        // the wires of these nets, on every layer; or
  std::vector<LayerId> layers;  // every wire on these layers
};

struct WiresToCopperResult {
  int wires = 0;          // the pieces of wire replaced
  int areas = 0;          // the copper areas made
  std::vector<int> kept;  // the nets left as wires: the areas would have lost a connection of theirs
};

WiresToCopperResult wiresToCopper(Board& b, const WiresToCopper& what);

}  // namespace xr
