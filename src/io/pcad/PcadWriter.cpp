// P-CAD 2002 ASCII writer: the source file is patched (placement, routing and vias replaced),
// so libraries, netlist, layers, text and everything else round-trip unchanged.
#include <cmath>
#include <cstdio>
#include <map>

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
    if (Node* p = findChild(inst, "pt")) *p = pt(c.pos.v());
    if (Node* r = findChild(inst, "rotation")) *r = numNode("rotation", c.angle);
    else if (std::abs(c.angle) > 1e-9) {
      // P-CAD expects rotation right after pt.
      auto it = std::find_if(inst.kids.begin(), inst.kids.end(), [](const Node& k) { return k.is("pt"); });
      inst.kids.insert(it == inst.kids.end() ? inst.kids.end() : it + 1, numNode("rotation", c.angle));
    }
  }

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
    std::erase_if(k.kids, [](const Node& n) { return (n.is("line") || n.is("arc")) && n.find("netNameRef"); });
    // Pour islands were computed around the old routing: drop them, P-CAD repours the outline.
    for (auto& pour : k.kids)
      if (pour.is("copperPour95") || pour.is("copperPour"))
        std::erase_if(pour.kids, [](const Node& n) { return n.is("island"); });
    contents[num] = &k;
  }
  for (const Track& t : b.tracks) {
    int num = layerNum(t.layer);
    if (num < 0) continue;
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
    Node n;
    if (!t.isArc()) {
      n = Node::list("line");
      n.add(pt(t.a.v()));
      n.add(pt(t.b.v()));
    } else {
      auto g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
      // P-CAD frame is Y up: angles and sweep change sign; keep the sweep positive (CCW).
      double start = -radToDeg(g.startAngle), sweep = -radToDeg(g.sweep);
      if (sweep < 0) {
        start += sweep;
        sweep = -sweep;
      }
      start = std::fmod(start + 720.0, 360.0);
      n = Node::list("arc");
      n.add(pt(g.center));
      n.add(mmNode("radius", g.radius));
      n.add(numNode("startAngle", start));
      n.add(numNode("sweepAngle", sweep));
    }
    n.add(mmNode("width", double(t.width)));
    if (t.net >= 0) n.add(strNode("netNameRef", netName(t.net)));
    contents[num]->add(std::move(n));
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
