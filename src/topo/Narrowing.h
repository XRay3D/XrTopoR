#pragma once
// When the wires of an edge are narrowed: the rule the model's capacity and the realiser share.
#include <vector>

namespace xr::topo {

// Narrowing is the last resort (TopoR's F5, F6 and F7 never narrow a wire on Arcs_standard_routing though
// its POWER rule allows 0.3 mm for a nominal 0.8): the wires of an edge keep their widths while what is
// missing at the bare rule is no more than this — the DRC shows the shortfall — and beyond it only as many
// are narrowed, and only as far, as makes the edge fit; when that cannot be had nothing is narrowed.
constexpr double kNarrowDeficitLimit = 50000;  // nm

// Which wires of an edge to narrow, and to what, to win `deficit`: those with the most to give first, the
// last one only what is still missing (down to whole micrometres). False, and `out` the nominal widths,
// when all of them together cannot win it.
bool chooseNarrowing(const std::vector<double>& width, const std::vector<double>& widthMin, double deficit, std::vector<double>& out);

}  // namespace xr::topo
