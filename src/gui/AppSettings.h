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
// Adds files opened elsewhere (TopoR's recent projects) with their dates; the list stays newest first.
void mergeRecentFiles(const std::vector<RecentFile>& files);
void removeRecentFile(const QString& path);
void clearRecentFiles();

// TopoR's settings are taken over once, on the first start that finds them.
bool toporImported();
void setToporImported();

// «Прозрачность меди», per cent (0: opaque): the copper layers are laid over one another that transparent, the
// active one half as much.
int copperTransparency();
void setCopperTransparency(int percent);

bool openLastProject();
void setOpenLastProject(bool on);

// The MCP server for agents (gui/mcp): off unless asked for — it opens, edits and saves designs; on 127.0.0.1 only.
constexpr int kDefaultMcpPort = 7417;
bool mcpEnabled();
void setMcpEnabled(bool on);
int mcpPort();
void setMcpPort(int port);

}  // namespace AppSettings

}  // namespace xr::gui
