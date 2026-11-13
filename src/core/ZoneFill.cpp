#include "core/ZoneFill.h"

#include <boost/geometry.hpp>
#include <boost/geometry/geometries/multi_polygon.hpp>
#include <boost/geometry/geometries/point_xy.hpp>
#include <boost/geometry/geometries/polygon.hpp>

#include <algorithm>
#include <map>
#include <cstdio>
#include <numeric>
#include <cstdlib>

#include "core/SpatialIndex.h"

namespace bg = boost::geometry;

namespace xr {

namespace {

using BPt = bg::model::d2::point_xy<double>;
using BPoly = bg::model::polygon<BPt>;  // clockwise outer, closed
using BMulti = bg::model::multi_polygon<BPoly>;

BPoly toPoly(const Polyline& pl) {
  BPoly p;
  for (auto& v : pl) p.outer().push_back({v.x, v.y});
  if (!pl.empty()) p.outer().push_back({pl.front().x, pl.front().y});
  bg::correct(p);
  return p;
}

BMulti toMulti(const Polyline& pl) {
  BMulti m;
  if (pl.size() >= 3) m.push_back(toPoly(pl));
  return m;
}

// Union of many polygons by pairwise merging (much faster than folding one by one).
BMulti unionAll(std::vector<BMulti> parts) {
  if (parts.empty()) return {};
  while (parts.size() > 1) {
    std::vector<BMulti> next;
    for (size_t i = 0; i + 1 < parts.size(); i += 2) {
      BMulti u;
      bg::union_(parts[i], parts[i + 1], u);
      next.push_back(std::move(u));
    }
    if (parts.size() % 2) next.push_back(std::move(parts.back()));
    parts = std::move(next);
  }
  return std::move(parts.front());
}

BMulti grow(const BMulti& m, double d) {
  if (m.empty() || d == 0) return m;
  BMulti out;
  bg::strategy::buffer::distance_symmetric<double> dist(d);
  bg::strategy::buffer::join_round join(16);
  bg::strategy::buffer::end_round end(16);
  bg::strategy::buffer::point_circle circle(16);
  bg::strategy::buffer::side_straight side;
  bg::buffer(m, out, dist, side, join, end, circle);
  return out;
}

Polyline ringToPolyline(const bg::model::ring<BPt>& r) {
  Polyline pl;
  for (size_t i = 0; i + 1 < r.size(); ++i) pl.push_back({r[i].x(), r[i].y()});
  return pl;
}

}  // namespace

void clearZoneFills(Board& b) {
  for (auto& z : b.zones) z.filled.clear();
}

namespace {

// The rings of a polygon fractured into one contour: the seams (an edge walked there and back) go, what is left
// joins up into closed rings.
std::vector<Polyline> unfracture(const Polyline& pl) {
  const size_t n = pl.size();
  using Key = std::pair<std::pair<double, double>, std::pair<double, double>>;
  auto key = [](Vec2 a, Vec2 b) { return Key{{a.x, a.y}, {b.x, b.y}}; };
  std::vector<bool> kept(n, true);
  std::map<Key, std::vector<size_t>> open;  // edges whose way back is not met yet
  for (size_t i = 0; i < n; ++i) {
    const Vec2 a = pl[i], b = pl[(i + 1) % n];
    if (a == b) {
      kept[i] = false;
      continue;
    }
    if (auto back = open.find(key(b, a)); back != open.end() && !back->second.empty()) {
      kept[i] = kept[back->second.back()] = false;
      back->second.pop_back();
    } else {
      open[key(a, b)].push_back(i);
    }
  }
  std::map<std::pair<double, double>, std::vector<size_t>> from;  // kept edges by their start
  for (size_t i = n; i-- > 0;)
    if (kept[i]) from[{pl[i].x, pl[i].y}].push_back(i);
  std::vector<Polyline> rings;
  std::vector<bool> used(n, false);
  for (size_t s = 0; s < n; ++s) {
    if (!kept[s] || used[s]) continue;
    Polyline ring;
    for (size_t e = s; !used[e];) {
      used[e] = true;
      ring.push_back(pl[e]);
      const Vec2 end = pl[(e + 1) % n];
      const size_t next = (e + 1) % n;
      if (kept[next] && !used[next]) {
        e = next;
        continue;
      }
      auto& out = from[{end.x, end.y}];
      std::erase_if(out, [&](size_t k) { return used[k]; });
      if (out.empty()) break;
      e = out.back();
    }
    if (ring.size() >= 3) rings.push_back(std::move(ring));
  }
  return rings;
}

// A zone's pour as polygons with holes (its fill is kept fractured: one contour a piece, the holes on seams).
BMulti copperOf(const Zone& z) {
  std::vector<BMulti> pieces;
  for (const Polyline& f : z.filled) {
    std::vector<Polyline> rings = unfracture(f);
    if (rings.empty()) continue;
    // The largest ring is an outer one; those turning the other way are holes.
    const double sign = polygonArea(*r::max_element(rings, {}, [](const Polyline& p) { return std::abs(polygonArea(p)); }));
    std::vector<BMulti> outers, holes;
    for (const Polyline& ring : rings) (polygonArea(ring) * sign > 0 ? outers : holes).push_back(toMulti(ring));
    BMulti piece = unionAll(std::move(outers));
    if (!holes.empty()) {
      BMulti cut;
      bg::difference(piece, unionAll(std::move(holes)), cut);
      piece = std::move(cut);
    }
    pieces.push_back(std::move(piece));
  }
  return unionAll(std::move(pieces));
}

}  // namespace

std::vector<Island> zoneIslands(const Zone& z) {
  std::vector<Island> out;
  for (const BPoly& p : copperOf(z)) {
    Island isl{ringToPolyline(p.outer()), {}};
    if (isl.outer.size() < 3) continue;
    for (auto& h : p.inners())
      if (h.size() >= 4) isl.holes.push_back(ringToPolyline(h));
    out.push_back(std::move(isl));
  }
  return out;
}

void addPlaneZones(Board& b) {
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    const Layer& L = b.layers[l];
    if (!L.plane || L.planeNet == kNoNet) continue;
    if (r::any_of(b.zones, [&](const Zone& z) { return z.layer == l && z.net == L.planeNet; })) continue;
    Zone z;
    z.layer = l;
    z.net = L.planeNet;
    z.name = L.name;
    z.priority = -1000;  // anything else poured on the layer wins
    if (!b.outline.empty()) {
      z.outline = b.outline.front();
    } else {
      BBox bb = b.bbox();
      z.outline = {{bb.minX, bb.minY}, {bb.maxX, bb.minY}, {bb.maxX, bb.maxY}, {bb.minX, bb.maxY}};
    }
    b.zones.push_back(std::move(z));
  }
}

// How far a thermal's bridge goes into the pour past the barrier.
constexpr double kSpokeInto = 50000;

ZoneFillStats fillZones(Board& b, const ZoneFillOptions& opt) {
  ZoneFillStats st;
  auto selected = [&](int zi) { return opt.only.empty() || r::contains(opt.only, zi); };
  for (int zi = 0; zi < int(b.zones.size()); ++zi)
    if (selected(zi)) b.zones[zi].filled.clear();
  SpatialIndex idx;
  idx.build(b);

  BMulti board;
  for (size_t i = 0; i < b.outline.size(); ++i) {
    BMulti loop = toMulti(b.outline[i]);
    BMulti tmp;
    if (i == 0) board = loop;
    else bg::difference(board, loop, tmp), board = std::move(tmp);
  }
  // Keep the copper away from the board edge: by the rule, or by the area's own clearance.
  std::map<Coord, BMulti> inset;
  auto boardInset = [&](Coord c) -> const BMulti& {
    auto [it, fresh] = inset.try_emplace(c, board);
    if (fresh && !board.empty() && c > 0) it->second = grow(board, -double(c) - opt.arcTolerance);
    return it->second;
  };

  // Higher priority first: its fill is an obstacle for lower-priority zones of other nets.
  std::vector<int> order(b.zones.size());
  r::iota(order, 0);
  // ... and of equal priority the smaller first: an area inside another is poured before the one around it, which
  // then keeps off it (in the file's order the outer one could come first and was poured over the inner ones).
  r::stable_sort(order, [&](int i, int j) {
    if (b.zones[i].priority != b.zones[j].priority) return b.zones[i].priority > b.zones[j].priority;
    return std::abs(polygonArea(b.zones[i].outline)) < std::abs(polygonArea(b.zones[j].outline));
  });
  for (int zi : order) {
    Zone& z = b.zones[zi];
    if (z.outline.size() < 3 || !selected(zi)) continue;
    ++st.zones;
    double zoneClr = double(b.zoneClearance(z));
    BMulti area = toMulti(z.outline);
    if (const BMulti& inside = boardInset(z.useClearance ? z.clearance : b.edgeClearance); !inside.empty()) {
      BMulti tmp;
      bg::intersection(area, inside, tmp);
      area = std::move(tmp);
    }
    if (area.empty()) continue;
    BBox zb;
    for (auto& p : z.outline) zb.add(p);
    double maxClr = std::max(zoneClr, double(b.maxClearance()));

    std::vector<BMulti> holes;
    struct Relief {
      Vec2 c;
      Shape copper;
      double angle;  // of the spokes, degrees
      const ZoneThermal* thermal;
    };
    std::vector<Relief> reliefs;
    idx.query(zb.inflated(maxClr), LayerMask(1) << z.layer, [&](ItemRef r) {
      if (r.type == ItemType::Zone) return;
      int net = itemNet(b, r);
      bool same = net == z.net && net != kNoNet;
      if (same) {
        // Same-net pads and vias as the zone says: a thermal relief, solid, or kept apart; same-net tracks merge.
        if (r.type != ItemType::Pad && r.type != ItemType::Via) return;
        const bool pad = r.type == ItemType::Pad;
        const ZoneThermal& th = pad ? z.pads : z.vias;
        if (opt.thermals && th.connection == PadConnection::Thermal) {
          if (pad) reliefs.push_back({b.pads[r.index].pos.v(), b.pads[r.index].shapeGeom(), b.pads[r.index].angle + th.angle, &th});
          else reliefs.push_back({b.vias[r.index].pos.v(), Shape::circle(b.vias[r.index].pos.v(), b.vias[r.index].diameter / 2.0), th.angle, &th});
        }
        if (th.connection != PadConnection::None) return;
      }
      // Outlines are inscribed polygons: grow by the chord error so the true clearance holds.
      double clr = double(b.zoneClearance(z, net)) + opt.arcTolerance;
      for (auto& s : itemShapes(b, r)) holes.push_back(toMulti(s.inflated(clr).outline(opt.arcTolerance)));
    });
    // Already poured zones (higher priority) of other nets on this layer.
    for (int oz : order) {
      if (oz == zi) break;
      const Zone& o = b.zones[oz];
      if (o.layer != z.layer || o.net == z.net) continue;
      double clr = double(b.zoneClearance(z, o.net)) + opt.arcTolerance;
      // (The pour as polygons, grown: a fill is kept as one contour with its holes on seams, and that contour
      // inflated as a shape crossed itself at every seam — the union of the obstacles came out invalid and the
      // difference cut nothing where it counted: 59 tracks and pads of other nets under the pours of RMT19M_A68U.)
      if (BMulti other = copperOf(o); !other.empty()) holes.push_back(grow(other, clr));
    }
    // Non-plated holes without copper are keep-outs on every layer.
    for (auto& p : b.pads)
      if (p.drill > 0 && !p.copper && zb.inflated(maxClr).contains(p.pos.v()))
        holes.push_back(toMulti(Shape::circle(p.pos.v(), p.drill / 2.0 + zoneClr + opt.arcTolerance).outline(opt.arcTolerance)));
    // The area's cutouts and the routing keepouts of its layer stay unpoured (a keepout line cuts the
    // pour in two).
    for (auto& c : z.cutouts)
      if (c.size() >= 3) holes.push_back(toMulti(c));
    for (auto& k : b.keepouts) {
      if (!k.onLayer(z.layer) || !k.wires) continue;
      for (auto& s : k.shapes()) {
        if (s.kind == Shape::Kind::Polygon) holes.push_back(toMulti(s.poly));  // may be concave: taken as drawn
        else holes.push_back(toMulti(s.inflated(s.kind == Shape::Kind::Segment ? zoneClr / 2 : 0).outline(opt.arcTolerance)));
      }
    }
    // Thermal reliefs: the pad with its barrier is a hole of the pour — the pad's own copper is not poured over —,
    // and the bridges are laid across it afterwards, each a rectangle from the pad's centre to the pour (below).
    // P-CAD keeps a pour so: a cutout over the pad and its barrier, and the spokes.
    const size_t plain = holes.size();  // (the holes before these: what a bridge must not run into)
    for (auto& [c, s, angle, th] : reliefs) {
      const double gap = double(th->gap > 0 ? th->gap : opt.thermalGap);
      holes.push_back(toMulti(s.inflated(gap).outline(opt.arcTolerance)));
    }
    BMulti foreign = unionAll(std::vector<BMulti>(holes.begin(), holes.begin() + long(plain)));
    if (std::getenv("XR_DEBUG_FILL")) {
      int invalid = 0;
      for (auto& h : holes) {
        std::string why;
        if (!bg::is_valid(h, why)) {
          if (invalid++ < 3) std::fprintf(stderr, "invalid hole: %s\n", why.c_str());
        }
      }
      std::fprintf(stderr, "zone layer %d: %zu holes, %d invalid\n", z.layer, holes.size(), invalid);
    }
    BMulti obstacles = unionAll(std::move(holes));
    if (std::getenv("XR_DEBUG_FILL")) {
      std::string why;
      std::fprintf(stderr, "union valid: %d (%s), %zu polygons\n", int(bg::is_valid(obstacles, why)), why.c_str(), obstacles.size());
    }
    BMulti fill;
    bg::difference(area, obstacles, fill);
    // Opening removes necks narrower than minWidth.
    double minW = double(z.minWidth > 0 ? z.minWidth : opt.minWidth);
    if (std::getenv("XR_DEBUG_FILL"))
      std::fprintf(stderr, "zone %d: net %d layer %d clr %.3f minW %.3f gap %.3f spoke %.3f conn %d priority %d cutouts %zu; %zu polygons after difference, area %.1f mm2\n",
                   zi, z.net, int(z.layer), zoneClr / 1e6, minW / 1e6, double(z.pads.gap) / 1e6, double(z.pads.spoke) / 1e6, int(z.pads.connection), z.priority, z.cutouts.size(),
                   fill.size(), bg::area(fill) / 1e12);
    // Polygon by polygon: the pieces are disjoint, so the opening of the whole is the union of the
    // openings, and boost's buffer of one big multipolygon with thousands of holes went wrong (a KiCad
    // GND pour of 17690 mm² came back as 5018 mm² in 401 pieces). A piece whose opening loses more
    // than its rim can explain is kept as it was.
    if (minW > 0) {
      BMulti opened;
      for (auto& poly : fill) {
        BMulti one{poly};
        BMulti eroded = grow(one, -minW / 2);
        BMulti back = grow(eroded, minW / 2 - 1);
        double a0 = std::abs(bg::area(one)), a1 = std::abs(bg::area(back));
        double rim = bg::perimeter(one) * minW;  // the most an opening can honestly take away
        if (!bg::is_valid(back) || a1 > a0 * 1.001 + 1e6 || a0 - a1 > rim + 1e6) {
          if (std::getenv("XR_DEBUG_FILL"))
            std::fprintf(stderr, "  opening rejected for a piece of %.3f mm2 -> %.3f mm2 (rim %.3f)\n", a0 / 1e12, a1 / 1e12, rim / 1e12);
          back = std::move(one);
        }
        for (auto& q : back) opened.push_back(std::move(q));
      }
      fill = std::move(opened);
    }
    if (std::getenv("XR_DEBUG_FILL")) std::fprintf(stderr, "  after opening: %zu polygons, area %.1f mm2\n", fill.size(), bg::area(fill) / 1e12);

    // The bridges: from the pad's centre along the thermal's four directions to a hair past the barrier. One is
    // laid when it ends in the pour and crosses nothing that is cut out of it — a bridge to nowhere (the pour does
    // not come up to the barrier on that side) or across another net's clearance is not.
    struct Bridge {
      Polyline rect;
      Vec2 lands;  // where it meets the pour
    };
    std::vector<Bridge> bridges;
    for (auto& [c, s, angle, th] : reliefs) {
      const double gap = double(th->gap > 0 ? th->gap : opt.thermalGap), spoke = double(th->spoke > 0 ? th->spoke : opt.spokeWidth);
      const Shape ring = s.inflated(gap);
      const double ang = -degToRad(angle);
      for (int k = 0; k < 4; ++k) {
        const Vec2 u = Vec2(1, 0).rotated(ang + k * kPi / 2), n = u.perp() * (spoke / 2);
        const double out = ring.rayExit(c, u);
        if (out <= 0) continue;
        const Vec2 end = c + u * (out + kSpokeInto), lands = c + u * (out + kSpokeInto / 2);
        Polyline rect{c - n, end - n, end + n, c + n};
        if (!bg::covered_by(BPt(lands.x, lands.y), fill)) continue;
        BMulti hit;
        bg::intersection(toMulti(rect), foreign, hit);
        if (bg::area(hit) > 1e6) continue;  // (more than a square micron of it)
        bridges.push_back({std::move(rect), lands});
      }
    }
    for (auto& poly : fill) {
      Polyline outer = ringToPolyline(poly.outer());
      if (outer.size() < 3) continue;
      std::vector<Polyline> inner;
      for (auto& h : poly.inners()) inner.push_back(ringToPolyline(h));
      Polyline f = fracture(outer, inner);
      if (std::getenv("XR_DEBUG_FILL")) {
        double want = std::abs(bg::area(poly)), got = std::abs(polygonArea(f));
        if (std::abs(want - got) > 0.01 * want + 1e9)
          std::fprintf(stderr, "  fracture area mismatch: polygon %.3f mm2 (%zu holes) -> %.3f mm2\n", want / 1e12, inner.size(), got / 1e12);
      }
      if (z.minIslandArea > 0 && std::abs(polygonArea(f)) < z.minIslandArea) {
        ++st.islandsRemoved;
        continue;
      }
      if (z.removeIslands && z.net != kNoNet) {
        // Keep the piece only if copper of the zone's net touches it.
        Shape piece = Shape::polygon(f);
        bool connected = false;
        BBox pbb;
        for (auto& v : outer) pbb.add(v);
        // (... or a bridge lands on it: the pads it is joined to by thermals do not touch it themselves.)
        connected = r::any_of(bridges, [&](const Bridge& br) { return bg::covered_by(BPt(br.lands.x, br.lands.y), poly); });
        idx.query(pbb, LayerMask(1) << z.layer, [&](ItemRef r) {
          if (connected || r.type == ItemType::Zone || itemNet(b, r) != z.net) return;
          for (auto& s : itemShapes(b, r))
            if (s.distance(piece) <= 1000) {
              connected = true;
              return;
            }
        });
        if (!connected) {
          ++st.islandsRemoved;
          continue;
        }
      }
      z.filled.push_back(std::move(f));
      ++st.polygons;
    }
    // The bridges of the pieces that stayed.
    for (Bridge& br : bridges)
      if (r::any_of(z.filled, [&](const Polyline& f) { return pointInPolygon(br.lands, f); })) z.filled.push_back(std::move(br.rect));
  }
  return st;
}

}  // namespace xr
