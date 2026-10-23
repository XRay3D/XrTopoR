#include "gui/AppSettings.h"

#include <QFileInfo>
#include <algorithm>
#include <QSettings>

namespace xr::gui::AppSettings {

namespace {
constexpr int kMaxRecent = 50;
}

bool isFirstRun() { return QSettings().allKeys().isEmpty(); }

QHash<QString, QList<QKeySequence>> shortcuts() {
  QSettings s;
  QHash<QString, QList<QKeySequence>> out;
  s.beginGroup("shortcuts");
  for (const QString& id : s.childKeys()) {
    QList<QKeySequence> keys;
    for (const QString& k : s.value(id).toStringList())
      if (!k.isEmpty()) keys << QKeySequence(k, QKeySequence::PortableText);
    out.insert(id, keys);
  }
  return out;
}

void setShortcuts(const QHash<QString, QList<QKeySequence>>& overrides) {
  QSettings s;
  s.remove("shortcuts");
  s.beginGroup("shortcuts");
  for (auto it = overrides.cbegin(); it != overrides.cend(); ++it) {
    QStringList keys;
    for (auto& k : it.value()) keys << k.toString(QKeySequence::PortableText);
    // An emptied hotkey is stored as one empty string, so it overrides the default.
    s.setValue(it.key(), keys.isEmpty() ? QStringList{QString()} : keys);
  }
}

QByteArray windowGeometry() { return QSettings().value("window/geometry").toByteArray(); }
QByteArray windowState() { return QSettings().value("window/state").toByteArray(); }

void setWindowLayout(const QByteArray& geometry, const QByteArray& state) {
  QSettings s;
  s.setValue("window/geometry", geometry);
  s.setValue("window/state", state);
}

std::vector<RecentFile> recentFiles() {
  QSettings s;
  std::vector<RecentFile> out;
  int n = s.beginReadArray("recent");
  for (int i = 0; i < n; ++i) {
    s.setArrayIndex(i);
    out.push_back({s.value("path").toString(), s.value("opened").toDateTime()});
  }
  s.endArray();
  // Settings of earlier versions kept only the last board.
  if (out.empty())
    if (QString last = s.value("lastFile").toString(); !last.isEmpty())
      out.push_back({last, QFileInfo(last).lastRead()});
  return out;
}

static void writeRecent(const std::vector<RecentFile>& list) {
  QSettings s;
  s.remove("recent");
  s.beginWriteArray("recent", int(list.size()));
  for (int i = 0; i < int(list.size()); ++i) {
    s.setArrayIndex(i);
    s.setValue("path", list[i].path);
    s.setValue("opened", list[i].opened);
  }
  s.endArray();
}

void addRecentFile(const QString& path) {
  QString abs = QFileInfo(path).absoluteFilePath();
  auto list = recentFiles();
  QSettings().remove("lastFile");
  std::erase_if(list, [&](const RecentFile& r) { return r.path == abs; });
  list.insert(list.begin(), {abs, QDateTime::currentDateTime()});
  if (list.size() > kMaxRecent) list.resize(kMaxRecent);
  writeRecent(list);
}

void mergeRecentFiles(const std::vector<RecentFile>& files) {
  auto list = recentFiles();
  for (auto& f : files) {
    auto it = std::ranges::find(list, f.path, &RecentFile::path);
    if (it == list.end()) list.push_back(f);
    else if (f.opened > it->opened) it->opened = f.opened;
  }
  std::ranges::stable_sort(list, std::greater{}, &RecentFile::opened);
  if (list.size() > kMaxRecent) list.resize(kMaxRecent);
  writeRecent(list);
}

void removeRecentFile(const QString& path) {
  auto list = recentFiles();
  std::erase_if(list, [&](const RecentFile& r) { return r.path == path; });
  writeRecent(list);
}

void clearRecentFiles() { writeRecent({}); }

bool toporImported() { return QSettings().value("topor/imported", false).toBool(); }
void setToporImported() { QSettings().setValue("topor/imported", true); }

bool openLastProject() { return QSettings().value("general/openLastProject", true).toBool(); }
void setOpenLastProject(bool on) { QSettings().setValue("general/openLastProject", on); }

}  // namespace xr::gui::AppSettings
