#include "core/Teardrops.h"

#include <algorithm>
#include <cmath>
#include <unordered_map>

#include "core/Edit.h"
#include "core/Padstack.h"
#include "core/SpatialIndex.h"

namespace xr {

namespace {

// Things by the point they are at on a layer: the ones within a few microns of a point.
struct AtPoint {
  double cell = 4000;
  std::unordered_map<uint64_t, std::vector<int>> cells;
  static uint64_t key(LayerId l, long long cx, long long cy) {
    return (uint64_t(uint16_t(l)) << 48) ^ (uint64_t(uint32_t(cx) & 0xffffff) << 24) ^ uint64_t(uint32_t(cy) & 0xffffff);
  }
  long long cellOf(double v) const { return std::llround(std::floor(v / cell)); }
  void add(LayerId l, Vec2 p, int what) { cells[key(l, cellOf(p.x), cellOf(p.y))].push_back(what); }
  // The things that may lie within `radius` of p (the caller measures).
  template <class F>
  void at(LayerId l, Vec2 p, double radius, F f) const {
    for (long long cx = cellOf(p.x - radius); cx <= cellOf(p.x + radius); ++cx)
      for (long long cy = cellOf(p.y - radius); cy <= cellOf(p.y + radius); ++cy)
        if (auto it = cells.find(key(l, cx, cy)); it != cells.end())
          for (int w : it->second) f(w);
  }
};

// The direction a piece leaves its end `e` by, into itself.
Vec2 inward(const Track& t, int e) {
  const Vec2 at = (e ? t.b : t.a).v();
  if (t.mid)
    if (const ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()); g.valid) {
      const Vec2 tangent = (at - g.center).normalized().perp() * (g.sweep > 0 ? 1.0 : -1.0);  // of the travel a -> b
      return e ? tangent * -1.0 : tangent;
    }
  return ((e ? t.a : t.b).v() - at).normalized();
}

}  // namespace

std::vector<Teardrop> teardrops(const Board& b, bool tight) {
  std::vector<Teardrop> out;
  const double tol = 2 * edit::kJoinTol;
  AtPoint pads, vias, ends;
  const LayerList copper = b.copperLayers();
  for (int i = 0; i < int(b.pads.size()); ++i)
    for (LayerId l : copper)
      if (b.pads[size_t(i)].onLayer(l)) pads.add(l, b.pads[size_t(i)].pos.v(), i);
  for (int i = 0; i < int(b.vias.size()); ++i)
    for (LayerId l : copper)
      if (b.vias[size_t(i)].onLayer(l)) vias.add(l, b.vias[size_t(i)].pos.v(), i);
  for (int i = 0; i < int(b.tracks.size()); ++i) {
    ends.add(b.tracks[size_t(i)].layer, b.tracks[size_t(i)].a.v(), i * 2);
    ends.add(b.tracks[size_t(i)].layer, b.tracks[size_t(i)].b.v(), i * 2 + 1);
  }
  const bool atCopper = b.settings.route.teardrops;
  for (int i = 0; i < int(b.tracks.size()); ++i) {
    const Track& t = b.tracks[size_t(i)];
    if (t.isArc() || t.width <= 0) continue;
    for (int e = 0; e < 2; ++e) {
      const Vec2 A = (e ? t.b : t.a).v(), far = (e ? t.a : t.b).v();
      const double len = (far - A).len();
      if (len <= 0) continue;
      // What the piece ends at: a pad (a round one counts), else a via, else a wider wire of its net.
      double R = 0;
      bool found = false;
      pads.at(t.layer, A, tol, [&](int pi) {
        const Pad& p = b.pads[size_t(pi)];
        if ((p.pos.v() - A).len() > tol) return;
        found = true;
        if (!atCopper) return;
        if (auto s = padShapeOn(b, p, t.layer); s && s->kind == Shape::Kind::Point && (s->a - A).len() <= tol) R = std::max(R, s->r);
      });
      if (!found)
        vias.at(t.layer, A, tol, [&](int vi) {
          const Via& v = b.vias[size_t(vi)];
          if ((v.pos.v() - A).len() > tol) return;
          found = true;
          if (atCopper) R = std::max(R, double(viaDiameterOn(b, v, t.layer)) / 2);
        });
      const double w = double(t.width);
      if (!found)
        ends.at(t.layer, A, tol, [&](int k) {
          const Track& o = b.tracks[size_t(k / 2)];
          if (k / 2 == i || o.net != t.net || o.width <= t.width) return;
          if (((k % 2 ? o.b : o.a).v() - A).len() <= tol) R = std::max(R, double(o.width) / 2);
        });
      const double r0 = R - w / 2;
      if (r0 <= 0) continue;
      const double nominal = std::min(2.4 * r0, R + 1.2 * w);
      if (nominal <= R) continue;
      const double L = std::min(nominal, len);
      if (L <= w / 2) continue;
      if (L < nominal && L <= R) {
        // The piece ends under the pad: a teardrop only when the wire goes straight on from there (a line along it,
        // an arc tangent to it), none when it turns.
        bool straightOn = false;
        int next = 0;
        ends.at(t.layer, far, tol, [&](int k) {
          const Track& o = b.tracks[size_t(k / 2)];
          if (k / 2 == i || o.net != t.net || ((k % 2 ? o.b : o.a).v() - far).len() > edit::kJoinTol) return;
          ++next;
          const Vec2 on = inward(o, k % 2), along = (far - A) * (1.0 / len);
          straightOn = along.dot(on) > 0 && std::abs(along.cross(on)) < 0.05;  // (within three degrees)
        });
        if (next != 1 || !straightOn) continue;
      }
      const double r = std::min(r0, 0.7 * L);
      const Vec2 u = (far - A) * (1.0 / len), n = u.perp();
      const double c = r / L, s = std::sqrt(1 - c * c);
      Teardrop d;
      d.net = t.net;
      d.layer = t.layer;
      d.track = i;
      d.end = e;
      d.width = t.width;
      // (the board's Y is down: counter-clockwise in TopoR's frame is the +perp side first here)
      d.quad = {A, A + (u * c + n * s) * r, A + u * L, A + (u * c - n * s) * r};
      out.push_back(d);
    }
  }
  if (tight || out.empty()) return out;
  // Not the ones too near the copper of other nets.
  SpatialIndex idx;
  idx.build(b, true, false);
  const double maxClr = double(b.maxClearance()), slack = 2000;
  std::erase_if(out, [&](const Teardrop& d) {
    const Shape s = d.shape();
    bool near = false;
    idx.query(s.bbox().inflated(maxClr), LayerMask(1) << d.layer, [&](ItemRef r) {
      const int net = itemNet(b, r);
      if (near || net == d.net) return;
      const double need = double(b.clearance(d.net, net, d.layer)) - slack;
      for (const Shape& o : itemShapes(b, r, 0, d.layer)) near = near || s.distance(o, need) < need;
    });
    return near;
  });
  return out;
}

}  // namespace xr
