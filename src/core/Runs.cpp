#include "core/Runs.h"

#include <algorithm>
#include <cstdlib>
#include <map>
#include <set>
#include <tuple>

#include "core/Edit.h"

namespace xr {

WireGraph wireGraph(const Board& b, const std::vector<char>& chosen, double glue, bool conductors) {
  if (const char* e = std::getenv("XR_GLUE")) glue = std::atof(e);
  WireGraph g;
  g.relevant.assign(b.tracks.size(), 0);
  {
    std::set<int> nets;
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (chosen[i]) nets.insert(b.tracks[i].net);
    // (The conductors of a zipped pair are not wires of their nets: the pair's axis is the wire, Convert.cpp.)
    for (size_t i = 0; i < b.tracks.size(); ++i) g.relevant[i] = nets.contains(b.tracks[i].net) && (conductors || b.tracks[i].zip < 0);
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
            double tol = glue < 0 ? 0.0 : std::max(edit::kJoinTol, glue * std::min<double>(t.width, b.tracks[o.track].width));
            double d = (o.p.v() - p.v()).len();
            if ((glue < 0 ? o.p == p : d <= tol) && (found < 0 || d < best)) found = o.vertex, best = d;
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
                (!t.mid || (t.mid->v() - t.a.v()).len() <= (glue < 0 ? 0.0 : std::max(edit::kJoinTol, glue * t.width)));
    g.ends[g.vid[i][0]].push_back(int(i));
    g.ends[g.vid[i][1]].push_back(int(i));
  }
  g.width.resize(b.tracks.size());
  for (size_t i = 0; i < b.tracks.size(); ++i) g.width[i] = b.tracks[i].width;
  return g;
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

std::vector<Chain> walkChains(const Board& b, const WireGraph& g, const std::vector<char>& chosenIn,
                              const std::function<bool(Point, int)>& stop, const std::function<bool(int, int)>& same) {
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
    if (degree[v] != 2 || (stop && stop(p, ti))) return true;
    for (int j : ends[v])
      if (chosen[j] && !g.tiny[j] && j != ti && !same(ti, j)) return true;
    return false;
  };
  std::vector<char> used(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (inner[i]) used[i] = 1;
  std::vector<Chain> out;
  auto walkFrom = [&](int start, int fromEnd, bool closed) {
    Chain c;
    c.closed = closed;
    int ti = start, curV = vid[start][fromEnd];
    c.vertex[0] = curV;
    while (true) {
      used[ti] = 1;
      const int nextEnd = (vid[ti][0] == curV) ? 1 : 0;
      c.steps.push_back({ti, nextEnd == 0, false});
      const Track& t = b.tracks[ti];
      const Point next = nextEnd ? t.b : t.a;
      curV = vid[ti][nextEnd];
      c.vertex[1] = curV;
      if (isEnd(curV, next, ti)) break;
      int cont = -1;
      for (int j : ends[curV])
        if (chosen[j] && !used[j] && j != ti && same(ti, j)) cont = j;
      if (cont < 0) break;
      for (int j : ends[curV])
        if (inner[j] && r::none_of(c.steps, [&](const ChainStep& s) { return s.track == j; })) c.steps.push_back({j, false, true});
      ti = cont;
    }
    out.push_back(std::move(c));
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

Point Run::start(const Board& b) const {
  const Track& t = b.tracks[size_t(steps.front().track)];
  return steps.front().reversed ? t.b : t.a;
}

std::vector<Run> buildRuns(const Board& b, const RunOptions& o, const std::vector<char>* chosen) {
  std::vector<char> all;
  if (!chosen) all.assign(b.tracks.size(), 1);
  const std::vector<char>& mask = chosen ? *chosen : all;
  const WireGraph g = wireGraph(b, mask, o.exact ? -1.0 : kWireGlue, true);
  std::optional<OwnCopper> copper;
  if (o.atCopper) copper.emplace(b);
  auto stop = [&](Point p, int ti) {
    const Track& t = b.tracks[size_t(ti)];
    const auto at = copper->at(p.v(), t.net, t.layer);
    return at && (at->type == ItemType::Via || (b.pads[size_t(at->index)].pos.v() - p.v()).len() <= edit::kJoinTol);
  };
  auto same = [&](int i, int j) {
    const Track &s = b.tracks[size_t(i)], &t = b.tracks[size_t(j)];
    return s.net == t.net && s.layer == t.layer && s.width == t.width && s.locked == t.locked && s.zip == t.zip;
  };
  std::vector<Run> out;
  for (Chain& c : walkChains(b, g, mask, copper ? std::function<bool(Point, int)>(stop) : nullptr, same)) {
    const Track& t = b.tracks[size_t(c.steps.front().track)];
    out.push_back({t.layer, t.net, t.width, t.locked, t.zip, c.closed, std::move(c.steps)});
  }
  return out;
}

}  // namespace xr
