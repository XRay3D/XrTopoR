#include "router/topo/ModelRefine.h"

#include <algorithm>
#include <cstdlib>
#include <format>
#include <print>

#include "core/Prof.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "topo/Relay.h"

namespace xr::topo {

RefineModelResult refineModel(Board& b, Topology& t, const RefineModelOptions& o) {
  ProfScope pAll("F6 model total");
  RefineModelResult r;
  int nFlips = 0;
  if (!prepareModel(t, o.flips, false, nFlips, r.violations)) return r;

  // The model drawn on a copy of the board (the model's own wires keep the tracks of the board they came with).
  struct Drawn {
    Topology owning;
    Board board;
    DrawingScore score;
    RealizeStats stats;
    int wires = 0;
  };
  auto draw = [&] {
    ProfScope p("F6 model: drawing");
    Drawn d{t, b, {}, {}, 0};
    drawModel(d.board, d.owning, true, d.stats, d.wires);
    d.score = scoreDrawing(d.board);
    ++r.drawings;
    return d;
  };
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  size_t wasCrossings = 0;
  if (debug)
    for (const LayerMesh& m : t.layers) wasCrossings += t.findCrossings(m).size();
  Drawn best = draw();
  r.conflictsBefore = best.score.conflicts;
  r.lengthBefore = best.score.length;
  r.log.push_back(std::format("start: {} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm", best.score.conflicts, best.score.places,
                              best.score.shortfall / 1e6, best.score.length / 1e6));

  // The wires that go round something: the longest way round first.
  struct Candidate {
    int wire;
    double detour;
  };
  std::vector<Candidate> order;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked || w.cross.empty() || w.end[0] < 0 || w.end[1] < 0) continue;
    const LayerMesh& m = *t.mesh(w.layer);
    const double straight = (m.verts[w.endVertex[1]].p - m.verts[w.endVertex[0]].p).len();
    const double detour = tautLength(t, wi) - straight;
    if (detour >= o.detour) order.push_back({wi, detour});
  }
  std::ranges::sort(order, [](const Candidate& x, const Candidate& y) { return x.detour > y.detour; });
  for (const Candidate& c : order) {
    ++r.wires;
    const double was = tautLength(t, c.wire);
    std::optional<RelayPath> path;
    {
      ProfScope p("F6 model: search");
      path = findRelay(t, c.wire);
    }
    if (!path) continue;
    Topology saved = t;
    applyRelay(t, c.wire, *path);
    if (debug) {
      // The model whole after the re-lay: its invariants, and no wires of two nets crossing.
      auto bad = t.check();
      size_t crossings = 0;
      for (const LayerMesh& m : t.layers) crossings += t.findCrossings(m).size();
      if (!bad.empty() || crossings > wasCrossings)
        std::println(stderr, "F6 model: wire {} of {} re-laid: {} invariant(s) broken ({}), {} crossing(s) (were {})", c.wire, b.nets[t.wires[c.wire].net].name,
                     bad.size(), bad.empty() ? "" : bad.front(), crossings, wasCrossings);
    }
    const double now = tautLength(t, c.wire);
    if (now > was - std::max(o.gain, o.gainPart * was)) {
      t = std::move(saved);
      continue;
    }
    ++r.found;
    Drawn cur = draw();
    const bool kept = betterDrawing(cur.score, best.score);
    r.log.push_back(std::format("wire {} of {}: {:.2f} -> {:.2f} mm in the model; {} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm: {}", c.wire,
                                b.nets[t.wires[c.wire].net].name, was / 1e6, now / 1e6, cur.score.conflicts, cur.score.places, cur.score.shortfall / 1e6,
                                cur.score.length / 1e6, kept ? "kept" : "left as it was"));
    if (kept) {
      best = std::move(cur);
      ++r.relaid;
    } else {
      t = std::move(saved);
    }
  }
  t = std::move(best.owning);
  b = std::move(best.board);
  r.stats = best.stats;
  r.drawn = true;
  r.conflictsAfter = best.score.conflicts;
  r.lengthAfter = best.score.length;
  if (o.junctions) {
    // The branch points to their balance: TopoR's F6 moves them (8 of 25 on Arcs_standard_routing) and no via.
    OptimizeModelOptions mo;
    mo.flips = false;
    mo.vias = false;
    mo.merge = false;  // ... and merges none with its pad (25 before and after): they are held off their own copper
    mo.hold = 3;
    mo.decay = 0.6;
    mo.floor = 0.05 * kNmPerMm;
    OptimizeModelResult jr = optimizeModel(b, t, mo);
    if (jr.drawn) {
      r.junctionMoves = jr.junctionMoves;
      r.drawings += jr.drawings;
      r.conflictsAfter = jr.conflictsAfter;
      r.lengthAfter = jr.lengthAfter;
      r.stats = jr.stats;
      r.log.push_back(std::format("branch points: {} moved; {} conflict(s), {:.1f} mm", jr.junctionMoves, jr.conflictsAfter, jr.lengthAfter / 1e6));
    }
  }
  return r;
}

}  // namespace xr::topo
