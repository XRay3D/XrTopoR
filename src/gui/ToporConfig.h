#pragma once
// Settings of an installed TopoR (its TopoR_7.0.cfg in the Wine prefix): hotkeys, the layout of panels
// and toolbars, recent projects and start-up — read so that XrTopoR can take them over. (The main
// window's size is that of the last TopoR session, not a setting: it is not taken over.)
#include <QHash>
#include <QKeySequence>
#include <QList>
#include <QString>
#include <optional>
#include <vector>

#include "gui/AppSettings.h"

namespace xr::gui {

struct ToporPanel {
  QString name;
  QString state;  // left | right | top | bottom | float
  int posHor = 0, posVert = 0;
  int widthDocked = 0, heightDocked = 0;
  double spaceScale = 0;
  bool visible = true;
};

struct ToporSettings {
  QString path;
  QHash<QString, QList<QKeySequence>> accelerators;  // by TopoR command id (Accel_*)
  std::vector<ToporPanel> panels;
  std::vector<RecentFile> recentProjects;
  std::optional<bool> openLastProject;
};

// The newest TopoR_*.cfg of the Wine prefixes ($WINEPREFIX, ~/.wine, ~/.local/share/wineprefixes/*).
QString findToporConfig();
std::optional<ToporSettings> readToporConfig(const QString& path, QString* error = nullptr);
// A Windows accelerator: virtual key code and fVirt flags (4 Shift, 8 Ctrl, 16 Alt).
QKeySequence keyFromWindows(int vk, int fVirt);

}  // namespace xr::gui
