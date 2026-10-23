// TopoR PCB 1.2.0 (.fst) writer: emits every section TopoR needs to open the design (header,
// layer stack, local library, outline, placement, netlist, rules, routing). Coordinates are
// written in mm with the Y axis up; footprints are described in the top-side frame.
#include <algorithm>
#include <chrono>
#include <cmath>
#include <format>
#include <iterator>
#include <map>
#include <set>

#include "io/topor/Fst.h"
#include "io/xml/Xml.h"

namespace xr::io {

namespace {

std::string num(double v, int decimals = 4) {
  if (std::abs(v) < 0.5 * std::pow(10.0, -decimals)) return "0";
  std::string s = std::format("{:.{}f}", v, decimals);
  if (s.find('.') != std::string::npos) {
    while (s.back() == '0') s.pop_back();
    if (s.back() == '.') s.pop_back();
  }
  return s;
}
std::string mm(double nm) { return num(nm / kNmPerMm); }
std::string deg(double a) {
  a = std::fmod(a + 720.0, 360.0);
  return num(a, 3);
}
std::string onOff(bool v) { return v ? "on" : "off"; }

// A distinct padstack: pad geometry plus the copper pattern seen from the component side.
struct PadKey {
  PadShapeKind kind;
  Coord w, h, drill, drillH;
  int rr;  // rratio in 1/1000
  bool plated, through, mirrorPoly;
  std::vector<std::pair<Coord, Coord>> poly;
  auto operator<=>(const PadKey&) const = default;
};

struct FpPadRec {
  std::string number, padstack;
  Vec2 org;  // footprint frame (mm, Y up)
  double angle = 0;
  bool flipped = false;
};

struct FpKey {
  std::string name;
  std::vector<std::tuple<std::string, std::string, long long, long long, int, bool>> pads;
  std::vector<std::tuple<int, std::string, long long, long long, long long, long long, long long, long long>> graphics;
  auto operator<=>(const FpKey&) const = default;
};

struct Writer {
  const Board& b;
  xml::Writer x{"\t", "\r\n"};
  std::vector<std::string> layerName;  // per board layer: TopoR layer name ("" = not exported)
  std::map<PadKey, std::string> padstacks;
  std::vector<std::string> padPadstack;  // per board pad
  std::map<std::pair<Coord, Coord>, std::string> viastacks;
  std::map<FpKey, std::string> footprints;
  std::vector<std::string> compFootprint;  // per component
  std::set<std::string> fpNames;
  std::string defaultVia;

  explicit Writer(const Board& board) : b(board) {}

  // --- helpers ---
  Vec2 toFst(Vec2 p) const { return {p.x / kNmPerMm, -p.y / kNmPerMm}; }
  Vec2 toFst(Point p) const { return toFst(p.v()); }

  void xy(std::string_view tag, Vec2 p) { x.empty(tag, {{"x", num(p.x)}, {"y", num(p.y)}}); }

  std::string netName(int net) const { return net >= 0 && net < int(b.nets.size()) ? b.nets[net].name : ""; }

  // Footprint-frame (top side, Y up, mm) point of a component-relative board vector.
  Vec2 localToFst(Vec2 local, bool bottom) const {
    Vec2 p = toFst(local);
    if (bottom) p.x = -p.x;
    return p;
  }
  // Board point -> footprint frame of component c.
  Vec2 absToFp(Vec2 abs, const Component& c) const {
    return localToFst(rotateBoard(abs - c.pos.v(), -c.angle), c.side == Side::Bottom);
  }

  // --- layers ---
  void assignLayerNames() {
    layerName.assign(b.layers.size(), "");
    std::set<std::string> used;
    auto unique = [&](std::string n) {
      std::string r = n;
      for (int k = 2; used.count(r); ++k) r = n + "_" + std::to_string(k);
      used.insert(r);
      return r;
    };
    for (size_t i = 0; i < b.layers.size(); ++i) {
      const Layer& l = b.layers[i];
      if (l.kind == LayerKind::Edge || l.kind == LayerKind::Courtyard) continue;
      if (l.kind != LayerKind::Copper && l.side == Side::None) continue;
      layerName[i] = unique(l.name.empty() ? "Layer" + std::to_string(i) : l.name);
    }
  }

  static const char* layerType(LayerKind k) {
    switch (k) {
      case LayerKind::Copper: return "Signal";
      case LayerKind::Silk: return "Silk";
      case LayerKind::Mask: return "Mask";
      case LayerKind::Paste: return "Paste";
      case LayerKind::Fab: return "Assy";
      default: return "Mechanical";
    }
  }

  void writeLayers() {
    x.open("Layers", {{"version", "1.1"}});
    x.open("StackUpLayers");
    auto emit = [&](LayerId i) {
      const Layer& l = b.layers[i];
      if (l.kind == LayerKind::Fab) x.empty("Layer", {{"name", layerName[i]}, {"type", "Assy"}, {"compsOutline", "on"}});
      else x.empty("Layer", {{"name", layerName[i]}, {"type", layerType(l.kind)}, {"thickness", "0"}});
    };
    // Top-side layers outside-in, copper top to bottom, bottom-side layers inside-out.
    const LayerKind order[] = {LayerKind::Paste, LayerKind::Mask, LayerKind::Silk, LayerKind::Fab, LayerKind::Other};
    for (LayerKind k : order)
      for (size_t i = 0; i < b.layers.size(); ++i)
        if (!layerName[i].empty() && b.layers[i].kind == k && b.layers[i].side == Side::Top) emit(LayerId(i));
    for (LayerId c : b.copperLayers()) emit(c);
    for (auto it = std::rbegin(order); it != std::rend(order); ++it)
      for (size_t i = 0; i < b.layers.size(); ++i)
        if (!layerName[i].empty() && b.layers[i].kind == *it && b.layers[i].side == Side::Bottom) emit(LayerId(i));
    x.close();
    x.close();
  }

  // Name of the top-side counterpart of a layer (footprints are described on the top side).
  std::string footprintLayer(LayerId l, bool bottom) const {
    if (l < 0 || l >= int(b.layers.size()) || layerName[l].empty()) return "";
    if (!bottom || b.layers[l].side == Side::None) return layerName[l];
    Side want = b.layers[l].side == Side::Top ? Side::Bottom : Side::Top;
    for (size_t k = 0; k < b.layers.size(); ++k)
      if (b.layers[k].kind == b.layers[l].kind && b.layers[k].side == want && !layerName[k].empty()) return layerName[k];
    return "";
  }

  // --- library ---
  PadKey keyOf(const Pad& p, bool mirror) const {
    PadKey k;
    k.kind = p.shape.kind;
    k.w = p.shape.w;
    k.h = p.shape.h;
    k.drill = p.drill;
    k.drillH = p.drillH;
    k.rr = int(std::lround(p.shape.rratio * 1000));
    k.plated = p.plated;
    k.through = p.drill > 0;
    k.mirrorPoly = mirror && p.shape.kind == PadShapeKind::Polygon;
    if (p.shape.kind == PadShapeKind::Polygon)
      for (auto& v : p.shape.poly) k.poly.emplace_back(Coord(std::llround(v.x)), Coord(std::llround(v.y)));
    return k;
  }

  std::string padstackName(const PadKey& k) {
    std::string n;
    switch (k.kind) {
      case PadShapeKind::Circle: n = "C" + mm(k.w); break;
      case PadShapeKind::Oval: n = "O" + mm(k.w) + "x" + mm(k.h); break;
      case PadShapeKind::Rect: n = "R" + mm(k.w) + "x" + mm(k.h); break;
      case PadShapeKind::RoundRect: n = "RR" + mm(k.w) + "x" + mm(k.h); break;
      case PadShapeKind::Polygon: n = "P" + mm(k.w) + "x" + mm(k.h); break;
    }
    if (k.through) n += "_D" + mm(k.drill);
    else n += "_SMD";
    std::string r = n;
    for (int i = 2;; ++i) {
      bool taken = false;
      for (auto& [kk, nn] : padstacks)
        if (nn == r) { taken = true; break; }
      if (!taken) return r;
      r = n + "_" + std::to_string(i);
    }
  }

  void collectPadstacks() {
    padPadstack.resize(b.pads.size());
    for (size_t i = 0; i < b.pads.size(); ++i) {
      const Pad& p = b.pads[i];
      bool bottom = p.component >= 0 && b.components[p.component].side == Side::Bottom;
      PadKey k = keyOf(p, bottom);
      auto it = padstacks.find(k);
      if (it == padstacks.end()) it = padstacks.emplace(k, padstackName(k)).first;
      padPadstack[i] = it->second;
    }
  }

  void writePadShape(const PadKey& k, bool viaPad) {
    auto layerRefs = [&] {
      if (k.through || viaPad) {
        x.empty("LayerTypeRef", {{"type", "Signal"}});
      } else {
        x.empty("LayerRef", {{"name", layerName[b.topCopper()]}});
      }
    };
    switch (k.kind) {
      case PadShapeKind::Circle:
        x.open("PadCircle", {{"diameter", mm(k.w)}});
        layerRefs();
        x.close();
        break;
      case PadShapeKind::Oval: {
        Coord d = std::min(k.w, k.h);
        x.open("PadOval", {{"diameter", mm(d)}});
        layerRefs();
        x.empty("Stretch", {{"x", mm(k.w - d)}, {"y", mm(k.h - d)}});
        x.close();
        break;
      }
      case PadShapeKind::Rect:
        x.open("PadRect", {{"width", mm(k.w)}, {"height", mm(k.h)}});
        layerRefs();
        x.close();
        break;
      case PadShapeKind::RoundRect: {
        double radius = k.rr / 1000.0 * std::min(k.w, k.h);
        x.open("PadRect", {{"width", mm(k.w)}, {"height", mm(k.h)}, {"handling", "Rounding"},
                           {"handlingValue", mm(radius)}});
        layerRefs();
        x.close();
        break;
      }
      case PadShapeKind::Polygon:
        x.open("PadPoly");
        layerRefs();
        for (auto& [px, py] : k.poly) {
          Vec2 v = toFst(Vec2{double(px), double(py)});
          if (k.mirrorPoly) v.x = -v.x;
          xy("Dot", v);
        }
        x.close();
        break;
    }
  }

  void writePadstacks() {
    x.open("Padstacks");
    for (auto& [k, name] : padstacks) {
      if (k.through)
        x.open("Padstack", {{"name", name}, {"holeDiameter", mm(k.drill)}, {"metallized", onOff(k.plated)}});
      else
        x.open("Padstack", {{"name", name}, {"type", "SMD"}, {"metallized", "on"}});
      x.open("Pads");
      writePadShape(k, false);
      if (k.through) {
        // Plane layers get a round pad of the outer size.
        x.open("PadCircle", {{"diameter", mm(std::max(k.w, k.h))}});
        x.empty("LayerTypeRef", {{"type", "Plane"}});
        x.close();
      }
      x.close();
      x.close();
    }
    x.close();
  }

  std::string viastackName(Coord d, Coord drill) {
    auto key = std::make_pair(d, drill);
    auto it = viastacks.find(key);
    if (it != viastacks.end()) return it->second;
    std::string n = "Via" + mm(d) + "_" + mm(drill);
    viastacks[key] = n;
    return n;
  }

  void collectViastacks() {
    defaultVia = viastackName(b.netClasses[0].viaDiameter, b.netClasses[0].viaDrill);
    for (auto& nc : b.netClasses) viastackName(nc.viaDiameter, nc.viaDrill);
    for (auto& v : b.vias) viastackName(v.diameter, v.drill);
  }

  void writeViastacks() {
    x.open("Viastacks");
    for (auto& [k, name] : viastacks) {
      x.open("Viastack", {{"name", name}, {"holeDiameter", mm(k.second)}});
      x.open("LayerRange");
      x.empty("AllLayers");
      x.close();
      x.open("ViaPads");
      x.open("PadCircle", {{"diameter", mm(k.first)}});
      x.empty("LayerTypeRef", {{"type", "Signal"}});
      x.close();
      x.close();
      x.close();
    }
    x.close();
  }

  // Footprint description of a component in the top-side frame.
  struct FpDesc {
    std::vector<FpPadRec> pads;
    std::vector<std::pair<std::string, Graphic>> graphics;  // layer name + footprint-frame graphic (mm, Y up)
  };

  FpDesc describe(const Component& c) const {
    FpDesc d;
    bool bottom = c.side == Side::Bottom;
    for (int pi : c.pads) {
      const Pad& p = b.pads[pi];
      FpPadRec r;
      r.number = p.number;
      r.padstack = padPadstack[pi];
      r.org = localToFst(p.localPos.v(), bottom);
      r.angle = bottom ? -p.localAngle : p.localAngle;
      // SMD pad on the side opposite to the component.
      if (p.drill <= 0) {
        LayerId own = bottom ? b.bottomCopper() : b.topCopper();
        r.flipped = !p.onLayer(own) && b.copperCount() > 1;
      }
      d.pads.push_back(r);
    }
    for (auto& g : c.graphics) {
      std::string layer = footprintLayer(g.layer, bottom);
      if (layer.empty()) continue;
      Graphic l = g;
      l.a = absToFp(g.a, c);
      l.b = absToFp(g.b, c);
      l.m = absToFp(g.m, c);
      if (g.kind == GraphicKind::Circle) l.b = l.a + Vec2{(g.b - g.a).len() / kNmPerMm, 0};
      for (auto& v : l.pts) v = absToFp(v, c);
      l.width = g.width;
      d.graphics.emplace_back(layer, std::move(l));
    }
    return d;
  }

  static FpKey keyOf(const std::string& name, const FpDesc& d) {
    FpKey k;
    k.name = name;
    auto q = [](double v) { return std::llround(v * 10000); };  // 0.1 um
    for (auto& p : d.pads)
      k.pads.emplace_back(p.number, p.padstack, q(p.org.x), q(p.org.y), int(std::lround(p.angle * 1000)), p.flipped);
    for (auto& [layer, g] : d.graphics)
      k.graphics.emplace_back(int(g.kind), layer, q(g.a.x), q(g.a.y), q(g.b.x), q(g.b.y), q(g.m.x), q(g.pts.size()));
    return k;
  }

  void collectFootprints() {
    compFootprint.resize(b.components.size());
    for (size_t i = 0; i < b.components.size(); ++i) {
      const Component& c = b.components[i];
      std::string base = c.footprint.empty() ? "FP_" + c.ref : c.footprint;
      FpKey k = keyOf(base, describe(c));
      auto it = footprints.find(k);
      if (it == footprints.end()) {
        std::string name = base;
        for (int n = 2; fpNames.count(name); ++n) name = base + "_" + std::to_string(n);
        fpNames.insert(name);
        it = footprints.emplace(std::move(k), name).first;
      }
      compFootprint[i] = it->second;
    }
  }

  void writeFigure(const Graphic& g) {
    switch (g.kind) {
      case GraphicKind::Line:
        x.open("Line");
        xy("Dot", g.a);
        xy("Dot", g.b);
        x.close();
        break;
      case GraphicKind::Arc: {
        auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
        if (!arc.valid) {
          x.open("Line");
          xy("Dot", g.a);
          xy("Dot", g.b);
          x.close();
          break;
        }
        x.open(arc.sweep >= 0 ? "ArcCCW" : "ArcCW");
        xy("Center", arc.center);
        xy("Start", g.a);
        xy("End", g.b);
        x.close();
        break;
      }
      case GraphicKind::Circle:
        x.open(g.filled ? "FilledCircle" : "Circle", {{"diameter", num(2 * (g.b - g.a).len())}});
        xy("Center", g.a);
        x.close();
        break;
      case GraphicKind::Rect: {
        Vec2 lt{std::min(g.a.x, g.b.x), std::max(g.a.y, g.b.y)}, rb{std::max(g.a.x, g.b.x), std::min(g.a.y, g.b.y)};
        x.open(g.filled ? "FilledRect" : "Rect");
        xy("Dot", lt);
        xy("Dot", rb);
        x.close();
        break;
      }
      case GraphicKind::Poly:
        if (g.pts.size() < 3) break;
        if (g.filled) {
          x.open("Polygon");
          for (auto& v : g.pts) xy("Dot", v);
          x.close();
        } else {
          x.open("Polyline");
          xy("Start", g.pts.front());
          for (size_t i = 1; i <= g.pts.size(); ++i) {
            x.open("SegmentLine");
            xy("End", g.pts[i % g.pts.size()]);
            x.close();
          }
          x.close();
        }
        break;
    }
  }

  void writeDetail(const std::string& layer, const Graphic& g) {
    x.open("Detail", {{"lineWidth", mm(double(g.width))}});
    x.empty("LayerRef", {{"name", layer}});
    writeFigure(g);
    x.close();
  }

  void writeFootprints() {
    // One representative component per footprint.
    std::map<std::string, int> rep;
    for (size_t i = 0; i < b.components.size(); ++i) rep.emplace(compFootprint[i], int(i));
    x.open("Footprints");
    for (auto& [name, ci] : rep) {
      FpDesc d = describe(b.components[ci]);
      x.open("Footprint", {{"name", name}});
      x.open("Pads");
      for (size_t i = 0; i < d.pads.size(); ++i) {
        auto& p = d.pads[i];
        std::string n = std::to_string(i + 1);
        if (p.flipped)
          x.open("Pad", {{"padNum", n}, {"name", p.number}, {"angle", deg(p.angle)}, {"flipped", "on"}});
        else if (std::abs(std::fmod(p.angle + 720.0, 360.0)) > 1e-6)
          x.open("Pad", {{"padNum", n}, {"name", p.number}, {"angle", deg(p.angle)}});
        else
          x.open("Pad", {{"padNum", n}, {"name", p.number}});
        x.empty("PadstackRef", {{"name", p.padstack}});
        xy("Org", p.org);
        x.close();
      }
      x.close();
      if (!d.graphics.empty()) {
        x.open("Details");
        for (auto& [layer, g] : d.graphics) writeDetail(layer, g);
        x.close();
      }
      x.close();
    }
    x.close();
    // Schematic components and packages: one per footprint, pins named after the pads.
    x.open("Components");
    for (auto& [name, ci] : rep) {
      x.open("Component", {{"name", name}});
      x.open("Pins");
      const Component& c = b.components[ci];
      for (size_t i = 0; i < c.pads.size(); ++i) {
        std::string n = std::to_string(i + 1);
        x.empty("Pin", {{"pinNum", n}, {"name", b.pads[c.pads[i]].number}, {"pinSymName", b.pads[c.pads[i]].number},
                        {"pinEqual", "0"}, {"gate", "1"}, {"gateEqual", "0"}});
      }
      x.close();
      x.close();
    }
    x.close();
    x.open("Packages");
    for (auto& [name, ci] : rep) {
      x.open("Package");
      x.empty("ComponentRef", {{"name", name}});
      x.empty("FootprintRef", {{"name", name}});
      for (size_t i = 0; i < b.components[ci].pads.size(); ++i) {
        std::string n = std::to_string(i + 1);
        x.empty("Pinpack", {{"pinNum", n}, {"padNum", n}});
      }
      x.close();
    }
    x.close();
  }

  // --- constructive ---
  void writeContour(const std::vector<Vec2>& loop) {
    x.open("Shape", {{"lineWidth", "0.1"}});
    x.open("Polyline");
    xy("Start", toFst(loop.front()));
    for (size_t i = 1; i <= loop.size(); ++i) {
      x.open("SegmentLine");
      xy("End", toFst(loop[i % loop.size()]));
      x.close();
    }
    x.close();
    x.close();
  }

  void writeConstructive() {
    x.open("Constructive", {{"version", "1.2"}});
    x.open("BoardOutline");
    x.open("Contour");
    if (!b.outline.empty() && b.outline.front().size() >= 3) {
      writeContour(b.outline.front());
    } else {
      BBox bb = b.bbox();
      if (!bb.valid()) bb = {0, 0, double(mmToNm(100)), double(mmToNm(100))};
      bb = bb.inflated(mmToNm(1));
      writeContour({{bb.minX, bb.minY}, {bb.maxX, bb.minY}, {bb.maxX, bb.maxY}, {bb.minX, bb.maxY}});
    }
    x.close();
    if (b.outline.size() > 1) {
      x.open("Voids");
      for (size_t i = 1; i < b.outline.size(); ++i)
        if (b.outline[i].size() >= 3) writeContour(b.outline[i]);
      x.close();
    }
    x.close();
    std::vector<std::pair<std::string, Graphic>> details;
    for (auto& g : b.graphics) {
      if (g.layer < 0 || g.layer >= int(b.layers.size()) || layerName[g.layer].empty()) continue;
      if (b.layers[g.layer].kind == LayerKind::Copper || b.layers[g.layer].kind == LayerKind::Edge) continue;
      Graphic l = g;
      l.a = toFst(g.a);
      l.b = toFst(g.b);
      l.m = toFst(g.m);
      if (g.kind == GraphicKind::Circle) l.b = l.a + Vec2{(g.b - g.a).len() / kNmPerMm, 0};
      for (auto& v : l.pts) v = toFst(v);
      details.emplace_back(layerName[g.layer], std::move(l));
    }
    if (!details.empty()) {
      x.open("MechLayerObjects");
      for (auto& [layer, g] : details) writeDetail(layer, g);
      x.close();
    }
    x.close();
  }

  // --- placement ---
  static std::string uniqueId(size_t i) {
    std::string s(8, 'A');
    for (int k = 7; k >= 0; --k, i /= 26) s[k] = char('A' + i % 26);
    return s;
  }

  void writeComponents() {
    x.open("ComponentsOnBoard", {{"version", "1.3"}});
    x.open("Components");
    for (size_t i = 0; i < b.components.size(); ++i) {
      const Component& c = b.components[i];
      std::string side = c.side == Side::Bottom ? "Bottom" : "Top";
      std::string angle = deg(c.angle);
      if (angle == "0") {
        if (c.locked) x.open("CompInstance", {{"name", c.ref}, {"uniqueId", uniqueId(i)}, {"side", side}, {"fixed", "on"}});
        else x.open("CompInstance", {{"name", c.ref}, {"uniqueId", uniqueId(i)}, {"side", side}});
      } else {
        if (c.locked)
          x.open("CompInstance", {{"name", c.ref}, {"uniqueId", uniqueId(i)}, {"side", side}, {"angle", angle}, {"fixed", "on"}});
        else x.open("CompInstance", {{"name", c.ref}, {"uniqueId", uniqueId(i)}, {"side", side}, {"angle", angle}});
      }
      x.empty("ComponentRef", {{"name", compFootprint[i]}});
      x.empty("FootprintRef", {{"name", compFootprint[i]}});
      xy("Org", toFst(c.pos));
      if (!c.value.empty()) {
        x.open("Attributes");
        x.empty("Attribute", {{"name", "Value"}, {"value", c.value}});
        x.close();
      }
      x.close();
    }
    x.close();
    x.close();
  }

  // --- nets ---
  void writeNetList() {
    x.open("NetList", {{"version", "2.0"}});
    std::vector<std::vector<int>> padsOfNet(b.nets.size());
    for (size_t i = 0; i < b.pads.size(); ++i)
      if (b.pads[i].net >= 0 && b.pads[i].net < int(b.nets.size())) padsOfNet[b.pads[i].net].push_back(int(i));
    for (size_t n = 0; n < b.nets.size(); ++n) {
      x.open("Net", {{"name", b.nets[n].name}});
      for (int pi : padsOfNet[n]) {
        const Pad& p = b.pads[pi];
        if (p.component < 0) continue;
        const Component& c = b.components[p.component];
        // Pads are referenced by name unless the footprint has duplicate pad names.
        int dup = 0, idx = 0;
        for (size_t k = 0; k < c.pads.size(); ++k) {
          if (b.pads[c.pads[k]].number == p.number) ++dup;
          if (c.pads[k] == pi) idx = int(k);
        }
        if (dup == 1) x.empty("PinRef", {{"compName", c.ref}, {"pinName", p.number}});
        else x.empty("PadRef", {{"compName", c.ref}, {"padNum", std::to_string(idx + 1)}});
      }
      x.close();
    }
    x.close();
  }

  // --- groups ---
  // Rules affect one net or one net group: each non-default class and each multi-net layer rule
  // gets a NetGroup.
  std::vector<std::vector<int>> netsOfClass;
  std::vector<std::string> classGroup, ruleGroup;

  void prepareGroups() {
    netsOfClass.assign(b.netClasses.size(), {});
    for (size_t n = 0; n < b.nets.size(); ++n) {
      int c = b.nets[n].netClass;
      if (c > 0 && c < int(b.netClasses.size())) netsOfClass[c].push_back(int(n));
    }
    std::set<std::string> used;
    auto unique = [&](std::string name) {
      std::string u = name;
      for (int k = 2; !used.insert(u).second; ++k) u = std::format("{}_{}", name, k);
      return u;
    };
    classGroup.assign(b.netClasses.size(), {});
    for (size_t c = 1; c < b.netClasses.size(); ++c)
      if (!netsOfClass[c].empty())
        classGroup[c] = unique(b.netClasses[c].name.empty() ? std::format("Class{}", c) : b.netClasses[c].name);
    ruleGroup.assign(b.layerRules.size(), {});
    for (size_t r = 0; r < b.layerRules.size(); ++r)
      if (b.layerRules[r].nets.size() > 1) ruleGroup[r] = unique(std::format("LayerRule{}", r + 1));
  }

  void writeGroups() {
    x.open("Groups", {{"version", "1.1"}});
    auto group = [&](const std::string& name, const std::vector<int>& nets) {
      x.open("NetGroup", {{"name", name}});
      for (int n : nets) x.empty("NetRef", {{"name", b.nets[n].name}});
      x.close();
    };
    if (std::ranges::any_of(classGroup, &std::string::size) || std::ranges::any_of(ruleGroup, &std::string::size)) {
      x.open("NetGroups");
      for (size_t c = 0; c < classGroup.size(); ++c)
        if (!classGroup[c].empty()) group(classGroup[c], netsOfClass[c]);
      for (size_t r = 0; r < ruleGroup.size(); ++r)
        if (!ruleGroup[r].empty()) group(ruleGroup[r], b.layerRules[r].nets);
      x.close();
    }
    x.close();
  }

  // --- rules ---
  // ObjectNet of a class (0 = all nets) or of a layer rule.
  void classObject(size_t c) {
    if (c == 0) x.empty("AllNets");
    else x.empty("NetGroupRef", {{"name", classGroup[c]}});
  }
  void ruleObject(size_t r) {
    const LayerRule& lr = b.layerRules[r];
    if (lr.nets.empty()) x.empty("AllNets");
    else if (lr.nets.size() == 1) x.empty("NetRef", {{"name", b.nets[lr.nets[0]].name}});
    else x.empty("NetGroupRef", {{"name", ruleGroup[r]}});
  }
  void ruleLayers(LayerMask m) {
    if (!m) {
      x.empty("AllLayers");
      return;
    }
    for (LayerId l : b.copperLayers())
      if ((m >> l) & 1) x.empty("LayerRef", {{"name", layerName[l]}});
  }

  void writeRules() {
    x.open("Rules", {{"version", "2.0"}});
    // Later rules take priority: the default class first, specific classes after it, layer rules last.
    auto objects = [&](size_t cls) {
      x.open("ObjectsAffected");
      classObject(cls);
      x.close();
    };
    x.open("RulesWidthOfWires");
    for (size_t c = 0; c < b.netClasses.size(); ++c) {
      if (c > 0 && netsOfClass[c].empty()) continue;
      std::string w = mm(b.netClasses[c].trackWidth);
      x.open("WidthOfWires", {{"enabled", "on"}, {"widthMin", w}, {"widthNom", w}});
      x.empty("AllLayers");
      objects(c);
      x.close();
    }
    for (size_t r = 0; r < b.layerRules.size(); ++r) {
      const LayerRule& lr = b.layerRules[r];
      if (lr.width <= 0) continue;
      std::string w = mm(lr.width);
      x.open("WidthOfWires", {{"enabled", "on"}, {"widthMin", w}, {"widthNom", w}});
      ruleLayers(lr.layers);
      x.open("ObjectsAffected");
      ruleObject(r);
      x.close();
      x.close();
    }
    x.close();
    x.open("RulesClearancesNetToNet");
    for (size_t c = 0; c < b.netClasses.size(); ++c) {
      if (c > 0 && netsOfClass[c].empty()) continue;
      std::string clr = mm(b.netClasses[c].clearance);
      x.open("ClearanceNetToNet", {{"enabled", "on"}, {"clrnMin", clr}, {"clrnNom", clr}});
      x.empty("AllLayers");
      // Two object lists: class nets against all nets.
      x.open("ObjectsAffected");
      classObject(c);
      x.empty("AllNets");
      x.close();
      x.close();
    }
    for (size_t r = 0; r < b.layerRules.size(); ++r) {
      const LayerRule& lr = b.layerRules[r];
      if (lr.clearance <= 0) continue;
      std::string clr = mm(lr.clearance);
      x.open("ClearanceNetToNet", {{"enabled", "on"}, {"clrnMin", clr}, {"clrnNom", clr}});
      ruleLayers(lr.layers);
      x.open("ObjectsAffected");
      ruleObject(r);
      x.empty("AllNets");
      x.close();
      x.close();
    }
    x.close();
    x.open("RulesClearancesCompToComp");
    x.open("ClearanceCompToComp", {{"enabled", "on"}, {"clrn", mm(b.netClasses[0].clearance)}});
    x.open("ObjectsAffected");
    x.empty("AllComps");
    x.empty("AllComps");
    x.close();
    x.close();
    x.close();
    x.empty("RulesClearancesToBoard", {{"wires", mm(b.edgeClearance)}, {"comps", mm(b.edgeClearance)}});
    x.open("RulesViastacksOfNets");
    for (size_t c = 0; c < b.netClasses.size(); ++c) {
      if (c > 0 && netsOfClass[c].empty()) continue;
      x.open("ViastacksOfNets", {{"enabled", "on"}});
      objects(c);
      x.open("Viastacks");
      x.empty("ViastackRef", {{"name", viastackName(b.netClasses[c].viaDiameter, b.netClasses[c].viaDrill)}});
      x.close();
      x.close();
    }
    x.close();
    x.close();
  }

  // --- connectivity ---
  void writeConnectivity() {
    x.open("Connectivity", {{"version", "1.3"}});
    x.open("Vias");
    for (auto& v : b.vias) {
      if (v.locked) x.open("Via", {{"fixed", "on"}});
      else x.open("Via");
      x.empty("ViastackRef", {{"name", viastackName(v.diameter, v.drill)}});
      if (v.net >= 0) x.empty("NetRef", {{"name", netName(v.net)}});
      xy("Org", toFst(v.pos));
      x.close();
    }
    x.close();
    x.open("Wires");
    writeWires();
    x.close();
    if (!b.zones.empty()) {
      x.open("Coppers");
      for (auto& z : b.zones) writeCopper(z);
      x.close();
    }
    x.close();
  }

  // Groups tracks by layer and net, chains touching segments into Subwires.
  void writeWires() {
    std::map<std::pair<LayerId, int>, std::vector<int>> groups;
    for (size_t i = 0; i < b.tracks.size(); ++i) {
      const Track& t = b.tracks[i];
      if (t.layer < 0 || t.layer >= int(b.layers.size()) || layerName[t.layer].empty()) continue;
      groups[{t.layer, t.net}].push_back(int(i));
    }
    for (auto& [key, idx] : groups) {
      x.open("Wire");
      x.empty("LayerRef", {{"name", layerName[key.first]}});
      if (key.second >= 0) x.empty("NetRef", {{"name", netName(key.second)}});
      // Endpoint index for chaining.
      std::multimap<std::pair<Coord, Coord>, int> ends;
      for (int i : idx) {
        ends.emplace(std::make_pair(b.tracks[i].a.x, b.tracks[i].a.y), i);
        ends.emplace(std::make_pair(b.tracks[i].b.x, b.tracks[i].b.y), i);
      }
      std::set<int> used;
      struct Seg { int track; bool reversed; };
      auto nextFrom = [&](Point p, const Track& ref, int& out) {
        int found = -1, count = 0;
        auto range = ends.equal_range({p.x, p.y});
        for (auto it = range.first; it != range.second; ++it) {
          if (used.count(it->second)) continue;
          const Track& t = b.tracks[it->second];
          if (t.width != ref.width || t.locked != ref.locked) continue;
          found = it->second;
          ++count;
        }
        if (count != 1) return false;  // junctions start a new subwire
        out = found;
        return true;
      };
      for (int start : idx) {
        if (used.count(start)) continue;
        used.insert(start);
        std::vector<Seg> chain{{start, false}};
        // Extend forward from b, then backward from a.
        for (int dir = 0; dir < 2; ++dir) {
          for (;;) {
            const Seg& last = dir == 0 ? chain.back() : chain.front();
            const Track& lt = b.tracks[last.track];
            Point tip = dir == 0 ? (last.reversed ? lt.a : lt.b) : (last.reversed ? lt.b : lt.a);
            int n;
            if (!nextFrom(tip, b.tracks[start], n)) break;
            used.insert(n);
            const Track& nt = b.tracks[n];
            bool rev = dir == 0 ? !(nt.a == tip) : !(nt.b == tip);
            if (dir == 0) chain.push_back({n, rev});
            else chain.insert(chain.begin(), {n, rev});
          }
        }
        const Track& first = b.tracks[chain.front().track];
        const Track& ref = b.tracks[start];
        if (ref.locked) x.open("Subwire", {{"fixed", "on"}, {"width", mm(ref.width)}});
        else x.open("Subwire", {{"width", mm(ref.width)}});
        xy("Start", toFst(chain.front().reversed ? first.b : first.a));
        for (auto& sg : chain) {
          const Track& t = b.tracks[sg.track];
          Point from = sg.reversed ? t.b : t.a, to = sg.reversed ? t.a : t.b;
          if (t.mid) {
            Vec2 s = toFst(from), m = toFst(*t.mid), e = toFst(to);
            auto arc = ArcGeom::fromThreePoints(s, m, e);
            if (arc.valid) {
              x.open(arc.sweep >= 0 ? "TrackArc" : "TrackArcCW");
              xy("Center", arc.center);
              xy("End", e);
              x.close();
              continue;
            }
          }
          x.open("TrackLine");
          xy("End", toFst(to));
          x.close();
        }
        x.close();
      }
      x.close();
    }
  }

  void writeFilledContour(const std::vector<Vec2>& poly) {
    x.open("FilledContour");
    xy("Start", toFst(poly.front()));
    for (size_t i = 1; i < poly.size(); ++i) {
      x.open("SegmentLine");
      xy("End", toFst(poly[i]));
      x.close();
    }
    x.close();
  }

  void writeCopper(const Zone& z) {
    if (z.outline.size() < 3 || z.layer < 0 || z.layer >= int(b.layers.size()) || layerName[z.layer].empty()) return;
    x.open("Copper", {{"priority", "50"}, {"backoff", mm(z.clearance > 0 ? z.clearance : b.netClasses[0].clearance)},
                      {"connectPad", "Thermal"}, {"lineWidth", "0.1"}, {"deleteUnconnected", "on"},
                      {"state", z.filled.empty() ? "Unpoured" : "Poured"}});
    x.empty("LayerRef", {{"name", layerName[z.layer]}});
    if (z.net >= 0) x.empty("NetRef", {{"name", netName(z.net)}});
    x.open("Shape");
    writeFilledContour(z.outline);
    x.close();
    if (!z.filled.empty()) {
      x.open("Islands");
      for (auto& f : z.filled) {
        if (f.size() < 3) continue;
        x.open("Island");
        writeFilledContour(f);
        x.close();
      }
      x.close();
    }
    x.close();
  }

  std::string run() {
    assignLayerNames();
    collectPadstacks();
    collectViastacks();
    collectFootprints();

    x.declaration();
    x.blank();
    auto now = std::chrono::floor<std::chrono::seconds>(std::chrono::system_clock::now());
    std::string date = std::format("{:%Y-%m-%d %H:%M}", now);
    x.comment("********************************************");
    x.comment("   File    : " + b.name + ".fst");
    x.comment("   Format  : TopoR PCB file");
    x.comment("   Version : 1.2.0");
    x.comment("   Program : XrTopoR");
    x.comment("   Date    : " + date);
    x.comment("********************************************");
    x.blank();
    x.open("TopoR_PCB_File");
    x.open("Header");
    x.textElement("Format", "TopoR PCB file");
    x.textElement("Version", "1.2.0");
    x.textElement("Program", "XrTopoR");
    x.textElement("Date", date);
    x.empty("Units", {{"dist", "mm"}, {"time", "ps"}});
    x.close();
    x.blank();
    writeLayers();
    x.blank();
    x.open("TextStyles", {{"version", "1.0"}});
    x.empty("TextStyle", {{"name", "Default"}, {"fontName", "default"}, {"height", "1"}});
    x.close();
    x.blank();
    x.open("LocalLibrary", {{"version", "1.4"}});
    writePadstacks();
    writeViastacks();
    writeFootprints();
    x.close();
    x.blank();
    writeConstructive();
    x.blank();
    writeComponents();
    x.blank();
    writeNetList();
    x.blank();
    prepareGroups();
    writeGroups();
    x.blank();
    x.open("HiSpeedRules", {{"version", "3.0"}});
    x.close();
    x.blank();
    writeRules();
    x.blank();
    writeConnectivity();
    x.blank();
    x.open("Settings", {{"version", "1.3"}});
    x.empty("Autoroute", {{"autoEqu", "None"}});
    x.empty("Labels", {{"rotateWithComp", "on"}});
    x.close();
    x.close();
    std::string out = "\xEF\xBB\xBF" + std::move(x).str();
    return out;
  }
};

}  // namespace

std::string writeFst(const Board& b) { return Writer(b).run(); }

}  // namespace xr::io
