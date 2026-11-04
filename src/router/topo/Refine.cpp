#include "router/topo/Refine.h"

#include <algorithm>
#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <format>
#include <map>
#include <queue>

#include "core/Connectivity.h"
#include "core/Edit.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"

namespace xr::topo {

namespace {

using edit::kJoinTol;
constexpr size_t kMaxCells = 1'500'000;

// Blocked cells of a layer around a wire's search region.
struct Grid {
  BBox box;
  double h = 0;
  int nx = 0, ny = 0;
  std::vector<char> blocked;
  int cell(Vec2 p) const {
    int ix = std::clamp(int((p.x - box.minX) / h), 0, nx - 1), iy = std::clamp(int((p.y - box.minY) / h), 0, ny - 1);
    return iy * nx + ix;
  }
  Vec2 centre(int c) const { return {box.minX + (c % nx + 0.5) * h, box.minY + (c / nx + 0.5) * h}; }
  // Cells whose centre lies closer than `r` to the shape.
  void mark(const Shape& s, double r) {
    BBox bb = s.bbox().inflated(r);
    if (!bb.intersects(box)) return;
    int x0 = std::max(0, int((bb.minX - box.minX) / h)), x1 = std::min(nx - 1, int((bb.maxX - box.minX) / h));
    int y0 = std::max(0, int((bb.minY - box.minY) / h)), y1 = std::min(ny - 1, int((bb.maxY - box.minY) / h));
    for (int y = y0; y <= y1; ++y)
      for (int x = x0; x <= x1; ++x) {
        int c = y * nx + x;
        if (!blocked[c] && s.distance(centre(c)) < r) blocked[c] = 1;
      }
  }
  // Inside a polygon (scanlines) or closer than `r` to its edges.
  void markPolygon(const Polyline& poly, double r) {
    for (size_t i = 0; i < poly.size(); ++i) mark(Shape::capsule(poly[i], poly[(i + 1) % poly.size()], 0), r);
    BBox bb;
    for (Vec2 p : poly) bb.add(p);
    if (!bb.intersects(box)) return;
    int y0 = std::max(0, int((bb.minY - box.minY) / h)), y1 = std::min(ny - 1, int((bb.maxY - box.minY) / h));
    std::vector<double> xs;
    for (int y = y0; y <= y1; ++y) {
      double cy = box.minY + (y + 0.5) * h;
      xs.clear();
      for (size_t i = 0; i < poly.size(); ++i) {
        Vec2 a = poly[i], c = poly[(i + 1) % poly.size()];
        if ((a.y <= cy) != (c.y <= cy)) xs.push_back(a.x + (cy - a.y) / (c.y - a.y) * (c.x - a.x));
      }
      std::ranges::sort(xs);
      for (size_t k = 0; k + 1 < xs.size(); k += 2) {
        int x0 = std::max(0, int(std::ceil((xs[k] - box.minX) / h - 0.5)));
        int x1 = std::min(nx - 1, int(std::floor((xs[k + 1] - box.minX) / h - 0.5)));
        for (int x = x0; x <= x1; ++x) blocked[y * nx + x] = 1;
      }
    }
  }
};

struct Chain {
  std::vector<int> tracks;
  Vec2 a, b;
  LayerId layer = 0;
  int net = kNoNet;
  Coord width = 0;
  double length = 0;
};

// Chains of the chosen tracks: one net and layer, between pads, vias and branch points.
std::vector<Chain> chainsOf(const Board& b, const std::vector<char>& chosen) {
  auto key = [](Vec2 p) { return std::pair{std::llround(p.x / kJoinTol), std::llround(p.y / kJoinTol)}; };
  std::map<std::tuple<int, LayerId, long long, long long>, std::vector<int>> ends;
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    const Track& t = b.tracks[i];
    for (Vec2 p : {t.a.v(), t.b.v()}) {
      auto [kx, ky] = key(p);
      ends[{t.net, t.layer, kx, ky}].push_back(int(i));
    }
  }
  auto at = [&](const Track& t, Vec2 p) -> const std::vector<int>& {
    auto [kx, ky] = key(p);
    return ends[{t.net, t.layer, kx, ky}];
  };
  auto isEnd = [&](const Track& t, Vec2 p) { return at(t, p).size() != 2 || edit::anchoredAt(b, p, t.layer, t.net); };
  std::vector<char> used(b.tracks.size(), 0);
  std::vector<Chain> out;
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!chosen[i] || used[i] || b.tracks[i].locked) continue;
    // Walk to one end, then collect towards the other.
    int cur = int(i);
    Vec2 p = b.tracks[i].a.v();
    for (size_t guard = 0; guard < b.tracks.size() && !isEnd(b.tracks[cur], p); ++guard) {
      const auto& list = at(b.tracks[cur], p);
      int next = list[0] == cur ? list[1] : list[0];
      if (next == int(i)) break;  // a loop
      cur = next;
      const Track& t = b.tracks[cur];
      p = (t.a.v() - p).len() <= kJoinTol ? t.b.v() : t.a.v();
    }
    Chain c;
    c.a = p;
    c.layer = b.tracks[cur].layer;
    c.net = b.tracks[cur].net;
    c.width = b.tracks[cur].width;
    bool ok = true;
    for (size_t guard = 0; guard <= b.tracks.size(); ++guard) {
      const Track& t = b.tracks[cur];
      if (used[cur] || t.locked) {
        ok = false;
        break;
      }
      used[cur] = 1;
      c.tracks.push_back(cur);
      c.length += t.length();
      p = (t.a.v() - p).len() <= kJoinTol ? t.b.v() : t.a.v();
      if (isEnd(t, p)) break;
      const auto& list = at(t, p);
      cur = list[0] == cur ? list[1] : list[0];
    }
    c.b = p;
    if (ok && (c.b - c.a).len() > kJoinTol) out.push_back(std::move(c));
  }
  return out;
}

// Drops collinear cell centres: the realiser pulls the path taut anyway.
Polyline simplify(const Polyline& pts) {
  Polyline out;
  for (Vec2 p : pts) {
    while (out.size() >= 2 && std::abs(orient(out[out.size() - 2], out.back(), p)) < 1e-6 * (p - out[out.size() - 2]).len2())
      out.pop_back();
    out.push_back(p);
  }
  return out;
}

}  // namespace

std::optional<Polyline> findPath(const Board& b, Vec2 from, Vec2 to, LayerId layer, int net, Coord width,
                                 const BBox& region, const std::vector<char>& ignore) {
  Grid g;
  g.box = region;
  double minClr = std::numeric_limits<double>::max();
  for (auto& nc : b.netClasses) minClr = std::min(minClr, double(nc.clearance));
  g.h = std::max(0.02 * kNmPerMm, minClr / 3);
  double area = region.width() * region.height();
  if (area / (g.h * g.h) > double(kMaxCells)) g.h = std::sqrt(area / double(kMaxCells));
  g.nx = std::max(2, int(std::ceil(region.width() / g.h)));
  g.ny = std::max(2, int(std::ceil(region.height() / g.h)));
  g.blocked.assign(size_t(g.nx) * size_t(g.ny), 0);
  double half = width / 2.0;
  LayerMask lm = LayerMask(1) << layer;
  // Copper of other nets with the clearance between the two nets. Half a cell of tolerance: wires
  // packed at the bare rule distance leave corridors a grid cannot hit exactly, and the path is
  // pulled taut (or checked) afterwards anyway.
  SpatialIndex idx;
  idx.build(b);
  const double tol = 0.5 * g.h;
  idx.query(region.inflated(double(b.maxClearance()) + half), lm, [&](ItemRef r) {
    int on = itemNet(b, r);
    if (on == net && net != kNoNet) return;
    if (r.type == ItemType::Track && r.index < int(ignore.size()) && ignore[r.index]) return;
    double req = requiredClearance(b, net, on, lm) + half - tol;
    if (r.type == ItemType::Zone) {
      for (auto& poly : b.zones[r.index].filled) g.markPolygon(poly, req);
      return;
    }
    for (auto& s : itemShapes(b, r)) g.mark(s, req);
  });
  // Routing keepouts of the layer: their areas, and their lines as barriers.
  for (const Keepout& k : b.keepouts) {
    if (!k.onLayer(layer) || !k.wires) continue;
    for (auto& sh : k.shapes()) {
      if (sh.kind == Shape::Kind::Polygon) g.markPolygon(sh.poly, half);
      else g.mark(sh, half);
    }
  }
  // Holes without copper still keep wires off.
  for (const Pad& p : b.pads)
    if (!p.onLayer(layer) && p.drill > 0) g.mark(Shape::circle(p.pos.v(), p.drill / 2.0), double(b.edgeClearance) + half);
  // The board edge, and everything outside the outline.
  if (!b.outline.empty()) {
    double ec = double(b.edgeClearance) + half;
    for (auto& loop : b.outline)
      for (size_t i = 0; i < loop.size(); ++i) g.mark(Shape::capsule(loop[i], loop[(i + 1) % loop.size()], 0), ec);
    for (int c = 0; c < int(g.blocked.size()); ++c)
      if (!g.blocked[c] && !pointInPolygon(g.centre(c), b.outline[0])) g.blocked[c] = 1;
  }
  int s = g.cell(from), t = g.cell(to);
  g.blocked[s] = g.blocked[t] = 0;

  // A* over 8 neighbours.
  const int N = int(g.blocked.size());
  std::vector<float> dist(size_t(N), std::numeric_limits<float>::infinity());
  std::vector<int> prev(size_t(N), -1);
  auto heur = [&](int c) {
    double dx = std::abs(c % g.nx - t % g.nx), dy = std::abs(c / g.nx - t / g.nx);
    return float(std::max(dx, dy) + (std::sqrt(2.0) - 1) * std::min(dx, dy));
  };
  using Item = std::pair<float, int>;
  std::priority_queue<Item, std::vector<Item>, std::greater<>> open;
  dist[s] = 0;
  open.push({heur(s), s});
  const int dx[8] = {1, -1, 0, 0, 1, 1, -1, -1}, dy[8] = {0, 0, 1, -1, 1, -1, 1, -1};
  const float cost[8] = {1, 1, 1, 1, float(std::sqrt(2.0)), float(std::sqrt(2.0)), float(std::sqrt(2.0)), float(std::sqrt(2.0))};
  bool found = false;
  while (!open.empty()) {
    auto [f, c] = open.top();
    open.pop();
    if (c == t) {
      found = true;
      break;
    }
    if (f - heur(c) > dist[c] + 1e-3f) continue;
    int x = c % g.nx, y = c / g.nx;
    for (int k = 0; k < 8; ++k) {
      int nx = x + dx[k], ny = y + dy[k];
      if (nx < 0 || ny < 0 || nx >= g.nx || ny >= g.ny) continue;
      int n = ny * g.nx + nx;
      if (g.blocked[n]) continue;
      // No corner cutting between two blocked cells.
      if (k >= 4 && (g.blocked[y * g.nx + nx] || g.blocked[ny * g.nx + x])) continue;
      float d = dist[c] + cost[k];
      if (d < dist[n]) {
        dist[n] = d;
        prev[n] = c;
        open.push({d + heur(n), n});
      }
    }
  }
  if (!found) {
    if (std::getenv("XR_REFINE_DEBUG")) {
      auto freeAround = [&](int c) {
        int x = c % g.nx, y = c / g.nx, nfree = 0;
        for (int k = 0; k < 8; ++k) {
          int nx = x + dx[k], ny = y + dy[k];
          if (nx >= 0 && ny >= 0 && nx < g.nx && ny < g.ny && !g.blocked[ny * g.nx + nx]) ++nfree;
        }
        return nfree;
      };
      std::fprintf(stderr, "  findPath L%d w%.3f grid %dx%d h%.3f: start (%.3f,%.3f) free nb %d, end (%.3f,%.3f) free nb %d\n", layer,
                   width / 1e6, g.nx, g.ny, g.h / 1e6, from.x / 1e6, -from.y / 1e6, freeAround(s), to.x / 1e6, -to.y / 1e6, freeAround(t));
    }
    return std::nullopt;
  }
  Polyline cells;
  for (int c = t; c != s; c = prev[c]) cells.push_back(g.centre(c));
  std::ranges::reverse(cells);
  Polyline path{from};
  // The first and last cells stand for the exact end points.
  for (size_t i = 0; i + 1 < cells.size(); ++i) path.push_back(cells[i]);
  path.push_back(to);
  return simplify(path);
}

std::vector<Track> routeConnection(const Board& b, Vec2 from, Vec2 to, LayerId layer, int net, Coord width) {
  BBox board = b.bbox();
  BBox region;
  region.add(from);
  region.add(to);
  region = region.inflated(std::max(3.0 * kNmPerMm, 0.5 * (to - from).len()));
  std::optional<Polyline> path = findPath(b, from, to, layer, net, width, region);
  if (!path && board.valid()) path = findPath(b, from, to, layer, net, width, board.inflated(kNmPerMm));
  if (!path) return {};
  Board trial = b;
  RealWire w;
  w.net = net;
  w.layer = layer;
  w.width = width;
  w.clearance = b.clearance(net, layer);
  w.sketch = *path;
  RealizeOptions ro;
  ro.tracksAsObstacles = true;
  BBox pb;
  for (Vec2 p : *path) pb.add(p);
  ro.region = pb.inflated(2 * kNmPerMm);
  size_t before = trial.tracks.size();
  realize(trial, {w}, {}, ro);
  return {trial.tracks.begin() + long(before), trial.tracks.end()};
}

RefineResult refine(Board& b, const RefineOptions& o) {
  auto t0 = std::chrono::steady_clock::now();
  RefineResult r;
  std::vector<char> chosen(b.tracks.size(), 0);
  if (o.tracks.empty())
    for (size_t i = 0; i < b.tracks.size(); ++i) chosen[i] = !b.tracks[i].locked;
  else
    for (int ti : o.tracks)
      if (ti >= 0 && ti < int(chosen.size())) chosen[ti] = 1;
  if (!o.nets.empty())
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (!std::ranges::contains(o.nets, b.tracks[i].net)) chosen[i] = 0;
  std::vector<Chain> chains = chainsOf(b, chosen);
  // Longest first: they gain the most and leave room for the rest.
  std::ranges::sort(chains, std::greater{}, &Chain::length);
  r.wires = int(chains.size());
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  std::vector<LayerId> signal;
  for (LayerId l : b.copperLayers())
    if (!b.layers[l].plane && (o.layers.empty() || std::ranges::contains(o.layers, l))) signal.push_back(l);

  for (size_t ci = 0; ci < chains.size(); ++ci) {
    if (o.cancel && o.cancel->load()) break;
    if (o.progress) o.progress(int(ci), int(chains.size()), "refine");
    Chain& c = chains[ci];
    r.lengthBefore += c.length;
    std::vector<char> ignore(b.tracks.size(), 0);
    BBox box;
    box.add(c.a);
    box.add(c.b);
    for (int ti : c.tracks) {
      ignore[ti] = 1;
      for (auto& s : itemShapes(b, {ItemType::Track, ti})) box.add(s.bbox());
    }
    double span = (c.b - c.a).len();
    BBox region = box.inflated(std::max(2.0 * kNmPerMm, 0.25 * span));
    BBox bb = b.bbox();
    if (bb.valid()) {
      region.minX = std::max(region.minX, bb.minX - kNmPerMm);
      region.minY = std::max(region.minY, bb.minY - kNmPerMm);
      region.maxX = std::min(region.maxX, bb.maxX + kNmPerMm);
      region.maxY = std::min(region.maxY, bb.maxY + kNmPerMm);
    }
    std::vector<LayerId> layers{c.layer};
    LayerMask assigned = b.assignedLayers(c.net);
    if (o.changeLayers)
      for (LayerId l : signal)
        if (l != c.layer && (!assigned || ((assigned >> l) & 1)) && edit::anchoredAt(b, c.a, l, c.net) && edit::anchoredAt(b, c.b, l, c.net))
          layers.push_back(l);

    BBox judge = region.inflated(double(b.maxClearance()));
    SpatialIndex idx0;
    idx0.build(b);
    int conflicts0 = regionConflicts(b, idx0, judge).count;
    std::optional<Board> best;
    double bestLen = c.length - std::max(0.05 * kNmPerMm, 0.01 * c.length);
    int bestGain = 0;  // conflicts removed by the best candidate over its own region
    LayerId bestLayer = c.layer;
    static const bool kDebug = std::getenv("XR_REFINE_DEBUG") != nullptr;
    for (LayerId l : layers) {
      Coord width = l == c.layer ? c.width : b.trackWidth(c.net, l);
      auto path = findPath(b, c.a, c.b, l, c.net, width, region, ignore);
      // A wire in violation is worth a search over the whole board, and at its minimum width.
      if (!path && conflicts0 > 0 && bb.valid()) path = findPath(b, c.a, c.b, l, c.net, width, bb.inflated(kNmPerMm), ignore);
      if (!path && conflicts0 > 0)
        if (Coord narrow = b.minTrackWidth(c.net, l); narrow > 0 && narrow < width) {
          width = narrow;
          path = findPath(b, c.a, c.b, l, c.net, width, region, ignore);
          if (!path && bb.valid()) path = findPath(b, c.a, c.b, l, c.net, width, bb.inflated(kNmPerMm), ignore);
        }
      if (kDebug && conflicts0 > 0 && !path)
        std::fprintf(stderr, "chain net %s L%d tracks %zu conflicts %d: layer %d no path\n", b.nets[c.net].name.c_str(),
                     c.layer, c.tracks.size(), conflicts0, l);
      if (!path) continue;
      // Two candidates: the path pulled taut with arcs, and the grid path itself (the taut one can
      // conflict again where the grid path, which keeps every clearance, did not).
      for (int raw = 0; raw < 2; ++raw) {
        Board trial = b;
        edit::Fragment f;
        f.tracks = c.tracks;
        edit::erase(trial, f);
        size_t before = trial.tracks.size();
        if (raw) {
          for (size_t i = 0; i + 1 < path->size(); ++i) {
            Track t;
            t.a = Point((*path)[i]);
            t.b = Point((*path)[i + 1]);
            t.width = width;
            t.layer = l;
            t.net = c.net;
            if (t.a != t.b) trial.tracks.push_back(t);
          }
        } else {
          RealWire w;
          w.net = c.net;
          w.layer = l;
          w.width = width;
          w.clearance = b.clearance(c.net, l);
          w.sketch = *path;
          RealizeOptions ro;
          ro.tracksAsObstacles = true;
          ro.region = region;
          realize(trial, {w}, {}, ro);
          narrowToFit(trial, before);
        }
        double len = 0;
        BBox judge1 = judge;  // the new path may lie far from the old one: judge both, before and after
        for (size_t i = before; i < trial.tracks.size(); ++i) {
          len += trial.tracks[i].length();
          for (auto& s : itemShapes(trial, {ItemType::Track, int(i)})) judge1.add(s.bbox().inflated(double(b.maxClearance())));
        }
        if (len <= 0) continue;
        SpatialIndex idx1;
        idx1.build(trial);
        int conflicts1 = regionConflicts(trial, idx1, judge1).count;
        int was = regionConflicts(b, idx0, judge1).count;
        if (kDebug && conflicts0 > 0)
          std::fprintf(stderr, "chain net %s L%d tracks %zu conflicts %d: layer %d path %zu pts, %s %.2f mm (was %.2f), conflicts %d -> %d\n",
                       b.nets[c.net].name.c_str(), c.layer, c.tracks.size(), conflicts0, l, path->size(), raw ? "grid" : "realised",
                       len / 1e6, c.length / 1e6, was, conflicts1);
        // Fewer conflicts first (the gain over the same region); among equals the shorter path.
        int gain = was - conflicts1;
        if (gain < bestGain || (gain == bestGain && len >= bestLen)) continue;
        if (Connectivity::compute(trial, idx1).ratsnest.size() > unrouted) continue;  // must join what it joined
        bestLen = len;
        bestGain = gain;
        bestLayer = l;
        best = std::move(trial);
        if (conflicts1 == 0 && !raw) break;  // the taut path is clean: no need for the angular one
      }
    }
    if (!best) {
      r.lengthAfter += c.length;
      continue;
    }
    // The chain's tracks left the list: the indices of the remaining chains move down.
    std::vector<int> gone = c.tracks;
    std::ranges::sort(gone);
    for (size_t k = ci + 1; k < chains.size(); ++k)
      for (int& ti : chains[k].tracks) ti -= int(std::ranges::lower_bound(gone, ti) - gone.begin());
    b = std::move(*best);
    ++r.improved;
    if (bestGain > 0) ++r.repaired;
    if (bestLayer != c.layer) ++r.layerChanges;
    r.lengthAfter += bestLen;
  }
  if (r.improved) r.viasRemoved = edit::removeExcessVias(b);
  r.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  return r;
}

}  // namespace xr::topo
