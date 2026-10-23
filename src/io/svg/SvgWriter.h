#pragma once
#include <string>

#include "core/Board.h"

namespace xr::io {

struct SvgOptions {
  double pxPerMm = 12;
  bool ratsnest = true;
  bool silk = true;
};

// Renders copper (all layers, translucent), outline, silk and the ratsnest as an SVG image.
std::string writeSvg(const Board& b, const SvgOptions& opt = {});

}  // namespace xr::io
