#include "io/topor/FsProj.h"

#include <cctype>
#include <cstdlib>
#include <filesystem>

namespace xr::io {

namespace fs = std::filesystem;

namespace {

void readFolder(const xml::Element& e, FsProjFolder& f) {
  f.name = std::string(e.attr("name"));
  f.expanded = e.flag("isExpanded", true);
  for (auto& k : e.kids) {
    if (k.is("File")) {
      FsProjFile file;
      file.path = std::string(k.attr("path"));
      if (k.has("isopened")) file.opened = k.flag("isopened");
      file.dateChange = std::string(k.attr("dateChange"));
      f.files.push_back(std::move(file));
    } else if (k.is("Folder")) {
      FsProjFolder sub;
      readFolder(k, sub);
      f.folders.push_back(std::move(sub));
    }
  }
}

void writeFolder(xml::Writer& x, const char* tag, const FsProjFolder& f) {
  std::vector<std::pair<std::string, std::string>> attrs{{"name", f.name},
                                                         {"isExpanded", f.expanded ? "true" : "false"}};
  if (f.files.empty() && f.folders.empty()) {
    x.emptyList(tag, attrs);
    return;
  }
  xml::Element e;
  e.name = tag;
  e.attrs = attrs;
  auto fill = [](auto& self, xml::Element& el, const FsProjFolder& folder) -> void {
    for (auto& sub : folder.folders) {
      xml::Element s;
      s.name = "Folder";
      s.attrs = {{"name", sub.name}, {"isExpanded", sub.expanded ? "true" : "false"}};
      self(self, s, sub);
      el.kids.push_back(std::move(s));
    }
    for (auto& file : folder.files) {
      xml::Element fe;
      fe.name = "File";
      fe.attrs.emplace_back("path", file.path);
      if (file.opened) fe.attrs.emplace_back("isopened", *file.opened ? "1" : "0");
      if (!file.dateChange.empty()) fe.attrs.emplace_back("dateChange", file.dateChange);
      el.kids.push_back(std::move(fe));
    }
  };
  fill(fill, e, f);
  x.element(e);
}

}  // namespace

Result<FsProject> readFsProj(const std::string& text) {
  auto doc = xml::parse(text);
  if (!doc) return std::unexpected(doc.error());
  if (!doc->is("Project")) return std::unexpected(std::string("not a TopoR project file"));
  FsProject p;
  for (auto& k : doc->kids) {
    if (k.is("Version")) continue;
    if (k.is("GUID")) {
      p.guid = k.text;
    } else if (k.is("Documents")) {
      for (auto* s : k.findAll("Section")) {
        if (s->attr("name") == "AutoRouting") readFolder(*s, p.autorouting);
        else readFolder(*s, p.documents);
      }
    } else {
      p.extra.push_back(k);
    }
  }
  return p;
}

std::string writeFsProj(const FsProject& p) {
  xml::Writer x("   ", "\r\n");
  x.declaration();
  x.comment("********************************************");
  x.comment("   Format  : TopoR Project file             ");
  x.comment("   Version : 2                              ");
  x.comment("   Program : XrTopoR                        ");
  x.comment("********************************************");
  x.blank();
  x.open("Project");
  x.empty("Version", {{"current", "2"}});
  x.textElement("GUID", p.guid);
  x.open("Documents");
  writeFolder(x, "Section", p.documents);
  writeFolder(x, "Section", p.autorouting);
  x.close();
  for (auto& e : p.extra) x.element(e);
  x.close();
  return std::move(x).str();
}

namespace {

// Windows paths ignore case: an entry finds the file whatever its case on disk.
std::string matchCase(const fs::path& p) {
  std::error_code ec;
  if (fs::exists(p, ec) || !fs::is_directory(p.parent_path(), ec)) return p.string();
  auto lower = [](std::string s) {
    for (auto& c : s) c = char(std::tolower(static_cast<unsigned char>(c)));
    return s;
  };
  std::string want = lower(p.filename().string());
  for (auto& e : fs::directory_iterator(p.parent_path(), ec))
    if (lower(e.path().filename().string()) == want) return e.path().string();
  return p.string();
}

}  // namespace

std::string resolveProjectPath(const std::string& projectDir, const std::string& entry, const std::string& winePrefix) {
  std::string e = entry;
  for (auto& c : e)
    if (c == '\\') c = '/';
  // Wine drive paths.
  if (e.size() >= 2 && std::isalpha(static_cast<unsigned char>(e[0])) && e[1] == ':') {
    char drive = char(std::tolower(static_cast<unsigned char>(e[0])));
    std::string rest = e.substr(2);
    if (drive == 'z') return matchCase(fs::path(rest).lexically_normal());
    const char* env = std::getenv("WINEPREFIX");
    fs::path wine = !winePrefix.empty() ? fs::path(winePrefix)
                    : env               ? fs::path(env)
                                        : fs::path(std::getenv("HOME") ? std::getenv("HOME") : "") / ".wine";
    std::error_code ec;
    fs::path root = fs::weakly_canonical(wine / "dosdevices" / (std::string(1, drive) + ":"), ec);
    return matchCase((root / fs::path(rest).relative_path()).lexically_normal());
  }
  // Relative: TopoR's ".\/\/\/\x" junk collapses to the file name.
  fs::path rel(e);
  if (e.find("/./") != std::string::npos || e.find("//") != std::string::npos) rel = rel.filename();
  return matchCase((fs::path(projectDir) / rel).lexically_normal());
}

std::string projectEntry(const std::string& projectDir, const std::string& absPath) {
  fs::path rel = fs::path(absPath).lexically_relative(projectDir);
  std::string out;
  if (!rel.empty() && *rel.begin() != "..") {
    out = ".\\" + rel.string();
  } else {
    out = "Z:" + fs::path(absPath).lexically_normal().string();
  }
  for (auto& c : out)
    if (c == '/') c = '\\';
  return out;
}

}  // namespace xr::io
