// TopoR PCB 1.2.0 (.fst) reader. The file is XML with coordinates in Header/Units (mm by default)
// and the Y axis pointing up; angles are degrees counter-clockwise. Bottom-side components are
// mirrored about the footprint's vertical axis before rotation, like Specctra.
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <filesystem>
#include <format>
#include <iterator>
#include <map>
#include <optional>
#include <set>
#include <tuple>

#include "core/Padstack.h"
#include "core/ZoneFill.h"
#include "geom/Geometry.h"
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
  std::string from, to;  // LayerRange by name
  bool viaOnPin = false;
  std::vector<ViaPadSize> pads;
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
  std::vector<double> arcs;  // Poly: the sides' arc angles (Graphic::arcs)
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
  std::map<std::string, int> stackIndex;  // into b.padstacks
  std::map<std::string, ViastackDef> viastacks;
  std::map<std::string, FootprintDef> footprints;
  std::map<std::string, std::string> componentValues;  // schematic component -> value attribute
  std::map<std::string, int> pinToPad;                 // "comp\x01pinName" and "comp\x02padNum"
  std::string firstViastack;
  std::string preferredViastack;  // the type the design's own vias use (TopoR routes with it when any type is allowed)
  LayerId edge = -1;
  std::vector<std::vector<Vec2>> contourHoles;  // the loops of Contour inside the outer one, cutouts if empty

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

  // One entry of a padstack's Pads as a detail of the stack.
  std::optional<PadDetail> stackDetail(const Element& p) const {
    PadDetail d;
    if (p.is("PadCircle")) {
      d.form = PadDetail::Form::Circle;
      d.w = d.h = len(p.num("diameter"));
    } else if (p.is("PadOval")) {
      d.form = PadDetail::Form::Oval;
      d.w = d.h = len(p.num("diameter"));
      if (auto* st = p.find("Stretch")) d.stretch = toBoard(pt(st));
    } else if (p.is("PadRect")) {
      d.form = PadDetail::Form::Rect;
      d.w = len(p.num("width"));
      d.h = len(p.num("height"));
      auto h = p.attr("handling", "None");
      d.handling = h == "Rounding" ? CornerHandling::Rounding : h == "Chamfer" ? CornerHandling::Chamfer : CornerHandling::None;
      d.handlingValue = len(p.num("handlingValue"));
      d.custom = p.flag("custom", false);
      if (p.flag("cornerLB", false)) d.corners |= kCornerLB;
      if (p.flag("cornerRB", false)) d.corners |= kCornerRB;
      if (p.flag("cornerRT", false)) d.corners |= kCornerRT;
      if (p.flag("cornerLT", false)) d.corners |= kCornerLT;
    } else if (p.is("PadPoly")) {
      d.form = PadDetail::Form::Polygon;
      BBox bb;
      for (auto* dot : p.findAll("Dot")) {
        d.poly.push_back(toBoard(pt(dot)));
        bb.add(d.poly.back());
      }
      if (d.poly.size() < 3) return std::nullopt;
      d.w = Coord(std::llround(bb.width()));
      d.h = Coord(std::llround(bb.height()));
    } else {
      return std::nullopt;
    }
    if (auto* sf = p.find("Shift")) d.shift = toBoard(pt(sf));
    if (auto* r = p.find("LayerTypeRef")) d.layerClass = std::string(r->attr("type", "Signal"));
    else if (auto* r = p.find("LayerRef")) d.layer = std::string(r->attr("name"));
    return d;
  }

  void readPadstack(const Element& ps) {
    PadstackDef d;
    auto type = ps.attr("type", "Through");
    bool mountHole = type == "MountHole" || type == "MountingHole";
    d.drill = len(ps.num("holeDiameter"));
    d.plated = ps.flag("metallized", !mountHole);
    // The stack as it is, for the editor and for writing it back.
    Padstack st;
    st.name = std::string(ps.attr("name"));
    st.type = mountHole ? PadstackType::MountHole : type == "SMD" ? PadstackType::SMD : PadstackType::Through;
    st.drill = st.type == PadstackType::SMD ? 0 : d.drill;
    st.plated = d.plated;
    auto conn = ps.attr("connectToCopper", "");
    st.connect = conn == "NoneConnect" ? PadConnect::None : conn == "Direct" ? PadConnect::Direct
               : conn == "Thermal"     ? PadConnect::Thermal : PadConnect::Unset;
    if (auto* t = ps.find("Thermal")) {
      st.thermal.spokes = int(t->num("spokeNum", 4));
      st.thermal.minSpokes = int(t->num("minSpokeNum", 4));
      st.thermal.angle = t->num("angle", 45);
      st.thermal.spokeWidth = len(t->num("spokeWidth", 0.381));
      st.thermal.backoff = len(t->num("backoff", 0.381));
    }
    if (auto* pads = ps.find("Pads"))
      for (auto& p : pads->kids)
        if (auto det = stackDetail(p)) {
          // An entry without a layer (TopoR writes such ones for designs from P-CAD): the signal layers, then
          // the plane ones.
          if (det->layer.empty() && det->layerClass.empty()) {
            auto has = [&](const char* cls) {
              return r::contains(st.details, cls, &PadDetail::layerClass);
            };
            if (!has("Signal")) det->layerClass = "Signal";
            else if (!has("Plane")) det->layerClass = "Plane";
            else continue;
          }
          st.details.push_back(std::move(*det));
        }
    stackIndex[st.name] = int(b.padstacks.size());
    b.padstacks.push_back(std::move(st));
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
    d.viaOnPin = vs.flag("viaOnPin", false);
    Coord any = 0;
    if (auto* vp = vs.find("ViaPads"))
      for (auto& p : vp->kids) {
        PadShape sh;
        Vec2 sf;
        if (!padShape(p, sh, sf)) continue;
        ViaPadSize ps;
        ps.diameter = sh.w;
        if (auto* r = p.find("LayerTypeRef")) ps.layerClass = std::string(r->attr("type", "Signal"));
        else if (auto* r = p.find("LayerRef")) ps.layer = std::string(r->attr("name"));
        else ps.layerClass = "Signal";
        // The copper size: the largest of the copper pads (the mask ones are not copper).
        bool copper = ps.layerClass == "Signal" || ps.layerClass == "Plane" || copperByName(ps.layer) >= 0;
        if (copper) d.diameter = std::max(d.diameter, sh.w);
        any = std::max(any, sh.w);
        d.pads.push_back(std::move(ps));
      }
    if (d.diameter == 0) d.diameter = any;
    if (auto* lr = vs.find("LayerRange")) {
      auto refs = lr->findAll("LayerRef");
      if (refs.size() == 2) {
        d.from = std::string(refs[0]->attr("name"));
        d.to = std::string(refs[1]->attr("name"));
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

  // The vertices of a Contour/FilledContour (Start + Segment*) and the angles of its sides, as Graphic::arcs: a
  // contour's arcs stay arcs. Returns false when the element has no Start.
  bool contourVertices(const Element& e, std::vector<Vec2>& pts, std::vector<double>& arcs) const {
    const Element* st = e.find("Start");
    if (!st) return false;
    Vec2 cur = pt(st);
    pts.push_back(cur);
    for (auto& seg : e.kids) {
      if (!seg.name.starts_with("Segment")) continue;
      Vec2 end = pt(seg.find("End"));
      double deg = 0;
      if (!seg.is("SegmentLine"))
        if (auto arc = segmentArc(seg, cur, end); arc.valid) deg = radToDeg(arc.sweep);  // fst frame: Y up
      arcs.resize(pts.size() - 1, 0);
      arcs.push_back(deg);
      pts.push_back(end);
      cur = end;
    }
    // The contour closes on its start: the last side is the one back to it.
    if (pts.size() >= 2 && (pts.front() - pts.back()).len() < 1e-9) pts.pop_back();
    else arcs.resize(pts.size(), 0);
    arcs.resize(pts.size(), 0);
    if (r::none_of(arcs, [](double x) { return x != 0; })) arcs.clear();
    return true;
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
      // A rectangle stays one: TopoR edits it by its corners and sides.
      g.kind = GraphicKind::Rect;
      g.a = pt(dots[0]);
      g.b = pt(dots[1]);
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
      if (!contourVertices(f, g.pts, g.arcs)) return;
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
  void placePad(int ci, const std::string& number, const std::string& stackName, const PadstackDef& ps, Vec2 local,
                double padAngle, bool flipped, Vec2 org, double rot, bool bottom) {
    const Component& c = b.components[ci];
    Pad p;
    p.component = ci;
    p.number = number;
    p.shape = ps.shape;
    p.drill = ps.drill;
    p.plated = ps.plated;
    if (auto it = stackIndex.find(stackName); it != stackIndex.end()) p.padstack = it->second;
    p.mirror = bottom;
    p.bottomSide = bottom != flipped;
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
      placePad(idx, fpad.name, psName, psIt->second, local, fpad.angle, fpad.flipped, org, rot, bottom);
      int pi = int(b.pads.size() - 1);
      pinToPad[key(c.ref, '\x01', fpad.name)] = pi;
      pinToPad[key(c.ref, '\x02', std::to_string(fpad.padNum))] = pi;
    }
    for (FpGraphic fg : fp.graphics) {
      LayerId l = detailLayer(fg.layer, bottom);
      if (l < 0) continue;
      // A component's drawings turn with it: a rectangle becomes its corners.
      if (fg.kind == GraphicKind::Rect) {
        fg.kind = GraphicKind::Poly;
        fg.pts = {fg.a, {fg.b.x, fg.a.y}, fg.b, {fg.a.x, fg.b.y}};
      }
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
      g.arcs = fg.arcs;
      if (bottom) g.mirrorArcs();
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
    placePad(idx, "1", psName, psIt->second, {}, 0, false, org, rot, bottom);
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
    g.arcs = f.arcs;  // Y flipped, and shown so: the turns look the same
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
      // The largest loop of Contour is the outer contour. The other loops there are cutouts when nothing
      // lies in them (SingleLayer: a ring, the hole drawn as a second circle of the Contour) and not when the
      // copper does (arz: a Specctra pcb boundary plus its signal boundary inset 5 mm, everything inside it);
      // decided once the components and tracks are read (contourHoles). Voids are always holes.
      Board tmp;
      tmp.layers = b.layers;
      tmp.graphics = contour;
      buildOutline(tmp, edge);
      if (!tmp.outline.empty()) b.outline.push_back(tmp.outline.front());
      for (size_t i = 1; i < tmp.outline.size(); ++i) contourHoles.push_back(tmp.outline[i]);
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
    if (auto* ts = cs.find("Texts"))
      for (auto* t : ts->findAll("Text")) readText(*t);
    if (auto* ks = cs.find("Keepouts"))
      for (auto* k : ks->findAll("Keepout")) readKeepout(*k);
  }

  // --- texts and keepouts ---
  std::map<std::string, int, std::less<>> styleIndex;

  void readTextStyles(const Element& ts) {
    b.textStyles.clear();
    for (auto* e : ts.findAll("TextStyle")) {
      TextStyle st;
      st.name = std::string(e->attr("name"));
      st.font = std::string(e->attr("fontName", "QUALITY"));
      st.height = len(e->num("height", 1.5));
      st.bold = e->flag("bold");
      st.italic = e->flag("italic");
      // P-CAD styles come as «T:H<height>W<stroke>» in mils.
      int h = 0, w = 0;
      if (std::sscanf(st.name.c_str(), "T:H%dW%d", &h, &w) == 2 && w > 0) st.lineWidth = Coord(w) * kNmPerMil;
      styleIndex[st.name] = int(b.textStyles.size());
      b.textStyles.push_back(std::move(st));
    }
    if (b.textStyles.empty()) b.textStyles.push_back({});
  }

  void readText(const Element& e) {
    Text t;
    t.text = std::string(e.attr("text"));
    static const char* aligns[] = {"LT", "CT", "RT", "LM", "CM", "RM", "LB", "CB", "RB"};
    std::string_view al = e.attr("align", "CM");  // TopoR leaves out its default, the centre
    for (int i = 0; i < 9; ++i)
      if (al == aligns[i]) t.align = TextAlign(i);
    t.angle = e.num("angle");
    t.mirror = e.flag("mirror");
    if (auto* lr = e.find("LayerRef")) t.layer = b.findLayer(std::string(lr->attr("name")));
    if (t.layer < 0) return;
    if (auto* sr = e.find("TextStyleRef"))
      if (auto it = styleIndex.find(sr->attr("name")); it != styleIndex.end()) t.style = it->second;
    t.pos = toBoard(pt(e.find("Org")));
    b.texts.push_back(std::move(t));
  }

  void readKeepout(const Element& e) {
    Keepout k;
    if (auto* role = e.find("Role")) {
      if (auto* tr = role->find("Trace")) {
        std::string_view r = tr->attr("role", "Wires and Vias");
        k.wires = r != "Vias";
        k.vias = r != "Wires";
        for (auto* lr : tr->findAll("LayerRef"))
          if (LayerId l = copperByName(lr->attr("name")); l >= 0) k.layers |= LayerMask(1) << l;
      } else if (auto* pl = role->find("Place")) {
        k.role = Keepout::Role::Place;
        std::string_view side = pl->attr("side", "Both");
        k.side = side == "Top" ? Side::Top : side == "Bottom" ? Side::Bottom : Side::None;
      }
    }
    std::vector<FpGraphic> figs;
    for (auto& f : e.kids)
      if (!f.is("Role")) figure(f, figs, "", 0);
    for (auto& f : figs) k.shape.push_back(toGraphic(f, -1));
    if (!k.shape.empty()) b.keepouts.push_back(std::move(k));
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
        else if (k.is("NetGroupRef")) r::copy(self(k.attr("name")), std::back_inserter(out));
      }
      r::sort(out);
      out.erase(r::unique(out).begin(), out.end());
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

  // Rule objects: AllNets, NetRef, NetGroupRef, or a signal, a differential signal or a signal group.
  RuleNets ruleNets(const Element& o) {
    if (o.is("NetRef")) return {RuleNets::Kind::Net, std::string(o.attr("name"))};
    if (o.is("NetGroupRef")) return {RuleNets::Kind::Group, std::string(o.attr("name"))};
    if (o.is("SignalRef")) return {RuleNets::Kind::Signal, std::string(o.attr("name"))};
    if (o.is("DiffSignalRef") || o.is("DiffPairRef")) return {RuleNets::Kind::DiffSignal, std::string(o.attr("name"))};
    if (o.is("SignalGroupRef")) return {RuleNets::Kind::SignalGroup, std::string(o.attr("name"))};
    if (o.is("AllNets")) return {};
    return {RuleNets::Kind::Net, {}};  // the unknown: no net
  }
  std::optional<ObjectSignal> objectSignal(const Element& o) {
    if (o.is("SignalRef")) return ObjectSignal{ObjectSignal::Kind::Signal, std::string(o.attr("name"))};
    if (o.is("DiffSignalRef") || o.is("DiffPairRef")) return ObjectSignal{ObjectSignal::Kind::DiffSignal, std::string(o.attr("name"))};
    if (o.is("SignalGroupRef")) return ObjectSignal{ObjectSignal::Kind::SignalGroup, std::string(o.attr("name"))};
    return std::nullopt;
  }
  PinRef pinRef(const Element& e) { return {std::string(e.attr("compName")), std::string(e.attr("pinName"))}; }

  // HiSpeedRules, kept as the file has them (HiSpeed.h); the differential signals make the pairs.
  void readHiSpeed(const Element& hs) {
    HiSpeed& h = b.hispeed;
    if (auto* ri = hs.find("RulesImpedances"))
      for (auto& z : ri->kids) {
        if (!z.is("Impedance") && !z.is("ImpedanceDiff")) continue;
        Impedance imp;
        imp.name = z.attr("name");
        imp.z0 = z.num("Z0");
        imp.diff = z.is("ImpedanceDiff");
        for (auto* lr : z.findAll("LayerRule")) {
          ImpedanceLayerRule r;
          if (auto* l = lr->find("LayerRef")) r.layer = l->attr("name");
          r.width = len(lr->num("width"));
          r.gap = len(lr->num("gap"));
          imp.rules.push_back(std::move(r));
        }
        h.impedances.push_back(std::move(imp));
      }
    if (auto* scs = hs.find("SignalClusters"))
      for (auto* sc : scs->findAll("SignalCluster")) {
        SignalCluster c;
        if (auto* z = sc->find("ImpedanceRef")) c.impedance = z->attr("name");
        if (auto* sp = sc->find("SourcePinRef")) c.source = pinRef(*sp);
        if (auto* ns = sc->find("Nets"))
          for (auto* n : ns->findAll("NetRef")) c.nets.emplace_back(n->attr("name"));
        if (auto* pps = sc->find("PinPairs"))
          for (auto* pp : pps->findAll("PinPair")) {
            auto refs = pp->findAll("PinRef");
            if (refs.size() == 2) c.pinPairs.push_back({pinRef(*refs[0]), pinRef(*refs[1])});
          }
        for (auto* sg : sc->findAll("Signal")) {
          Signal sig;
          sig.name = sg->attr("name");
          if (auto* rp = sg->find("ReceiverPinRef")) sig.receiver = pinRef(*rp);
          if (auto* cs = sg->find("Components"))
            for (auto* cr : cs->findAll("CompInstanceRef")) sig.components.emplace_back(cr->attr("name"));
          c.signalList.push_back(std::move(sig));
        }
        h.clusters.push_back(std::move(c));
      }
    if (auto* ds = hs.find("DiffSignals"))
      for (auto* d : ds->findAll("DiffSignal")) {
        DiffSignal x;
        x.name = d->attr("name");
        x.mismatch = len(d->num("mismatch"));
        if (auto* z = d->find("ImpedanceRef")) x.impedance = z->attr("name");
        auto refs = d->findAll("SignalRef");
        if (!refs.empty()) x.signalA = refs[0]->attr("name");
        if (refs.size() > 1) x.signalB = refs[1]->attr("name");
        h.diffSignals.push_back(std::move(x));
      }
    if (auto* gs = hs.find("SignalGroups"))
      for (auto* g : gs->findAll("SignalGroup")) {
        SignalGroup sg;
        sg.name = g->attr("name");
        for (auto& k : g->kids)
          if (auto o = objectSignal(k)) sg.members.push_back(*o);
        h.groups.push_back(std::move(sg));
      }
    if (auto* rd = hs.find("RulesDelay"))
      for (auto& r : rd->kids) {
        DelayRule d;
        if (r.is("DelayEqual")) d.kind = DelayRule::Kind::Equal;
        else if (r.is("DelayConstant")) d.kind = DelayRule::Kind::Constant;
        else if (r.is("DelayRelation")) d.kind = DelayRule::Kind::Relation;
        else continue;
        d.enabled = r.flag("enabled", true);
        d.time = r.attr("valueType", "Dist") == "Time";
        d.constant = r.num("constant");
        d.tolerance = r.num("tolerance");
        d.toleranceUnder = r.num("toleranceUnder");
        d.toleranceOver = r.num("toleranceOver");
        auto objects = [&](const Element* parent, std::vector<ObjectSignal>& out) {
          if (!parent) return;
          for (auto& k : parent->kids)
            if (auto o = objectSignal(k)) out.push_back(*o);
        };
        objects(r.find("ObjectsAffected"), d.objects);
        objects(r.find("ObjectLeft"), d.left);
        objects(r.find("ObjectRight"), d.right);
        h.delays.push_back(std::move(d));
      }
    if (auto* ss = hs.find("SignalSearchSettings")) {
      SignalSearch& q = h.search;
      q.present = true;
      q.maxNetsInCluster = int(ss->num("maxNetsInCluster", 5));
      q.createPinPairs = ss->flag("createPinPairs", true);
      if (auto* rn = ss->find("RulesDiffSignalNetsNames"))
        for (auto* r : rn->findAll("RuleDiffSignalNetsNames"))
          q.names.push_back({r->flag("enabled", true), std::string(r->attr("posStr")), std::string(r->attr("negStr"))});
      if (auto* ex = ss->find("ExcludedNets")) {
        q.minPinsNumber = int(ex->num("minPinsNumber", 20));
        for (auto* n : ex->findAll("NetRef")) q.excludedNets.emplace_back(n->attr("name"));
      }
    }
  }

  void readRules(const Element& rules) {
    DesignRules r;
    for (auto& [name, nets] : netGroups) {
      NetGroup g{name, {}};
      for (int n : nets) g.nets.push_back(b.nets[n].name);
      r.netGroups.push_back(std::move(g));
    }
    // The default type (a rule that allows every type uses it): the one the design's vias already use,
    // as TopoR does (its autorouter keeps the design's via on arz_2L, Arcs, MinVia, Placement rather
    // than the synthetic «(Default)» or the first listed); without any, the smallest; then the first.
    std::string def = preferredViastack;
    if (def.empty() || !viastacks.contains(def)) {
      def = firstViastack;
      for (auto& [name, v] : viastacks) {
        bool synthetic = name == "(Default)" || name == "[Default]";  // TopoR's own placeholder type
        bool defSynthetic = def == "(Default)" || def == "[Default]";
        if (v.diameter <= 0) continue;
        if (viastacks[def].diameter <= 0 || (defSynthetic && !synthetic) ||
            (synthetic == defSynthetic && std::tuple{v.diameter, v.drill} < std::tuple{viastacks[def].diameter, viastacks[def].drill}))
          def = name;
      }
    }
    for (auto& [name, v] : viastacks) {
      ViaType t{name, v.diameter, v.drill, v.from, v.to, v.viaOnPin, v.pads};
      // Only the signal pad: nothing to keep apart from the diameter.
      if (t.pads.size() == 1 && t.pads[0].layerClass == "Signal" && t.pads[0].diameter == t.diameter) t.pads.clear();
      if (name == def) r.viaTypes.insert(r.viaTypes.begin(), t);
      else r.viaTypes.push_back(t);
    }
    auto objects = [&](const Element& rule) {
      std::vector<const Element*> out;
      if (auto* oa = rule.find("ObjectsAffected"))
        for (auto& k : oa->kids) out.push_back(&k);
      return out;
    };
    // Layers of a rule as names; nullopt when the rule applies to no layer of the design.
    auto layers = [&](const Element& rule) -> std::optional<std::vector<std::string>> {
      auto m = ruleLayers(rule);
      if (!m) return std::vector<std::string>{};
      if (!*m) return std::nullopt;
      std::vector<std::string> names;
      for (LayerId l : b.copperLayers())
        if ((*m >> l) & 1) names.push_back(b.layers[l].name);
      return names;
    };
    if (auto* pl = rules.find("RulesPlaneLayersNets"))
      for (auto* p : pl->findAll("PlaneLayerNets")) {
        auto* lr = p->find("LayerRef");
        auto* oa = p->find("ObjectsAffected");
        auto* nr = oa ? oa->find("NetRef") : nullptr;
        if (lr && nr) r.planes.push_back({p->flag("enabled", true), std::string(lr->attr("name")), std::string(nr->attr("name"))});
      }
    if (auto* rw = rules.find("RulesWidthOfWires"))
      for (auto* w : rw->findAll("WidthOfWires")) {
        auto obj = objects(*w);
        auto ls = layers(*w);
        if (obj.empty() || !ls) continue;
        r.widths.push_back({w->flag("enabled", true), *ls, ruleNets(*obj[0]), len(w->num("widthMin", w->num("widthNom"))),
                            len(w->num("widthNom", w->num("widthMin")))});
      }
    if (auto* rc = rules.find("RulesClearancesNetToNet"))
      for (auto* c : rc->findAll("ClearanceNetToNet")) {
        auto obj = objects(*c);
        auto ls = layers(*c);
        if (obj.empty() || !ls) continue;
        r.clearances.push_back({c->flag("enabled", true), *ls, ruleNets(*obj[0]),
                                obj.size() > 1 ? ruleNets(*obj[1]) : RuleNets{}, len(c->num("clrnMin", c->num("clrnNom"))),
                                len(c->num("clrnNom", c->num("clrnMin")))});
      }
    if (auto* rb = rules.find("RulesClearancesToBoard")) {
      r.edgeWires = len(rb->num("wires"));
      r.edgeComps = len(rb->num("comps"));
    }
    if (auto* rv = rules.find("RulesViastacksOfNets"))
      for (auto* v : rv->findAll("ViastacksOfNets")) {
        auto obj = objects(*v);
        if (obj.empty()) continue;
        ViaRule rule{v->flag("enabled", true), ruleNets(*obj[0]), {}};
        if (auto* vs = v->find("Viastacks"))
          for (auto* ref : vs->findAll("ViastackRef")) rule.viaTypes.emplace_back(ref->attr("name"));  // none: AllViastacks
        r.vias.push_back(std::move(rule));
      }
    if (auto* cc = rules.find("RulesClearancesCompToComp"))
      if (auto* c = cc->find("ClearanceCompToComp")) {
        r.compClearanceEnabled = c->flag("enabled", true);
        r.compClearance = len(c->num("clrn"));
      }
    if (auto* pc = rules.find("PadConnectSettings")) r.padConnectAll = pc->attr("mode") == "AllPads";
    // The nets' properties: the flexible fixation and «Трассировать».
    if (auto* np = rules.find("NetProperties"))
      for (auto* p : np->findAll("NetProperty")) {
        auto* ref = p->find("NetRef");
        const int net = ref ? b.findNet(std::string(ref->attr("name"))) : -1;
        if (net < 0) continue;
        b.nets[size_t(net)].flexFixed = p->flag("flexfix", false);
        b.nets[size_t(net)].route = p->flag("route", true);
      }
    if (auto* sl = rules.find("RulesSignalLayersNets"))
      for (auto* s : sl->findAll("SignalLayerNets")) {
        auto* lr = s->find("LayerRef");
        if (!lr) continue;
        LayerNetsRule rule{s->flag("enabled", true), std::string(lr->attr("name")), {}};
        for (auto* o : objects(*s)) rule.nets.push_back(ruleNets(*o));
        r.layerNets.push_back(std::move(rule));
      }
    b.rules = std::move(r);
    compileRules(b);
  }

  // Settings/Autoroute and Settings/Autoproc (TopoR writes «SingleLayerTop», its schema «SinglelayerTop»).
  void readSettings(const Element& st) {
    AutorouteSettings& s = b.autoroute;
    auto is = [](std::string_view v, std::string_view w) {
      return v.size() == w.size() && r::equal(v, w, {}, [](char c) { return std::tolower(static_cast<unsigned char>(c)); },
                                               [](char c) { return std::tolower(static_cast<unsigned char>(c)); });
    };
    if (auto* a = st.find("Autoroute")) {
      std::string_view m = a->attr("mode");
      s.mode = is(m, "SingleLayerTop") ? AutorouteSettings::Mode::SingleLayerTop
             : is(m, "SingleLayerBottom") ? AutorouteSettings::Mode::SingleLayerBottom
                                          : AutorouteSettings::Mode::Multilayer;
      std::string_view w = a->attr("wireShape");
      s.wireShape = is(w, "Arcs") ? AutorouteSettings::WireShape::Arcs
                  : is(w, "Line45") || is(w, "45") ? AutorouteSettings::WireShape::Line45
                                                    : AutorouteSettings::WireShape::Polyline;
      s.equivalence = is(a->attr("autoEqu"), "Pins") ? AutorouteSettings::Equivalence::Pins : AutorouteSettings::Equivalence::None;
      s.teardrops = a->flag("teardrops", false);
      s.weakCheck = a->flag("weakCheck", false);
      s.takeCurrentLayout = a->flag("takeCurLayout", false);
      s.directConnectSmd = a->flag("directConnectSMD", false);
      s.dontStretchToPolypin = a->flag("dontStretchWireToPolypin", false);
    }
    if (auto* p = st.find("Autoproc")) {
      s.refine = is(p->attr("refine"), "NoChangeLayer") ? AutorouteSettings::Refine::NoChangeLayer : AutorouteSettings::Refine::ChangeLayer;
      s.automove = is(p->attr("automove"), "MoveViasWithRefine") ? AutorouteSettings::Automove::MoveViasWithRefine
                                                                 : AutorouteSettings::Automove::MoveVias;
    }
  }

  void applyVia(NetClass& nc, const std::string& name) {
    auto it = viastacks.find(name);
    if (it == viastacks.end()) return;
    if (it->second.diameter > 0) nc.viaDiameter = it->second.diameter;
    if (it->second.drill > 0) nc.viaDrill = it->second.drill;
  }

  // --- display settings ---
  static uint32_t color(std::string_view c) {
    if (!c.empty() && c[0] == '#') c.remove_prefix(1);
    std::string hex(c);
    if (hex.size() == 3) hex = {hex[0], hex[0], hex[1], hex[1], hex[2], hex[2]};
    return uint32_t(std::strtoul(hex.c_str(), nullptr, 16));
  }

  // Objects of a FilterNetlines / SetColor: net names (net groups expanded).
  std::vector<std::string> netNames(const Element& e) {
    std::vector<std::string> out;
    for (auto& k : e.kids) {
      if (k.is("NetRef")) out.emplace_back(k.attr("name"));
      else if (k.is("NetGroupRef")) {
        if (auto it = netGroups.find(k.attr("name")); it != netGroups.end())
          for (int n : it->second) out.push_back(b.nets[n].name);
      } else if (auto o = objectSignal(k)) {
        for (auto& n : b.hispeed.netsOf(*o)) out.push_back(n);
      }
    }
    return out;
  }

  void readDisplay(const Element& dc) {
    DisplayControl d;
    if (auto* v = dc.find("View")) {
      d.viewScale = v->num("scale");
      d.scrollX = v->num("scrollHorz");
      d.scrollY = v->num("scrollVert");
    }
    if (auto* a = dc.find("ActiveLayer")) d.activeLayer = std::string(a->attr("name"));
    if (auto* u = dc.find("Units")) d.units = std::string(u->attr("preference", "Metric"));
    if (auto* c = dc.find("Colors")) {
      for (auto& [k, v] : c->attrs) {
        if (k == "colorScheme") d.colorScheme = v;
        else if (k == "hilightRate") d.hilightRate = std::atoi(v.c_str());
        else if (k == "darkRate") d.darkRate = std::atoi(v.c_str());
        else d.colors[k] = color(v);
      }
    }
    if (auto* s = dc.find("Show"))
      for (auto& [k, v] : s->attrs) {
        if (k == "displayScheme") d.displayScheme = v;
        else d.show[k] = v == "on" || v == "true" || v == "1";
      }
    if (auto* g = dc.find("Grid")) {
      d.gridColor = color(g->attr("gridColor", "#f2f2f2"));
      d.gridDots = g->attr("gridKind", "Dots") != "Lines";
      d.gridShow = g->flag("gridShow");
      d.alignToGrid = g->flag("alignToGrid");
      d.snapToAngle = g->flag("snapToAngle");
      d.saveProportion = g->flag("saveProportion", true);
      if (auto* sp = g->find("GridSpace")) {
        // Grid steps are in database units of 0.0001 mil.
        d.gridX = sp->num("x", 5000) * kNmPerMil / 10000.0;
        d.gridY = sp->num("y", 5000) * kNmPerMil / 10000.0;
      }
    }
    if (auto* lv = dc.find("LayersVisualOptions"))
      for (auto* lo : lv->findAll("LayerOptions")) {
        LayerDisplay l;
        if (auto* r = lo->find("LayerRef")) l.layer = std::string(r->attr("name"));
        if (auto* c = lo->find("Colors")) {
          l.details = color(c->attr("details", "#c0c0c0"));
          l.pads = color(c->attr("pads", "#c0c0c0"));
          l.fix = color(c->attr("fix", "#808080"));
        }
        if (auto* s = lo->find("Show")) {
          l.visible = s->flag("visible");
          l.showDetails = s->flag("details", true);
          l.showPads = s->flag("pads", true);
        }
        d.layers.push_back(std::move(l));
      }
    if (auto* cn = dc.find("ColorNets")) {
      d.colorNets = cn->flag("enabled", true);
      d.colorizeWire = cn->flag("colorizeWire", true);
      d.colorizePad = cn->flag("colorizePad", true);
      d.colorizeCopper = cn->flag("colorizeCopper", true);
      d.colorizeVia = cn->flag("colorizeVia", true);
      d.colorizeNetline = cn->flag("colorizeNetline", true);
      for (auto* sc : cn->findAll("SetColor"))
        for (auto& n : netNames(*sc)) d.netColors.push_back({n, color(sc->attr("color", "#ff0000"))});
    }
    if (auto* fn = dc.find("FilterNetlines")) {
      d.filterNetlines = fn->flag("enabled");
      d.netlineNets = netNames(*fn);
    }
    b.display = std::move(d);
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
    if (auto* ss = cn.find("Serpents"))
      for (auto* sp : ss->findAll("Serpent")) {
        Serpent x;
        x.id = sp->attr("id");
        x.length = sp->num("length");
        x.gap = sp->num("gap");
        x.h1 = sp->num("h1");
        x.h2 = sp->num("h2");
        x.h3 = sp->num("h3");
        x.h4 = sp->num("h4");
        serpentIndex[x.id] = int(b.serpents.size());
        b.serpents.push_back(std::move(x));
      }
    if (auto* zs = cn.find("ZippedWires"))
      for (auto* zw : zs->findAll("ZippedWire")) readZippedWire(*zw);
    if (auto* wires = cn.find("Wires"))
      for (auto* w : wires->findAll("Wire")) readWire(*w);
    // Each zipped section's nets from its conductors (the positive one is the first signal's), and the side
    // the positive conductor runs on.
    for (int z = 0; z < int(b.zips.size()); ++z) {
      ZippedWire& zip = b.zips[size_t(z)];
      std::vector<int> nets;
      std::map<int, Vec2> firstPoint;
      for (const Track& t : b.tracks)
        if (t.zip == z) {
          if (!r::contains(nets, t.net)) nets.push_back(t.net);
          if (!firstPoint.contains(t.net)) firstPoint[t.net] = t.a.v();
        }
      if (nets.empty()) continue;
      int p = -1;
      if (zip.pair >= 0)
        if (const SignalCluster* c = b.hispeed.clusterOf(b.hispeed.diffSignals[size_t(zip.pair)].signalA))
          for (const std::string& n : c->nets)
            if (int ni = b.findNet(n); r::contains(nets, ni)) p = ni;
      if (p < 0) p = nets.front();
      zip.netP = p;
      for (int n : nets)
        if (n != p) zip.netN = n;
      if (!zip.axis.empty()) {
        const Track& a0 = zip.axis.front();
        Vec2 dir = (a0.mid ? a0.mid->v() : a0.b.v()) - a0.a.v();
        if (dir.len2() > 0) {
          // The conductor's point nearest the axis start, either end of it.
          Vec2 best = firstPoint[p];
          double bd = 1e300;
          for (const Track& t : b.tracks)
            if (t.zip == z && t.net == p)
              for (Vec2 q : {t.a.v(), t.b.v()})
                if (double d = (q - a0.a.v()).len(); d < bd) bd = d, best = q;
          const double cr = dir.cross(best - a0.a.v());
          zip.pSide = cr > 0 ? 1 : cr < 0 ? -1 : 0;
        }
      }
      Coord w = 0, g = 0;
      if (b.pairRule(zip.pair, zip.layer, w, g)) {
        zip.condWidth = w;
        zip.gap = g;
      } else {
        for (const Track& t : b.tracks)
          if (t.zip == z) { zip.condWidth = t.width; break; }
        if (zip.axis.size() > 0 && zip.axis.front().width > 2 * zip.condWidth) zip.gap = zip.axis.front().width - 2 * zip.condWidth;
      }
      for (Track& t : zip.axis) t.width = zip.width();
    }
    if (auto* coppers = cn.find("Coppers"))
      for (auto* c : coppers->findAll("Copper")) readCopper(*c);
  }

  std::map<std::string, int, std::less<>> serpentIndex, zipIndex;

  // The pieces of a Subwire or a ZippedWire's axis from `cur`: tracks of the layer, net and width.
  void readTracks(const Element& sw, Vec2 cur, LayerId layer, int net, Coord width, bool fixed, std::vector<Track>& out) {
    for (auto& seg : sw.kids) {
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
      if (seg.has("serpRef"))
        if (auto it = serpentIndex.find(seg.attr("serpRef")); it != serpentIndex.end()) {
          t.serp = it->second;
          t.locked = true;  // a serpent is kept as drawn
        }
      cur = end;
      if (t.a != t.b || t.mid.has_value()) out.push_back(t);
    }
  }

  void readZippedWire(const Element& zw) {
    const Element* lr = zw.find("LayerRef");
    const Element* st = zw.find("Start");
    if (!lr || !st) return;
    LayerId layer = copperByName(lr->attr("name"));
    if (layer < 0) return;
    ZippedWire z;
    z.layer = layer;
    z.fixed = zw.flag("fixed");
    if (auto* ds = zw.find("DiffSignalRef")) z.pair = b.hispeed.diffSignal(ds->attr("name"));
    else if (auto* dp = zw.find("DiffPairRef")) z.pair = b.hispeed.diffSignal(dp->attr("name"));
    readTracks(zw, pt(st), layer, kNoNet, 0, z.fixed, z.axis);
    zipIndex[std::string(zw.attr("id"))] = int(b.zips.size());
    b.zips.push_back(std::move(z));
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
      int zip = -1;
      if (sw->has("zipwireRef"))
        if (auto it = zipIndex.find(sw->attr("zipwireRef")); it != zipIndex.end()) zip = it->second;
      const size_t first = b.tracks.size();
      readTracks(*sw, pt(st), layer, net, width, fixed || (zip >= 0 && b.zips[size_t(zip)].fixed), b.tracks);
      for (size_t i = first; i < b.tracks.size(); ++i) b.tracks[i].zip = zip;
    }
  }

  // Polygon (board frame) of a filled figure element, or empty.
  std::vector<Vec2> filledPolygon(const Element& f) const {
    std::vector<FpGraphic> figs;
    figure(f, figs, "", 0);
    std::vector<Vec2> out;
    if (figs.empty()) return out;
    if (figs.front().kind == GraphicKind::Line || figs.front().kind == GraphicKind::Arc) return out;
    return toGraphic(figs.front(), -1).path();
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
    // The area's figure as TopoR drew it: a circle, a rectangle, a contour with arcs.
    if (auto* sh = c.find("Shape"))
      for (auto& f : sh->kids) {
        std::vector<FpGraphic> figs;
        figure(f, figs, "", 0);
        if (figs.empty() || !toGraphic(figs.front(), z.layer).closed()) continue;
        z.setShape(toGraphic(figs.front(), z.layer));
        if (z.outline.size() >= 3) break;
        z.shape.reset();
      }
    if (z.outline.empty()) return;
    if (auto* vs = c.find("Voids"))
      for (auto& f : vs->kids)
        if (auto h = filledPolygon(f); h.size() >= 3) z.cutouts.push_back(std::move(h));
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
  b->designUnitNm = r.s;
  if (auto* layers = root.find("Layers")) r.readLayers(*layers);
  if (b->copperCount() == 0) {
    b->addLayer("Top", LayerKind::Copper, Side::Top);
    b->addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  if (auto* ts = root.find("TextStyles")) r.readTextStyles(*ts);
  if (auto* lib = root.find("LocalLibrary")) r.readLibrary(*lib);
  if (auto* cs = root.find("Constructive")) r.readConstructive(*cs);
  if (auto* cob = root.find("ComponentsOnBoard")) r.readComponents(*cob);
  syncPadsFromStacks(*b);  // shape, hole and layers as the stacks say
  if (auto* nl = root.find("NetList")) r.readNetList(*nl);
  if (auto* groups = root.find("Groups")) r.readGroups(*groups);
  if (auto* hs = root.find("HiSpeedRules")) r.readHiSpeed(*hs);
  if (auto* cn = root.find("Connectivity"))
    if (auto* vias = cn->find("Vias")) {
      std::map<std::string, int> use;
      for (auto* v : vias->findAll("Via"))
        if (auto* ref = v->find("ViastackRef")) ++use[std::string(ref->attr("name"))];
      for (auto& [name, n] : use)
        if (r.preferredViastack.empty() || n > use[r.preferredViastack]) r.preferredViastack = name;
    }
  if (auto* rules = root.find("Rules")) r.readRules(*rules);
  else r.applyVia(b->netClasses[0], r.firstViastack);
  if (auto* cn = root.find("Connectivity")) r.readConnectivity(*cn);
  if (auto* st = root.find("Settings")) r.readSettings(*st);
  if (auto* dc = root.find("DisplayControl")) r.readDisplay(*dc);
  // The inner loops of the Contour: cutouts where no pad and no track lies in them.
  for (auto& loop : r.contourHoles) {
    bool empty = true;
    for (const Pad& p : b->pads) empty &= !pointInPolygon(p.pos.v(), loop);
    for (const Track& t : b->tracks) empty &= !pointInPolygon(t.a.v(), loop) && !pointInPolygon(t.b.v(), loop);
    if (empty) b->outline.push_back(loop);
  }
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
