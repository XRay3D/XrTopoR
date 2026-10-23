#include "core/Edit.h"

#include <algorithm>
#include <bit>
#include <cmath>
#include <map>
#include <numeric>

namespace xr::edit {

namespace {

constexpr double kJoinTol = 1000;  // 1 µm: track ends closer than this meet in one vertex

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

BBox bboxOf(const Board& b, const Fragment& f) {
  BBox bb;
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
  if (f.components.size() == 1 && f.tracks.empty() && f.vias.empty() && f.zones.empty())
    return b.components[f.components[0]].pos.v();
  BBox bb = bboxOf(b, f);
  return bb.valid() ? bb.center() : Vec2{};
}

bool hasLocked(const Board& b, const Fragment& f) {
  return std::ranges::any_of(f.components, [&](int i) { return b.components[i].locked; }) ||
         std::ranges::any_of(f.tracks, [&](int i) { return b.tracks[i].locked; }) ||
         std::ranges::any_of(f.vias, [&](int i) { return b.vias[i].locked; });
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
  return std::ranges::any_of(b.pads, [&](const Pad& pad) { return onPad(pad, p, layer, net); }) ||
         std::ranges::any_of(b.vias, [&](const Via& v) { return onVia(v, p, layer, net); });
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
    for (auto& poly : z.filled)
      for (auto& p : poly) p = m.apply(p);
    if (m.mirror) {
      z.layer = mirrorLayer(b, z.layer);
      std::ranges::reverse(z.outline);
      for (auto& poly : z.filled) std::ranges::reverse(poly);
    }
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
  if (std::ranges::any_of(ends, [&](auto e) { return b.tracks[e.first].locked; })) return false;
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

int straighten(Board& b, const std::vector<int>& tracks) {
  // Chains: tracks of one net and layer joined at vertices where exactly two of them meet.
  std::vector<int> parent(tracks.size());
  std::ranges::iota(parent, 0);
  auto find = [&](int i) {
    while (parent[i] != i) i = parent[i] = parent[parent[i]];
    return i;
  };
  for (size_t i = 0; i < tracks.size(); ++i)
    for (size_t k = i + 1; k < tracks.size(); ++k) {
      const Track &s = b.tracks[tracks[i]], &t = b.tracks[tracks[k]];
      if (s.net != t.net || s.layer != t.layer) continue;
      if (sameVertex(s.a.v(), t.a.v()) || sameVertex(s.a.v(), t.b.v()) || sameVertex(s.b.v(), t.a.v()) ||
          sameVertex(s.b.v(), t.b.v()))
        parent[find(int(i))] = find(int(k));
    }
  std::map<int, std::vector<int>> chains;
  for (size_t i = 0; i < tracks.size(); ++i) chains[find(int(i))].push_back(tracks[i]);
  std::vector<int> remove;
  std::vector<Track> made;
  for (auto& [root, chain] : chains) {
    // Ends of the chain: vertices used once within it.
    std::vector<Vec2> ends;
    bool branched = false;
    for (int ti : chain)
      for (int e : {0, 1}) {
        Vec2 p = endOf(b.tracks[ti], e);
        int uses = 0;
        for (int tj : chain) uses += sameVertex(b.tracks[tj].a.v(), p) + sameVertex(b.tracks[tj].b.v(), p);
        if (uses == 1) ends.push_back(p);
        branched |= uses > 2;
      }
    if (branched || ends.size() != 2) continue;
    if (chain.size() == 1 && !b.tracks[chain[0]].isArc()) continue;
    if (std::ranges::any_of(chain, [&](int ti) { return b.tracks[ti].locked; })) continue;
    Track t = b.tracks[chain[0]];
    t.a = Point(ends[0]);
    t.b = Point(ends[1]);
    t.mid.reset();
    made.push_back(t);
    remove.insert(remove.end(), chain.begin(), chain.end());
  }
  std::ranges::sort(remove, std::greater{});
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
  for (int ti : tracks)
    if (moved[ti]) b.tracks[ti].layer = layer;
  std::vector<Vec2> placed;
  int added = 0;
  for (auto [p, from, net] : ends) {
    // Already joined to the new layer by a via or a through pad?
    if (std::ranges::any_of(b.vias, [&](const Via& v) { return onVia(v, p, layer, net); })) continue;
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
    if (!needs || std::ranges::any_of(placed, [&](Vec2 q) { return sameVertex(p, q); })) continue;
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

int removeExcessVias(Board& b) {
  int n = 0;
  for (int vi = int(b.vias.size()) - 1; vi >= 0; --vi) {
    const Via& v = b.vias[vi];
    if (v.locked) continue;
    LayerMask used = 0;
    for (const Track& t : b.tracks)
      if (onVia(v, t.a.v(), t.layer, t.net) || onVia(v, t.b.v(), t.layer, t.net)) used |= LayerMask(1) << t.layer;
    for (const Pad& p : b.pads)
      if (p.net == v.net && p.shapeGeom().contains(v.pos.v())) used |= p.copper;
    for (const Zone& z : b.zones)
      if (z.net == v.net && v.onLayer(z.layer) && z.outline.size() >= 3 && pointInPolygon(v.pos.v(), z.outline))
        used |= LayerMask(1) << z.layer;
    for (LayerId l : b.copperLayers())
      if (b.layers[l].plane && b.layers[l].planeNet == v.net && v.onLayer(l)) used |= LayerMask(1) << l;
    used &= v.layers;
    if (std::popcount(used) > 1) continue;
    b.vias.erase(b.vias.begin() + vi);
    ++n;
  }
  return n;
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
