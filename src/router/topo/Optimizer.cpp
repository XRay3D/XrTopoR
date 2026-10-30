#include "router/topo/Optimizer.h"

#include <algorithm>
#include <chrono>
#include <limits>
#include <map>
#include <span>
#include <format>
#include <optional>

#include "core/Connectivity.h"
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
Local evaluate(const Board& b, const SpatialIndex& idx, const BBox& region) {
  Local l;
  l.conflicts = regionConflicts(b, idx, region);
  for (ItemRef r : idx.query(region, ~LayerMask(0)))
    if (r.type == ItemType::Track) l.length += trackLength(b.tracks[r.index]);
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

// Re-shapes the chosen tracks (`current` once grown to whole chains) on a copy of `b` after `move`
// was applied to it and scores the result against `b`. `items` gives the moved via/pad boxes.
template <class Move, class Items>
std::optional<Candidate> tryMove(const Board& b, const SpatialIndex& idx, const std::vector<char>& chosen,
                                 const std::vector<int>& current, Move&& move, Items&& items) {
  Candidate c{b, 0};
  if (!move(c.board)) return std::nullopt;
  auto st = reshapeTracks(c.board, chosen, nullptr, nullptr, true);
  std::vector<int> fresh;
  for (size_t i = c.board.tracks.size() - st.trackWire.size(); i < c.board.tracks.size(); ++i) fresh.push_back(int(i));
  BBox region = tracksBox(b, current);
  region.add(tracksBox(c.board, fresh));
  region.add(items(b));
  region.add(items(c.board));
  region = region.inflated(double(b.maxClearance()));
  SpatialIndex cidx;
  cidx.build(c.board);
  c.gain = evaluate(b, idx, region).score() - evaluate(c.board, cidx, region).score();
  return c;
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
  for (int round = 0; round < rounds; ++round) {
    int movedNow = 0;
    for (const Junction& j : junctionsOf(b, nets)) {
      Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
      LayerMask lm = LayerMask(1) << j.layer;
      // The first vertex of every track leaving the junction: the target is their geometric median.
      std::vector<Vec2> qs;
      for (const Track& t : b.tracks) {
        if (t.net != j.net || t.layer != j.layer) continue;
        if (js0.contains(t.a.v())) qs.push_back(t.b.v());
        else if (js0.contains(t.b.v())) qs.push_back(t.a.v());
      }
      if (qs.size() < 3) continue;
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
      Vec2 delta = P - j.p.v();
      if (delta.len() > 0.8 * nearest) delta = delta * (0.8 * nearest / delta.len());
      if (delta.len() < 1000) continue;
      auto chosen = attachedTo(b, js0, lm, j.net);
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
      auto noBox = [](const Board&) { return BBox{}; };
      std::optional<Candidate> best;
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
          best = std::move(c);
          break;
        }
      }
      if (best) {
        b = std::move(best->board);
        ++movedNow;
      }
    }
    moved += movedNow;
    if (movedNow == 0) break;
  }
  return moved;
}

OptimizeResult optimize(Board& b, const OptimizeOptions& o) {
  auto t0 = std::chrono::steady_clock::now();
  OptimizeResult r;
  r.lengthBefore = totalLength(b);
  r.conflictsBefore = conflictCount(b);
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };

  // A move must never disconnect anything: candidates are checked against the current ratsnest.
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  auto keepsConnectivity = [&](const Board& c) { return Connectivity::compute(c).ratsnest.size() <= unrouted; };

  // Moves are judged locally; an iteration that still ends with more conflicts overall is undone.
  int conflicts = r.conflictsBefore;
  double step = o.step;
  for (int it = 0; it < o.iterations && !cancelled(); ++it, step /= 2) {
    Board before = b;
    int viaMoves0 = r.viaMoves, componentMoves0 = r.componentMoves, junctionMoves0 = r.junctionMoves;
    int moves = 0;
    int total = (o.vias ? int(b.vias.size()) : 0) + (o.components ? int(b.components.size()) : 0);
    int done = 0;

    if (o.vias)
      for (int vi = 0; vi < int(b.vias.size()) && !cancelled(); ++vi) {
        if (o.progress) o.progress(++done, total, std::format("optimise {}: vias", it + 1));
        const Via& v = b.vias[vi];
        if (v.locked || (!o.nets.empty() && !std::ranges::contains(o.nets, v.net))) continue;
        Shape vs = Shape::circle(v.pos.v(), v.diameter / 2.0);
        auto chosen = attachedTo(b, vs, v.layers, v.net);
        if (std::ranges::none_of(chosen, [](char c) { return c != 0; })) continue;
        // Score of the current state over the same chains, and the squeeze on the via from it.
        std::vector<char> grown;
        Vec2 push{};
        {
          Board probe = b;
          auto pst = reshapeTracks(probe, chosen, nullptr, &grown, true);
          if (auto it = pst.viaPush.find(vi); it != pst.viaPush.end()) push = it->second;
        }
        std::vector<int> current;
        for (size_t i = 0; i < grown.size(); ++i)
          if (grown[i]) current.push_back(int(i));
        SpatialIndex idx;
        idx.build(b);
        auto viaBox = [vi](const Board& x) { return Shape::circle(x.vias[vi].pos.v(), x.vias[vi].diameter / 2.0).bbox(); };
        std::optional<Candidate> best;
        auto consider = [&](std::optional<Candidate> c) {
          if (c && c->gain > std::max(best ? best->gain : 0.0, 1000.0) && keepsConnectivity(c->board)) best = std::move(c);
        };
        consider(tryMove(b, idx, chosen, current, [](Board&) { return true; }, viaBox));  // re-shape in place
        // Where the wire through the via would run straight: the midpoint of the two vertices next
        // to the via along its wires (TopoR's F7 jog repair moves a via to (vh1 + vh2) / 2; its vias
        // end up on the straight line of their wires), the geometric median when more wires meet.
        std::vector<Vec2> deltas;
        {
          std::vector<Vec2> qs;
          for (size_t i = 0; i < b.tracks.size(); ++i) {
            if (!chosen[i]) continue;
            const Track& t = b.tracks[i];
            if (vs.contains(t.a.v()) == vs.contains(t.b.v())) continue;
            qs.push_back(vs.contains(t.a.v()) ? t.b.v() : t.a.v());
          }
          if (qs.size() >= 2) {
            Vec2 P = v.pos.v();
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
                bool done = (P1 - P).len() < 100;
                P = P1;
                if (done) break;
              }
            }
            Vec2 d = P - v.pos.v();
            if (d.len() > 1000) {
              deltas.push_back(d);
              deltas.push_back(d * 0.5);
            }
          }
        }
        // Away from the crowding (TopoR's move: the resultant of the tight edges, in shrinking
        // steps), then the compass directions.
        if (push.len() > 1000) {
          Vec2 away = -push.normalized() * std::clamp(push.len(), 0.25 * step, 2.5 * step);
          deltas.push_back(away);
          deltas.push_back(away * 0.5);
        }
        for (Vec2 d : kDirs) deltas.push_back(d * step);
        for (Vec2 delta : deltas) {
          auto move = [&](Board& c) {
            Via& cv = c.vias[vi];
            dragEnds(c, vs, cv.layers, cv.net, delta);
            cv.pos = Point(cv.pos.v() + delta);
            return true;
          };
          auto c = tryMove(b, idx, chosen, current, move, viaBox);
          bool ok = c && c->gain > 1000.0 && keepsConnectivity(c->board);
          consider(std::move(c));
          if (ok) continue;
          // Blocked by the wires of other nets: they come along and are re-shaped with the via's own
          // (TopoR re-lays the wires around a moved via, so a via may slide along its wire through a bus).
          std::vector<char> with = chosen;
          addNeighbours(b, with, v.pos.v(), v.pos.v() + delta, v.diameter / 2.0 + double(b.maxClearance()), v.layers, o.nets);
          if (with != chosen) consider(tryMove(b, idx, with, current, move, viaBox));
        }
        if (best) {
          bool moved = best->board.vias[vi].pos != b.vias[vi].pos;
          b = std::move(best->board);
          if (moved) {
            ++moves;
            ++r.viaMoves;
          }
        }
      }

    // Free branch points — where three or more tracks of one net and layer meet at no pad or via —
    // move like vias: the wires from them get shorter (TopoR's F5 slides such a junction too).
    if (o.junctions) {
      std::vector<Junction> js = junctionsOf(b, o.nets);
      total += int(js.size());
      for (const Junction& j : js) {
        if (cancelled()) break;
        if (o.progress) o.progress(++done, total, std::format("optimise {}: junctions", it + 1));
        Shape js0 = Shape::circle(j.p.v(), j.width / 2.0);
        LayerMask lm = LayerMask(1) << j.layer;
        auto chosen = attachedTo(b, js0, lm, j.net);
        if (std::ranges::none_of(chosen, [](char c) { return c != 0; })) continue;
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
        auto noBox = [](const Board&) { return BBox{}; };
        std::optional<Candidate> best;
        bool moved = false;
        auto consider = [&](std::optional<Candidate> c, bool isMove) {
          if (c && c->gain > std::max(best ? best->gain : 0.0, 1000.0) && keepsConnectivity(c->board)) {
            best = std::move(c);
            moved = isMove;
          }
        };
        for (Vec2 d : kDirs) {
          Vec2 delta = d * step;
          consider(tryMove(
                       b, idx, chosen, current,
                       [&](Board& c) {
                         dragEnds(c, js0, lm, j.net, delta);
                         return true;
                       },
                       noBox),
                   true);
        }
        if (best) {
          b = std::move(best->board);
          if (moved) {
            ++moves;
            ++r.junctionMoves;
          }
        }
      }
    }

    if (o.components && o.nets.empty())
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
        auto padsBox = [ci](const Board& x) {
          BBox bb;
          for (int pi : x.components[ci].pads) bb.add(x.pads[pi].shapeGeom().bbox());
          return bb;
        };
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
    int now = moves ? conflictCount(b) : conflicts;
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
  return r;
}

}  // namespace xr::topo
