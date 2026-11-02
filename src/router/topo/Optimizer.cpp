#include "router/topo/Optimizer.h"

#include <algorithm>
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
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"

namespace xr::topo {

namespace {

// Clearance comes first: no length gain pays for a conflict; among equal counts shallower is better.
constexpr double kConflictCost = 1e6 * kNmPerMm;
constexpr double kDepthCost = 100;  // 100 mm of track per mm of overlap depth

double trackLength(const Track& t) {
  if (t.isArc()) return ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length();
  return (t.b.v() - t.a.v()).len();
}

double totalLength(const Board& b) {
  double l = 0;
  for (auto& t : b.tracks) l += trackLength(t);
  return l;
}

int conflictCount(const Board& b) {
  DrcOptions o;
  o.unconnected = false;
  return int(runDrc(b, o).size());
}

struct Local {
  double length = 0;
  ConflictSum conflicts;
  double score() const { return length + conflicts.count * kConflictCost + conflicts.depth / kNmPerMm * kDepthCost; }
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
    if (r.type == ItemType::Track && changed(r)) l.length += trackLength(b.tracks[r.index]);
  return l;
}

BBox tracksBox(const Board& b, std::span<const int> tracks) {
  BBox bb;
  for (int ti : tracks)
    for (auto& s : itemShapes(b, {ItemType::Track, ti})) bb.add(s.bbox());
  return bb;
}

// Tracks of `net` on the given layers with an end point inside `shape`.
std::vector<char> attachedTo(const Board& b, const Shape& shape, LayerMask layers, int net) {
  std::vector<char> m(b.tracks.size(), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    const Track& t = b.tracks[i];
    if (t.net != net || !((layers >> t.layer) & 1) || t.locked) continue;
    if (shape.contains(t.a.v()) || shape.contains(t.b.v())) m[i] = 1;
  }
  return m;
}

struct Candidate {
  Board board;
  double gain = 0;  // score decrease over the move's region
};

// The neighbourhood every re-lay takes along (OptimizeOptions::relayAround), set per optimize() call.
double gRelayAround = 0;
std::vector<int> gRelayNets;





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
    st = reshapeTracks(c.board, chosen, nullptr, nullptr, true, 0.1, gRelayAround, gRelayNets);
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

int settleJunctions(Board& b, const std::vector<int>& nets, int rounds) {
  int moved = 0;
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  MovedItems noBox;
  for (int round = 0; round < rounds; ++round) {
    std::vector<Junction> js = junctionsOf(b, nets);
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
      for (int it = 0; it < 20; ++it) {  // Weiszfeld
        Vec2 num{};
        double den = 0;
        for (Vec2 q : qs) {
          double d = std::max((q - P).len(), 1.0);
          num = num + q / d;
          den += 1.0 / d;
        }
        Vec2 P1 = num / den;
        if ((P1 - P).len() < 100) { P = P1; break; }
        P = P1;
      }
      delta = P - j.p.v();
      if (delta.len() > 0.8 * nearest) delta = delta * (0.8 * nearest / delta.len());
      return delta.len() >= 1000;
    };
    auto chainsOf = [&](const Junction& j, const Shape& js0, std::vector<char>& chosen, std::vector<int>& current) {
      chosen = attachedTo(b, js0, LayerMask(1) << j.layer, j.net);
      auto grown = growChains(b, chosen);
      current.clear();
      for (size_t i = 0; i < grown.size(); ++i)
        if (grown[i]) current.push_back(int(i));
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
    }
    moved += movedNow;
    if (movedNow == 0) break;
  }
  return moved;
}

// ---- TopoR's relaxation (F6/F7 cascade as reconstructed in hand/f6_refine.cpp) ----------------
// Every movable object (via, free branch point) gets a force each iteration: towards the point where
// the wire through it runs straight (the midpoint of its two neighbouring wire vertices, the
// geometric median when more meet) and away from the crowding (the realiser's squeeze vector, see
// RealizeStats::viaPush). The step is the force clipped to tol·scale, where scale grows ×1.5 while
// the force keeps its direction and shrinks ×0.6 when it turns (Rprop, TopoR's scale_adjust); tol
// falls ×0.8 per iteration from 1 mm to 10 µm. A move is tried against the copper around the new
// place and, when blocked, shortened or slid along the blocker (pull_slot). The chains at the object
// and the wires of other nets it passes are re-laid after every move; an iteration that ends with
// more conflicts is undone.
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

// Copper of other nets closer to point p than the object's clearance: the closest such point.
std::optional<Vec2> blockerAt(const Board& b, const SpatialIndex& idx, const RelaxObject& ob, Vec2 p) {
  double maxClr = double(b.maxClearance());
  BBox q;
  q.add(p);
  std::optional<Vec2> hit;
  double best = std::numeric_limits<double>::max();
  idx.query(q.inflated(ob.radius + maxClr + 1000), ob.layers, [&](ItemRef r) {
    if (r.type == ItemType::Zone || itemNet(b, r) == ob.net) return;
    double req = ob.radius + requiredClearance(b, ob.net, itemNet(b, r), ob.layers & itemLayers(b, r));
    for (auto& sh : itemShapes(b, r)) {
      double d = sh.distance(p);
      if (d < req - 1000 && d < best) {
        best = d;
        Vec2 c = sh.center();
        hit = c;
      }
    }
  });
  return hit;
}

}  // namespace

int relax(Board& b, const OptimizeOptions& o, OptimizeResult& r, int& conflicts) {
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  // Everything movable is re-laid as a whole after every iteration (as TopoR's cascade re-lays all
  // wires): a wire laid alone against fixed neighbours loses its packing with them — in a channel
  // packed at the bare rule the fixed wires' circles touch, the tangents fail and the apexes are
  // dropped (six nets re-laid alone on Arcs: 155 violations against 33 for all of them together).
  auto relayAll = [&] {
    std::vector<char> all(b.tracks.size(), 0);
    for (size_t i = 0; i < b.tracks.size(); ++i)
      all[i] = !b.tracks[i].locked && (o.nets.empty() || std::ranges::contains(o.nets, b.tracks[i].net));
    return reshapeTracks(b, all, nullptr, nullptr, false);
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
    st = relayAll();
    conflicts = conflictCount(b);
  }
  int iterations = 0;
  for (double tol = o.relaxTol; tol >= o.relaxFloor && !cancelled(); tol *= 0.8, ++iterations) {
    refresh();
    if (o.progress) o.progress(iterations, 24, "relax");
    Board before = b;
    int conflictsBefore = conflicts;
    int viaMoves0 = r.viaMoves, junctionMoves0 = r.junctionMoves;
    // Forces, in parallel: towards the straight line of the wire, away from the crowding.
    std::vector<Vec2> force(objs.size());
    {
      ProfScope p("relax: forces");
      parallelFor(objs.size(), [&](size_t k) {
        const RelaxObject& ob = objs[k];
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
        if (qs.size() >= 2) {
          Vec2 P = ob.pos;
          if (qs.size() == 2) {
            P = (qs[0] + qs[1]) * 0.5;
          } else {
            for (int it = 0; it < 20; ++it) {  // Weiszfeld
              Vec2 num{};
              double den = 0;
              for (Vec2 q : qs) {
                double d = std::max((q - P).len(), 1.0);
                num = num + q / d;
                den += 1.0 / d;
              }
              Vec2 P1 = num / den;
              bool fin = (P1 - P).len() < 100;
              P = P1;
              if (fin) break;
            }
          }
          F = P - ob.pos;
        }
        if (ob.via)
          if (auto it = st.viaPush.find(ob.index); it != st.viaPush.end()) F = F - it->second * 8.0;
        force[k] = F;
      });
    }
    // Steps: Rprop scale, clipped to tol·scale, each checked against the copper around (the wires
    // as they lie now — they are re-laid afterwards, the check keeps a via off other copper).
    SpatialIndex idx;
    idx.build(b);
    int moved = 0;
    {
      ProfScope p("relax: apply");
      for (size_t k = 0; k < objs.size(); ++k) {
        RelaxObject& ob = objs[k];
        Vec2 F = force[k];
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
        Vec2 d = *use;
        Shape sh = Shape::circle(ob.pos, ob.radius);
        auto with = attachedTo(b, sh, ob.layers, ob.net);
        if (std::ranges::none_of(with, [](char c) { return c != 0; })) continue;
        dragEnds(b, sh, ob.layers, ob.net, d);
        if (ob.via) b.vias[ob.index].pos = Point(b.vias[ob.index].pos.v() + d);
        ob.pos = ob.pos + d;
        ++moved;
        if (ob.via) ++r.viaMoves;
        else ++r.junctionMoves;
      }
    }
    if (!moved) {
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, nothing moved", iterations + 1, tol / kNmPerMm));
      continue;
    }
    RealizeStats st1;
    {
      ProfScope p("relax: re-lay");
      st1 = relayAll();
    }
    int now = conflictCount(b);
    double len = totalLength(b), lenBefore = totalLength(before);
    bool connected = Connectivity::compute(b).ratsnest.size() <= unrouted;
    if (now > conflictsBefore || !connected || (now == conflictsBefore && len > lenBefore)) {
      b = std::move(before);
      r.viaMoves = viaMoves0;
      r.junctionMoves = junctionMoves0;
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} move(s) undone ({} -> {} conflicts, {:.1f} -> {:.1f} mm)",
                                  iterations + 1, tol / kNmPerMm, moved, conflictsBefore, now, lenBefore / 1e6, len / 1e6));
      for (RelaxObject& ob : objs) ob.scale = std::max(0.1, ob.scale * 0.6);
      continue;
    }
    st = std::move(st1);
    conflicts = now;
    r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} move(s), {} conflict(s), {:.1f} mm", iterations + 1,
                                tol / kNmPerMm, moved, conflicts, len / 1e6));
  }
  return iterations;
}

OptimizeResult optimize(Board& b, const OptimizeOptions& o) {
  auto t0 = std::chrono::steady_clock::now();
  gRelayAround = o.relayAround;
  gRelayNets = o.nets;
  OptimizeResult r;
  r.lengthBefore = totalLength(b);
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
        Vec2 push;
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
            std::vector<char> grown;
            Board probe = b;
            auto pst = reshapeTracks(probe, j.chosen, nullptr, &grown, true);
            j.push = {};
            if (auto it2 = pst.viaPush.find(j.vi); it2 != pst.viaPush.end()) j.push = it2->second;
            j.current.clear();
            for (size_t i = 0; i < grown.size(); ++i)
              if (grown[i]) j.current.push_back(int(i));
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
          // Where the wire through the via would run straight: the midpoint of the two vertices next
          // to the via along its wires (TopoR's F7 jog repair moves a via to (vh1 + vh2) / 2; its vias
          // end up on the straight line of their wires), the geometric median when more wires meet.
          std::vector<Vec2> deltas{Vec2{}};  // the re-shape in place first
          bool hasStraight = false, hasPush = false;
          {
            std::vector<Vec2> qs;
            for (size_t i = 0; i < b.tracks.size(); ++i) {
              if (!j.chosen[i]) continue;
              const Track& t = b.tracks[i];
              if (j.vs.contains(t.a.v()) == j.vs.contains(t.b.v())) continue;
              qs.push_back(j.vs.contains(t.a.v()) ? t.b.v() : t.a.v());
            }
            if (qs.size() >= 2) {
              Vec2 P = v.pos.v();
              if (qs.size() == 2) {
                P = (qs[0] + qs[1]) * 0.5;
              } else {
                for (int k = 0; k < 20; ++k) {  // Weiszfeld
                  Vec2 num{};
                  double den = 0;
                  for (Vec2 q : qs) {
                    double d = std::max((q - P).len(), 1.0);
                    num = num + q / d;
                    den += 1.0 / d;
                  }
                  Vec2 P1 = num / den;
                  bool fin = (P1 - P).len() < 100;
                  P = P1;
                  if (fin) break;
                }
              }
              Vec2 d = P - v.pos.v();
              if (d.len() > 1000) {
                deltas.push_back(d);
                deltas.push_back(d * 0.5);
                hasStraight = true;
              }
            }
          }
          // Away from the crowding (TopoR's move: the resultant of the tight edges, in shrinking
          // steps), then the compass directions: all eight in the first iteration, the four
          // axis-aligned ones in the later, finer ones.
          // (The push away from the crowding, TopoR's move_refine, never won a trial on the test
          // boards against the compass sweep and is left out.)
          (void)hasPush;
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
            auto grown = growChains(b, t.with);
            for (size_t i = 0; i < grown.size(); ++i)
              if (grown[i]) t.current.push_back(int(i));
            t.base = baseOf(t.current);
            wave2.push_back(std::move(t));
          }
          auto res2 = runWave(wave2);
          for (size_t k = 0; k < wave2.size(); ++k) take(res2[k], wave2[k], 100 + int(k));
          if (Prof::on() && best.any) {
            static const char* names[] = {"win: in place", "win: straight", "win: straight/2", "win: push", "win: push/2",
                                          "win: compass"};
            int cls = winner >= 100 ? 5 : winner;
            if (winner < 100) {
              // Classify by what the k-th delta was: in place, straight (2), push (2), compass.
              int k = winner, n = 1;
              if (k < n) cls = 0;
              else if (hasStraight && k < n + 2) cls = 1 + (k - n);
              else if (hasPush && k < n + (hasStraight ? 2 : 0) + 2) cls = 3 + (k - n - (hasStraight ? 2 : 0));
              else cls = 5;
            }
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
          auto grown = growChains(b, with);
          std::vector<int> current;
          for (size_t i = 0; i < grown.size(); ++i)
            if (grown[i]) current.push_back(int(i));
          MovedItems viaBox{[vi = j.vi](const Board& x) { return Shape::circle(x.vias[vi].pos.v(), x.vias[vi].diameter / 2.0).bbox(); },
                            {ItemRef{ItemType::Via, j.vi}}};
          BBox r0 = tracksBox(b, current);
          r0.add(viaBox.box(b));
          SpatialIndex lidx;
          lidx.build(b, r0.inflated(3 * step + 3 * double(b.maxClearance())));
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
        auto grown = growChains(b, chosen);
        std::vector<int> current;
        for (size_t i = 0; i < grown.size(); ++i)
          if (grown[i]) current.push_back(int(i));
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
        auto grown = growChains(b, chosen);
        std::vector<int> current;
        for (size_t i = 0; i < grown.size(); ++i)
          if (grown[i]) current.push_back(int(i));
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
        std::vector<char> grown;
        {
          Board probe = b;
          reshapeTracks(probe, chosen, nullptr, &grown, true);
        }
        std::vector<int> current;
        for (size_t i = 0; i < grown.size(); ++i)
          if (grown[i]) current.push_back(int(i));
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
  r.lengthAfter = totalLength(b);
  r.conflictsAfter = conflicts;
  r.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  Prof::get().report("F7 optimize");
  return r;
}

}  // namespace xr::topo
