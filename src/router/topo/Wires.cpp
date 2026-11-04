#include "router/topo/Wires.h"

#include <algorithm>
#include <cstdlib>
#include <map>
#include <set>
#include <tuple>

#include "core/Edit.h"
#include "core/Prof.h"

namespace xr::topo {

WireGraph wireGraph(const Board& b, const std::vector<char>& chosen, double glue) {
  if (const char* e = std::getenv("XR_GLUE")) glue = std::atof(e);
  WireGraph g;
  g.relevant.assign(b.tracks.size(), 0);
  {
    std::set<int> nets;
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (chosen[i]) nets.insert(b.tracks[i].net);
    for (size_t i = 0; i < b.tracks.size(); ++i) g.relevant[i] = nets.contains(b.tracks[i].net);
  }
  double maxTol = edit::kJoinTol;
  for (const auto& t : b.tracks) maxTol = std::max(maxTol, glue * t.width);
  const Coord cell = Coord(maxTol) + 1;
  struct VEnd { int track; Point p; int vertex; };
  std::vector<VEnd> vends;
  std::map<std::tuple<Coord, Coord, LayerId, int>, std::vector<int>> cells;  // cell -> indices in vends
  g.vid.assign(b.tracks.size(), {-1, -1});
  for (size_t i = 0; i < b.tracks.size(); ++i)
    for (int e = 0; e < 2 && g.relevant[i]; ++e) {
      const Track& t = b.tracks[i];
      Point p = e ? t.b : t.a;
      Coord cx = p.x / cell, cy = p.y / cell;
      int found = -1;
      double best = 0;
      for (Coord dx = -1; dx <= 1 && found < 0; ++dx)
        for (Coord dy = -1; dy <= 1; ++dy) {
          auto it = cells.find({cx + dx, cy + dy, t.layer, t.net});
          if (it == cells.end()) continue;
          for (int k : it->second) {
            const VEnd& o = vends[k];
            double tol = std::max(edit::kJoinTol, glue * std::min<double>(t.width, b.tracks[o.track].width));
            double d = (o.p.v() - p.v()).len();
            if (d <= tol && (found < 0 || d < best)) found = o.vertex, best = d;
          }
        }
      int v = found >= 0 ? found : g.count++;
      g.vid[i][e] = v;
      cells[{cx, cy, t.layer, t.net}].push_back(int(vends.size()));
      vends.push_back({int(i), p, v});
    }
  g.ends.resize(g.count);
  g.tiny.assign(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!g.relevant[i]) continue;
    const Track& t = b.tracks[i];
    // Shorter than the glue (an arc too, if it does not go round anything: a wire that closes on
    // itself around a via is a loop, not a point).
    g.tiny[i] = g.vid[i][0] == g.vid[i][1] &&
                (!t.mid || (t.mid->v() - t.a.v()).len() <= std::max(edit::kJoinTol, glue * t.width));
    g.ends[g.vid[i][0]].push_back(int(i));
    g.ends[g.vid[i][1]].push_back(int(i));
  }
  return g;
}

namespace {

// Track j goes on the chain of track i. A width change ends the chain too: a 0.8 mm bus and its 0.3 mm
// branch to a pad are two wires (one wire took the bus width all the way to the pad: 0.1 mm from the
// neighbouring pads).
bool sameChain(const Board& b, int i, int j) {
  return b.tracks[i].net == b.tracks[j].net && b.tracks[i].layer == b.tracks[j].layer && !b.tracks[j].locked &&
         b.tracks[i].width == b.tracks[j].width;
}

}  // namespace

void growChains(const Board& b, std::vector<char>& chosen, const WireGraph& g) {
  std::vector<int> stack;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i]) stack.push_back(int(i));
  while (!stack.empty()) {
    int i = stack.back();
    stack.pop_back();
    for (int v : g.vid[i])
      for (int j : g.ends[v])
        if (!chosen[j] && sameChain(b, i, j)) {
          chosen[j] = 1;
          stack.push_back(j);
        }
  }
}

std::vector<char> growChains(const Board& b, std::vector<char> chosen, double glue) {
  chosen.resize(b.tracks.size(), 0);
  growChains(b, chosen, wireGraph(b, chosen, glue));
  return chosen;
}

OwnCopper::OwnCopper(const Board& b) : b_(b) { idx_.build(b, false, false); }

bool OwnCopper::touches(Point p, int net, LayerId layer) const {
  bool hit = false;
  BBox q;
  q.add(p.v());
  idx_.query(q.inflated(edit::kJoinTol), LayerMask(1) << layer, [&](ItemRef r) {
    if (hit || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b_, r) != net) return;
    for (auto& s : itemShapes(b_, r))
      if (s.distance(p.v()) <= 0) hit = true;
  });
  return hit;
}

std::optional<std::pair<Vec2, double>> OwnCopper::roundAt(Vec2 p, int net, LayerId layer) const {
  std::optional<std::pair<Vec2, double>> hit;
  BBox q;
  q.add(p);
  idx_.query(q.inflated(edit::kJoinTol), LayerMask(1) << layer, [&](ItemRef r) {
    if (hit || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b_, r) != net) return;
    if (r.type == ItemType::Via) {
      const Via& v = b_.vias[r.index];
      if ((v.pos.v() - p).len() <= v.diameter / 2.0) hit = {v.pos.v(), v.diameter / 2.0};
      return;
    }
    Shape sh = b_.pads[r.index].shapeGeom();
    if (sh.kind == Shape::Kind::Point && sh.distance(p) <= 0) hit = {sh.a, sh.r};
  });
  return hit;
}

std::vector<Vec2> OwnCopper::crossedBetween(Vec2 p, Vec2 q, int net, LayerId layer, Coord width) const {
  std::vector<std::pair<double, Vec2>> cuts;  // (parameter along p->q, point)
  BBox bb;
  bb.add(p);
  bb.add(q);
  idx_.query(bb.inflated(width), LayerMask(1) << layer, [&](ItemRef r) {
    if ((r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b_, r) != net) return;
    Vec2 c = r.type == ItemType::Pad ? b_.pads[r.index].pos.v() : b_.vias[r.index].pos.v();
    Vec2 on = closestPointOnSegment(c, p, q);
    if ((on - p).len() < edit::kJoinTol || (on - q).len() < edit::kJoinTol) return;  // already an end point
    for (auto& s : itemShapes(b_, r))
      if (s.distance(on) <= 0) {
        cuts.push_back({(on - p).len(), on});
        return;
      }
  });
  std::ranges::sort(cuts, {}, [](auto& c) { return c.first; });
  std::vector<Vec2> out;
  for (auto& [d, pt] : cuts) out.push_back(pt);
  return out;
}

std::vector<WireChain> wireChains(const Board& b, const WireGraph& g, const std::vector<char>& chosen,
                                  const OwnCopper& copper) {
  const auto& vid = g.vid;
  const auto& ends = g.ends;
  // Degree of each vertex among the chosen tracks (vertices are per layer and net already: wires of
  // other layers or nets may share a corner — TopoR lays parallel buses with coincident corners —
  // which is no branch of this chain); vias and pads also end chains.
  // A track with both ends glued into one vertex is that vertex, no branch of it: the realiser's own
  // short tangents (a few um between two arcs) cut a chain in two at the next F5, and the two wires
  // are no longer laid as one (F5 of an F5 result: arz 14 -> 25 violations, shorts in a via row).
  // Between tracks only: at the end of a chain it is the end. Dropped there, the wire would lose it
  // at every F5 until it comes off what it connects to (Arcs_master: +5B lost 53 um per pass).
  std::vector<int> degree(g.count, 0);
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && !g.tiny[i]) {
      degree[vid[i][0]]++;
      degree[vid[i][1]]++;
    }
  std::vector<char> inner(b.tracks.size(), 0);  // the tiny tracks that go with the wires through their vertex
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && g.tiny[i]) inner[i] = degree[vid[i][0]] >= 2;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && g.tiny[i] && !inner[i]) degree[vid[i][0]] += 2;
  auto isEnd = [&](int v, Point p, const Track& t) { return degree[v] != 2 || copper.touches(p, t.net, t.layer); };
  std::vector<char> used(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (inner[i]) used[i] = 1;
  std::vector<WireChain> out;
  auto walkFrom = [&](int start, int fromEnd, bool closed) {
    WireChain w;
    const Track& t0 = b.tracks[start];
    w.net = t0.net;
    w.layer = t0.layer;
    w.width = t0.width;
    w.closed = closed;
    int ti = start, curV = vid[start][fromEnd];
    w.path.push_back((fromEnd ? t0.b : t0.a).v());
    while (true) {
      used[ti] = 1;
      w.tracks.push_back(ti);
      const Track& t = b.tracks[ti];
      int nextEnd = (vid[ti][0] == curV) ? 1 : 0;
      Point next = nextEnd ? t.b : t.a;
      if (t.isArc()) {
        auto pts = t.path(20000);
        if (nextEnd == 0) std::ranges::reverse(pts);
        for (size_t k = 1; k + 1 < pts.size(); ++k) w.path.push_back(pts[k]);
      }
      if (w.path.back() != next.v()) w.path.push_back(next.v());
      curV = vid[ti][nextEnd];
      if (isEnd(curV, next, t)) break;
      int cont = -1;
      for (int j : ends[curV])
        if (chosen[j] && !used[j] && j != ti && sameChain(b, ti, j)) cont = j;
      if (cont < 0) break;
      for (int j : ends[curV])
        if (inner[j] && !std::ranges::contains(w.tracks, j)) w.tracks.push_back(j);
      ti = cont;
      // The glued ends may differ by a few um: the sketch continues from the next track's own end.
      Point from = vid[ti][0] == curV ? b.tracks[ti].a : b.tracks[ti].b;
      if (from != next) w.path.push_back(from.v());
    }
    out.push_back(std::move(w));
  };
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!chosen[i] || used[i]) continue;
    if (isEnd(vid[i][0], b.tracks[i].a, b.tracks[i])) walkFrom(int(i), 0, false);
    else if (isEnd(vid[i][1], b.tracks[i].b, b.tracks[i])) walkFrom(int(i), 1, false);
  }
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && !used[i]) walkFrom(int(i), 0, true);
  return out;
}

RealWire wireFor(const Board& b, int net, LayerId layer, Coord width, Polyline sketch) {
  RealWire w;
  w.net = net;
  w.layer = layer;
  w.width = width;
  w.widthMin = std::min(width, b.minTrackWidth(net, layer));
  w.clearance = b.clearance(net, layer);
  w.sketch = std::move(sketch);
  return w;
}

std::vector<RealWire> sketchesOf(const Board& b, const std::vector<WireChain>& chains, const OwnCopper& copper) {
  // A segment running through a pad or via of its own net (not at a vertex) connects it; the taut
  // path would leave it, so the chain is split at the point nearest to that anchor.
  std::vector<RealWire> wires;
  for (const WireChain& c : chains) {
    RealWire cur = wireFor(b, c.net, c.layer, c.width, {c.path.front()});
    for (size_t k = 1; k < c.path.size(); ++k) {
      Vec2 p = c.path[k - 1], q = c.path[k];
      for (Vec2 pt : copper.crossedBetween(p, q, c.net, c.layer, c.width)) {
        cur.sketch.push_back(pt);
        wires.push_back(cur);
        cur.sketch.clear();
        cur.sketch.push_back(pt);
      }
      cur.sketch.push_back(q);
    }
    wires.push_back(std::move(cur));
  }
  // A chain ending inside a via or a round pad of its net connects at the centre (TopoR's connection
  // point): the end snaps there, so the wire leaves the copper along the radius and no stub from the
  // centre to the old vertex is left bent against it. A wire lying wholly inside one such pad or via is
  // the copper itself and goes.
  std::erase_if(wires, [&](RealWire& w) {
    auto h0 = copper.roundAt(w.sketch.front(), w.net, w.layer), h1 = copper.roundAt(w.sketch.back(), w.net, w.layer);
    if (h0 && h1 && (h0->first - h1->first).len2() < 1 &&
        std::ranges::all_of(w.sketch, [&](Vec2 q) { return (q - h0->first).len() <= h0->second; }))
      return true;  // inside one pad or via
    if (h0) w.sketch.front() = h0->first;
    if (h1) w.sketch.back() = h1->first;
    return false;
  });
  return wires;
}

RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, const ReshapeOptions& o) {
  ProfScope pAll("reshapeTracks total");
  std::optional<ProfScope> phase;
  phase.emplace("reshapeTracks: chains");
  chosen.resize(b.tracks.size(), 0);
  WireGraph g = wireGraph(b, chosen, o.glue);
  growChains(b, chosen, g);
  if (o.around > 0) {
    // The neighbourhood: every unlocked track near a chosen one joins, with its whole chain.
    std::vector<char> add(b.tracks.size(), 0);
    for (size_t i = 0; i < b.tracks.size(); ++i) {
      if (!chosen[i]) continue;
      const Track& t = b.tracks[i];
      for (size_t j = 0; j < b.tracks.size(); ++j) {
        if (chosen[j] || add[j]) continue;
        const Track& u = b.tracks[j];
        if (u.locked || u.layer != t.layer || u.net == t.net) continue;
        if (!o.aroundNets.empty() && !std::ranges::contains(o.aroundNets, u.net)) continue;
        if (distSegmentSegment(t.a.v(), t.b.v(), u.a.v(), u.b.v()) < o.around + (t.width + u.width) / 2.0) add[j] = 1;
      }
    }
    bool any = false;
    for (size_t j = 0; j < b.tracks.size(); ++j)
      if (add[j]) { chosen[j] = 1; any = true; }
    if (any) {
      g = wireGraph(b, chosen, o.glue);
      growChains(b, chosen, g);
    }
  }
  OwnCopper copper(b);  // pads and vias are all the chain building asks about
  std::vector<RealWire> wires = sketchesOf(b, wireChains(b, g, chosen, copper), copper);
  if (wires.empty()) return {};
  std::vector<Track> keep;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (!chosen[i]) keep.push_back(b.tracks[i]);
  b.tracks = std::move(keep);
  // Zone fills on the touched layers no longer match the copper: drop them (refill in the CAD).
  for (auto& z : b.zones)
    for (auto& w : wires)
      if (z.layer == w.layer) { z.filled.clear(); break; }
  RealizeOptions opt;
  opt.tracksAsObstacles = true;
  // Chain ends in free space (branch points) stay where they are and keep other nets away.
  // One anchor per point, as wide as the widest wire meeting there (a thin branch off a wide bus).
  for (auto& w : wires)
    for (Vec2 p : {w.sketch.front(), w.sketch.back()}) {
      if (copper.touches(Point(p), w.net, w.layer)) continue;
      auto it = std::ranges::find_if(opt.anchors, [&](const RealizeOptions::Anchor& a) {
        return a.layer == w.layer && a.net == w.net && (a.pos - p).len2() < 1e6;
      });
      if (it != opt.anchors.end()) it->radius = std::max(it->radius, w.width / 2.0);
      else opt.anchors.push_back({p, w.layer, w.net, w.width / 2.0});
    }
  if (o.local) {
    BBox box;
    for (auto& w : wires)
      for (auto& p : w.sketch) box.add(p);
    opt.region = box.inflated(3 * kNmPerMm);
  }
  // All wires at once: nesting around shared obstacles keeps them apart. (Sequential realisation
  // with earlier wires as obstacles was tried and loses: a later sketch may cross an earlier taut
  // path and end up on the wrong side of it.)
  phase.emplace("reshapeTracks: realize");
  return realize(b, wires, {}, opt);
}

}  // namespace xr::topo
