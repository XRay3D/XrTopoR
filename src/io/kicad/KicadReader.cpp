// KiCad .kicad_pcb reader (formats of KiCad 6 .. 11).
#include <boost/json.hpp>
#include <filesystem>
#include <regex>

#include "io/BoardIO.h"
#include "io/sexpr/SExpr.h"

namespace xr::io {

using sexpr::Node;

namespace {

Coord mm(double v) { return mmToNm(v); }
Vec2 xy(const Node* n, size_t i = 0) {
  if (!n) return {};
  return {double(mm(n->num(i))), double(mm(n->num(i + 1)))};
}

bool wildcardMatch(const std::string& pat, const std::string& s) {
  std::string re;
  for (char c : pat) {
    if (c == '*') re += ".*";
    else if (c == '?') re += '.';
    else if (std::string("\\^$.|+()[]{}").find(c) != std::string::npos) { re += '\\'; re += c; }
    else re += c;
  }
  try {
    return std::regex_match(s, std::regex(re));
  } catch (...) {
    return false;
  }
}

struct Reader {
  Board& b;
  std::map<int, std::string> netCodes;  // old numeric net table

  explicit Reader(Board& board) : b(board) {}

  int netOf(const Node* n) {
    if (!n) return kNoNet;
    if (n->argc() >= 2) return b.addNet(n->arg(1));
    const std::string& a = n->arg(0);
    if (n->kids.size() >= 2 && !n->kids[1].quoted && !a.empty() &&
        r::all_of(a, [](char c) { return std::isdigit(static_cast<unsigned char>(c)); })) {
      auto it = netCodes.find(std::stoi(a));
      return it == netCodes.end() ? kNoNet : b.addNet(it->second);
    }
    return b.addNet(a);
  }

  void readLayers(const Node& root) {
    const Node* ls = root.find("layers");
    if (!ls) return;
    struct L { std::string name; std::string type; };
    std::vector<L> copper;
    for (size_t k = 1; k < ls->kids.size(); ++k) {
      const Node& l = ls->kids[k];
      if (!l.isList || l.kids.size() < 3) continue;
      std::string name = l.kids[1].text, type = l.kids[2].text;
      if (name.size() > 3 && name.substr(name.size() - 3) == ".Cu") copper.push_back({name, type});
    }
    auto rank = [](const std::string& n) {
      if (n == "F.Cu") return 0;
      if (n == "B.Cu") return 1000;
      if (n.rfind("In", 0) == 0) return std::atoi(n.c_str() + 2);
      return 500;
    };
    r::sort(copper, {}, [&](const L& l) { return rank(l.name); });
    for (size_t i = 0; i < copper.size(); ++i) {
      Side side = i == 0 ? Side::Top : (i + 1 == copper.size() ? Side::Bottom : Side::None);
      b.addLayer(copper[i].name, LayerKind::Copper, side);
    }
    for (size_t k = 1; k < ls->kids.size(); ++k) {
      const Node& l = ls->kids[k];
      if (!l.isList || l.kids.size() < 3) continue;
      std::string name = l.kids[1].text;
      if (b.findLayer(name) >= 0) continue;
      Side side = name.rfind("F.", 0) == 0 ? Side::Top : name.rfind("B.", 0) == 0 ? Side::Bottom : Side::None;
      LayerKind kind = LayerKind::Other;
      if (name.find("SilkS") != std::string::npos) kind = LayerKind::Silk;
      else if (name.find("Mask") != std::string::npos) kind = LayerKind::Mask;
      else if (name.find("Paste") != std::string::npos) kind = LayerKind::Paste;
      else if (name.find("Fab") != std::string::npos) kind = LayerKind::Fab;
      else if (name.find("CrtYd") != std::string::npos) kind = LayerKind::Courtyard;
      else if (name == "Edge.Cuts") kind = LayerKind::Edge;
      b.addLayer(name, kind, side);
    }
  }

  LayerMask layerMask(const Node* n) {
    LayerMask m = 0;
    if (!n) return m;
    for (size_t i = 0; i < n->argc(); ++i) {
      const std::string& s = n->arg(i);
      if (s == "*.Cu") { m |= b.allCopperMask(); continue; }
      if (s == "F&B.Cu") { m |= (LayerMask(1) << b.topCopper()) | (LayerMask(1) << b.bottomCopper()); continue; }
      LayerId id = b.findLayer(s);
      if (id >= 0 && b.layers[id].kind == LayerKind::Copper) m |= LayerMask(1) << id;
    }
    return m;
  }

  // Graphic from fp_* / gr_* nodes, local coordinates transformed by (origin, angle).
  bool readGraphic(const Node& n, Vec2 origin, double angle, Graphic& g) {
    std::string h = n.head();
    if (h.size() < 4) return false;
    std::string kind = h.substr(3);
    const Node* layer = n.find("layer");
    g.layer = layer ? b.findLayer(layer->arg(0)) : -1;
    const Node* stroke = n.find("stroke");
    const Node* w = stroke ? stroke->find("width") : n.find("width");
    g.width = w ? mm(w->num(0)) : 0;
    const Node* fill = n.find("fill");
    g.filled = fill && (fill->arg(0) == "yes" || fill->arg(0) == "solid");
    auto tr = [&](Vec2 p) { return origin + rotateBoard(p, angle); };
    if (kind == "line") {
      g.kind = GraphicKind::Line;
      g.a = tr(xy(n.find("start")));
      g.b = tr(xy(n.find("end")));
    } else if (kind == "arc") {
      g.kind = GraphicKind::Arc;
      if (n.find("mid")) {
        g.a = tr(xy(n.find("start")));
        g.m = tr(xy(n.find("mid")));
        g.b = tr(xy(n.find("end")));
      } else {  // legacy: start = centre, end = arc start, (angle a)
        Vec2 c = xy(n.find("start")), s = xy(n.find("end"));
        double sweep = n.find("angle") ? n.find("angle")->num(0) : 90;
        Vec2 m = c + rotateBoard(s - c, sweep / 2), e = c + rotateBoard(s - c, sweep);
        g.a = tr(s); g.m = tr(m); g.b = tr(e);
      }
    } else if (kind == "circle") {
      g.kind = GraphicKind::Circle;
      g.a = tr(xy(n.find("center")));
      g.b = tr(xy(n.find("end")));
    } else if (kind == "rect") {
      g.kind = GraphicKind::Poly;
      Vec2 s = xy(n.find("start")), e = xy(n.find("end"));
      g.pts = {tr(s), tr({e.x, s.y}), tr(e), tr({s.x, e.y})};
      if (angle == 0) { g.kind = GraphicKind::Rect; g.a = tr(s); g.b = tr(e); }
    } else if (kind == "poly") {
      g.kind = GraphicKind::Poly;
      if (const Node* pts = n.find("pts"))
        for (auto* p : pts->findAll("xy")) g.pts.push_back(tr(xy(p)));
    } else {
      return false;
    }
    return true;
  }

  void readPad(const Node& n, int compIdx, const Component& comp) {
    Pad p;
    p.component = compIdx;
    p.number = n.arg(0);
    std::string type = n.arg(1), shape = n.arg(2);
    const Node* at = n.find("at");
    p.localPos = Point(xy(at));
    // The pad angle in the file is absolute (footprint + pad); omitted means 0.
    double absAngle = at && at->argc() >= 3 ? at->num(2) : 0.0;
    p.localAngle = absAngle - comp.angle;
    const Node* size = n.find("size");
    p.shape.w = size ? mm(size->num(0)) : 0;
    p.shape.h = size ? mm(size->num(1)) : 0;
    if (shape == "circle") p.shape.kind = PadShapeKind::Circle;
    else if (shape == "rect" || shape == "trapezoid") p.shape.kind = PadShapeKind::Rect;
    else if (shape == "oval") p.shape.kind = PadShapeKind::Oval;
    else if (shape == "roundrect") {
      p.shape.kind = PadShapeKind::RoundRect;
      const Node* rr = n.find("roundrect_rratio");
      p.shape.rratio = rr ? rr->num(0) : 0.25;
    } else if (shape == "custom") {
      p.shape.kind = PadShapeKind::Rect;
      if (const Node* prim = n.find("primitives"))
        if (const Node* poly = prim->find("gr_poly"))
          if (const Node* pts = poly->find("pts")) {
            for (auto* q : pts->findAll("xy")) p.shape.poly.push_back(xy(q));
            if (p.shape.poly.size() >= 3) p.shape.kind = PadShapeKind::Polygon;
          }
    }
    if (const Node* d = n.find("drill")) {
      size_t i = 0;
      bool oval = d->arg(0) == "oval";
      if (oval) i = 1;
      p.drill = mm(d->num(i));
      p.drillH = oval ? mm(d->num(i + 1, d->num(i))) : 0;
    }
    p.plated = type != "np_thru_hole";
    p.copper = layerMask(n.find("layers"));
    if (type == "np_thru_hole" && p.shape.w <= p.drill) p.copper = 0;
    p.net = netOf(n.find("net"));
    b.pads.push_back(std::move(p));
    b.components[compIdx].pads.push_back(int(b.pads.size() - 1));
  }

  void readFootprint(const Node& n) {
    Component c;
    c.footprint = n.arg(0);
    if (const Node* at = n.find("at")) {
      c.pos = Point(xy(at));
      c.angle = at->argc() >= 3 ? at->num(2) : 0;
    } else if (const Node* tf = n.find("transform")) {  // KiCad 11
      c.pos = Point(xy(tf->find("translate")));
      const Node* rot = tf->find("rotate");
      c.angle = rot ? rot->num(0) : 0;
    }
    const Node* layer = n.find("layer");
    c.side = layer && layer->arg(0) == "B.Cu" ? Side::Bottom : Side::Top;
    c.locked = n.find("locked") != nullptr || (n.arg(1) == "locked");
    for (auto* pr : n.findAll("property")) {
      if (pr->arg(0) == "Reference") c.ref = pr->arg(1);
      else if (pr->arg(0) == "Value") c.value = pr->arg(1);
    }
    for (auto* t : n.findAll("fp_text")) {
      if (t->arg(0) == "reference" && c.ref.empty()) c.ref = t->arg(1);
      else if (t->arg(0) == "value" && c.value.empty()) c.value = t->arg(1);
    }
    int idx = int(b.components.size());
    b.components.push_back(c);
    Vec2 o = c.pos.v();
    for (auto& k : n.kids) {
      if (!k.isList) continue;
      const std::string& h = k.head();
      if (h.rfind("fp_", 0) == 0 && h != "fp_text") {
        Graphic g;
        if (readGraphic(k, o, c.angle, g)) b.components[idx].graphics.push_back(g);
      } else if (h == "pad") {
        readPad(k, idx, b.components[idx]);
      }
    }
    b.updatePadPositions(idx);
  }

  void readTrack(const Node& n, bool arc) {
    Track t;
    t.a = Point(xy(n.find("start")));
    t.b = Point(xy(n.find("end")));
    if (arc) t.mid = Point(xy(n.find("mid")));
    const Node* w = n.find("width");
    t.width = w ? mm(w->num(0)) : mm(0.25);
    const Node* l = n.find("layer");
    t.layer = l ? b.findLayer(l->arg(0)) : b.topCopper();
    if (t.layer < 0) return;
    t.net = netOf(n.find("net"));
    t.locked = n.find("locked") != nullptr;
    b.tracks.push_back(t);
  }

  void readVia(const Node& n) {
    Via v;
    v.pos = Point(xy(n.find("at")));
    const Node* s = n.find("size");
    v.diameter = s ? mm(s->num(0)) : mm(0.6);
    const Node* d = n.find("drill");
    v.drill = d ? mm(d->num(0)) : mm(0.3);
    const Node* ls = n.find("layers");
    if (ls && ls->argc() >= 2) {
      LayerId a = b.findLayer(ls->arg(0)), c = b.findLayer(ls->arg(1));
      if (a >= 0 && c >= 0) {
        int ia = b.layers[a].copperIndex, ic = b.layers[c].copperIndex;
        if (ia > ic) std::swap(ia, ic);
        for (int i = ia; i <= ic; ++i) v.layers |= LayerMask(1) << b.copperByIndex(i);
      }
    }
    if (!v.layers) v.layers = b.allCopperMask();
    v.net = netOf(n.find("net"));
    v.locked = n.find("locked") != nullptr;
    b.vias.push_back(v);
  }

  // A rule area with (keepout …): what it forbids on which copper layers.
  void readKeepout(const Node& n, const Node& ko) {
    Keepout k;
    auto denied = [&](const char* what) {
      const Node* w = ko.find(what);
      return w && w->arg(0) == "not_allowed";
    };
    k.wires = denied("tracks") || denied("copperpour");
    k.vias = denied("vias");
    if (!k.wires && !k.vias) return;
    std::vector<std::string> names;
    if (const Node* l = n.find("layer")) names.push_back(l->arg(0));
    else if (const Node* ls = n.find("layers"))
      for (size_t i = 0; i < ls->argc(); ++i) names.push_back(ls->arg(i));
    for (auto& nm : names) {
      if (nm == "*.Cu" || nm == "F&B.Cu") {
        k.layers = 0;
        break;
      }
      if (LayerId l = b.findLayer(nm); l >= 0 && b.layers[l].kind == LayerKind::Copper) k.layers |= LayerMask(1) << l;
    }
    Graphic g;
    g.kind = GraphicKind::Poly;
    g.filled = true;
    if (const Node* poly = n.find("polygon"))
      if (const Node* pts = poly->find("pts"))
        for (auto* p : pts->findAll("xy")) g.pts.push_back(xy(p));
    if (g.pts.size() < 3) return;
    k.shape.push_back(std::move(g));
    b.keepouts.push_back(std::move(k));
  }

  void readZone(const Node& n) {
    if (const Node* ko = n.find("keepout")) {
      readKeepout(n, *ko);
      return;
    }
    Zone z;
    z.net = netOf(n.find("net"));
    if (const Node* nm = n.find("name")) z.name = nm->arg(0);
    const Node* l = n.find("layer");
    std::vector<LayerId> layers;
    if (l) layers.push_back(b.findLayer(l->arg(0)));
    else if (const Node* ls = n.find("layers"))
      for (size_t i = 0; i < ls->argc(); ++i) layers.push_back(b.findLayer(ls->arg(i)));
    if (const Node* cp = n.find("connect_pads")) {
      if (const Node* c = cp->find("clearance")) z.clearance = mm(c->num(0));
      const std::string& mode = cp->arg(0);
      if (mode == "yes") z.pads.connection = PadConnection::Solid;
      else if (mode == "no") z.pads.connection = PadConnection::None;
    }
    if (const Node* pr = n.find("priority")) z.priority = int(pr->num(0));
    if (const Node* mt = n.find("min_thickness")) z.minWidth = mm(mt->num(0));
    if (const Node* fill = n.find("fill")) {
      if (const Node* g = fill->find("thermal_gap")) z.pads.gap = mm(g->num(0));
      if (const Node* w = fill->find("thermal_bridge_width")) z.pads.spoke = mm(w->num(0));
    }
    if (const Node* poly = n.find("polygon"))
      if (const Node* pts = poly->find("pts"))
        for (auto* p : pts->findAll("xy")) z.outline.push_back(xy(p));
    for (LayerId lid : layers) {
      if (lid < 0 || b.layers[lid].kind != LayerKind::Copper) continue;
      Zone zz = z;
      zz.layer = lid;
      for (auto* fp : n.findAll("filled_polygon")) {
        const Node* fl = fp->find("layer");
        if (fl && b.findLayer(fl->arg(0)) != lid) continue;
        std::vector<Vec2> poly;
        if (const Node* pts = fp->find("pts"))
          for (auto* p : pts->findAll("xy")) poly.push_back(xy(p));
        if (poly.size() >= 3) zz.filled.push_back(std::move(poly));
      }
      b.zones.push_back(std::move(zz));
    }
  }

  void readProject(const std::string& pcbPath) {
    auto pro = std::filesystem::path(pcbPath).replace_extension(".kicad_pro");
    auto text = readFile(pro.string());
    if (!text) return;
    boost::system::error_code ec;
    auto jv = boost::json::parse(*text, ec);
    if (ec || !jv.is_object()) return;
    auto num = [](const boost::json::value* v, double def) {
      if (!v) return def;
      if (v->is_double()) return v->as_double();
      if (v->is_int64()) return double(v->as_int64());
      return def;
    };
    const auto& root = jv.as_object();
    if (auto* bd = root.if_contains("board"))
      if (bd->is_object())
        if (auto* ds = bd->as_object().if_contains("design_settings"))
          if (ds->is_object())
            if (auto* rules = ds->as_object().if_contains("rules"))
              if (rules->is_object())
                b.edgeClearance = mm(num(rules->as_object().if_contains("min_copper_edge_clearance"), 0.25));
    auto* ns = root.if_contains("net_settings");
    if (!ns || !ns->is_object()) return;
    const auto& nso = ns->as_object();
    if (auto* classes = nso.if_contains("classes"); classes && classes->is_array()) {
      b.netClasses.clear();
      for (auto& c : classes->as_array()) {
        if (!c.is_object()) continue;
        const auto& o = c.as_object();
        NetClass nc;
        if (auto* n = o.if_contains("name"); n && n->is_string()) nc.name = std::string(n->as_string());
        nc.trackWidth = mm(num(o.if_contains("track_width"), 0.25));
        nc.clearance = mm(num(o.if_contains("clearance"), 0.2));
        nc.viaDiameter = mm(num(o.if_contains("via_diameter"), 0.6));
        nc.viaDrill = mm(num(o.if_contains("via_drill"), 0.3));
        if (nc.name == "Default") b.netClasses.insert(b.netClasses.begin(), nc);
        else b.netClasses.push_back(nc);
      }
      if (b.netClasses.empty()) b.netClasses.push_back(NetClass{});
    }
    if (auto* pats = nso.if_contains("netclass_patterns"); pats && pats->is_array()) {
      for (auto& p : pats->as_array()) {
        if (!p.is_object()) continue;
        auto* cls = p.as_object().if_contains("netclass");
        auto* pat = p.as_object().if_contains("pattern");
        if (!cls || !pat || !cls->is_string() || !pat->is_string()) continue;
        int ci = b.findNetClass(std::string(cls->as_string()));
        if (ci < 0) continue;
        for (auto& net : b.nets)
          if (wildcardMatch(std::string(pat->as_string()), net.name)) net.netClass = ci;
      }
    }
    if (auto* as = nso.if_contains("netclass_assignments"); as && as->is_object()) {
      for (auto& [k, v] : as->as_object()) {
        std::string cls;
        if (v.is_string()) cls = std::string(v.as_string());
        else if (v.is_array() && !v.as_array().empty() && v.as_array()[0].is_string())
          cls = std::string(v.as_array()[0].as_string());
        int ci = b.findNetClass(cls);
        int ni = b.findNet(std::string(k));
        if (ci >= 0 && ni >= 0) b.nets[ni].netClass = ci;
      }
    }
  }
};

}  // namespace

Result<BoardPtr> readKicad(const std::string& text, const std::string& path) {
  auto tree = std::make_shared<Node>(sexpr::parse(text));
  if (tree->kids.empty() || !tree->kids[0].is("kicad_pcb")) {
    return std::unexpected(std::string("not a KiCad board file"));
  }
  Node& root = tree->kids[0];
  auto b = std::make_unique<Board>();
  Reader r(*b);
  r.readLayers(root);
  if (b->copperCount() == 0) {
    b->addLayer("F.Cu", LayerKind::Copper, Side::Top);
    b->addLayer("B.Cu", LayerKind::Copper, Side::Bottom);
  }
  for (auto* n : root.findAll("net"))
    if (n->argc() >= 2) {
      r.netCodes[int(n->num(0))] = n->arg(1);
      if (!n->arg(1).empty()) b->addNet(n->arg(1));
    }
  // Legacy in-file net classes (KiCad 5/6).
  for (auto* nc : root.findAll("net_class")) {
    NetClass c;
    c.name = nc->arg(0);
    if (auto* v = nc->find("clearance")) c.clearance = mmToNm(v->num(0));
    if (auto* v = nc->find("trace_width")) c.trackWidth = mmToNm(v->num(0));
    if (auto* v = nc->find("via_dia")) c.viaDiameter = mmToNm(v->num(0));
    if (auto* v = nc->find("via_drill")) c.viaDrill = mmToNm(v->num(0));
    int ci = b->findNetClass(c.name);
    if (ci < 0) { b->netClasses.push_back(c); ci = int(b->netClasses.size() - 1); }
    else b->netClasses[ci] = c;
    for (auto* an : nc->findAll("add_net")) b->nets[b->addNet(an->arg(0))].netClass = ci;
  }

  auto src = std::make_shared<SourceDoc>();
  src->format = SourceDoc::Format::Kicad;
  src->path = path;
  for (size_t k = 0; k < root.kids.size(); ++k) {
    const Node& n = root.kids[k];
    if (!n.isList) continue;
    const std::string& h = n.head();
    if (h == "footprint" || h == "module") {
      r.readFootprint(n);
      src->componentNodes.push_back(int(k));
    } else if (h == "segment") r.readTrack(n, false);
    else if (h == "arc") r.readTrack(n, true);
    else if (h == "via") r.readVia(n);
    else if (h == "zone") {
      size_t before = b->zones.size();
      r.readZone(n);
      for (size_t z = before; z < b->zones.size(); ++z) src->zoneNodes.push_back(int(k));
    }
    else if (h.rfind("gr_", 0) == 0 && h != "gr_text") {
      Graphic g;
      if (r.readGraphic(n, {}, 0, g)) b->graphics.push_back(g);
    }
  }
  r.readProject(path);
  LayerId edge = b->findLayer("Edge.Cuts");
  if (edge >= 0) buildOutline(*b, edge);
  src->tree = tree;
  b->source = src;
  b->rebuildNetIndex();
  // A zone's clearance in KiCad is the larger of its own and its net class's.
  for (Zone& z : b->zones) z.useClearance = z.clearance > b->clearance(z.net, z.layer);
  return b;
}

}  // namespace xr::io
