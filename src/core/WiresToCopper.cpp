#include "core/WiresToCopper.h"

#include <boost/polygon/polygon.hpp>
#include <boost/polygon/voronoi.hpp>

#include <algorithm>
#include <cmath>
#include <map>
#include <set>

#include "core/BoostGeom.h"
#include "core/Padstack.h"
#include "core/SpatialIndex.h"
#include "core/Teardrops.h"
#include "core/ZoneFill.h"

namespace xr {

using namespace bgeo;  // (this file's own)

namespace {

using VPoint = boost::polygon::point_data<int32_t>;
using VSegment = boost::polygon::segment_data<int32_t>;
using VD = boost::polygon::voronoi_diagram<double>;

constexpr double kUnit = 10;       // nm in a unit of the diagram (its input is whole numbers)
constexpr double kChord = 5000;    // the chords of round copper and of the parabolic edges: this far off at most
constexpr int kFrame = 0;          // the colour of the frame round everything

// An edge between a point and a segment is a parabola: its points from p0 to p1 (p0 not included), in chords.
void parabola(Vec2 focus, Vec2 sa, Vec2 sb, Vec2 p0, Vec2 p1, Polyline& out) {
  const Vec2 u = (sb - sa).normalized(), n = u.perp();
  const double fx = u.dot(focus - sa), fy = n.dot(focus - sa);
  const double x0 = u.dot(p0 - sa), x1 = u.dot(p1 - sa);
  if (std::abs(fy) > 1e-6) {
    const double step = std::sqrt(8 * (kChord / kUnit) * std::abs(fy));
    const int steps = std::clamp(int(std::ceil(std::abs(x1 - x0) / step)), 1, 64);
    for (int i = 1; i < steps; ++i) {
      const double x = x0 + (x1 - x0) * i / steps;
      out.push_back(sa + u * x + n * (((x - fx) * (x - fx) + fy * fy) / (2 * fy)));
    }
  }
  out.push_back(p1);
}

double signedArea(const Polyline& p) {
  double a = 0;
  for (size_t i = 0; i < p.size(); ++i) a += p[i].cross(p[(i + 1) % p.size()]);
  return a / 2;
}

// The outer contours of the cells of each colour asked for: where its copper could spread to, half way to its
// neighbours. `bodies`: the copper by colour (disjoint).
std::map<int, std::vector<Polyline>> cellsOf(const std::map<int, BMulti>& bodies, const std::set<int>& wanted, const BBox& all) {
  const Vec2 origin{(all.minX + all.maxX) / 2, (all.minY + all.maxY) / 2};
  auto unit = [&](Vec2 p) { return VPoint(int32_t(std::llround((p.x - origin.x) / kUnit)), int32_t(std::llround((p.y - origin.y) / kUnit))); };
  std::vector<VSegment> segs;
  std::vector<int> colour;
  auto ring = [&](const auto& r, int c) {
    for (size_t i = 0; i + 1 < r.size(); ++i) {
      const VPoint a = unit({r[i].x(), r[i].y()}), e = unit({r[i + 1].x(), r[i + 1].y()});
      if (a == e) continue;
      segs.emplace_back(a, e);
      colour.push_back(c);
    }
  };
  for (const auto& [c, body] : bodies)
    for (const BPoly& poly : body) {
      ring(poly.outer(), c);
      for (const auto& h : poly.inners()) ring(h, c);
    }
  // The frame, far off: without it the edges at the rim run to infinity.
  {
    const double w = all.maxX - all.minX, h = all.maxY - all.minY;
    const Vec2 lo{all.minX - 2 * w - 1e6, all.minY - 2 * h - 1e6}, hi{all.maxX + 2 * w + 1e6, all.maxY + 2 * h + 1e6};
    const VPoint q[4] = {unit(lo), unit({hi.x, lo.y}), unit(hi), unit({lo.x, hi.y})};
    for (int i = 0; i < 4; ++i) {
      segs.emplace_back(q[i], q[(i + 1) % 4]);
      colour.push_back(kFrame);
    }
  }
  VD vd;
  boost::polygon::construct_voronoi(segs.begin(), segs.end(), &vd);
  using Edge = VD::edge_type;
  auto colourOf = [&](const Edge* e) { return colour[e->cell()->source_index()]; };
  auto board = [&](double x, double y) { return Vec2{x * kUnit + origin.x, y * kUnit + origin.y}; };
  auto sitePoint = [&](const VD::cell_type* c) {
    const VSegment& s = segs[c->source_index()];
    const VPoint p = c->source_category() == boost::polygon::SOURCE_CATEGORY_SEGMENT_START_POINT ? boost::polygon::low(s) : boost::polygon::high(s);
    return Vec2{double(p.x()), double(p.y())};
  };
  std::map<int, std::vector<Polyline>> out;
  std::set<const Edge*> done;
  for (const Edge& first : vd.edges()) {
    const int c = colourOf(&first);
    if (!wanted.contains(c) || colourOf(first.twin()) == c || done.contains(&first)) continue;
    // Round the union of the colour's cells: along a cell's edge, and over every edge shared with a cell of the
    // same colour to that cell's next one.
    Polyline loop;
    bool whole = true;
    const Edge* e = &first;
    size_t guard = 0;
    do {
      done.insert(e);
      if (!e->vertex0() || !e->vertex1() || ++guard > vd.num_edges()) {
        whole = false;
        break;
      }
      const Vec2 p0{e->vertex0()->x(), e->vertex0()->y()}, p1{e->vertex1()->x(), e->vertex1()->y()};
      Polyline piece;
      if (e->is_curved()) {
        const bool pointHere = e->cell()->contains_point();
        const VSegment& s = segs[(pointHere ? e->twin()->cell() : e->cell())->source_index()];
        parabola(sitePoint(pointHere ? e->cell() : e->twin()->cell()), {double(s.low().x()), double(s.low().y())}, {double(s.high().x()), double(s.high().y())}, p0, p1, piece);
      } else {
        piece.push_back(p1);
      }
      for (Vec2 q : piece) loop.push_back(board(q.x, q.y));
      e = e->next();
      while (colourOf(e->twin()) == c && e != &first) e = e->twin()->next();
    } while (e != &first);
    if (whole && loop.size() >= 3 && signedArea(loop) > 0) out[c].push_back(std::move(loop));  // (not the holes: the pour cuts them)
  }
  return out;
}

}  // namespace

WiresToCopperResult wiresToCopper(Board& b, const WiresToCopper& what) {
  WiresToCopperResult res;
  auto chosen = [&](const Track& t) { return t.net != kNoNet && (r::contains(what.nets, t.net) || r::contains(what.layers, t.layer)); };
  std::map<LayerId, std::set<int>> netsOn;  // per layer: the nets whose wires go
  for (const Track& t : b.tracks)
    if (chosen(t)) netsOn[t.layer].insert(t.net);
  if (netsOn.empty()) return res;

  const size_t zonesWas = b.zones.size();

  SpatialIndex idx;
  idx.build(b);
  const std::vector<Teardrop> drops = teardrops(b);
  BBox all;
  for (const auto& loop : b.outline)
    for (Vec2 p : loop) all.add(p);
  // The board: its largest contour (the areas' outlines stay within it; the pour keeps off its edge and its cutouts).
  BMulti inside;
  {
    const Polyline* best = nullptr;
    for (const auto& loop : b.outline)
      if (loop.size() >= 3 && (!best || std::abs(signedArea(loop)) > std::abs(signedArea(*best)))) best = &loop;
    if (best) inside = toMulti(*best);
  }

  std::vector<Zone> made;
  for (const auto& [layer, nets] : netsOn) {
    // The copper of the layer by body: a net's all in one, each thing of no net its own.
    std::map<int, std::vector<BMulti>> parts;
    std::map<int, int> netOf;  // colour -> net
    int lone = int(b.nets.size()) + 1;
    auto colourFor = [&](int net) {
      const int c = net == kNoNet ? lone++ : net + 1;
      netOf[c] = net;
      return c;
    };
    auto add = [&](int c, const Shape& s) {
      Polyline o = s.outline(kChord);
      for (Vec2 p : o) all.add(p);
      if (BMulti m = toMulti(o); !m.empty()) parts[c].push_back(std::move(m));
    };
    for (const Pad& p : b.pads)
      if (p.onLayer(layer))
        if (auto s = padShapeOn(b, p, layer)) add(colourFor(p.net), *s);
    for (const Via& v : b.vias)
      if (v.onLayer(layer)) add(colourFor(v.net), Shape::circle(v.pos.v(), double(viaDiameterOn(b, v, layer)) / 2));
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (b.tracks[size_t(i)].layer == layer) {
        const int c = colourFor(b.tracks[size_t(i)].net);
        for (const Shape& s : itemShapes(b, {ItemType::Track, i})) add(c, s);
      }
    for (const Teardrop& d : drops)
      if (d.layer == layer) add(colourFor(d.net), d.shape());
    for (const Zone& z : b.zones)
      if (z.layer == layer) {
        const int c = colourFor(z.net);
        for (const Island& is : zoneIslands(z)) {
          BPoly poly = toPoly(is.outer);
          for (const Polyline& h : is.holes) {
            poly.inners().emplace_back();
            for (Vec2 p : h) poly.inners().back().push_back({p.x, p.y});
            if (!h.empty()) poly.inners().back().push_back({h.front().x, h.front().y});
          }
          bg::correct(poly);
          parts[c].push_back(BMulti{poly});
        }
      }
    std::map<int, BMulti> bodies;
    for (auto& [c, list] : parts) bodies[c] = unionAll(std::move(list));
    // Bodies of different nets that touch or cross (a short the design has) are parted: the diagram is of
    // contours that do not cross.
    {
      std::set<std::pair<int, int>> crossing;
      const LayerMask mask = LayerMask(1) << layer;
      auto colourOfItem = [&](ItemRef r) { return itemNet(b, r) == kNoNet ? -1 : itemNet(b, r) + 1; };
      for (ItemType type : {ItemType::Pad, ItemType::Track, ItemType::Via, ItemType::Zone}) {
        const int n = type == ItemType::Pad ? int(b.pads.size()) : type == ItemType::Track ? int(b.tracks.size()) : type == ItemType::Via ? int(b.vias.size()) : int(b.zones.size());
        for (int i = 0; i < n; ++i) {
          const ItemRef r{type, i};
          if (!(itemLayers(b, r) & mask)) continue;
          const int ca = colourOfItem(r);
          if (ca < 0) continue;
          const std::vector<Shape> mine = itemShapes(b, r, 0, layer);
          idx.query(itemBBox(b, r), mask, [&](ItemRef o) {
            const int cb = colourOfItem(o);
            if (cb < 0 || cb == ca || crossing.contains({std::min(ca, cb), std::max(ca, cb)})) return;
            for (const Shape& s : mine)
              for (const Shape& t : itemShapes(b, o, 0, layer))
                if (s.distance(t, 100) <= 50) {
                  crossing.insert({std::min(ca, cb), std::max(ca, cb)});
                  return;
                }
          });
        }
      }
      for (auto [lo, hi] : crossing) {
        if (!bodies.contains(lo) || !bodies.contains(hi)) continue;
        BMulti cut;
        bg::difference(bodies[hi], grow(bodies[lo], 200), cut);
        bodies[hi] = std::move(cut);
      }
    }
    std::set<int> wanted;
    for (int net : nets) wanted.insert(net + 1);
    const auto cells = cellsOf(bodies, wanted, all);
    // A net's area is its cell drawn in by half its clearance and half its line (TopoR draws the area with a line as
    // wide as the wires: the copper goes that half past the outline) — two areas side by side are then a
    // clearance apart; where a pair of nets asks for more, the pour of the second keeps it from the first.
    for (int net : nets) {
      auto it = cells.find(net + 1);
      if (it == cells.end()) continue;
      const Coord clr = b.clearance(net, layer);
      Coord line = 0;
      std::vector<Vec2> wirePoints;
      for (const Track& t : b.tracks) {
        if (t.layer != layer || t.net != net) continue;
        line = line ? std::min(line, t.width) : t.width;
        const Polyline path = t.path(50000);
        wirePoints.push_back(path[path.size() / 2]);
        wirePoints.push_back(t.a.v());
      }
      std::vector<BMulti> parts;
      for (const Polyline& cell : it->second) parts.push_back(grow(toMulti(cell), -(double(clr) / 2 + double(line) / 2 + kChord)));
      BMulti area = unionAll(std::move(parts));
      if (!inside.empty()) {
        BMulti within;
        bg::intersection(area, inside, within);
        area = std::move(within);
      }
      for (const BPoly& piece : area) {
        // (a piece with none of the wires at it is the room round a pad the wires did not reach on this layer; a wire
        // squeezed by a neighbour lies just outside its own cell drawn in)
        const double reach = double(clr) / 2 + double(line) / 2 + 2 * kChord;
        if (r::none_of(wirePoints, [&](Vec2 p) { return bg::distance(BPt{p.x, p.y}, piece) <= reach; })) continue;
        bg::model::ring<BPt> outer;
        bg::simplify(piece.outer(), outer, kChord);
        Polyline outline = ringToPolyline(outer);
        if (outline.size() < 3) continue;
        Zone z;  // as TopoR makes them: the line of the wires' width, priority 50, pads and vias joined solid
        z.net = net;
        z.layer = layer;
        z.outline = std::move(outline);
        z.lineWidth = line;
        z.priority = 50;
        z.pads.connection = PadConnection::Solid;
        z.vias.connection = PadConnection::Solid;
        z.minIslandArea = 0;
        made.push_back(std::move(z));
      }
    }
  }
  if (made.empty()) return res;

  // The areas are poured; one the pour left nothing of is not kept.
  ZoneFillOptions fo;
  for (Zone& z : made) {
    fo.only.push_back(int(b.zones.size()));
    b.zones.push_back(std::move(z));
  }
  fillZones(b, fo);
  b.zones.erase(std::remove_if(b.zones.begin() + long(zonesWas), b.zones.end(), [](const Zone& z) { return z.filled.empty(); }), b.zones.end());
  std::set<int> given;
  for (size_t z = zonesWas; z < b.zones.size(); ++z) given.insert(b.zones[z].net);
  res.areas = int(b.zones.size() - zonesWas);
  res.nets = int(given.size());
  return res;
}

}  // namespace xr
