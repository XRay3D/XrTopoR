// P-CAD 2002 ASCII (ACCEL_ASCII) board reader.
#include <algorithm>
#include <map>
#include <tuple>

#include "core/Padstack.h"
#include "io/BoardIO.h"
#include "io/Encoding.h"
#include "io/sexpr/SExpr.h"

namespace xr::io {

using sexpr::Node;

namespace {

struct PadStyle {
  PadShape top, bottom, inner;
  bool hasTop = false, hasBottom = false, hasInner = false;
  Coord hole = 0;
  bool plated = true;
};

struct PatPad {
  std::string num;
  std::string style;
  Vec2 pos;  // P-CAD frame (Y up), nm
  double rot = 0;
};

struct Pattern {
  std::vector<PatPad> pads;
  std::vector<std::pair<int, Graphic>> graphics;  // (P-CAD layer number, graphic in P-CAD frame)
};

struct Reader {
  Board& b;
  std::vector<std::string> padStackNames;  // the source's pad stack / style of each pad
  double unit = kNmPerMil;  // default file unit
  std::map<std::string, PadStyle> padStyles;
  std::map<std::string, PadStyle> viaStyles;
  // A pattern has one or more graphics («Primary», «Second»: other pads and drawings), an instance names its own.
  struct PatternDef {
    std::map<std::string, Pattern> graphics;
    std::string preferred;  // the one the definition names, else the first
  };
  std::map<std::string, PatternDef> patterns;
  std::map<std::string, int> textStyleIndex;
  std::map<std::string, std::map<std::string, std::string>> compPinToPad;  // compDef -> pin -> padNum
  std::map<std::string, std::string> instToCompDef;                          // refdes -> compDef
  std::map<int, LayerId> layerMap;                                           // P-CAD layer number -> board layer
  int topNum = 1, bottomNum = 2, boardNum = 3;

  explicit Reader(Board& board) : b(board) {}

  // Value at kid index i (atom), optionally followed by a unit atom. Advances i.
  double val(const Node& n, size_t& i) {
    double v = 0;
    if (i < n.kids.size() && !n.kids[i].isList) v = std::atof(n.kids[i].text.c_str());
    ++i;
    double scale = unit;
    if (i < n.kids.size() && !n.kids[i].isList) {
      const std::string& u = n.kids[i].text;
      if (u == "mm") { scale = kNmPerMm; ++i; }
      else if (u == "mil") { scale = kNmPerMil; ++i; }
      else if (u == "in") { scale = 1000.0 * kNmPerMil; ++i; }
    }
    return v * scale;
  }
  double val1(const Node* n) {
    if (!n) return 0;
    size_t i = 1;
    return val(*n, i);
  }
  Vec2 ptOf(const Node* n) {  // (pt x y) in P-CAD frame
    if (!n) return {};
    size_t i = 1;
    double x = val(*n, i);
    double y = val(*n, i);
    return {x, y};
  }
  static Vec2 toBoard(Vec2 p) { return {p.x, -p.y}; }
  static std::string str(const Node* n, size_t i = 0) { return n ? toUtf8(n->arg(i)) : std::string(); }

  bool readShape(const Node& ps, PadShape& out) {
    const Node* type = ps.find("padShapeType");
    if (!type) type = ps.find("viaShapeType");
    std::string t = type ? type->arg(0) : "";
    if (t == "Polygon") {
      out.kind = PadShapeKind::Polygon;
      if (const Node* so = ps.find("shapeOutline")) {
        BBox bb;
        for (auto* p : so->findAll("pt")) {
          Vec2 v = ptOf(p);
          out.poly.push_back({v.x, -v.y});
          bb.add(v);
        }
        out.w = Coord(bb.width());
        out.h = Coord(bb.height());
      }
      return out.poly.size() >= 3;
    }
    double w = val1(ps.find("shapeWidth")), h = val1(ps.find("shapeHeight"));
    if (t == "Thrm4_45" || t == "Thrm4" || t == "Thrm2" || t == "Direct" || t == "NoConnect" || t == "MtHole")
      return false;
    if (w <= 0 || h <= 0) return false;
    out.w = Coord(w);
    out.h = Coord(h);
    if (t == "Ellipse") out.kind = std::abs(w - h) < 1 ? PadShapeKind::Circle : PadShapeKind::Oval;
    else if (t == "Oval") out.kind = PadShapeKind::Oval;
    else if (t == "Rect") out.kind = PadShapeKind::Rect;
    else if (t == "RndRect") { out.kind = PadShapeKind::RoundRect; out.rratio = 0.25; }
    else out.kind = PadShapeKind::Rect;
    return true;
  }

  PadStyle readStyle(const Node& n, const char* shapeHead) {
    PadStyle s;
    s.hole = Coord(val1(n.find("holeDiam")));
    if (const Node* pl = n.find("isHolePlated")) s.plated = pl->arg(0) != "False";
    for (auto* ps : n.findAll(shapeHead)) {
      PadShape sh;
      bool ok = readShape(*ps, sh);
      if (const Node* ln = ps->find("layerNumRef")) {
        int l = int(ln->num(0));
        if (l == topNum) { s.top = sh; s.hasTop = ok; }
        else if (l == bottomNum) { s.bottom = sh; s.hasBottom = ok; }
      } else if (const Node* lt = ps->find("layerType")) {
        if (lt->arg(0) == "Signal") { s.inner = sh; s.hasInner = ok; }
      }
    }
    return s;
  }

  void readLibrary(const Node& lib) {
    for (auto* n : lib.findAll("padStyleDef")) padStyles[n->arg(0)] = readStyle(*n, "padShape");
    for (auto* n : lib.findAll("viaStyleDef")) viaStyles[n->arg(0)] = readStyle(*n, "viaShape");
    for (auto* n : lib.findAll("textStyleDef")) readTextStyle(*n);
    for (auto* n : lib.findAll("patternDefExtended")) {
      PatternDef def;
      def.preferred = str(n->find("patternGraphicsNameRef"));
      auto defs = n->findAll("patternGraphicsDef");
      if (defs.empty()) defs.push_back(n);
      for (auto* gd : defs) {
        Pattern pat;
        if (const Node* ml = gd->find("multiLayer"))
          for (auto* pad : ml->findAll("pad")) {
            PatPad pp;
            if (const Node* pn = pad->find("padNum")) pp.num = pn->arg(0);
            pp.style = str(pad->find("padStyleRef"));
            pp.pos = ptOf(pad->find("pt"));
            if (const Node* r = pad->find("rotation")) pp.rot = r->num(0);
            pat.pads.push_back(pp);
          }
        for (auto* lc : gd->findAll("layerContents")) {
          int ln = lc->find("layerNumRef") ? int(lc->find("layerNumRef")->num(0)) : 0;
          for (auto& k : lc->kids) readGraphic(k, ln, pat.graphics);
        }
        const std::string name = str(gd->find("patternGraphicsNameDef"));
        if (def.preferred.empty()) def.preferred = name;
        def.graphics[name] = std::move(pat);
      }
      patterns[toUtf8(n->arg(0))] = std::move(def);
    }
    for (auto* cd : lib.findAll("compDef")) {
      auto& m = compPinToPad[toUtf8(cd->arg(0))];
      if (const Node* ap = cd->find("attachedPattern"))
        if (const Node* ppm = ap->find("padPinMap")) {
          const Node* lastPad = nullptr;
          for (auto& k : ppm->kids) {
            if (k.is("padNum")) lastPad = &k;
            else if (k.is("compPinRef") && lastPad) m[toUtf8(k.arg(0))] = lastPad->arg(0);
          }
        }
    }
  }

  void readGraphic(const Node& k, int layerNum, std::vector<std::pair<int, Graphic>>& out) {
    if (k.is("line")) {
      auto pts = k.findAll("pt");
      if (pts.size() < 2) return;
      Graphic g;
      g.kind = GraphicKind::Line;
      g.a = ptOf(pts[0]);
      g.b = ptOf(pts[1]);
      g.width = Coord(val1(k.find("width")));
      out.push_back({layerNum, g});
    } else if (k.is("arc")) {
      Vec2 c = ptOf(k.find("pt"));
      double r = val1(k.find("radius"));
      double a0 = k.find("startAngle") ? k.find("startAngle")->num(0) : 0;
      double sw = k.find("sweepAngle") ? k.find("sweepAngle")->num(0) : 360;
      Graphic g;
      g.width = Coord(val1(k.find("width")));
      if (std::abs(sw) >= 359.999) {
        g.kind = GraphicKind::Circle;
        g.a = c;
        g.b = c + Vec2(r, 0);
      } else {
        g.kind = GraphicKind::Arc;
        auto at = [&](double deg) { return c + Vec2(std::cos(degToRad(deg)), std::sin(degToRad(deg))) * r; };
        g.a = at(a0);
        g.m = at(a0 + sw / 2);
        g.b = at(a0 + sw);
      }
      out.push_back({layerNum, g});
    } else if (k.is("pcbPoly")) {
      Graphic g;
      g.kind = GraphicKind::Poly;
      g.filled = true;
      for (auto* p : k.findAll("pt")) g.pts.push_back(ptOf(p));
      if (g.pts.size() >= 3) out.push_back({layerNum, g});
    }
  }

  void readLayers(const Node& design) {
    struct Def { std::string name; int num; std::string type; };
    std::vector<Def> defs;
    for (auto* ld : design.findAll("layerDef")) {
      Def d;
      d.name = toUtf8(ld->arg(0));
      d.num = ld->find("layerNum") ? int(ld->find("layerNum")->num(0)) : 0;
      d.type = ld->find("layerType") ? ld->find("layerType")->arg(0) : "";
      defs.push_back(d);
      // Clearance attributes on signal layers.
      for (auto* at : ld->findAll("attr")) {
        std::string key = at->arg(0), v = at->arg(1);
        if (key == "LineToLineClearance" || key == "PadToLineClearance") {
          double x = std::atof(v.c_str());
          double nm = v.find("mm") != std::string::npos ? x * kNmPerMm : x * kNmPerMil;
          if (nm > 0) b.netClasses[0].clearance = std::max<Coord>(Coord(nm), 0);
        }
      }
    }
    std::vector<Def> signal;
    for (auto& d : defs)
      if (d.type == "Signal" || d.type == "Plane") signal.push_back(d);
    r::sort(signal, {}, [&](const Def& d) { return d.num == topNum ? -1 : d.num == bottomNum ? 1 << 20 : d.num; });
    for (size_t i = 0; i < signal.size(); ++i) {
      if (signal[i].type == "Plane") continue;
      Side side = signal[i].num == topNum ? Side::Top : signal[i].num == bottomNum ? Side::Bottom : Side::None;
      layerMap[signal[i].num] = b.addLayer(signal[i].name, LayerKind::Copper, side);
    }
    if (b.copperCount() == 0) {
      layerMap[topNum] = b.addLayer("Top", LayerKind::Copper, Side::Top);
      layerMap[bottomNum] = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    }
    for (auto& d : defs) {
      if (layerMap.count(d.num) || d.type == "Plane") continue;
      std::string n = d.name;
      Side side = n.find("Top") != std::string::npos ? Side::Top : n.find("Bot") != std::string::npos ? Side::Bottom : Side::None;
      LayerKind kind = LayerKind::Other;
      if (n.find("Silk") != std::string::npos) kind = LayerKind::Silk;
      else if (n.find("Mask") != std::string::npos) kind = LayerKind::Mask;
      else if (n.find("Paste") != std::string::npos) kind = LayerKind::Paste;
      else if (n.find("Assy") != std::string::npos) kind = LayerKind::Fab;
      else if (d.num == boardNum || n == "Board") kind = LayerKind::Edge;
      layerMap[d.num] = b.addLayer(n, kind, side);
    }
  }

  LayerId mapLayer(int num, bool flipped) {
    if (flipped) {
      if (num == topNum) num = bottomNum;
      else if (num == bottomNum) num = topNum;
      else if (num == 6) num = 7;  // Top Silk <-> Bot Silk
      else if (num == 7) num = 6;
      else if (num == 10) num = 11;  // Top Assy <-> Bot Assy
      else if (num == 11) num = 10;
    }
    auto it = layerMap.find(num);
    return it == layerMap.end() ? -1 : it->second;
  }

  std::vector<int> compNode;  // multiLayer child index of each component's pattern instance
  int currentNode = -1;

  void placePattern(const Node& inst) {
    std::string patName = str(inst.find("patternRef"));
    auto it = patterns.find(patName);
    if (it == patterns.end()) return;
    auto graphics = it->second.graphics.find(str(inst.find("patternGraphicsNameRef")));
    if (graphics == it->second.graphics.end()) graphics = it->second.graphics.find(it->second.preferred);
    if (graphics == it->second.graphics.end()) return;
    const Pattern& pat = graphics->second;
    Component c;
    c.ref = str(inst.find("refDesRef"));
    c.footprint = patName;
    Vec2 o = ptOf(inst.find("pt"));
    double rot = inst.find("rotation") ? inst.find("rotation")->num(0) : 0;
    bool flipped = inst.find("isFlipped") && inst.find("isFlipped")->arg(0) == "True";
    c.side = flipped ? Side::Bottom : Side::Top;
    c.pos = Point(toBoard(o));
    // P-CAD rotates the pattern first and then mirrors it about the vertical axis when flipped; the
    // model mirrors first, as TopoR, KiCad and Specctra do: a flipped part is turned the other way.
    c.angle = std::fmod((flipped ? 720.0 - rot : rot + 360.0), 360.0);
    auto tr = [&](Vec2 p) {
      Vec2 r = p.rotated(degToRad(rot));
      if (flipped) r.x = -r.x;
      return toBoard(o + r);
    };
    for (auto& [ln, g0] : pat.graphics) {
      LayerId l = mapLayer(ln, flipped);
      if (l < 0) continue;
      Graphic g = g0;
      g.layer = l;
      g.a = tr(g.a); g.b = tr(g.b); g.m = tr(g.m);
      for (auto& p : g.pts) p = tr(p);
      c.graphics.push_back(g);
    }
    int ci = int(b.components.size());
    b.components.push_back(c);
    compNode.push_back(currentNode);
    auto cu = b.copperLayers();
    for (auto& pp : pat.pads) {
      auto st = padStyles.find(pp.style);
      if (st == padStyles.end()) continue;
      const PadStyle& s = st->second;
      Pad p;
      p.component = ci;
      p.number = pp.num;
      Vec2 abs = tr(pp.pos);
      p.pos = Point(abs);
      p.angle = std::fmod((flipped ? -(rot + pp.rot) : rot + pp.rot) + 720.0, 360.0);
      bool onTop = flipped ? s.hasBottom : s.hasTop;
      bool onBot = flipped ? s.hasTop : s.hasBottom;
      const PadShape& base = s.hasTop ? s.top : s.hasBottom ? s.bottom : s.inner;
      p.shape = base;
      if (p.shape.kind == PadShapeKind::Polygon && flipped)
        for (auto& v : p.shape.poly) v.x = -v.x;
      p.drill = s.hole;
      p.plated = s.plated;
      LayerMask m = 0;
      for (LayerId l : cu) {
        int idx = b.layers[l].copperIndex;
        bool isTop = idx == 0, isBot = idx == int(cu.size()) - 1;
        if ((isTop && onTop) || (isBot && onBot) || (!isTop && !isBot && s.hasInner && s.hole > 0)) m |= LayerMask(1) << l;
      }
      p.copper = m;
      if (!m && s.hole == 0) continue;
      p.localPos = Point(rotateBoard(abs - c.pos.v(), -c.angle));
      p.localAngle = p.angle - c.angle;
      b.pads.push_back(p);
      padStackNames.resize(b.pads.size());
      padStackNames.back() = pp.style;
      b.components[ci].pads.push_back(int(b.pads.size() - 1));
    }
  }

  void readNetlist(const Node& nl) {
    for (auto* ci : nl.findAll("compInst")) instToCompDef[toUtf8(ci->arg(0))] = str(ci->find("compRef"));
    for (auto* n : nl.findAll("net")) {
      int net = b.addNet(toUtf8(n->arg(0)));
      for (auto* node : n->findAll("node")) {
        std::string ref = toUtf8(node->arg(0)), pin = toUtf8(node->arg(1));
        int ci = b.findComponent(ref);
        if (ci < 0) continue;
        std::string padNum = pin;
        auto cd = instToCompDef.find(ref);
        if (cd != instToCompDef.end()) {
          auto& m = compPinToPad[cd->second];
          auto pm = m.find(pin);
          if (pm != m.end()) padNum = pm->second;
        }
        for (int pi : b.components[ci].pads)
          if (b.pads[pi].number == padNum) b.pads[pi].net = net;
      }
    }
  }

  Polyline polyOf(const Node* n) {
    Polyline out;
    if (n)
      for (auto* p : n->findAll("pt")) out.push_back(toBoard(ptOf(p)));
    return out;
  }

  // A text style has a stroke font and a TrueType one; the style says which is shown. P-CAD's height of a TrueType
  // font is 1/1.1875 of the height of its text («extent» in the file), which is what a style's height is here.
  void readTextStyle(const Node& n) {
    TextStyle st;
    st.name = toUtf8(n.arg(0));
    const Node* stroke = nullptr;
    const Node* trueType = nullptr;
    for (auto* f : n.findAll("font")) (str(f->find("fontType")) == "TrueType" ? trueType : stroke) = f;
    const Node* shown = n.find("textStyleDisplayTType");
    if (trueType && (!stroke || (shown && shown->arg(0) == "True"))) {
      st.font = str(trueType->find("fontFace"));
      st.height = Coord(val1(trueType->find("fontHeight")) * 1.1875);
    } else if (stroke) {
      st.font = "QUALITY";
      st.height = Coord(val1(stroke->find("fontHeight")));
      st.lineWidth = Coord(val1(stroke->find("strokeWidth")));
    }
    if (textStyleIndex.empty()) b.textStyles.clear();
    textStyleIndex[st.name] = int(b.textStyles.size());
    b.textStyles.push_back(std::move(st));
  }

  void readText(const Node& k, LayerId l) {
    Text t;
    t.text = toUtf8(k.arg(1));
    t.pos = toBoard(ptOf(k.find("pt")));
    t.layer = l;
    t.mirror = k.find("isFlipped") && k.find("isFlipped")->arg(0) == "True";
    const double rot = k.find("rotation") ? k.find("rotation")->num(0) : 0;
    // P-CAD turns a text and then mirrors it, the model mirrors first: a flipped text is turned the other way.
    t.angle = std::fmod((t.mirror ? 720.0 - rot : rot + 360.0), 360.0);
    if (auto st = textStyleIndex.find(str(k.find("textStyleRef"))); st != textStyleIndex.end()) t.style = st->second;
    static const std::map<std::string, TextAlign> aligns{{"UpperLeft", TextAlign::LT}, {"UpperCenter", TextAlign::CT}, {"UpperRight", TextAlign::RT},
                                                         {"Left", TextAlign::LM},      {"Center", TextAlign::CM},      {"Right", TextAlign::RM},
                                                         {"LowerLeft", TextAlign::LB}, {"LowerCenter", TextAlign::CB}, {"LowerRight", TextAlign::RB}};
    if (const Node* j = k.find("justify"))
      if (auto a = aligns.find(j->arg(0)); a != aligns.end()) t.align = a->second;
    b.texts.push_back(std::move(t));
  }

  void readPour(const Node& k, LayerId l) {
    Zone z;
    z.layer = l;
    z.net = b.findNet(str(k.find("netNameRef")));
    z.clearance = Coord(val1(k.find("pourBackoff")));
    const Node* rules = k.find("useDesignRules");
    z.useClearance = !rules || rules->arg(0) != "True";
    z.outline = polyOf(k.find("pcbPoly"));
    auto thermal = [&](ZoneThermal& t, const char* type, const char* width) {
      if (const Node* tw = k.find(width)) t.spoke = Coord(val1(tw));
      t.gap = z.clearance;
      t.connection = PadConnection::Thermal;
      if (const Node* tt = k.find(type)) {
        const std::string& how = tt->arg(0);
        if (how == "NoTherm" || how == "Direct") t.connection = PadConnection::Solid;
        else if (how.find("45") != std::string::npos) t.angle = 45;
      }
    };
    thermal(z.pads, "thermalType", "thermalWidth");
    thermal(z.vias, "viaThermalType", "viaThermalWidth");
    if (const Node* pp = k.find("pourPriority")) z.priority = int(pp->num(0));
    for (auto* isl : k.findAll("island")) {
      Polyline outer = polyOf(isl->find("islandOutline"));
      std::vector<Polyline> holes;
      for (auto* c : isl->findAll("cutout")) holes.push_back(polyOf(c->find("cutoutOutline")));
      if (outer.size() >= 3) z.filled.push_back(fracture(outer, std::move(holes)));
      // The bridges from the island to the pads of its net (the island's outline goes round the pad's gap).
      for (auto* th : isl->findAll("thermal")) {
        auto pts = th->findAll("pt");
        if (pts.size() < 2) continue;
        const Vec2 a = toBoard(ptOf(pts[0])), c = toBoard(ptOf(pts[1]));
        const Vec2 side = (c - a).normalized().perp() * (val1(th->find("thermalWidth")) / 2);
        if (side.len2() > 0) z.filled.push_back({a + side, c + side, c - side, a - side});
      }
    }
    b.zones.push_back(std::move(z));
  }

  void readDesign(const Node& d) {
    // Vias and pattern instances live in (multiLayer ...).
    if (const Node* ml = d.find("multiLayer")) {
      for (auto* via : ml->findAll("via")) {
        auto st = viaStyles.find(str(via->find("viaStyleRef")));
        Via v;
        v.pos = Point(toBoard(ptOf(via->find("pt"))));
        if (st != viaStyles.end()) {
          const PadShape& sh = st->second.hasTop ? st->second.top : st->second.bottom;
          v.diameter = std::max(sh.w, sh.h);
          v.drill = st->second.hole;
        }
        if (v.diameter <= 0) v.diameter = mmToNm(0.6);
        if (v.drill <= 0) v.drill = v.diameter / 2;
        v.layers = b.allCopperMask();
        v.net = b.findNet(str(via->find("netNameRef")));
        b.vias.push_back(v);
      }
    }
    for (auto* lc : d.findAll("layerContents")) {
      int ln = lc->find("layerNumRef") ? int(lc->find("layerNumRef")->num(0)) : 0;
      LayerId l = mapLayer(ln, false);
      if (l < 0) continue;
      bool copper = b.layers[l].kind == LayerKind::Copper;
      for (auto& k : lc->kids) {
        if (!k.isList) continue;
        if (copper && (k.is("copperPour95") || k.is("copperPour"))) {
          readPour(k, l);
          continue;
        }
        if (k.is("text")) {
          readText(k, l);
          continue;
        }
        std::vector<std::pair<int, Graphic>> gs;
        readGraphic(k, ln, gs);
        for (auto& [n, g] : gs) {
          g.a = toBoard(g.a); g.b = toBoard(g.b); g.m = toBoard(g.m);
          for (auto& p : g.pts) p = toBoard(p);
          g.layer = l;
          int net = b.findNet(str(k.find("netNameRef")));
          if (copper && (g.kind == GraphicKind::Line || g.kind == GraphicKind::Arc) && k.find("netNameRef")) {
            Track t;
            t.a = Point(g.a);
            t.b = Point(g.b);
            if (g.kind == GraphicKind::Arc) t.mid = Point(g.m);
            t.width = g.width;
            t.layer = l;
            t.net = net;
            b.tracks.push_back(t);
          } else {
            b.graphics.push_back(g);
          }
        }
      }
    }
  }
};

}  // namespace

Result<BoardPtr> readPcad(const std::string& text, const std::string& path) {
  if (text.rfind("ACCEL_ASCII", 0) != 0) {
    return std::unexpected(std::string("not a P-CAD ASCII file"));
  }
  sexpr::ParseOptions opt;
  opt.dsnQuoting = true;  // P-CAD strings contain raw backslashes (paths); no escapes
  auto tree = std::make_shared<Node>(sexpr::parse(text, opt));
  auto b = std::make_unique<Board>();
  Reader r(*b);
  const Node* header = tree->find("asciiHeader");
  if (header)
    if (const Node* fu = header->find("fileUnits")) {
      std::string u = fu->arg(0);
      r.unit = (u == "mm" || u == "MM") ? kNmPerMm : (u == "in" || u == "Inch") ? 1000.0 * kNmPerMil : kNmPerMil;
    }
  const Node* design = tree->find("pcbDesign");
  if (design) r.readLayers(*design);
  else {
    r.layerMap[1] = b->addLayer("Top", LayerKind::Copper, Side::Top);
    r.layerMap[2] = b->addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  if (const Node* lib = tree->find("library")) r.readLibrary(*lib);
  if (design)
    if (const Node* ml = design->find("multiLayer"))
      for (size_t k = 0; k < ml->kids.size(); ++k)
        if (ml->kids[k].is("pattern")) {
          r.currentNode = int(k);
          r.placePattern(ml->kids[k]);
        }
  if (const Node* nl = tree->find("netlist")) r.readNetlist(*nl);
  buildPadstacksFromPads(*b, r.padStackNames);
  if (design) r.readDesign(*design);
  LayerId edge = r.mapLayer(r.boardNum, false);
  if (edge >= 0) buildOutline(*b, edge);
  // P-CAD keeps no per-net defaults: take the most common track width and via of the design.
  {
    std::map<Coord, int> widths;
    std::map<std::pair<Coord, Coord>, int> viaKinds;
    for (auto& t : b->tracks) widths[t.width]++;
    for (auto& v : b->vias) viaKinds[{v.diameter, v.drill}]++;
    NetClass& d = b->netClasses[0];
    auto mode = [](const auto& m) { return r::max_element(m, {}, [](auto& kv) { return kv.second; })->first; };
    if (!widths.empty()) d.trackWidth = mode(widths);
    if (!viaKinds.empty()) std::tie(d.viaDiameter, d.viaDrill) = mode(viaKinds);
  }
  auto src = std::make_shared<SourceDoc>();
  src->format = SourceDoc::Format::Pcad;
  src->path = path;
  src->tree = tree;
  src->componentNodes = r.compNode;
  src->layerNums.assign(b->layers.size(), -1);
  for (auto [num, id] : r.layerMap)
    if (id >= 0 && id < LayerId(b->layers.size())) src->layerNums[id] = num;
  src->unitNm = r.unit;
  b->designUnitNm = r.unit;
  b->source = src;
  b->rebuildNetIndex();
  return b;
}

}  // namespace xr::io
