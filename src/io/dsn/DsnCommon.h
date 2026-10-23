#pragma once
// Helpers shared by the Specctra DSN reader/writer and the SES reader/writer.
#include <string>

#include "io/sexpr/SExpr.h"

namespace xr::io::dsn {

// Nanometres per DSN unit for a (unit X) / (resolution X n) declaration.
inline double unitNm(const std::string& u) {
  if (u == "inch") return 25'400'000.0;
  if (u == "mil") return 25'400.0;
  if (u == "cm") return 10'000'000.0;
  if (u == "mm") return 1'000'000.0;
  if (u == "um") return 1'000.0;
  return 1'000.0;
}

// Scale of coordinates in a section: (resolution um 10) means 1 coordinate = 1/10 um,
// unless a (unit ..) overrides it.
inline double coordScale(const sexpr::Node& section, double fallback) {
  if (const auto* u = section.find("unit")) return unitNm(u->arg(0));
  if (const auto* r = section.find("resolution")) return unitNm(r->arg(0)) / std::max(1.0, r->num(1, 1));
  return fallback;
}

}  // namespace xr::io::dsn
