#pragma once
// The font a text style is drawn in: the style's own (TopoR's «GOST type B» is a TrueType font), a sans font for
// one the system does not have (TopoR's vector «QUALITY»). The character height of a style is the font's cell,
// ascent and descent, as Windows takes a font's height; the line's top is the top of its capitals.
#include <QFont>

#include "core/Board.h"

namespace xr::gui {

// The style's font at a pixel size of 100.
QFont textFont(const TextStyle& st);
// Gives the board's text layout the widths of the lines in their fonts (setTextMeasure); once is enough.
void installTextMeasure();

}  // namespace xr::gui
