#include "router/topo/ModelVias.h"

#include <algorithm>
#include <bit>
#include <cstdlib>
#include <format>
#include <optional>
#include <print>
#include <set>
#include <tuple>

#include "core/Edit.h"
#include "core/Padstack.h"
#include "core/Prof.h"
#include "router/topo/ModelTools.h"
#include "topo/Capacity.h"
#include "topo/Move.h"
#include "topo/Relay.h"

namespace xr::topo {

namespace {

// A via to go, by the wire that joins it to its neighbour.
struct Cand {
  int v = -1;        // the via's owner
  int wire = -1;     // the wire to the neighbour
  int u = -1;        // the neighbour: a via or a through pad
  LayerMask copy = 0;      // the layers the wire is copied onto: those of v's other wires but the wire's own
  bool wireGoes = false;   // v has no other wire on the wire's layer: the wire goes with it
  bool both = false;       // u is then left with wires of one layer and goes too
  double length = 0;       // the wire's taut length
  int retype = -1;         // the via type u is to become, to be copper on the layers of `copy` (the paper's step 8.2)
  LayerMask span = 0;      // ... and the layers of that type
  std::tuple<uint32_t, int, int64_t, int> key;  // (the via, the neighbour's kind and identity, the wire's layer)
};

LayerMask bit(LayerId l) { return LayerMask(1) << l; }

// The vertex of an owner on a layer a wire coming from `from` ends at: a polygon pad's centre, else the nearest.
int vertexOf(const Topology& t, const LayerMesh& m, int owner, Vec2 from) {
  if (t.owners[size_t(owner)].shape.kind == Shape::Kind::Polygon)
    for (int v : m.ownerVerts[size_t(owner)])
      if (m.verts[size_t(v)].t == 0 && m.verts[size_t(v)].off.len2() < 1) return v;
  return t.nearestVertex(m, owner, from);
}

}  // namespace

ViaResult removeVias(Board& b, Topology& t, const ViaOptions& o) {
  ProfScope pAll("F6 model: vias");
  ViaResult r;
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  std::set<std::tuple<uint32_t, int, int64_t, int>> refused;
  std::vector<char> fixedNets(b.nets.size(), 0);
  for (int n = 0; n < int(b.nets.size()); ++n) fixedNets[size_t(n)] = b.flexFixed(n);

  auto enumerate = [&] {
    std::vector<std::vector<std::pair<int, int>>> at(t.owners.size());  // per owner: (wire, its end there)
    for (int wi = 0; wi < int(t.wires.size()); ++wi) {
      const Wire& w = t.wires[size_t(wi)];
      if (w.end[0] < 0 || w.end[1] < 0) continue;
      for (int e = 0; e < 2; ++e) at[size_t(w.end[e])].push_back({wi, e});
    }
    auto free = [&](const Owner& x) {
      return x.kind == Owner::Kind::Via && x.layers != 0 && !x.locked && x.via >= 0 && x.via < int(b.vias.size()) && !b.flexFixed(x.net) &&
             edit::viaHeldBy(b, b.vias[size_t(x.via)]) == 0;
    };
    if (debug && refused.empty()) {
      // The paper's extension: vias that are not adjacent — a planar pad with three wires and more, or a branch
      // point, on the way from one to the other (fig. 2 and 3) — counted, not done.
      int byPad = 0, byBranch = 0;
      for (int oi = 0; oi < int(t.owners.size()); ++oi) {
        const Owner& M = t.owners[size_t(oi)];
        const bool pad = M.kind == Owner::Kind::Pad && std::popcount(M.layers) == 1, branch = M.kind == Owner::Kind::Junction;
        if ((!pad && !branch) || at[size_t(oi)].size() < 3) continue;
        std::vector<std::pair<int, double>> toVias;  // (the via, the wire's length)
        for (auto [wi, e] : at[size_t(oi)]) {
          const int far = t.wires[size_t(wi)].end[1 - e];
          if (far != oi && free(t.owners[size_t(far)])) toVias.push_back({far, tautLength(t, wi)});
        }
        for (size_t i = 0; i < toVias.size(); ++i)
          for (size_t j = i + 1; j < toVias.size(); ++j)
            if (toVias[i].first != toVias[j].first && toVias[i].second + toVias[j].second < o.span) ++(pad ? byPad : byBranch);
      }
      std::println(stderr, "vias not adjacent, the way between them under {:.0f} mm: {} pair(s) through a planar pad with three wires and more, {} through a branch point",
                   o.span / 1e6, byPad, byBranch);
    }
    std::vector<Cand> out;
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& V = t.owners[size_t(oi)];
      if (!free(V)) continue;
      LayerMask all = 0;
      bool locked = false;
      for (auto [wi, e] : at[size_t(oi)]) {
        all |= bit(t.wires[size_t(wi)].layer);
        locked |= t.wires[size_t(wi)].locked;
      }
      if (locked) continue;
      // A via whose wires are all of one layer joins nothing, and is left to «Удалить избыточные переходы»
      // (edit::removeExcessVias): it may stand there for a reason the wires do not show.
      if (std::popcount(all) <= 1) continue;
      for (auto [wi, e] : at[size_t(oi)]) {
        const Wire& w = t.wires[size_t(wi)];
        const int u = w.end[1 - e];
        if (u == oi) continue;
        const Owner& U = t.owners[size_t(u)];
        const bool node = U.kind == Owner::Kind::Via || (U.kind == Owner::Kind::Pad && std::popcount(U.layers) >= 2);
        if (!node) continue;
        Cand c;
        c.v = oi;
        c.wire = wi;
        c.u = u;
        c.length = tautLength(t, wi);
        if (c.length >= o.span) continue;
        LayerMask others = 0;
        bool twice = false;  // another wire joins the two already
        for (auto [xi, xe] : at[size_t(oi)])
          if (xi != wi) {
            others |= bit(t.wires[size_t(xi)].layer);
            twice |= t.wires[size_t(xi)].end[1 - xe] == u;
          }
        if (twice) continue;
        c.copy = others & ~bit(w.layer);
        c.wireGoes = !(others & bit(w.layer));
        if (c.copy == 0) continue;
        // The neighbour is copper on every layer the wire is copied onto; a blind via of another range becomes
        // one of a type whose range holds both (the paper's step 8.2: its own size if there is such a type,
        // else the smallest), or the pair is left.
        if ((c.copy & U.layers) != c.copy) {
          if (U.kind != Owner::Kind::Via || !free(U) || !b.rules) continue;
          const Via& via = b.vias[size_t(U.via)];
          for (int ti = 0; ti < int(b.rules->viaTypes.size()); ++ti) {
            const ViaType& T = b.rules->viaTypes[size_t(ti)];
            const LayerMask span = viaTypeLayers(b, T);
            if ((span & (U.layers | c.copy)) != (U.layers | c.copy)) continue;
            auto rank = [&](const ViaType& x) { return std::tuple(!(x.diameter == via.diameter && x.drill == via.drill), x.diameter); };
            if (c.retype < 0 || rank(T) < rank(b.rules->viaTypes[size_t(c.retype)])) {
              c.retype = ti;
              c.span = span;
            }
          }
          if (c.retype < 0) continue;
        }
        if (U.kind == Owner::Kind::Via && free(U) && c.wireGoes && std::popcount(c.copy) == 1) {
          LayerMask its = 0;
          for (auto [xi, xe] : at[size_t(u)])
            if (xi != wi) its |= bit(t.wires[size_t(xi)].layer);
          c.both = (its & ~c.copy) == 0;
        }
        c.key = {V.viaId, U.kind == Owner::Kind::Via ? 1 : 0, U.kind == Owner::Kind::Via ? int64_t(U.viaId) : int64_t(U.pad), int(w.layer)};
        out.push_back(c);
      }
    }
    std::erase_if(out, [&](const Cand& c) { return refused.contains(c.key); });
    // Two vias for one wire first, then the fewest layers to copy onto, then the shortest wire.
    r::sort(out, {}, [](const Cand& c) { return std::tuple(!c.both, c.retype >= 0, std::popcount(c.copy), c.length); });
    // One change at an owner in a pass.
    std::set<int> used;
    std::vector<Cand> one;
    for (const Cand& c : out) {
      if (used.contains(c.v) || used.contains(c.u)) continue;
      used.insert(c.v);
      used.insert(c.u);
      one.push_back(c);
    }
    return one;
  };

  // The candidates laid in a copy of the model, drawn, the vias taken off the drawing, and that drawn anew.
  // `laid`: those whose copies found their way (the others are refused for good).
  auto attempt = [&](const std::vector<Cand>& list, std::vector<Cand>& laid) -> std::optional<Redrawn> {
    Topology mt = t;
    Board mb = b;
    const std::vector<char> unsettled = viasTooClose(b, t);
    laid.clear();
    for (const Cand& c : list) {
      Topology before = mt;
      bool ok = true;
      if (c.retype >= 0) {
        // The neighbour as a via of the wider type: copper on the new layers, a vertex in their meshes.
        const ViaType& T = b.rules->viaTypes[size_t(c.retype)];
        Owner& U = mt.owners[size_t(c.u)];
        const LayerMask had = U.layers;
        const bool resized = U.halfWidth != T.diameter / 2.0;
        U.layers |= c.span;
        U.halfWidth = T.diameter / 2.0;
        U.shape = Shape::circle(U.c, U.halfWidth);
        for (LayerMesh& m : mt.layers) {
          if (!(U.layers & bit(m.layer))) continue;
          if (!(had & bit(m.layer))) {
            ok = ok && insertVertex(mt, m, c.u) >= 0;
          } else if (resized) {
            for (int v : m.ownerVerts[size_t(c.u)])
              for (int e : starEdges(m, v)) refreshEdge(mt, m, e);
          }
        }
      }
      for (LayerId l = 0; ok && l < 64; ++l) {
        if (!(c.copy & bit(l))) continue;
        const LayerMesh* m = mt.mesh(l);
        if (!m || m->ownerVerts[size_t(c.v)].empty() || m->ownerVerts[size_t(c.u)].empty()) {
          ok = false;
          break;
        }
        // The copy takes the width of v's widest wire on the layer: it carries what that one did.
        const Wire* like = nullptr;
        for (const Wire& x : mt.wires)
          if (x.layer == l && (x.end[0] == c.v || x.end[1] == c.v) && (!like || x.width > like->width)) like = &x;
        if (!like) {
          ok = false;
          break;
        }
        Wire n = *like;
        n.end[0] = c.v;
        n.end[1] = c.u;
        n.endVertex[0] = m->ownerVerts[size_t(c.v)].front();
        n.endVertex[1] = vertexOf(mt, *m, c.u, mt.owners[size_t(c.v)].c);
        n.hasExit[0] = n.hasExit[1] = false;
        n.cross.clear();
        n.tracks.clear();
        n.locked = false;
        n.dirty = true;
        const int ni = int(mt.wires.size());
        mt.wires.push_back(std::move(n));
        const double limit = c.length + o.worth;
        if (const std::optional<RelayPath> path = findRelay(mt, ni, &unsettled); path && path->length <= limit) {
          applyRelay(mt, ni, *path);
          continue;
        }
        // Wires of other nets cross the way: they are led behind (the paper's step 8.1).
        std::optional<Topology> saved;
        const std::vector<int> holders = wiresRound(mt, l, c.v, c.u, mt.wires[size_t(ni)].net, ni, &fixedNets);
        const std::optional<PastResult> past = relayPast(mt, ni, holders, limit, &unsettled, saved);
        ok = past && past->othersAfter <= past->othersBefore + o.worth;
      }
      if (ok) {
        laid.push_back(c);
      } else {
        mt = std::move(before);
        refused.insert(c.key);
      }
    }
    if (laid.empty()) return std::nullopt;
    for (const Cand& c : laid)
      if (c.retype >= 0) {
        const ViaType& T = b.rules->viaTypes[size_t(c.retype)];
        Via& via = mb.vias[size_t(mt.owners[size_t(c.u)].via)];
        via.layers = c.span;
        via.diameter = T.diameter;
        via.drill = T.drill;
      }
    {
      RealizeStats st;
      int nWires = 0;
      drawModel(mb, mt, true, st, nWires);
      ++r.drawings;
    }
    std::set<uint32_t> goneVias, goneTracks;
    std::vector<uint32_t> maybe;  // the neighbours: they go when the tracks left on them are of one layer
    for (const Cand& c : laid) {
      goneVias.insert(mt.owners[size_t(c.v)].viaId);
      if (c.wireGoes) goneTracks.insert(mt.wires[size_t(c.wire)].tracks.begin(), mt.wires[size_t(c.wire)].tracks.end());
      const Owner& U = mt.owners[size_t(c.u)];
      if (U.kind == Owner::Kind::Via && !U.locked && !b.flexFixed(U.net)) maybe.push_back(U.viaId);
    }
    std::erase_if(mb.tracks, [&](const Track& tr) { return tr.id && goneTracks.contains(tr.id); });
    std::erase_if(mb.vias, [&](const Via& v) { return v.id && goneVias.contains(v.id); });
    std::erase_if(mb.vias, [&](const Via& v) {
      return v.id && r::find(maybe, v.id) != maybe.end() && std::popcount(edit::viaTrackLayers(mb, v) | edit::viaHeldBy(mb, v)) <= 1;
    });
    return redrawTracks(mb, o.flips, r.drawings);
  };

  const int kAttempts = 12;
  int attempts = 0;
  for (int pass = 0; pass < 12 && attempts < kAttempts; ++pass) {
    std::vector<Cand> list = enumerate();
    if (pass == 0) r.candidates = int(list.size());
    if (list.empty()) break;
    if (pass == 0) {
      // A drawing whose own tracks cross (a short the realiser drew) gives no model: nothing can be judged.
      Board c = b;
      Topology::assignIds(c);
      Topology m;
      m.build(c);
      if (r::any_of(m.violations, [](const Violation& v) { return v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad; })) {
        r.log.push_back(std::format("vias: {} candidate(s), none tried: the drawing's own tracks cross, no model can be built from it", list.size()));
        break;
      }
    }
    const DrawingScore was = scoreDrawing(b);
    const size_t refusedBefore = refused.size();
    bool taken = false;
    while (!list.empty() && attempts < kAttempts) {
      ++attempts;
      std::vector<Cand> laid;
      std::optional<Redrawn> drawn = attempt(list, laid);
      if (laid.empty()) break;
      const bool better = drawn && betterDrawing(drawn->score, was);
      r.log.push_back(std::format("vias: {} of {} candidate(s): {}", laid.size(), list.size(),
                                  !drawn ? "the model of the tracks does not stand"
                                         : std::format("{} via(s), {} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm (was {} via(s), {} in {}, {:.1f}): {}",
                                                       drawn->score.vias, drawn->score.conflicts, drawn->score.places, drawn->score.shortfall / 1e6,
                                                       drawn->score.length / 1e6, was.vias, was.conflicts, was.places, was.length / 1e6, better ? "taken" : "no better")));
      if (debug)
        for (const Cand& c : laid)
          std::println(stderr, "via of {} at ({:.3f}, {:.3f}){}: {}", b.nets[size_t(t.owners[size_t(c.v)].net)].name, t.owners[size_t(c.v)].c.x / 1e6,
                       -t.owners[size_t(c.v)].c.y / 1e6, std::format(", wire of {:.2f} mm{}{}", c.length / 1e6, c.both ? ", both" : "", c.retype >= 0 ? ", its neighbour to another type" : ""),
                       better ? "gone" : "stays");
      if (better) {
        r.removed += was.vias - drawn->score.vias;
        b = std::move(drawn->board);
        t = std::move(drawn->model);
        taken = true;
        break;
      }
      // Which of them it was worse for the drawing does not say: one alone is refused, of more the first half
      // is tried (the rest come again in the next pass).
      if (laid.size() == 1) {
        refused.insert(laid.front().key);
        std::erase_if(list, [&](const Cand& c) { return refused.contains(c.key); });
        if (list.size() > 1) list.resize((list.size() + 1) / 2);
      } else {
        list.assign(laid.begin(), laid.begin() + (laid.size() + 1) / 2);
      }
    }
    // Some went, or some were refused: the others (and the other ways of the refused vias) in the next pass.
    if (!taken && refused.size() == refusedBefore) break;
  }
  return r;
}

}  // namespace xr::topo
