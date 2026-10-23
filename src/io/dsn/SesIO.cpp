// Specctra session (.ses) reader and writer: routing results exchanged with autorouters.
#include <map>

#include "io/BoardIO.h"
#include "io/dsn/DsnCommon.h"

namespace xr::io {

using sexpr::Node;

namespace {

struct ViaDef {
  Coord dia = 0, drill = 0;
};

ViaDef parseViaPadstack(const Node* ps, double s) {
  ViaDef v;
  if (!ps) return v;
  if (const Node* sh = ps->find("shape"))
    if (sh->kids.size() > 1 && sh->kids[1].is("circle")) v.dia = Coord(sh->kids[1].num(1) * s);
  std::string name = ps->arg(0);
  auto colon = name.find(':');
  if (colon != std::string::npos) {
    double d = std::atof(name.c_str() + colon + 1);
    if (d > 0) v.drill = Coord(d * (name.find("_um") != std::string::npos ? 1000.0 : s));
  }
  return v;
}

}  // namespace

Result<void> applySes(Board& b, const std::string& text) {
  sexpr::ParseOptions opt;
  opt.dsnQuoting = true;
  Node tree = sexpr::parse(text, opt);
  if (tree.kids.empty() || !tree.kids[0].is("session")) {
    return std::unexpected(std::string("not a Specctra session file"));
  }
  const Node& root = tree.kids[0];
  const Node* routes = root.find("routes");
  if (!routes) {
    return std::unexpected(std::string("session has no routes"));
  }
  double s = dsn::coordScale(*routes, 100);
  std::map<std::string, ViaDef> vias;
  if (const Node* lib = routes->find("library_out"))
    for (auto* ps : lib->findAll("padstack")) vias[ps->arg(0)] = parseViaPadstack(ps, s);

  b.clearRouting(true);
  auto pt = [&](double x, double y) { return Point(Vec2{x * s, -y * s}); };
  if (const Node* no = routes->find("network_out")) {
    for (auto* net : no->findAll("net")) {
      int ni = b.findNet(net->arg(0));
      const NetClass& nc = b.classOf(ni);
      for (auto* wire : net->findAll("wire")) {
        const Node* path = wire->find("path");
        if (!path) continue;
        LayerId l = b.findLayer(path->arg(0));
        if (l < 0 || b.layers[l].kind != LayerKind::Copper) continue;
        Coord w = Coord(path->num(1) * s);
        for (size_t i = 3; i + 3 < path->kids.size(); i += 2) {
          Track t;
          t.a = pt(path->num(i - 1), path->num(i));
          t.b = pt(path->num(i + 1), path->num(i + 2));
          t.width = w;
          t.layer = l;
          t.net = ni;
          if (t.a != t.b) b.tracks.push_back(t);
        }
      }
      for (auto* via : net->findAll("via")) {
        Via v;
        v.pos = pt(via->num(1), via->num(2));
        auto it = vias.find(via->arg(0));
        v.diameter = it != vias.end() && it->second.dia ? it->second.dia : nc.viaDiameter;
        v.drill = it != vias.end() && it->second.drill ? it->second.drill : nc.viaDrill;
        v.layers = b.allCopperMask();
        v.net = ni;
        b.vias.push_back(v);
      }
    }
  }
  return {};
}

std::string writeSes(const Board& b) {
  auto u = [](double nm) { return sexpr::fmtNum(nm / 100.0, 0); };  // resolution um 10
  auto uy = [](double nm) { return sexpr::fmtNum(-nm / 100.0, 0); };
  auto q = [](const std::string& s) { return Node::atom(s, true); };
  Node root = Node::list("session");
  root.add(q(b.name.empty() ? "board" : b.name));
  Node base = Node::list("base_design");
  base.add(q(b.name.empty() ? "board" : b.name));
  root.add(std::move(base));

  Node placement = Node::list("placement");
  Node res = Node::list("resolution");
  res.addAtom("um");
  res.addAtom("10");
  placement.add(res);
  for (auto& c : b.components) {
    Node comp = Node::list("component");
    comp.add(q("IMG_" + c.ref));
    Node place = Node::list("place");
    place.add(q(c.ref));
    place.addAtom(u(c.pos.v().x));
    place.addAtom(uy(c.pos.v().y));
    place.addAtom("front");
    place.addAtom("0");
    comp.add(std::move(place));
    placement.add(std::move(comp));
  }
  root.add(std::move(placement));

  Node routes = Node::list("routes");
  routes.add(res);
  Node lib = Node::list("library_out");
  std::map<std::string, bool> seen;
  auto viaName = [&](const Via& v) {
    std::string name = "Via_" + sexpr::fmtNum(v.diameter / 1000.0, 3) + ":" + sexpr::fmtNum(v.drill / 1000.0, 3) + "_um";
    if (!seen[name]) {
      seen[name] = true;
      Node ps = Node::list("padstack");
      ps.add(q(name));
      for (LayerId l : b.copperLayers()) {
        Node shape = Node::list("shape");
        Node c = Node::list("circle");
        c.add(q(b.layers[l].name));
        c.addAtom(u(double(v.diameter)));
        c.addAtom("0");
        c.addAtom("0");
        shape.add(std::move(c));
        ps.add(std::move(shape));
      }
      lib.add(std::move(ps));
    }
    return name;
  };
  std::map<int, Node> nets;
  auto netNode = [&](int n) -> Node& {
    auto it = nets.find(n);
    if (it == nets.end()) {
      Node nn = Node::list("net");
      nn.add(q(b.nets[n].name));
      it = nets.emplace(n, std::move(nn)).first;
    }
    return it->second;
  };
  for (auto& t : b.tracks) {
    if (t.net < 0) continue;
    Node w = Node::list("wire");
    Node path = Node::list("path");
    path.add(q(b.layers[t.layer].name));
    path.addAtom(u(double(t.width)));
    for (auto& p : t.path(1000)) { path.addAtom(u(p.x)); path.addAtom(uy(p.y)); }
    w.add(std::move(path));
    netNode(t.net).add(std::move(w));
  }
  for (auto& v : b.vias) {
    if (v.net < 0) continue;
    Node n = Node::list("via");
    n.add(q(viaName(v)));
    n.addAtom(u(v.pos.v().x));
    n.addAtom(uy(v.pos.v().y));
    netNode(v.net).add(std::move(n));
  }
  routes.add(std::move(lib));
  Node no = Node::list("network_out");
  for (auto& [k, n] : nets) no.add(std::move(n));
  routes.add(std::move(no));
  root.add(std::move(routes));
  return sexpr::write(root) + "\n";
}

}  // namespace xr::io
