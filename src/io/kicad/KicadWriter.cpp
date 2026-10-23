// KiCad .kicad_pcb writer. When the board was loaded from KiCad the original tree is patched
// (placement updated, routing replaced) so everything we do not model survives the round trip.
#include <algorithm>
#include <boost/json.hpp>
#include <cmath>

#include "io/BoardIO.h"
#include "io/sexpr/SExpr.h"

namespace xr::io {

using sexpr::Node;

namespace {

std::string mmS(double nm) { return sexpr::fmtNum(nm / kNmPerMm, 6); }

Node xyNode(const char* head, Vec2 p) {
  Node n = Node::list(head);
  n.addAtom(mmS(p.x));
  n.addAtom(mmS(p.y));
  return n;
}

Node numNode(const char* head, double nm) {
  Node n = Node::list(head);
  n.addAtom(mmS(nm));
  return n;
}

Node strNode(const char* head, const std::string& s) {
  Node n = Node::list(head);
  n.addAtom(s, true);
  return n;
}

struct NetStyle {
  bool numeric = false;  // KiCad <= 8 uses (net <code>) references
  std::map<std::string, int> codes;
};

Node netNode(const Board& b, const NetStyle& st, int net) {
  Node n = Node::list("net");
  std::string name = net >= 0 && net < int(b.nets.size()) ? b.nets[net].name : "";
  if (st.numeric) {
    auto it = st.codes.find(name);
    n.addAtom(std::to_string(it == st.codes.end() ? 0 : it->second));
  } else {
    n.addAtom(name, true);
  }
  return n;
}

std::string uuidFor(size_t i, int kind) {
  char buf[64];
  std::snprintf(buf, sizeof buf, "58a7%04x-0000-4000-8000-%012zx", kind & 0xffff, i);
  return buf;
}

void appendRouting(const Board& b, const NetStyle& st, Node& root) {
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    const Track& t = b.tracks[i];
    Node n = Node::list(t.isArc() ? "arc" : "segment");
    n.add(xyNode("start", t.a.v()));
    if (t.isArc()) n.add(xyNode("mid", t.mid->v()));
    n.add(xyNode("end", t.b.v()));
    n.add(numNode("width", double(t.width)));
    if (t.locked) n.add(strNode("locked", "yes")).kids[1].quoted = false;
    n.add(strNode("layer", b.layers[t.layer].name));
    n.add(netNode(b, st, t.net));
    n.add(strNode("uuid", uuidFor(i, t.isArc() ? 2 : 1)));
    root.add(std::move(n));
  }
  for (size_t i = 0; i < b.vias.size(); ++i) {
    const Via& v = b.vias[i];
    Node n = Node::list("via");
    n.add(xyNode("at", v.pos.v()));
    n.add(numNode("size", double(v.diameter)));
    n.add(numNode("drill", double(v.drill)));
    Node ls = Node::list("layers");
    auto cu = b.copperLayers();
    LayerId first = -1, last = -1;
    for (LayerId l : cu)
      if (v.onLayer(l)) { if (first < 0) first = l; last = l; }
    if (first < 0) { first = b.topCopper(); last = b.bottomCopper(); }
    ls.addAtom(b.layers[first].name, true);
    ls.addAtom(b.layers[last].name, true);
    n.add(std::move(ls));
    n.add(netNode(b, st, v.net));
    n.add(strNode("uuid", uuidFor(i, 3)));
    root.add(std::move(n));
  }
}

void setAt(Node& at, Vec2 p, double angle, bool withAngle) {
  Node n = Node::list("at");
  n.addAtom(mmS(p.x));
  n.addAtom(mmS(p.y));
  if (withAngle && std::abs(angle) > 1e-9) n.addAtom(sexpr::fmtNum(angle, 4));
  at = std::move(n);
}

std::string patchSource(const Board& b) {
  Node tree = *b.source->tree;
  Node& root = tree.kids[0];
  NetStyle st;
  for (auto* n : root.findAll("net"))
    if (n->argc() >= 2) {
      st.numeric = true;
      st.codes[n->arg(1)] = int(n->num(0));
    }
  // Update placement of footprints we know about.
  for (size_t ci = 0; ci < b.components.size() && ci < b.source->componentNodes.size(); ++ci) {
    Node& fp = root.kids[b.source->componentNodes[ci]];
    const Component& c = b.components[ci];
    if (Node* at = fp.find("at")) setAt(*at, c.pos.v(), c.angle, true);
    if (Node* tf = fp.find("transform")) {
      if (Node* t = tf->find("translate")) {
        Node n = xyNode("translate", c.pos.v());
        *t = std::move(n);
      }
      if (Node* r = tf->find("rotate")) {
        Node n = Node::list("rotate");
        n.addAtom(sexpr::fmtNum(c.angle, 4));
        *r = std::move(n);
      }
    }
    size_t pi = 0;
    for (auto& k : fp.kids) {
      if (!k.is("pad") || pi >= c.pads.size()) continue;
      const Pad& p = b.pads[c.pads[pi++]];
      if (Node* at = k.find("at")) setAt(*at, p.localPos.v(), p.angle, true);
      // Net reassignment is not edited in stage 1; keep the original (net ...) node.
    }
  }
  // Zone fills cleared in the model (e.g. by the router) must be dropped so KiCad refills them.
  bool fillsCleared = std::ranges::all_of(b.zones, [](const Zone& z) { return z.filled.empty(); });
  if (fillsCleared)
    for (auto& k : root.kids)
      if (k.is("zone")) std::erase_if(k.kids, [](const Node& n) { return n.is("filled_polygon"); });
  // Replace routing.
  std::erase_if(root.kids, [](const Node& n) { return n.is("segment") || n.is("arc") || n.is("via"); });
  appendRouting(b, st, root);
  return sexpr::write(root) + "\n";
}

Node padNode(const Board& b, const Pad& p, const NetStyle& st, size_t idx) {
  Node n = Node::list("pad");
  n.addAtom(p.number, true);
  n.addAtom(p.drill > 0 ? (p.plated ? "thru_hole" : "np_thru_hole") : "smd");
  const char* sh = "circle";
  switch (p.shape.kind) {
    case PadShapeKind::Circle: sh = "circle"; break;
    case PadShapeKind::Rect: sh = "rect"; break;
    case PadShapeKind::Oval: sh = "oval"; break;
    case PadShapeKind::RoundRect: sh = "roundrect"; break;
    case PadShapeKind::Polygon: sh = "custom"; break;
  }
  n.addAtom(sh);
  Node at;
  setAt(at, p.localPos.v(), p.angle, true);
  n.add(std::move(at));
  Node size = Node::list("size");
  double w = double(p.shape.w), h = double(p.shape.h);
  if (p.shape.kind == PadShapeKind::Polygon) {
    w = h = std::max(1.0, std::min(w, h) * 0.5);
  }
  size.addAtom(mmS(w));
  size.addAtom(mmS(h));
  n.add(std::move(size));
  if (p.drill > 0) {
    Node d = Node::list("drill");
    if (p.drillH > 0 && p.drillH != p.drill) {
      d.addAtom("oval");
      d.addAtom(mmS(double(p.drill)));
      d.addAtom(mmS(double(p.drillH)));
    } else {
      d.addAtom(mmS(double(p.drill)));
    }
    n.add(std::move(d));
  }
  Node ls = Node::list("layers");
  if (p.drill > 0 && p.copper == b.allCopperMask()) {
    ls.addAtom("*.Cu", true);
    ls.addAtom("*.Mask", true);
  } else {
    bool top = false;
    for (LayerId l : b.copperLayers())
      if (p.onLayer(l)) {
        ls.addAtom(b.layers[l].name, true);
        top = top || b.layers[l].copperIndex == 0;
      }
    ls.addAtom(top ? "F.Mask" : "B.Mask", true);
    if (p.drill == 0) ls.addAtom(top ? "F.Paste" : "B.Paste", true);
  }
  n.add(std::move(ls));
  if (p.shape.kind == PadShapeKind::RoundRect) {
    Node rr = Node::list("roundrect_rratio");
    rr.addAtom(sexpr::fmtNum(p.shape.rratio, 4));
    n.add(std::move(rr));
  }
  if (p.shape.kind == PadShapeKind::Polygon) {
    // Custom pad: outline in the pad frame (KiCad stores primitives unrotated).
    Node prim = Node::list("primitives");
    Node poly = Node::list("gr_poly");
    Node pts = Node::list("pts");
    for (auto& v : p.shape.poly) pts.add(xyNode("xy", v));
    poly.add(std::move(pts));
    poly.add(numNode("width", 0));
    Node fill = Node::list("fill");
    fill.addAtom("yes");
    poly.add(std::move(fill));
    prim.add(std::move(poly));
    n.add(std::move(prim));
  }
  if (p.net >= 0) n.add(netNode(b, st, p.net));
  n.add(strNode("uuid", uuidFor(idx, 4)));
  return n;
}

Node graphicNode(const Board& b, const Graphic& g, const char* prefix, Vec2 origin, double angle) {
  auto loc = [&](Vec2 p) { return rotateBoard(p - origin, -angle); };
  std::string h = prefix;
  Node n;
  switch (g.kind) {
    case GraphicKind::Line:
      n = Node::list(h + "line");
      n.add(xyNode("start", loc(g.a)));
      n.add(xyNode("end", loc(g.b)));
      break;
    case GraphicKind::Arc:
      n = Node::list(h + "arc");
      n.add(xyNode("start", loc(g.a)));
      n.add(xyNode("mid", loc(g.m)));
      n.add(xyNode("end", loc(g.b)));
      break;
    case GraphicKind::Circle:
      n = Node::list(h + "circle");
      n.add(xyNode("center", loc(g.a)));
      n.add(xyNode("end", loc(g.b)));
      break;
    case GraphicKind::Rect:
      n = Node::list(h + "rect");
      n.add(xyNode("start", loc(g.a)));
      n.add(xyNode("end", loc(g.b)));
      break;
    case GraphicKind::Poly: {
      n = Node::list(h + "poly");
      Node pts = Node::list("pts");
      for (auto& p : g.pts) pts.add(xyNode("xy", loc(p)));
      n.add(std::move(pts));
      break;
    }
  }
  Node stroke = Node::list("stroke");
  stroke.add(numNode("width", double(std::max<Coord>(g.width, mmToNm(0.05)))));
  Node type = Node::list("type");
  type.addAtom("solid");
  stroke.add(std::move(type));
  n.add(std::move(stroke));
  if (g.kind == GraphicKind::Poly || g.kind == GraphicKind::Circle || g.kind == GraphicKind::Rect) {
    Node fill = Node::list("fill");
    fill.addAtom(g.filled ? "yes" : "no");
    n.add(std::move(fill));
  }
  n.add(strNode("layer", b.layers[g.layer].name));
  return n;
}

std::string generate(const Board& b) {
  Node root = Node::list("kicad_pcb");
  Node ver = Node::list("version");
  ver.addAtom("20240108");
  root.add(std::move(ver));
  root.add(strNode("generator", "xrtopor"));
  Node general = Node::list("general");
  general.add(numNode("thickness", 1.6 * kNmPerMm));
  root.add(std::move(general));
  root.add(strNode("paper", "A4"));

  // Layer table in KiCad 8 numbering: F.Cu=0, In1..=1.., B.Cu=31.
  Node layers = Node::list("layers");
  auto cu = b.copperLayers();
  for (size_t i = 0; i < cu.size(); ++i) {
    int kid = (i == 0) ? 0 : (i + 1 == cu.size() ? 31 : int(i));
    std::string name = i == 0 ? "F.Cu" : (i + 1 == cu.size() ? "B.Cu" : "In" + std::to_string(i) + ".Cu");
    Node l = Node::list(std::to_string(kid));
    l.addAtom(name, true);
    l.addAtom("signal");
    layers.add(std::move(l));
  }
  const char* tech[][3] = {{"32", "B.Adhes", "user"}, {"33", "F.Adhes", "user"}, {"34", "B.Paste", "user"},
                           {"35", "F.Paste", "user"}, {"36", "B.SilkS", "user"}, {"37", "F.SilkS", "user"},
                           {"38", "B.Mask", "user"},  {"39", "F.Mask", "user"},  {"40", "Dwgs.User", "user"},
                           {"41", "Cmts.User", "user"}, {"44", "Edge.Cuts", "user"}, {"45", "Margin", "user"},
                           {"46", "B.CrtYd", "user"}, {"47", "F.CrtYd", "user"}, {"48", "B.Fab", "user"},
                           {"49", "F.Fab", "user"}};
  for (auto& t : tech) {
    Node l = Node::list(t[0]);
    l.addAtom(t[1], true);
    l.addAtom(t[2]);
    layers.add(std::move(l));
  }
  root.add(std::move(layers));
  root.add(Node::list("setup"));

  // Map our layers to KiCad names.
  Board kb = b;  // copy with renamed layers
  for (size_t i = 0; i < cu.size(); ++i)
    kb.layers[cu[i]].name = i == 0 ? "F.Cu" : (i + 1 == cu.size() ? "B.Cu" : "In" + std::to_string(i) + ".Cu");
  auto techName = [&](const Layer& l) -> std::string {
    bool top = l.side != Side::Bottom;
    switch (l.kind) {
      case LayerKind::Silk: return top ? "F.SilkS" : "B.SilkS";
      case LayerKind::Mask: return top ? "F.Mask" : "B.Mask";
      case LayerKind::Paste: return top ? "F.Paste" : "B.Paste";
      case LayerKind::Fab: return top ? "F.Fab" : "B.Fab";
      case LayerKind::Courtyard: return top ? "F.CrtYd" : "B.CrtYd";
      case LayerKind::Edge: return "Edge.Cuts";
      default: return "Dwgs.User";
    }
  };
  for (auto& l : kb.layers)
    if (l.kind != LayerKind::Copper) l.name = techName(l);

  NetStyle st;
  st.numeric = true;
  Node n0 = Node::list("net");
  n0.addAtom("0");
  n0.addAtom("", true);
  root.add(std::move(n0));
  for (size_t i = 0; i < b.nets.size(); ++i) {
    st.codes[b.nets[i].name] = int(i + 1);
    Node n = Node::list("net");
    n.addAtom(std::to_string(i + 1));
    n.addAtom(b.nets[i].name, true);
    root.add(std::move(n));
  }

  for (size_t ci = 0; ci < kb.components.size(); ++ci) {
    const Component& c = kb.components[ci];
    Node fp = Node::list("footprint");
    fp.addAtom(c.footprint.empty() ? "xrtopor:" + c.ref : c.footprint, true);
    fp.add(strNode("layer", c.side == Side::Bottom ? "B.Cu" : "F.Cu"));
    Node at;
    setAt(at, c.pos.v(), c.angle, true);
    fp.add(std::move(at));
    for (auto [key, val, lay] : {std::tuple{"Reference", c.ref, "F.SilkS"}, std::tuple{"Value", c.value, "F.Fab"}}) {
      Node pr = Node::list("property");
      pr.addAtom(key, true);
      pr.addAtom(val, true);
      Node pat;
      setAt(pat, {0, 0}, c.angle, true);
      pr.add(std::move(pat));
      pr.add(strNode("layer", c.side == Side::Bottom ? std::string("B") + (lay + 1) : lay));
      Node eff = Node::list("effects");
      Node font = Node::list("font");
      Node sz = Node::list("size");
      sz.addAtom("1");
      sz.addAtom("1");
      font.add(std::move(sz));
      eff.add(std::move(font));
      pr.add(std::move(eff));
      fp.add(std::move(pr));
    }
    for (auto& g : c.graphics)
      if (g.layer >= 0) fp.add(graphicNode(kb, g, "fp_", c.pos.v(), c.angle));
    for (int pi : c.pads) fp.add(padNode(kb, kb.pads[pi], st, size_t(pi)));
    root.add(std::move(fp));
  }
  for (auto& g : kb.graphics)
    if (g.layer >= 0) root.add(graphicNode(kb, g, "gr_", {}, 0));
  if (kb.graphics.empty() || std::none_of(kb.graphics.begin(), kb.graphics.end(), [&](const Graphic& g) {
        return g.layer >= 0 && kb.layers[g.layer].kind == LayerKind::Edge;
      })) {
    for (auto& loop : kb.outline) {
      for (size_t i = 0; i < loop.size(); ++i) {
        Node l = Node::list("gr_line");
        l.add(xyNode("start", loop[i]));
        l.add(xyNode("end", loop[(i + 1) % loop.size()]));
        l.add(numNode("width", 0.1 * kNmPerMm));
        l.add(strNode("layer", "Edge.Cuts"));
        root.add(std::move(l));
      }
    }
  }
  appendRouting(kb, st, root);
  return sexpr::write(root) + "\n";
}

}  // namespace

std::string writeKicadProject(const Board& b) {
  namespace json = boost::json;
  json::array classes;
  for (auto& nc : b.netClasses) {
    classes.push_back(json::object{{"name", nc.name},
                                   {"clearance", nc.clearance / double(kNmPerMm)},
                                   {"track_width", nc.trackWidth / double(kNmPerMm)},
                                   {"via_diameter", nc.viaDiameter / double(kNmPerMm)},
                                   {"via_drill", nc.viaDrill / double(kNmPerMm)},
                                   {"microvia_diameter", 0.3},
                                   {"microvia_drill", 0.1},
                                   {"diff_pair_gap", 0.25},
                                   {"diff_pair_width", nc.trackWidth / double(kNmPerMm)},
                                   {"diff_pair_via_gap", 0.25},
                                   {"wire_width", 6},
                                   {"bus_width", 12},
                                   {"line_style", 0},
                                   {"pcb_color", "rgba(0, 0, 0, 0.000)"},
                                   {"schematic_color", "rgba(0, 0, 0, 0.000)"}});
  }
  json::array patterns;
  for (auto& n : b.nets)
    if (n.netClass > 0 && n.netClass < int(b.netClasses.size()))
      patterns.push_back(json::object{{"netclass", b.netClasses[n.netClass].name}, {"pattern", n.name}});
  json::object rules{{"min_copper_edge_clearance", b.edgeClearance / double(kNmPerMm)},
                     {"min_clearance", 0.0},
                     {"min_hole_clearance", 0.25}};
  json::object root{{"board", json::object{{"design_settings", json::object{{"rules", rules}}}}},
                    {"meta", json::object{{"filename", b.name + ".kicad_pro"}, {"version", 3}}},
                    {"net_settings", json::object{{"classes", classes}, {"meta", json::object{{"version", 4}}},
                                                  {"netclass_patterns", patterns}}}};
  return json::serialize(root) + "\n";
}

std::string writeKicad(const Board& b) {
  if (b.source && b.source->format == SourceDoc::Format::Kicad && b.source->tree && !b.source->tree->kids.empty())
    return patchSource(b);
  return generate(b);
}

}  // namespace xr::io
