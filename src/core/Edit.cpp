#include "core/Edit.h"

#include "core/DiffPairs.h"
#include "core/Runs.h"

#include <algorithm>
#include <bit>
#include <cmath>
#include <map>
#include <numeric>

#include "core/SpatialIndex.h"

namespace xr::edit {

namespace {

double normDeg(double a) {
  a = std::fmod(a, 360.0);
  return a < 0 ? a + 360.0 : a;
}

// The similarity taking (a, b) to (a2, b2), applied to p: arcs keep their shape when an end moves.
Vec2 similar(Vec2 p, Vec2 a, Vec2 b, Vec2 a2, Vec2 b2) {
  Vec2 d = b - a, d2 = b2 - a2;
  double l2 = d.len2();
  if (l2 < 1) return p + (a2 - a);
  double kr = d2.dot(d) / l2, ki = d.cross(d2) / l2;
  Vec2 q = p - a;
  return a2 + Vec2{q.x * kr - q.y * ki, q.x * ki + q.y * kr};
}

void stretch(Track& t, Vec2 a2, Vec2 b2) {
  if (t.mid) {
    Vec2 m = similar(t.mid->v(), t.a.v(), t.b.v(), a2, b2);
    if ((b2 - a2).len2() < 1) t.mid.reset();
    else t.mid = Point(m);
  }
  t.a = Point(a2);
  t.b = Point(b2);
}

void transform(Graphic& g, const Motion& m, bool rightAngle) {
  if (g.kind == GraphicKind::Rect && !rightAngle) {
    g.kind = GraphicKind::Poly;
    g.pts = {g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}};
  }
  g.a = m.apply(g.a);
  g.b = m.apply(g.b);
  g.m = m.apply(g.m);
  for (auto& p : g.pts) p = m.apply(p);
  if (m.mirror) g.mirrorArcs();
}

bool onPad(const Pad& p, Vec2 pt, LayerId l, int net) {
  return p.net == net && p.onLayer(l) && p.shapeGeom().contains(pt);
}

bool onVia(const Via& v, Vec2 pt, LayerId l, int net) {
  return v.net == net && v.onLayer(l) && (v.pos.v() - pt).len() <= v.diameter / 2.0;
}

bool sameVertex(Vec2 a, Vec2 b) { return (a - b).len() <= kJoinTol; }

Vec2 endOf(const Track& t, int end) { return end ? t.b.v() : t.a.v(); }

void setEnd(Track& t, int end, Vec2 p) {
  Vec2 a = end ? t.a.v() : p, b = end ? p : t.b.v();
  stretch(t, a, b);
}

Track connector(const Track& like, Vec2 from, Vec2 to, LayerId layer) {
  Track c;
  c.a = Point(from);
  c.b = Point(to);
  c.width = like.width;
  c.layer = layer;
  c.net = like.net;
  return c;
}

}  // namespace

Vec2 Motion::apply(Vec2 p) const {
  Vec2 q = p - pivot;
  if (mirror) q.x = -q.x;
  return pivot + rotateBoard(q, rotate) + shift;
}

LayerId mirrorLayer(const Board& b, LayerId l) {
  if (l < 0 || l >= LayerId(b.layers.size())) return l;
  const Layer& L = b.layers[l];
  if (L.kind == LayerKind::Copper) {
    LayerId m = b.copperByIndex(b.copperCount() - 1 - L.copperIndex);
    return m >= 0 ? m : l;
  }
  if (L.side == Side::None) return l;
  Side want = L.side == Side::Top ? Side::Bottom : Side::Top;
  for (LayerId i = 0; i < LayerId(b.layers.size()); ++i)
    if (b.layers[i].kind == L.kind && b.layers[i].side == want) return i;
  return l;
}

LayerMask mirrorMask(const Board& b, LayerMask m) {
  LayerMask out = 0;
  for (LayerId l = 0; l < LayerId(b.layers.size()) && l < 64; ++l)
    if ((m >> l) & 1) out |= LayerMask(1) << mirrorLayer(b, l);
  return out;
}

bool Fragment::touchesOutline(const Board& b) const {
  return r::any_of(details, [&](int i) { return b.isEdge(b.graphics[i].layer); });
}

BBox bboxOf(const Board& b, const Fragment& f) {
  BBox bb;
  for (int ki : f.keepouts)
    for (auto& s : b.keepouts[ki].shapes()) bb.add(s.bbox());
  for (int ti : f.texts)
    for (Vec2 p : b.textBox(b.texts[ti])) bb.add(p);
  for (int di : f.details)
    for (auto& s : itemShapes(b, {ItemType::Detail, di})) bb.add(s.bbox());
  for (int ci : f.components) {
    for (int pi : b.components[ci].pads) bb.add(b.pads[pi].shapeGeom().bbox());
    if (b.components[ci].pads.empty()) bb.add(b.components[ci].pos.v());
  }
  for (int ti : f.tracks) {
    bb.add(b.tracks[ti].a.v());
    bb.add(b.tracks[ti].b.v());
    if (b.tracks[ti].mid) bb.add(b.tracks[ti].mid->v());
  }
  for (int vi : f.vias) bb.add(Shape::circle(b.vias[vi].pos.v(), b.vias[vi].diameter / 2.0).bbox());
  for (int zi : f.zones)
    for (Vec2 p : b.zones[zi].outline) bb.add(p);
  return bb;
}

Vec2 pivotOf(const Board& b, const Fragment& f) {
  Fragment rest = f;
  rest.components.clear();
  if (f.components.size() == 1 && rest.empty()) return b.components[f.components[0]].pos.v();
  BBox bb = bboxOf(b, f);
  return bb.valid() ? bb.center() : Vec2{};
}

bool hasPoured(const Board& b, const Fragment& f) {
  return r::any_of(f.zones, [&](int zi) { return !b.zones[zi].filled.empty(); });
}

bool hasLocked(const Board& b, const Fragment& f) {
  // Keepouts, texts and drawings have no fixation in the model.
  return r::any_of(f.components, &Component::locked, of(b.components)) ||
         r::any_of(f.tracks, &Track::locked, of(b.tracks)) || r::any_of(f.vias, &Via::locked, of(b.vias));
}

std::vector<std::pair<int, int>> endsAt(const Board& b, Vec2 p, LayerId layer, int net) {
  std::vector<std::pair<int, int>> out;
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    const Track& t = b.tracks[ti];
    if (t.layer != layer || t.net != net) continue;
    for (int e : {0, 1})
      if (sameVertex(endOf(t, e), p)) out.push_back({ti, e});
  }
  return out;
}

bool anchoredAt(const Board& b, Vec2 p, LayerId layer, int net) {
  return r::any_of(b.pads, [&](const Pad& pad) { return onPad(pad, p, layer, net); }) ||
         r::any_of(b.vias, [&](const Via& v) { return onVia(v, p, layer, net); });
}

std::vector<char> attachedTo(const Board& b, const Shape& shape, LayerMask layers, int net) {
  std::vector<char> m(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    const Track& t = b.tracks[i];
    if (t.net != net || !((layers >> t.layer) & 1) || t.locked) continue;
    if (shape.contains(t.a.v()) || shape.contains(t.b.v())) m[i] = 1;
  }
  return m;
}

bool move(Board& b, const Fragment& f, const Motion& m) {
  if (f.empty() || hasLocked(b, f)) return false;
  std::vector<char> selT(b.tracks.size(), 0), selV(b.vias.size(), 0), movedPad(b.pads.size(), 0);
  for (int ti : f.tracks) selT[ti] = 1;
  // A wire passing over a moved pad or via (joined to it by overlap, with no end there) is split at
  // the pad so that the new vertex goes along.
  auto splitOver = [&](const Shape& s, Vec2 c, LayerMask layers, int net) {
    for (size_t ti = 0; ti < b.tracks.size(); ++ti) {
      const Track& t = b.tracks[ti];
      if ((ti < selT.size() && selT[ti]) || t.net != net || !((layers >> t.layer) & 1) || t.isArc()) continue;
      if (s.contains(t.a.v()) || s.contains(t.b.v())) continue;
      Vec2 q = closestPointOnSegment(c, t.a.v(), t.b.v());
      if (s.contains(q)) splitTrack(b, int(ti), q);
    }
  };
  for (int ci : f.components)
    for (int pi : b.components[ci].pads) {
      const Pad& p = b.pads[pi];
      splitOver(p.shapeGeom(), p.pos.v(), p.copper, p.net);
    }
  for (int vi : f.vias) {
    const Via& v = b.vias[vi];
    splitOver(Shape::circle(v.pos.v(), v.diameter / 2.0), v.pos.v(), v.layers, v.net);
  }
  const size_t nT = b.tracks.size();
  selT.resize(nT, 0);
  for (int vi : f.vias) selV[vi] = 1;
  for (int ci : f.components)
    for (int pi : b.components[ci].pads) movedPad[pi] = 1;
  // A moved pad or via keeps a track on `l` connected if it is still on that layer after the motion.
  auto stays = [&](LayerMask copper, LayerId l) { return !m.mirror || ((mirrorMask(b, copper) >> l) & 1); };

  // Does the end `p` of an unmoved track go with the fragment?
  auto carried = [&](const Track& t, Vec2 p) {
    for (int ci : f.components)
      for (int pi : b.components[ci].pads)
        if (onPad(b.pads[pi], p, t.layer, t.net)) return stays(b.pads[pi].copper, t.layer);
    for (int vi : f.vias)
      if (onVia(b.vias[vi], p, t.layer, t.net)) return stays(b.vias[vi].layers, t.layer);
    if (!m.mirror)
      for (int ti : f.tracks) {
        const Track& s = b.tracks[ti];
        if (s.layer == t.layer && s.net == t.net && (sameVertex(s.a.v(), p) || sameVertex(s.b.v(), p))) return true;
      }
    return false;
  };
  // Is the end `p` of a moved track held by something that does not move?
  auto held = [&](const Track& t, Vec2 p) {
    for (size_t pi = 0; pi < b.pads.size(); ++pi)
      if (!movedPad[pi] && onPad(b.pads[pi], p, t.layer, t.net)) return true;
    for (size_t vi = 0; vi < b.vias.size(); ++vi)
      if (!selV[vi] && onVia(b.vias[vi], p, t.layer, t.net)) return true;
    for (size_t ti = 0; ti < nT; ++ti) {
      const Track& o = b.tracks[ti];
      if (selT[ti] || o.layer != t.layer || o.net != t.net) continue;
      // Unlocked neighbours stretch along; locked ones, and all of them with a flip, stay.
      if ((o.locked || m.mirror) && (sameVertex(o.a.v(), p) || sameVertex(o.b.v(), p))) return true;
    }
    return false;
  };

  // Decide with the geometry before the motion, then apply.
  struct Follow {
    int track;
    bool a, b;
  };
  std::vector<Follow> follows;
  std::vector<Track> added;
  for (size_t ti = 0; ti < nT; ++ti) {
    const Track& t = b.tracks[ti];
    if (selT[ti]) {
      LayerId layer = m.mirror ? mirrorLayer(b, t.layer) : t.layer;
      for (Vec2 p : {t.a.v(), t.b.v()})
        if (held(t, p) && (layer == t.layer || anchoredAt(b, p, layer, t.net)))
          added.push_back(connector(t, m.apply(p), p, layer));
      continue;
    }
    bool ca = carried(t, t.a.v()), cb = carried(t, t.b.v());
    if (!ca && !cb) continue;
    if (t.locked) {
      // A fixed wire keeps its shape; a movable segment joins it to the moved object.
      if (ca) added.push_back(connector(t, m.apply(t.a.v()), t.a.v(), t.layer));
      if (cb) added.push_back(connector(t, m.apply(t.b.v()), t.b.v(), t.layer));
      continue;
    }
    follows.push_back({int(ti), ca, cb});
  }

  for (auto [ti, ca, cb] : follows) {
    Track& t = b.tracks[ti];
    if (ca && cb) {
      t.a = m.apply(t.a);
      t.b = m.apply(t.b);
      if (t.mid) t.mid = m.apply(*t.mid);
    } else {
      stretch(t, ca ? m.apply(t.a.v()) : t.a.v(), cb ? m.apply(t.b.v()) : t.b.v());
    }
  }
  // A zipped section whose conductors all go goes with them (its axis; a mirror takes it to the other side,
  // its positive conductor to the other side of the axis).
  for (int z = 0; z < int(b.zips.size()); ++z) {
    bool any = false, all = true;
    for (size_t ti = 0; ti < b.tracks.size(); ++ti)
      if (b.tracks[ti].zip == z) {
        any = true;
        all &= ti < selT.size() && selT[ti];
      }
    if (!any || !all) continue;
    ZippedWire& zw = b.zips[size_t(z)];
    for (Track& t : zw.axis) {
      t.a = m.apply(t.a);
      t.b = m.apply(t.b);
      if (t.mid) t.mid = m.apply(*t.mid);
      if (m.mirror) t.layer = mirrorLayer(b, t.layer);
    }
    if (m.mirror) {
      zw.layer = mirrorLayer(b, zw.layer);
      zw.pSide = -zw.pSide;
    }
  }
  for (int ti : f.tracks) {
    Track& t = b.tracks[ti];
    t.a = m.apply(t.a);
    t.b = m.apply(t.b);
    if (t.mid) t.mid = m.apply(*t.mid);
    if (m.mirror) t.layer = mirrorLayer(b, t.layer);
  }
  for (int vi : f.vias) {
    Via& v = b.vias[vi];
    v.pos = m.apply(v.pos);
    if (m.mirror) v.layers = mirrorMask(b, v.layers);
  }
  bool rightAngle = std::abs(std::remainder(m.rotate, 90.0)) < 1e-9;
  for (int ci : f.components) {
    Component& c = b.components[ci];
    c.pos = m.apply(c.pos);
    if (m.mirror) {
      c.angle = normDeg(m.rotate - c.angle);
      c.side = c.side == Side::Bottom ? Side::Top : Side::Bottom;
      for (int pi : c.pads) {
        Pad& p = b.pads[pi];
        p.localPos.x = -p.localPos.x;
        p.localAngle = normDeg(-p.localAngle);
        for (auto& q : p.shape.poly) q.x = -q.x;
        p.copper = mirrorMask(b, p.copper);
      }
    } else {
      c.angle = normDeg(c.angle + m.rotate);
    }
    for (auto& g : c.graphics) {
      transform(g, m, rightAngle);
      if (m.mirror) g.layer = mirrorLayer(b, g.layer);
    }
    b.updatePadPositions(ci);
  }
  for (int zi : f.zones) {
    Zone& z = b.zones[zi];
    for (auto& p : z.outline) p = m.apply(p);
    if (z.shape) transform(*z.shape, m, rightAngle);
    for (auto* polys : {&z.filled, &z.cutouts})
      for (auto& poly : *polys)
        for (auto& p : poly) p = m.apply(p);
    if (m.mirror) {
      z.layer = mirrorLayer(b, z.layer);
      r::reverse(z.outline);
      for (auto* polys : {&z.filled, &z.cutouts})
        for (auto& poly : *polys) r::reverse(poly);
    }
  }
  for (int ki : f.keepouts) {
    Keepout& k = b.keepouts[ki];
    for (auto& g : k.shape) transform(g, m, rightAngle);
    if (m.mirror) {
      k.layers = k.layers ? mirrorMask(b, k.layers) : 0;
      if (k.side != Side::None) k.side = k.side == Side::Top ? Side::Bottom : Side::Top;
    }
  }
  for (int ti : f.texts) {
    Text& t = b.texts[ti];
    t.pos = m.apply(t.pos);
    if (m.mirror) {
      t.angle = normDeg(m.rotate - t.angle);
      t.mirror = !t.mirror;
      t.layer = mirrorLayer(b, t.layer);
    } else {
      t.angle = normDeg(t.angle + m.rotate);
    }
  }
  for (int di : f.details) {
    Graphic& g = b.graphics[di];
    transform(g, m, rightAngle);
    if (m.mirror) g.layer = mirrorLayer(b, g.layer);
  }
  for (auto& t : added) b.tracks.push_back(t);
  return true;
}

bool moveVertex(Board& b, int track, int end, Vec2 to) {
  const Track& t = b.tracks[track];
  if (t.locked) return false;
  Vec2 p = endOf(t, end);
  if (anchoredAt(b, p, t.layer, t.net)) {
    // The pad or via keeps its end of the wire: a new bend joins it to the grabbed track.
    Track c = connector(t, p, to, t.layer);
    setEnd(b.tracks[track], end, to);
    b.tracks.push_back(c);
    return true;
  }
  auto ends = endsAt(b, p, t.layer, t.net);
  if (r::any_of(ends, &Track::locked, [&](auto e) -> auto& { return b.tracks[e.first]; })) return false;
  for (auto [ti, e] : ends) setEnd(b.tracks[ti], e, to);
  return true;
}

bool moveSegment(Board& b, int track, Vec2 d) {
  Fragment f;
  f.tracks = {track};
  Motion m;
  m.shift = d;
  return move(b, f, m);
}

int splitTrack(Board& b, int track, Vec2 at) {
  Track first = b.tracks[track];
  Track second = first;
  if (first.isArc()) {
    auto g = ArcGeom::fromThreePoints(first.a.v(), first.mid->v(), first.b.v());
    if (!g.valid) return -1;
    double ang = std::atan2(at.y - g.center.y, at.x - g.center.x);
    double da = g.sweep > 0 ? normalizeAngle(ang - g.startAngle) : -normalizeAngle(g.startAngle - ang);
    double u = std::clamp(da / g.sweep, 0.05, 0.95);
    Vec2 q = g.pointAt(u);
    first.b = Point(q);
    first.mid = Point(g.pointAt(u / 2));
    second.a = Point(q);
    second.mid = Point(g.pointAt((1 + u) / 2));
  } else {
    Vec2 q = closestPointOnSegment(at, first.a.v(), first.b.v());
    first.b = Point(q);
    second.a = Point(q);
  }
  b.tracks[track] = first;
  second.id = 0;  // a track of its own (the model's wires know a track by its id)
  b.tracks.push_back(second);
  return int(b.tracks.size()) - 1;
}

bool bendTrack(Board& b, int track, Vec2 to) {
  Track& t = b.tracks[track];
  if (t.locked) return false;
  // A mid point on the chord would make no arc.
  if (std::abs(orient(t.a.v(), t.b.v(), to)) < 1e-6 * (t.b.v() - t.a.v()).len2()) {
    t.mid.reset();
    return true;
  }
  t.mid = Point(to);
  return true;
}

std::vector<Vec2> figureVertices(const Graphic& g) {
  switch (g.kind) {
    case GraphicKind::Line:
    case GraphicKind::Arc: return {g.a, g.b};
    case GraphicKind::Circle: return {g.a, g.b};  // the centre, the rim
    case GraphicKind::Rect: return {g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}};
    case GraphicKind::Poly: return g.pts;
  }
  return {};
}

std::vector<Vec2> figureMiddles(const Graphic& g) {
  switch (g.kind) {
    case GraphicKind::Line: return {(g.a + g.b) * 0.5};
    case GraphicKind::Arc: return {g.m};
    case GraphicKind::Circle: return {};
    case GraphicKind::Rect:
    case GraphicKind::Poly: {
      // A closed figure's sides, an arc's middle on its arc.
      auto vs = figureVertices(g);
      std::vector<Vec2> out;
      for (size_t k = 0; vs.size() >= 3 && k < vs.size(); ++k) {
        Vec2 p = vs[k], q = vs[(k + 1) % vs.size()];
        double deg = g.arcOf(k);
        out.push_back(deg != 0 ? arcMiddle(p, q, deg) : (p + q) * 0.5);
      }
      return out;
    }
  }
  return {};
}

namespace {

// Vertex k of a drawing set to p; an arc keeps its shape, a rectangle stays one (its neighbouring corners follow),
// a circle's centre takes the circle along.
void setFigureVertex(Graphic& g, int k, Vec2 p) {
  switch (g.kind) {
    case GraphicKind::Line:
      (k ? g.b : g.a) = p;
      break;
    case GraphicKind::Arc: {
      Vec2 a = k ? g.a : p, b = k ? p : g.b;
      g.m = similar(g.m, g.a, g.b, a, b);
      g.a = a;
      g.b = b;
      break;
    }
    case GraphicKind::Circle:
      if (k == 0) g.b += p - g.a;
      (k ? g.b : g.a) = p;
      break;
    case GraphicKind::Rect:
      // Corners a, (b.x, a.y), b, (a.x, b.y).
      if (k == 0 || k == 3) g.a.x = p.x;
      else g.b.x = p.x;
      if (k == 0 || k == 1) g.a.y = p.y;
      else g.b.y = p.y;
      break;
    case GraphicKind::Poly:
      if (k >= 0 && k < int(g.pts.size())) g.pts[k] = p;
      break;
  }
}

}  // namespace

void moveFigureVertex(std::vector<Graphic>& list, int i, int k, Vec2 to) {
  auto vs = figureVertices(list[i]);
  if (k < 0 || k >= int(vs.size())) return;
  Vec2 p = vs[k];
  LayerId layer = list[i].layer;
  // A circle has no ends for anything to meet.
  bool joins = list[i].kind != GraphicKind::Circle;
  for (int j = 0; j < int(list.size()); ++j) {
    if (j == i) {
      setFigureVertex(list[j], k, to);
      continue;
    }
    if (!joins || list[j].layer != layer || list[j].kind == GraphicKind::Circle) continue;
    auto other = figureVertices(list[j]);
    for (int q = 0; q < int(other.size()); ++q)
      if (sameVertex(other[q], p)) setFigureVertex(list[j], q, to);
  }
}

void bendFigure(std::vector<Graphic>& list, int i, int k, Vec2 to) {
  Graphic& g = list[i];
  switch (g.kind) {
    case GraphicKind::Line: {
      Graphic second = g;
      g.b = to;
      second.a = to;
      list.push_back(second);
      break;
    }
    case GraphicKind::Arc:
      if (arcAngle(g.a, to, g.b) == 0) {
        g.kind = GraphicKind::Line;  // a mid point on the chord makes no arc
        g.m = {};
      } else {
        g.m = to;
      }
      break;
    case GraphicKind::Rect:
      // A side moves across itself: the rectangle stays one. Sides: a.y, b.x, b.y, a.x.
      if (k == 0) g.a.y = to.y;
      else if (k == 1) g.b.x = to.x;
      else if (k == 2) g.b.y = to.y;
      else if (k == 3) g.a.x = to.x;
      break;
    case GraphicKind::Poly: {
      int n = int(g.pts.size());
      if (k < 0 || k >= n) break;
      Vec2 p = g.pts[k], q = g.pts[(k + 1) % n];
      if (g.arcOf(k) != 0) {
        // An arc's side bends through the point (straight again on the chord).
        g.arcs[k] = arcAngle(p, to, q);
      } else {
        if (!g.arcs.empty()) {
          g.arcs.resize(n, 0);
          g.arcs.insert(g.arcs.begin() + k + 1, 0);
        }
        g.pts.insert(g.pts.begin() + k + 1, to);
      }
      break;
    }
    case GraphicKind::Circle: break;
  }
}

void moveFigureSide(std::vector<Graphic>& list, int i, Vec2 d) {
  if (list[i].kind != GraphicKind::Line && list[i].kind != GraphicKind::Arc) return;
  Vec2 a = list[i].a, b = list[i].b;
  // Both ends in turn: the arc's middle follows each similarity, a translation in all.
  moveFigureVertex(list, i, 0, a + d);
  moveFigureVertex(list, i, 1, b + d);
}

void tidyFigure(Graphic& g) {
  if (g.kind != GraphicKind::Poly) return;
  auto& p = g.pts;
  if (!g.arcs.empty()) g.arcs.resize(p.size(), 0);
  for (size_t k = 0; k < p.size() && p.size() > 3;)
    if (sameVertex(p[k], p[(k + 1) % p.size()])) {
      p.erase(p.begin() + k);
      if (!g.arcs.empty()) g.arcs.erase(g.arcs.begin() + k);
    } else {
      ++k;
    }
}

std::optional<Graphic> figureOf(const Board& b, ItemRef r, int part) {
  switch (r.type) {
    case ItemType::Detail: return b.graphics[r.index];
    case ItemType::Keepout: {
      const auto& sh = b.keepouts[r.index].shape;
      if (part >= 0 && part < int(sh.size())) return sh[part];
      return std::nullopt;
    }
    case ItemType::Zone: {
      const Zone& z = b.zones[r.index];
      if (z.shape) return z.shape;
      if (z.outline.size() < 3) return std::nullopt;
      Graphic g;
      g.kind = GraphicKind::Poly;
      g.layer = z.layer;
      g.pts = z.outline;
      g.filled = true;
      return g;
    }
    default: return std::nullopt;
  }
}

void editFigure(Board& b, ItemRef r, int part, const std::function<void(std::vector<Graphic>&, int)>& fn) {
  switch (r.type) {
    case ItemType::Detail: fn(b.graphics, r.index); break;
    case ItemType::Keepout: fn(b.keepouts[r.index].shape, part); break;
    case ItemType::Zone: {
      auto g = figureOf(b, r, part);
      if (!g) break;
      std::vector<Graphic> list{*g};
      fn(list, 0);
      b.zones[r.index].setShape(list[0]);
      break;
    }
    default: break;
  }
}

int straighten(Board& b, const std::vector<int>& tracks) {
  // The runs of the given tracks (core/Runs.h: one net, layer, width and fixation, ended at branch points, vias
  // and pads' centres): each one straight segment between its ends (a new track: no id of a piece it replaces).
  std::vector<char> chosen(b.tracks.size(), 0);
  for (int ti : tracks) chosen[size_t(ti)] = 1;
  std::vector<int> remove;
  std::vector<Track> made;
  for (const Run& r : buildRuns(b, {}, &chosen)) {
    if (r.closed || r.locked) continue;
    if (r.steps.size() == 1 && !b.tracks[size_t(r.steps[0].track)].isArc()) continue;
    const Track& last = b.tracks[size_t(r.steps.back().track)];
    Track t = b.tracks[size_t(r.steps.front().track)];
    t.a = r.start(b);
    t.b = r.steps.back().reversed ? last.a : last.b;
    t.mid.reset();
    t.id = 0;
    made.push_back(t);
    for (const ChainStep& st : r.steps) remove.push_back(st.track);
  }
  r::sort(remove, std::greater{});
  for (int ti : remove) b.tracks.erase(b.tracks.begin() + ti);
  for (auto& t : made) b.tracks.push_back(t);
  return int(made.size());
}

int changeLayer(Board& b, const std::vector<int>& tracks, LayerId layer) {
  std::vector<char> moved(b.tracks.size(), 0);
  struct End {
    Vec2 p;
    LayerId from;
    int net;
  };
  std::vector<End> ends;
  for (int ti : tracks) {
    Track& t = b.tracks[ti];
    if (t.layer == layer || t.locked) continue;
    moved[ti] = 1;
    ends.push_back({t.a.v(), t.layer, t.net});
    ends.push_back({t.b.v(), t.layer, t.net});
  }
  // A zipped section whose conductors all go goes with them: its axis to the layer, its conductors made again
  // by the pair's rule there.
  std::vector<std::pair<int, ZipEnds>> zipsMoved;
  for (int z = 0; z < int(b.zips.size()); ++z) {
    bool any = false, all = true;
    for (size_t ti = 0; ti < b.tracks.size(); ++ti)
      if (b.tracks[ti].zip == z) {
        any = true;
        all &= bool(moved[ti]);
      }
    if (any && all) zipsMoved.push_back({z, zipEnds(b, z)});
  }
  for (int ti : tracks)
    if (moved[ti]) b.tracks[ti].layer = layer;
  for (auto& [z, was] : zipsMoved) {
    ZippedWire& zw = b.zips[size_t(z)];
    zw.layer = layer;
    for (Track& t : zw.axis) t.layer = layer;
    Coord w = 0, gap = 0;
    if (b.pairRule(zw.pair, layer, w, gap)) {
      zw.condWidth = w;
      zw.gap = gap;
      for (Track& t : zw.axis) t.width = zw.width();
    }
    rebuildZip(b, z, was);
  }
  std::vector<Vec2> placed;
  int added = 0;
  for (auto [p, from, net] : ends) {
    // Already joined to the new layer by a via or a through pad?
    if (r::any_of(b.vias, [&](const Via& v) { return onVia(v, p, layer, net); })) continue;
    bool through = false, needs = false;
    for (const Pad& pad : b.pads) {
      if (pad.net != net || !pad.shapeGeom().contains(p)) continue;
      if (pad.onLayer(layer)) through = true;
      else needs = true;
    }
    if (through) continue;
    for (size_t ti = 0; ti < b.tracks.size() && !needs; ++ti) {
      const Track& o = b.tracks[ti];
      needs = !moved[ti] && o.net == net && o.layer != layer && (sameVertex(o.a.v(), p) || sameVertex(o.b.v(), p));
    }
    if (!needs || r::any_of(placed, [&](Vec2 q) { return sameVertex(p, q); })) continue;
    const NetClass& nc = b.classOf(net);
    Via v;
    v.pos = Point(p);
    v.net = net;
    v.diameter = nc.viaDiameter;
    v.drill = nc.viaDrill;
    v.layers = b.allCopperMask();
    b.vias.push_back(v);
    placed.push_back(p);
    ++added;
  }
  return added;
}

int unlink(Board& b, const Fragment& f) {
  std::vector<char> inFragment(b.tracks.size(), 0);
  for (int ti : f.tracks) inFragment[ti] = 1;
  auto attached = [&](const Track& t, Vec2 p) {
    for (int ci : f.components)
      for (int pi : b.components[ci].pads)
        if (onPad(b.pads[pi], p, t.layer, t.net)) return true;
    for (int vi : f.vias)
      if (onVia(b.vias[vi], p, t.layer, t.net)) return true;
    return false;
  };
  int n = 0;
  for (int ti = int(b.tracks.size()) - 1; ti >= 0; --ti) {
    const Track& t = b.tracks[ti];
    if (inFragment[ti] || t.locked || !(attached(t, t.a.v()) || attached(t, t.b.v()))) continue;
    b.tracks.erase(b.tracks.begin() + ti);
    ++n;
  }
  return n;
}

void changeNet(Board& b, const Fragment& f, const std::vector<int>& pads, int net) {
  for (int ti : f.tracks) b.tracks[ti].net = net;
  for (int vi : f.vias) b.vias[vi].net = net;
  for (int zi : f.zones) b.zones[zi].net = net;
  for (int pi : pads) b.pads[pi].net = net;
}

LayerMask viaHeldBy(const Board& b, const Via& v) {
  LayerMask used = 0;
  for (const Pad& p : b.pads)
    if (p.net == v.net && p.shapeGeom().contains(v.pos.v())) used |= p.copper;
  for (const Zone& z : b.zones)
    if (z.net == v.net && v.onLayer(z.layer) && z.outline.size() >= 3 && pointInPolygon(v.pos.v(), z.outline))
      used |= LayerMask(1) << z.layer;
  for (LayerId l : b.copperLayers())
    if (b.layers[l].plane && b.layers[l].planeNet == v.net && v.onLayer(l)) used |= LayerMask(1) << l;
  return used & v.layers;
}

LayerMask viaTrackLayers(const Board& b, const Via& v) {
  LayerMask used = 0;
  for (const Track& t : b.tracks)
    if (onVia(v, t.a.v(), t.layer, t.net) || onVia(v, t.b.v(), t.layer, t.net)) used |= LayerMask(1) << t.layer;
  return used & v.layers;
}

int removeExcessVias(Board& b) {
  int n = 0;
  for (int vi = int(b.vias.size()) - 1; vi >= 0; --vi) {
    const Via& v = b.vias[vi];
    if (v.locked || b.flexFixed(v.net)) continue;  // a flexibly fixed net keeps its vias
    const LayerMask used = viaTrackLayers(b, v) | viaHeldBy(b, v);
    if (std::popcount(used) > 1) continue;
    b.vias.erase(b.vias.begin() + vi);
    ++n;
  }
  return n;
}

Clip copy(const Board& b, const Fragment& f) {
  Clip c;
  for (int ti : f.tracks) c.tracks.push_back(b.tracks[ti]);
  for (int vi : f.vias) c.vias.push_back(b.vias[vi]);
  for (int zi : f.zones) c.zones.push_back(b.zones[zi]);
  for (int ki : f.keepouts) c.keepouts.push_back(b.keepouts[ki]);
  for (int ti : f.texts) c.texts.push_back(b.texts[ti]);
  for (int di : f.details) c.details.push_back(b.graphics[di]);
  for (auto& n : b.nets) c.nets.push_back(n.name);
  for (auto& l : b.layers) c.layers.push_back(l.name);
  Fragment g = f;
  g.components.clear();
  BBox bb = bboxOf(b, g);
  c.origin = bb.valid() ? bb.center() : Vec2{};
  return c;
}

Fragment paste(Board& b, const Clip& c, Vec2 at) {
  auto net = [&](int n) { return n >= 0 && n < int(c.nets.size()) ? b.findNet(c.nets[size_t(n)]) : kNoNet; };
  auto layer = [&](LayerId l) { return l >= 0 && l < LayerId(c.layers.size()) ? b.findLayer(c.layers[size_t(l)]) : -1; };
  Motion m;
  m.shift = at - c.origin;
  Fragment f;
  for (Track t : c.tracks) {
    t.layer = layer(t.layer);
    if (t.layer < 0) continue;
    t.net = net(t.net);
    t.locked = false;
    t.id = 0;  // new copper: no id of the copied one's
    t.zip = -1;
    t.a = m.apply(t.a);
    t.b = m.apply(t.b);
    if (t.mid) t.mid = m.apply(*t.mid);
    f.tracks.push_back(int(b.tracks.size()));
    b.tracks.push_back(t);
  }
  for (Via v : c.vias) {
    LayerMask lm = 0;
    for (LayerId l = 0; l < 64; ++l)
      if ((v.layers >> l) & 1)
        if (LayerId k = layer(l); k >= 0) lm |= LayerMask(1) << k;
    if (!lm) continue;
    v.layers = lm;
    v.net = net(v.net);
    v.locked = false;
    v.id = 0;
    v.pos = m.apply(v.pos);
    f.vias.push_back(int(b.vias.size()));
    b.vias.push_back(v);
  }
  for (Zone z : c.zones) {
    z.layer = layer(z.layer);
    if (z.layer < 0) continue;
    z.net = net(z.net);
    for (auto& p : z.outline) p = m.apply(p);
    if (z.shape) transform(*z.shape, m, true);
    for (auto& poly : z.filled)
      for (auto& p : poly) p = m.apply(p);
    for (auto& poly : z.cutouts)
      for (auto& p : poly) p = m.apply(p);
    f.zones.push_back(int(b.zones.size()));
    b.zones.push_back(std::move(z));
  }
  for (Keepout k : c.keepouts) {
    LayerMask lm = 0;
    for (LayerId l = 0; l < 64; ++l)
      if ((k.layers >> l) & 1)
        if (LayerId n = layer(l); n >= 0) lm |= LayerMask(1) << n;
    if (k.layers && !lm) continue;
    k.layers = lm;
    for (auto& g : k.shape) transform(g, m, true);
    f.keepouts.push_back(int(b.keepouts.size()));
    b.keepouts.push_back(std::move(k));
  }
  for (Text t : c.texts) {
    t.layer = layer(t.layer);
    if (t.layer < 0) continue;
    if (t.style >= int(b.textStyles.size())) t.style = 0;
    t.pos = m.apply(t.pos);
    f.texts.push_back(int(b.texts.size()));
    b.texts.push_back(std::move(t));
  }
  for (Graphic g : c.details) {
    g.layer = layer(g.layer);
    if (g.layer < 0) continue;
    transform(g, m, true);
    f.details.push_back(int(b.graphics.size()));
    b.graphics.push_back(std::move(g));
  }
  return f;
}

void stretchEnds(Track& t, Vec2 a2, Vec2 b2) { stretch(t, a2, b2); }

void erase(Board& b, const Fragment& f) {
  auto drop = [](auto& list, std::vector<int> idx) {
    r::sort(idx, std::greater{});
    auto [first, last] = r::unique(idx);
    idx.erase(first, last);
    for (int i : idx) list.erase(list.begin() + i);
  };
  drop(b.tracks, f.tracks);
  drop(b.vias, f.vias);
  drop(b.zones, f.zones);
  drop(b.keepouts, f.keepouts);
  drop(b.texts, f.texts);
  drop(b.graphics, f.details);
  // A zipped section with no conductor left goes too.
  for (int z = int(b.zips.size()) - 1; z >= 0; --z)
    if (r::none_of(b.tracks, [&](const Track& t) { return t.zip == z; })) b.removeZip(z);
}

std::vector<int> removeDegenerate(Board& b) {
  std::vector<int> map(b.tracks.size(), -1);
  std::vector<Track> kept;
  kept.reserve(b.tracks.size());
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    Track& t = b.tracks[i];
    if (t.a == t.b) continue;
    if (t.mid && !ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).valid) t.mid.reset();
    map[i] = int(kept.size());
    kept.push_back(t);
  }
  b.tracks = std::move(kept);
  return map;
}

}  // namespace xr::edit
