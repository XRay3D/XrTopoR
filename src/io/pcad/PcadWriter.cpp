// P-CAD 2002 ASCII writer: the source file is patched (placement, routing and vias replaced,
// pours written from the copper areas), so libraries, netlist, layers, text and everything else round-trip unchanged.
#include <cmath>
#include <cstdio>
#include <map>

#include "core/ZoneFill.h"
#include "io/BoardIO.h"
#include "io/Encoding.h"
#include "io/sexpr/SExpr.h"

namespace xr::io {

using sexpr::Node;

namespace {

// "12.3456 mm" with Y flipped to the P-CAD frame (Y up).
void addMm(Node& n, double nm) {
  char buf[32];
  std::snprintf(buf, sizeof buf, "%.4f", nm / kNmPerMm);
  n.addAtom(buf);
  n.addAtom("mm");
}

Node pt(Vec2 p) {
  Node n = Node::list("pt");
  addMm(n, p.x);
  addMm(n, -p.y);
  return n;
}

Node mmNode(const char* head, double nm) {
  Node n = Node::list(head);
  addMm(n, nm);
  return n;
}

Node strNode(const char* head, const std::string& utf8) {
  Node n = Node::list(head);
  n.addAtom(utf8ToCp1251(utf8), true);
  return n;
}

Node numNode(const char* head, double v) {
  Node n = Node::list(head);
  n.addAtom(sexpr::fmtNum(v, 3));
  return n;
}

// Value of a (head v [unit]) node in nm.
double valueNm(const Node* n, double unit) {
  if (!n || n->kids.size() < 2) return 0;
  double v = std::atof(n->kids[1].text.c_str());
  if (n->kids.size() > 2 && !n->kids[2].isList) {
    const std::string& u = n->kids[2].text;
    if (u == "mm") return v * kNmPerMm;
    if (u == "mil") return v * kNmPerMil;
    if (u == "in") return v * 1000.0 * kNmPerMil;
  }
  return v * unit;
}

Node* findChild(Node& n, std::string_view head) {
  for (auto& k : n.kids)
    if (k.is(head)) return &k;
  return nullptr;
}

Node atomNode(const char* head, const char* v) {
  Node n = Node::list(head);
  n.addAtom(v);
  return n;
}

// Puts `v` in place of n's child of the same head, or before `before` (at the end without it).
void setChild(Node& n, Node v, std::string_view before = "pcbPoly") {
  if (Node* old = findChild(n, v.head())) {
    *old = std::move(v);
    return;
  }
  auto at = r::find_if(n.kids, [&](const Node& k) { return k.is(before); });
  n.kids.insert(at, std::move(v));
}

// The points of a (pcbPoly ...) in the board frame (Y down), nm.
Polyline polyNm(const Node& n, double unit) {
  Polyline out;
  for (const Node& p : n.kids) {
    if (!p.is("pt")) continue;
    double xy[2]{};
    size_t i = 1;
    for (double& c : xy) {
      if (i >= p.kids.size()) break;
      c = std::atof(p.kids[i++].text.c_str());
      double scale = unit;
      if (i < p.kids.size() && !p.kids[i].isList) {
        const std::string& u = p.kids[i].text;
        if (u == "mm") scale = kNmPerMm, ++i;
        else if (u == "mil") scale = kNmPerMil, ++i;
        else if (u == "in") scale = 1000.0 * kNmPerMil, ++i;
      }
      c *= scale;
    }
    out.push_back({xy[0], -xy[1]});
  }
  return out;
}

Node outlineNode(const char* head, const Polyline& pts) {
  Node n = Node::list(head);
  for (Vec2 p : pts) n.add(pt(p));
  return n;
}

// P-CAD's chords of a rounded corner: off the arc by at most this (its chordHeight, 5 mil).
constexpr double kChord = 5 * kNmPerMil;

// A closed figure as a (pcbPoly ...): its points with the roundings in chords, and the corners with their radii
// (fillets) when it has rounded corners; a circle or another arc in chords.
Node polyNode(const char* head, const Graphic& g) {
  Graphic poly = g;
  if (g.kind != GraphicKind::Poly) {
    poly.kind = GraphicKind::Poly;
    poly.pts = g.path(kChord);
    poly.arcs.clear();
  }
  std::vector<Vec2> corners;
  std::vector<double> radii;
  polygonCorners(poly, corners, radii, kChord);
  const bool fillets = r::any_of(radii, [](double r) { return r > 0; });
  Node n = outlineNode(head, fillets ? poly.path(kChord) : corners);
  if (fillets) {
    Node f = Node::list("fillets");
    f.add(mmNode("chordHeight", kChord));
    for (size_t i = 0; i < corners.size(); ++i) {
      Node d = Node::list("filletDesc");
      d.add(pt(corners[i]));
      d.add(mmNode("radius", radii[i]));
      f.add(std::move(d));
    }
    n.add(std::move(f));
  }
  return n;
}

// A line or an arc (board frame) as P-CAD's (line ...) or (arc ...): an arc by its centre, radius and angles.
Node lineOrArc(Vec2 a, std::optional<Vec2> mid, Vec2 b) {
  Node n;
  auto g = mid ? ArcGeom::fromThreePoints(a, *mid, b) : ArcGeom{};
  if (!g.valid) {
    n = Node::list("line");
    n.add(pt(a));
    n.add(pt(b));
    return n;
  }
  // P-CAD frame is Y up: angles and sweep change sign; keep the sweep positive (CCW).
  double start = -radToDeg(g.startAngle), sweep = -radToDeg(g.sweep);
  if (sweep < 0) {
    start += sweep;
    sweep = -sweep;
  }
  start = std::fmod(start + 720.0, 360.0);
  if (start > 359.9995) start = 0;  // (written to a thousandth: not «360»)
  n = Node::list("arc");
  n.add(pt(g.center));
  n.add(mmNode("radius", g.radius));
  n.add(numNode("startAngle", start));
  n.add(numNode("sweepAngle", sweep));
  return n;
}

// A pour as the area is: its own node of the file (the settings the model has not got, the fillets of an outline
// left as it was) or a new one, the settings, the outline and the islands of the fill from the model.
Node pourNode(const Zone& z, const std::string& net, const Node* own, double unit) {
  Node n = own ? *own : Node::list("copperPour95");
  if (!own) {
    n.add(atomNode("pourType", "SolidPour"));
    n.add(strNode("netNameRef", net));
    n.add(mmNode("width", double(z.lineWidth > 0 ? z.lineWidth : mmToNm(0.254))));
    n.add(mmNode("pourSpacing", double(mmToNm(0.762))));
    n.add(mmNode("pourBackoff", double(z.clearance)));
    n.add(atomNode("useDesignRules", "True"));
    n.add(numNode("pourSmoothness", 3));
    n.add(Node::list("pcbPoly"));
  }
  // A pour of no net has no netNameRef (P-CAD's format).
  if (net.empty()) std::erase_if(n.kids, [](const Node& k) { return k.is("netNameRef"); });
  else setChild(n, strNode("netNameRef", net));
  if (z.lineWidth > 0) setChild(n, mmNode("width", double(z.lineWidth)));
  setChild(n, mmNode("pourBackoff", double(z.clearance)));
  setChild(n, atomNode("useDesignRules", z.useClearance ? "False" : "True"));
  auto thermal = [&](const ZoneThermal& t, const char* type, const char* width, const char* spokes) {
    const Node* was = findChild(n, type);
    const bool wasSolid = was && (was->arg(0) == "NoTherm" || was->arg(0) == "Direct");
    const char* how = t.connection == PadConnection::Solid ? (wasSolid ? nullptr : "NoTherm") : t.angle == 45 ? "Therm45" : "Therm90";
    if (how) setChild(n, atomNode(type, how));
    if (t.spoke > 0) setChild(n, mmNode(width, double(t.spoke)));
    if (!findChild(n, spokes)) setChild(n, numNode(spokes, 4));
  };
  thermal(z.pads, "thermalType", "thermalWidth", "thermalSpokes");
  thermal(z.vias, "viaThermalType", "viaThermalWidth", "viaThermalSpokes");
  if (z.priority != 0 || findChild(n, "pourPriority")) setChild(n, numNode("pourPriority", z.priority));

  Node* poly = findChild(n, "pcbPoly");
  const Polyline was = polyNm(*poly, unit);
  const bool same = was.size() == z.outline.size() &&
                    r::equal(was, z.outline, [](Vec2 a, Vec2 b) { return (a - b).len2() < 100.0 * 100.0; });
  if (!z.shape.empty() && z.shape.front().closed() && (z.shape.front().kind != GraphicKind::Poly || z.shape.front().hasArcs())) {
    Node p = polyNode("pcbPoly", z.shape.front());  // (the roundings as fillets)
    if (!net.empty()) p.add(strNode("netNameRef", net));
    *poly = std::move(p);
  } else if (!same) {
    Node p = outlineNode("pcbPoly", z.outline);  // the fillets were the old outline's
    if (!net.empty()) p.add(strNode("netNameRef", net));
    *poly = std::move(p);
  } else if (Node* pn = findChild(*poly, "netNameRef")) {
    if (net.empty()) std::erase_if(poly->kids, [](const Node& k) { return k.is("netNameRef"); });
    else *pn = strNode("netNameRef", net);
  }

  std::erase_if(n.kids, [](const Node& k) { return k.is("island"); });
  for (const Island& isl : zoneIslands(z)) {
    Node in = Node::list("island");
    in.add(outlineNode("islandOutline", isl.outer));
    for (const Polyline& h : isl.holes) {
      Node c = Node::list("cutout");
      c.add(outlineNode("cutoutOutline", h));
      in.add(std::move(c));
    }
    n.add(std::move(in));
  }
  return n;
}

// Via style with the given diameter/drill: an existing one or a new copy of the first style.
std::string viaStyle(Node& library, double unit, Coord dia, Coord drill, std::map<std::pair<Coord, Coord>, std::string>& cache) {
  auto key = std::pair{dia, drill};
  if (auto it = cache.find(key); it != cache.end()) return it->second;
  const Node* first = nullptr;
  for (auto& k : library.kids) {
    if (!k.is("viaStyleDef")) continue;
    if (!first) first = &k;
    double hole = valueNm(k.find("holeDiam"), unit);
    double width = 0;
    for (auto* vs : k.findAll("viaShape"))
      if (vs->find("layerNumRef")) width = std::max(width, valueNm(vs->find("shapeWidth"), unit));
    if (std::abs(hole - double(drill)) < 2000 && std::abs(width - double(dia)) < 2000) {
      std::string name = k.arg(0);
      cache[key] = name;
      return name;
    }
  }
  char nameBuf[64];
  std::snprintf(nameBuf, sizeof nameBuf, "XR%.2fx%.2f", dia / double(kNmPerMm), drill / double(kNmPerMm));
  std::string name = nameBuf;
  Node style = first ? *first : Node::list("viaStyleDef");
  if (style.kids.size() < 2) style.addAtom(name, true);
  style.kids[1] = Node::atom(name, true);
  if (Node* h = findChild(style, "holeDiam")) *h = mmNode("holeDiam", double(drill));
  else style.add(mmNode("holeDiam", double(drill)));
  bool any = false;
  for (auto& vs : style.kids) {
    if (!vs.is("viaShape")) continue;
    // Shapes on signal layers get the new size; plane/non-signal entries keep theirs.
    Node* lt = findChild(vs, "layerType");
    if (lt && lt->arg(0) != "Signal") continue;
    if (Node* w = findChild(vs, "shapeWidth")) *w = mmNode("shapeWidth", double(dia)), any = true;
    if (Node* h = findChild(vs, "shapeHeight")) *h = mmNode("shapeHeight", double(dia));
  }
  if (!any) {
    for (int layer : {1, 2}) {
      Node vs = Node::list("viaShape");
      vs.add(numNode("layerNumRef", layer));
      Node t = Node::list("viaShapeType");
      t.addAtom("Ellipse");
      vs.add(std::move(t));
      vs.add(mmNode("shapeWidth", double(dia)));
      vs.add(mmNode("shapeHeight", double(dia)));
      style.add(std::move(vs));
    }
  }
  library.add(std::move(style));
  cache[key] = name;
  return name;
}

// The attributes of a pattern instance as the component has them, the labels shown: the point from the pattern's
// origin on the board, the angle on the board (P-CAD turns a text before mirroring it), the style, the alignment.
void writeAttributes(const Board& b, int ci, Node& inst) {
  static const char* justify[] = {"UpperLeft", "UpperCenter", "UpperRight", "Left", "Center", "Right", "LowerLeft", "LowerCenter", "LowerRight"};
  const Component& c = b.components[size_t(ci)];
  Node* ref = findChild(inst, "patternGraphicsRef");
  if (!ref) {
    Node n = Node::list("patternGraphicsRef");
    if (const Node* name = inst.find("patternGraphicsNameRef")) n.add(*name);
    ref = &inst.add(std::move(n));
  }
  const auto attrs = b.attributesOf(ci);
  // Attributes taken out of the component go from the instance (those of the pattern stay as they are).
  std::erase_if(ref->kids, [&](const Node& k) {
    return k.is("attr") && r::none_of(attrs, [&](const Attribute& a) { return utf8ToCp1251(a.name) == k.arg(0); });
  });
  for (const Attribute& a : attrs) {
    const std::string name = utf8ToCp1251(a.name);
    auto it = r::find_if(ref->kids, [&](const Node& k) { return k.is("attr") && k.arg(0) == name; });
    const int li = b.labelOf(ci, a.name);
    if (it == ref->kids.end() && li < 0 && a.name != "RefDes" && a.name != "Value") continue;
    Node n = Node::list("attr");
    n.addAtom(name, true);
    n.addAtom(utf8ToCp1251(a.value), true);
    const Node* was = it != ref->kids.end() ? &*it : nullptr;
    if (li >= 0) {
      const Text& t = b.texts[size_t(li)];
      Node p = pt(t.pos - c.pos.v());
      n.add(std::move(p));
      const double rot = std::fmod(t.mirror ? 720.0 - t.angle : t.angle + 360.0, 360.0);
      if (std::abs(rot) > 1e-9) n.add(numNode("rotation", rot));
      n.add(atomNode("isVisible", "True"));
      if (t.align != TextAlign::LB) n.add(atomNode("justify", justify[int(t.align)]));
      n.add(strNode("textStyleRef", b.styleOf(t).name));
    } else if (was) {
      // Hidden: where it was, without being shown.
      for (const Node& k : was->kids)
        if (k.isList && !k.is("isVisible")) n.add(k);
    } else if (!b.textStyles.empty()) {
      n.add(strNode("textStyleRef", b.textStyles.front().name));
    }
    if (was) *it = std::move(n);
    else ref->add(std::move(n));
  }
}

}  // namespace

Result<std::string> writePcad(const Board& b) {
  if (!b.source || b.source->format != SourceDoc::Format::Pcad || !b.source->tree)
    return std::unexpected(std::string("P-CAD ASCII export needs a board loaded from P-CAD ASCII"));
  const SourceDoc& src = *b.source;
  Node tree = *src.tree;
  double unit = src.unitNm > 0 ? src.unitNm : double(kNmPerMil);
  Node* design = findChild(tree, "pcbDesign");
  Node* library = findChild(tree, "library");
  if (!design || !library) return std::unexpected(std::string("P-CAD file without pcbDesign/library"));
  Node* ml = findChild(*design, "multiLayer");
  if (!ml) ml = &design->add(Node::list("multiLayer"));
  auto layerNum = [&](LayerId l) { return l >= 0 && l < LayerId(src.layerNums.size()) ? src.layerNums[l] : -1; };
  auto netName = [&](int n) { return n >= 0 ? b.nets[n].name : std::string(); };

  // Placement.
  for (size_t ci = 0; ci < b.components.size() && ci < src.componentNodes.size(); ++ci) {
    int idx = src.componentNodes[ci];
    if (idx < 0 || idx >= int(ml->kids.size())) continue;
    Node& inst = ml->kids[idx];
    const Component& c = b.components[ci];
    bool flipped = c.side == Side::Bottom;
    // P-CAD turns a flipped part before mirroring it (see the reader).
    double rot = flipped ? std::fmod(720.0 - c.angle, 360.0) : c.angle;
    if (Node* p = findChild(inst, "pt")) *p = pt(c.pos.v());
    auto afterPt = [&](Node n) {
      auto it = r::find_if(inst.kids, [](const Node& k) { return k.is("pt"); });
      inst.kids.insert(it == inst.kids.end() ? inst.kids.end() : it + 1, std::move(n));
    };
    if (Node* f = findChild(inst, "isFlipped")) {
      Node n = Node::list("isFlipped");
      n.addAtom(flipped ? "True" : "False");
      *f = std::move(n);
    } else if (flipped) {
      Node n = Node::list("isFlipped");
      n.addAtom("True");
      afterPt(std::move(n));
    }
    // P-CAD expects rotation right after pt.
    if (Node* r = findChild(inst, "rotation")) *r = numNode("rotation", rot);
    else if (std::abs(rot) > 1e-9) afterPt(numNode("rotation", rot));
    writeAttributes(b, int(ci), inst);
  }

  // The pours of the file in the order the reader counted them: an area read from one keeps what the model has not.
  std::vector<Node> pours;
  for (const Node& k : design->kids)
    if (k.is("layerContents"))
      for (const Node& p : k.kids)
        if (p.is("copperPour95") || p.is("copperPour")) pours.push_back(p);

  // Routing: copper lines/arcs that belong to a net are replaced.
  std::map<int, Node*> contents;
  for (auto& k : design->kids) {
    if (!k.is("layerContents")) continue;
    const Node* ln = k.find("layerNumRef");
    if (!ln) continue;
    int num = int(ln->num(0));
    bool copper = false;
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (layerNum(l) == num && b.layers[l].kind == LayerKind::Copper) copper = true;
    if (!copper) continue;
    // The lines and arcs of the layer (wires, and the stripes of copper of no net), its polygons, the cutouts of
    // the pours and the keepouts: all from the model.
    std::erase_if(k.kids, [](const Node& n) {
      return n.is("line") || n.is("arc") || n.is("pcbPoly") || n.is("polyCutOut") || n.is("polyKeepOut") || n.is("lineKeepOut");
    });
    // The pours are written anew from the areas (below).
    std::erase_if(k.kids, [](const Node& n) { return n.is("copperPour95") || n.is("copperPour"); });
    contents[num] = &k;
  }
  auto layerContents = [&](int num) -> Node& {
    Node*& lc = contents[num];
    if (!lc) {
      Node n = Node::list("layerContents");
      n.add(numNode("layerNumRef", num));
      lc = &design->add(std::move(n));
      // Pointers into design->kids may move when it grows: rebuild the map.
      contents.clear();
      for (auto& k : design->kids)
        if (k.is("layerContents"))
          if (const Node* ln = k.find("layerNumRef")) contents[int(ln->num(0))] = &k;
    }
    return *contents[num];
  };
  for (const Track& t : b.tracks) {
    int num = layerNum(t.layer);
    if (num < 0) continue;
    layerContents(num);
    Node n = lineOrArc(t.a.v(), t.isArc() ? std::optional(t.mid->v()) : std::nullopt, t.b.v());
    n.add(mmNode("width", double(t.width)));
    if (t.net >= 0) n.add(strNode("netNameRef", netName(t.net)));
    contents[num]->add(std::move(n));
  }

  // Copper areas: the pours, P-CAD's polygons (solid copper) and the stripes (lines and arcs of the area's width).
  for (const Zone& z : b.zones) {
    int num = layerNum(z.layer);
    if (num < 0 || b.layers[z.layer].kind != LayerKind::Copper) continue;
    if (z.open()) {
      auto add = [&](Node n) {
        n.add(mmNode("width", double(z.lineWidth)));
        if (z.net >= 0) n.add(strNode("netNameRef", netName(z.net)));
        layerContents(num).add(std::move(n));
      };
      const auto& s = z.shape;
      // A ring (two halves of one circle, end to start): one arc all the way round.
      if (s.size() == 2 && s[0].kind == GraphicKind::Arc && s[1].kind == GraphicKind::Arc && (s[1].b - s[0].a).len() < 10) {
        auto g0 = ArcGeom::fromThreePoints(s[0].a, s[0].m, s[0].b), g1 = ArcGeom::fromThreePoints(s[1].a, s[1].m, s[1].b);
        if (g0.valid && g1.valid && (g0.center - g1.center).len() < 10 && std::abs(g0.radius - g1.radius) < 10) {
          Node n = Node::list("arc");
          n.add(pt(g0.center));
          n.add(mmNode("radius", g0.radius));
          n.add(numNode("startAngle", 0));
          n.add(numNode("sweepAngle", 360));
          add(std::move(n));
          continue;
        }
      }
      for (const Graphic& g : s) add(lineOrArc(g.a, g.kind == GraphicKind::Arc ? std::optional(g.m) : std::nullopt, g.b));
      continue;
    }
    if (z.outline.size() < 3) continue;
    if (z.solid) {
      Graphic g;
      if (!z.shape.empty()) g = z.shape.front();
      else g.kind = GraphicKind::Poly, g.pts = z.outline;
      Node p = polyNode("pcbPoly", g);
      if (z.net >= 0) p.add(strNode("netNameRef", netName(z.net)));
      layerContents(num).add(std::move(p));
      continue;
    }
    const Node* own = z.source >= 0 && z.source < int(pours.size()) ? &pours[z.source] : nullptr;
    layerContents(num).add(pourNode(z, netName(z.net), own, unit));
  }

  // Keepouts of the signal layers: of the pours (polyCutOut), of the wires as areas (polyKeepOut) and as lines
  // (lineKeepOut: one segment each, arcs and circles in chords). One on all layers is one on each. P-CAD has no
  // keepout of placement among these: those are not written.
  for (const Keepout& k : b.keepouts) {
    if (k.role != Keepout::Role::Route) continue;
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
      if (!k.onLayer(l) || b.layers[l].kind != LayerKind::Copper || b.layers[l].plane) continue;
      const int num = layerNum(l);
      if (num < 0) continue;
      for (const Graphic& g : k.shape) {
        if (Keepout::isArea(g)) {
          Node n = Node::list(k.pour ? "polyCutOut" : "polyKeepOut");
          n.add(polyNode("pcbPoly", g));
          layerContents(num).add(std::move(n));
          continue;
        }
        if (k.pour) continue;  // (a line cuts no pour in P-CAD)
        Polyline pts = g.path(kChord);
        if (g.closed() && !pts.empty()) pts.push_back(pts.front());
        for (size_t i = 1; i < pts.size(); ++i) {
          Node n = Node::list("lineKeepOut");
          n.add(pt(pts[i - 1]));
          n.add(pt(pts[i]));
          layerContents(num).add(std::move(n));
        }
      }
    }
  }

  // Vias.
  std::erase_if(ml->kids, [](const Node& n) { return n.is("via"); });
  std::map<std::pair<Coord, Coord>, std::string> styles;
  for (const Via& v : b.vias) {
    Node n = Node::list("via");
    n.add(strNode("viaStyleRef", toUtf8(viaStyle(*library, unit, v.diameter, v.drill, styles))));
    n.add(pt(v.pos.v()));
    if (v.net >= 0) n.add(strNode("netNameRef", netName(v.net)));
    ml->add(std::move(n));
  }

  // Serialise: first line is the bare header (ACCEL_ASCII "file"), then the sections.
  std::string out;
  for (size_t k = 0; k < tree.kids.size(); ++k) {
    const Node& n = tree.kids[k];
    if (!n.isList) {
      out += n.quoted ? "\"" + n.text + "\"" : n.text;
      out += (k + 1 < tree.kids.size() && !tree.kids[k + 1].isList) ? " " : "\r\n\r\n";
      continue;
    }
    out += sexpr::writeCompact(n);
    out += "\r\n\r\n";
  }
  return out;
}

}  // namespace xr::io
