#pragma once
// Display settings of a design, kept with it the way TopoR keeps them in its .fst file (section
// DisplayControl 1.3): colours, object visibility, grid, per-layer looks, special net colours and the
// ratsnest filter. Colours are 0xRRGGBB; attribute names are those of the TopoR format.
#include <cstdint>
#include <map>
#include <string>
#include <vector>

namespace xr {

struct LayerDisplay {
  std::string layer;  // layer name
  uint32_t details = 0xc0c0c0, pads = 0xc0c0c0, fix = 0x808080;
  bool visible = true, showDetails = true, showPads = true;
};

struct NetColor {
  std::string net;
  uint32_t color = 0xff0000;
};

struct DisplayControl {
  // View (zoom/scroll) and the active layer, restored when the design is reopened.
  double viewScale = 0, scrollX = 0, scrollY = 0;
  std::string activeLayer;
  std::string units = "Metric";  // Metric | Imperial | mm | mil | …

  std::string colorScheme, displayScheme;
  int hilightRate = 42, darkRate = 0;
  std::map<std::string, uint32_t> colors;  // Colors: background, board, netLines, keepoutWireAll, …
  std::map<std::string, bool> show;        // Show: showWires, showVias, showNetLines, …

  uint32_t gridColor = 0xf2f2f2;
  bool gridDots = true, gridShow = false, alignToGrid = false, snapToAngle = false, saveProportion = true;
  double gridX = 12'700, gridY = 12'700;  // nm (TopoR's default 0.5 mil)

  std::vector<LayerDisplay> layers;

  bool colorNets = true, colorizeWire = true, colorizePad = true, colorizeCopper = true, colorizeVia = true,
       colorizeNetline = true;
  std::vector<NetColor> netColors;

  bool filterNetlines = false;
  bool hideFilteredNetlines = false;  // TopoR 7: the filter lists nets to hide instead of to show
  std::vector<std::string> netlineNets;

  bool flag(const std::string& name, bool def = true) const {
    auto it = show.find(name);
    return it == show.end() ? def : it->second;
  }
  uint32_t color(const std::string& name, uint32_t def) const {
    auto it = colors.find(name);
    return it == colors.end() ? def : it->second;
  }
  LayerDisplay* layer(const std::string& name) {
    for (auto& l : layers)
      if (l.layer == name) return &l;
    return nullptr;
  }
  const LayerDisplay* layer(const std::string& name) const {
    for (auto& l : layers)
      if (l.layer == name) return &l;
    return nullptr;
  }
};

}  // namespace xr
