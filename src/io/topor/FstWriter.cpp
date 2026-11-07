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

#include "core/Padstack.h"
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
  std::vector<std::pair<Coord, Coord>> viastackOrder;  // the first one is the design's default
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
      for (auto& s : b.padstacks)
        if (s.name == r) taken = true;
      if (!taken) return r;
      r = n + "_" + std::to_string(i);
    }
  }

  void collectPadstacks() {
    padPadstack.resize(b.pads.size());
    for (size_t i = 0; i < b.pads.size(); ++i) {
      const Pad& p = b.pads[i];
      if (p.padstack >= 0 && size_t(p.padstack) < b.padstacks.size()) {
        padPadstack[i] = b.padstacks[size_t(p.padstack)].name;
        continue;
      }
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

  // The layer reference of a stack's detail: its class, or its layer by the name written.
  void detailLayerRef(const PadDetail& d) {
    if (d.layer.empty()) {
      x.empty("LayerTypeRef", {{"type", d.layerClass.empty() ? std::string("Signal") : d.layerClass}});
      return;
    }
    LayerId l = detailLayer(b, d.layer, false);
    x.empty("LayerRef", {{"name", l >= 0 && !layerName[l].empty() ? layerName[l] : d.layer}});
  }

  void writeDetailShape(const PadDetail& d) {
    auto shift = [&] {
      if (d.shift.len() > 0.5) xy("Shift", toFst(d.shift));
    };
    switch (d.form) {
      case PadDetail::Form::Circle:
        x.open("PadCircle", {{"diameter", mm(double(d.w))}});
        detailLayerRef(d);
        shift();
        x.close();
        break;
      case PadDetail::Form::Oval:
        x.open("PadOval", {{"diameter", mm(double(d.w))}});
        detailLayerRef(d);
        xy("Stretch", toFst(d.stretch));
        shift();
        x.close();
        break;
      case PadDetail::Form::Rect: {
        std::vector<std::pair<std::string, std::string>> at{{"width", mm(double(d.w))}, {"height", mm(double(d.h))}};
        if (d.handling != CornerHandling::None) {
          at.push_back({"handling", d.handling == CornerHandling::Rounding ? "Rounding" : "Chamfer"});
          at.push_back({"handlingValue", mm(double(d.handlingValue))});
          if (d.custom) {
            at.push_back({"custom", "on"});
            at.push_back({"cornerLB", onOff(d.corners & kCornerLB)});
            at.push_back({"cornerRB", onOff(d.corners & kCornerRB)});
            at.push_back({"cornerRT", onOff(d.corners & kCornerRT)});
            at.push_back({"cornerLT", onOff(d.corners & kCornerLT)});
          }
        }
        x.openList("PadRect", at);
        detailLayerRef(d);
        shift();
        x.close();
        break;
      }
      case PadDetail::Form::Polygon:
        x.open("PadPoly");
        detailLayerRef(d);
        for (auto& v : d.poly) xy("Dot", toFst(v));
        x.close();
        break;
    }
  }

  void writeStack(const Padstack& ps) {
    std::vector<std::pair<std::string, std::string>> at{{"name", ps.name}};
    if (ps.type == PadstackType::SMD) at.push_back({"type", "SMD"});
    else if (ps.type == PadstackType::MountHole) at.push_back({"type", "MountHole"});
    if (ps.type != PadstackType::SMD) at.push_back({"holeDiameter", mm(double(ps.drill))});
    at.push_back({"metallized", onOff(ps.plated)});
    if (ps.connect != PadConnect::Unset)
      at.push_back({"connectToCopper", ps.connect == PadConnect::None ? "NoneConnect"
                                       : ps.connect == PadConnect::Direct ? "Direct" : "Thermal"});
    x.openList("Padstack", at);
    x.empty("Thermal", {{"spokeNum", std::to_string(ps.thermal.spokes)}, {"minSpokeNum", std::to_string(ps.thermal.minSpokes)},
                        {"angle", num(ps.thermal.angle, 3)}, {"spokeWidth", mm(double(ps.thermal.spokeWidth))},
                        {"backoff", mm(double(ps.thermal.backoff))}});
    x.open("Pads");
    for (auto& d : ps.details) writeDetailShape(d);
    x.close();
    x.close();
  }

  void writePadstacks() {
    x.open("Padstacks");
    for (auto& ps : b.padstacks) writeStack(ps);
    for (auto& [k, name] : padstacks) {
      if (k.through)
        x.open("Padstack", {{"name", name}, {"holeDiameter", mm(k.drill)}, {"metallized", onOff(k.plated)}});
      else
        x.open("Padstack", {{"name", name}, {"type", "SMD"}, {"metallized", "on"}});
      // TopoR's importer wants the thermal spokes before the pads of every padstack, SMD ones too.
      x.empty("Thermal", {{"spokeNum", "4"}, {"minSpokeNum", "4"}, {"angle", "45"}, {"spokeWidth", "0.381"}, {"backoff", "0.381"}});
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
    viastackOrder.push_back(key);
    return n;
  }

  void collectViastacks() {
    rules_ = b.rules ? *b.rules : rulesFromBoard(b);
    // Via types keep their names (TopoR's «(Default)» and the like).
    std::set<std::string> taken;
    for (auto& t : rules_.viaTypes)
      if (!viastacks.contains({t.diameter, t.drill}) && taken.insert(t.name).second) {
        viastacks[{t.diameter, t.drill}] = t.name;
        viastackOrder.push_back({t.diameter, t.drill});
      }
    defaultVia = viastackName(b.netClasses[0].viaDiameter, b.netClasses[0].viaDrill);
    for (auto& nc : b.netClasses) viastackName(nc.viaDiameter, nc.viaDrill);
    for (auto& v : b.vias) viastackName(v.diameter, v.drill);
  }

  void writeViastacks() {
    x.open("Viastacks");
    for (auto& k : viastackOrder) {
      const std::string& name = viastacks.at(k);
      // The via type of that name with its layer range and its pads layer by layer, if the rules have it.
      const ViaType* t = nullptr;
      for (auto& v : rules_.viaTypes)
        if (v.name == name && v.diameter == k.first && v.drill == k.second) t = &v;
      if (t && t->viaOnPin) x.open("Viastack", {{"name", name}, {"holeDiameter", mm(k.second)}, {"viaOnPin", "on"}});
      else x.open("Viastack", {{"name", name}, {"holeDiameter", mm(k.second)}});
      x.open("LayerRange");
      LayerId from = t && !t->from.empty() ? b.findLayer(t->from) : -1, to = t && !t->to.empty() ? b.findLayer(t->to) : -1;
      if (from >= 0 && to >= 0 && !layerName[from].empty() && !layerName[to].empty()) {
        x.empty("LayerRef", {{"name", layerName[from]}});
        x.empty("LayerRef", {{"name", layerName[to]}});
      } else {
        x.empty("AllLayers");
      }
      x.close();
      x.open("ViaPads");
      auto circle = [&](Coord d, const ViaPadSize& p) {
        x.open("PadCircle", {{"diameter", mm(double(d))}});
        if (!p.layer.empty()) {
          LayerId l = b.findLayer(p.layer);
          x.empty("LayerRef", {{"name", l >= 0 && !layerName[l].empty() ? layerName[l] : p.layer}});
        } else {
          x.empty("LayerTypeRef", {{"type", p.layerClass.empty() ? std::string("Signal") : p.layerClass}});
        }
        x.close();
      };
      // The signal pad is the type's diameter.
      circle(k.first, {"Signal", "", k.first});
      if (t)
        for (auto& p : t->pads)
          if (!(p.layer.empty() && p.layerClass == "Signal")) circle(p.diameter, p);
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
      // The footprint gives the stack's anchor point, the pad's centre less its detail's shift.
      Vec2 local = p.localPos.v();
      if (p.padstack >= 0 && size_t(p.padstack) < b.padstacks.size())
        if (auto* pd = primaryDetail(b, b.padstacks[size_t(p.padstack)], p.bottomSide); pd && pd->shift.len() > 0.5)
          local = local - rotateBoard(detailOffset(*pd, p.mirror, p.angle), -c.angle);
      r.org = localToFst(local, bottom);
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
      if (bottom) l.mirrorArcs();
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
        if (g.hasArcs()) {
          // Arcs on the sides: a contour of lines and arcs by angle (fst frame, Y up: the angle as it is).
          x.open(g.filled ? "FilledContour" : "Contour");
          xy("Start", g.pts.front());
          for (size_t i = 0; i < g.pts.size(); ++i) {
            double deg = g.arcOf(i);
            if (deg != 0) x.open("SegmentArcByAngle", {{"angle", num(deg)}});
            else x.open("SegmentLine");
            xy("End", g.pts[(i + 1) % g.pts.size()]);
            x.close();
          }
          x.close();
        } else if (g.filled) {
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
    // The outline's drawings as they are (rectangles, arcs, lines; TopoR's Shapes), those of its holes as its
    // voids; without drawings, the loops.
    std::vector<const Graphic*> contour, voids;
    auto onLoop = [](Vec2 p, const std::vector<Vec2>& loop) {
      for (size_t k = 0; k < loop.size(); ++k)
        if (distPointSegment(p, loop[k], loop[(k + 1) % loop.size()]) <= 20000) return true;
      return false;
    };
    for (auto& g : b.graphics)
      if (b.isEdge(g.layer) && !b.outline.empty()) {
        auto path = g.path();
        if (path.empty()) continue;
        bool hole = r::any_of(b.outline | v::drop(1), [&](auto& loop) { return onLoop(path.front(), loop); });
        (hole ? voids : contour).push_back(&g);
      }
    auto shapes = [&](const std::vector<const Graphic*>& gs) {
      for (const Graphic* g : gs) {
        Graphic l = fstGraphic(*g);
        l.filled = false;
        x.open("Shape", {{"lineWidth", mm(double(g->width > 0 ? g->width : mmToNm(0.1)))}});
        writeFigure(l);
        x.close();
      }
    };
    x.open("Contour");
    if (!contour.empty()) {
      shapes(contour);
    } else if (!b.outline.empty() && b.outline.front().size() >= 3) {
      writeContour(b.outline.front());
    } else {
      BBox bb = b.bbox();
      if (!bb.valid()) bb = {0, 0, double(mmToNm(100)), double(mmToNm(100))};
      bb = bb.inflated(mmToNm(1));
      writeContour({{bb.minX, bb.minY}, {bb.maxX, bb.minY}, {bb.maxX, bb.maxY}, {bb.minX, bb.maxY}});
    }
    x.close();
    if (!contour.empty()) {
      if (!voids.empty()) {
        x.open("Voids");
        shapes(voids);
        x.close();
      }
    } else if (b.outline.size() > 1) {
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
    writeTexts();
    writeKeepouts();
    x.close();
  }

  Graphic fstGraphic(const Graphic& g) const {
    Graphic l = g;
    l.a = toFst(g.a);
    l.b = toFst(g.b);
    l.m = toFst(g.m);
    if (g.kind == GraphicKind::Circle) l.b = l.a + Vec2{(g.b - g.a).len() / kNmPerMm, 0};
    for (auto& v : l.pts) v = toFst(v);
    return l;
  }

  void writeTexts() {
    static const char* aligns[] = {"LT", "CT", "RT", "LM", "CM", "RM", "LB", "CB", "RB"};
    bool any = false;
    for (auto& t : b.texts) {
      if (t.layer < 0 || t.layer >= LayerId(b.layers.size()) || layerName[t.layer].empty()) continue;
      if (!any) x.open("Texts");
      any = true;
      std::vector<std::pair<std::string, std::string>> a{{"text", t.text}, {"align", aligns[int(t.align)]}};
      if (std::abs(t.angle) > 1e-9) a.push_back({"angle", num(t.angle)});
      if (t.mirror) a.push_back({"mirror", "on"});
      x.openList("Text", a);
      x.empty("LayerRef", {{"name", layerName[t.layer]}});
      x.empty("TextStyleRef", {{"name", b.styleOf(t).name}});
      xy("Org", toFst(t.pos));
      x.close();
    }
    if (any) x.close();
  }

  void writeKeepouts() {
    if (b.keepouts.empty()) return;
    x.open("Keepouts");
    for (auto& k : b.keepouts) {
      x.open("Keepout");
      x.open("Role");
      if (k.role == Keepout::Role::Place) {
        x.empty("Place", {{"side", k.side == Side::Top ? "Top" : k.side == Side::Bottom ? "Bottom" : "Both"}});
      } else {
        x.open("Trace", {{"role", k.wires && k.vias ? "Wires and Vias" : k.wires ? "Wires" : "Vias"}});
        if (!k.layers) x.empty("AllLayers");
        for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
          if (k.layers && ((k.layers >> l) & 1) && !layerName[l].empty()) x.empty("LayerRef", {{"name", layerName[l]}});
        x.close();
      }
      x.close();
      for (auto& g : k.shape) writeFigure(fstGraphic(g));
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

  // --- display settings ---
  static std::string hexColor(uint32_t c) { return std::format("#{:06x}", c & 0xffffff); }

  void writeDisplay(const DisplayControl& d) {
    x.open("DisplayControl", {{"version", "1.3"}});
    if (d.viewScale > 0)
      x.empty("View", {{"scale", num(d.viewScale)}, {"scrollHorz", num(d.scrollX)}, {"scrollVert", num(d.scrollY)}});
    if (!d.activeLayer.empty())
      if (LayerId l = b.findLayer(d.activeLayer); l >= 0 && !layerName[l].empty())
        x.empty("ActiveLayer", {{"name", layerName[l]}});
    x.empty("Units", {{"preference", d.units}});
    // Attribute lists vary: build them as owned strings.
    std::vector<std::pair<std::string, std::string>> colors;
    if (!d.colorScheme.empty()) colors.emplace_back("colorScheme", d.colorScheme);
    colors.emplace_back("hilightRate", std::to_string(d.hilightRate));
    colors.emplace_back("darkRate", std::to_string(d.darkRate));
    for (auto& [k, v] : d.colors) colors.emplace_back(k, hexColor(v));
    x.emptyList("Colors", colors);
    std::vector<std::pair<std::string, std::string>> show;
    if (!d.displayScheme.empty()) show.emplace_back("displayScheme", d.displayScheme);
    for (auto& [k, v] : d.show) show.emplace_back(k, onOff(v));
    x.emptyList("Show", show);
    x.open("Grid", {{"gridColor", hexColor(d.gridColor)}, {"gridKind", d.gridDots ? "Dots" : "Lines"},
                    {"gridShow", onOff(d.gridShow)}, {"alignToGrid", onOff(d.alignToGrid)},
                    {"snapToAngle", onOff(d.snapToAngle)}, {"saveProportion", onOff(d.saveProportion)}});
    x.empty("GridSpace", {{"x", num(d.gridX * 10000.0 / kNmPerMil, 2)}, {"y", num(d.gridY * 10000.0 / kNmPerMil, 2)}});
    x.close();
    x.open("LayersVisualOptions");
    for (auto& l : d.layers) {
      // TopoR's pseudo-layers (e.g. «Board») are not board layers: kept by name.
      LayerId id = b.findLayer(l.layer);
      if (id >= 0 && layerName[id].empty()) continue;
      x.open("LayerOptions");
      x.empty("LayerRef", {{"name", id >= 0 ? layerName[id] : l.layer}});
      x.empty("Colors", {{"details", hexColor(l.details)}, {"pads", hexColor(l.pads)}, {"fix", hexColor(l.fix)}});
      x.empty("Show", {{"visible", onOff(l.visible)}, {"details", onOff(l.showDetails)}, {"pads", onOff(l.showPads)}});
      x.close();
    }
    x.close();
    x.open("ColorNets", {{"enabled", onOff(d.colorNets)}, {"colorizeWire", onOff(d.colorizeWire)},
                         {"colorizePad", onOff(d.colorizePad)}, {"colorizeCopper", onOff(d.colorizeCopper)},
                         {"colorizeVia", onOff(d.colorizeVia)}, {"colorizeNetline", onOff(d.colorizeNetline)}});
    for (auto& nc : d.netColors) {
      x.open("SetColor", {{"color", hexColor(nc.color)}});
      x.empty("NetRef", {{"name", nc.net}});
      x.close();
    }
    x.close();
    x.open("FilterNetlines", {{"enabled", onOff(d.filterNetlines)}});
    for (auto& n : d.netlineNets) x.empty("NetRef", {{"name", n}});
    x.close();
    x.close();
  }

  // --- groups and rules ---
  // TopoR-style rules of the design: its own, or those equivalent to its net classes.
  DesignRules rules_;

  void writeGroups() {
    x.open("Groups", {{"version", "1.1"}});
    if (!rules_.netGroups.empty()) {
      x.open("NetGroups");
      for (auto& g : rules_.netGroups) {
        x.open("NetGroup", {{"name", g.name}});
        for (auto& n : g.nets) x.empty("NetRef", {{"name", n}});
        x.close();
      }
      x.close();
    }
    x.close();
  }

  void ruleObject(const RuleNets& o) {
    switch (o.kind) {
      case RuleNets::Kind::All: x.empty("AllNets"); break;
      case RuleNets::Kind::Net: x.empty("NetRef", {{"name", o.name}}); break;
      case RuleNets::Kind::Group: x.empty("NetGroupRef", {{"name", o.name}}); break;
      case RuleNets::Kind::Signal: x.empty("SignalRef", {{"name", o.name}}); break;
      case RuleNets::Kind::DiffSignal: x.empty("DiffSignalRef", {{"name", o.name}}); break;
      case RuleNets::Kind::SignalGroup: x.empty("SignalGroupRef", {{"name", o.name}}); break;
    }
  }
  void objectSignal(const ObjectSignal& o) {
    switch (o.kind) {
      case ObjectSignal::Kind::Signal: x.empty("SignalRef", {{"name", o.name}}); break;
      case ObjectSignal::Kind::DiffSignal: x.empty("DiffSignalRef", {{"name", o.name}}); break;
      case ObjectSignal::Kind::SignalGroup: x.empty("SignalGroupRef", {{"name", o.name}}); break;
    }
  }
  void pinRef(const char* tag, const PinRef& p) { x.empty(tag, {{"compName", p.comp}, {"pinName", p.pin}}); }

  // HiSpeedRules as the board keeps them (HiSpeed.h): the sections it has, in the format's order.
  void writeHiSpeed() {
    const HiSpeed& h = b.hispeed;
    x.open("HiSpeedRules", {{"version", "3.0"}});
    if (!h.impedances.empty()) {
      x.open("RulesImpedances");
      for (const Impedance& z : h.impedances) {
        x.open(z.diff ? "ImpedanceDiff" : "Impedance", {{"name", z.name}, {"Z0", num(z.z0)}});
        for (const ImpedanceLayerRule& r : z.rules) {
          if (z.diff) x.open("LayerRule", {{"width", mm(r.width)}, {"gap", mm(r.gap)}});
          else x.open("LayerRule", {{"width", mm(r.width)}});
          x.empty("LayerRef", {{"name", r.layer}});
          x.close();
        }
        x.close();
      }
      x.close();
    }
    if (!h.clusters.empty()) {
      x.open("SignalClusters");
      for (const SignalCluster& c : h.clusters) {
        x.open("SignalCluster");
        if (!c.impedance.empty()) x.empty("ImpedanceRef", {{"name", c.impedance}});
        pinRef("SourcePinRef", c.source);
        x.open("Nets");
        for (const std::string& n : c.nets) x.empty("NetRef", {{"name", n}});
        x.close();
        x.open("PinPairs");
        for (const auto& [p1, p2] : c.pinPairs) {
          x.open("PinPair");
          pinRef("PinRef", p1);
          pinRef("PinRef", p2);
          x.close();
        }
        x.close();
        for (const Signal& sg : c.signalList) {
          x.open("Signal", {{"name", sg.name}});
          pinRef("ReceiverPinRef", sg.receiver);
          if (sg.components.empty()) x.empty("Components");
          else {
            x.open("Components");
            for (const std::string& cr : sg.components) x.empty("CompInstanceRef", {{"name", cr}});
            x.close();
          }
          x.close();
        }
        x.close();
      }
      x.close();
    }
    if (!h.diffSignals.empty()) {
      x.open("DiffSignals");
      for (const DiffSignal& d : h.diffSignals) {
        x.open("DiffSignal", {{"name", d.name}, {"mismatch", mm(d.mismatch)}});
        if (!d.impedance.empty()) x.empty("ImpedanceRef", {{"name", d.impedance}});
        x.empty("SignalRef", {{"name", d.signalA}});
        x.empty("SignalRef", {{"name", d.signalB}});
        x.close();
      }
      x.close();
    }
    if (!h.groups.empty()) {
      x.open("SignalGroups");
      for (const SignalGroup& g : h.groups) {
        x.open("SignalGroup", {{"name", g.name}});
        for (const ObjectSignal& m : g.members) objectSignal(m);
        x.close();
      }
      x.close();
    }
    if (!h.delays.empty()) {
      x.open("RulesDelay");
      for (const DelayRule& d : h.delays) {
        const char* onoff = d.enabled ? "on" : "off";
        const char* vt = d.time ? "Time" : "Dist";
        switch (d.kind) {
          case DelayRule::Kind::Equal:
            x.open("DelayEqual", {{"enabled", onoff}, {"valueType", vt}, {"tolerance", num(d.tolerance)}});
            x.open("ObjectsAffected");
            for (const ObjectSignal& o : d.objects) objectSignal(o);
            x.close();
            break;
          case DelayRule::Kind::Constant:
            x.open("DelayConstant", {{"enabled", onoff}, {"valueType", vt}, {"constant", num(d.constant)}, {"toleranceUnder", num(d.toleranceUnder)}, {"toleranceOver", num(d.toleranceOver)}});
            x.open("ObjectsAffected");
            for (const ObjectSignal& o : d.objects) objectSignal(o);
            x.close();
            break;
          case DelayRule::Kind::Relation:
            x.open("DelayRelation", {{"enabled", onoff}, {"valueType", vt}, {"constant", num(d.constant)}, {"toleranceUnder", num(d.toleranceUnder)}, {"toleranceOver", num(d.toleranceOver)}});
            x.open("ObjectLeft");
            for (const ObjectSignal& o : d.left) objectSignal(o);
            x.close();
            x.open("ObjectRight");
            for (const ObjectSignal& o : d.right) objectSignal(o);
            x.close();
            break;
        }
        x.close();
      }
      x.close();
    }
    if (h.search.present) {
      const SignalSearch& q = h.search;
      x.open("SignalSearchSettings", {{"maxNetsInCluster", std::to_string(q.maxNetsInCluster)}, {"createPinPairs", q.createPinPairs ? "on" : "off"}});
      if (!q.names.empty()) {
        x.open("RulesDiffSignalNetsNames");
        for (const DiffNamesRule& r : q.names) {
          std::vector<std::pair<std::string, std::string>> attrs{{"enabled", r.enabled ? "on" : "off"}};
          if (!r.pos.empty()) attrs.push_back({"posStr", r.pos});
          if (!r.neg.empty()) attrs.push_back({"negStr", r.neg});
          x.emptyList("RuleDiffSignalNetsNames", attrs);
        }
        x.close();
      }
      x.open("ExcludedNets", {{"minPinsNumber", std::to_string(q.minPinsNumber)}});
      for (const std::string& n : q.excludedNets) x.empty("NetRef", {{"name", n}});
      x.close();
      x.close();
    }
    x.close();
  }

  void ruleLayers(const std::vector<std::string>& names) {
    if (names.empty()) {
      x.empty("AllLayers");
      return;
    }
    for (auto& n : names)
      if (LayerId l = b.findLayer(n); l >= 0 && !layerName[l].empty()) x.empty("LayerRef", {{"name", layerName[l]}});
  }

  std::string viaTypeName(const std::string& type) {
    for (auto& t : rules_.viaTypes)
      if (t.name == type) return viastackName(t.diameter, t.drill);
    return defaultVia;
  }

  void writeRules() {
    x.open("Rules", {{"version", "2.0"}});
    x.open("RulesWidthOfWires");
    for (auto& w : rules_.widths) {
      x.open("WidthOfWires", {{"enabled", onOff(w.enabled)}, {"widthMin", mm(w.min)}, {"widthNom", mm(w.nom)}});
      ruleLayers(w.layers);
      x.open("ObjectsAffected");
      ruleObject(w.nets);
      x.close();
      x.close();
    }
    x.close();
    x.open("RulesClearancesNetToNet");
    for (auto& c : rules_.clearances) {
      x.open("ClearanceNetToNet", {{"enabled", onOff(c.enabled)}, {"clrnMin", mm(c.min)}, {"clrnNom", mm(c.nom)}});
      ruleLayers(c.layers);
      x.open("ObjectsAffected");
      ruleObject(c.a);
      ruleObject(c.b);
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
    Coord edge = rules_.edgeWires > 0 ? rules_.edgeWires : b.edgeClearance;
    x.empty("RulesClearancesToBoard",
            {{"wires", mm(edge)}, {"comps", mm(rules_.edgeComps > 0 ? rules_.edgeComps : edge)}});
    x.open("RulesViastacksOfNets");
    for (auto& v : rules_.vias) {
      x.open("ViastacksOfNets", {{"enabled", onOff(v.enabled)}});
      x.open("ObjectsAffected");
      ruleObject(v.nets);
      x.close();
      x.open("Viastacks");
      if (v.viaType.empty()) x.empty("AllViastacks");
      else x.empty("ViastackRef", {{"name", viaTypeName(v.viaType)}});
      x.close();
      x.close();
    }
    x.close();
    // The nets' properties (TopoR writes one for every net): the flexible fixation and «Трассировать».
    x.open("NetProperties");
    for (const Net& n : b.nets) {
      x.open("NetProperty", {{"flexfix", onOff(n.flexFixed)}, {"route", onOff(n.route)}});
      x.empty("NetRef", {{"name", n.name}});
      x.close();
    }
    x.close();
    if (!rules_.planes.empty()) {
      x.open("RulesPlaneLayersNets");
      for (auto& p : rules_.planes) {
        LayerId l = b.findLayer(p.layer);
        if (l < 0 || layerName[l].empty()) continue;
        x.open("PlaneLayerNets", {{"enabled", onOff(p.enabled)}});
        x.empty("LayerRef", {{"name", layerName[l]}});
        x.open("ObjectsAffected");
        x.empty("NetRef", {{"name", p.net}});
        x.close();
        x.close();
      }
      x.close();
    }
    if (!rules_.layerNets.empty()) {
      x.open("RulesSignalLayersNets");
      for (auto& r : rules_.layerNets) {
        LayerId l = b.findLayer(r.layer);
        if (l < 0 || layerName[l].empty()) continue;
        x.open("SignalLayerNets", {{"enabled", onOff(r.enabled)}});
        x.empty("LayerRef", {{"name", layerName[l]}});
        x.open("ObjectsAffected");
        for (auto& o : r.nets) ruleObject(o);
        x.close();
        x.close();
      }
      x.close();
    }
    x.close();
  }

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
    if (!b.serpents.empty()) {
      x.open("Serpents");
      for (size_t i = 0; i < b.serpents.size(); ++i) {
        const Serpent& sp = b.serpents[i];
        x.empty("Serpent", {{"id", serpentId(int(i))}, {"length", num(sp.length, 8)}, {"gap", num(sp.gap)}, {"h1", num(sp.h1, 8)}, {"h2", num(sp.h2, 8)}, {"h3", num(sp.h3, 8)}, {"h4", num(sp.h4, 8)}});
      }
      x.close();
    }
    if (!b.zips.empty()) {
      x.open("ZippedWires");
      for (size_t i = 0; i < b.zips.size(); ++i) {
        const ZippedWire& z = b.zips[i];
        if (z.layer < 0 || z.layer >= int(b.layers.size()) || layerName[z.layer].empty() || z.axis.empty()) continue;
        if (z.fixed) x.open("ZippedWire", {{"id", zipId(int(i))}, {"fixed", "on"}});
        else x.open("ZippedWire", {{"id", zipId(int(i))}});
        x.empty("LayerRef", {{"name", layerName[z.layer]}});
        if (z.pair >= 0 && z.pair < int(b.hispeed.diffSignals.size())) x.empty("DiffSignalRef", {{"name", b.hispeed.diffSignals[size_t(z.pair)].name}});
        xy("Start", toFst(z.axis.front().a));
        for (const Track& t : z.axis) writeTrackPiece(t, false);
        x.close();
      }
      x.close();
    }
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

  static std::string serpentId(int i) { return "serp_" + std::to_string(i); }
  static std::string zipId(int i) { return "zwire_" + std::to_string(i); }

  // One piece of a Subwire or an axis: TrackLine, TrackArc or TrackArcCW to the piece's far end, with the
  // serpent it carries.
  void writeTrackPiece(const Track& t, bool reversed) {
    Point from = reversed ? t.b : t.a, to = reversed ? t.a : t.b;
    std::vector<std::pair<std::string, std::string>> attrs;
    if (t.serp >= 0 && t.serp < int(b.serpents.size())) attrs.push_back({"serpRef", serpentId(t.serp)});
    if (t.mid) {
      Vec2 s = toFst(from), m = toFst(*t.mid), e = toFst(to);
      auto arc = ArcGeom::fromThreePoints(s, m, e);
      if (arc.valid) {
        x.openList(arc.sweep >= 0 ? "TrackArc" : "TrackArcCW", attrs);
        xy("Center", arc.center);
        xy("End", e);
        x.close();
        return;
      }
    }
    x.openList("TrackLine", attrs);
    xy("End", toFst(to));
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
          if (t.width != ref.width || t.locked != ref.locked || t.zip != ref.zip) continue;
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
        std::vector<std::pair<std::string, std::string>> attrs;
        if (ref.locked) attrs.push_back({"fixed", "on"});
        attrs.push_back({"width", mm(ref.width)});
        if (ref.zip >= 0 && ref.zip < int(b.zips.size())) attrs.push_back({"zipwireRef", zipId(ref.zip)});
        x.openList("Subwire", attrs);
        xy("Start", toFst(chain.front().reversed ? first.b : first.a));
        for (auto& sg : chain) writeTrackPiece(b.tracks[sg.track], sg.reversed);
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
    if (z.shape && (z.shape->kind != GraphicKind::Poly || z.shape->hasArcs())) {
      Graphic l = fstGraphic(*z.shape);
      l.filled = true;
      writeFigure(l);
    } else {
      writeFilledContour(z.outline);
    }
    x.close();
    if (!z.cutouts.empty()) {
      x.open("Voids");
      for (auto& c : z.cutouts)
        if (c.size() >= 3) writeFilledContour(c);
      x.close();
    }
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
    // TopoR's importer refuses a header without the origin of the design («Пропущен тег 'OriginalFile'»).
    x.textElement("OriginalFormat", "TopoR PCB");
    x.textElement("OriginalFile", ".\\" + b.name + ".fst");
    x.empty("Units", {{"dist", "mm"}, {"time", "ps"}});
    x.close();
    x.blank();
    writeLayers();
    x.blank();
    x.open("TextStyles", {{"version", "1.0"}});
    for (auto& st : b.textStyles) {
      std::vector<std::pair<std::string, std::string>> a{{"name", st.name}, {"fontName", st.font}, {"height", mm(double(st.height))}};
      if (st.bold) a.push_back({"bold", "on"});
      if (st.italic) a.push_back({"italic", "on"});
      x.emptyList("TextStyle", a);
    }
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
    writeGroups();
    x.blank();
    writeHiSpeed();
    x.blank();
    writeRules();
    x.blank();
    writeConnectivity();
    x.blank();
    x.open("Settings", {{"version", "1.3"}});
    x.empty("Autoroute", {{"autoEqu", "None"}});
    x.empty("Labels", {{"rotateWithComp", "on"}});
    x.close();
    if (b.display) {
      x.blank();
      writeDisplay(*b.display);
    }
    x.close();
    std::string out = "\xEF\xBB\xBF" + std::move(x).str();
    return out;
  }
};

}  // namespace

std::string writeFst(const Board& b) { return Writer(b).run(); }

}  // namespace xr::io
