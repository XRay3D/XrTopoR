#include "topo/Chains.h"

#include <algorithm>
#include <cstdlib>
#include <map>
#include <print>
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
    // (The conductors of a zipped pair are not wires of their nets: the pair's axis is the wire, Convert.cpp.)
    for (size_t i = 0; i < b.tracks.size(); ++i) g.relevant[i] = nets.contains(b.tracks[i].net) && b.tracks[i].zip < 0;
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
  g.width.resize(b.tracks.size());
  for (size_t i = 0; i < b.tracks.size(); ++i) g.width[i] = b.tracks[i].width;
  return g;
}

void effectiveWidths(const Board& b, WireGraph& g, const OwnCopper& copper) {
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  // What a vertex is: a node (own copper, a branch, a free end) or a point in series.
  std::vector<int> degree(size_t(g.count), 0);
  std::vector<char> node(size_t(g.count), 0), inCopper(size_t(g.count), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!g.relevant[i] || g.tiny[i]) continue;
    const Track& t = b.tracks[i];
    for (int e = 0; e < 2; ++e) {
      int v = g.vid[i][e];
      ++degree[size_t(v)];
      if (copper.touches(e ? t.b : t.a, t.net, t.layer)) node[size_t(v)] = inCopper[size_t(v)] = 1;
      if (t.locked) node[size_t(v)] = 1;
    }
  }
  for (int v = 0; v < g.count; ++v)
    if (degree[size_t(v)] != 2) node[size_t(v)] = 1;
  auto otherAt = [&](int v, int ti) {
    for (int j : g.ends[size_t(v)])
      if (j != ti && !g.tiny[j]) return j;
    return -1;
  };
  for (int pass = 0; pass < 4; ++pass) {
    bool changed = false;
    std::vector<char> seen(b.tracks.size(), 0);
    for (size_t i0 = 0; i0 < b.tracks.size(); ++i0) {
      if (!g.relevant[i0] || g.tiny[i0] || seen[i0] || b.tracks[i0].locked) continue;
      // The run of this width through the points in series.
      const Coord w = g.width[i0];
      std::vector<int> run{int(i0)};
      seen[i0] = 1;
      int endV[2], beyond[2];  // the run's end vertices and the tracks beyond them (-1 at a node)
      for (int dir = 0; dir < 2; ++dir) {
        int ti = int(i0), v = g.vid[i0][dir];
        while (true) {
          endV[dir] = v;
          beyond[dir] = -1;
          if (node[size_t(v)]) break;
          int o = otherAt(v, ti);
          if (o < 0) break;
          if (g.width[size_t(o)] != w || b.tracks[size_t(o)].locked || seen[size_t(o)]) {
            beyond[dir] = o;
            break;
          }
          seen[size_t(o)] = 1;
          run.push_back(o);
          v = g.vid[size_t(o)][0] == v ? g.vid[size_t(o)][1] : g.vid[size_t(o)][0];
          ti = o;
        }
      }
      if (endV[0] == endV[1]) continue;  // a loop
      double len = 0;
      for (int ti : run) len += b.tracks[size_t(ti)].length();
      const Coord w0 = beyond[0] >= 0 ? g.width[size_t(beyond[0])] : 0, w1 = beyond[1] >= 0 ? g.width[size_t(beyond[1])] : 0;
      Coord to = w;
      if (w0 > w && w1 == w0) {
        to = w0;  // a neck of the wider wire
      } else if (len <= kStubAbsorb * double(w)) {
        const bool thin0 = w0 > 0 && w0 < w, thin1 = w1 > 0 && w1 < w;
        // A stub at a node (a pad, a via, a branch: not a free end), or a bulge between two thinner runs.
        auto real = [&](int v) { return degree[size_t(v)] != 1 || inCopper[size_t(v)]; };
        if (thin0 && thin1) to = std::min(w0, w1);
        else if (thin0 && beyond[1] < 0 && real(endV[1])) to = w0;
        else if (thin1 && beyond[0] < 0 && real(endV[0])) to = w1;
      }
      if (debug && (w0 > 0 || w1 > 0)) {
        const Track& t = b.tracks[run.front()];
        std::println(stderr, "run net {} L{} w{:.3f} len {:.3f} mm near ({:.3f},{:.3f}): beyond {:.3f} / {:.3f}, ends {} / {} -> {:.3f}", b.nets[t.net].name,
                     int(t.layer), w / 1e6, len / 1e6, t.a.x / 1e6, t.a.y / 1e6, w0 / 1e6, w1 / 1e6, degree[size_t(endV[0])], degree[size_t(endV[1])], to / 1e6);
      }
      if (to != w) {
        for (int ti : run) g.width[size_t(ti)] = to;
        changed = true;
      }
    }
    if (!changed) break;
  }
}

namespace {

// Track j goes on the chain of track i. A width change ends the chain too: a 0.8 mm bus and its 0.3 mm
// branch to a pad are two wires (one wire took the bus width all the way to the pad: 0.1 mm from the
// neighbouring pads).
bool sameChain(const Board& b, const WireGraph& g, int i, int j) {
  return b.tracks[i].net == b.tracks[j].net && b.tracks[i].layer == b.tracks[j].layer && !b.tracks[j].locked && g.width[i] == g.width[j];
}

}  // namespace

void growChains(const Board& b, std::vector<char>& chosen, const WireGraph& g) {
  std::vector<int> stack;
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (chosen[i] && !g.relevant[i]) chosen[i] = 0;  // a pair's conductor: no chain of its own
    if (chosen[i]) stack.push_back(int(i));
  }
  while (!stack.empty()) {
    int i = stack.back();
    stack.pop_back();
    for (int v : g.vid[i])
      for (int j : g.ends[v])
        if (!chosen[j] && sameChain(b, g, i, j)) {
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

std::optional<ItemRef> OwnCopper::at(Vec2 p, int net, LayerId layer) const {
  std::optional<ItemRef> hit;
  BBox q;
  q.add(p);
  idx_.query(q.inflated(edit::kJoinTol), LayerMask(1) << layer, [&](ItemRef r) {
    if (hit || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b_, r) != net) return;
    for (auto& s : itemShapes(b_, r))
      if (s.distance(p) <= 0) hit = r;
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
  r::sort(cuts, {}, &std::pair<double, Vec2>::first);
  std::vector<Vec2> out;
  for (auto& [d, pt] : cuts) out.push_back(pt);
  return out;
}

std::vector<WireChain> wireChains(const Board& b, const WireGraph& g, const std::vector<char>& chosenIn,
                                  const OwnCopper& copper) {
  // (A track the graph does not hold, a pair's conductor, is no part of any chain however chosen.)
  std::vector<char> chosen(chosenIn);
  for (size_t i = 0; i < chosen.size() && i < g.relevant.size(); ++i) chosen[i] = chosen[i] && g.relevant[i];
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
  // A vertex of degree 2 whose other track is no continuation (a width change, a locked track) ends the
  // chain too; else a piece between two such vertices has no end to start from and is filed as a loop,
  // and dropped with it (a bus narrowed over a tight spot: its three pieces, two of them lost).
  auto isEnd = [&](int v, Point p, int ti) {
    const Track& t = b.tracks[ti];
    if (degree[v] != 2 || copper.touches(p, t.net, t.layer)) return true;
    for (int j : ends[v])
      if (chosen[j] && !g.tiny[j] && j != ti && !sameChain(b, g, ti, j)) return true;
    return false;
  };
  std::vector<char> used(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (inner[i]) used[i] = 1;
  std::vector<WireChain> out;
  auto walkFrom = [&](int start, int fromEnd, bool closed) {
    WireChain w;
    const Track& t0 = b.tracks[start];
    w.net = t0.net;
    w.layer = t0.layer;
    w.width = g.width[start];
    w.closed = closed;
    int ti = start, curV = vid[start][fromEnd];
    w.vertex[0] = curV;
    w.path.push_back((fromEnd ? t0.b : t0.a).v());
    while (true) {
      used[ti] = 1;
      w.tracks.push_back(ti);
      const Track& t = b.tracks[ti];
      int nextEnd = (vid[ti][0] == curV) ? 1 : 0;
      Point next = nextEnd ? t.b : t.a;
      if (t.isArc()) {
        auto pts = t.path(20000);
        if (nextEnd == 0) r::reverse(pts);
        for (size_t k = 1; k + 1 < pts.size(); ++k) w.path.push_back(pts[k]);
      }
      if (w.path.back() != next.v()) w.path.push_back(next.v());
      curV = vid[ti][nextEnd];
      w.vertex[1] = curV;
      if (isEnd(curV, next, ti)) break;
      int cont = -1;
      for (int j : ends[curV])
        if (chosen[j] && !used[j] && j != ti && sameChain(b, g, ti, j)) cont = j;
      if (cont < 0) break;
      for (int j : ends[curV])
        if (inner[j] && !r::contains(w.tracks, j)) w.tracks.push_back(j);
      ti = cont;
      // The glued ends may differ by a few um: the sketch continues from the next track's own end.
      Point from = vid[ti][0] == curV ? b.tracks[ti].a : b.tracks[ti].b;
      if (from != next) w.path.push_back(from.v());
    }
    out.push_back(std::move(w));
  };
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!chosen[i] || used[i]) continue;
    if (isEnd(vid[i][0], b.tracks[i].a, int(i))) walkFrom(int(i), 0, false);
    else if (isEnd(vid[i][1], b.tracks[i].b, int(i))) walkFrom(int(i), 1, false);
  }
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && !used[i]) walkFrom(int(i), 0, true);
  return out;
}

}  // namespace xr::topo
