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

// Pads carry (net <code> "<name>"), tracks and vias only (net <code>) in the numeric style.
Node netNode(const Board& b, const NetStyle& st, int net, bool withName = false) {
  Node n = Node::list("net");
  std::string name = net >= 0 && net < int(b.nets.size()) ? b.nets[net].name : "";
  if (st.numeric) {
    auto it = st.codes.find(name);
    n.addAtom(std::to_string(it == st.codes.end() ? 0 : it->second));
    if (withName) n.addAtom(name, true);
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

void appendZones(const Board& b, const NetStyle& st, Node& root) {
  for (size_t zi = 0; zi < b.zones.size(); ++zi) {
    const Zone& z = b.zones[zi];
    if (z.outline.size() < 3) continue;
    Node n = Node::list("zone");
    n.add(netNode(b, st, z.net));
    n.add(strNode("net_name", z.net >= 0 ? b.nets[z.net].name : ""));
    n.add(strNode("layer", b.layers[z.layer].name));
    n.add(strNode("uuid", uuidFor(zi, 5)));
    if (!z.name.empty()) n.add(strNode("name", z.name));
    Node hatch = Node::list("hatch");
    hatch.addAtom("edge");
    hatch.addAtom("0.5");
    n.add(std::move(hatch));
    if (z.priority > 0) {
      Node pr = Node::list("priority");
      pr.addAtom(std::to_string(z.priority));
      n.add(std::move(pr));
    }
    Node cp = Node::list("connect_pads");
    if (z.pads.connection == PadConnection::Solid) cp.addAtom("yes");
    else if (z.pads.connection == PadConnection::None) cp.addAtom("no");
    cp.add(numNode("clearance", double(b.zoneClearance(z))));
    n.add(std::move(cp));
    n.add(numNode("min_thickness", double(z.minWidth > 0 ? z.minWidth : mmToNm(0.2))));
    Node fill = Node::list("fill");
    fill.addAtom("yes");
    fill.add(numNode("thermal_gap", double(z.pads.gap > 0 ? z.pads.gap : mmToNm(0.5))));
    fill.add(numNode("thermal_bridge_width", double(z.pads.spoke > 0 ? z.pads.spoke : mmToNm(0.5))));
    n.add(std::move(fill));
    Node poly = Node::list("polygon");
    Node pts = Node::list("pts");
    for (auto& p : z.outline) pts.add(xyNode("xy", p));
    poly.add(std::move(pts));
    n.add(std::move(poly));
    for (auto& f : z.filled) {
      Node fp = Node::list("filled_polygon");
      fp.add(strNode("layer", b.layers[z.layer].name));
      Node fpts = Node::list("pts");
      for (auto& p : f) fpts.add(xyNode("xy", p));
      fp.add(std::move(fpts));
      n.add(std::move(fp));
    }
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

// A footprint the editor took to the other side: its layers change sides (F.* ↔ B.*) and its own
// drawings are mirrored in the footprint frame (x negated), as the model mirrors the pads.
void flipFootprint(Node& fp) {
  auto swapLayer = [](Node& atom) {
    if (atom.isList || atom.text.size() < 2 || atom.text[1] != '.') return;
    if (atom.text[0] == 'F') atom.text[0] = 'B';
    else if (atom.text[0] == 'B') atom.text[0] = 'F';
  };
  auto mirror = [](auto& self, Node& n) -> void {
    if (!n.isList) return;
    if ((n.is("start") || n.is("end") || n.is("mid") || n.is("center") || n.is("xy") || n.is("at")) && n.argc() >= 2) {
      double x = n.num(0);
      n.kids[1] = Node::atom(sexpr::fmtNum(-x, 6));
      return;
    }
    for (size_t i = 1; i < n.kids.size(); ++i) self(self, n.kids[i]);
  };
  for (size_t i = 1; i < fp.kids.size(); ++i) {
    Node& k = fp.kids[i];
    if (!k.isList) continue;
    if (k.is("layer") || k.is("layers")) {
      for (size_t j = 1; j < k.kids.size(); ++j) swapLayer(k.kids[j]);
      continue;
    }
    if (k.is("pad")) {
      if (Node* l = k.find("layers"))
        for (size_t j = 1; j < l->kids.size(); ++j) swapLayer(l->kids[j]);
      continue;  // pads are written from the model
    }
    bool drawing = k.head().starts_with("fp_") || k.is("property");
    if (!drawing) continue;
    if (Node* l = k.find("layer"))
      for (size_t j = 1; j < l->kids.size(); ++j) swapLayer(l->kids[j]);
    mirror(mirror, k);
    // Texts read mirrored on the bottom side.
    if (k.is("fp_text") || k.is("property"))
      if (Node* eff = k.find("effects")) {
        Node* just = eff->find("justify");
        if (!just) just = &eff->add(Node::list("justify"));
        auto it = r::find_if(just->kids, [](const Node& a) { return !a.isList && a.text == "mirror"; });
        if (it != just->kids.end()) just->kids.erase(it);
        else just->addAtom("mirror");
        if (just->kids.size() == 1) std::erase_if(eff->kids, [](const Node& a) { return a.is("justify"); });
      }
  }
}

// Routing keepouts as KiCad rule areas; KiCad has areas only, so keepout lines are left out.
void appendKeepouts(const Board& b, Node& root) {
  for (const Keepout& k : b.keepouts) {
    if (k.role != Keepout::Role::Route) continue;
    for (auto& s : k.shapes()) {
      if (s.kind == Shape::Kind::Segment) continue;
      Node z = Node::list("zone");
      Node net = Node::list("net");
      net.addAtom("0");
      z.add(std::move(net));
      z.add(strNode("net_name", ""));
      Node layers = Node::list("layers");
      if (!k.layers) layers.addAtom("*.Cu", true);
      for (LayerId l : b.copperLayers())
        if (k.layers && ((k.layers >> l) & 1)) layers.addAtom(b.layers[l].name, true);
      z.add(std::move(layers));
      Node hatch = Node::list("hatch");
      hatch.addAtom("edge");
      hatch.addAtom("0.5");
      z.add(std::move(hatch));
      Node ko = Node::list("keepout");
      auto rule = [&](const char* what, bool denied) {
        Node r = Node::list(what);
        r.addAtom(denied ? "not_allowed" : "allowed");
        ko.add(std::move(r));
      };
      rule("tracks", k.wires);
      rule("vias", k.vias);
      rule("pads", false);
      rule("copperpour", k.wires);
      rule("footprints", false);
      z.add(std::move(ko));
      Node poly = Node::list("polygon");
      Node pts = Node::list("pts");
      for (Vec2 p : s.kind == Shape::Kind::Polygon ? s.poly : s.outline(5000)) pts.add(xyNode("xy", p));
      poly.add(std::move(pts));
      z.add(std::move(poly));
      root.add(std::move(z));
    }
  }
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
    if (const Node* l = fp.find("layer"); l && (l->arg(0) == "B.Cu") != (c.side == Side::Bottom)) flipFootprint(fp);
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
  // Zone fills are written from the model (refilled or cleared), replacing what the file had.
  for (auto& k : root.kids)
    if (k.is("zone")) std::erase_if(k.kids, [](const Node& n) { return n.is("filled_polygon"); });
  for (size_t zi = 0; zi < b.zones.size() && zi < b.source->zoneNodes.size(); ++zi) {
    Node& zn = root.kids[b.source->zoneNodes[zi]];
    for (auto& f : b.zones[zi].filled) {
      Node fp = Node::list("filled_polygon");
      fp.add(strNode("layer", b.layers[b.zones[zi].layer].name));
      Node pts = Node::list("pts");
      for (auto& p : f) pts.add(xyNode("xy", p));
      fp.add(std::move(pts));
      zn.add(std::move(fp));
    }
  }
  // Keepout rule areas are written again from the model.
  std::erase_if(root.kids, [](const Node& n) { return n.is("zone") && n.find("keepout"); });
  appendKeepouts(b, root);
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
  if (p.net >= 0) n.add(netNode(b, st, p.net, true));
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
      for (auto& p : g.path(2000)) pts.add(xyNode("xy", loc(p)));  // arcs of the sides in chords
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
    l.addAtom(b.layers[cu[i]].plane ? "power" : "signal");
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
  if (kb.graphics.empty() || r::none_of(kb.graphics, [&](const Graphic& g) {
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
  appendZones(kb, st, root);
  appendKeepouts(kb, root);
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
