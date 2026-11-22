#pragma once
// «Переназначение выводов» and «Переназначение вентилей»: functionally equivalent pins of a component, or its
// equivalent gates, exchange their nets; the wires that came to them go to the other pin.
#include <string>
#include <utility>
#include <vector>

#include "core/Board.h"

namespace xr {

// A group of what may be exchanged within a component. Pins: each member is one pad — the pins of one gate with
// the same non-zero pinEqual. Gates: each member is the pads of one gate — the gates (not gate 0, the pins of no
// gate) with the same non-zero gateEqual and as many pins. Groups of one member are not groups.
struct SwapGroup {
  int component = -1;
  std::vector<std::vector<int>> members;
};
std::vector<SwapGroup> pinGroups(const Board& b);
std::vector<SwapGroup> gateGroups(const Board& b);

// Per pad of the board: its group among `groups` and its member there; -1: of no group.
struct SwapPlace {
  int group = -1, member = -1;
};
std::vector<SwapPlace> swapPlaces(const Board& b, const std::vector<SwapGroup>& groups);

enum class SwapRefusal {
  None,           // done
  NotEquivalent,  // the two are not of one group (or are one and the same)
  Locked,         // a fixed wire or via stands on one of the pins
};
// The pads whose nets were exchanged, pair by pair (one pair for pins, the gate's pins for gates).
using SwappedPads = std::vector<std::pair<int, int>>;
// The nets of two equivalent pins exchanged. The ends of the wires of a pin's net that stand on it go to the
// other pin (the last piece is stretched), with the vias standing on the pin and what ends on them; a wire on a
// layer the other pin has no copper on stays where it is, unconnected. A pin a signal begins or ends at: the
// signal goes with its net.
SwapRefusal swapPins(Board& b, int padA, int padB, SwappedPads* done = nullptr);
// The same for two equivalent gates, `padA` and `padB` being any pins of theirs: every pin of the one with its
// pin of the other — by the pins' names in the symbol when both gates have the same distinct names, else in order.
SwapRefusal swapGates(Board& b, int padA, int padB, SwappedPads* done = nullptr);
// The pins of two gates (the pads of each), pin for pin, as swapGates pairs them; empty: the gates do not match.
SwappedPads gatePinPairs(const Board& b, const std::vector<int>& gateA, const std::vector<int>& gateB);

}  // namespace xr
