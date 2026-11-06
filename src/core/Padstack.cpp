#include "core/Padstack.h"

#include <boost/geometry.hpp>
#include <boost/geometry/geometries/multi_polygon.hpp>
#include <boost/geometry/geometries/point_xy.hpp>
#include <boost/geometry/geometries/polygon.hpp>

#include <algorithm>
#include <cmath>
#include <format>
#include <map>
#include <set>
#include <tuple>

namespace bg = boost::geometry;

namespace xr {

namespace {

bool smd(const Padstack& ps) { return ps.type == PadstackType::SMD; }

// Two details of the same shape and place (on different layers).
bool sameGeometry(PadDetail a, PadDetail b) {
  a.layer.clear();
  a.layerClass.clear();
  b.layer.clear();
  b.layerClass.clear();
  return a == b;
}

// The copper layer at the same depth from the other side.
LayerId mirrorCopper(const Board& b, LayerId l) {
  return b.copperByIndex(b.copperCount() - 1 - b.layers[l].copperIndex);
}

// A layer's twin on the other side (the same kind), or itself.
LayerId mirrorLayer(const Board& b, LayerId l) {
  const Layer& L = b.layers[l];
  if (L.kind == LayerKind::Copper) return mirrorCopper(b, l);
  if (L.side == Side::None) return l;
  Side want = L.side == Side::Top ? Side::Bottom : Side::Top;
  for (LayerId k = 0; k < LayerId(b.layers.size()); ++k)
    if (b.layers[k].kind == L.kind && b.layers[k].side == want) return k;
  return l;
}

// Side of a layer: copper by its depth (outer ones only), the others by their own side.
Side layerSide(const Board& b, LayerId l) {
  const Layer& L = b.layers[l];
  if (L.kind != LayerKind::Copper) return L.side;
  if (L.copperIndex == 0) return Side::Top;
  if (L.copperIndex == b.copperCount() - 1) return Side::Bottom;
  return Side::None;
}

std::string mmName(double nm) {
  std::string s = std::format("{:.4f}", nm / kNmPerMm);
  while (s.back() == '0') s.pop_back();
  if (s.back() == '.') s.pop_back();
  return s;
}

using BPt = bg::model::d2::point_xy<double>;
using BPoly = bg::model::polygon<BPt>;
using BMulti = bg::model::multi_polygon<BPoly>;

// The polygon grown by d (negative: shrunk), sharp corners kept sharp.
std::optional<std::vector<Vec2>> offsetPolygon(const std::vector<Vec2>& poly, double d) {
  if (poly.size() < 3) return std::nullopt;
  BPoly p;
  for (auto& v : poly) bg::append(p.outer(), BPt(v.x, v.y));
  bg::append(p.outer(), BPt(poly.front().x, poly.front().y));
  bg::correct(p);
  if (d == 0) return poly;
  BMulti out;
  bg::strategy::buffer::distance_symmetric<double> dist(d);
  bg::strategy::buffer::join_miter join;
  bg::strategy::buffer::end_flat end;
  bg::strategy::buffer::point_square pt;
  bg::strategy::buffer::side_straight side;
  bg::buffer(p, out, dist, side, join, end, pt);
  if (out.empty()) return std::nullopt;
  auto& best = *std::ranges::max_element(out, {}, [](const BPoly& q) { return bg::area(q); });
  std::vector<Vec2> r;
  for (size_t i = 0; i + 1 < best.outer().size(); ++i) r.push_back({best.outer()[i].x(), best.outer()[i].y()});
  if (r.size() < 3) return std::nullopt;
  return r;
}

PadDetail detailFromShape(const PadShape& sh, bool unmirror) {
  PadDetail d;
  switch (sh.kind) {
    case PadShapeKind::Circle:
      d.form = PadDetail::Form::Circle;
      d.w = d.h = sh.w;
      break;
    case PadShapeKind::Oval: {
      Coord dia = std::min(sh.w, sh.h);
      d.form = PadDetail::Form::Oval;
      d.w = d.h = dia;
      d.stretch = {double(sh.w - dia), double(sh.h - dia)};
      break;
    }
    case PadShapeKind::Rect:
      d.form = PadDetail::Form::Rect;
      d.w = sh.w;
      d.h = sh.h;
      break;
    case PadShapeKind::RoundRect:
      d.form = PadDetail::Form::Rect;
      d.w = sh.w;
      d.h = sh.h;
      d.handling = CornerHandling::Rounding;
      d.handlingValue = Coord(std::llround(sh.rratio * double(std::min(sh.w, sh.h))));
      break;
    case PadShapeKind::Polygon:
      d.form = PadDetail::Form::Polygon;
      d.poly = sh.poly;
      if (unmirror)
        for (auto& v : d.poly) v.x = -v.x;
      d.w = sh.w;
      d.h = sh.h;
      break;
  }
  return d;
}

std::string shapeName(const PadDetail& d) {
  switch (d.form) {
    case PadDetail::Form::Circle: return "C" + mmName(double(d.w));
    case PadDetail::Form::Oval:
      return "O" + mmName(double(d.w) + std::abs(d.stretch.x)) + "x" + mmName(double(d.w) + std::abs(d.stretch.y));
    case PadDetail::Form::Rect:
      return (d.handling == CornerHandling::Rounding ? "RR" : "R") + mmName(double(d.w)) + "x" + mmName(double(d.h));
    case PadDetail::Form::Polygon: return "P" + mmName(double(d.w)) + "x" + mmName(double(d.h));
  }
  return "P";
}

}  // namespace

std::string layerClassOf(const Board& b, LayerId l) {
  if (l < 0 || l >= LayerId(b.layers.size())) return {};
  const Layer& L = b.layers[l];
  switch (L.kind) {
    case LayerKind::Copper: return L.plane ? "Plane" : "Signal";
    case LayerKind::Mask: return "Mask";
    case LayerKind::Paste: return "Paste";
    case LayerKind::Silk: return "Silk";
    case LayerKind::Fab: return "Assy";
    case LayerKind::Edge: return {};
    default: return "Mechanical";
  }
}

LayerId detailLayer(const Board& b, const std::string& name, bool bottomSide) {
  LayerId l = b.findLayer(name);
  if (l < 0 && b.copperCount() > 0) {
    if (name == "Top") l = b.topCopper();
    else if (name == "Bottom") l = b.bottomCopper();
  }
  if (l < 0 || !bottomSide) return l;
  return mirrorLayer(b, l);
}

const PadDetail* detailOn(const Board& b, const Padstack& ps, LayerId l, bool bottomSide) {
  if (l < 0 || l >= LayerId(b.layers.size())) return nullptr;
  for (auto& d : ps.details)
    if (!d.layer.empty() && detailLayer(b, d.layer, bottomSide) == l) return &d;
  if (smd(ps)) {
    // A planar pad is on the outer layers of its own side only.
    Side own = bottomSide ? Side::Bottom : Side::Top;
    if (layerSide(b, l) != own) return nullptr;
  }
  std::string cls = layerClassOf(b, l);
  if (cls.empty()) return nullptr;
  for (auto& d : ps.details)
    if (d.layer.empty() && d.layerClass == cls) return &d;
  return nullptr;
}

const PadDetail* primaryDetail(const Board& b, const Padstack& ps, bool bottomSide) {
  if (b.copperCount() == 0) return nullptr;
  if (auto* d = detailOn(b, ps, bottomSide ? b.bottomCopper() : b.topCopper(), bottomSide)) return d;
  for (LayerId l : b.copperLayers())
    if (auto* d = detailOn(b, ps, l, bottomSide)) return d;
  return nullptr;
}

PadShape detailShape(const PadDetail& d, bool mirror) {
  PadShape s;
  auto polygon = [&](Polyline pts) {
    s.kind = PadShapeKind::Polygon;
    BBox bb;
    for (auto& v : pts) {
      if (mirror) v.x = -v.x;
      bb.add(v);
      s.poly.push_back(v);
    }
    s.w = Coord(std::llround(bb.width()));
    s.h = Coord(std::llround(bb.height()));
  };
  switch (d.form) {
    case PadDetail::Form::Circle:
      s.kind = PadShapeKind::Circle;
      s.w = s.h = d.w;
      break;
    case PadDetail::Form::Oval: {
      Vec2 st = d.stretch;
      if (st.len() < 1) {
        s.kind = PadShapeKind::Circle;
        s.w = s.h = d.w;
      } else if (std::abs(st.x) < 1 || std::abs(st.y) < 1) {
        s.kind = PadShapeKind::Oval;
        s.w = d.w + Coord(std::llround(std::abs(st.x)));
        s.h = d.w + Coord(std::llround(std::abs(st.y)));
      } else {
        // At a slant: the capsule's outline.
        polygon(Shape::capsule(st * -0.5, st * 0.5, double(d.w) / 2).outline(1000));
      }
      break;
    }
    case PadDetail::Form::Rect: {
      std::uint8_t mask = d.custom ? d.corners : std::uint8_t(kCornersAll);
      if (d.handling == CornerHandling::None || d.handlingValue <= 0 || !mask) {
        s.kind = PadShapeKind::Rect;
        s.w = d.w;
        s.h = d.h;
      } else if (d.handling == CornerHandling::Rounding && mask == kCornersAll) {
        s.kind = PadShapeKind::RoundRect;
        s.w = d.w;
        s.h = d.h;
        Coord m = std::min(d.w, d.h);
        s.rratio = m > 0 ? std::min(0.5, double(d.handlingValue) / double(m)) : 0;
      } else {
        polygon(rectCornersOutline(d.w, d.h, d.handling, d.handlingValue, mask));
      }
      break;
    }
    case PadDetail::Form::Polygon: polygon(d.poly); break;
  }
  return s;
}

Vec2 detailOffset(const PadDetail& d, bool mirror, double angle) {
  Vec2 v = d.shift;
  if (mirror) v.x = -v.x;
  return rotateBoard(v, angle);
}

std::optional<Shape> padShapeOn(const Board& b, const Pad& p, LayerId l, double expand) {
  if (l < 0 || l >= LayerId(b.layers.size())) return std::nullopt;
  bool copper = b.layers[l].kind == LayerKind::Copper;
  if (copper && !p.onLayer(l)) return std::nullopt;
  if (p.padstack < 0 || p.padstack >= int(b.padstacks.size())) {
    if (copper) return p.shapeGeom(expand);
    return std::nullopt;
  }
  if (copper && p.uniform) return p.shapeGeom(expand);
  const Padstack& ps = b.padstacks[size_t(p.padstack)];
  const PadDetail* d = detailOn(b, ps, l, p.bottomSide);
  if (!d) return copper ? std::optional<Shape>(p.shapeGeom(expand)) : std::nullopt;
  const PadDetail* pd = primaryDetail(b, ps, p.bottomSide);
  Pad q;
  q.shape = detailShape(*d, p.mirror);
  q.angle = p.angle;
  Vec2 at = p.pos.v() + detailOffset(*d, p.mirror, p.angle) - (pd ? detailOffset(*pd, p.mirror, p.angle) : Vec2{});
  q.pos = Point(at);
  return q.shapeGeom(expand);
}

const ViaType* viaTypeOf(const Board& b, const Via& v) {
  if (!b.rules) return nullptr;
  for (auto& t : b.rules->viaTypes)
    if (t.diameter == v.diameter && t.drill == v.drill) return &t;
  return nullptr;
}

Coord viaDiameterOn(const Board& b, const Via& v, LayerId l) {
  if (l < 0 || l >= LayerId(b.layers.size())) return 0;
  const Layer& L = b.layers[l];
  if (L.kind == LayerKind::Copper) return v.onLayer(l) ? v.diameter : 0;
  if (b.copperCount() == 0) return 0;
  if (L.side == Side::Top && !v.onLayer(b.topCopper())) return 0;
  if (L.side == Side::Bottom && !v.onLayer(b.bottomCopper())) return 0;
  const ViaType* t = viaTypeOf(b, v);
  if (!t) return 0;
  std::string cls = layerClassOf(b, l);
  if (cls == "Signal" || cls == "Plane" || cls.empty()) return 0;
  return viaPadDiameter(*t, cls, L.name);
}

void updatePadUniform(Board& b) {
  for (Pad& p : b.pads) {
    p.uniform = true;
    if (p.padstack < 0 || p.padstack >= int(b.padstacks.size())) continue;
    const Padstack& ps = b.padstacks[size_t(p.padstack)];
    const PadDetail* pd = primaryDetail(b, ps, p.bottomSide);
    for (LayerId l : b.copperLayers())
      if (p.onLayer(l)) {
        const PadDetail* d = detailOn(b, ps, l, p.bottomSide);
        if (d && pd && d != pd && !sameGeometry(*d, *pd))
          p.uniform = false;
      }
  }
}

void syncPadsFromStacks(Board& b, const std::vector<Padstack>& before) {
  for (size_t pi = 0; pi < b.pads.size(); ++pi) {
    Pad& p = b.pads[pi];
    if (p.padstack < 0 || p.padstack >= int(b.padstacks.size())) continue;
    const Padstack& ps = b.padstacks[size_t(p.padstack)];
    const PadDetail* pd = primaryDetail(b, ps, p.bottomSide);
    if (pd && size_t(p.padstack) < before.size())
      if (const PadDetail* old = primaryDetail(b, before[size_t(p.padstack)], p.bottomSide)) {
        Vec2 delta = detailOffset(*pd, p.mirror, p.angle) - detailOffset(*old, p.mirror, p.angle);
        if (delta.len() > 0.5) p.pos = Point(p.pos.v() + delta);
      }
    if (pd) p.shape = detailShape(*pd, p.mirror);
    p.drill = ps.drill;
    p.drillH = ps.drillH;
    p.plated = ps.plated;
    LayerMask m = 0;
    for (LayerId l : b.copperLayers())
      if (detailOn(b, ps, l, p.bottomSide)) m |= LayerMask(1) << l;
    if (!m && b.copperCount() > 0)
      m = p.drill > 0 ? b.allCopperMask() : LayerMask(1) << (p.bottomSide ? b.bottomCopper() : b.topCopper());
    p.copper = m;
    if (p.component >= 0) {
      const Component& c = b.components[size_t(p.component)];
      p.localPos = Point(rotateBoard(p.pos.v() - c.pos.v(), -c.angle));
    }
  }
  updatePadUniform(b);
}

std::string uniquePadstackName(const std::vector<Padstack>& stacks, const std::string& base) {
  auto taken = [&](const std::string& n) {
    return std::ranges::any_of(stacks, [&](const Padstack& s) { return s.name == n; });
  };
  if (!base.empty() && !taken(base)) return base;
  for (int i = 2;; ++i) {
    std::string n = std::format("{}_{}", base, i);
    if (!taken(n)) return n;
  }
}

void buildPadstacksFromPads(Board& b, const std::vector<std::string>& names) {
  auto cu = b.copperLayers();
  bool planes = std::ranges::any_of(cu, [&](LayerId l) { return b.layers[l].plane; });
  // Stacks made here, by what they are (and the source's name for them).
  std::map<std::tuple<std::string, std::string>, int> made;
  auto key = [](const Padstack& ps) {
    std::string k = std::format("{}|{}|{}|{}|", int(ps.type), ps.drill, ps.drillH, ps.plated);
    for (auto& d : ps.details) {
      k += std::format("{};{};{};{};{};{};{};{};{};", d.layerClass, d.layer, int(d.form), d.w, d.h, d.stretch.x,
                       d.stretch.y, int(d.handling), d.handlingValue);
      for (auto& v : d.poly) k += std::format("{},{};", std::llround(v.x), std::llround(v.y));
    }
    return k;
  };
  for (size_t i = 0; i < b.pads.size(); ++i) {
    Pad& p = b.pads[i];
    if (p.padstack >= 0 && p.padstack < int(b.padstacks.size())) continue;
    bool mirror = p.component >= 0 && b.components[size_t(p.component)].side == Side::Bottom;
    bool all = cu.size() > 0 && (p.copper & b.allCopperMask()) == b.allCopperMask();
    bool through = p.drill > 0;
    // Layers by name are seen from the component side: a pad on the bottom copper only is a top pad mirrored.
    bool bottomSide = through ? mirror : (!cu.empty() && p.copper == (LayerMask(1) << b.bottomCopper()) && cu.size() > 1);
    Padstack ps;
    ps.type = through ? (p.plated || p.copper ? PadstackType::Through : PadstackType::MountHole) : PadstackType::SMD;
    ps.drill = p.drill;
    ps.drillH = p.drillH;
    ps.plated = p.plated;
    PadDetail d = detailFromShape(p.shape, mirror);
    if (through && all) {
      d.layerClass = "Signal";
      ps.details.push_back(d);
      if (planes) {
        // Plane layers get a round pad of the outer size, as TopoR's importer expects.
        PadDetail pl;
        pl.layerClass = "Plane";
        pl.form = PadDetail::Form::Circle;
        pl.w = pl.h = std::max(p.shape.w, p.shape.h);
        ps.details.push_back(pl);
      }
    } else {
      for (LayerId l : cu)
        if (p.onLayer(l)) {
          PadDetail n = d;
          n.layer = b.layers[bottomSide ? mirrorCopper(b, l) : l].name;
          ps.details.push_back(n);
        }
    }
    std::string hint = i < names.size() ? names[i] : std::string();
    auto k = std::make_tuple(hint, key(ps));
    auto it = made.find(k);
    if (it == made.end()) {
      std::string base = hint;
      if (base.empty()) {
        base = ps.type == PadstackType::MountHole ? "MH" : shapeName(d);
        if (through) base += "_D" + mmName(double(p.drill));
        else base += "_SMD";
      }
      ps.name = uniquePadstackName(b.padstacks, base);
      b.padstacks.push_back(std::move(ps));
      it = made.emplace(k, int(b.padstacks.size() - 1)).first;
    }
    p.padstack = it->second;
    p.mirror = mirror;
    p.bottomSide = bottomSide;
  }
  updatePadUniform(b);
}

void setPadstacks(Board& b, std::vector<Padstack> stacks, const std::vector<int>& origin) {
  std::vector<int> newIndex(b.padstacks.size(), -1);
  std::vector<Padstack> before(stacks.size());
  for (size_t i = 0; i < origin.size() && i < stacks.size(); ++i)
    if (origin[i] >= 0 && size_t(origin[i]) < b.padstacks.size()) {
      newIndex[size_t(origin[i])] = int(i);
      before[i] = b.padstacks[size_t(origin[i])];
    } else {
      before[i] = stacks[i];  // new: nothing moved
    }
  for (Pad& p : b.pads)
    if (p.padstack >= 0 && size_t(p.padstack) < newIndex.size()) p.padstack = newIndex[size_t(p.padstack)];
  b.padstacks = std::move(stacks);
  syncPadsFromStacks(b, before);
}

bool padstackHasDetails(const Board& b, const Padstack& ps, LayerKind kind) {
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind == kind && detailOn(b, ps, l, false)) return true;
  return false;
}

std::vector<int> padstackUse(const Board& b) {
  std::vector<int> n(b.padstacks.size(), 0);
  for (auto& p : b.pads)
    if (p.padstack >= 0 && size_t(p.padstack) < n.size()) ++n[size_t(p.padstack)];
  return n;
}

std::optional<PadDetail> offsetDetail(const PadDetail& d, Coord o) {
  PadDetail r = d;
  switch (d.form) {
    case PadDetail::Form::Circle:
    case PadDetail::Form::Oval:
      r.w = r.h = d.w + 2 * o;
      if (r.w <= 0) return std::nullopt;
      break;
    case PadDetail::Form::Rect:
      r.w = d.w + 2 * o;
      r.h = d.h + 2 * o;
      if (r.w <= 0 || r.h <= 0) return std::nullopt;
      if (d.handling == CornerHandling::Rounding) {
        r.handlingValue = std::max<Coord>(0, d.handlingValue + o);
      } else if (d.handling == CornerHandling::Chamfer) {
        // The cut moves out by o along its normal, the corner by o on both sides.
        r.handlingValue = std::max<Coord>(0, d.handlingValue + Coord(std::llround(double(o) * (2 - std::sqrt(2.0)))));
      }
      if (r.handling != CornerHandling::None && r.handlingValue == 0) r.handling = CornerHandling::None;
      break;
    case PadDetail::Form::Polygon: {
      auto p = offsetPolygon(d.poly, double(o));
      if (!p) return std::nullopt;
      r.poly = std::move(*p);
      BBox bb;
      for (auto& v : r.poly) bb.add(v);
      r.w = Coord(std::llround(bb.width()));
      r.h = Coord(std::llround(bb.height()));
      break;
    }
  }
  return r;
}

LayerDetailsResult createLayerDetails(const Board& b, std::vector<Padstack>& stacks, const std::vector<int>& which,
                                      LayerId target, Coord offset, bool replace) {
  LayerDetailsResult res;
  if (target < 0 || target >= LayerId(b.layers.size()) || b.copperCount() == 0) return res;
  Side side = b.layers[target].side;
  LayerId outer = side == Side::Bottom ? b.bottomCopper() : b.topCopper();
  for (int si : which) {
    if (si < 0 || size_t(si) >= stacks.size()) continue;
    Padstack& ps = stacks[size_t(si)];
    const PadDetail* src = detailOn(b, ps, outer, false);
    auto made = src ? offsetDetail(*src, offset) : std::nullopt;
    if (!made) {
      res.stacks.push_back({si, LayerDetailsResult::Kind::Failed});
      continue;
    }
    made->layer = b.layers[target].name;
    made->layerClass.clear();
    bool exists = detailOn(b, ps, target, false) != nullptr;
    if (exists && !replace) {
      res.stacks.push_back({si, LayerDetailsResult::Kind::Kept});
      continue;
    }
    auto own = std::ranges::find_if(ps.details, [&](const PadDetail& d) {
      return !d.layer.empty() && detailLayer(b, d.layer, false) == target;
    });
    if (own != ps.details.end()) *own = std::move(*made);
    else ps.details.push_back(std::move(*made));
    res.stacks.push_back({si, exists ? LayerDetailsResult::Kind::Replaced : LayerDetailsResult::Kind::Added});
  }
  return res;
}

void deleteLayerDetails(const Board& b, std::vector<Padstack>& stacks, const std::vector<int>& which, LayerId target) {
  if (target < 0 || target >= LayerId(b.layers.size())) return;
  std::string cls = layerClassOf(b, target);
  for (int si : which) {
    if (si < 0 || size_t(si) >= stacks.size()) continue;
    Padstack& ps = stacks[size_t(si)];
    std::erase_if(ps.details, [&](const PadDetail& d) { return !d.layer.empty() && detailLayer(b, d.layer, false) == target; });
    auto cl = std::ranges::find_if(ps.details, [&](const PadDetail& d) { return d.layer.empty() && d.layerClass == cls; });
    if (cl == ps.details.end()) continue;
    // The class detail stays on the class's other layers, each by name.
    PadDetail keep = *cl;
    ps.details.erase(cl);
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (l != target && layerClassOf(b, l) == cls && !detailOn(b, ps, l, false)) {
        if (smd(ps) && layerSide(b, l) != Side::Top) continue;
        PadDetail n = keep;
        n.layerClass.clear();
        n.layer = b.layers[l].name;
        ps.details.push_back(n);
      }
  }
}

}  // namespace xr
