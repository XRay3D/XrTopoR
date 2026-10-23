#pragma once
// TopoR's small dialogs: «Ширина проводника» with the rules in force, «Повернуть на угол»,
// «Изменение цепи», «Площадь металлизации».
#include <QWidget>
#include <optional>

#include "gui/Document.h"

namespace xr::gui {

// New width for wires of `nets` on `layer` (shown with the width rules that apply to them).
std::optional<Coord> askTrackWidth(QWidget* parent, Document* doc, const std::vector<int>& nets, LayerId layer, Coord current);
std::optional<double> askRotationAngle(QWidget* parent);
// «Изменение цепи»: a net of the design (or «без цепи», kNoNet), searched by name.
std::optional<int> askNet(QWidget* parent, Document* doc, int current);
void showCopperArea(QWidget* parent, Document* doc);

}  // namespace xr::gui
