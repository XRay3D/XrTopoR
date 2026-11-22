#include "core/Fanouts.h"

#include <cmath>
#include <deque>
#include <limits>
#include <map>
#include <numbers>
#include <optional>
#include <set>

#include "core/SpatialIndex.h"
#include "geom/Ranges.h"

namespace xr {

namespace {

constexpr double kJoin = 2.0;  // nm: ends that meet

LayerId layerOf(const Pad& p) { return LayerId(std::countr_zero(p.copper)); }
bool planar(const Pad& p) { return p.drill == 0 && std::popcount(p.copper) == 1; }

// The nets of the plane layers, and those assigned to a plane layer.
std::vector<char> planeNets(const Board& b) {
  std::vector<char> out(b.nets.size(), 0);
  LayerMask planes = 0;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[size_t(l)].plane) {
      planes |= LayerMask(1) << l;
      if (const int n = b.layers[size_t(l)].planeNet; n >= 0 && n < int(out.size())) out[size_t(n)] = 1;
    }
  for (int n = 0; n < int(out.size()) && planes; ++n)
    if (b.assignedLayers(n) & planes) out[size_t(n)] = 1;
  return out;
}

// What is on the board and what is being placed, asked whether a via or a track fits.
struct Room {
  const Board& b;
  SpatialIndex idx;  // tracks, no copper areas: a pour gives way
  LayerMask copper;
  double maxClr;
  struct Placed {
    Vec2 at;
    double r;
    int net;
  };
  std::vector<Placed> placed;
  std::vector<std::pair<Vec2, Vec2>> edge;  // the outline's sides

  explicit Room(const Board& board) : b(board), copper(board.allCopperMask()), maxClr(double(board.maxClearance())) {
    idx.build(b, true, false);
    for (const auto& loop : b.outline)
      for (size_t i = 0; i < loop.size(); ++i) edge.push_back({loop[i], loop[(i + 1) % loop.size()]});
  }
  double clearance(int a, int c, LayerId l) const { return a == kNoNet || c == kNoNet ? maxClr : double(b.clearance(a, c, l)); }

  // A through via of radius r of the net with its centre at p: within the board, off the keepouts of vias, clear
  // of the copper of other nets on every layer and of the vias placed; not over a hole of its own net.
  bool viaFits(Vec2 p, int net, double r) const {
    if (!edge.empty()) {
      if (!b.onBoard(p)) return false;
      const double need = r + double(b.edgeClearance);
      for (const auto& [a, c] : edge)
        if (Shape::capsule(a, c, 0).distance(p) < need) return false;
    }
    for (const Keepout& k : b.keepouts) {
      if (k.role != Keepout::Role::Route || !k.vias) continue;
      for (const Shape& o : k.shapes())
        if (o.distance(p) < r) return false;
    }
    for (const Placed& q : placed)
      if ((q.at - p).len() < r + q.r + (q.net == net && net != kNoNet ? 0.0 : clearance(net, q.net, 0))) return false;
    const Shape via = Shape::circle(p, r);
    bool ok = true;
    idx.query(via.bbox().inflated(maxClr), copper, [&](ItemRef it) {
      if (!ok || (it.type != ItemType::Track && it.type != ItemType::Pad && it.type != ItemType::Via)) return;
      const int other = itemNet(b, it);
      if (other == net && net != kNoNet) {
        // Its own copper is no obstacle, but a hole of its own is not drilled into.
        const bool hole = it.type == ItemType::Via || (it.type == ItemType::Pad && b.pads[size_t(it.index)].drill > 0);
        if (!hole) return;
        for (const Shape& o : itemShapes(b, it)) ok = ok && via.distance(o, 1.0) >= 1.0;
        return;
      }
      const double need = clearance(net, other, LayerId(std::countr_zero(itemLayers(b, it))));
      for (const Shape& o : itemShapes(b, it)) ok = ok && via.distance(o, need) >= need;
    });
    return ok;
  }
  // A straight track of the net from a to c on a layer: clear of the copper of other nets there and of the
  // vias placed. (`skip`: a pad it begins or ends on.)
  bool trackFits(Vec2 a, Vec2 c, double width, int net, LayerId layer) const {
    const Shape wire = Shape::capsule(a, c, width / 2);
    for (const Placed& q : placed)
      if (q.net != net && wire.distance(q.at) < q.r + clearance(net, q.net, layer)) return false;
    bool ok = true;
    idx.query(wire.bbox().inflated(maxClr), LayerMask(1) << layer, [&](ItemRef it) {
      if (!ok || (it.type != ItemType::Track && it.type != ItemType::Pad && it.type != ItemType::Via)) return;
      const int other = itemNet(b, it);
      if (other == net && net != kNoNet) return;
      const double need = clearance(net, other, layer);
      for (const Shape& o : itemShapes(b, it, 0, layer)) ok = ok && wire.distance(o, need) >= need;
    });
    return ok;
  }
};

// Whether something of the pad's net comes to the planar pad already: a track's end on it, a via on it.
bool joined(const Board& b, int pad) {
  const Pad& p = b.pads[size_t(pad)];
  if (p.net < 0) return false;
  const Shape s = p.shapeGeom();
  for (const Track& t : b.tracks)
    if (t.net == p.net && p.onLayer(t.layer) && (s.contains(t.a.v()) || s.contains(t.b.v()))) return true;
  for (const Via& v : b.vias)
    if (v.net == p.net && (v.layers & p.copper) && s.contains(v.pos.v())) return true;
  return false;
}

// The lattice of a component's planar pads on one layer, in the component's own frame.
struct Lattice {
  int comp = -1;
  LayerId layer = 0;
  Vec2 origin;  // local: the node (0, 0)
  double px = 0, py = 0;
  int cols = 0, rows = 0;
  std::map<std::pair<int, int>, int> at;  // node -> pad
  Vec2 centre;                            // of the pads, on the board

  Vec2 local(double i, double j) const { return {origin.x + i * px, origin.y + j * py}; }
  // How many nodes with pads follow the node one after another in the nearest of the four directions to the
  // lattice's edge or to a gap: 0 for the outer row, 1 for the second.
  int ring(int i, int j) const {
    int least = std::numeric_limits<int>::max();
    for (auto [di, dj] : {std::pair{1, 0}, {-1, 0}, {0, 1}, {0, -1}}) {
      int n = 0;
      for (int a = i + di, c = j + dj; at.contains({a, c}); a += di, c += dj) ++n;
      least = std::min(least, n);
    }
    return least;
  }
};

std::optional<Lattice> latticeOf(const Board& b, int ci) {
  const Component& c = b.components[size_t(ci)];
  std::map<LayerId, std::vector<int>> byLayer;
  for (int pi : c.pads)
    if (planar(b.pads[size_t(pi)])) byLayer[layerOf(b.pads[size_t(pi)])].push_back(pi);
  if (byLayer.empty()) return std::nullopt;
  const auto most = r::max_element(byLayer, {}, [](const auto& kv) { return kv.second.size(); });
  if (most->second.size() < 16) return std::nullopt;
  Lattice g;
  g.comp = ci;
  g.layer = most->first;
  std::vector<Vec2> at;
  for (int pi : most->second) at.push_back(c.toLocal(b.pads[size_t(pi)].pos.v()));
  // The step along each axis: the least distance between the pads' coordinates that is not noise.
  auto step = [&](auto coord, double& lo, double& hi) {
    std::vector<double> v;
    for (Vec2 q : at) v.push_back(coord(q));
    r::sort(v);
    lo = v.front(), hi = v.back();
    double least = 0;
    for (size_t i = 1; i < v.size(); ++i)
      if (const double d = v[i] - v[i - 1]; d > 10000.0 && (least == 0 || d < least)) least = d;
    return least;
  };
  double x0, x1, y0, y1;
  g.px = step([](Vec2 q) { return q.x; }, x0, x1);
  g.py = step([](Vec2 q) { return q.y; }, y0, y1);
  if (g.px <= 0 || g.py <= 0) return std::nullopt;
  g.origin = {x0, y0};
  g.cols = int(std::lround((x1 - x0) / g.px)) + 1;
  g.rows = int(std::lround((y1 - y0) / g.py)) + 1;
  if (g.cols < 3 || g.rows < 3) return std::nullopt;
  for (size_t k = 0; k < at.size(); ++k) {
    const double fi = (at[k].x - x0) / g.px, fj = (at[k].y - y0) / g.py;
    const int i = int(std::lround(fi)), j = int(std::lround(fj));
    if (std::abs(fi - i) > 0.05 || std::abs(fj - j) > 0.05) return std::nullopt;  // (not a lattice)
    g.at[{i, j}] = most->second[k];
    g.centre = g.centre + b.pads[size_t(most->second[k])].pos.v();
  }
  g.centre = g.centre / double(at.size());
  // Inner pads: a row of pads round a body (a QFP) is no BGA.
  if (r::none_of(g.at, [&](const auto& kv) { return g.ring(kv.first.first, kv.first.second) >= 1; })) return std::nullopt;
  return g;
}

// The most pads matched to places, at the least cost: each pad one place, each place one pad. `edges`: (pad,
// place, cost). Returns the place of each pad, -1: none.
std::vector<int> assign(int pads, int places, const std::vector<std::tuple<int, int, double>>& edges) {
  // Successive shortest augmenting paths over the residual graph (source → pads → places → sink).
  struct Arc {
    int to, cap;
    double cost;
  };
  const int S = pads + places, T = S + 1, n = T + 1;
  std::vector<Arc> arcs;
  std::vector<std::vector<int>> out(static_cast<size_t>(n));
  auto arc = [&](int u, int v, double cost) {
    out[size_t(u)].push_back(int(arcs.size()));
    arcs.push_back({v, 1, cost});
    out[size_t(v)].push_back(int(arcs.size()));
    arcs.push_back({u, 0, -cost});
  };
  for (int p = 0; p < pads; ++p) arc(S, p, 0);
  for (int q = 0; q < places; ++q) arc(pads + q, T, 0);
  for (auto [p, q, cost] : edges) arc(p, pads + q, cost);
  for (;;) {
    std::vector<double> dist(static_cast<size_t>(n), std::numeric_limits<double>::infinity());
    std::vector<int> came(static_cast<size_t>(n), -1);
    std::vector<char> queued(static_cast<size_t>(n), 0);
    std::deque<int> open{S};
    dist[size_t(S)] = 0;
    while (!open.empty()) {
      const int u = open.front();
      open.pop_front();
      queued[size_t(u)] = 0;
      for (int ai : out[size_t(u)]) {
        const Arc& a = arcs[size_t(ai)];
        if (a.cap <= 0 || dist[size_t(u)] + a.cost >= dist[size_t(a.to)] - 1e-9) continue;
        dist[size_t(a.to)] = dist[size_t(u)] + a.cost;
        came[size_t(a.to)] = ai;
        if (!queued[size_t(a.to)]) queued[size_t(a.to)] = 1, open.push_back(a.to);
      }
    }
    if (came[size_t(T)] < 0) break;
    for (int v = T; v != S; v = arcs[size_t(came[size_t(v)] ^ 1)].to) {
      --arcs[size_t(came[size_t(v)])].cap;
      ++arcs[size_t(came[size_t(v)] ^ 1)].cap;
    }
  }
  std::vector<int> place(static_cast<size_t>(pads), -1);
  for (int p = 0; p < pads; ++p)
    for (int ai : out[size_t(p)])
      if (ai % 2 == 0 && arcs[size_t(ai)].cap == 0 && arcs[size_t(ai)].to >= pads && arcs[size_t(ai)].to < S) place[size_t(p)] = arcs[size_t(ai)].to - pads;
  return place;
}

struct Maker {
  Board& b;
  Room room;
  std::vector<char> plane;
  std::vector<char> has;  // per pad: joined already, or by this run
  FanoutResult out;

  explicit Maker(Board& board) : b(board), room(board), plane(planeNets(board)), has(board.pads.size(), 0) {
    for (int pi = 0; pi < int(b.pads.size()); ++pi) has[size_t(pi)] = joined(b, pi);
  }
  double viaRadius(int net) const { return double(b.classOf(net).viaDiameter) / 2; }
  double widthFor(const Pad& p) const { return std::min(double(b.trackWidth(p.net, layerOf(p))), double(std::min(p.shape.w, p.shape.h))); }
  bool planeNet(int net) const { return net >= 0 && net < int(plane.size()) && plane[size_t(net)]; }

  void track(const Pad& p, Vec2 to) {
    Track t;
    t.a = p.pos;
    t.b = Point(to);
    t.width = Coord(std::llround(widthFor(p)));
    t.layer = layerOf(p);
    t.net = p.net;
    b.tracks.push_back(t);
  }
  // The pad's fanout: the via at `at`, the track to it.
  void fanout(int pad, Vec2 at) {
    const Pad& p = b.pads[size_t(pad)];
    Via v;
    v.pos = Point(at);
    v.net = p.net;
    v.diameter = b.classOf(p.net).viaDiameter;
    v.drill = b.classOf(p.net).viaDrill;
    v.layers = b.allCopperMask();
    b.vias.push_back(v);
    room.placed.push_back({at, viaRadius(p.net), p.net});
    track(p, at);
    has[size_t(pad)] = 1;
    ++out.vias;
    ++out.pads;
  }

  // A place for a via of the net at or about `centre`: the point itself, else the nearest one within `reach` of it
  // where the via fits (the cell's middle is covered by a pad of the other side: the via is moved within the cell).
  std::optional<Vec2> placeAbout(Vec2 centre, double reach, int net) const {
    const double r = viaRadius(net);
    if (room.viaFits(centre, net, r)) return centre;
    for (int ring = 1; ring <= 5; ++ring)
      for (int k = 0; k < 16; ++k) {
        const double ang = 2 * std::numbers::pi * k / 16, d = reach * ring / 5;
        const Vec2 q = centre + Vec2{std::cos(ang), std::sin(ang)} * d;
        if (room.viaFits(q, net, r)) return q;
      }
    return std::nullopt;
  }

  void bga(const Lattice& g) {
    const Component& c = b.components[size_t(g.comp)];
    // The places: the cells — one row round the lattice too — and the nodes without pads.
    struct Site {
      Vec2 at;       // on the board
      double reach;  // how far a via may be moved off it
    };
    std::vector<Site> sites;
    const double shift = 0.3 * std::min(g.px, g.py);
    for (int i = -1; i < g.cols; ++i)
      for (int j = -1; j < g.rows; ++j) sites.push_back({c.toBoard(g.local(i + 0.5, j + 0.5)), shift});
    for (int i = 0; i < g.cols; ++i)
      for (int j = 0; j < g.rows; ++j)
        if (!g.at.contains({i, j})) sites.push_back({c.toBoard(g.local(i, j)), shift});
    const double pitch = std::max(g.px, g.py), reach = 1.05 * pitch;
    // The pads that are to get a via: the BGA's own first, then the planar pads of other components under it.
    std::vector<int> wanted;
    BBox box;
    for (auto& [node, pi] : g.at) {
      const Pad& p = b.pads[size_t(pi)];
      box.add(p.pos.v());
      if (p.net < 0 || has[size_t(pi)]) continue;
      if (g.ring(node.first, node.second) >= 2 || planeNet(p.net)) wanted.push_back(pi);
    }
    const size_t own = wanted.size();
    for (int pi = 0; pi < int(b.pads.size()); ++pi) {
      const Pad& p = b.pads[size_t(pi)];
      if (p.component == g.comp || p.component < 0 || p.net < 0 || has[size_t(pi)] || !planar(p)) continue;
      if (p.pos.x < box.minX || p.pos.x > box.maxX || p.pos.y < box.minY || p.pos.y > box.maxY) continue;
      wanted.push_back(pi);
    }
    if (wanted.empty()) return;
    int before = out.vias;
    // Matched in two turns: the BGA's pads take their places, the others what is left.
    std::vector<char> taken(sites.size(), 0);
    auto match = [&](size_t from, size_t to, double far) {
      std::vector<std::tuple<int, int, double>> edges;
      std::map<std::pair<int, int>, Vec2> where;
      for (size_t w = from; w < to; ++w) {
        const Pad& p = b.pads[size_t(wanted[w])];
        const Vec2 outward = p.pos.v() - g.centre;
        for (int s = 0; s < int(sites.size()); ++s) {
          if (taken[size_t(s)] || (sites[size_t(s)].at - p.pos.v()).len() > far) continue;
          const auto at = placeAbout(sites[size_t(s)].at, sites[size_t(s)].reach, p.net);
          if (!at || (*at - p.pos.v()).len() < 1.0 || !room.trackFits(p.pos.v(), *at, widthFor(p), p.net, layerOf(p))) continue;
          // The nearer the better; of places as near, the one away from the component's centre (the quadrants).
          const Vec2 d = *at - p.pos.v();
          const double away = outward.len() > 1.0 ? d.dot(outward) / (d.len() * outward.len()) : 0.0;
          edges.push_back({int(w - from), s, d.len() + 0.25 * pitch * (1.0 - away)});
          where[{int(w - from), s}] = *at;
        }
      }
      const std::vector<int> place = assign(int(to - from), int(sites.size()), edges);
      for (size_t w = from; w < to; ++w) {
        const int s = place[w - from];
        if (s < 0) continue;
        const Pad& p = b.pads[size_t(wanted[w])];
        const Vec2 at = where[{int(w - from), s}];
        // (Two vias moved towards each other within their cells: the second is left for the next turn.)
        if (!room.viaFits(at, p.net, viaRadius(p.net))) continue;
        taken[size_t(s)] = 1;
        fanout(wanted[w], at);
      }
    };
    match(0, own, reach);
    match(own, wanted.size(), 2 * pitch);
    // A pad of the BGA left without a place: joined to a neighbour of its net that has a via.
    for (size_t w = 0; w < own; ++w) {
      const int pi = wanted[w];
      if (has[size_t(pi)]) continue;
      const Pad& p = b.pads[size_t(pi)];
      int best = -1;
      for (auto& [node, qi] : g.at) {
        const Pad& q = b.pads[size_t(qi)];
        if (qi == pi || q.net != p.net || !has[size_t(qi)]) continue;
        const double d = (q.pos.v() - p.pos.v()).len();
        if (d > 1.5 * pitch || (best >= 0 && d >= (b.pads[size_t(best)].pos.v() - p.pos.v()).len())) continue;
        if (room.trackFits(p.pos.v(), q.pos.v(), widthFor(p), p.net, layerOf(p))) best = qi;
      }
      if (best < 0) {
        out.blocked.push_back(pi);
        continue;
      }
      track(p, b.pads[size_t(best)].pos.v());
      has[size_t(pi)] = 1;
      ++out.pads;
    }
    out.components += out.vias > before;
  }

  // A pad of a plane layer's net, not of a BGA: the via at the end of the pad on its long axis, at the first
  // place from the copper's edge where it fits; the end away from the component first. A round or square pad:
  // the nearest place round it.
  void planePad(int pi) {
    const Pad& p = b.pads[size_t(pi)];
    const double r = viaRadius(p.net), a = p.angle * std::numbers::pi / 180;
    const Vec2 ux{std::cos(a), std::sin(a)}, uy{-std::sin(a), std::cos(a)};
    const double hw = double(p.shape.w) / 2, hh = double(p.shape.h) / 2;
    std::vector<std::pair<Vec2, double>> ways;  // direction, the copper's half size along it
    if (hw > 1.1 * hh) ways = {{ux, hw}, {ux * -1.0, hw}, {uy, hh}, {uy * -1.0, hh}};
    else if (hh > 1.1 * hw) ways = {{uy, hh}, {uy * -1.0, hh}, {ux, hw}, {ux * -1.0, hw}};
    else
      for (int k = 0; k < 8; ++k) ways.push_back({ux * std::cos(k * std::numbers::pi / 4) + uy * std::sin(k * std::numbers::pi / 4), std::max(hw, hh)});
    // Along the long axis the end away from the component comes first.
    if (p.component >= 0 && ways.size() >= 2) {
      const Vec2 off = p.pos.v() - b.components[size_t(p.component)].pos.v();
      if (ways[0].first.dot(off) < ways[1].first.dot(off)) std::swap(ways[0], ways[1]);
    }
    const double w = widthFor(p);
    for (int pass = 0; pass < 2; ++pass)  // (the long axis' ends, then the sides)
      for (double far = 0; far <= 3.0 * kNmPerMm; far += 0.1 * kNmPerMm)
        for (size_t k = pass ? 2 : 0; k < (pass ? ways.size() : std::min<size_t>(2, ways.size())); ++k) {
          const Vec2 at = p.pos.v() + ways[k].first * (ways[k].second + r + far);
          if (!room.viaFits(at, p.net, r) || !room.trackFits(p.pos.v(), at, w, p.net, layerOf(p))) continue;
          fanout(pi, at);
          return;
        }
    out.blocked.push_back(pi);
  }
};

}  // namespace

bool isBga(const Board& b, int component) {
  return component >= 0 && component < int(b.components.size()) && latticeOf(b, component).has_value();
}

FanoutResult placeFanouts(Board& b) {
  Maker m(b);
  std::vector<char> ofBga(b.components.size(), 0);
  for (int ci = 0; ci < int(b.components.size()); ++ci)
    if (const auto g = latticeOf(b, ci)) {
      ofBga[size_t(ci)] = 1;
      m.bga(*g);
    }
  const int pads = int(b.pads.size());
  for (int pi = 0; pi < pads; ++pi) {
    const Pad& p = b.pads[size_t(pi)];
    if (p.component < 0 || ofBga[size_t(p.component)] || !planar(p) || !m.planeNet(p.net) || m.has[size_t(pi)]) continue;
    m.planePad(pi);
  }
  return m.out;
}

std::vector<FanoutRef> findFanouts(const Board& b) {
  std::vector<FanoutRef> out;
  if (b.vias.empty() || b.tracks.empty()) return out;
  SpatialIndex idx;
  idx.build(b, false, false);  // pads and vias
  auto at = [&](Vec2 p, LayerId layer, ItemType type, auto&& take) {
    idx.query(BBox{p.x - 1, p.y - 1, p.x + 1, p.y + 1}, LayerMask(1) << layer, [&](ItemRef r) {
      if (r.type == type) take(r.index);
    });
  };
  // The tracks that end on each via, with the pad their other end stands on (-1: none).
  std::vector<std::vector<std::pair<int, int>>> ends(b.vias.size());
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    const Track& t = b.tracks[size_t(ti)];
    for (int e : {0, 1}) {
      const Vec2 here = e ? t.b.v() : t.a.v(), far = e ? t.a.v() : t.b.v();
      at(here, t.layer, ItemType::Via, [&](int vi) {
        const Via& v = b.vias[size_t(vi)];
        if (v.net != t.net || (v.pos.v() - here).len() > kJoin) return;
        int pad = -1;
        at(far, t.layer, ItemType::Pad, [&](int pi) {
          const Pad& p = b.pads[size_t(pi)];
          if (pad < 0 && p.net == t.net && planar(p) && p.shapeGeom().contains(far) && !p.shapeGeom().contains(v.pos.v())) pad = pi;
        });
        ends[size_t(vi)].push_back({ti, pad});
      });
    }
  }
  for (int vi = 0; vi < int(b.vias.size()); ++vi) {
    const auto& list = ends[size_t(vi)];
    if (list.empty() || list.front().second < 0 || r::any_of(list, [&](const auto& x) { return x.second != list.front().second; })) continue;
    FanoutRef f{list.front().second, vi, {}};
    for (auto& [ti, pad] : list) f.tracks.push_back(ti);
    out.push_back(std::move(f));
  }
  return out;
}

int fanoutViaOf(const Board& b, int pad) {
  if (pad < 0 || pad >= int(b.pads.size())) return -1;
  const Pad& p = b.pads[size_t(pad)];
  if (!planar(p) || p.net < 0) return -1;
  const Shape s = p.shapeGeom();
  for (const Track& t : b.tracks) {
    if (t.net != p.net || !p.onLayer(t.layer)) continue;
    for (int e : {0, 1}) {
      if (!s.contains(e ? t.b.v() : t.a.v())) continue;
      const Vec2 far = e ? t.a.v() : t.b.v();
      for (int vi = 0; vi < int(b.vias.size()); ++vi) {
        const Via& v = b.vias[size_t(vi)];
        if (v.net == p.net && v.onLayer(t.layer) && (v.pos.v() - far).len() <= kJoin && !s.contains(v.pos.v())) return vi;
      }
    }
  }
  return -1;
}

int fanoutPadOf(const Board& b, int via) {
  if (via < 0 || via >= int(b.vias.size())) return -1;
  const Via& v = b.vias[size_t(via)];
  int pad = -1;
  for (const Track& t : b.tracks) {
    if (t.net != v.net || !v.onLayer(t.layer)) continue;
    for (int e : {0, 1}) {
      if (((e ? t.b.v() : t.a.v()) - v.pos.v()).len() > kJoin) continue;
      // The track's other end: on a planar pad of the net, on the track's layer; the same pad for all.
      const Vec2 far = e ? t.a.v() : t.b.v();
      int at = -1;
      for (int pi = 0; pi < int(b.pads.size()) && at < 0; ++pi) {
        const Pad& p = b.pads[size_t(pi)];
        if (p.net == v.net && planar(p) && p.onLayer(t.layer) && p.shapeGeom().contains(far) && !p.shapeGeom().contains(v.pos.v())) at = pi;
      }
      if (at < 0 || (pad >= 0 && at != pad)) return -1;
      pad = at;
    }
  }
  return pad;
}

}  // namespace xr
