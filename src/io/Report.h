#pragma once
// Text reports: routing statistics per net and layer, bill of materials.
#include <string>

#include "core/Board.h"

namespace xr::io {

// Board summary, per-layer copper usage and per-net length/vias/completion (plain text).
std::string routingReport(const Board& b);
// Bill of materials grouped by value and footprint (CSV: Count;RefDes;Value;Footprint).
std::string bomCsv(const Board& b);

}  // namespace xr::io
