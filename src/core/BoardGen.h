#pragma once
// Synthetic boards for the autorouter's experiments (buses, groups of parallel wires) and for capturing how TopoR
// routes the same boards (tools/topor-capture). Two copper layers, through-hole connectors at 2.54 mm and SMD rows,
// rules: width 0.25, clearance 0.2, via 0.6/0.3 mm.

#include <string>
#include <string_view>
#include <vector>

#include "core/Board.h"

namespace xr {

// The kinds and what they hold (n: wires in a bus):
//   bus_straight  two connectors of n pins face to face, the pins in the same order: one plain bus;
//   bus_twisted   the same, the second connector's order reversed (every pair of wires must cross once);
//   bus_offset    the second connector shifted down by its length, two rows of resistors between: a bus that bends
//                 round obstacles;
//   bus_cross     two buses crossing at right angles (left to right and bottom to top): two layers and vias;
//   bus_mixed     a bus and 2n two-pin nets of resistors scattered across its way;
//   smd_bus       a row of SMD pads at 0.65 mm (a QFP's side) to a connector: a bus fanning out.
std::vector<std::string> busBoardKinds();
// The board of a kind; empty on an unknown one.
std::optional<Board> makeBusBoard(std::string_view kind, int n = 16);

}  // namespace xr
