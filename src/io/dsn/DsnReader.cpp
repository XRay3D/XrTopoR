// Specctra DSN reader (as exported by KiCad, P-CAD, Altium...).
#include <algorithm>
#include <map>

#include "io/BoardIO.h"
#include "io/dsn/DsnCommon.h"

namespace xr::io {

using sexpr::Node;

namespace {

struct PadstackDef {
  PadShape shape;
  Vec2 offset;      // shape centre offset (DSN frame, Y up)
  LayerMask layers = 0;
  bool allLayers = false;
  bool topOnly = false, bottomOnly = false;
};

struct ImagePin {
  std::string padstack;
  std::string name;
  Vec2 pos;  // DSN frame
  double rotate = 0;
};

struct Image {
  std::vector<ImagePin> pins;
  std::vector<Polyline> outlines;  // DSN frame
};

struct Reader {
  Board& b;
  double s = 1000;  // nm per coordinate unit
  std::map<std::string, PadstackDef> padstacks;
  std::map<std::string, Image> images;
  std::map<std::string, int> pinToPad;  // "REF-PIN" -> pad index
  std::vector<std::string> viaNames;

  explicit Reader(Board& board) : b(board) {}

  Vec2 pt(double x, double y) const { return {x * s, -y * s}; }  // DSN -> internal

  LayerId layerByName(const std::string& n) {
    LayerId id = b.findLayer(n);
    if (id >= 0 && b.layers[id].kind == LayerKind::Copper) return id;
    return -1;
  }

  void readStructure(const Node& st) {
    auto layers = st.findAll("layer");
    for (size_t i = 0; i < layers.size(); ++i) {
      Side side = i == 0 ? Side::Top : (i + 1 == layers.size() ? Side::Bottom : Side::None);
      b.addLayer(layers[i]->arg(0), LayerKind::Copper, side);
    }
    LayerId edge = b.addLayer("Edge", LayerKind::Edge, Side::None);
    for (auto* bd : st.findAll("boundary")) {
      for (auto& k : bd->kids) {
        if (k.is("path") || k.is("polygon")) {
          Graphic g;
          g.kind = GraphicKind::Poly;
          g.layer = edge;
          for (size_t i = 2; i + 1 < k.kids.size(); i += 2) g.pts.push_back(pt(k.num(i), k.num(i + 1)));
          if (g.pts.size() >= 2 && (g.pts.front() - g.pts.back()).len() < 1) g.pts.pop_back();
          b.graphics.push_back(g);
        } else if (k.is("rect")) {
          Graphic g;
          g.kind = GraphicKind::Rect;
          g.layer = edge;
          g.a = pt(k.num(1), k.num(2));
          g.b = pt(k.num(3), k.num(4));
          b.graphics.push_back(g);
        }
      }
    }
    // Specctra boundaries come as both the pcb outline and the signal keepout; keep the largest.
    if (const Node* rule = st.find("rule")) {
      NetClass& d = b.netClasses[0];
      if (auto* w = rule->find("width")) d.trackWidth = Coord(w->num(0) * s);
      if (auto* c = rule->find("clearance")) d.clearance = Coord(c->num(0) * s);
    }
    for (auto* v : st.findAll("via"))
      for (size_t i = 0; i < v->argc(); ++i) viaNames.push_back(v->arg(i));
  }

  void readPadstack(const Node& ps) {
    PadstackDef d;
    std::string name = ps.arg(0);
    d.allLayers = name.find("[A]") != std::string::npos;
    d.topOnly = name.find("[T]") != std::string::npos;
    d.bottomOnly = name.find("[B]") != std::string::npos;
    bool haveShape = false;
    for (auto* sh : ps.findAll("shape")) {
      if (sh->kids.size() < 2 || !sh->kids[1].isList) continue;
      const Node& g = sh->kids[1];
      LayerId l = layerByName(g.arg(0));
      if (g.arg(0) == "signal") d.allLayers = true;
      if (l >= 0) d.layers |= LayerMask(1) << l;
      if (haveShape) continue;
      haveShape = true;
      if (g.is("circle")) {
        d.shape.kind = PadShapeKind::Circle;
        d.shape.w = d.shape.h = Coord(g.num(1) * s);
        d.offset = {g.num(2), g.num(3)};
      } else if (g.is("rect")) {
        double x1 = g.num(1), y1 = g.num(2), x2 = g.num(3), y2 = g.num(4);
        d.shape.kind = PadShapeKind::Rect;
        d.shape.w = Coord(std::abs(x2 - x1) * s);
        d.shape.h = Coord(std::abs(y2 - y1) * s);
        d.offset = {(x1 + x2) / 2, (y1 + y2) / 2};
      } else if (g.is("path") || g.is("qarc")) {
        double w = g.num(1);
        double x1 = g.num(2), y1 = g.num(3), x2 = g.num(4, x1), y2 = g.num(5, y1);
        double len = std::hypot(x2 - x1, y2 - y1);
        d.offset = {(x1 + x2) / 2, (y1 + y2) / 2};
        if (len < 1e-9) {
          d.shape.kind = PadShapeKind::Circle;
          d.shape.w = d.shape.h = Coord(w * s);
        } else {
          d.shape.kind = PadShapeKind::Oval;
          bool horiz = std::abs(x2 - x1) >= std::abs(y2 - y1);
          d.shape.w = Coord((horiz ? len + w : w) * s);
          d.shape.h = Coord((horiz ? w : len + w) * s);
        }
      } else if (g.is("polygon")) {
        d.shape.kind = PadShapeKind::Polygon;
        BBox bb;
        for (size_t i = 2; i + 1 < g.kids.size(); i += 2) {
          Vec2 p{g.num(i), g.num(i + 1)};
          d.shape.poly.push_back(p);  // DSN frame for now, converted per pin
          bb.add(p);
        }
        if (d.shape.poly.size() >= 2 && (d.shape.poly.front() - d.shape.poly.back()).len() < 1e-9)
          d.shape.poly.pop_back();
        d.shape.w = Coord(bb.width() * s);
        d.shape.h = Coord(bb.height() * s);
      }
    }
    padstacks[name] = d;
  }

  void readLibrary(const Node& lib) {
    for (auto* ps : lib.findAll("padstack")) readPadstack(*ps);
    for (auto* im : lib.findAll("image")) {
      Image img;
      for (auto* p : im->findAll("pin")) {
        ImagePin ip;
        ip.padstack = p->arg(0);
        size_t i = 1;
        if (p->kids.size() > 2 && p->kids[2].is("rotate")) {
          ip.rotate = p->kids[2].num(0);
          // (pin ps (rotate r) name x y): the rotate list occupies argument slot 1
          ip.name = p->kids.size() > 3 ? p->kids[3].text : "";
          ip.pos = {p->kids.size() > 4 ? std::stod(p->kids[4].text) : 0, p->kids.size() > 5 ? std::stod(p->kids[5].text) : 0};
        } else {
          ip.name = p->arg(i);
          ip.pos = {p->num(i + 1), p->num(i + 2)};
        }
        img.pins.push_back(ip);
      }
      for (auto* o : im->findAll("outline")) {
        if (o->kids.size() < 2 || !o->kids[1].isList) continue;
        const Node& g = o->kids[1];
        Polyline pl;
        if (g.is("path") || g.is("polygon"))
          for (size_t i = 2; i + 1 < g.kids.size(); i += 2) pl.push_back({g.num(i), g.num(i + 1)});
        else if (g.is("rect"))
          pl = {{g.num(1), g.num(2)}, {g.num(3), g.num(2)}, {g.num(3), g.num(4)}, {g.num(1), g.num(4)}, {g.num(1), g.num(2)}};
        if (pl.size() >= 2) img.outlines.push_back(pl);
      }
      images[im->arg(0)] = std::move(img);
    }
  }

  void readPlacement(const Node& pl) {
    LayerId silkTop = b.addLayer("SilkTop", LayerKind::Silk, Side::Top);
    LayerId silkBot = b.addLayer("SilkBottom", LayerKind::Silk, Side::Bottom);
    auto cu = b.copperLayers();
    for (auto* comp : pl.findAll("component")) {
      auto imgIt = images.find(comp->arg(0));
      if (imgIt == images.end()) continue;
      const Image& img = imgIt->second;
      for (auto* place : comp->findAll("place")) {
        Component c;
        c.ref = place->arg(0);
        c.footprint = comp->arg(0);
        Vec2 o{place->num(1), place->num(2)};
        bool back = place->arg(3) == "back";
        double rot = place->num(4);
        if (auto* pn = place->find("PN")) c.value = pn->arg(0);
        c.side = back ? Side::Bottom : Side::Top;
        c.pos = Point(pt(o.x, o.y));
        c.angle = std::fmod(rot + 360.0, 360.0);
        c.locked = place->find("lock_type") != nullptr;
        // Image point (DSN frame) -> internal absolute point.
        auto tr = [&](Vec2 p) {
          if (back) p.x = -p.x;
          Vec2 r = p.rotated(degToRad(rot));
          return pt(o.x + r.x, o.y + r.y);
        };
        int ci = int(b.components.size());
        for (auto& ol : img.outlines) {
          for (size_t i = 1; i < ol.size(); ++i) {
            Graphic g;
            g.kind = GraphicKind::Line;
            g.layer = back ? silkBot : silkTop;
            g.a = tr(ol[i - 1]);
            g.b = tr(ol[i]);
            g.width = mmToNm(0.12);
            c.graphics.push_back(g);
          }
        }
        b.components.push_back(c);
        for (auto& ip : img.pins) {
          auto psIt = padstacks.find(ip.padstack);
          if (psIt == padstacks.end()) continue;
          const PadstackDef& ps = psIt->second;
          Pad p;
          p.component = ci;
          std::string num = ip.name;
          if (auto at = num.find('@'); at != std::string::npos) num = num.substr(0, at);
          p.number = num;
          p.shape = ps.shape;
          // Pad centre in image frame includes the padstack shape offset (rotated with the pin).
          Vec2 local = ip.pos + ps.offset.rotated(degToRad(ip.rotate));
          Vec2 abs = tr(local);
          double padAngle = back ? rot - ip.rotate : rot + ip.rotate;
          p.pos = Point(abs);
          p.angle = std::fmod(padAngle + 720.0, 360.0);
          if (p.shape.kind == PadShapeKind::Polygon) {
            for (auto& v : p.shape.poly) {
              Vec2 q = v - ps.offset;
              if (back) q.x = -q.x;
              v = {q.x * s, -q.y * s};
            }
          }
          // Copper layers, mirrored for back-side parts.
          LayerMask m = ps.layers;
          if (ps.allLayers) m = b.allCopperMask();
          else if (back) {
            LayerMask mm = 0;
            for (size_t k = 0; k < cu.size(); ++k)
              if ((m >> cu[k]) & 1) mm |= LayerMask(1) << cu[cu.size() - 1 - k];
            m = mm;
          }
          if (!m) m = LayerMask(1) << (back ? cu.back() : cu.front());
          p.copper = m;
          if (ps.allLayers || m == b.allCopperMask()) {
            double sz = double(std::min(p.shape.w, p.shape.h));
            p.drill = Coord(std::max(sz * 0.55, double(mmToNm(0.3))));  // DSN carries no drill sizes
          }
          p.localPos = Point(rotateBoard(abs - c.pos.v(), -c.angle));
          p.localAngle = p.angle - c.angle;
          b.pads.push_back(p);
          int pi = int(b.pads.size() - 1);
          b.components[ci].pads.push_back(pi);
          pinToPad[c.ref + "-" + ip.name] = pi;
        }
      }
    }
  }

  void readNetwork(const Node& nw) {
    for (auto* n : nw.findAll("net")) {
      int net = b.addNet(n->arg(0));
      if (const Node* pins = n->find("pins"))
        for (size_t i = 0; i < pins->argc(); ++i) {
          auto it = pinToPad.find(pins->arg(i));
          if (it != pinToPad.end()) b.pads[it->second].net = net;
        }
    }
    for (auto* c : nw.findAll("class")) {
      NetClass nc = b.netClasses[0];
      nc.name = c->arg(0);
      if (const Node* rule = c->find("rule")) {
        if (auto* w = rule->find("width")) nc.trackWidth = Coord(w->num(0) * s);
        if (auto* cl = rule->find("clearance")) nc.clearance = Coord(cl->num(0) * s);
      }
      if (const Node* circ = c->find("circuit"))
        if (const Node* uv = circ->find("use_via")) applyVia(nc, uv->arg(0));
      int ci = b.findNetClass(nc.name);
      if (ci < 0) { b.netClasses.push_back(nc); ci = int(b.netClasses.size() - 1); }
      else b.netClasses[ci] = nc;
      for (size_t i = 1; i < c->kids.size(); ++i) {
        if (c->kids[i].isList) continue;
        int net = b.findNet(c->kids[i].text);
        if (net >= 0) b.nets[net].netClass = ci;
      }
    }
  }

  void applyVia(NetClass& nc, const std::string& name) {
    auto it = padstacks.find(name);
    if (it != padstacks.end()) nc.viaDiameter = it->second.shape.w;
    // KiCad names vias "Via[0-1]_600:300_um" / "Jumper_1400:700_um" -> drill after ':'
    auto colon = name.find(':');
    if (colon != std::string::npos) {
      double d = std::atof(name.c_str() + colon + 1);
      if (d > 0) nc.viaDrill = Coord(d * (name.find("_um") != std::string::npos ? 1000.0 : s));
    } else {
      nc.viaDrill = nc.viaDiameter / 2;
    }
  }

  void readWiring(const Node& w) {
    for (auto* wire : w.findAll("wire")) {
      const Node* path = wire->find("path");
      if (!path) continue;
      LayerId l = layerByName(path->arg(0));
      if (l < 0) continue;
      Coord width = Coord(path->num(1) * s);
      const Node* net = wire->find("net");
      int ni = net ? b.findNet(net->arg(0)) : kNoNet;
      for (size_t i = 3; i + 3 < path->kids.size(); i += 2) {
        Track t;
        t.a = Point(pt(path->num(i - 1), path->num(i)));
        t.b = Point(pt(path->num(i + 1), path->num(i + 2)));
        t.width = width;
        t.layer = l;
        t.net = ni;
        b.tracks.push_back(t);
      }
    }
    for (auto* via : w.findAll("via")) {
      Via v;
      v.pos = Point(pt(via->num(1), via->num(2)));
      auto it = padstacks.find(via->arg(0));
      NetClass tmp = b.netClasses[0];
      applyVia(tmp, via->arg(0));
      v.diameter = it != padstacks.end() ? it->second.shape.w : tmp.viaDiameter;
      v.drill = tmp.viaDrill;
      v.layers = b.allCopperMask();
      const Node* net = via->find("net");
      v.net = net ? b.findNet(net->arg(0)) : kNoNet;
      b.vias.push_back(v);
    }
  }
};

}  // namespace

Result<BoardPtr> readDsn(const std::string& text, const std::string& path) {
  sexpr::ParseOptions opt;
  opt.dsnQuoting = true;
  auto tree = std::make_shared<Node>(sexpr::parse(text, opt));
  if (tree->kids.empty() || !(tree->kids[0].is("pcb") || tree->kids[0].is("PCB"))) {
    return std::unexpected(std::string("not a Specctra DSN file"));
  }
  const Node& root = tree->kids[0];
  auto b = std::make_unique<Board>();
  b->name = root.arg(0);
  Reader r(*b);
  r.s = dsn::coordScale(root, 1000);
  if (const Node* st = root.find("structure")) r.readStructure(*st);
  if (b->copperCount() == 0) {
    b->addLayer("Top", LayerKind::Copper, Side::Top);
    b->addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  if (const Node* lib = root.find("library")) r.readLibrary(*lib);
  if (const Node* pl = root.find("placement")) r.readPlacement(*pl);
  if (const Node* nw = root.find("network")) r.readNetwork(*nw);
  if (!r.viaNames.empty()) {
    for (auto& nc : b->netClasses)
      if (nc.name == "Default") r.applyVia(nc, r.viaNames.front());
  }
  if (const Node* w = root.find("wiring")) r.readWiring(*w);
  buildOutline(*b, b->findLayer("Edge"));
  if (b->outline.size() > 1) b->outline.resize(1);
  auto src = std::make_shared<SourceDoc>();
  src->format = SourceDoc::Format::Dsn;
  src->path = path;
  src->tree = tree;
  b->source = src;
  b->rebuildNetIndex();
  return b;
}

}  // namespace xr::io
