#include "gui/Project.h"

#include <QDateTime>
#include <QFileInfo>
#include <QUuid>

#include "io/BoardIO.h"

namespace xr::gui {

namespace {

template <class F>
void forEachFile(io::FsProjFolder& f, F&& fn) {
  for (auto& file : f.files) fn(file);
  for (auto& sub : f.folders) forEachFile(sub, fn);
}

template <class F>
void forEachFile(const io::FsProjFolder& f, F&& fn) {
  for (auto& file : f.files) fn(file);
  for (auto& sub : f.folders) forEachFile(sub, fn);
}

void removeFrom(io::FsProjFolder& f, const auto& match) {
  std::erase_if(f.files, match);
  for (auto& sub : f.folders) removeFrom(sub, match);
}

QString stamp(const QString& path) {
  return QFileInfo(path).lastModified().toString("yyyy-MM-dd HH:mm:ss");
}

}  // namespace

QString openableFile(const QString& path) {
  QFileInfo fi(path);
  if (fi.suffix().compare("fsx", Qt::CaseInsensitive) == 0) {
    QString fst = fi.absolutePath() + "/" + fi.completeBaseName() + ".fst";
    return QFileInfo::exists(fst) ? fst : QString();
  }
  return io::detectFormat(path.toStdString()) != io::Format::Unknown && fi.exists() ? path : QString();
}

std::optional<Project> Project::load(const QString& path, QString* error) {
  auto text = io::readFile(path.toStdString());
  if (!text) {
    if (error) *error = QString::fromStdString(text.error());
    return std::nullopt;
  }
  auto data = io::readFsProj(*text);
  if (!data) {
    if (error) *error = QString::fromStdString(data.error());
    return std::nullopt;
  }
  Project p;
  p.path_ = QFileInfo(path).absoluteFilePath();
  p.data_ = std::move(*data);
  return p;
}

Project Project::create(const QString& path) {
  Project p;
  p.path_ = QFileInfo(path).absoluteFilePath();
  p.data_.guid = QUuid::createUuid().toString(QUuid::WithBraces).toUpper().toStdString();
  return p;
}

bool Project::save(QString* error) const {
  auto r = io::writeFile(path_.toStdString(), io::writeFsProj(data_));
  if (!r && error) *error = QString::fromStdString(r.error());
  return bool(r);
}

bool Project::onDisk() const { return QFileInfo::exists(path_); }

QString Project::dir() const { return QFileInfo(path_).absolutePath(); }
QString Project::name() const { return QFileInfo(path_).completeBaseName(); }

QString Project::resolve(const io::FsProjFile& f) const {
  return QString::fromStdString(io::resolveProjectPath(dir().toStdString(), f.path));
}

bool Project::contains(const QString& absPath) const {
  bool found = false;
  for (auto* sec : {&data_.documents, &data_.autorouting})
    forEachFile(*sec, [&](const io::FsProjFile& f) {
      // A TopoR .fsx entry stands for the .fst saved next to it.
      found = found || resolve(f) == absPath || openableFile(resolve(f)) == absPath;
    });
  return found;
}

void Project::add(const QString& absPath, bool variant, io::FsProjFolder* folder) {
  if (absPath == path_ || contains(absPath)) return;
  io::FsProjFolder& target = folder ? *folder : variant ? data_.autorouting : data_.documents;
  io::FsProjFile f;
  f.path = io::projectEntry(dir().toStdString(), absPath.toStdString());
  // TopoR marks its own documents with «isopened»; imported sources do not have it.
  QString ext = QFileInfo(absPath).suffix().toLower();
  if (ext == "fst" || ext == "fsx") f.opened = false;
  f.dateChange = stamp(absPath).toStdString();
  target.files.push_back(std::move(f));
}

void Project::remove(const QString& absPath) {
  auto match = [&](const io::FsProjFile& f) { return resolve(f) == absPath; };
  removeFrom(data_.documents, match);
  removeFrom(data_.autorouting, match);
}

void Project::rename(const QString& oldPath, const QString& newPath) {
  for (auto* sec : {&data_.documents, &data_.autorouting})
    forEachFile(*sec, [&](io::FsProjFile& f) {
      if (resolve(f) == oldPath) f.path = io::projectEntry(dir().toStdString(), newPath.toStdString());
    });
}

void Project::setOpened(const QString& absPath) {
  for (auto* sec : {&data_.documents, &data_.autorouting})
    forEachFile(*sec, [&](io::FsProjFile& f) {
      bool me = resolve(f) == absPath || openableFile(resolve(f)) == absPath;
      if (f.opened || me) f.opened = me;
      if (me && QFileInfo::exists(resolve(f))) f.dateChange = stamp(resolve(f)).toStdString();
    });
}

QStringList Project::documents() const {
  QStringList out;
  forEachFile(data_.documents, [&](const io::FsProjFile& f) {
    QString p = openableFile(resolve(f));
    if (!p.isEmpty() && !out.contains(p)) out << p;
  });
  return out;
}

QString Project::openedDocument() const {
  QString out;
  for (auto* sec : {&data_.documents, &data_.autorouting})
    forEachFile(*sec, [&](const io::FsProjFile& f) {
      if (out.isEmpty() && f.opened.value_or(false)) out = openableFile(resolve(f));
    });
  return out;
}

}  // namespace xr::gui
