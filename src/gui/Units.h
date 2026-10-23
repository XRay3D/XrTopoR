#pragma once
// Display units of lengths and coordinates (TopoR shows a design in its own units: mm or mil).
#include <QString>

#include "core/Board.h"

namespace xr::gui {

enum class Unit { Mm, Mil };

// Units a board was designed in (P-CAD/DSN/TopoR files in mils show in mils).
Unit designUnit(const Board& b);
QString unitName(Unit u);  // «мм» / «мил»
double toUnit(double nm, Unit u);
double fromUnit(double v, Unit u);
// Number in display units, `decimals` after the point, trailing zeros trimmed.
QString formatLength(double nm, Unit u, int decimals = 4);

}  // namespace xr::gui
