// Specctra DSN writer. Each component gets its own image with pins at their absolute offsets,
// placed unrotated on the front, so no rotation/mirroring conventions are involved.
#include <map>
#include <set>

#include "io/BoardIO.h"
#include "io/dsn/DsnCommon.h"

namespace xr::io {

using sexpr::Node;

namespace {

// DSN coordinates in micrometres, Y up.
std::string u(double nm) { return sexpr::fmtNum(nm / 1000.0, 3); }
std::string uy(double nm) { return sexpr::fmtNum(-nm / 1000.0, 3); }

std::string dsnName(const std::string& s) {
  return s;  // quoting is handled by marking atoms as quoted
}

Node qatom(const std::string& s) { return Node::atom(dsnName(s), true); }

std::string padstackName(const Board& b, const Pad& p, std::map<std::string, Node>& stacks) {
  // Shape relative to the pad centre, in the DSN frame, rotation already applied.
  Shape sh = p.shapeGeom();
  std::string key;
  Node shapeGeom;
  std::vector<LayerId> layers;
  for (LayerId l : b.copperLayers())
    if (p.onLayer(l)) layers.push_back(l);
  Vec2 c = p.pos.v();
  if (sh.kind == Shape::Kind::Point) {
    key = "c" + u(sh.r * 2);
  } else {
    Polyline out = sh.outline(sh.r > 0 ? 20000 : 1);
    key = "p";
    for (auto& v : out) key += ":" + u(v.x - c.x) + "," + uy(v.y - c.y);
  }
  std::string lkey;
  for (LayerId l : layers) lkey += std::to_string(l) + ".";
  std::string fullKey = key + "/" + lkey;
  auto it = stacks.find(fullKey);
  if (it != stacks.end()) return it->second.arg(0);
  std::string name = "PS" + std::to_string(stacks.size());
  Node ps = Node::list("padstack");
  ps.add(qatom(name));
  for (LayerId l : layers) {
    Node shape = Node::list("shape");
    if (sh.kind == Shape::Kind::Point) {
      Node g = Node::list("circle");
      g.add(qatom(b.layers[l].name));
      g.addAtom(u(sh.r * 2));
      shape.add(std::move(g));
    } else {
      Node g = Node::list("polygon");
      g.add(qatom(b.layers[l].name));
      g.addAtom("0");
      for (auto& v : sh.outline(sh.r > 0 ? 20000 : 1)) {
        g.addAtom(u(v.x - c.x));
        g.addAtom(uy(v.y - c.y));
      }
      shape.add(std::move(g));
    }
    ps.add(std::move(shape));
  }
  Node attach = Node::list("attach");
  attach.addAtom("off");
  ps.add(std::move(attach));
  stacks[fullKey] = ps;
  return name;
}

std::string viaName(const Board& b, Coord dia, Coord drill, std::map<std::string, Node>& stacks) {
  std::string name = "Via_" + u(double(dia)) + ":" + u(double(drill)) + "_um";
  std::string key = "via/" + name;
  if (stacks.count(key)) return name;
  Node ps = Node::list("padstack");
  ps.add(qatom(name));
  for (LayerId l : b.copperLayers()) {
    Node shape = Node::list("shape");
    Node g = Node::list("circle");
    g.add(qatom(b.layers[l].name));
    g.addAtom(u(double(dia)));
    shape.add(std::move(g));
    ps.add(std::move(shape));
  }
  Node attach = Node::list("attach");
  attach.addAtom("off");
  ps.add(std::move(attach));
  stacks[key] = ps;
  return name;
}

}  // namespace

std::string writeDsn(const Board& b) {
  Node root = Node::list("pcb");
  root.add(qatom(b.name.empty() ? "board" : b.name));
  Node parser = Node::list("parser");
  {
    Node sq = Node::list("string_quote");
    sq.addAtom("\"");
    parser.add(std::move(sq));
    Node sp = Node::list("space_in_quoted_tokens");
    sp.addAtom("on");
    parser.add(std::move(sp));
    Node hc = Node::list("host_cad");
    hc.add(qatom("XrTopoR"));
    parser.add(std::move(hc));
  }
  root.add(std::move(parser));
  Node res = Node::list("resolution");
  res.addAtom("um");
  res.addAtom("1000");
  root.add(std::move(res));
  Node unit = Node::list("unit");
  unit.addAtom("um");
  root.add(std::move(unit));

  std::map<std::string, Node> stacks;
  const NetClass& dc = b.netClasses.front();

  Node st = Node::list("structure");
  for (LayerId l : b.copperLayers()) {
    Node layer = Node::list("layer");
    layer.add(qatom(b.layers[l].name));
    Node type = Node::list("type");
    type.addAtom("signal");
    layer.add(std::move(type));
    st.add(std::move(layer));
  }
  for (size_t i = 0; i < b.outline.size() && i < 1; ++i) {
    Node bd = Node::list("boundary");
    Node path = Node::list("path");
    path.addAtom("pcb");
    path.addAtom("0");
    for (auto& p : b.outline[i]) { path.addAtom(u(p.x)); path.addAtom(uy(p.y)); }
    if (!b.outline[i].empty()) { path.addAtom(u(b.outline[i][0].x)); path.addAtom(uy(b.outline[i][0].y)); }
    bd.add(std::move(path));
    st.add(std::move(bd));
  }
  std::string defVia = viaName(b, dc.viaDiameter, dc.viaDrill, stacks);
  Node via = Node::list("via");
  via.add(qatom(defVia));
  st.add(std::move(via));
  Node rule = Node::list("rule");
  {
    Node w = Node::list("width");
    w.addAtom(u(double(dc.trackWidth)));
    rule.add(std::move(w));
    Node c = Node::list("clearance");
    c.addAtom(u(double(dc.clearance)));
    rule.add(std::move(c));
  }
  st.add(std::move(rule));
  root.add(std::move(st));

  Node placement = Node::list("placement");
  Node library = Node::list("library");
  for (const auto& c : b.components) {
    std::string img = "IMG_" + c.ref;
    Node comp = Node::list("component");
    comp.add(qatom(img));
    Node place = Node::list("place");
    place.add(qatom(c.ref));
    place.addAtom(u(c.pos.v().x));
    place.addAtom(uy(c.pos.v().y));
    place.addAtom("front");
    place.addAtom("0");
    comp.add(std::move(place));
    placement.add(std::move(comp));

    Node image = Node::list("image");
    image.add(qatom(img));
    std::set<std::string> used;
    for (int pi : c.pads) {
      const Pad& p = b.pads[pi];
      if (!p.copper) continue;
      std::string ps = padstackName(b, p, stacks);
      std::string pin = p.number.empty() ? "~" : p.number;
      std::string uniq = pin;
      for (int k = 1; used.count(uniq); ++k) uniq = pin + "@" + std::to_string(k);
      used.insert(uniq);
      Node pn = Node::list("pin");
      pn.add(qatom(ps));
      pn.add(qatom(uniq));
      Vec2 d = p.pos.v() - c.pos.v();
      pn.addAtom(u(d.x));
      pn.addAtom(uy(d.y));
      image.add(std::move(pn));
    }
    library.add(std::move(image));
  }
  root.add(std::move(placement));

  // Net class vias.
  std::vector<std::string> classVias;
  for (auto& nc : b.netClasses) classVias.push_back(viaName(b, nc.viaDiameter, nc.viaDrill, stacks));
  for (auto& v : b.vias) viaName(b, v.diameter, v.drill, stacks);
  for (auto& [k, ps] : stacks) library.add(ps);
  root.add(std::move(library));

  Node network = Node::list("network");
  std::map<int, std::vector<std::string>> netPins;
  for (const auto& c : b.components) {
    std::set<std::string> used;
    for (int pi : c.pads) {
      const Pad& p = b.pads[pi];
      if (!p.copper) continue;
      std::string pin = p.number.empty() ? "~" : p.number;
      std::string uniq = pin;
      for (int k = 1; used.count(uniq); ++k) uniq = pin + "@" + std::to_string(k);
      used.insert(uniq);
      if (p.net >= 0) netPins[p.net].push_back(c.ref + "-" + uniq);
    }
  }
  for (auto& [net, pins] : netPins) {
    Node n = Node::list("net");
    n.add(qatom(b.nets[net].name));
    Node ps = Node::list("pins");
    for (auto& p : pins) ps.add(qatom(p));
    n.add(std::move(ps));
    network.add(std::move(n));
  }
  for (size_t ci = 0; ci < b.netClasses.size(); ++ci) {
    const NetClass& nc = b.netClasses[ci];
    Node cls = Node::list("class");
    cls.add(qatom(nc.name));
    for (size_t ni = 0; ni < b.nets.size(); ++ni)
      if (b.nets[ni].netClass == int(ci) && netPins.count(int(ni))) cls.add(qatom(b.nets[ni].name));
    Node circ = Node::list("circuit");
    Node uv = Node::list("use_via");
    uv.add(qatom(classVias[ci]));
    circ.add(std::move(uv));
    cls.add(std::move(circ));
    Node r = Node::list("rule");
    Node w = Node::list("width");
    w.addAtom(u(double(nc.trackWidth)));
    r.add(std::move(w));
    Node c = Node::list("clearance");
    c.addAtom(u(double(nc.clearance)));
    r.add(std::move(c));
    cls.add(std::move(r));
    network.add(std::move(cls));
  }
  root.add(std::move(network));

  Node wiring = Node::list("wiring");
  for (const auto& t : b.tracks) {
    if (t.net < 0) continue;
    auto pts = t.path(20000);
    Node w = Node::list("wire");
    Node path = Node::list("path");
    path.add(qatom(b.layers[t.layer].name));
    path.addAtom(u(double(t.width)));
    for (auto& p : pts) { path.addAtom(u(p.x)); path.addAtom(uy(p.y)); }
    w.add(std::move(path));
    Node net = Node::list("net");
    net.add(qatom(b.nets[t.net].name));
    w.add(std::move(net));
    wiring.add(std::move(w));
  }
  for (const auto& v : b.vias) {
    if (v.net < 0) continue;
    Node n = Node::list("via");
    n.add(qatom(viaName(b, v.diameter, v.drill, stacks)));
    n.addAtom(u(v.pos.v().x));
    n.addAtom(uy(v.pos.v().y));
    Node net = Node::list("net");
    net.add(qatom(b.nets[v.net].name));
    n.add(std::move(net));
    wiring.add(std::move(n));
  }
  root.add(std::move(wiring));
  return sexpr::write(root) + "\n";
}

}  // namespace xr::io
