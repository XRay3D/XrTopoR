#include "router/topo/Wires.h"

#include <algorithm>
#include <cstdlib>
#include <limits>
#include <map>
#include <set>
#include <tuple>

#include "core/Edit.h"
#include "core/Prof.h"
#include "topo/PadExit.h"

namespace xr::topo {

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
  // A wire lying wholly inside one pad of its net that the realiser draws its pattern in (topo/PadExit.h:
  // centre, inner point, out) is a lead of an earlier pass or a run drawn by hand: it goes too, the wire
  // that leaves the pad is led from the centre anew — through the point the lead from the centre ended at.
  struct Run {
    int pad;
    LayerId layer;
    Vec2 a, b;
  };
  std::vector<Run> runs;  // the wires dropped inside the pads
  auto padOf = [&](const RealWire& w, Vec2 p) -> int {
    auto r = copper.at(p, w.net, w.layer);
    return r && r->type == ItemType::Pad ? r->index : -1;
  };
  std::erase_if(wires, [&](RealWire& w) {
    auto h0 = copper.roundAt(w.sketch.front(), w.net, w.layer), h1 = copper.roundAt(w.sketch.back(), w.net, w.layer);
    if (h0 && h1 && (h0->first - h1->first).len2() < 1 &&
        std::ranges::all_of(w.sketch, [&](Vec2 q) { return (q - h0->first).len() <= h0->second; }))
      return true;  // inside one pad or via
    if (h0) w.sketch.front() = h0->first;
    if (h1) w.sketch.back() = h1->first;
    const int p0 = padOf(w, w.sketch.front()), p1 = padOf(w, w.sketch.back());
    if (p0 >= 0 && p0 == p1) {
      const Shape sh = b.pads[p0].shapeGeom();
      if (padFrame(b.pads[p0]).kind != PadFrame::Kind::Other &&
          std::ranges::all_of(w.sketch, [&](Vec2 q) { return sh.distance(q) <= kPadEdgeTol; })) {
        runs.push_back({p0, w.layer, w.sketch.front(), w.sketch.back()});
        return true;
      }
    }
    return false;
  });
  // The inner point a wire was led to: back from its end along the dropped runs to the one that begins at
  // the pad's centre.
  for (RealWire& w : wires)
    for (int end = 0; end < 2; ++end) {
      Vec2 cur = end ? w.sketch.back() : w.sketch.front();
      const int pad = padOf(w, cur);
      if (pad < 0) continue;
      const Vec2 centre = padFrame(b.pads[pad]).c;
      std::vector<char> used(runs.size(), 0);
      for (int step = 0; step < 16 && (cur - centre).len() > edit::kJoinTol; ++step) {
        int next = -1;
        bool atA = false;
        for (size_t i = 0; i < runs.size() && next < 0; ++i) {
          if (used[i] || runs[i].pad != pad || runs[i].layer != w.layer) continue;
          if ((runs[i].a - cur).len() <= edit::kJoinTol) { next = int(i); atA = true; }
          else if ((runs[i].b - cur).len() <= edit::kJoinTol) next = int(i);
        }
        if (next < 0) break;
        used[next] = 1;
        const Vec2 other = atA ? runs[next].b : runs[next].a;
        if ((other - centre).len() <= edit::kJoinTol) {
          w.inner[end] = cur;
          break;
        }
        cur = other;
      }
    }
  return wires;
}

RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, const ReshapeOptions& o) {
  ProfScope pAll("reshapeTracks total");
  std::optional<ProfScope> phase;
  phase.emplace("reshapeTracks: chains");
  chosen.resize(b.tracks.size(), 0);
  OwnCopper copper(b);  // pads and vias are all the chain building asks about
  WireGraph g = wireGraph(b, chosen, o.glue);
  effectiveWidths(b, g, copper);
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
      effectiveWidths(b, g, copper);
      growChains(b, chosen, g);
    }
  }
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
