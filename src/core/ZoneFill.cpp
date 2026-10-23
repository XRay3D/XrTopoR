#include "core/ZoneFill.h"

#include <boost/geometry.hpp>
#include <boost/geometry/geometries/multi_polygon.hpp>
#include <boost/geometry/geometries/point_xy.hpp>
#include <boost/geometry/geometries/polygon.hpp>

#include <algorithm>
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

void addPlaneZones(Board& b) {
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    const Layer& L = b.layers[l];
    if (!L.plane || L.planeNet == kNoNet) continue;
    if (std::ranges::any_of(b.zones, [&](const Zone& z) { return z.layer == l && z.net == L.planeNet; })) continue;
    Zone z;
    z.layer = l;
    z.net = L.planeNet;
    z.name = L.name;
    z.priority = -1000;  // anything else poured on the layer wins
    z.padConnection = PadConnection::Thermal;
    if (!b.outline.empty()) {
      z.outline = b.outline.front();
    } else {
      BBox bb = b.bbox();
      z.outline = {{bb.minX, bb.minY}, {bb.maxX, bb.minY}, {bb.maxX, bb.maxY}, {bb.minX, bb.maxY}};
    }
    b.zones.push_back(std::move(z));
  }
}

ZoneFillStats fillZones(Board& b, const ZoneFillOptions& opt) {
  ZoneFillStats st;
  auto selected = [&](int zi) { return opt.only.empty() || std::ranges::contains(opt.only, zi); };
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
  // Keep the copper away from the board edge.
  if (!board.empty() && b.edgeClearance > 0) board = grow(board, -double(b.edgeClearance) - opt.arcTolerance);

  // Higher priority first: its fill is an obstacle for lower-priority zones of other nets.
  std::vector<int> order(b.zones.size());
  std::iota(order.begin(), order.end(), 0);
  std::ranges::stable_sort(order, std::greater{}, [&](int i) { return b.zones[i].priority; });
  for (int zi : order) {
    Zone& z = b.zones[zi];
    if (z.outline.size() < 3 || !selected(zi)) continue;
    ++st.zones;
    double zoneClr = double(std::max(z.clearance, b.clearance(z.net, z.layer)));
    BMulti area = toMulti(z.outline);
    if (!board.empty()) {
      BMulti tmp;
      bg::intersection(area, board, tmp);
      area = std::move(tmp);
    }
    if (area.empty()) continue;
    BBox zb;
    for (auto& p : z.outline) zb.add(p);
    double maxClr = std::max(zoneClr, double(b.maxClearance()));

    std::vector<BMulti> holes;
    std::vector<std::pair<Vec2, const Pad*>> thermalPads;
    idx.query(zb.inflated(maxClr), LayerMask(1) << z.layer, [&](ItemRef r) {
      if (r.type == ItemType::Zone) return;
      int net = itemNet(b, r);
      bool same = net == z.net && net != kNoNet;
      if (same) {
        // Same-net pads get a thermal relief (or nothing: solid); same-net tracks and vias merge.
        if (r.type == ItemType::Pad && opt.thermals && z.padConnection == PadConnection::Thermal)
          thermalPads.push_back({b.pads[r.index].pos.v(), &b.pads[r.index]});
        if (!(r.type == ItemType::Pad && z.padConnection == PadConnection::None)) return;
      }
      // Outlines are inscribed polygons: grow by the chord error so the true clearance holds.
      double clr = std::max(zoneClr, double(b.clearance(net, z.layer))) + opt.arcTolerance;
      for (auto& s : itemShapes(b, r)) holes.push_back(toMulti(s.inflated(clr).outline(opt.arcTolerance)));
    });
    // Already poured zones (higher priority) of other nets on this layer.
    for (int oz : order) {
      if (oz == zi) break;
      const Zone& o = b.zones[oz];
      if (o.layer != z.layer || o.net == z.net) continue;
      double clr = std::max(zoneClr, double(b.clearance(o.net, z.layer))) + opt.arcTolerance;
      for (auto& f : o.filled) holes.push_back(toMulti(Shape::polygon(f, clr).outline(opt.arcTolerance)));
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
    // Thermal reliefs: a ring of `thermalGap` around the pad, crossed by four spokes.
    double gap = double(z.thermalGap > 0 ? z.thermalGap : opt.thermalGap);
    double spoke = double(z.spokeWidth > 0 ? z.spokeWidth : opt.spokeWidth);
    for (auto& [c, pad] : thermalPads) {
      Shape s = pad->shapeGeom();
      BMulti ring = toMulti(s.inflated(gap).outline(opt.arcTolerance));
      BMulti core = toMulti(s.outline(opt.arcTolerance));
      BMulti annulus;
      bg::difference(ring, core, annulus);
      BBox pb = s.bbox().inflated(gap * 2);
      double hw = spoke / 2;
      double ang = -degToRad(pad->angle + z.spokeAngle);
      Polyline sx = {c + Vec2(-pb.width(), -hw).rotated(ang), c + Vec2(pb.width(), -hw).rotated(ang),
                     c + Vec2(pb.width(), hw).rotated(ang), c + Vec2(-pb.width(), hw).rotated(ang)};
      Polyline sy = {c + Vec2(-hw, -pb.height()).rotated(ang), c + Vec2(hw, -pb.height()).rotated(ang),
                     c + Vec2(hw, pb.height()).rotated(ang), c + Vec2(-hw, pb.height()).rotated(ang)};
      BMulti spokes = unionAll({toMulti(sx), toMulti(sy)});
      BMulti relief;
      bg::difference(annulus, spokes, relief);
      holes.push_back(std::move(relief));
    }
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
    if (minW > 0) fill = grow(grow(fill, -minW / 2), minW / 2 - 1);

    for (auto& poly : fill) {
      Polyline outer = ringToPolyline(poly.outer());
      if (outer.size() < 3) continue;
      std::vector<Polyline> inner;
      for (auto& h : poly.inners()) inner.push_back(ringToPolyline(h));
      Polyline f = fracture(outer, inner);
      if (opt.removeIslands && z.net != kNoNet) {
        // Keep the piece only if copper of the zone's net touches it.
        Shape piece = Shape::polygon(f);
        bool connected = false;
        BBox pbb;
        for (auto& v : outer) pbb.add(v);
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
  }
  return st;
}

}  // namespace xr
