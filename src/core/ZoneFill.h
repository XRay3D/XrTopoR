#pragma once
// Copper pour: zone outline (inside the board, away from its edge) minus the copper of other nets
// grown by the clearance; thin necks are removed; islands not touching the zone's net and small ones dropped as the zone says.
#include "core/Board.h"

namespace xr {

struct ZoneFillOptions {
  Coord minWidth = mmToNm(0.2);        // narrower necks are removed (opening)
  double arcTolerance = 5000;          // chord error for round shapes (nm)
  bool thermals = true;                // same-net pads connect through spokes, not solid
  Coord thermalGap = mmToNm(0.5);      // clearance ring around a pad
  Coord spokeWidth = mmToNm(0.5);
  std::vector<int> only;               // zone indices to pour (empty = all)
};

struct ZoneFillStats {
  int zones = 0;
  int polygons = 0;
  int islandsRemoved = 0;
};

ZoneFillStats fillZones(Board& b, const ZoneFillOptions& opt = {});
void clearZoneFills(Board& b);
// Plane layers become board-wide zones of their net (so connectivity, DRC and outputs see them).
void addPlaneZones(Board& b);

}  // namespace xr
