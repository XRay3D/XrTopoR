#pragma once
// An open TopoR project (.fsproj): its documents and autorouting variants as absolute paths, with the
// edits the «Проект» panel makes. Saved after every change, as TopoR does.
#include <QString>
#include <QStringList>
#include <optional>

#include "io/topor/FsProj.h"

namespace xr::gui {

class Project {
 public:
  static std::optional<Project> load(const QString& path, QString* error);
  static Project create(const QString& path);  // new, empty
  bool save(QString* error = nullptr) const;

  const QString& path() const { return path_; }
  // A design opened alone gets a project of its own next to it, written at its first edit.
  bool onDisk() const;
  QString dir() const;
  QString name() const;  // file name without extension
  io::FsProject& data() { return data_; }
  const io::FsProject& data() const { return data_; }

  QString resolve(const io::FsProjFile& f) const;
  bool contains(const QString& absPath) const;
  // Adds a file (if not listed yet, and not the project file itself) to the documents or to the autorouting variants.
  void add(const QString& absPath, bool variant = false, io::FsProjFolder* folder = nullptr);
  void remove(const QString& absPath);
  void rename(const QString& oldPath, const QString& newPath);
  // Marks the document open in the editor (TopoR's «isopened»).
  void setOpened(const QString& absPath);
  // Documents of the project the editor can open (existing files of supported formats).
  QStringList documents() const;
  QString openedDocument() const;  // the one marked open, if it can be opened

 private:
  QString path_;
  io::FsProject data_;
};

// The file to open for a project entry: TopoR's binary .fsx is opened through the .fst saved next to it.
QString openableFile(const QString& path);

}  // namespace xr::gui
