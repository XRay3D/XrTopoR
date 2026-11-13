#include "core/Edit.h"
#include "io/BoardIO.h"

#include "core/Padstack.h"

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
    if (!f) return Format::Pcad;  // a file to be written
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
  // The crumbs with a loose end go as the design comes in (core/Edit.h; the twins where its model is built).
  if (b) (*b)->junkRemoved = edit::removeJunkTracks(**b, false);
  if (b && (*b)->name.empty()) (*b)->name = std::filesystem::path(path).stem().string();
  // Every pad has a stack: those the reader did not give one share one with the pads alike.
  if (b) buildPadstacksFromPads(**b);
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
    case Format::Pcad: {
      auto text = writePcad(b);
      if (!text) return std::unexpected(text.error());
      return writeFile(path, *text);
    }
    case Format::Dsn: return writeFile(path, writeDsn(b));
    case Format::Ses: return writeFile(path, writeSes(b));
    case Format::Fst: return writeFile(path, writeFst(b));
    default: return std::unexpected("unsupported output format: " + path);
  }
}

void rebuildOutline(Board& b) {
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.isEdge(l)) {
      buildOutline(b, l);
      return;
    }
}

void buildOutline(Board& b, LayerId edgeLayer) {
  // Collect open chains and closed loops from graphics on the edge layer.
  std::vector<Polyline> chains;
  auto collect = [&](const Graphic& g) {
    if (g.layer != edgeLayer) return;
    auto p = g.path();
    if (g.closed() && !p.empty()) p.push_back(p.front());
    if (p.size() >= 2) chains.push_back(std::move(p));
  };
  for (auto& g : b.graphics) collect(g);
  for (auto& c : b.components)
    for (auto& g : c.graphics) collect(g);

  const double tol = 20000;  // 20 um
  // What of a piece may stick out past the place where another meets it: a line drawn a little over the end of the
  // arc it runs into is the same corner (P-CAD draws the board's edge of loose lines and arcs, and nothing makes
  // their ends meet: RMT19M_A68U's left side has two lines 0.25 mm over the ends of their arcs — its contour did
  // not close, the slot inside the board was taken for the board, and no copper area could be poured).
  const double kStub = 1.0 * kNmPerMm;
  auto near = [&](Vec2 a, Vec2 c) { return (a - c).len() <= tol; };
  auto lengthOf = [](const Polyline& c, size_t from, size_t to) {
    double sum = 0;
    for (size_t k = from; k + 1 <= to; ++k) sum += (c[k + 1] - c[k]).len();
    return sum;
  };
  std::vector<Polyline> loops;
  std::vector<bool> used(chains.size(), false);
  // Closed figures (polygons, rectangles, circles) are loops of their own; only open pieces chain up,
  // and a chain stops growing as soon as it closes.
  auto closed = [&](const Polyline& c) { return c.size() >= 4 && near(c.front(), c.back()); };
  // The loop grown at its end by one piece: end to end; or the loop's end lies on the piece (the piece goes on from
  // there by its longer part, the short one being what stuck out); or the piece's end lies on the loop's last
  // stretch, a little before its end (the loop is cut back to it).
  auto extend = [&](Polyline& loop) {
    const Vec2 end = loop.back();
    for (size_t j = 0; j < chains.size(); ++j) {
      if (used[j] || chains[j].size() < 2 || closed(chains[j])) continue;
      const Polyline& c = chains[j];
      if (near(end, c.front())) loop.insert(loop.end(), c.begin() + 1, c.end());
      else if (near(end, c.back())) loop.insert(loop.end(), c.rbegin() + 1, c.rend());
      else continue;
      used[j] = true;
      return true;
    }
    for (size_t j = 0; j < chains.size(); ++j) {
      if (used[j] || chains[j].size() < 2 || closed(chains[j])) continue;
      const Polyline& c = chains[j];
      for (size_t k = 0; k + 1 < c.size(); ++k) {
        if (distPointSegment(end, c[k], c[k + 1]) > tol) continue;
        const Vec2 at = closestPointOnSegment(end, c[k], c[k + 1]);
        const double before = lengthOf(c, 0, k) + (at - c[k]).len(), after = (c[k + 1] - at).len() + lengthOf(c, k + 1, c.size() - 1);
        if (std::min(before, after) > kStub) continue;  // (a real tee: not this corner)
        if (after >= before) loop.insert(loop.end(), c.begin() + long(k) + 1, c.end());
        else loop.insert(loop.end(), c.rbegin() + long(c.size() - 1 - k), c.rend());
        used[j] = true;
        return true;
      }
    }
    if (loop.size() >= 2) {
      const Vec2 a = loop[loop.size() - 2];
      for (size_t j = 0; j < chains.size(); ++j) {
        if (used[j] || chains[j].size() < 2 || closed(chains[j])) continue;
        const Polyline& c = chains[j];
        for (bool front : {true, false}) {
          const Vec2 e = front ? c.front() : c.back();
          if (distPointSegment(e, a, end) > tol || (e - end).len() > kStub || (e - a).len() <= tol) continue;
          loop.back() = e;
          if (front) loop.insert(loop.end(), c.begin() + 1, c.end());
          else loop.insert(loop.end(), c.rbegin() + 1, c.rend());
          used[j] = true;
          return true;
        }
      }
    }
    return false;
  };
  // The loop closed on itself the same three ways: its ends met, or one of them lies on the stretch at the other.
  auto close = [&](Polyline& loop) {
    if (loop.size() < 4) return false;
    if (near(loop.front(), loop.back())) return true;
    if (distPointSegment(loop.back(), loop[0], loop[1]) <= tol && (loop.back() - loop[0]).len() <= kStub) {
      loop.front() = loop.back();
      return true;
    }
    if (distPointSegment(loop.front(), loop[loop.size() - 2], loop.back()) <= tol && (loop.front() - loop.back()).len() <= kStub) {
      loop.back() = loop.front();
      return true;
    }
    return false;
  };
  for (size_t i = 0; i < chains.size(); ++i) {
    if (used[i] || chains[i].size() < 2) continue;
    used[i] = true;
    Polyline loop = chains[i];
    while (!close(loop)) {
      if (extend(loop)) continue;
      r::reverse(loop);  // (at its other end)
      if (!extend(loop)) break;
    }
    if (close(loop)) {
      loop.pop_back();
      if (loop.size() >= 3) loops.push_back(loop);
    }
  }
  r::sort(loops, std::greater{}, [](const Polyline& p) { return std::abs(polygonArea(p)); });
  b.outline = std::move(loops);
}

}  // namespace xr::io
