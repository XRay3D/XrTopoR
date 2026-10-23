#pragma once
// TopoR's colour schemes («TopoR 6.0», «P-CAD 2006», …) and display schemes («Трассировка», «Всё
// включено», …): a colour scheme sets the colours of a design's DisplayControl, a display scheme what
// it shows. Built-in schemes come with the program; user schemes are kept in the settings.
#include <array>
#include <cstdint>
#include <string>
#include <utility>
#include <vector>

#include "core/Board.h"

namespace xr::gui {

// Layer roles the schemes give colours and visibility to, in table order.
enum class LayerRole {
  MetalTop, MetalBottom, MaskTop, MaskBottom, SilkTop, SilkBottom, PasteTop, PasteBottom, OutlineTop, OutlineBottom,
  MechTop, MechBottom, Doc,
  MetalInner, Board  // not in the tables: inner layers have their own list, the outline a colour
};
constexpr int kRoleCount = int(LayerRole::Doc) + 1;

struct RoleColors {
  uint32_t details, pads, fix;
};

struct ColorScheme {
  std::string name;
  int hilightRate = 42, darkRate = 0;
  uint32_t gridColor = 0xf2f2f2;
  std::vector<std::pair<std::string, uint32_t>> colors;  // DisplayControl Colors attributes
  std::array<RoleColors, kRoleCount> roles{};
  std::vector<RoleColors> inner;  // inner copper layers 1, 2, …
};

struct ViewScheme {
  std::string name;
  std::vector<std::pair<std::string, bool>> show;  // DisplayControl Show attributes
  bool gridShow = false, alignToGrid = false, snapToAngle = false;
  std::array<bool, kRoleCount> roleVisible{};
  bool innerVisible = true;
};

const std::vector<ColorScheme>& builtinColorSchemes();
const std::vector<ViewScheme>& builtinViewSchemes();

LayerRole roleOf(const Board& b, LayerId l);
// Group of the «Слои» tab: 0 top mechanical, 1 metal, 2 bottom mechanical, 3 documenting, -1 none (outline).
int layerGroup(const Board& b, LayerId l);
// «Сигнальный», «Маска», … as TopoR names layer types.
std::string layerTypeName(const Board& b, LayerId l);

void applyColorScheme(DisplayControl& d, const Board& b, const ColorScheme& s);
void applyViewScheme(DisplayControl& d, const Board& b, const ViewScheme& s);
// Adds settings for layers the display does not know yet (designs from other CADs, new layers).
void completeDisplay(DisplayControl& d, const Board& b, const ColorScheme& colors, const ViewScheme& view);
// The current colours / visibility as a scheme (to save a user scheme).
ColorScheme colorSchemeOf(const DisplayControl& d, const Board& b, const std::string& name);
ViewScheme viewSchemeOf(const DisplayControl& d, const Board& b, const std::string& name);

// Built-in and user schemes together; user schemes persist in the settings.
std::vector<ColorScheme> allColorSchemes();
std::vector<ViewScheme> allViewSchemes();
void saveUserColorScheme(const ColorScheme& s);
void saveUserViewScheme(const ViewScheme& s);
void removeUserColorScheme(const std::string& name);
void removeUserViewScheme(const std::string& name);
bool isBuiltinColorScheme(const std::string& name);
bool isBuiltinViewScheme(const std::string& name);
// Defaults for designs without saved display settings («Настройки программы»).
std::string defaultColorScheme();
std::string defaultViewScheme();
const ColorScheme& colorSchemeByName(const std::vector<ColorScheme>& all, const std::string& name);
const ViewScheme& viewSchemeByName(const std::vector<ViewScheme>& all, const std::string& name);

}  // namespace xr::gui
