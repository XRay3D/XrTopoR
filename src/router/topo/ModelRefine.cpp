#include "router/topo/ModelRefine.h"

#include "router/topo/ModelSimplify.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <format>
#include <optional>
#include <print>
#include <set>
#include <string>

#include "core/Connectivity.h"
#include "core/Prof.h"
#include "router/topo/ModelBranch.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "router/topo/ModelVias.h"
#include "topo/Relay.h"

namespace xr::topo {

RefineModelResult refineModel(Board& b, Topology& t, const RefineModelOptions& o) {
  ProfScope pAll("F6 model total");
  RefineModelResult r;
  int nFlips = 0;
  r.untangled = resolveCrossings(b, t);
  if (o.simplify) {
    const SimplifyResult sr = simplifyNets(b, t);
    r.spareLinks = sr.links;
    r.spareVias = sr.vias;
    r.log.insert(r.log.end(), sr.log.begin(), sr.log.end());
  }
  if (!prepareModel(t, o.flips, false, nFlips, r.violations)) return r;

  // The model drawn on a copy of the board (the model's own wires keep the tracks of the board they came with).
  struct Drawn {
    Topology owning;
    Board board;
    DrawingScore score;
    RealizeStats stats;
    int wires = 0;
    std::shared_ptr<const ModelDrawing> kept;  // the drawing itself: the next one of the same wires is brought up from it
  };
  // The drawing of the model as the tools left it (the board's): what a tool's first drawing is brought up from.
  std::shared_ptr<const ModelDrawing> standing;
  auto draw = [&](const std::shared_ptr<const ModelDrawing>& from) {
    ProfScope p("F6 model: drawing");
    Drawn d{t, b, {}, {}, 0, {}};
    auto kept = std::make_shared<ModelDrawing>();
    drawModel(d.board, d.owning, true, d.stats, d.wires, false, nullptr, kept.get(), from.get());
    d.kept = std::move(kept);
    d.score = scoreDrawing(d.board);
    ++r.drawings;
    return d;
  };
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  size_t wasCrossings = 0;
  if (debug)
    for (const LayerMesh& m : t.layers) wasCrossings += t.findCrossings(m).size();
  bool first = true;
  bool counting = true;  // the wires tried are counted in the first pass
  std::set<std::pair<int, long>> refused;  // (wire, the length of its new path in um): led so, the drawing was no better
  std::set<std::pair<int, std::vector<int>>> refusedPairs;  // (wire, the wires taken out for it): the same of a clinch
  int clinchesOfMany = 0;  // clinches undone with more than one wire taken out
  std::vector<char> fixedNets(b.nets.size(), 0);  // the flexibly fixed nets: their wires are not laid anew
  for (int n = 0; n < int(b.nets.size()); ++n) fixedNets[size_t(n)] = b.flexFixed(n);
  auto among = [&](const std::vector<int>& ws) {
    std::string out;
    for (int x : ws) out += std::format("{} wire {} of {}", out.empty() ? " in a clinch with" : ",", x, b.nets[t.wires[size_t(x)].net].name);
    return out;
  };
  // One pass of re-laying over the model as it stands: the board and the model are left at the best drawing.
  auto relay = [&] {
  Drawn best = draw(standing);
  if (first) {
    r.conflictsBefore = best.score.conflicts;
    r.lengthBefore = best.score.length;
    r.log.push_back(std::format("start: {} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm", best.score.conflicts, best.score.places,
                                best.score.shortfall / 1e6, best.score.length / 1e6));
    first = false;
  }
  // The wires that go round something: the longest way round first.
  struct Candidate {
    int wire;
    double detour;
  };
  std::vector<Candidate> order;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked || b.flexFixed(w.net) || w.cross.empty() || w.end[0] < 0 || w.end[1] < 0) continue;  // a flexibly fixed net keeps its paths
    const LayerMesh& m = *t.mesh(w.layer);
    const double straight = (m.verts[w.endVertex[1]].p - m.verts[w.endVertex[0]].p).len();
    const double detour = tautLength(t, wi) - straight;
    if (detour >= o.detour) order.push_back({wi, detour});
  }
  r::sort(order, std::greater{}, &Candidate::detour);
  // No wire is led past a via that has yet to step off copper it is too close to (F7 does that): it would
  // take the room the via has to step into.
  const std::vector<char> unsettled = viasTooClose(b, t);
  // The wires of other nets that may hold a wire in a clinch: those crossing an edge at a vertex of the copper
  // the wire ends on (wiresRound).
  auto holders = [&](int wi) {
    const Wire& w = t.wires[size_t(wi)];
    return wiresRound(t, w.layer, w.end[0], w.end[1], w.net, wi, &fixedNets);
  };
  for (const Candidate& c : order) {
    if (counting) ++r.wires;
    const double was = tautLength(t, c.wire);
    std::optional<Topology> saved;
    double wasAll = was, now = 0;
    std::vector<int> partners;
    bool found = false;
    {
      std::optional<RelayPath> path;
      {
        ProfScope p("F6 model: search");
        path = findRelay(t, c.wire, &unsettled);
      }
      if (path) {
        saved = t;
        applyRelay(t, c.wire, *path);
        now = tautLength(t, c.wire);
        // ... and a path the drawing has refused is not drawn again in a later pass.
        found = now <= was - std::max(o.gain, o.gainPart * was) && !refused.contains({c.wire, std::lround(now / 1000)});
        if (!found) t = std::move(*saved);
      }
    }
    if (!found && o.clinches) {
      // No shorter way alone: with the wires that hold it taken out, and laid anew after it (a hindering wire
      // goes the other side of the long one's end). All of them shorter in sum, or nothing.
      ProfScope p("F6 model: clinches");
      std::vector<int> hs = holders(c.wire);
      std::erase_if(hs, [&](int h) { return refusedPairs.contains({c.wire, std::vector<int>{h}}); });
      while (!found && !hs.empty()) {
        const std::optional<PastResult> past = relayPast(t, c.wire, hs, was - std::max(o.gain, o.gainPart * was), &unsettled, saved);
        if (!past) break;
        std::vector<int> key = past->taken;
        r::sort(key);
        now = past->length + past->othersAfter;
        wasAll = was + past->othersBefore;
        if (now <= wasAll - std::max(o.gain, o.gainPart * wasAll) && !refusedPairs.contains({c.wire, key})) {
          found = true;
          partners = std::move(key);
          if (partners.size() > 1) ++clinchesOfMany;
          break;
        }
        t = std::move(*saved);
        if (key.size() != 1) break;
        std::erase(hs, key.front());  // not with this one: the next that holds it
      }
    }
    if (!found) continue;
    if (debug) {
      // The model whole after the re-lay: its invariants, and no wires of two nets crossing.
      auto bad = t.check();
      size_t crossings = 0;
      for (const LayerMesh& m : t.layers) crossings += t.findCrossings(m).size();
      if (!bad.empty() || crossings > wasCrossings)
        std::println(stderr, "F6 model: wire {} of {} re-laid: {} invariant(s) broken ({}), {} crossing(s) (were {})", c.wire, b.nets[t.wires[c.wire].net].name,
                     bad.size(), bad.empty() ? "" : bad.front(), crossings, wasCrossings);
    }
    ++r.found;
    Drawn cur = draw(best.kept);
    const bool kept = betterDrawing(cur.score, best.score);
    r.log.push_back(std::format("wire {} of {}{}: {:.2f} -> {:.2f} mm in the model; {} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm: {}", c.wire,
                                b.nets[t.wires[c.wire].net].name,
                                among(partners), wasAll / 1e6,
                                now / 1e6, cur.score.conflicts, cur.score.places, cur.score.shortfall / 1e6, cur.score.length / 1e6, kept ? "kept" : "left as it was"));
    if (kept) {
      best = std::move(cur);
      ++r.relaid;
      if (!partners.empty()) ++r.clinches;
    } else {
      t = std::move(*saved);
      if (!partners.empty())
        refusedPairs.insert({c.wire, partners});
      else
        refused.insert({c.wire, std::lround(now / 1000)});
    }
  }
  t = std::move(best.owning);
  b = std::move(best.board);
  standing = best.kept;
  r.stats = best.stats;
  r.drawn = true;
  r.conflictsAfter = best.score.conflicts;
  r.lengthAfter = best.score.length;
  };
  // A wire re-laid leaves room where it lay and takes none where it could not pass: the passes go on while one
  // re-lays something (on Arcs_standard_routing the second finds 3 wires more, 4 mm; the third none).
  auto relayAll = [&] {
    const int before = r.relaid;
    for (int pass = 0; pass < 3; ++pass) {
      const int was = r.relaid;
      relay();
      counting = false;
      if (r.relaid == was) break;
    }
    return r.relaid > before;
  };
  // The wires of a zone's net lying wholly in its pour are copper twice over: they go, where the pour
  // connects what they did (a track from a pad through a thermal relief into the pour stays: its ends
  // are not in one polygon of the fill). The model is built anew after.
  auto zoneTracks = [&] {
    if (!o.zoneTracks) return false;
    int removed = 0;
    std::vector<int> candidates;
    for (int wi = 0; wi < int(t.wires.size()); ++wi) {
      const Wire& w = t.wires[size_t(wi)];
      if (!w.locked || w.zone < 0 || t.owners[w.zone].net != w.net || w.tracks.empty() || fixedNets[size_t(w.net)]) continue;
      const Zone& z = b.zones[t.owners[w.zone].zone];
      std::vector<const Track*> tracks;
      bool handLocked = false;
      for (uint32_t id : w.tracks)
        for (const Track& tr : b.tracks)
          if (tr.id == id) {
            tracks.push_back(&tr);
            handLocked |= tr.locked;
          }
      if (handLocked || tracks.size() != w.tracks.size()) continue;
      bool inOne = false;
      for (const auto& poly : z.filled) {
        const Shape fill = Shape::polygon(poly);
        bool all = true;
        for (const Track* tr : tracks)
          for (Vec2 p : tr->path())
            if (fill.distance(p) > 0) all = false;
        if (all) inOne = true;
      }
      if (inOne) candidates.push_back(wi);
    }
    if (candidates.empty()) return false;
    auto linesOf = [&](const Board& board, int net) {
      size_t n = 0;
      for (const RatsLine& l : Connectivity::compute(board).ratsnest) n += l.net == net;
      return n;
    };
    const Board before = b;  // (the board `t` is the model of: it follows the tracks' going from here)
    for (int wi : candidates) {
      const Wire& w = t.wires[size_t(wi)];
      const size_t was = linesOf(b, w.net);
      Board trial = b;
      std::erase_if(trial.tracks, [&](const Track& tr) { return tr.id && r::contains(w.tracks, tr.id); });
      if (linesOf(trial, w.net) > was) continue;  // the pour does not connect what it did
      b = std::move(trial);
      ++removed;
      r.log.push_back(std::format("wire of {} in the pour of its net taken out ({} tracks)", b.nets[size_t(w.net)].name, w.tracks.size()));
    }
    if (removed == 0) return false;
    r.zoneTracksRemoved += removed;
    Topology::assignIds(b);
    {
      Topology followed;
      modelOfEdited(followed, b, {&t, &before, {}});
      t = std::move(followed);
    }
    standing.reset();
    if (!prepareModel(t, o.flips, false, nFlips, r.violations)) return false;
    refused.clear();
    refusedPairs.clear();
    return true;
  };
  zoneTracks();
  relayAll();
  // The vias that need not be: a wire re-laid goes on where it did not, and the wires of a via gone are led
  // anew.
  auto vias = [&] {
    if (!o.vias) return false;
    ViaOptions vo;
    vo.flips = o.flips;
    vo.span = o.viaSpan;
    vo.drawing = standing;
    ViaResult vr = removeVias(b, t, vo);
    standing = vr.drawing;
    r.viasRemoved += vr.removed;
    r.drawings += vr.drawings;
    for (const std::string& l : vr.log) r.log.push_back(l);
    if (vr.removed > 0) {  // the model is built anew: other wires under the numbers
      refused.clear();
      refusedPairs.clear();
    }
    return vr.removed > 0;
  };
  if (vias()) relayAll();
  // The branch points to their balance: TopoR's F6 moves them (8 of 25 on Arcs_standard_routing) and no via.
  auto relax = [&] {
    if (!o.junctions) return;
    OptimizeModelOptions mo;
    mo.flips = false;
    mo.vias = false;
    mo.merge = false;  // ... and merges none with its pad (25 before and after): they are held off their own copper
    mo.hold = 3;
    mo.decay = 0.6;
    mo.floor = 0.05 * kNmPerMm;
    mo.simplify = false;
    OptimizeModelResult jr = optimizeModel(b, t, mo);
    standing.reset();
    if (!jr.drawn) return;
    r.junctionMoves = std::max(r.junctionMoves, jr.junctionMoves);
    r.drawings += jr.drawings;
    r.conflictsAfter = jr.conflictsAfter;
    r.lengthAfter = jr.lengthAfter;
    r.stats = jr.stats;
    r.log.push_back(std::format("branch points: {} moved; {} conflict(s), {:.1f} mm", jr.junctionMoves, jr.conflictsAfter, jr.lengthAfter / 1e6));
  };
  auto take = [&](const BranchResult& br, int& count) {
    count += br.made;
    if (br.made > 0) {  // the model is built anew: other wires under the numbers
      refused.clear();
      refusedPairs.clear();
      standing.reset();
    }
    r.drawings += br.drawings;
    for (const std::string& l : br.log) r.log.push_back(l);
  };
  BranchOptions bo;
  bo.flips = o.flips;
  // A vertex with four wires and more gives a pair a pass.
  auto split = [&] {
    if (!o.branches) return;
    for (int pass = 0; pass < 4; ++pass) {
      const BranchResult br = splitBranches(b, t, bo);
      take(br, r.branches);
      if (br.made == 0) break;
    }
  };
  // A branch that goes to its branch point the long way past a nearer wire of its net (the clinch paper's
  // fig. 6) is moved there, one at a time.
  if (o.branches)
    for (int pass = 0; pass < 6; ++pass) {
      const BranchResult br = reattachBranches(b, t, bo);
      take(br, r.reattached);
      if (br.made == 0) break;
    }
  split();
  relax();
  if (o.branches && (r.branches > 0 || o.junctions)) {
    // The branch points the forces brought together are one, and its wires are paired anew.
    BranchResult merged = mergeBranchPoints(b, t, bo);
    take(merged, r.branchesMerged);
    if (merged.made > 0) {
      split();
      relax();
    }
  }
  // A branch round a vertex in its way goes the other side of it, if that is shorter (fig. 6), and a branch
  // point that moved has opened ways that were not there (on Arcs_standard_routing 2 wires more after the 8
  // that F6 moves); the branch points follow.
  if ((r.branches > 0 || r.reattached > 0 || r.junctionMoves > 0) && relayAll()) relax();
  if (clinchesOfMany > 0) r.log.push_back(std::format("clinches: {} undone with more than one wire taken out", clinchesOfMany));
  return r;
}

}  // namespace xr::topo
