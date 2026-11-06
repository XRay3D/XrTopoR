#pragma once
// What a re-laid board looks like at its pads, widths and joints: the yardstick for F5, F6 and F7 against
// TopoR's own results (docs/topo-model.md). Counts only, nothing is changed.
#include <map>
#include <string>

#include "core/Board.h"

namespace xr::topo {

struct RelayStats {
  std::map<Coord, std::pair<int, double>> widths;  // width -> tracks, length (nm)
  int necks = 0;  // runs narrower than both the wires they join, in series off the copper
  // Pads and vias a wire comes to: with a track vertex at the centre.
  int pads = 0, padsAtCentre = 0, vias = 0, viasAtCentre = 0;
  int deadEnds = 0;  // a wire's end inside its own copper, off the centre
  // Elongated pads: where the tracks cross the copper's boundary.
  int exitsEnd = 0, exitsSide = 0, exitsBridge = 0;  // a bridge: through the long side straight to a pad beside
  // Track vertices inside elongated pads, off the centre: on the pattern (half a width short of the end,
  // or on the end's edge beyond it) or elsewhere.
  int innerPattern = 0, innerOther = 0;
  // Tracks lying wholly inside their own copper.
  int inVia = 0, inRound = 0, inOval = 0, inRect = 0;
  // Where two widths of a net meet.
  int jointVia = 0, jointPad = 0, jointInCopper = 0, jointSeries = 0, jointBranch = 0;
  int tees = 0;  // a track's end on the inside of another track of its net
  std::string text() const;
};

RelayStats relayStats(const Board& b);

}  // namespace xr::topo
