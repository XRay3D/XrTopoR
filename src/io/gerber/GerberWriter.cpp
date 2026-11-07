#include "io/gerber/GerberWriter.h"

#include "core/Padstack.h"

#include <algorithm>
#include <cstdio>
#include <filesystem>
#include <map>

#include "io/BoardIO.h"

namespace xr::io {

namespace {

// Gerber coordinates: mm, format 4.6, Y up (internal frame is Y down).
std::string gc(double nm) {
  char buf[32];
  std::snprintf(buf, sizeof buf, "%lld", static_cast<long long>(std::llround(nm)));  // 1e-6 mm = 1 nm
  return buf;
}
std::string mmStr(double nm) {
  char buf[32];
  std::snprintf(buf, sizeof buf, "%.6f", nm / kNmPerMm);
  return buf;
}

class Gerber {
 public:
  Gerber(std::string function, std::string polarity = "Positive") {
    out_ += "%TF.GenerationSoftware,XrTopoR,xrtopor,0.1*%\n";
    out_ += "%TF.FileFunction," + function + "*%\n";
    out_ += "%TF.FilePolarity," + polarity + "*%\n";
    out_ += "%FSLAX46Y46*%\n%MOMM*%\n%LPD*%\nG01*\nG75*\n";
  }

  // Circular aperture (diameter in nm), returns D code.
  int circle(double dia) {
    std::string key = "C," + mmStr(dia);
    auto it = apertures_.find(key);
    if (it != apertures_.end()) return it->second;
    int d = next_++;
    apertures_[key] = d;
    defs_ += "%ADD" + std::to_string(d) + key + "*%\n";
    return d;
  }
  int rect(double w, double h) {
    std::string key = "R," + mmStr(w) + "X" + mmStr(h);
    auto it = apertures_.find(key);
    if (it != apertures_.end()) return it->second;
    int d = next_++;
    apertures_[key] = d;
    defs_ += "%ADD" + std::to_string(d) + key + "*%\n";
    return d;
  }
  int obround(double w, double h) {
    std::string key = "O," + mmStr(w) + "X" + mmStr(h);
    auto it = apertures_.find(key);
    if (it != apertures_.end()) return it->second;
    int d = next_++;
    apertures_[key] = d;
    defs_ += "%ADD" + std::to_string(d) + key + "*%\n";
    return d;
  }

  void select(int d) {
    if (d != cur_) { body_ += "D" + std::to_string(d) + "*\n"; cur_ = d; }
  }
  void flash(Vec2 p) { body_ += "X" + gc(p.x) + "Y" + gc(-p.y) + "D03*\n"; }
  void move(Vec2 p) { body_ += "X" + gc(p.x) + "Y" + gc(-p.y) + "D02*\n"; }
  void line(Vec2 p) { body_ += "X" + gc(p.x) + "Y" + gc(-p.y) + "D01*\n"; }
  void stroke(const Polyline& pts, double width) {
    if (pts.empty()) return;
    select(circle(std::max(width, 1000.0)));
    move(pts[0]);
    if (pts.size() == 1) { line(pts[0]); return; }
    for (size_t i = 1; i < pts.size(); ++i) line(pts[i]);
  }
  void arc(Vec2 s, Vec2 m, Vec2 e, double width) {
    auto g = ArcGeom::fromThreePoints(s, m, e);
    if (!g.valid) { stroke({s, e}, width); return; }
    select(circle(std::max(width, 1000.0)));
    move(s);
    // Internal sweep is in a Y-down frame; flipping Y reverses the direction.
    body_ += g.sweep > 0 ? "G02*\n" : "G03*\n";
    Vec2 ij = g.center - s;
    body_ += "X" + gc(e.x) + "Y" + gc(-e.y) + "I" + gc(ij.x) + "J" + gc(-ij.y) + "D01*\n";
    body_ += "G01*\n";
  }
  void region(const Polyline& poly) {
    if (poly.size() < 3) return;
    body_ += "G36*\n";
    move(poly[0]);
    for (size_t i = 1; i < poly.size(); ++i) line(poly[i]);
    line(poly[0]);
    body_ += "G37*\n";
  }
  void attr(const std::string& a) { body_ += "%TO." + a + "*%\n"; }
  void clearAttr() { body_ += "%TD*%\n"; }

  // Pad flash: axis-aligned simple shapes use standard apertures, everything else is a region.
  void pad(const Pad& p, double expand) {
    Vec2 c = p.pos.v();
    double w = double(p.shape.w) + 2 * expand, h = double(p.shape.h) + 2 * expand;
    double ang = std::fmod(std::abs(p.angle), 180.0);
    bool axis = ang < 1e-6 || std::abs(ang - 90) < 1e-6;
    if (std::abs(ang - 90) < 1e-6) std::swap(w, h);
    switch (p.shape.kind) {
      case PadShapeKind::Circle:
        select(circle(w));
        flash(c);
        return;
      case PadShapeKind::Rect:
        if (axis) { select(rect(w, h)); flash(c); return; }
        break;
      case PadShapeKind::Oval:
        if (axis) { select(obround(w, h)); flash(c); return; }
        break;
      default: break;
    }
    region(p.shapeGeom(expand).outline(5000));
  }

  // Any shape: a round one by a circular aperture, the rest as a region.
  void shape(const Shape& s) {
    if (s.kind == Shape::Kind::Point) {
      select(circle(2 * s.r));
      flash(s.a);
      return;
    }
    region(s.outline(5000));
  }

  std::string str() const { return out_ + defs_ + body_ + "M02*\n"; }

 private:
  std::string out_, defs_, body_;
  std::map<std::string, int> apertures_;
  int next_ = 10;
  int cur_ = -1;
};

std::string layerFn(const Board& b, LayerId l) {
  const Layer& L = b.layers[l];
  int n = b.copperCount();
  int idx = L.copperIndex + 1;
  std::string pos = L.copperIndex == 0 ? "Top" : (L.copperIndex == n - 1 ? "Bot" : "Inr");
  return "Copper,L" + std::to_string(idx) + "," + pos;
}

std::string safe(std::string s) {
  for (auto& c : s)
    if (!std::isalnum(static_cast<unsigned char>(c)) && c != '-' && c != '_') c = '_';
  return s;
}

void addGraphic(Gerber& g, const Graphic& gr) {
  double w = double(gr.width);
  switch (gr.kind) {
    case GraphicKind::Line: g.stroke({gr.a, gr.b}, w); break;
    case GraphicKind::Arc: g.arc(gr.a, gr.m, gr.b, w); break;
    case GraphicKind::Circle: {
      auto pts = Shape::circle(gr.a, (gr.b - gr.a).len()).outline(2000);
      pts.push_back(pts.front());
      g.stroke(pts, w);
      break;
    }
    case GraphicKind::Rect:
      g.stroke({gr.a, {gr.b.x, gr.a.y}, gr.b, {gr.a.x, gr.b.y}, gr.a}, w);
      break;
    case GraphicKind::Poly: {
      auto pts = gr.path(2000);  // arcs of the sides in chords
      if (gr.filled) { g.region(pts); break; }
      if (!pts.empty()) pts.push_back(pts.front());
      g.stroke(pts, w);
      break;
    }
  }
}

std::string excellon(const Board& b, bool plated) {
  std::map<Coord, std::vector<std::pair<Vec2, Vec2>>> tools;  // drill -> (start, end) (end == start for round)
  for (auto& p : b.pads) {
    if (p.drill <= 0 || p.plated != plated) continue;
    Coord d = std::min(p.drill, p.drillH > 0 ? p.drillH : p.drill);
    Vec2 c = p.pos.v(), s = c, e = c;
    if (p.drillH > 0 && p.drillH != p.drill) {
      double len = double(std::abs(p.drillH - p.drill)) / 2;
      Vec2 dir = rotateBoard(p.drillH > p.drill ? Vec2(0, 1) : Vec2(1, 0), p.angle);
      s = c - dir * len;
      e = c + dir * len;
    }
    tools[d].push_back({s, e});
  }
  if (plated)
    for (auto& v : b.vias) tools[v.drill].push_back({v.pos.v(), v.pos.v()});
  std::string out = "M48\n; DRILL file XrTopoR\n";
  out += std::string("; #@! TF.FileFunction,") + (plated ? "Plated" : "NonPlated") + ",1," +
         std::to_string(b.copperCount()) + "," + (plated ? "PTH" : "NPTH") + "\n";
  out += "FMAT,2\nMETRIC\n";
  int t = 1;
  std::map<Coord, int> tnum;
  for (auto& [d, holes] : tools) {
    char buf[64];
    std::snprintf(buf, sizeof buf, "T%dC%.3f\n", t, d / double(kNmPerMm));
    out += buf;
    tnum[d] = t++;
  }
  out += "%\nG90\nG05\n";
  auto xy = [](Vec2 p) {
    char buf[64];
    std::snprintf(buf, sizeof buf, "X%.4fY%.4f", p.x / kNmPerMm, -p.y / kNmPerMm);
    return std::string(buf);
  };
  for (auto& [d, holes] : tools) {
    out += "T" + std::to_string(tnum[d]) + "\n";
    for (auto& [s, e] : holes) {
      if (s == e) out += xy(s) + "\n";
      else out += xy(s) + "G85" + xy(e) + "\n";
    }
  }
  out += "M30\n";
  return out;
}

}  // namespace

std::vector<GerberFile> makeGerbers(const Board& b, const GerberOptions& opt) {
  std::vector<GerberFile> files;
  std::string base = safe(b.name.empty() ? "board" : b.name);
  auto cu = b.copperLayers();

  for (LayerId l : cu) {
    Gerber g(layerFn(b, l));
    for (auto& z : b.zones)
      if (z.layer == l)
        for (auto& f : z.filled) g.region(f);
    for (auto& p : b.pads) {
      if (!p.onLayer(l)) continue;
      if (p.uniform) g.pad(p, 0);
      else if (auto s = padShapeOn(b, p, l)) g.shape(*s);  // another size on this layer
    }
    for (auto& v : b.vias) {
      if (!v.onLayer(l)) continue;
      g.select(g.circle(double(v.diameter)));
      g.flash(v.pos.v());
    }
    for (auto& t : b.tracks) {
      if (t.layer != l) continue;
      if (t.isArc()) g.arc(t.a.v(), t.mid->v(), t.b.v(), double(t.width));
      else g.stroke({t.a.v(), t.b.v()}, double(t.width));
    }
    files.push_back({base + "-" + safe(b.layers[l].name) + ".gbr", g.str()});
  }

  auto sideLayers = [&](LayerKind k, Side s) {
    std::vector<LayerId> out;
    for (LayerId i = 0; i < LayerId(b.layers.size()); ++i)
      if (b.layers[i].kind == k && b.layers[i].side == s) out.push_back(i);
    return out;
  };
  for (Side side : {Side::Top, Side::Bottom}) {
    LayerId cuL = side == Side::Top ? b.topCopper() : b.bottomCopper();
    std::string sfx = side == Side::Top ? "Top" : "Bot";
    // A pad's opening in the mask (its paste): its stack's detail on that layer; a stack with no detail on any
    // mask (paste) layer opens the mask around every pad by maskExpansion (pastes the planar pads), as the
    // designs from other CADs need.
    auto technical = [&](Gerber& g, LayerKind kind, auto&& fallback) {
      auto ls = sideLayers(kind, side);
      LayerId tl = ls.empty() ? -1 : ls.front();
      for (auto& p : b.pads) {
        bool stacked = tl >= 0 && p.padstack >= 0 && size_t(p.padstack) < b.padstacks.size();
        if (stacked && padstackHasDetails(b, b.padstacks[size_t(p.padstack)], kind)) {
          if (auto s = padShapeOn(b, p, tl)) g.shape(*s);
        } else if (p.onLayer(cuL)) {
          fallback(p);
        }
      }
      // Vias open where their type has a pad on the layer (tented otherwise).
      if (tl >= 0)
        for (auto& v : b.vias)
          if (Coord dia = viaDiameterOn(b, v, tl); dia > 0) {
            g.select(g.circle(double(dia)));
            g.flash(v.pos.v());
          }
    };
    if (opt.mask) {
      Gerber g("Soldermask," + sfx, "Negative");
      technical(g, LayerKind::Mask, [&](const Pad& p) { g.pad(p, double(opt.maskExpansion)); });
      files.push_back({base + "-" + (side == Side::Top ? "F_Mask" : "B_Mask") + ".gbr", g.str()});
    }
    if (opt.paste) {
      Gerber g("Paste," + sfx);
      technical(g, LayerKind::Paste, [&](const Pad& p) {
        if (p.drill == 0) g.pad(p, 0);
      });
      files.push_back({base + "-" + (side == Side::Top ? "F_Paste" : "B_Paste") + ".gbr", g.str()});
    }
    if (opt.silk) {
      Gerber g("Legend," + sfx);
      auto ls = sideLayers(LayerKind::Silk, side);
      auto onSilk = [&](LayerId l) { return r::contains(ls, l); };
      for (auto& c : b.components)
        for (auto& gr : c.graphics)
          if (onSilk(gr.layer)) addGraphic(g, gr);
      for (auto& gr : b.graphics)
        if (onSilk(gr.layer)) addGraphic(g, gr);
      files.push_back({base + "-" + (side == Side::Top ? "F_Silkscreen" : "B_Silkscreen") + ".gbr", g.str()});
    }
  }
  {
    Gerber g("Profile,NP");
    for (auto& loop : b.outline) {
      auto pts = loop;
      if (!pts.empty()) pts.push_back(pts.front());
      g.stroke(pts, 0.1 * kNmPerMm);
    }
    files.push_back({base + "-Edge_Cuts.gbr", g.str()});
  }
  files.push_back({base + "-PTH.drl", excellon(b, true)});
  files.push_back({base + "-NPTH.drl", excellon(b, false)});
  return files;
}

Result<void> writeGerbers(const Board& b, const std::string& dir, const GerberOptions& opt) {
  std::error_code ec;
  std::filesystem::create_directories(dir, ec);
  for (auto& f : makeGerbers(b, opt))
    if (auto r = writeFile((std::filesystem::path(dir) / f.name).string(), f.content); !r) return r;
  return {};
}

}  // namespace xr::io
