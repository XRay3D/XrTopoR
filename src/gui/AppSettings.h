#pragma once
// Persistent program settings (QSettings): hotkey overrides, window layout, recent files, start-up.
#include <QByteArray>
#include <QDateTime>
#include <QHash>
#include <QKeySequence>
#include <QList>
#include <QString>
#include <vector>

namespace xr::gui {

struct RecentFile {
  QString path;
  QDateTime opened;
};

namespace AppSettings {

bool isFirstRun();  // nothing saved yet (used to offer the TopoR settings import)

QHash<QString, QList<QKeySequence>> shortcuts();
void setShortcuts(const QHash<QString, QList<QKeySequence>>& overrides);

QByteArray windowGeometry();
QByteArray windowState();
void setWindowLayout(const QByteArray& geometry, const QByteArray& state);

// Most recent first; at most 50 entries.
std::vector<RecentFile> recentFiles();
void addRecentFile(const QString& path);
void removeRecentFile(const QString& path);
void clearRecentFiles();

bool openLastProject();
void setOpenLastProject(bool on);

}  // namespace AppSettings

}  // namespace xr::gui
