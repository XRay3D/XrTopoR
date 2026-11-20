#pragma once
// The settings of a design from the «Дизайн» menu, as TopoR has them: «Настройки редактирования» (how labels turn
// with their components), «Настройки подсоединения проводников к КП» (the pads that take a wire at their corners),
// «Фильтр сообщений» (the warnings shown). Each changes Board::settings as one step that can be undone.
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

// True: the settings were changed.
bool editMessageFilter(QWidget* parent, Document* doc);
bool editLabelSettings(QWidget* parent, Document* doc);
bool editPadConnect(QWidget* parent, Document* doc);

}  // namespace xr::gui
