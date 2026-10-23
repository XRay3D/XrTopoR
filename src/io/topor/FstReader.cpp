// TopoR PCB 1.2.0 (.fst) reader. The file is XML with coordinates in Header/Units (mm by default)
// and the Y axis pointing up; angles are degrees counter-clockwise. Bottom-side components are
// mirrored about the footprint's vertical axis before rotation, like Specctra.
#include <algorithm>
#include <cmath>
#include <filesystem>
#include <format>
#include <iterator>
#include <map>
#include <optional>
#include <set>
#include <tuple>

#include "core/ZoneFill.h"
#include "io/topor/Fst.h"
#include "io/xml/Xml.h"

namespace xr::io {

using xml::Element;

namespace {

// Pad shape plus the layer references of a padstack entry.
struct PadstackDef {
  PadShape shape;
  Vec2 shift;  // shape centre offset (fst frame, file units)
  Coord drill = 0;
  bool plated = true;
  bool allSignal = false, allPlane = false;
  LayerMask layers = 0;  // explicitly named copper layers (unmirrored)
  bool haveShape = false, shapeFromSignal = false;
};

struct ViastackDef {
  Coord diameter = 0, drill = 0;
  LayerMask layers = 0;  // 0 = all copper
};

struct FpPad {
  int padNum = 0;
  std::string name;
  double angle = 0;
  bool flipped = false;
  std::string padstack;
  Vec2 org;  // fst frame
};

// Footprint drawing primitive in the footprint frame (file units, Y up).
struct FpGraphic {
  GraphicKind kind = GraphicKind::Line;
  std::string layer;
  Vec2 a, b, m;
  std::vector<Vec2> pts;
  double width = 0;
  bool filled = false;
};

struct FootprintDef {
  std::vector<FpPad> pads;
  std::vector<FpGraphic> graphics;
};

struct Reader {
  Board& b;
  double s = double(kNmPerMm);  // nm per file unit
  std::map<std::string, PadstackDef> padstacks;
  std::map<std::string, ViastackDef> viastacks;
  std::map<std::string, FootprintDef> footprints;
  std::map<std::string, std::string> componentValues;  // schematic component -> value attribute
  std::map<std::string, int> pinToPad;                 // "comp\x01pinName" and "comp\x02padNum"
  std::string firstViastack;
  LayerId edge = -1;

  explicit Reader(Board& board) : b(board) {}

  // --- coordinate helpers ---
  Vec2 pt(const Element* e) const { return e ? Vec2{e->num("x"), e->num("y")} : Vec2{}; }
  Vec2 toBoard(Vec2 p) const { return {p.x * s, -p.y * s}; }
  Coord len(double v) const { return Coord(std::llround(v * s)); }

  static std::string key(const std::string& comp, char kind, std::string_view pin) {
    return comp + kind + std::string(pin);
  }

  // --- layers ---
  void readLayers(const Element& layers) {
    std::vector<const Element*> stack;
    if (auto* su = layers.find("StackUpLayers")) stack = su->findAll("Layer");
    // Side of non-copper layers: before the first copper layer = top, after the last = bottom.
    int firstCu = -1, lastCu = -1;
    for (size_t i = 0; i < stack.size(); ++i) {
      auto t = stack[i]->attr("type", "Signal");
      if (t == "Signal" || t == "Plane") {
        if (firstCu < 0) firstCu = int(i);
        lastCu = int(i);
      }
    }
    for (size_t i = 0; i < stack.size(); ++i) {
      const Element& l = *stack[i];
      std::string name(l.attr("name"));
      auto t = l.attr("type", "Signal");
      Side side = int(i) < firstCu ? Side::Top : (int(i) > lastCu ? Side::Bottom : Side::None);
      LayerKind kind;
      if (t == "Signal" || t == "Plane") {
        kind = LayerKind::Copper;
        side = int(i) == firstCu ? Side::Top : (int(i) == lastCu ? Side::Bottom : Side::None);
      } else if (t == "Paste") kind = LayerKind::Paste;
      else if (t == "Mask") kind = LayerKind::Mask;
      else if (t == "Silk") kind = LayerKind::Silk;
      else if (t == "Assy") kind = LayerKind::Fab;
      else if (t == "Dielectric") continue;
      else kind = LayerKind::Other;  // Mechanical, Doc
      LayerId id = b.addLayer(name, kind, side);
      if (t == "Plane") {
        planeLayers |= LayerMask(1) << id;
        b.layers[id].plane = true;
      }
    }
    if (auto* un = layers.find("UnStackLayers"))
      for (auto* l : un->findAll("Layer")) b.addLayer(std::string(l->attr("name")), LayerKind::Other, Side::None);
  }
  LayerMask planeLayers = 0;
  LayerMask signalLayers() const { return b.allCopperMask() & ~planeLayers; }

  LayerId copperByName(std::string_view name) const {
    LayerId id = b.findLayer(std::string(name));
    return id >= 0 && b.layers[id].kind == LayerKind::Copper ? id : -1;
  }

  // --- library ---
  // Applies the LayerRef/LayerTypeRef of a pad entry to the padstack.
  void padLayers(const Element& pad, PadstackDef& d) {
    for (auto* r : pad.findAll("LayerTypeRef")) {
      auto t = r->attr("type");
      if (t == "Signal") d.allSignal = true;
      else if (t == "Plane") d.allPlane = true;
    }
    for (auto* r : pad.findAll("LayerRef")) {
      LayerId id = copperByName(r->attr("name"));
      if (id >= 0) d.layers |= LayerMask(1) << id;
      else if (r->attr("name") == "Top") d.layers |= LayerMask(1) << b.topCopper();
      else if (r->attr("name") == "Bottom") d.layers |= LayerMask(1) << b.bottomCopper();
    }
  }

  bool padShape(const Element& p, PadShape& sh, Vec2& shift) {
    if (p.is("PadCircle")) {
      sh.kind = PadShapeKind::Circle;
      sh.w = sh.h = len(p.num("diameter"));
    } else if (p.is("PadOval")) {
      double d = p.num("diameter");
      double sx = 0, sy = 0;
      if (auto* st = p.find("Stretch")) { sx = std::abs(st->num("x")); sy = std::abs(st->num("y")); }
      sh.kind = (sx > 0 || sy > 0) ? PadShapeKind::Oval : PadShapeKind::Circle;
      sh.w = len(d + sx);
      sh.h = len(d + sy);
    } else if (p.is("PadRect")) {
      sh.kind = PadShapeKind::Rect;
      sh.w = len(p.num("width"));
      sh.h = len(p.num("height"));
      auto handling = p.attr("handling", "None");
      double hv = p.num("handlingValue");
      if (handling == "Rounding" && hv > 0 && std::min(sh.w, sh.h) > 0) {
        sh.kind = PadShapeKind::RoundRect;
        sh.rratio = std::min(0.5, double(len(hv)) / double(std::min(sh.w, sh.h)));
      }
    } else if (p.is("PadPoly")) {
      sh.kind = PadShapeKind::Polygon;
      BBox bb;
      for (auto* d : p.findAll("Dot")) {
        Vec2 v = toBoard(pt(d));
        sh.poly.push_back(v);
        bb.add(v);
      }
      if (sh.poly.size() < 3) return false;
      sh.w = Coord(bb.width());
      sh.h = Coord(bb.height());
    } else {
      return false;
    }
    if (auto* sf = p.find("Shift")) shift = pt(sf);
    return true;
  }

  void readPadstack(const Element& ps) {
    PadstackDef d;
    auto type = ps.attr("type", "Through");
    d.drill = len(ps.num("holeDiameter"));
    d.plated = ps.flag("metallized", type != "MountHole");
    if (auto* pads = ps.find("Pads")) {
      for (auto& p : pads->kids) {
        PadstackDef tmp;
        padLayers(p, tmp);
        d.allSignal |= tmp.allSignal;
        d.allPlane |= tmp.allPlane;
        d.layers |= tmp.layers;
        // Shape: prefer the signal-layer entry, else the first copper entry.
        bool better = !d.haveShape || (tmp.allSignal && !d.shapeFromSignal);
        if (better && padShape(p, d.shape, d.shift)) {
          d.haveShape = true;
          d.shapeFromSignal = tmp.allSignal;
        }
      }
    }
    padstacks[std::string(ps.attr("name"))] = d;
  }

  void readViastack(const Element& vs) {
    ViastackDef d;
    d.drill = len(vs.num("holeDiameter"));
    if (auto* vp = vs.find("ViaPads"))
      for (auto& p : vp->kids) {
        PadShape sh;
        Vec2 sf;
        if (padShape(p, sh, sf)) { d.diameter = std::max(d.diameter, sh.w); }
      }
    if (auto* lr = vs.find("LayerRange")) {
      auto refs = lr->findAll("LayerRef");
      if (refs.size() == 2) {
        LayerId a = copperByName(refs[0]->attr("name")), c = copperByName(refs[1]->attr("name"));
        if (a >= 0 && c >= 0) {
          int ia = b.layers[a].copperIndex, ic = b.layers[c].copperIndex;
          for (int k = std::min(ia, ic); k <= std::max(ia, ic); ++k) d.layers |= LayerMask(1) << b.copperByIndex(k);
        }
      }
    }
    std::string name(vs.attr("name"));
    if (firstViastack.empty()) firstViastack = name;
    viastacks[name] = d;
  }

  // Appends the segments of a Polyline/Contour/FilledContour (Start + Segment*) as polyline points,
  // tessellating arcs. Returns false when the element has no Start.
  bool contourPoints(const Element& e, std::vector<Vec2>& out, double tol) const {
    const Element* st = e.find("Start");
    if (!st) return false;
    Vec2 cur = pt(st);
    out.push_back(cur);
    for (auto& seg : e.kids) {
      if (seg.is("SegmentLine")) {
        cur = pt(seg.find("End"));
        out.push_back(cur);
      } else if (seg.is("SegmentArcCCW") || seg.is("SegmentArcCW") || seg.is("SegmentArcByAngle") ||
                 seg.is("SegmentArcByMiddle")) {
        Vec2 end = pt(seg.find("End"));
        auto arc = segmentArc(seg, cur, end);
        if (arc.valid) {
          auto pl = arc.tessellate(tol / s);
          out.insert(out.end(), pl.begin() + 1, pl.end());
        } else {
          out.push_back(end);
        }
        cur = end;
      }
    }
    return true;
  }

  // Arc geometry (fst frame) of a wire/contour segment given its start and end points.
  ArcGeom segmentArc(const Element& seg, Vec2 start, Vec2 end) const {
    if (seg.is("SegmentArcByMiddle") || seg.is("TrackArcByMiddle"))
      return ArcGeom::fromThreePoints(start, pt(seg.find("Middle")), end);
    if (seg.is("SegmentArcByAngle") || seg.is("TrackArcByAngle")) {
      double a = degToRad(seg.num("angle"));
      if (std::abs(a) < 1e-9) return {};
      // Chord of length L subtending angle a: R = L / (2 sin(a/2)); centre on the chord's normal.
      Vec2 chord = end - start;
      double L = chord.len();
      if (L < 1e-12) return {};
      double R = L / (2 * std::sin(std::abs(a) / 2));
      double h = std::sqrt(std::max(0.0, R * R - L * L / 4));
      Vec2 mid = (start + end) * 0.5;
      Vec2 n = chord.perp().normalized();
      if (std::abs(a) > kPi) h = -h;
      Vec2 c = a > 0 ? mid + n * h : mid - n * h;
      return ArcGeom::fromCenter(c, start, a);
    }
    bool cw = seg.name.ends_with("CW") && !seg.name.ends_with("CCW");
    Vec2 c = pt(seg.find("Center"));
    double a0 = std::atan2(start.y - c.y, start.x - c.x), a1 = std::atan2(end.y - c.y, end.x - c.x);
    double sweep = normalizeAngle(a1 - a0);  // CCW sweep in [0, 2pi)
    if (sweep < 1e-9) sweep = 2 * kPi;
    if (cw) sweep -= 2 * kPi;
    return ArcGeom::fromCenter(c, start, sweep);
  }

  // Converts a Figure element (Line, Arc*, Circle, Rect, Polygon, Filled*, Polyline, Contour...)
  // into drawing primitives in the fst frame.
  void figure(const Element& f, std::vector<FpGraphic>& out, const std::string& layer, double width) const {
    FpGraphic g;
    g.layer = layer;
    g.width = width;
    auto emit = [&](FpGraphic x) { out.push_back(std::move(x)); };
    if (f.is("Line")) {
      auto dots = f.findAll("Dot");
      for (size_t i = 1; i < dots.size(); ++i) {
        g.kind = GraphicKind::Line;
        g.a = pt(dots[i - 1]);
        g.b = pt(dots[i]);
        emit(g);
      }
    } else if (f.is("Arc") || f.is("ArcCCW") || f.is("ArcCW") || f.is("ArcByAngle") || f.is("ArcByMiddle")) {
      Vec2 st = pt(f.find("Start")), en = pt(f.find("End"));
      ArcGeom arc;
      if (f.is("ArcByMiddle")) arc = ArcGeom::fromThreePoints(st, pt(f.find("Middle")), en);
      else if (f.is("ArcByAngle")) arc = segmentArc(f, st, en);
      else {
        Vec2 c = pt(f.find("Center"));
        double a0 = std::atan2(st.y - c.y, st.x - c.x), a1 = std::atan2(en.y - c.y, en.x - c.x);
        double sweep = normalizeAngle(a1 - a0);
        if (sweep < 1e-9) sweep = 2 * kPi;
        if (f.is("ArcCW")) sweep -= 2 * kPi;
        arc = ArcGeom::fromCenter(c, st, sweep);
      }
      if (!arc.valid) return;
      g.kind = GraphicKind::Arc;
      g.a = arc.start();
      g.m = arc.mid();
      g.b = arc.end();
      emit(g);
    } else if (f.is("Circle") || f.is("FilledCircle")) {
      g.kind = GraphicKind::Circle;
      g.a = pt(f.find("Center"));
      g.b = g.a + Vec2{f.num("diameter") / 2, 0};
      g.filled = f.is("FilledCircle");
      emit(g);
    } else if (f.is("Rect") || f.is("FilledRect")) {
      auto dots = f.findAll("Dot");
      if (dots.size() < 2) return;
      Vec2 a = pt(dots[0]), c = pt(dots[1]);
      g.kind = GraphicKind::Poly;
      g.pts = {a, {c.x, a.y}, c, {a.x, c.y}};
      g.filled = f.is("FilledRect");
      emit(g);
    } else if (f.is("Polygon")) {
      g.kind = GraphicKind::Poly;
      for (auto* d : f.findAll("Dot")) g.pts.push_back(pt(d));
      g.filled = true;
      if (g.pts.size() >= 3) emit(g);
    } else if (f.is("Polyline")) {
      const Element* st = f.find("Start");
      if (!st) return;
      Vec2 cur = pt(st);
      for (auto& seg : f.kids) {
        if (seg.is("SegmentLine")) {
          g.kind = GraphicKind::Line;
          g.a = cur;
          g.b = cur = pt(seg.find("End"));
          emit(g);
        } else if (seg.name.starts_with("SegmentArc")) {
          Vec2 end = pt(seg.find("End"));
          auto arc = segmentArc(seg, cur, end);
          if (arc.valid) {
            g.kind = GraphicKind::Arc;
            g.a = cur;
            g.m = arc.mid();
            g.b = end;
            emit(g);
          }
          cur = end;
        }
      }
    } else if (f.is("Contour") || f.is("FilledContour")) {
      g.kind = GraphicKind::Poly;
      if (!contourPoints(f, g.pts, 5000)) return;
      if (g.pts.size() >= 2 && (g.pts.front() - g.pts.back()).len() < 1e-9) g.pts.pop_back();
      g.filled = f.is("FilledContour");
      if (g.pts.size() >= 3) emit(g);
    }
  }

  void readDetail(const Element& det, std::vector<FpGraphic>& out) const {
    std::string layer;
    if (auto* lr = det.find("LayerRef")) layer = std::string(lr->attr("name"));
    double width = det.num("lineWidth");
    for (auto& k : det.kids)
      if (!k.is("LayerRef")) figure(k, out, layer, width);
  }

  void readFootprint(const Element& fp) {
    FootprintDef d;
    if (auto* pads = fp.find("Pads"))
      for (auto* p : pads->findAll("Pad")) {
        FpPad fpad;
        fpad.padNum = int(p->num("padNum"));
        fpad.name = std::string(p->attr("name"));
        if (fpad.name.empty()) fpad.name = std::to_string(fpad.padNum);
        fpad.angle = p->num("angle");
        fpad.flipped = p->flag("flipped");
        if (auto* r = p->find("PadstackRef")) fpad.padstack = std::string(r->attr("name"));
        fpad.org = pt(p->find("Org"));
        d.pads.push_back(fpad);
      }
    if (auto* dets = fp.find("Details"))
      for (auto* det : dets->findAll("Detail")) readDetail(*det, d.graphics);
    footprints[std::string(fp.attr("name"))] = std::move(d);
  }

  static std::string valueAttribute(const Element* attrs) {
    if (!attrs) return "";
    static const char* names[] = {"Value", "VALUE", "value", "PartName", "Part Name", "PARTNAME", "Type", "TYPE"};
    for (auto* n : names)
      for (auto* a : attrs->findAll("Attribute"))
        if (a->attr("name") == n && !a->attr("value").empty()) return std::string(a->attr("value"));
    return "";
  }

  void readLibrary(const Element& lib) {
    if (auto* e = lib.find("Padstacks"))
      for (auto* ps : e->findAll("Padstack")) readPadstack(*ps);
    if (auto* e = lib.find("Viastacks"))
      for (auto* vs : e->findAll("Viastack")) readViastack(*vs);
    if (auto* e = lib.find("Footprints"))
      for (auto* fp : e->findAll("Footprint")) readFootprint(*fp);
    if (auto* e = lib.find("Components"))
      for (auto* c : e->findAll("Component")) {
        std::string v = valueAttribute(c->find("Attributes"));
        if (!v.empty()) componentValues[std::string(c->attr("name"))] = v;
      }
  }

  // --- placement ---
  // Maps a footprint-frame layer name to a board layer, swapping sides for bottom components.
  LayerId detailLayer(const std::string& name, bool bottom) {
    LayerId id = b.findLayer(name);
    if (id < 0) return -1;
    if (!bottom || b.layers[id].side == Side::None) return id;
    Side want = b.layers[id].side == Side::Top ? Side::Bottom : Side::Top;
    for (size_t k = 0; k < b.layers.size(); ++k)
      if (b.layers[k].kind == b.layers[id].kind && b.layers[k].side == want) return LayerId(k);
    return id;
  }

  LayerMask mirrorMask(LayerMask m) const {
    auto cu = b.copperLayers();
    LayerMask r = 0;
    for (size_t k = 0; k < cu.size(); ++k)
      if ((m >> cu[k]) & 1) r |= LayerMask(1) << cu[cu.size() - 1 - k];
    return r;
  }

  // Adds one pad to the board; `local` is the pad centre in the fst footprint frame (before
  // mirroring), `padAngle` its rotation there.
  void placePad(int ci, const std::string& number, const PadstackDef& ps, Vec2 local, double padAngle, bool flipped,
                Vec2 org, double rot, bool bottom) {
    const Component& c = b.components[ci];
    Pad p;
    p.component = ci;
    p.number = number;
    p.shape = ps.shape;
    p.drill = ps.drill;
    p.plated = ps.plated;
    Vec2 centre = local + ps.shift.rotated(degToRad(padAngle));
    if (bottom) centre.x = -centre.x;
    Vec2 abs = toBoard(org + centre.rotated(degToRad(rot)));
    double angle = bottom ? rot - padAngle : rot + padAngle;
    p.pos = Point(abs);
    p.angle = std::fmod(angle + 720.0, 360.0);
    if (p.shape.kind == PadShapeKind::Polygon && bottom)
      for (auto& v : p.shape.poly) v.x = -v.x;
    // Copper layers: layer-type references are stack-wide, named layers are given in the footprint
    // frame ("Top" = component side) and flip for bottom-side or flipped pads.
    bool mirrored = bottom != flipped;
    LayerMask m = 0;
    if (ps.allSignal) m |= signalLayers();
    if (ps.allPlane) m |= planeLayers;
    m |= mirrored ? mirrorMask(ps.layers) : ps.layers;
    if (!m) m = ps.drill > 0 ? b.allCopperMask() : LayerMask(1) << (mirrored ? b.bottomCopper() : b.topCopper());
    p.copper = m;
    p.localPos = Point(rotateBoard(abs - c.pos.v(), -c.angle));
    p.localAngle = p.angle - c.angle;
    b.pads.push_back(p);
    b.components[ci].pads.push_back(int(b.pads.size() - 1));
  }

  void readComponents(const Element& cob) {
    if (auto* comps = cob.find("Components"))
      for (auto* ci : comps->findAll("CompInstance")) readCompInstance(*ci);
    if (auto* fps = cob.find("FreePads"))
      for (auto* fp : fps->findAll("FreePad")) readFreePad(*fp);
  }

  void readCompInstance(const Element& ci) {
    Component c;
    c.ref = std::string(ci.attr("name"));
    bool bottom = ci.attr("side", "Top") == "Bottom";
    double rot = ci.num("angle");
    Vec2 org = pt(ci.find("Org"));
    std::string compRef;
    if (auto* r = ci.find("ComponentRef")) compRef = std::string(r->attr("name"));
    if (auto* r = ci.find("FootprintRef")) c.footprint = std::string(r->attr("name"));
    c.value = valueAttribute(ci.find("Attributes"));
    if (c.value.empty()) {
      auto it = componentValues.find(compRef);
      if (it != componentValues.end()) c.value = it->second;
    }
    c.side = bottom ? Side::Bottom : Side::Top;
    c.pos = Point(toBoard(org));
    c.angle = std::fmod(rot + 720.0, 360.0);
    c.locked = ci.flag("fixed");
    int idx = int(b.components.size());
    b.components.push_back(c);
    auto fpIt = footprints.find(c.footprint);
    if (fpIt == footprints.end()) return;
    const FootprintDef& fp = fpIt->second;
    // Per-instance pin overrides (padstack / position).
    std::map<int, const Element*> pinOverride;
    if (auto* pins = ci.find("Pins"))
      for (auto* p : pins->findAll("Pin")) pinOverride[int(p->num("padNum"))] = p;
    auto tr = [&](Vec2 p) {
      if (bottom) p.x = -p.x;
      return toBoard(org + p.rotated(degToRad(rot)));
    };
    for (auto& fpad : fp.pads) {
      std::string psName = fpad.padstack;
      Vec2 local = fpad.org;
      if (auto it = pinOverride.find(fpad.padNum); it != pinOverride.end()) {
        if (auto* r = it->second->find("PadstackRef")) psName = std::string(r->attr("name"));
        if (auto* o = it->second->find("Org")) local = pt(o);
      }
      auto psIt = padstacks.find(psName);
      if (psIt == padstacks.end()) continue;
      placePad(idx, fpad.name, psIt->second, local, fpad.angle, fpad.flipped, org, rot, bottom);
      int pi = int(b.pads.size() - 1);
      pinToPad[key(c.ref, '\x01', fpad.name)] = pi;
      pinToPad[key(c.ref, '\x02', std::to_string(fpad.padNum))] = pi;
    }
    for (auto& fg : fp.graphics) {
      LayerId l = detailLayer(fg.layer, bottom);
      if (l < 0) continue;
      Graphic g;
      g.kind = fg.kind;
      g.layer = l;
      g.width = len(fg.width);
      g.filled = fg.filled;
      g.a = tr(fg.a);
      g.b = tr(fg.b);
      g.m = tr(fg.m);
      if (g.kind == GraphicKind::Circle) g.b = g.a + Vec2{(fg.b - fg.a).len() * s, 0};
      for (auto& v : fg.pts) g.pts.push_back(tr(v));
      b.components[idx].graphics.push_back(std::move(g));
    }
  }

  void readFreePad(const Element& fp) {
    Component c;
    c.ref = std::string(fp.attr("name"));
    bool bottom = fp.attr("side", "Top") == "Bottom";
    double rot = fp.num("angle");
    Vec2 org = pt(fp.find("Org"));
    std::string psName;
    if (auto* r = fp.find("PadstackRef")) psName = std::string(r->attr("name"));
    c.footprint = psName;
    c.side = bottom ? Side::Bottom : Side::Top;
    c.pos = Point(toBoard(org));
    c.angle = std::fmod(rot + 720.0, 360.0);
    c.locked = fp.flag("fixed");
    int idx = int(b.components.size());
    b.components.push_back(c);
    auto psIt = padstacks.find(psName);
    if (psIt == padstacks.end()) return;
    placePad(idx, "1", psIt->second, {}, 0, false, org, rot, bottom);
    int pi = int(b.pads.size() - 1);
    pinToPad[key(c.ref, '\x01', "1")] = pi;
    pinToPad[key(c.ref, '\x02', "1")] = pi;
    if (auto* nr = fp.find("NetRef")) b.pads[pi].net = b.addNet(std::string(nr->attr("name")));
  }

  // --- constructive ---
  // Board-frame graphic from a footprint-frame primitive.
  Graphic toGraphic(const FpGraphic& f, LayerId layer) const {
    Graphic g;
    g.kind = f.kind;
    g.layer = layer;
    g.width = len(f.width);
    g.filled = f.filled;
    g.a = toBoard(f.a);
    g.b = toBoard(f.b);
    g.m = toBoard(f.m);
    for (auto& v : f.pts) g.pts.push_back(toBoard(v));
    return g;
  }

  void readConstructive(const Element& cs) {
    edge = b.addLayer("Board_outline", LayerKind::Edge, Side::None);
    auto shapes = [&](const Element* parent, std::vector<Graphic>& out) {
      if (!parent) return;
      for (auto* sh : parent->findAll("Shape")) {
        std::vector<FpGraphic> figs;
        for (auto& k : sh->kids) figure(k, figs, "", sh->num("lineWidth"));
        for (auto& f : figs) out.push_back(toGraphic(f, edge));
      }
    };
    if (auto* bo = cs.find("BoardOutline")) {
      std::vector<Graphic> contour, voids;
      shapes(bo->find("Contour"), contour);
      shapes(bo->find("Voids"), voids);
      // Several shapes in Contour (e.g. a Specctra pcb boundary plus its signal boundary) are not
      // nested cutouts: keep the largest loop as the outer contour; Voids become holes.
      Board tmp;
      tmp.layers = b.layers;
      tmp.graphics = contour;
      buildOutline(tmp, edge);
      if (!tmp.outline.empty()) b.outline.push_back(tmp.outline.front());
      tmp.graphics = voids;
      buildOutline(tmp, edge);
      for (auto& h : tmp.outline) b.outline.push_back(h);
      b.graphics.insert(b.graphics.end(), contour.begin(), contour.end());
      b.graphics.insert(b.graphics.end(), voids.begin(), voids.end());
    }
    if (auto* mlo = cs.find("MechLayerObjects"))
      for (auto* det : mlo->findAll("Detail")) {
        std::vector<FpGraphic> figs;
        readDetail(*det, figs);
        for (auto& f : figs)
          if (LayerId l = b.findLayer(f.layer); l >= 0) b.graphics.push_back(toGraphic(f, l));
      }
  }

  // --- nets ---
  void readNetList(const Element& nl) {
    for (auto* n : nl.findAll("Net")) {
      int net = b.addNet(std::string(n->attr("name")));
      for (auto& r : n->kids) {
        std::string k;
        if (r.is("PinRef")) k = key(std::string(r.attr("compName")), '\x01', r.attr("pinName"));
        else if (r.is("PadRef")) k = key(std::string(r.attr("compName")), '\x02', r.attr("padNum"));
        else continue;
        auto it = pinToPad.find(k);
        if (it != pinToPad.end()) b.pads[it->second].net = net;
      }
    }
  }

  // --- groups ---
  std::map<std::string, std::vector<int>, std::less<>> netGroups;
  std::map<std::string, LayerMask, std::less<>> layerGroups;

  void readGroups(const Element& g) {
    // Groups may refer to groups defined later: resolve lazily with a recursion guard.
    std::map<std::string, const Element*, std::less<>> netDefs, layerDefs;
    if (auto* ng = g.find("NetGroups"))
      for (auto* e : ng->findAll("NetGroup")) netDefs[std::string(e->attr("name"))] = e;
    if (auto* lg = g.find("LayerGroups"))
      for (auto* e : lg->findAll("LayerGroup")) layerDefs[std::string(e->attr("name"))] = e;
    std::set<std::string, std::less<>> busy;
    auto nets = [&](this auto& self, std::string_view name) -> std::vector<int> {
      if (auto it = netGroups.find(name); it != netGroups.end()) return it->second;
      auto d = netDefs.find(name);
      if (d == netDefs.end() || !busy.emplace(name).second) return {};
      std::vector<int> out;
      for (auto& k : d->second->kids) {
        if (k.is("NetRef")) out.push_back(b.addNet(std::string(k.attr("name"))));
        else if (k.is("NetGroupRef")) std::ranges::copy(self(k.attr("name")), std::back_inserter(out));
      }
      std::ranges::sort(out);
      out.erase(std::ranges::unique(out).begin(), out.end());
      return netGroups[std::string(name)] = out;
    };
    auto layers = [&](this auto& self, std::string_view name) -> LayerMask {
      if (auto it = layerGroups.find(name); it != layerGroups.end()) return it->second;
      auto d = layerDefs.find(name);
      if (d == layerDefs.end() || !busy.emplace(name).second) return 0;
      LayerMask m = 0;
      for (auto& k : d->second->kids) {
        if (k.is("LayerRef")) {
          if (LayerId l = b.findLayer(std::string(k.attr("name"))); l >= 0) m |= LayerMask(1) << l;
        } else if (k.is("LayerGroupRef")) m |= self(k.attr("name"));
      }
      return layerGroups[std::string(name)] = m;
    };
    for (auto& [name, e] : netDefs) nets(name);
    busy.clear();
    for (auto& [name, e] : layerDefs) layers(name);
  }

  // --- rules ---
  // Nets of one ObjectNet item (NetRef / NetGroupRef / AllNets); nullopt = all nets.
  std::optional<std::vector<int>> objectNets(const Element& o) {
    if (o.is("AllNets")) return std::nullopt;
    if (o.is("NetRef")) return std::vector<int>{b.addNet(std::string(o.attr("name")))};
    if (o.is("NetGroupRef"))
      if (auto it = netGroups.find(o.attr("name")); it != netGroups.end()) return it->second;
    return std::vector<int>{};  // signals and unknown references affect no net
  }

  // LayersRef of a rule as a copper mask; nullopt = all layers.
  std::optional<LayerMask> ruleLayers(const Element& rule) {
    auto cu = b.copperLayers();
    LayerMask m = 0;
    bool any = false;
    auto add = [&](auto pred) {
      for (size_t i = 0; i < cu.size(); ++i)
        if (pred(i == 0 || i + 1 == cu.size(), b.layers[cu[i]])) m |= LayerMask(1) << cu[i];
    };
    for (auto& k : rule.kids) {
      if (k.is("AllLayers")) return std::nullopt;
      if (k.is("AllLayersInner")) add([](bool outer, const Layer&) { return !outer; });
      else if (k.is("AllLayersInnerSignal")) add([](bool outer, const Layer& L) { return !outer && !L.plane; });
      else if (k.is("AllLayersSignal")) add([](bool, const Layer& L) { return !L.plane; });
      else if (k.is("AllLayersOuter")) add([](bool outer, const Layer&) { return outer; });
      else if (k.is("LayerRef")) {
        if (LayerId l = b.findLayer(std::string(k.attr("name"))); l >= 0) m |= LayerMask(1) << l;
      } else if (k.is("LayerGroupRef")) {
        if (auto it = layerGroups.find(k.attr("name")); it != layerGroups.end()) m |= it->second;
      } else continue;
      any = true;
    }
    if (!any || m == b.allCopperMask()) return std::nullopt;
    return m;
  }

  void readRules(const Element& rules) {
    if (auto* pl = rules.find("RulesPlaneLayersNets"))
      for (auto* r : pl->findAll("PlaneLayerNets")) {
        if (!r->flag("enabled", true)) continue;
        auto* lr = r->find("LayerRef");
        auto* oa = r->find("ObjectsAffected");
        if (!lr || !oa) continue;
        LayerId l = b.findLayer(std::string(lr->attr("name")));
        auto* nr = oa->find("NetRef");
        if (l >= 0 && nr) b.layers[l].planeNet = b.addNet(std::string(nr->attr("name")));
      }
    // Rules are applied in file order, later ones taking priority (as in TopoR's rule list). Rules
    // for all layers set per-net values; layer-limited ones become layer rules.
    NetClass d = b.netClasses[0];
    struct PerNet {
      Coord width = 0, clearance = 0;
      std::string via;
    };
    std::vector<PerNet> per(b.nets.size());
    auto forNets = [&](const std::optional<std::vector<int>>& nets, auto fn) {
      if (!nets) {
        fn(-1);
        return;
      }
      for (int n : *nets) {
        if (n >= int(per.size())) per.resize(n + 1);
        fn(n);
      }
    };
    auto objects = [&](const Element& r) {
      std::vector<const Element*> out;
      if (auto* oa = r.find("ObjectsAffected"))
        for (auto& k : oa->kids) out.push_back(&k);
      return out;
    };
    if (auto* rw = rules.find("RulesWidthOfWires"))
      for (auto* r : rw->findAll("WidthOfWires")) {
        if (!r->flag("enabled", true)) continue;
        Coord w = len(r->num("widthNom", r->num("widthMin")));
        auto obj = objects(*r);
        if (obj.empty() || w <= 0) continue;
        auto nets = objectNets(*obj[0]);
        if (auto lm = ruleLayers(*r)) {
          if (*lm) b.layerRules.push_back({nets.value_or(std::vector<int>{}), *lm, w, 0});
          continue;
        }
        forNets(nets, [&](int n) {
          if (n < 0) {
            d.trackWidth = w;
            for (auto& p : per) p.width = 0;
          } else {
            per[n].width = w;
          }
        });
      }
    if (auto* rc = rules.find("RulesClearancesNetToNet"))
      for (auto* r : rc->findAll("ClearanceNetToNet")) {
        if (!r->flag("enabled", true)) continue;
        // TopoR uses the nominal clearance where there is room and the minimum in tight spots; the
        // single value our rules carry is the one every spot must satisfy: the minimum.
        Coord c = len(r->num("clrnMin", r->num("clrnNom")));
        auto obj = objects(*r);
        if (obj.empty() || c <= 0) continue;
        // Net-to-net pairs map onto per-net clearances (a pair takes the larger one): a rule
        // between two specific sets is applied to both of them, which is conservative.
        auto a = objectNets(*obj[0]);
        auto bn = obj.size() > 1 ? objectNets(*obj[1]) : std::nullopt;
        std::optional<std::vector<int>> nets;
        if (a && bn) {
          nets = *a;
          nets->insert(nets->end(), bn->begin(), bn->end());
        } else if (a || bn) {
          nets = a ? *a : *bn;
        }
        if (auto lm = ruleLayers(*r)) {
          if (*lm) b.layerRules.push_back({nets.value_or(std::vector<int>{}), *lm, 0, c});
          continue;
        }
        forNets(nets, [&](int n) {
          if (n < 0) {
            d.clearance = c;
            for (auto& p : per) p.clearance = 0;
          } else {
            per[n].clearance = c;
          }
        });
      }
    if (auto* rb = rules.find("RulesClearancesToBoard"))
      if (rb->has("wires")) b.edgeClearance = len(rb->num("wires"));
    std::string via = firstViastack;
    if (auto* rv = rules.find("RulesViastacksOfNets"))
      for (auto* r : rv->findAll("ViastacksOfNets")) {
        if (!r->flag("enabled", true)) continue;
        auto obj = objects(*r);
        auto* vs = r->find("Viastacks");
        auto* ref = vs ? vs->find("ViastackRef") : nullptr;
        if (obj.empty() || !ref) continue;
        std::string name(ref->attr("name"));
        forNets(objectNets(*obj[0]), [&](int n) {
          if (n < 0) {
            via = name;
            for (auto& p : per) p.via.clear();
          } else {
            per[n].via = name;
          }
        });
      }
    applyVia(d, via);
    b.netClasses[0] = d;

    // One net class per distinct (width, clearance, via) combination.
    std::map<std::tuple<Coord, Coord, Coord, Coord>, int> classes;
    for (size_t n = 0; n < per.size() && n < b.nets.size(); ++n) {
      const PerNet& p = per[n];
      if (!p.width && !p.clearance && p.via.empty()) continue;
      NetClass nc = d;
      if (p.width) nc.trackWidth = p.width;
      if (p.clearance) nc.clearance = p.clearance;
      if (!p.via.empty()) applyVia(nc, p.via);
      auto key = std::tuple{nc.trackWidth, nc.clearance, nc.viaDiameter, nc.viaDrill};
      if (key == std::tuple{d.trackWidth, d.clearance, d.viaDiameter, d.viaDrill}) continue;
      auto [it, added] = classes.try_emplace(key, int(b.netClasses.size()));
      if (added) {
        nc.name = std::format("W{:g}_C{:g}", nc.trackWidth / double(kNmPerMm), nc.clearance / double(kNmPerMm));
        if (nc.viaDiameter != d.viaDiameter || nc.viaDrill != d.viaDrill) nc.name += "_V" + p.via;
        b.netClasses.push_back(nc);
      }
      b.nets[n].netClass = it->second;
    }
  }

  void applyVia(NetClass& nc, const std::string& name) {
    auto it = viastacks.find(name);
    if (it == viastacks.end()) return;
    if (it->second.diameter > 0) nc.viaDiameter = it->second.diameter;
    if (it->second.drill > 0) nc.viaDrill = it->second.drill;
  }

  // --- connectivity ---
  void readConnectivity(const Element& cn) {
    if (auto* vias = cn.find("Vias"))
      for (auto* v : vias->findAll("Via")) {
        Via via;
        via.pos = Point(toBoard(pt(v->find("Org"))));
        via.locked = v->flag("fixed");
        via.layers = b.allCopperMask();
        via.diameter = b.netClasses[0].viaDiameter;
        via.drill = b.netClasses[0].viaDrill;
        if (auto* r = v->find("ViastackRef"))
          if (auto it = viastacks.find(std::string(r->attr("name"))); it != viastacks.end()) {
            if (it->second.diameter > 0) via.diameter = it->second.diameter;
            if (it->second.drill > 0) via.drill = it->second.drill;
            if (it->second.layers) via.layers = it->second.layers;
          }
        if (auto* nr = v->find("NetRef")) via.net = b.addNet(std::string(nr->attr("name")));
        b.vias.push_back(via);
      }
    if (auto* wires = cn.find("Wires"))
      for (auto* w : wires->findAll("Wire")) readWire(*w);
    if (auto* coppers = cn.find("Coppers"))
      for (auto* c : coppers->findAll("Copper")) readCopper(*c);
  }

  void readWire(const Element& w) {
    const Element* lr = w.find("LayerRef");
    if (!lr) return;
    LayerId layer = copperByName(lr->attr("name"));
    if (layer < 0) return;
    int net = kNoNet;
    if (auto* nr = w.find("NetRef")) net = b.addNet(std::string(nr->attr("name")));
    for (auto* sw : w.findAll("Subwire")) {
      const Element* st = sw->find("Start");
      if (!st) continue;
      Coord width = len(sw->num("width"));
      bool fixed = sw->flag("fixed");
      Vec2 cur = pt(st);
      for (auto& seg : sw->kids) {
        if (!seg.name.starts_with("Track")) continue;
        Vec2 end = pt(seg.find("End"));
        Track t;
        t.layer = layer;
        t.net = net;
        t.width = width;
        t.locked = fixed;
        t.a = Point(toBoard(cur));
        t.b = Point(toBoard(end));
        if (!seg.is("TrackLine")) {
          auto arc = segmentArc(seg, cur, end);
          if (arc.valid) t.mid = Point(toBoard(arc.mid()));
        }
        cur = end;
        if (t.a != t.b || t.mid.has_value()) b.tracks.push_back(t);
      }
    }
  }

  // Polygon (board frame) of a filled figure element, or empty.
  std::vector<Vec2> filledPolygon(const Element& f) const {
    std::vector<FpGraphic> figs;
    figure(f, figs, "", 0);
    std::vector<Vec2> out;
    if (figs.empty()) return out;
    const FpGraphic& g = figs.front();
    if (g.kind == GraphicKind::Poly) {
      for (auto& v : g.pts) out.push_back(toBoard(v));
    } else if (g.kind == GraphicKind::Circle) {
      auto pl = Shape::circle(toBoard(g.a), (g.b - g.a).len() * s).outline(5000);
      out.assign(pl.begin(), pl.end());
    }
    return out;
  }

  void readCopper(const Element& c) {
    const Element* lr = c.find("LayerRef");
    if (!lr) return;
    LayerId layer = copperByName(lr->attr("name"));
    if (layer < 0) return;
    Zone z;
    z.layer = layer;
    if (auto* nr = c.find("NetRef")) z.net = b.addNet(std::string(nr->attr("name")));
    z.clearance = len(c.num("backoff"));
    z.priority = int(c.num("priority"));
    std::string cp(c.attr("connectPad"));
    if (cp == "Direct" || cp == "Solid") z.padConnection = PadConnection::Solid;
    else if (cp == "None" || cp == "NoConnect") z.padConnection = PadConnection::None;
    if (auto* tp = c.find("ThermalPad"))
      if (auto* th = tp->find("Thermal")) {
        z.spokeWidth = len(th->num("spokeWidth"));
        z.thermalGap = len(th->num("backoff"));
        z.spokeAngle = th->num("angle");
      }
    if (auto* sh = c.find("Shape"))
      for (auto& f : sh->kids) {
        z.outline = filledPolygon(f);
        if (!z.outline.empty()) break;
      }
    if (z.outline.empty()) return;
    if (auto* is = c.find("Islands"))
      for (auto* island : is->findAll("Island")) {
        // Island = outer contour + Voids (holes) + thermal spokes (separate copper pieces).
        Polyline outer;
        std::vector<Polyline> holes;
        for (auto& f : island->kids) {
          if (f.is("Voids")) {
            for (auto& v : f.kids) {
              auto h = filledPolygon(v);
              if (h.size() >= 3) holes.push_back(std::move(h));
            }
          } else if (f.is("ThermalSpoke")) {
            for (auto& sp : f.kids) {
              auto poly = filledPolygon(sp);
              if (poly.size() >= 3) z.filled.push_back(std::move(poly));
            }
          } else if (outer.empty()) {
            outer = filledPolygon(f);
          }
        }
        if (outer.size() >= 3) z.filled.push_back(fracture(outer, std::move(holes)));
      }
    b.zones.push_back(std::move(z));
  }
};

}  // namespace

Result<BoardPtr> readFst(const std::string& text, const std::string& path) {
  auto doc = xml::parse(text);
  if (!doc) return std::unexpected(doc.error());
  const Element& root = *doc;
  if (!root.is("TopoR_PCB_File")) return std::unexpected(std::string("not a TopoR PCB file"));
  auto b = std::make_unique<Board>();
  Reader r(*b);
  if (auto* units = root.path({"Header", "Units"})) {
    auto d = units->attr("dist", "mm");
    if (d == "mm") r.s = double(kNmPerMm);
    else if (d == "mil") r.s = double(kNmPerMil);
    else if (d == "mkm") r.s = 1000;
    else if (d == "cm") r.s = 10.0 * kNmPerMm;
    else if (d == "dm") r.s = 100.0 * kNmPerMm;
    else if (d == "m") r.s = 1000.0 * kNmPerMm;
    else if (d == "inch") r.s = 1000.0 * kNmPerMil;
  }
  if (auto* layers = root.find("Layers")) r.readLayers(*layers);
  if (b->copperCount() == 0) {
    b->addLayer("Top", LayerKind::Copper, Side::Top);
    b->addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  if (auto* lib = root.find("LocalLibrary")) r.readLibrary(*lib);
  if (auto* cs = root.find("Constructive")) r.readConstructive(*cs);
  if (auto* cob = root.find("ComponentsOnBoard")) r.readComponents(*cob);
  if (auto* nl = root.find("NetList")) r.readNetList(*nl);
  if (auto* groups = root.find("Groups")) r.readGroups(*groups);
  if (auto* rules = root.find("Rules")) r.readRules(*rules);
  else r.applyVia(b->netClasses[0], r.firstViastack);
  if (auto* cn = root.find("Connectivity")) r.readConnectivity(*cn);
  // Plane layers: board-wide zones of their net, poured right away (TopoR shows them solid).
  size_t zonesBefore = b->zones.size();
  addPlaneZones(*b);
  if (b->zones.size() > zonesBefore) {
    ZoneFillOptions zo;
    for (size_t z = zonesBefore; z < b->zones.size(); ++z) zo.only.push_back(int(z));
    fillZones(*b, zo);
  }
  if (b->name.empty()) b->name = std::filesystem::path(path).stem().string();
  b->rebuildNetIndex();
  return b;
}

}  // namespace xr::io
