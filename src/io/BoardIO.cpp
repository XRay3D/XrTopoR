#include "io/BoardIO.h"

#include <algorithm>
#include <cctype>
#include <filesystem>
#include <fstream>
#include <sstream>

namespace xr::io {

static std::string lower(std::string s) {
  for (auto& c : s) c = char(std::tolower(static_cast<unsigned char>(c)));
  return s;
}

Format detectFormat(const std::string& path) {
  std::string ext = lower(std::filesystem::path(path).extension().string());
  if (ext == ".kicad_pcb") return Format::Kicad;
  if (ext == ".dsn") return Format::Dsn;
  if (ext == ".ses") return Format::Ses;
  if (ext == ".fst") return Format::Fst;
  if (ext == ".pcb") {
    std::ifstream f(path, std::ios::binary);
    char buf[16] = {};
    f.read(buf, 11);
    if (std::string(buf, 11) == "ACCEL_ASCII") return Format::Pcad;
    return Format::Unknown;  // binary P-CAD is not supported
  }
  return Format::Unknown;
}

Result<std::string> readFile(const std::string& path) {
  std::ifstream f(path, std::ios::binary);
  if (!f) return std::unexpected("cannot open " + path);
  std::ostringstream ss;
  ss << f.rdbuf();
  return ss.str();
}

Result<void> writeFile(const std::string& path, const std::string& data) {
  std::ofstream f(path, std::ios::binary);
  if (!f) return std::unexpected("cannot write " + path);
  f << data;
  if (!f) return std::unexpected("write failed: " + path);
  return {};
}

Result<BoardPtr> loadBoard(const std::string& path) {
  Format fmt = detectFormat(path);
  auto text = readFile(path);
  if (!text) return std::unexpected(text.error());
  Result<BoardPtr> b;
  switch (fmt) {
    case Format::Kicad: b = readKicad(*text, path); break;
    case Format::Dsn: b = readDsn(*text, path); break;
    case Format::Pcad: b = readPcad(*text, path); break;
    case Format::Fst: b = readFst(*text, path); break;
    default: return std::unexpected("unsupported file format: " + path);
  }
  if (b && (*b)->name.empty()) (*b)->name = std::filesystem::path(path).stem().string();
  return b;
}

Result<void> saveBoard(const Board& b, const std::string& path) {
  switch (detectFormat(path)) {
    case Format::Kicad: {
      auto r = writeFile(path, writeKicad(b));
      if (!r) return r;
      // The board's net classes live in the project file: an existing one next to the target is kept,
      // otherwise the source board's project is copied, or one is generated from the model.
      auto pro = std::filesystem::path(path).replace_extension(".kicad_pro");
      std::error_code ec;
      if (std::filesystem::exists(pro, ec)) return r;
      if (b.source && b.source->format == SourceDoc::Format::Kicad) {
        auto srcPro = std::filesystem::path(b.source->path).replace_extension(".kicad_pro");
        if (std::filesystem::exists(srcPro, ec) && std::filesystem::copy_file(srcPro, pro, ec)) return r;
      }
      return writeFile(pro.string(), writeKicadProject(b));
    }
    case Format::Dsn: return writeFile(path, writeDsn(b));
    case Format::Ses: return writeFile(path, writeSes(b));
    case Format::Fst: return writeFile(path, writeFst(b));
    default: return std::unexpected("unsupported output format: " + path);
  }
}

void buildOutline(Board& b, LayerId edgeLayer) {
  // Collect open chains and closed loops from graphics on the edge layer.
  std::vector<Polyline> chains;
  auto collect = [&](const Graphic& g) {
    if (g.layer != edgeLayer) return;
    switch (g.kind) {
      case GraphicKind::Line: chains.push_back({g.a, g.b}); break;
      case GraphicKind::Arc: {
        auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
        if (arc.valid) chains.push_back(arc.tessellate(5000));
        break;
      }
      case GraphicKind::Circle: {
        double r = (g.b - g.a).len();
        auto pl = Shape::circle(g.a, r).outline(5000);
        pl.push_back(pl.front());
        chains.push_back(pl);
        break;
      }
      case GraphicKind::Rect:
        chains.push_back({g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}, g.a});
        break;
      case GraphicKind::Poly: {
        auto p = g.pts;
        if (!p.empty()) p.push_back(p.front());
        chains.push_back(p);
        break;
      }
    }
  };
  for (auto& g : b.graphics) collect(g);
  for (auto& c : b.components)
    for (auto& g : c.graphics) collect(g);

  const double tol = 20000;  // 20 um
  auto near = [&](Vec2 a, Vec2 c) { return (a - c).len() <= tol; };
  std::vector<Polyline> loops;
  std::vector<bool> used(chains.size(), false);
  for (size_t i = 0; i < chains.size(); ++i) {
    if (used[i] || chains[i].size() < 2) continue;
    used[i] = true;
    Polyline loop = chains[i];
    bool grew = true;
    while (grew && !near(loop.front(), loop.back())) {
      grew = false;
      for (size_t j = 0; j < chains.size(); ++j) {
        if (used[j] || chains[j].size() < 2) continue;
        auto& c = chains[j];
        if (near(loop.back(), c.front())) loop.insert(loop.end(), c.begin() + 1, c.end());
        else if (near(loop.back(), c.back())) loop.insert(loop.end(), c.rbegin() + 1, c.rend());
        else if (near(loop.front(), c.back())) loop.insert(loop.begin(), c.begin(), c.end() - 1);
        else if (near(loop.front(), c.front())) loop.insert(loop.begin(), c.rbegin(), c.rend() - 1);
        else continue;
        used[j] = true;
        grew = true;
      }
    }
    if (loop.size() >= 4 && near(loop.front(), loop.back())) {
      loop.pop_back();
      loops.push_back(loop);
    }
  }
  std::sort(loops.begin(), loops.end(),
            [](const Polyline& a, const Polyline& c) { return std::abs(polygonArea(a)) > std::abs(polygonArea(c)); });
  b.outline = std::move(loops);
}

}  // namespace xr::io
