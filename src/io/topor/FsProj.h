#pragma once
// TopoR project file (.fsproj, version 2): sections «PCB» (documents) and «AutoRouting» (autorouting
// variants) listing files relative to the project, optionally in folders; other sections (Import, …)
// are kept as they are.
#include <optional>
#include <string>
#include <vector>

#include "io/BoardIO.h"
#include "io/xml/Xml.h"

namespace xr::io {

struct FsProjFile {
  std::string path;           // as written in the project (.\name, Z:\…)
  std::optional<bool> opened;  // «isopened» (TopoR writes it for its own documents only)
  std::string dateChange;      // "yyyy-mm-dd hh:mm:ss"
};

struct FsProjFolder {
  std::string name;
  bool expanded = true;
  std::vector<FsProjFile> files;
  std::vector<FsProjFolder> folders;
};

struct FsProject {
  std::string guid;
  FsProjFolder documents{"PCB"};
  FsProjFolder autorouting{"AutoRouting"};
  std::vector<xml::Element> extra;  // unknown sections, written back verbatim
};

Result<FsProject> readFsProj(const std::string& text);
std::string writeFsProj(const FsProject& p);

// Absolute POSIX path of a project entry: relative to the project directory (.\x), or a Wine path
// (Z:\home\… → /home/…, other drives through $WINEPREFIX/dosdevices). TopoR sometimes writes junk
// like ".\/\/\/\x": it is reduced to the file name.
std::string resolveProjectPath(const std::string& projectDir, const std::string& entry);
// Entry for a file: ".\name" inside the project directory, a Wine "Z:\…" path otherwise.
std::string projectEntry(const std::string& projectDir, const std::string& absPath);

}  // namespace xr::io
