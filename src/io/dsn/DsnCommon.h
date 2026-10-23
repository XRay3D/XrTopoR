#pragma once
// Helpers shared by the Specctra DSN reader/writer and the SES reader/writer.
#include <cctype>
#include <string>

#include "io/sexpr/SExpr.h"

namespace xr::io::dsn {

// Nanometres per DSN unit for a (unit X) / (resolution X n) declaration.
inline double unitNm(std::string u) {
  for (auto& c : u) c = char(std::tolower(static_cast<unsigned char>(c)));
  if (u == "inch") return 25'400'000.0;
  if (u == "mil") return 25'400.0;
  if (u == "cm") return 10'000'000.0;
  if (u == "mm") return 1'000'000.0;
  if (u == "um") return 1'000.0;
  return 1'000.0;
}

// Scale of coordinates in a section. Design files (DSN) write coordinates in (unit ..), by default
// the unit named in (resolution ..); session files (SES) write integers in resolution sub-units,
// e.g. (resolution um 10) -> 1 coordinate = 0.1 um.
inline double coordScale(const sexpr::Node& section, double fallback, bool subUnits = false) {
  if (const auto* u = section.find("unit")) return unitNm(u->arg(0));
  if (const auto* r = section.find("resolution"))
    return subUnits ? unitNm(r->arg(0)) / std::max(1.0, r->num(1, 1)) : unitNm(r->arg(0));
  return fallback;
}

}  // namespace xr::io::dsn
