#include "core/Board.h"

#include <algorithm>
#include <cmath>

namespace xr {

Vec2 rotateBoard(Vec2 v, double deg) {
  // Y-down frame: a CCW rotation on screen is a CW rotation in math terms.
  return v.rotated(-degToRad(deg));
}

Polyline rectCornersOutline(Coord fullW, Coord fullH, CornerHandling handling, Coord value, std::uint8_t mask) {
  double w = double(fullW) / 2, h = double(fullH) / 2;
  double v = std::min(double(value), std::min(w, h));
  // The corners in TopoR's order (LB RB RT LT, frame Y up) in the board frame (Y down), going round.
  struct Corner { std::uint8_t bit; Vec2 at, in1, in2; };  // in1/in2: unit vectors along the two sides
  const Corner corners[] = {{kCornerLB, {-w, h}, {0, -1}, {1, 0}},
                            {kCornerRB, {w, h}, {-1, 0}, {0, -1}},
                            {kCornerRT, {w, -h}, {0, 1}, {-1, 0}},
                            {kCornerLT, {-w, -h}, {1, 0}, {0, 1}}};
  Polyline out;
  for (auto& k : corners) {
    if (!(mask & k.bit) || v <= 0 || handling == CornerHandling::None) {
      out.push_back(k.at);
      continue;
    }
    Vec2 a = k.at + k.in1 * v, b = k.at + k.in2 * v;
    if (handling == CornerHandling::Chamfer) {
      out.push_back(a);
      out.push_back(b);
      continue;
    }
    Vec2 centre = k.at + (k.in1 + k.in2) * v;
    constexpr int n = 8;
    for (int i = 0; i <= n; ++i) {
      double t = kPi / 2 * i / n;
      out.push_back(centre - k.in2 * (v * std::cos(t)) - k.in1 * (v * std::sin(t)));
    }
  }
  return out;
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

Coord Board::clearanceNom(int netA, int netB, LayerId layer) const {
  const Coord least = clearance(netA, netB, layer);
  auto in = [](const std::vector<int>& nets, int net) { return nets.empty() || (net >= 0 && std::ranges::contains(nets, net)); };
  for (auto p = nominalRules.rbegin(); p != nominalRules.rend(); ++p) {
    if (p->layers && (layer < 0 || !((p->layers >> layer) & 1))) continue;
    if ((in(p->netsA, netA) && in(p->netsB, netB)) || (in(p->netsA, netB) && in(p->netsB, netA))) return std::max(least, p->clearance);
  }
  return least;
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

Vec2 arcMiddle(Vec2 a, Vec2 b, double deg) {
  deg = std::clamp(deg, -359.9, 359.9);
  Vec2 d = b - a;
  // Board frame is Y down: a turn counter-clockwise on screen bulges to the chord's +perp side.
  return (a + b) * 0.5 + d.perp().normalized() * (d.len() / 2 * std::tan(degToRad(deg) / 4));
}

double arcAngle(Vec2 a, Vec2 m, Vec2 b) {
  if (std::abs(orient(a, b, m)) < 1e-6 * (b - a).len2()) return 0;
  auto arc = ArcGeom::fromThreePoints(a, m, b);
  return arc.valid ? -radToDeg(arc.sweep) : 0;
}

bool Graphic::hasArcs() const {
  return std::ranges::any_of(arcs, [](double x) { return x != 0; });
}

Polyline Graphic::path(double tol) const {
  switch (kind) {
    case GraphicKind::Line: return {a, b};
    case GraphicKind::Arc: {
      auto arc = ArcGeom::fromThreePoints(a, m, b);
      return arc.valid ? arc.tessellate(tol) : Polyline{a, b};
    }
    case GraphicKind::Circle: return Shape::circle(a, (b - a).len()).outline(tol);
    case GraphicKind::Rect: return {a, {b.x, a.y}, b, {a.x, b.y}};
    case GraphicKind::Poly: {
      if (!hasArcs()) return pts;
      Polyline out;
      for (size_t k = 0; k < pts.size(); ++k) {
        Vec2 p = pts[k], q = pts[(k + 1) % pts.size()];
        out.push_back(p);
        if (double deg = arcOf(k); deg != 0 && p != q) {
          auto arc = ArcGeom::fromThreePoints(p, arcMiddle(p, q, deg), q);
          if (arc.valid) {
            auto pl = arc.tessellate(tol);
            out.insert(out.end(), pl.begin() + 1, pl.end() - 1);
          }
        }
      }
      return out;
    }
  }
  return {};
}

BBox Graphic::bbox() const {
  BBox bb;
  for (Vec2 p : path(2000)) bb.add(p);
  return bb;
}

void Graphic::mirrorArcs() {
  for (double& x : arcs) x = -x;
}

void Zone::setShape(Graphic g) {
  g.filled = true;
  outline = g.path();
  shape = std::move(g);
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
  for (const Graphic& g : shape) {
    if (g.kind == GraphicKind::Circle && g.filled) {
      out.push_back(Shape::circle(g.a, (g.b - g.a).len()));
      continue;
    }
    auto pts = g.path();
    if (g.closed()) {
      if (pts.size() >= 3) out.push_back(Shape::polygon(pts));
    } else {
      for (size_t i = 1; i < pts.size(); ++i) out.push_back(Shape::capsule(pts[i - 1], pts[i], 0));
    }
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
  std::erase_if(tracks, [&](const Track& t) { return !(keepLocked && t.locked) && !flexFixed(t.net); });
  std::erase_if(vias, [&](const Via& v) { return !(keepLocked && v.locked) && !flexFixed(v.net); });
}

}  // namespace xr
