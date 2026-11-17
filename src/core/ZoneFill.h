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

// Pours the areas (opt.only, or all); an area that is always copper (Zone::alwaysCopper) keeps its copper (gets it
// as drawn when it has none).
ZoneFillStats fillZones(Board& b, const ZoneFillOptions& opt = {});
// Takes the pours off (not the copper of the areas that are always copper).
void clearZoneFills(Board& b);

// The copper an area reaches: its outline grown by half its line width (round at the corners), or the stripe
// along an open one; as fractured polygons, like Zone::filled. Arcs in chords at most `tol` off.
std::vector<Polyline> zoneCopper(const Zone& z, double tol = 5000);
// Its outer contour (of the largest piece): what the model and the picking take for the area.
Polyline zoneContour(const Zone& z);
// An area that is always copper gets its copper again (after its shape, width or place changed); others stay.
void refreshSolidZone(Zone& z);
void refreshSolidZones(Board& b);

// A piece of poured copper with the holes in it.
struct Island {
  Polyline outer;
  std::vector<Polyline> holes;
};
// The copper of a zone's fill as islands: its polygons (fractured ones and pieces laid over others, like the thermal
// bridges read from P-CAD) united, the seams of fracture undone into holes.
std::vector<Island> zoneIslands(const Zone& z);
// Plane layers become board-wide zones of their net (so connectivity, DRC and outputs see them).
void addPlaneZones(Board& b);

}  // namespace xr
