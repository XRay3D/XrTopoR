#include "router/topo/Optimizer.h"

#include <algorithm>
#include <chrono>
#include <span>
#include <format>
#include <optional>

#include "core/Connectivity.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"

namespace xr::topo {

namespace {

constexpr double kConflictCost = 20 * kNmPerMm;  // one clearance conflict weighs like 20 mm of track
constexpr double kDepthCost = 100;               // plus 100 mm per mm of overlap depth
constexpr double kTolerance = 2000;              // as the DRC: below this is rounding

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
  int conflicts = 0;
  double depth = 0;
  double score() const { return length + conflicts * kConflictCost + depth * kDepthCost; }
};

// Length of the given tracks and their clearance conflicts (plus those of the given vias/pads).
Local evaluate(const Board& b, const std::vector<int>& tracks, const std::vector<int>& vias,
               const std::vector<int>& pads) {
  SpatialIndex idx;
  idx.build(b);
  Local l;
  auto account = [&](const Shape& s, LayerMask layers, int net) {
    double m = shapeMargin(b, idx, s, layers, net);
    if (m < -kTolerance) {
      ++l.conflicts;
      l.depth -= m;
    }
  };
  for (int ti : tracks) {
    const Track& t = b.tracks[ti];
    l.length += trackLength(t);
    for (auto& s : itemShapes(b, {ItemType::Track, ti})) account(s, LayerMask(1) << t.layer, t.net);
  }
  for (int vi : vias) account(Shape::circle(b.vias[vi].pos.v(), b.vias[vi].diameter / 2.0), b.vias[vi].layers, b.vias[vi].net);
  for (int pi : pads) account(b.pads[pi].shapeGeom(), b.pads[pi].copper, b.pads[pi].net);
  return l;
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
  Local local;
};

// Re-shapes the chosen tracks on a copy of `b` after `move` was applied to it and scores the result.
template <class Move>
std::optional<Candidate> tryMove(const Board& b, const std::vector<char>& chosen, Move&& move,
                                 const std::vector<int>& vias, const std::vector<int>& pads) {
  Candidate c{b, {}};
  if (!move(c.board)) return std::nullopt;
  auto st = reshapeTracks(c.board, chosen, nullptr, nullptr, true);
  std::vector<int> fresh;
  for (size_t i = c.board.tracks.size() - st.trackWire.size(); i < c.board.tracks.size(); ++i) fresh.push_back(int(i));
  c.local = evaluate(c.board, fresh, vias, pads);
  return c;
}

const Vec2 kDirs[] = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}, {0.7071, 0.7071}, {-0.7071, 0.7071}, {0.7071, -0.7071}, {-0.7071, -0.7071}};

// Moves track end points lying inside `shape` (net, layers) by d.
void dragEnds(Board& b, const Shape& shape, LayerMask layers, int net, Vec2 d) {
  for (auto& t : b.tracks) {
    if (t.net != net || !((layers >> t.layer) & 1)) continue;
    if (shape.contains(t.a.v())) t.a = Point(t.a.v() + d);
    if (shape.contains(t.b.v())) t.b = Point(t.b.v() + d);
  }
}

}  // namespace

OptimizeResult optimize(Board& b, const OptimizeOptions& o) {
  auto t0 = std::chrono::steady_clock::now();
  OptimizeResult r;
  r.lengthBefore = totalLength(b);
  r.conflictsBefore = conflictCount(b);
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };

  // A move must never disconnect anything: candidates are checked against the current ratsnest.
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  auto keepsConnectivity = [&](const Board& c) { return Connectivity::compute(c).ratsnest.size() <= unrouted; };

  double step = o.step;
  for (int it = 0; it < o.iterations && !cancelled(); ++it, step /= 2) {
    int moves = 0;
    int total = (o.vias ? int(b.vias.size()) : 0) + (o.components ? int(b.components.size()) : 0);
    int done = 0;

    if (o.vias)
      for (int vi = 0; vi < int(b.vias.size()) && !cancelled(); ++vi) {
        if (o.progress) o.progress(++done, total, std::format("optimise {}: vias", it + 1));
        const Via& v = b.vias[vi];
        if (v.locked) continue;
        Shape vs = Shape::circle(v.pos.v(), v.diameter / 2.0);
        auto chosen = attachedTo(b, vs, v.layers, v.net);
        if (std::ranges::none_of(chosen, [](char c) { return c != 0; })) continue;
        // Score of the current state over the same chains.
        std::vector<char> grown;
        {
          Board probe = b;
          reshapeTracks(probe, chosen, nullptr, &grown, true);
        }
        std::vector<int> current;
        for (size_t i = 0; i < grown.size(); ++i)
          if (grown[i]) current.push_back(int(i));
        Local base = evaluate(b, current, {vi}, {});
        std::optional<Candidate> best;
        auto consider = [&](std::optional<Candidate> c) {
          if (c && c->local.score() < (best ? best->local.score() : base.score()) - 1000 && keepsConnectivity(c->board))
            best = std::move(c);
        };
        consider(tryMove(b, chosen, [](Board&) { return true; }, {vi}, {}));  // re-shape in place
        for (Vec2 d : kDirs) {
          Vec2 delta = d * step;
          consider(tryMove(
              b, chosen,
              [&](Board& c) {
                Via& cv = c.vias[vi];
                dragEnds(c, vs, cv.layers, cv.net, delta);
                cv.pos = Point(cv.pos.v() + delta);
                return true;
              },
              {vi}, {}));
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

    if (o.components)
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
        Local base = evaluate(b, current, {}, comp.pads);
        std::optional<Candidate> best;
        auto consider = [&](std::optional<Candidate> c) {
          if (c && c->local.score() < (best ? best->local.score() : base.score()) - 1000 && keepsConnectivity(c->board))
            best = std::move(c);
        };
        for (Vec2 d : std::span(kDirs, 4)) {
          Vec2 delta = d * step;
          consider(tryMove(
              b, chosen,
              [&](Board& c) {
                for (int pi : c.components[ci].pads) {
                  const Pad& p = c.pads[pi];
                  dragEnds(c, p.shapeGeom(), p.copper, p.net, delta);
                }
                c.moveComponent(ci, c.components[ci].pos + Point(delta));
                return true;
              },
              {}, comp.pads));
        }
        if (best) {
          b = std::move(best->board);
          ++moves;
          ++r.componentMoves;
        }
      }
    r.log.push_back(std::format("iteration {}: step {:.3f} mm, {} move(s)", it + 1, step / kNmPerMm, moves));
    if (moves == 0 && it > 0) break;
  }
  r.lengthAfter = totalLength(b);
  r.conflictsAfter = conflictCount(b);
  r.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  return r;
}

}  // namespace xr::topo
