#include "core/Board.h"

#include <algorithm>

namespace xr {

Vec2 rotateBoard(Vec2 v, double deg) {
  // Y-down frame: a CCW rotation on screen is a CW rotation in math terms.
  return v.rotated(-degToRad(deg));
}

Shape Pad::shapeGeom(double expand) const {
  Vec2 c = pos.v();
  double w = double(shape.w), h = double(shape.h);
  double ang = -degToRad(angle);
  Shape s;
  switch (shape.kind) {
    case PadShapeKind::Circle: s = Shape::circle(c, w / 2); break;
    case PadShapeKind::Rect: s = Shape::rect(c, w, h, ang); break;
    case PadShapeKind::Oval: s = Shape::rect(c, w, h, ang, std::min(w, h) / 2); break;
    case PadShapeKind::RoundRect: s = Shape::rect(c, w, h, ang, shape.rratio * std::min(w, h)); break;
    case PadShapeKind::Polygon: {
      Polyline p;
      for (auto& v : shape.poly) p.push_back(c + rotateBoard(v, angle));
      s = p.size() >= 3 ? Shape::polygon(std::move(p)) : Shape::circle(c, w / 2);
      break;
    }
  }
  s.r += expand;
  return s;
}

Polyline Track::path(double tol) const {
  if (!mid) return {a.v(), b.v()};
  auto g = ArcGeom::fromThreePoints(a.v(), mid->v(), b.v());
  if (!g.valid) return {a.v(), b.v()};
  return g.tessellate(tol);
}

double Track::length() const {
  return mid ? ArcGeom::fromThreePoints(a.v(), mid->v(), b.v()).length() : (b.v() - a.v()).len();
}

double Board::tracksLength() const {
  double l = 0;
  for (const Track& t : tracks) l += t.length();
  return l;
}

LayerList Board::copperLayers() const {
  LayerList out;
  for (LayerId i = 0; i < LayerId(layers.size()); ++i)
    if (layers[i].kind == LayerKind::Copper) out.push_back(i);
  std::sort(out.begin(), out.end(), [&](LayerId a, LayerId b) {
    return layers[a].copperIndex < layers[b].copperIndex;
  });
  return out;
}

int Board::copperCount() const {
  return int(std::count_if(layers.begin(), layers.end(), [](const Layer& l) { return l.kind == LayerKind::Copper; }));
}

LayerId Board::findLayer(const std::string& name) const {
  for (LayerId i = 0; i < LayerId(layers.size()); ++i)
    if (layers[i].name == name) return i;
  return -1;
}

LayerId Board::addLayer(const std::string& name, LayerKind kind, Side side) {
  LayerId id = findLayer(name);
  if (id >= 0) return id;
  Layer l;
  l.name = name;
  l.kind = kind;
  l.side = side;
  if (kind == LayerKind::Copper) l.copperIndex = copperCount();
  layers.push_back(l);
  return LayerId(layers.size() - 1);
}

LayerId Board::copperByIndex(int idx) const {
  for (LayerId i = 0; i < LayerId(layers.size()); ++i)
    if (layers[i].kind == LayerKind::Copper && layers[i].copperIndex == idx) return i;
  return -1;
}

LayerMask Board::allCopperMask() const {
  LayerMask m = 0;
  for (LayerId l : copperLayers()) m |= LayerMask(1) << l;
  return m;
}

int Board::findNet(const std::string& name) const {
  auto it = netIndex_.find(name);
  if (it != netIndex_.end()) return it->second;
  for (int i = 0; i < int(nets.size()); ++i)
    if (nets[i].name == name) return i;
  return kNoNet;
}

int Board::addNet(const std::string& name) {
  if (name.empty()) return kNoNet;
  int id = findNet(name);
  if (id != kNoNet) return id;
  nets.push_back(Net{name, 0});
  netIndex_[name] = int(nets.size() - 1);
  return int(nets.size() - 1);
}

void Board::rebuildNetIndex() {
  netIndex_.clear();
  for (int i = 0; i < int(nets.size()); ++i) netIndex_[nets[i].name] = i;
}

const NetClass& Board::classOf(int net) const {
  if (net >= 0 && net < int(nets.size())) {
    int c = nets[net].netClass;
    if (c >= 0 && c < int(netClasses.size())) return netClasses[c];
  }
  return netClasses.front();
}

Coord Board::trackWidth(int net, LayerId layer) const {
  Coord w = classOf(net).trackWidth;
  if (layer >= 0)
    for (auto& r : layerRules)
      if (r.width > 0 && (!r.layers || ((r.layers >> layer) & 1)) && (r.nets.empty() || std::ranges::contains(r.nets, net)))
        w = r.width;
  return w;
}

Coord Board::clearance(int net, LayerId layer) const {
  Coord c = classOf(net).clearance;
  if (layer >= 0)
    for (auto& r : layerRules)
      if (r.clearance > 0 && (!r.layers || ((r.layers >> layer) & 1)) && (r.nets.empty() || std::ranges::contains(r.nets, net)))
        c = r.clearance;
  return c;
}

Coord pairClearance(const std::vector<ClearancePair>& pairs, int netA, int netB, LayerId layer) {
  if (netA < 0 || netB < 0) return 0;
  auto in = [](const std::vector<int>& nets, int net) { return nets.empty() || std::ranges::contains(nets, net); };
  for (auto p = pairs.rbegin(); p != pairs.rend(); ++p) {
    if (p->clearance <= 0) continue;
    if (p->layers && (layer < 0 || !((p->layers >> layer) & 1))) continue;
    if ((in(p->netsA, netA) && in(p->netsB, netB)) || (in(p->netsA, netB) && in(p->netsB, netA))) return p->clearance;
  }
  return 0;
}

Coord clearanceBetween(const std::vector<Coord>& byNet, const std::vector<LayerRule>& layerRules, const std::vector<ClearancePair>& pairs, int netA,
                       int netB, LayerId layer) {
  if (Coord c = pairClearance(pairs, netA, netB, layer); c > 0) return c;
  auto own = [&](int net) {
    Coord c = net >= 0 && net < int(byNet.size()) ? byNet[size_t(net)] : byNet.empty() ? 0 : byNet.front();
    if (layer >= 0)
      for (auto& r : layerRules)
        if (r.clearance > 0 && (!r.layers || ((r.layers >> layer) & 1)) && (r.nets.empty() || std::ranges::contains(r.nets, net))) c = r.clearance;
    return c;
  };
  return std::max(own(netA), own(netB));
}

std::vector<Coord> Board::classClearances() const {
  std::vector<Coord> out;
  for (int n = 0; n < int(nets.size()); ++n) out.push_back(classOf(n).clearance);
  if (out.empty()) out.push_back(netClasses.front().clearance);
  return out;
}

Coord Board::clearance(int netA, int netB, LayerId layer) const {
  if (Coord c = pairClearance(pairRules, netA, netB, layer); c > 0) return c;
  return std::max(clearance(netA, layer), clearance(netB, layer));
}

Coord Board::clearanceUpper(int net, LayerId layer) const {
  Coord c = clearance(net, layer);
  auto in = [](const std::vector<int>& nets, int n) { return nets.empty() || std::ranges::contains(nets, n); };
  for (const ClearancePair& p : pairRules)
    if ((!p.layers || (layer >= 0 && ((p.layers >> layer) & 1))) && (in(p.netsA, net) || in(p.netsB, net))) c = std::max(c, p.clearance);
  return c;
}

Coord Board::maxClearance() const {
  Coord m = 0;
  for (auto& nc : netClasses) m = std::max(m, nc.clearance);
  for (auto& r : layerRules) m = std::max(m, r.clearance);
  for (auto& p : pairRules) m = std::max(m, p.clearance);
  return m;
}

int Board::findNetClass(const std::string& name) const {
  for (int i = 0; i < int(netClasses.size()); ++i)
    if (netClasses[i].name == name) return i;
  return -1;
}

int Board::findComponent(const std::string& ref) const {
  for (int i = 0; i < int(components.size()); ++i)
    if (components[i].ref == ref) return i;
  return -1;
}

void Board::updatePadPositions(int comp) {
  auto& c = components[comp];
  for (int pi : c.pads) {
    Pad& p = pads[pi];
    p.pos = c.pos + Point(rotateBoard(p.localPos.v(), c.angle));
    p.angle = std::fmod(p.localAngle + c.angle + 720.0, 360.0);
  }
}

static Vec2 rotAround(Vec2 p, Vec2 c, double deg) { return c + rotateBoard(p - c, deg); }

void Board::moveComponent(int comp, Point newPos) {
  auto& c = components[comp];
  Point d = newPos - c.pos;
  Vec2 dv = d.v();
  c.pos = newPos;
  for (auto& g : c.graphics) {
    g.a += dv; g.b += dv; g.m += dv;
    for (auto& p : g.pts) p += dv;
  }
  updatePadPositions(comp);
}

void Board::rotateComponent(int comp, double deltaDeg) {
  auto& c = components[comp];
  Vec2 o = c.pos.v();
  c.angle = std::fmod(c.angle + deltaDeg + 720.0, 360.0);
  for (auto& g : c.graphics) {
    if (g.kind == GraphicKind::Rect) {
      g.kind = GraphicKind::Poly;
      g.pts = {g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}};
    }
    g.a = rotAround(g.a, o, deltaDeg);
    g.b = rotAround(g.b, o, deltaDeg);
    g.m = rotAround(g.m, o, deltaDeg);
    for (auto& p : g.pts) p = rotAround(p, o, deltaDeg);
  }
  updatePadPositions(comp);
}

std::vector<Shape> Keepout::shapes() const {
  std::vector<Shape> out;
  for (const Graphic& g : shape) switch (g.kind) {
      case GraphicKind::Line: out.push_back(Shape::capsule(g.a, g.b, 0)); break;
      case GraphicKind::Arc: {
        auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
        auto pts = arc.valid ? arc.tessellate(5000) : Polyline{g.a, g.b};
        for (size_t i = 1; i < pts.size(); ++i) out.push_back(Shape::capsule(pts[i - 1], pts[i], 0));
        break;
      }
      case GraphicKind::Circle:
        if (g.filled) out.push_back(Shape::circle(g.a, (g.b - g.a).len()));
        else out.push_back(Shape::polygon(Shape::circle(g.a, (g.b - g.a).len()).outline(5000)));
        break;
      case GraphicKind::Rect: out.push_back(Shape::polygon({g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}})); break;
      case GraphicKind::Poly:
        if (g.pts.size() >= 3) out.push_back(Shape::polygon(g.pts));
        break;
    }
  return out;
}

const TextStyle& Board::styleOf(const Text& t) const {
  static const TextStyle def;
  return t.style >= 0 && t.style < int(textStyles.size()) ? textStyles[size_t(t.style)] : def;
}

std::array<Vec2, 4> Board::textBox(const Text& t) const {
  double h = double(styleOf(t).height), w = 0.7 * h * double(std::max<size_t>(1, t.text.size()));
  int col = int(t.align) % 3, row = int(t.align) / 3;  // 0 left/top, 1 centre/middle, 2 right/bottom
  double x0 = -w * col / 2.0, y0 = -h * row / 2.0;  // Y down: a bottom-aligned text rises above its point
  std::array<Vec2, 4> c{Vec2{x0, y0}, Vec2{x0 + w, y0}, Vec2{x0 + w, y0 + h}, Vec2{x0, y0 + h}};
  for (auto& p : c) {
    if (t.mirror) p.x = -p.x;
    p = t.pos + rotateBoard(p, t.angle);
  }
  return c;
}

BBox Board::bbox() const {
  BBox b;
  for (auto& c : outline)
    for (auto& p : c) b.add(p);
  if (!b.valid()) {
    for (auto& p : pads) b.add(p.shapeGeom().bbox());
    for (auto& t : tracks) { b.add(t.a.v()); b.add(t.b.v()); }
  }
  return b;
}

void Board::clearRouting(bool keepLocked) {
  std::erase_if(tracks, [&](const Track& t) { return !(keepLocked && t.locked); });
  std::erase_if(vias, [&](const Via& v) { return !(keepLocked && v.locked); });
}

}  // namespace xr
