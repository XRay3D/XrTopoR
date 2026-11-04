#include "router/topo/Optimizer.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <unordered_set>
#include <limits>
#include <map>
#include <span>
#include <format>
#include <optional>
#include <print>

#include "core/Connectivity.h"
#include "core/Parallel.h"
#include "core/Prof.h"
#include "core/Edit.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "router/topo/Wires.h"

namespace xr::topo {

namespace {

// Clearance comes first: no length gain pays for a conflict; among equal counts shallower is better.
constexpr double kConflictCost = 1e6 * kNmPerMm;
constexpr double kDepthCost = 1e-4;  // a tie-breaker: 100 nm of track per mm of shortfall
constexpr double kShortCost = 1e6 * kNmPerMm;  // copper of two nets touching: a conflict on top of the clearance one

using edit::attachedTo;

int conflictCount(const Board& b) {
  DrcOptions o;
  o.unconnected = false;
  return int(runDrc(b, o).size());
}

// The violations on `now` with none of the same nets close by on `was`: what a change added.
std::vector<DrcViolation> addedViolations(const Board& was, const std::vector<DrcViolation>& wasV, const Board& now,
                                          const std::vector<DrcViolation>& nowV) {
  auto netsOf = [](const Board& x, const DrcViolation& v) { return std::minmax(itemNet(x, v.a), v.hasB ? itemNet(x, v.b) : kNoNet); };
  std::vector<char> used(wasV.size(), 0);  // one to one: a second violation at a place is a new one
  std::vector<DrcViolation> added;
  for (const DrcViolation& v : nowV) {
    bool old = false;
    for (size_t k = 0; k < wasV.size() && !old; ++k)
      if (!used[k] && netsOf(was, wasV[k]) == netsOf(now, v) && (wasV[k].pos - v.pos).len() < 1 * kNmPerMm) old = used[k] = 1;
    if (!old) added.push_back(v);
  }
  return added;
}

struct Local {
  double length = 0;
  ConflictSum conflicts;
  double score() const {
    return length + conflicts.count * kConflictCost + conflicts.shorts * kShortCost + conflicts.depth * kDepthCost;
  }
};

// Track length and clearance conflicts around a move; the same region is scored on the board before
// and after it, so whatever the re-shaping touched is compared like for like.
// `changed`: the tracks and items this move touched; conflicts and length are counted for those only
// (the rest is the same on both sides of the comparison).
Local evaluate(const Board& b, const SpatialIndex& idx, const BBox& region, const std::vector<char>& changedTracks,
               const std::vector<ItemRef>& changedItems) {
  Local l;
  auto changed = [&](ItemRef r) {
    if (r.type == ItemType::Track) return r.index < int(changedTracks.size()) && changedTracks[r.index] != 0;
    return std::ranges::contains(changedItems, r);
  };
  l.conflicts = regionConflicts(b, idx, region, changed);
  for (ItemRef r : idx.query(region, ~LayerMask(0)))
    if (r.type == ItemType::Track && changed(r)) l.length += b.tracks[r.index].length();
  return l;
}

BBox tracksBox(const Board& b, std::span<const int> tracks) {
  BBox bb;
  for (int ti : tracks)
    for (auto& s : itemShapes(b, {ItemType::Track, ti})) bb.add(s.bbox());
  return bb;
}

// The indices set in a mask.
std::vector<int> indicesOf(const std::vector<char>& mask) {
  std::vector<int> out;
  for (size_t i = 0; i < mask.size(); ++i)
    if (mask[i]) out.push_back(int(i));
  return out;
}

// Where a wire through `at` runs straight: the midpoint of its two neighbouring vertices (TopoR's F7 jog
// repair moves a via to (vh1 + vh2) / 2), the geometric median when more wires meet.
Vec2 straightPoint(const Polyline& neighbours, Vec2 at) {
  return neighbours.size() == 2 ? (neighbours[0] + neighbours[1]) * 0.5 : geometricMedian(neighbours, at);
}

struct Candidate {
  Board board;
  double gain = 0;  // score decrease over the move's region
};


// The moved via or pads: their box on a board, and their item refs (the same on both boards).
struct MovedItems {
  std::function<BBox(const Board&)> box = [](const Board&) { return BBox{}; };
  std::vector<ItemRef> moved;
};

// Re-shapes the chosen tracks (`current` once grown to whole chains) on a copy of `b` after `move`
// was applied to it and scores the result against `b`. `items` gives the moved via/pad boxes.
// `base`: the score of the chains as they are (the same for every trial of one move set), computed
// here when not given.
template <class Move>
std::optional<Candidate> tryMove(const Board& b, const SpatialIndex& idx, const std::vector<char>& chosen,
                                 const std::vector<int>& current, Move&& move, const MovedItems& items,
                                 std::optional<double> base = std::nullopt) {
  ProfScope ps("F7 tryMove");
  std::optional<Candidate> cand;
  {
    ProfScope p1("F7 tryMove: board copy");
    cand.emplace(Candidate{b, 0});
  }
  Candidate& c = *cand;
  if (!move(c.board)) return std::nullopt;
  RealizeStats st;
  {
    ProfScope p2("F7 tryMove: reshape");
    st = reshapeTracks(c.board, chosen, {.local = true});
  }
  std::vector<int> fresh;
  for (size_t i = c.board.tracks.size() - st.trackWire.size(); i < c.board.tracks.size(); ++i) fresh.push_back(int(i));
  // Only the changed items are scored, so each side's region is its own changed items' box.
  BBox region = tracksBox(c.board, fresh);
  region.add(items.box(c.board));
  region = region.inflated(double(b.maxClearance()));
  SpatialIndex cidx;
  {
    ProfScope p3("F7 tryMove: index build");
    cidx.build(c.board, region);
  }
  {
    ProfScope p4("F7 tryMove: evaluate");
    std::vector<char> now(c.board.tracks.size(), 0);
    for (int i : fresh) now[i] = 1;
    const std::vector<ItemRef>& moved = items.moved;
    Local l0;
    if (base) l0.length = *base;  // score() of a Local with no conflicts is its length: the base score goes in there
    else {
      std::vector<char> was(b.tracks.size(), 0);
      for (int i : current) was[i] = 1;
      BBox r0 = tracksBox(b, current);
      r0.add(items.box(b));
      l0 = evaluate(b, idx, r0.inflated(double(b.maxClearance())), was, moved);
    }
    Local l1 = evaluate(c.board, cidx, region, now, moved);
    c.gain = l0.score() - l1.score();
    if (std::getenv("XR_DEBUG_F7"))
      std::println(stderr, "    eval: was {} tracks len {:.3f} conf {}/{:.3f}; now {} tracks len {:.3f} conf {}/{:.3f}; region {:.1f}x{:.1f}",
                   current.size(), l0.length / 1e6, l0.conflicts.count, l0.conflicts.depth / 1e6, fresh.size(), l1.length / 1e6,
                   l1.conflicts.count, l1.conflicts.depth / 1e6, region.width() / 1e6, region.height() / 1e6);
  }
  return cand;
}

const Vec2 kDirs[] = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {0.7071, 0.7071}, {-0.7071, 0.7071}, {0.7071, -0.7071}, {-0.7071, -0.7071}};

// The tracks (not locked) of any net that run closer than `r` to the segment from `a` to `b` on the
// given layers: the neighbours a moving via has to get past — they are re-shaped with its own wires,
// as TopoR re-lays the wires around a moved via, so a via may slide along its wire through a bus.
// `nets` non-empty: only tracks of those nets (the wires of the other nets are kept as they are).
void addNeighbours(const Board& b, std::vector<char>& chosen, Vec2 a, Vec2 c, double r, LayerMask layers,
                   const std::vector<int>& nets) {
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    const Track& t = b.tracks[i];
    if (chosen[i] || t.locked || !((layers >> t.layer) & 1)) continue;
    if (!nets.empty() && !std::ranges::contains(nets, t.net)) continue;
    if (distSegmentSegment(a, c, t.a.v(), t.b.v()) < r + t.width / 2.0) chosen[i] = 1;
  }
}

// Moves track end points lying inside `shape` (net, layers) by d.
void dragEnds(Board& b, const Shape& shape, LayerMask layers, int net, Vec2 d) {
  for (auto& t : b.tracks) {
    if (t.net != net || !((layers >> t.layer) & 1)) continue;
    if (shape.contains(t.a.v())) t.a = Point(t.a.v() + d);
    if (shape.contains(t.b.v())) t.b = Point(t.b.v() + d);
  }
}

}  // namespace

namespace {

struct Junction { Point p; LayerId layer; int net; Coord width; };

// Free branch points: three or more tracks of one net and layer meet at no pad or via.
std::vector<Junction> junctionsOf(const Board& b, const std::vector<int>& nets) {
  std::vector<Junction> js;
  std::map<std::tuple<Coord, Coord, LayerId, int>, std::pair<int, Coord>> deg;
  for (const Track& t : b.tracks)
    for (Point q : {t.a, t.b}) {
      auto& d = deg[{q.x / 1000, q.y / 1000, t.layer, t.net}];
      ++d.first;
      d.second = std::max(d.second, t.width);
    }
  SpatialIndex pidx;
  pidx.build(b);
  for (auto& [k, d] : deg) {
    if (d.first < 3) continue;
    Point q{std::get<0>(k) * 1000, std::get<1>(k) * 1000};
    LayerId layer = std::get<2>(k);
    int net = std::get<3>(k);
    if (!nets.empty() && !std::ranges::contains(nets, net)) continue;
    bool onCopper = false;
    BBox bb;
    bb.add(q.v());
    pidx.query(bb.inflated(1000), LayerMask(1) << layer, [&](ItemRef r) {
      if (onCopper || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) != net) return;
      for (auto& sh : itemShapes(b, r))
        if (sh.distance(q.v()) <= 0) onCopper = true;
    });
    if (!onCopper) js.push_back({q, layer, net, d.second});
  }
  return js;
}

}  // namespace

namespace {

// A junction's way: the board positions it took, for telling it again in a later try.
struct SettledMove { Vec2 from, to; LayerId layer; int net; };

int settleOnce(Board& b, const std::vector<int>& nets, int rounds, const std::vector<SettledMove>& keep,
               std::vector<SettledMove>* done) {
  int moved = 0;
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  MovedItems noBox;
  for (int round = 0; round < rounds; ++round) {
    std::vector<Junction> js = junctionsOf(b, nets);
    std::erase_if(js, [&](const Junction& j) {
      return std::ranges::any_of(keep, [&](const SettledMove& m) {
        return m.layer == j.layer && m.net == j.net && ((m.from - j.p.v()).len() < 1000 || (m.to - j.p.v()).len() < 1000);
      });
    });
    // The target of every junction, its chains and its best step — searched in parallel on the
    // board as it is; the moves are then applied one by one, each re-tried on the board as the
    // earlier ones left it.
    struct Found { bool any = false; Vec2 delta; };
    std::vector<Found> found(js.size());
    SpatialIndex idx;
    idx.build(b);
    auto targetOf = [&](const Junction& j, const Shape& js0, Vec2& delta) {
      std::vector<Vec2> qs;
      for (const Track& t : b.tracks) {
        if (t.net != j.net || t.layer != j.layer) continue;
        if (js0.contains(t.a.v())) qs.push_back(t.b.v());
        else if (js0.contains(t.b.v())) qs.push_back(t.a.v());
      }
      if (qs.size() < 3) return false;
      Vec2 P = j.p.v();
      double nearest = std::numeric_limits<double>::max();
      for (Vec2 q : qs) nearest = std::min(nearest, (q - P).len());
      P = geometricMedian(qs, P);
      delta = P - j.p.v();
      if (delta.len() > 0.8 * nearest) delta = delta * (0.8 * nearest / delta.len());
      return delta.len() >= 1000;
    };
    auto chainsOf = [&](const Junction& j, const Shape& js0, std::vector<char>& chosen, std::vector<int>& current) {
      chosen = attachedTo(b, js0, LayerMask(1) << j.layer, j.net);
      current = indicesOf(growChains(b, chosen));
    };
    parallelFor(js.size(), [&](size_t k) {
      const Junction& j = js[k];
      Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
      LayerMask lm = LayerMask(1) << j.layer;
      Vec2 delta;
      if (!targetOf(j, js0, delta)) return;
      std::vector<char> chosen;
      std::vector<int> current;
      chainsOf(j, js0, chosen, current);
      for (double f : {1.0, 0.5, 0.25}) {
        Vec2 d = delta * f;
        auto c = tryMove(
            b, idx, chosen, current,
            [&](Board& x) {
              dragEnds(x, js0, lm, j.net, d);
              return true;
            },
            noBox);
        if (c && c->gain >= 0 && Connectivity::compute(c->board).ratsnest.size() <= unrouted) {
          found[k] = {true, d};
          break;
        }
      }
    });
    int movedNow = 0;
    for (size_t k = 0; k < js.size(); ++k) {
      if (!found[k].any) continue;
      const Junction& j = js[k];
      Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
      LayerMask lm = LayerMask(1) << j.layer;
      std::vector<char> chosen;
      std::vector<int> current;
      chainsOf(j, js0, chosen, current);
      SpatialIndex lidx;
      lidx.build(b, tracksBox(b, current).inflated(found[k].delta.len() + 3 * double(b.maxClearance())));
      Vec2 d = found[k].delta;
      auto c = tryMove(
          b, lidx, chosen, current,
          [&](Board& x) {
            dragEnds(x, js0, lm, j.net, d);
            return true;
          },
          noBox);
      if (!c || c->gain < 0 || Connectivity::compute(c->board).ratsnest.size() > unrouted) continue;
      b = std::move(c->board);
      ++movedNow;
      if (done) done->push_back({j.p.v(), j.p.v() + d, j.layer, j.net});
    }
    moved += movedNow;
    if (movedNow == 0) break;
  }
  return moved;
}

}  // namespace

// A move is scored with the neighbours as they lie; the re-lay of the whole board around the moved
// junction may come out worse than that (Arcs_master: 18 -> 28 violations at the next F5). So the
// moves are checked by that re-lay: the junctions next to a violation it adds stay where they were,
// and the result is the re-laid board, which the next F5 leaves as it is.
int settleJunctions(Board& b, const std::vector<int>& nets, int rounds) {
  // Part of the board (the wires edited): the rest stays as it lies, there is no whole re-lay to check by.
  if (!nets.empty()) return settleOnce(b, nets, rounds, {}, nullptr);
  constexpr double kBlame = 3 * kNmPerMm;
  DrcOptions dopt;
  dopt.unconnected = false;
  const Board base = b;
  auto baseViolations = runDrc(base, dopt);
  std::vector<SettledMove> keep;
  for (int attempt = 0; attempt < 4; ++attempt) {
    Board t = base;
    std::vector<SettledMove> done;
    int moved = settleOnce(t, nets, rounds, keep, &done);
    if (moved == 0) return 0;
    // Twice: the first re-lay after a move has not settled yet (the chains take their shape from the
    // moved ends; the second one starts from where those shapes lie).
    Board probe = std::move(t);
    for (int pass = 0; pass < 2; ++pass) {
      std::vector<char> all(probe.tracks.size(), 0);
      for (size_t i = 0; i < probe.tracks.size(); ++i) all[i] = !probe.tracks[i].locked;
      reshapeTracks(probe, std::move(all));
    }
    auto now = runDrc(probe, dopt);
    if (now.size() <= baseViolations.size()) {
      b = std::move(probe);
      return moved;
    }
    size_t before = keep.size();
    for (const DrcViolation& v : addedViolations(base, baseViolations, probe, now)) {
      const SettledMove* nearest = nullptr;
      double nd = std::numeric_limits<double>::max();
      for (const SettledMove& m : done)
        if (double d = (m.to - v.pos).len(); d < nd) { nd = d; nearest = &m; }
      for (const SettledMove& m : done)
        if ((m.to - v.pos).len() < kBlame || &m == nearest) keep.push_back(m);
    }
    if (keep.size() == before) break;
  }
  return 0;  // no way found that does not cost a violation: the junctions stay
}

// ---- TopoR's relaxation (F6/F7 cascade as reconstructed in hand/f6_refine.cpp) ----------------
// Every movable object (via, free branch point) gets a force each iteration: towards the point where
// the wire through it runs straight (the midpoint of its two neighbouring wire vertices, the
// geometric median when more meet) and away from the crowding (the realiser's squeeze vector, see
// RealizeStats::viaPush). The step is the force clipped to tol·scale, where scale grows ×1.5 while
// the force keeps its direction and shrinks ×0.6 when it turns (Rprop, TopoR's scale_adjust); tol
// falls ×0.8 per iteration from 1 mm to 10 µm. A move is tried against the copper around the new
// place and, when blocked, shortened or slid along the blocker (pull_slot). All wires are re-laid after
// every iteration; the steps next to what that breaks stay out and the rest are tried again.
namespace {

struct RelaxObject {
  bool via = false;
  int index = -1;       // via index, or junction index in the current list
  Vec2 pos;
  LayerMask layers = 0;
  int net = kNoNet;
  double radius = 0;    // via radius, or half the widest track at a junction
  Vec2 lastForce;
  double scale = 1.0;
};

// What stops the object at point p: copper of other nets it would be on, or pads and vias too close by
// more in sum than at the place it comes from (a step out of a conflict is no conflict, even if it gets
// a little nearer to the other pad of a corner). Wires give way when they are re-laid: only their
// copper itself blocks, a via on it would be on their other side next. The worst such point.
std::optional<Vec2> blockerAt(const Board& b, const SpatialIndex& idx, const RelaxObject& ob, Vec2 p) {
  double maxClr = double(b.maxClearance());
  BBox q;
  q.add(p);
  q.add(ob.pos);
  std::optional<Vec2> hit;
  double best = std::numeric_limits<double>::max(), shortThere = 0, shortHere = 0;
  std::optional<Vec2> worst;
  double worstShort = 0;
  idx.query(q.inflated(ob.radius + maxClr + 1000), ob.layers, [&](ItemRef r) {
    if (r.type == ItemType::Zone || itemNet(b, r) == ob.net) return;
    double req = ob.radius + requiredClearance(b, ob.net, itemNet(b, r), ob.layers & itemLayers(b, r));
    for (auto& sh : itemShapes(b, r)) {
      double d = sh.distance(p);
      if (r.type == ItemType::Track) {
        if (d < -1000 && d < best) {
          best = d;
          hit = sh.center();
        }
        continue;
      }
      if (r.type == ItemType::Via && r.index == ob.index) continue;
      double there = std::max(0.0, req - 1000 - d), here = std::max(0.0, req - 1000 - sh.distance(ob.pos));
      shortThere += there;
      shortHere += here;
      if (there > worstShort) {
        worstShort = there;
        worst = sh.center();
      }
    }
  });
  if (hit) return hit;
  if (shortThere > 0 && shortThere >= shortHere) return worst;
  return std::nullopt;
}

// What a via has to do to get off the pads and vias it is too close to: the sum of the shortfalls along
// the outward normals (a pad is no wire, it will not make room).
Vec2 pushOffCopper(const Board& b, const SpatialIndex& idx, const RelaxObject& ob) {
  double maxClr = double(b.maxClearance());
  BBox q;
  q.add(ob.pos);
  Vec2 push{};
  idx.query(q.inflated(ob.radius + maxClr + 1000), ob.layers, [&](ItemRef r) {
    if ((r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) == ob.net) return;
    if (r.type == ItemType::Via && r.index == ob.index) return;
    double req = ob.radius + requiredClearance(b, ob.net, itemNet(b, r), ob.layers & itemLayers(b, r));
    for (auto& sh : itemShapes(b, r)) {
      constexpr double e = 2000;
      double d = sh.distance(ob.pos);
      if (d >= req - 1000) continue;
      Vec2 n{sh.distance(ob.pos + Vec2{e, 0}) - sh.distance(ob.pos - Vec2{e, 0}),
             sh.distance(ob.pos + Vec2{0, e}) - sh.distance(ob.pos - Vec2{0, e})};
      if (n.len() < 1) n = ob.pos - sh.center();
      if (n.len() < 1) continue;
      // Another via moves as well: half each.
      push = push + n.normalized() * ((req - d + 2000) * (r.type == ItemType::Via ? 0.5 : 1.0));
    }
  });
  return push;
}

}  // namespace

int relax(Board& b, const OptimizeOptions& o, OptimizeResult& r, int& conflicts) {
  constexpr int kRelaxTries = 4;                     // tries per iteration at most
  constexpr int kRelaxClearRounds = 4;
  constexpr double kRelaxDepthCost = 100;
  constexpr double kRelaxBlame = 0.5 * kNmPerMm;
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };
  // Everything movable is re-laid as a whole after every iteration (as TopoR's cascade re-lays all
  // wires): a wire laid alone against fixed neighbours loses its packing with them — in a channel
  // packed at the bare rule the fixed wires' circles touch, the tangents fail and the apexes are
  // dropped (six nets re-laid alone on Arcs: 155 violations against 33 for all of them together).
  auto relayAll = [&](Board& x) {
    std::vector<char> all(x.tracks.size(), 0);
    for (size_t i = 0; i < x.tracks.size(); ++i)
      all[i] = !x.tracks[i].locked && (o.nets.empty() || std::ranges::contains(o.nets, x.tracks[i].net));
    return reshapeTracks(x, all);
  };
  // The objects: vias and free branch points, with their scales kept across iterations.
  std::vector<RelaxObject> objs;
  auto refresh = [&] {
    std::vector<RelaxObject> fresh;
    for (int vi = 0; vi < int(b.vias.size()); ++vi) {
      const Via& v = b.vias[vi];
      if (v.locked || (!o.nets.empty() && !std::ranges::contains(o.nets, v.net))) continue;
      fresh.push_back({true, vi, v.pos.v(), v.layers, v.net, v.diameter / 2.0});
    }
    if (o.junctions) {
      auto js = junctionsOf(b, o.nets);
      for (size_t k = 0; k < js.size(); ++k)
        fresh.push_back({false, int(k), js[k].p.v(), LayerMask(1) << js[k].layer, js[k].net, js[k].width / 2.0});
    }
    for (RelaxObject& f : fresh)
      for (const RelaxObject& ob : objs)
        if (ob.via == f.via && (f.via ? ob.index == f.index : (ob.pos - f.pos).len() < 1000)) {
          f.lastForce = ob.lastForce;
          f.scale = ob.scale;
          break;
        }
    objs = std::move(fresh);
  };
  RealizeStats st;
  {
    ProfScope p("relax: re-lay");
    st = relayAll(b);
    conflicts = conflictCount(b);
  }
  DrcOptions dopt;
  dopt.unconnected = false;
  int iterations = 0;
  // First the vias on their own that are too close to pads and vias: among the steps of everything
  // else the one that clears a conflict goes down with a neighbour's mistake.
  int clearRounds = kRelaxClearRounds;
  for (double tol = o.relaxTol; tol >= o.relaxFloor && !cancelled(); tol *= clearRounds > 0 ? (--clearRounds, 1.0) : 0.8, ++iterations) {
    const bool clearing = clearRounds > 0;
    refresh();
    if (o.progress) o.progress(iterations, 24, "relax");
    int conflictsBefore = conflicts;
    // Forces, in parallel: off the copper a via is too close to, or else towards the straight line
    // of the wire and away from the crowding.
    std::vector<Vec2> force(objs.size());
    SpatialIndex idx;
    idx.build(b);
    {
      ProfScope p("relax: forces");
      parallelFor(objs.size(), [&](size_t k) {
        const RelaxObject& ob = objs[k];
        if (ob.via) {
          Vec2 off = pushOffCopper(b, idx, ob);
          if (off.len() > 0) {
            force[k] = off;
            return;
          }
        }
        if (clearing) return;
        Shape sh = Shape::circle(ob.pos, ob.radius);
        auto chosen = attachedTo(b, sh, ob.layers, ob.net);
        std::vector<Vec2> qs;
        for (size_t i = 0; i < b.tracks.size(); ++i) {
          if (!chosen[i]) continue;
          const Track& t = b.tracks[i];
          if (sh.contains(t.a.v()) == sh.contains(t.b.v())) continue;
          qs.push_back(sh.contains(t.a.v()) ? t.b.v() : t.a.v());
        }
        Vec2 F{};
        if (qs.size() >= 2) F = straightPoint(qs, ob.pos) - ob.pos;
        if (ob.via)
          if (auto it = st.viaPush.find(ob.index); it != st.viaPush.end()) F = F - it->second * 8.0;
        force[k] = F;
      });
    }
    // Steps: Rprop scale, clipped to tol·scale, each checked against the copper around (the wires
    // as they lie now — they are re-laid afterwards, the check keeps a via off other copper).
    struct Step { size_t k; Vec2 d; };
    std::vector<Step> steps;
    {
      ProfScope p("relax: steps");
      for (size_t k = 0; k < objs.size(); ++k) {
        RelaxObject& ob = objs[k];
        Vec2 F = force[k];
        if (clearing && F.len() < 1000) continue;
        if (F.len() < 1000) { ob.lastForce = F; continue; }
        if (ob.lastForce.len() > 0) ob.scale = std::clamp(ob.scale * (F.dot(ob.lastForce) > 0 ? 1.5 : 0.6), 0.1, 4.0);
        ob.lastForce = F;
        double limit = tol * ob.scale;
        Vec2 delta = F.len() > limit ? F.normalized() * limit : F;
        if (delta.len() < 500) continue;
        std::optional<Vec2> use;
        for (double f : {1.0, 0.5, 0.25}) {
          Vec2 d = delta * f;
          auto blk = blockerAt(b, idx, ob, ob.pos + d);
          if (!blk) { use = d; break; }
          if (f == 1.0) {
            Vec2 n = (ob.pos + d - *blk);
            if (n.len() > 1) {
              n = n.normalized();
              Vec2 t{-n.y, n.x};
              Vec2 slide = t * (delta.dot(t)) * 0.9;
              if (slide.len() > 500 && !blockerAt(b, idx, ob, ob.pos + slide)) { use = slide; break; }
            }
          }
        }
        if (!use) continue;
        Shape sh = Shape::circle(ob.pos, ob.radius);
        auto with = attachedTo(b, sh, ob.layers, ob.net);
        if (std::ranges::none_of(with, [](char c) { return c != 0; })) continue;
        steps.push_back({k, *use});
      }
    }
    if (steps.empty()) {
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, nothing moved", iterations + 1, tol / kNmPerMm));
      continue;
    }
    // The steps are applied and the board re-laid. A step next to what that breaks stays out, and the
    // rest are tried again: one bad step does not cost the whole iteration (TopoR undoes per move;
    // on Arcs_master nearly every iteration was undone for a single conflict or a lost connection).
    auto ratsPerNet = [](const Board& x) {
      std::map<int, int> n;
      for (const RatsLine& l : Connectivity::compute(x).ratsnest) ++n[l.net];
      return n;
    };
    const auto ratsBefore = ratsPerNet(b);
    auto depthOf = [](const std::vector<DrcViolation>& vs) {
      double sum = 0;
      for (const DrcViolation& v : vs) sum += std::max(0.0, v.required - v.actual);
      return sum;
    };
    const auto violationsBefore = runDrc(b, dopt);
    const double lenBefore = b.tracksLength();
    const double depthBefore = depthOf(violationsBefore);
    std::vector<char> out(steps.size(), 0);
    struct Try {
      Board board;
      RealizeStats stats;
      std::vector<char> out;
      int conflicts = 0;
      double length = 0;
    };
    std::optional<Try> best;
    int tries = 0, lastConflicts = 0;
    double lastLen = 0;
    for (; tries < kRelaxTries && !cancelled(); ++tries) {
      Board t = b;
      for (size_t m = 0; m < steps.size(); ++m) {
        if (out[m]) continue;
        const RelaxObject& ob = objs[steps[m].k];
        dragEnds(t, Shape::circle(ob.pos, ob.radius), ob.layers, ob.net, steps[m].d);
        if (ob.via) t.vias[ob.index].pos = Point(t.vias[ob.index].pos.v() + steps[m].d);
      }
      RealizeStats st1;
      std::vector<DrcViolation> violations;
      std::vector<int> brokenNets;
      double len = 0;
      bool fine = false;
      // Re-laid, and once more if that looks fine: the first re-lay after a move has not settled yet,
      // and a board taken before it has makes the next iterations look worse than they are.
      for (int pass = 0; pass < 2; ++pass) {
        {
          ProfScope p("relax: re-lay");
          st1 = relayAll(t);
        }
        violations = runDrc(t, dopt);
        len = t.tracksLength();
        lastConflicts = int(violations.size());
        lastLen = len;
        brokenNets.clear();
        for (auto [net, n] : ratsPerNet(t))
          if (auto it = ratsBefore.find(net); it == ratsBefore.end() || n > it->second) brokenNets.push_back(net);
        // No more conflicts, and among as many a lower price: a mm of shortfall costs 100 mm of wire.
        double depth = depthOf(violations);
        fine = brokenNets.empty() && lastConflicts <= conflictsBefore &&
               (lastConflicts < conflictsBefore || len + depth * kRelaxDepthCost <= lenBefore + depthBefore * kRelaxDepthCost);
        // Clearing a via off a pad: what counts is how much is short, a deep conflict for a shallow one
        // is a gain though they count the same.
        if (clearing) fine = brokenNets.empty() && depth < depthBefore - 1000;
        if (!fine) break;
      }
      if (fine) {
        best = Try{t, std::move(st1), out, lastConflicts, len};
        break;  // no worse: taken as it is, with whatever it traded
      }
      auto added = addedViolations(b, violationsBefore, t, violations);
      // Who stays out: the steps near an added violation or of its nets close by, the nearest if none,
      // wider with every try (on a dense board a wide circle takes all the steps at the first go);
      // all the steps of a net that lost a connection.
      const double blame = kRelaxBlame * (tries + 1);
      bool any = false;
      auto drop = [&](size_t m) {
        if (!out[m]) { out[m] = 1; any = true; }
      };
      for (const DrcViolation& v : added) {
        std::optional<size_t> nearest;
        double nd = std::numeric_limits<double>::max();
        std::array<int, 2> nets{itemNet(t, v.a), v.hasB ? itemNet(t, v.b) : kNoNet};
        bool hit = false;
        for (size_t m = 0; m < steps.size(); ++m) {
          if (out[m]) continue;
          const RelaxObject& ob = objs[steps[m].k];
          double d = (ob.pos + steps[m].d - v.pos).len();
          if (d < nd) { nd = d; nearest = m; }
          if (d < blame || (d < 3 * blame && std::ranges::contains(nets, ob.net))) {
            drop(m);
            hit = true;
          }
        }
        if (!hit && nearest) drop(*nearest);
      }
      for (size_t m = 0; m < steps.size(); ++m)
        if (std::ranges::contains(brokenNets, objs[steps[m].k].net)) drop(m);
      if (!any || std::ranges::all_of(out, [](char c) { return c != 0; })) break;
    }
    if (!best) {
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} step(s) undone after {} tries ({} -> {} conflicts, {:.1f} -> {:.1f} mm)",
                                  iterations + 1, tol / kNmPerMm, steps.size(), tries, conflictsBefore, lastConflicts,
                                  lenBefore / 1e6, lastLen / 1e6));
      for (RelaxObject& ob : objs) ob.scale = std::max(0.1, ob.scale * 0.6);
      continue;
    }
    int moved = 0;
    for (size_t m = 0; m < steps.size(); ++m) {
      RelaxObject& ob = objs[steps[m].k];
      if (best->out[m]) {
        ob.scale = std::max(0.1, ob.scale * 0.6);
        continue;
      }
      ob.pos = ob.pos + steps[m].d;
      ++moved;
      if (ob.via) ++r.viaMoves;
      else ++r.junctionMoves;
    }
    b = std::move(best->board);
    st = std::move(best->stats);
    conflicts = best->conflicts;
    r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} of {} step(s), {} conflict(s), {:.1f} mm", iterations + 1,
                                tol / kNmPerMm, moved, steps.size(), conflicts, best->length / 1e6));
  }
  return iterations;
}

OptimizeResult optimize(Board& b, const OptimizeOptions& o) {
  auto t0 = std::chrono::steady_clock::now();
  OptimizeResult r;
  r.lengthBefore = b.tracksLength();
  r.conflictsBefore = conflictCount(b);
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };

  // A move must never disconnect anything: candidates are checked against the current ratsnest.
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  auto keepsConnectivity = [&](const Board& c) {
    ProfScope p("F7 connectivity check");
    return Connectivity::compute(c).ratsnest.size() <= unrouted;
  };

  // Moves are judged locally; an iteration that still ends with more conflicts overall is undone.
  int conflicts = r.conflictsBefore;
  double step = o.step;
  OptimizeOptions oo = o;
  if (o.relax && (o.vias || o.junctions)) {
    r.relaxIterations = relax(b, o, r, conflicts);
    oo.vias = false;
    oo.junctions = false;
    if (!o.components) oo.iterations = 0;
  }
  const OptimizeOptions& o2 = oo;
  for (int it = 0; it < o2.iterations && !cancelled(); ++it, step /= 2) {
    Board before = b;
    int viaMoves0 = r.viaMoves, componentMoves0 = r.componentMoves, junctionMoves0 = r.junctionMoves;
    int moves = 0;
    int total = (o2.vias ? int(b.vias.size()) : 0) + (o2.components ? int(b.components.size()) : 0);
    int done = 0;

    if (o2.vias) {
      // The vias whose neighbourhoods are apart are searched in parallel batches: every one finds
      // its best move on the board as it is at the batch's start, and the batch's moves are applied
      // one after another (their regions are apart, so each re-shape comes out as it was scored).
      // Track masks are taken afresh at every step: an applied move renumbers the tracks.
      struct ViaJob {
        int vi = -1;
        Shape vs;
        BBox region;
        std::vector<char> chosen;
        std::vector<int> current;
      };
      std::vector<ViaJob> jobs;
      for (int vi = 0; vi < int(b.vias.size()); ++vi) {
        const Via& v = b.vias[vi];
        if (v.locked || (!o.nets.empty() && !std::ranges::contains(o.nets, v.net))) continue;
        ViaJob j;
        j.vi = vi;
        j.vs = Shape::circle(v.pos.v(), v.diameter / 2.0);
        auto attached = attachedTo(b, j.vs, v.layers, v.net);
        if (std::ranges::none_of(attached, [](char c) { return c != 0; })) continue;
        jobs.push_back(std::move(j));
      }
      struct Best {
        bool any = false;
        Vec2 delta;
        bool neighbours = false;
        double gain = 0;
      };
      // Every via is probed and searched in parallel on the board as it is now (a snapshot); the
      // moves found are then applied one by one, each re-tried on the board as the earlier moves
      // left it (TopoR's pass over the vias, on all cores: a stale search costs at most a move).
      if (o.progress) o.progress(done += int(jobs.size()), total, std::format("optimise {}: vias", it + 1));
      {
        ProfScope p("F7 probe reshape");
        parallelFor(jobs.size(), [&](size_t m) {
            ViaJob& j = jobs[m];
            const Via& v = b.vias[j.vi];
            j.chosen = attachedTo(b, j.vs, v.layers, v.net);
            j.current = indicesOf(growChains(b, j.chosen));
        });
      }
      SpatialIndex idx;
      {
        ProfScope p("F7 index build (base)");
        idx.build(b);
      }
      auto search = [&](const ViaJob& j) {
          const Via& v = b.vias[j.vi];
          MovedItems viaBox{[vi = j.vi](const Board& x) { return Shape::circle(x.vias[vi].pos.v(), x.vias[vi].diameter / 2.0).bbox(); },
                            {ItemRef{ItemType::Via, j.vi}}};
          // Where the wire through the via would run straight (TopoR's vias end up on the straight line
          // of their wires).
          std::vector<Vec2> deltas{Vec2{}};  // the re-shape in place first
          bool hasStraight = false;
          {
            std::vector<Vec2> qs;
            for (size_t i = 0; i < b.tracks.size(); ++i) {
              if (!j.chosen[i]) continue;
              const Track& t = b.tracks[i];
              if (j.vs.contains(t.a.v()) == j.vs.contains(t.b.v())) continue;
              qs.push_back(j.vs.contains(t.a.v()) ? t.b.v() : t.a.v());
            }
            if (qs.size() >= 2) {
              Vec2 d = straightPoint(qs, v.pos.v()) - v.pos.v();
              if (d.len() > 1000) {
                deltas.push_back(d);
                deltas.push_back(d * 0.5);
                hasStraight = true;
              }
            }
          }
          // Then the compass directions: all eight in the first iteration, the four axis-aligned ones in
          // the later, finer ones. (The push away from the crowding, TopoR's move_refine, never won a trial
          // on the test boards against the compass sweep and is left out.)
          for (Vec2 d : std::span(kDirs, it == 0 ? 8 : 4)) deltas.push_back(d * step);
          auto moveBy = [&](Vec2 delta) {
            return [&, delta](Board& c) {
              Via& cv = c.vias[j.vi];
              dragEnds(c, j.vs, cv.layers, cv.net, delta);
              cv.pos = Point(cv.pos.v() + delta);
              return true;
            };
          };
          // A trial: the move, the chains re-laid (the via's own, or with the neighbours of other nets
          // that block it) and their indices on the board as it is (the base side of the score).
          struct Trial {
            Vec2 delta;
            bool neighbours = false;
            std::vector<char> with;
            std::vector<int> current;
            double base = 0;  // score of `current` as it is
          };
          auto baseOf = [&](const std::vector<int>& cur) {
            std::vector<char> was(b.tracks.size(), 0);
            for (int i : cur) was[i] = 1;
            BBox r0 = tracksBox(b, cur);
            r0.add(viaBox.box(b));
            return evaluate(b, idx, r0.inflated(double(b.maxClearance())), was, viaBox.moved).score();
          };
          auto run = [&](const Trial& t) {
            auto c = tryMove(b, idx, t.with, t.current, moveBy(t.delta), viaBox, t.base);
            if (c && c->gain > 1000.0 && !keepsConnectivity(c->board)) c.reset();
            return c;
          };
          auto runWave = [&](const std::vector<Trial>& wave) {
            std::vector<std::optional<Candidate>> out(wave.size());
            for (size_t k = 0; k < wave.size(); ++k) out[k] = run(wave[k]);
            return out;
          };
          Best best;
          int winner = -1;
          auto take = [&](const std::optional<Candidate>& c, const Trial& t, int k) {
            if (c && c->gain > std::max(best.gain, 1000.0)) {
              best = {true, t.delta, t.neighbours, c->gain};
              winner = k;
            }
          };
          std::vector<Trial> wave1;
          double base1 = baseOf(j.current);
          for (Vec2 delta : deltas) wave1.push_back({delta, false, j.chosen, j.current, base1});
          auto res1 = runWave(wave1);
          // Blocked by the wires of other nets: they come along and are re-shaped with the via's own
          // (TopoR re-lays the wires around a moved via, so a via may slide along its wire through a bus).
          std::vector<Trial> wave2;
          for (size_t k = 0; k < wave1.size(); ++k) {
            take(res1[k], wave1[k], int(k));
            if ((res1[k] && res1[k]->gain > 1000.0) || deltas[k].len2() == 0) continue;
            Trial t{deltas[k], true, j.chosen, {}, 0};
            addNeighbours(b, t.with, v.pos.v(), v.pos.v() + deltas[k], v.diameter / 2.0 + double(b.maxClearance()), v.layers, o.nets);
            if (t.with == j.chosen) continue;
            t.current = indicesOf(growChains(b, t.with));
            t.base = baseOf(t.current);
            wave2.push_back(std::move(t));
          }
          auto res2 = runWave(wave2);
          for (size_t k = 0; k < wave2.size(); ++k) take(res2[k], wave2[k], 100 + int(k));
          if (Prof::on() && best.any) {
            static const char* names[] = {"win: in place", "win: straight", "win: straight/2", "win: compass"};
            // By what the k-th delta was: in place, straight (2), compass.
            int cls = winner == 0 ? 0 : hasStraight && winner <= 2 ? winner : 3;
            Prof::get().add(winner >= 100 ? "win: with neighbours" : names[cls], 1);
          }
          return best;
        };
      std::vector<Best> bests(jobs.size());
      {
        ProfScope p("F7 search (parallel over vias)");
        parallelFor(jobs.size(), [&](size_t m) { bests[m] = search(jobs[m]); });
      }
      if (!cancelled()) {
        ProfScope p("F7 apply (re-tried moves)");
        for (size_t k = 0; k < jobs.size(); ++k) {
          const Best& best = bests[k];
          if (!best.any) continue;
          const ViaJob& j = jobs[k];
          Via& v = b.vias[j.vi];
          std::vector<char> with = attachedTo(b, j.vs, v.layers, v.net);
          if (best.neighbours)
            addNeighbours(b, with, v.pos.v(), v.pos.v() + best.delta, v.diameter / 2.0 + double(b.maxClearance()), v.layers, o.nets);
          std::vector<int> current = indicesOf(growChains(b, with));
          MovedItems viaBox{[vi = j.vi](const Board& x) { return Shape::circle(x.vias[vi].pos.v(), x.vias[vi].diameter / 2.0).bbox(); },
                            {ItemRef{ItemType::Via, j.vi}}};
          BBox r0 = tracksBox(b, current);
          r0.add(viaBox.box(b));
          SpatialIndex lidx;
          lidx.build(b, r0.inflated(3 * step + 3 * double(b.maxClearance())));
          if (std::getenv("XR_DEBUG_F7"))
            std::println(stderr, "  apply via {} net {} at ({:.3f},{:.3f}) delta ({:.3f},{:.3f}) neighbours {} searched gain {:.3f}",
                         j.vi, v.net >= 0 ? b.nets[v.net].name : "-", v.pos.x / 1e6, v.pos.y / 1e6, best.delta.x / 1e6,
                         best.delta.y / 1e6, best.neighbours, best.gain / 1e6);
          auto c = tryMove(
              b, lidx, with, current,
              [&](Board& x) {
                Via& cv = x.vias[j.vi];
                dragEnds(x, j.vs, cv.layers, cv.net, best.delta);
                cv.pos = Point(cv.pos.v() + best.delta);
                return true;
              },
              viaBox);
          if (!c || c->gain <= 1000.0 || !keepsConnectivity(c->board)) continue;
          b = std::move(c->board);
          if (best.delta.len2() > 0) {
            ++moves;
            ++r.viaMoves;
          }
        }
      }
    }

    // Free branch points — where three or more tracks of one net and layer meet at no pad or via —
    // move like vias: the wires from them get shorter (TopoR's F5 slides such a junction too).
    if (o2.junctions) {
      std::vector<Junction> js = junctionsOf(b, o.nets);
      total += int(js.size());
      if (o.progress) o.progress(done += int(js.size()), total, std::format("optimise {}: junctions", it + 1));
      // As the vias: searched in parallel on a snapshot, applied one by one with a re-try each.
      struct JBest { bool any = false; Vec2 delta; };
      std::vector<JBest> bests(js.size());
      SpatialIndex idx;
      idx.build(b);
      MovedItems noBox;
      parallelFor(js.size(), [&](size_t k) {
        const Junction& j = js[k];
        Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
        LayerMask lm = LayerMask(1) << j.layer;
        auto chosen = attachedTo(b, js0, lm, j.net);
        if (std::ranges::none_of(chosen, [](char c) { return c != 0; })) return;
        std::vector<int> current = indicesOf(growChains(b, chosen));
        double bestGain = 1000.0;
        for (Vec2 d : std::span(kDirs, it == 0 ? 8 : 4)) {
          Vec2 delta = d * step;
          auto c = tryMove(
              b, idx, chosen, current,
              [&](Board& x) {
                dragEnds(x, js0, lm, j.net, delta);
                return true;
              },
              noBox);
          if (c && c->gain > bestGain && keepsConnectivity(c->board)) {
            bestGain = c->gain;
            bests[k] = {true, delta};
          }
        }
      });
      for (size_t k = 0; k < js.size() && !cancelled(); ++k) {
        if (!bests[k].any) continue;
        const Junction& j = js[k];
        Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
        LayerMask lm = LayerMask(1) << j.layer;
        auto chosen = attachedTo(b, js0, lm, j.net);
        std::vector<int> current = indicesOf(growChains(b, chosen));
        SpatialIndex lidx;
        lidx.build(b, tracksBox(b, current).inflated(3 * step + 3 * double(b.maxClearance())));
        Vec2 delta = bests[k].delta;
        auto c = tryMove(
            b, lidx, chosen, current,
            [&](Board& x) {
              dragEnds(x, js0, lm, j.net, delta);
              return true;
            },
            noBox);
        if (!c || c->gain <= 1000.0 || !keepsConnectivity(c->board)) continue;
        b = std::move(c->board);
        ++moves;
        ++r.junctionMoves;
      }
    }

    if (o2.components && o.nets.empty())
      for (int ci = 0; ci < int(b.components.size()) && !cancelled(); ++ci) {
        if (o.progress) o.progress(++done, total, std::format("optimise {}: components", it + 1));
        const Component& comp = b.components[ci];
        if (comp.locked || comp.pads.empty()) continue;
        std::vector<char> chosen(b.tracks.size(), 0);
        for (int pi : comp.pads) {
          auto m = attachedTo(b, b.pads[pi].shapeGeom(), b.pads[pi].copper, b.pads[pi].net);
          for (size_t i = 0; i < m.size(); ++i) chosen[i] |= m[i];
        }
        std::vector<int> current = indicesOf(growChains(b, chosen));
        SpatialIndex idx;
        idx.build(b);
        MovedItems padsBox;
        padsBox.box = [ci](const Board& x) {
          BBox bb;
          for (int pi : x.components[ci].pads) bb.add(x.pads[pi].shapeGeom().bbox());
          return bb;
        };
        for (int pi : comp.pads) padsBox.moved.push_back({ItemType::Pad, pi});
        std::optional<Candidate> best;
        auto consider = [&](std::optional<Candidate> c) {
          if (c && c->gain > std::max(best ? best->gain : 0.0, 1000.0) && keepsConnectivity(c->board)) best = std::move(c);
        };
        for (Vec2 d : std::span(kDirs, 4)) {
          Vec2 delta = d * step;
          consider(tryMove(
              b, idx, chosen, current,
              [&](Board& c) {
                for (int pi : c.components[ci].pads) {
                  const Pad& p = c.pads[pi];
                  dragEnds(c, p.shapeGeom(), p.copper, p.net, delta);
                }
                c.moveComponent(ci, c.components[ci].pos + Point(delta));
                return true;
              },
              padsBox));
        }
        if (best) {
          b = std::move(best->board);
          ++moves;
          ++r.componentMoves;
        }
      }
    int now = conflicts;
    if (moves) {
      ProfScope p("F7 conflictCount (full DRC)");
      now = conflictCount(b);
    }
    if (now > conflicts) {
      b = std::move(before);
      r.viaMoves = viaMoves0;
      r.componentMoves = componentMoves0;
      r.junctionMoves = junctionMoves0;
      r.log.push_back(std::format("iteration {}: step {:.3f} mm, {} move(s) undone ({} -> {} conflicts)", it + 1,
                                  step / kNmPerMm, moves, conflicts, now));
      break;
    }
    conflicts = now;
    r.log.push_back(std::format("iteration {}: step {:.3f} mm, {} move(s), {} conflict(s)", it + 1, step / kNmPerMm, moves,
                                conflicts));
    if (moves == 0 && it > 0) break;
  }
  r.lengthAfter = b.tracksLength();
  r.conflictsAfter = conflicts;
  r.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  Prof::get().report("F7 optimize");
  return r;
}

}  // namespace xr::topo
