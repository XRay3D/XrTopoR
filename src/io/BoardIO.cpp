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
  if (ext == ".pcb") {
    std::ifstream f(path, std::ios::binary);
    char buf[16] = {};
    f.read(buf, 11);
    if (std::string(buf, 11) == "ACCEL_ASCII") return Format::Pcad;
    return Format::Unknown;  // binary P-CAD is not supported
  }
  return Format::Unknown;
}

std::string readFile(const std::string& path, std::string* err) {
  std::ifstream f(path, std::ios::binary);
  if (!f) {
    if (err) *err = "cannot open " + path;
    return {};
  }
  std::ostringstream ss;
  ss << f.rdbuf();
  return ss.str();
}

bool writeFile(const std::string& path, const std::string& data, std::string* err) {
  std::ofstream f(path, std::ios::binary);
  if (!f) {
    if (err) *err = "cannot write " + path;
    return false;
  }
  f << data;
  return bool(f);
}

std::unique_ptr<Board> loadBoard(const std::string& path, std::string* err) {
  Format fmt = detectFormat(path);
  std::string text = readFile(path, err);
  if (text.empty()) return nullptr;
  std::unique_ptr<Board> b;
  switch (fmt) {
    case Format::Kicad: b = readKicad(text, path, err); break;
    case Format::Dsn: b = readDsn(text, path, err); break;
    case Format::Pcad: b = readPcad(text, path, err); break;
    default:
      if (err) *err = "unsupported file format: " + path;
      return nullptr;
  }
  if (b && b->name.empty()) b->name = std::filesystem::path(path).stem().string();
  return b;
}

bool saveBoard(const Board& b, const std::string& path, std::string* err) {
  switch (detectFormat(path)) {
    case Format::Kicad: return writeFile(path, writeKicad(b), err);
    case Format::Dsn: return writeFile(path, writeDsn(b), err);
    case Format::Ses: return writeFile(path, writeSes(b), err);
    default:
      if (err) *err = "unsupported output format: " + path;
      return false;
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
