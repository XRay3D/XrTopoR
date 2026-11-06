#include "router/topo/ModelBranch.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <format>
#include <map>
#include <optional>
#include <print>
#include <set>

#include "core/Prof.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "geom/Geometry.h"
#include "router/topo/ModelTools.h"

namespace xr::topo {

namespace {

constexpr double kAt = 3;                       // nm: two points are one
constexpr double kKeepOff = 0.05 * kNmPerMm;    // a new branch point stands this far off the copper of its net, beyond its own half width
constexpr double kNotAtAnEnd = 0.05 * kNmPerMm; // ... and off the far ends of the two segments (there it would be no new vertex)

// The tracks of a board edited (ends moved, tracks added and taken away), drawn anew through a model built from
// them. Nothing when the model of the tracks has wires crossing or a wire through another net's pad.
struct Redrawn {
  Topology model;
  Board board;
  DrawingScore score;
};
std::optional<Redrawn> redraw(const Board& edited, bool flips, int& drawings) {
  ProfScope p("branch points: redrawing");
  Redrawn r{{}, edited, {}};
  Topology::assignIds(r.board);
  r.model.build(r.board);
  int nFlips = 0;
  std::vector<Violation> stop;
  if (!prepareModel(r.model, flips, false, nFlips, stop)) return std::nullopt;
  RealizeStats st;
  int wires = 0;
  drawModel(r.board, r.model, true, st, wires);
  r.score = scoreDrawing(r.board);
  ++drawings;
  return r;
}

// The first straight track of a wire that leaves the copper of the owner the wire ends at.
struct Leg {
  int wire = -1;
  size_t track = 0;  // index in the board's tracks
  bool fromA = true; // the track's `a` is the end at the vertex
  Vec2 from, to;     // the point the wire starts from (the vertex: a centre, the centre of a rounded end), the track's far end
  Coord width = 0;
  LayerId layer = 0;
};

std::optional<Leg> legOf(const Board& b, const Topology& t, const std::map<uint32_t, size_t>& trackOf, int wi, int end) {
  const Wire& w = t.wires[wi];
  if (w.tracks.empty() || w.locked) return std::nullopt;
  const Owner& V = t.owners[w.end[end]];
  const LayerMesh& m = *t.mesh(w.layer);
  Vec2 cur = V.kind == Owner::Kind::Pad ? V.c : m.verts[w.endVertex[end]].p;  // a pad's wire is drawn from its centre
  const int n = int(w.tracks.size());
  for (int k = 0; k < n; ++k) {
    auto it = trackOf.find(w.tracks[size_t(end == 0 ? k : n - 1 - k)]);
    if (it == trackOf.end()) return std::nullopt;
    const Track& tr = b.tracks[it->second];
    const bool fromA = (tr.a.v() - cur).len() <= (tr.b.v() - cur).len();
    const Vec2 near = fromA ? tr.a.v() : tr.b.v(), far = fromA ? tr.b.v() : tr.a.v();
    if ((near - cur).len() > 1000) return std::nullopt;  // not this wire's chain from the vertex
    if (V.shape.distance(far) <= 0) {  // still inside the owner's copper: the lead
      cur = far;
      continue;
    }
    if (tr.isArc() || tr.locked) return std::nullopt;
    return Leg{wi, it->second, fromA, near, far, tr.width, tr.layer};
  }
  return std::nullopt;
}

// The point that joins three with the least length (Fermat's; the vertex itself when the angle there is 120
// degrees or more).
Vec2 steinerPoint(Vec2 v, Vec2 a, Vec2 c) { return geometricMedian(Polyline{v, a, c}, (v + a + c) / 3.0); }

}  // namespace

BranchResult splitBranches(Board& b, Topology& t, const BranchOptions& o) {
  ProfScope pAll("branch points: new");
  BranchResult r;
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  std::map<uint32_t, size_t> trackOf;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (b.tracks[i].id) trackOf[b.tracks[i].id] = i;
  SpatialIndex idx;
  idx.build(b);
  const double maxClr = double(b.maxClearance());
  // A new segment keeps the rule from the copper of other nets (it lies inside the triangle of the two it
  // replaces, but that triangle may hold a pad).
  auto clear = [&](Vec2 p, Vec2 q, int net, LayerId layer, double width) {
    if ((q - p).len() < 1) return true;
    BBox box;
    box.add(p);
    box.add(q);
    bool ok = true;
    idx.query(box.inflated(width / 2 + maxClr + 1000), LayerMask(1) << layer, [&](ItemRef it) {
      if (!ok) return;
      const int other = itemNet(b, it);
      if (other == net) return;
      const double need = width / 2 + double(other >= 0 ? b.clearance(net, other, layer) : b.clearance(net, layer));
      for (const Shape& sh : itemShapes(b, it))
        if (sh.distanceToSegment(p, q) < need) {
          ok = false;
          return;
        }
    });
    return ok;
  };
  // Not inside copper of its own net: there the conversion would end the wires at the pad, off its centre.
  auto offOwnCopper = [&](Vec2 p, int net, LayerId layer, double half) {
    for (const Owner& x : t.owners)
      if (x.net == net && x.layers != 0 && ((x.layers >> layer) & 1) && (x.kind == Owner::Kind::Pad || x.kind == Owner::Kind::Via) &&
          x.shape.distance(p) < half + kKeepOff)
        return false;
    return true;
  };

  // The legs by the vertex they leave.
  std::map<std::tuple<int, LayerId, long, long>, std::vector<Leg>> at;  // (owner, layer, the point) -> legs
  int dEnds = 0, dNoVertex = 0, dNoLeg = 0, dPairs = 0, dWidth = 0, dWide = 0, dGain = 0, dInV = 0, dEnd = 0, dOwn = 0, dClear = 0;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked || b.flexFixed(w.net) || w.net < 0) continue;  // a flexibly fixed net keeps its wires
    for (int end = 0; end < 2; ++end) {
      if (w.end[end] < 0) continue;
      const Owner& V = t.owners[w.end[end]];
      if (V.locked) continue;
      const bool vertex = V.kind == Owner::Kind::Via || V.kind == Owner::Kind::Junction ||
                          (V.kind == Owner::Kind::Pad && (V.shape.kind == Shape::Kind::Point || V.shape.kind == Shape::Kind::Segment));
      ++dEnds;
      if (!vertex) {
        ++dNoVertex;
        continue;
      }
      if (!legOf(b, t, trackOf, wi, end)) ++dNoLeg;
      if (auto leg = legOf(b, t, trackOf, wi, end)) at[{w.end[end], leg->layer, std::lround(leg->from.x / 100), std::lround(leg->from.y / 100)}].push_back(*leg);
    }
  }
  // A branch point of three wires is not split: the forces take it to where its wires meet at 120 degrees (or
  // as near that as the copper round it lets them). One of four and more is what two that came together leave.
  std::vector<int> wiresAt(t.owners.size(), 0);
  for (const Wire& w : t.wires)
    for (int end = 0; end < 2; ++end)
      if (w.end[end] >= 0) ++wiresAt[size_t(w.end[end])];
  if (debug) {
    // What the branch points of three wires stand off their balance by (something holds them): the gain of the
    // point of least length for the far ends of the three first tracks, obstacles not looked at.
    int n = 0;
    double sum = 0;
    for (auto& [key, legs] : at) {
      const Owner& V = t.owners[std::get<0>(key)];
      if (V.kind != Owner::Kind::Junction || legs.size() != 3 || wiresAt[size_t(std::get<0>(key))] != 3) continue;
      const Vec2 f = geometricMedian(Polyline{legs[0].to, legs[1].to, legs[2].to}, V.c);
      double now = 0, best = 0;
      for (const Leg& l : legs) {
        now += (l.to - l.from).len();
        best += (l.to - f).len();
      }
      if (now - best < o.gain) continue;
      ++n;
      sum += now - best;
      std::println(stderr, "  branch point of {} at ({:.3f}, {:.3f}) off its balance: {:.2f} mm to gain at ({:.3f}, {:.3f})", b.nets[V.net].name, V.c.x / 1e6, -V.c.y / 1e6,
                   (now - best) / 1e6, f.x / 1e6, -f.y / 1e6);
    }
    std::println(stderr, "branch points off their balance: {}, {:.2f} mm to gain", n, sum / 1e6);
  }
  // The best pair at every vertex.
  struct Split {
    int owner;
    Leg x, y;
    Vec2 p;
    double gain;
  };
  std::vector<Split> splits;
  for (auto& [key, legs] : at) {
    if (legs.size() < 2) continue;
    const int owner = std::get<0>(key);
    const Owner& V = t.owners[owner];
    if (V.kind == Owner::Kind::Junction && wiresAt[size_t(owner)] < 4) continue;
    std::vector<Split> here;
    for (size_t i = 0; i < legs.size(); ++i)
      for (size_t j = i + 1; j < legs.size(); ++j) {
        const Leg& x = legs[i];
        const Leg& y = legs[j];
        if (x.wire == y.wire || (x.from - y.from).len() > kAt) continue;
        ++dPairs;
        if (x.width != y.width) {
          ++dWidth;
          continue;
        }
        const Vec2 n = x.from, dx = x.to - n, dy = y.to - n;
        if (dx.len() < 1 || dy.len() < 1) continue;
        if (dx.dot(dy) / (dx.len() * dy.len()) <= -0.5) {  // 120 degrees or more: the vertex is where it should be
          ++dWide;
          continue;
        }
        const Vec2 steiner = steinerPoint(n, x.to, y.to);
        const double all = dx.len() + dy.len();
        auto gainAt = [&](Vec2 q) { return all - ((q - n).len() + (q - x.to).len() + (q - y.to).len()); };
        if (gainAt(steiner) < o.gain) {
          ++dGain;
          continue;
        }
        ++r.candidates;
        const double half = x.width / 2.0;
        const int net = t.wires[x.wire].net;
        // 0 when a branch point may stand there; else what is in the way.
        auto wrong = [&](Vec2 q) {
          if (V.shape.distance(q) < half + kKeepOff) return 1;
          if ((q - x.to).len() < kNotAtAnEnd || (q - y.to).len() < kNotAtAnEnd) return 2;
          if (!offOwnCopper(q, net, x.layer, half)) return 3;
          if (!clear(n, q, net, x.layer, x.width) || !clear(q, x.to, net, x.layer, x.width) || !clear(q, y.to, net, x.layer, x.width)) return 4;
          return 0;
        };
        Vec2 p = steiner;
        int why = wrong(p);
        if (why == 4) {
          // Something of another net stands between the branches (the paper's fig. 6): the trunk ends before
          // it, as far along as the three segments are clear; the forces take the branch point on from there.
          double lo = 0, hi = 1;
          for (int k = 9; k >= 1; --k)
            if (wrong(n + (steiner - n) * (k / 10.0)) == 0) {
              lo = k / 10.0;
              hi = lo + 0.1;
              break;
            }
          if (lo > 0) {
            for (int k = 0; k < 6; ++k) {
              const double mid = (lo + hi) / 2;
              (wrong(n + (steiner - n) * mid) == 0 ? lo : hi) = mid;
            }
            p = n + (steiner - n) * lo;
            why = gainAt(p) >= o.gain ? 0 : 5;
          }
        }
        if (why != 0) {
          ++(why == 1 ? dInV : why == 2 ? dEnd : why == 3 ? dOwn : why == 4 ? dClear : dGain);
          continue;
        }
        const double gain = gainAt(p);
        here.push_back(Split{owner, x, y, p, gain});
      }
    // The pair with the most to gain, and the best of the pairs of the other wires there: a vertex of four
    // wires gives two pairs at once (of a branch point nothing is left then but a bend in the way between the
    // two new ones, and the drawing pulls that out).
    std::ranges::sort(here, [](const Split& a, const Split& c) { return a.gain > c.gain; });
    for (size_t k = 0, taken = 0; k < here.size() && taken < 2; ++k) {
      if (taken == 1 && (here[k].x.wire == splits.back().x.wire || here[k].x.wire == splits.back().y.wire || here[k].y.wire == splits.back().x.wire ||
                         here[k].y.wire == splits.back().y.wire))
        continue;
      splits.push_back(here[k]);
      ++taken;
    }
  }
  if (debug)
    std::println(stderr, "new branch points: {} wire ends, {} not at a vertex, {} with no straight leg; {} pairs: {} of two widths, {} at 120 degrees or more, {} with too "
                         "little to gain, {} with the point in the vertex's copper, {} at a leg's end, {} in copper of the net, {} too close to another net; {} left",
                 dEnds, dNoVertex, dNoLeg, dPairs, dWidth, dWide, dGain, dInV, dEnd, dOwn, dClear, splits.size());
  std::ranges::sort(splits, [](const Split& x, const Split& y) { return x.gain > y.gain; });
  // A wire in one split a pass (its other end may be a pair's leg too).
  {
    std::set<int> used;
    std::erase_if(splits, [&](const Split& s) {
      if (used.contains(s.x.wire) || used.contains(s.y.wire)) return true;
      used.insert(s.x.wire);
      used.insert(s.y.wire);
      return false;
    });
  }
  if (splits.empty()) return r;

  auto apply = [&](Board& eb, const Split& s) {
    for (const Leg* leg : {&s.x, &s.y}) {
      Track& tr = eb.tracks[leg->track];
      (leg->fromA ? tr.a : tr.b) = Point(s.p);
    }
    Track trunk = eb.tracks[s.x.track];
    trunk.a = Point(s.x.from);
    trunk.b = Point(s.p);
    trunk.id = 0;
    trunk.mid.reset();
    eb.tracks.push_back(trunk);
  };
  const DrawingScore was = scoreDrawing(b);
  // All of them at once; when the model of the edited tracks does not stand (wires crossing), or the drawing
  // is no better, the splits near what went wrong are left out and the rest tried again.
  std::vector<char> out(splits.size(), 0);
  for (int attempt = 0; attempt < 4; ++attempt) {
    Board eb = b;
    int n = 0;
    double gain = 0;
    for (size_t k = 0; k < splits.size(); ++k)
      if (!out[k]) {
        apply(eb, splits[k]);
        ++n;
        gain += splits[k].gain;
      }
    if (n == 0) break;
    auto drawn = redraw(eb, o.flips, r.drawings);
    const bool better = drawn && betterDrawing(drawn->score, was);
    r.log.push_back(std::format("new branch points: {} of {} pair(s) under 120 degrees, {:.2f} mm to gain: {}", n, splits.size(), gain / 1e6,
                                !drawn ? "the model of the tracks does not stand"
                                       : std::format("{} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm (was {} in {}, {:.1f}): {}", drawn->score.conflicts,
                                                     drawn->score.places, drawn->score.shortfall / 1e6, drawn->score.length / 1e6, was.conflicts, was.places,
                                                     was.length / 1e6, better ? "taken" : "no better")));
    if (better) {
      b = std::move(drawn->board);
      t = std::move(drawn->model);
      r.made = n;
      r.gain = gain;
      return r;
    }
    // Which to leave out: one by one against the model of the tracks when that did not stand; else the half
    // with the least to gain (the drawing does not say which split it was worse for).
    if (!drawn) {
      bool any = false;
      for (size_t k = 0; k < splits.size(); ++k) {
        if (out[k]) continue;
        Board one = b;
        apply(one, splits[k]);
        Topology::assignIds(one);
        Topology m;
        m.build(one);
        if (std::ranges::any_of(m.violations, [](const Violation& v) { return v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad; })) {
          out[k] = 1;
          any = true;
          if (debug) std::println(stderr, "new branch point of {} at ({:.3f}, {:.3f}) left out: its wires would cross what lies between", b.nets[t.wires[splits[k].x.wire].net].name, splits[k].p.x / 1e6, -splits[k].p.y / 1e6);
        }
      }
      if (!any) break;
    } else {
      int left = 0;
      for (size_t k = 0; k < splits.size(); ++k) left += !out[k];
      int drop = std::max(1, left / 2);
      for (size_t k = splits.size(); k-- > 0 && drop > 0;)
        if (!out[k]) {
          out[k] = 1;
          --drop;
        }
    }
  }
  return r;
}

BranchResult mergeBranchPoints(Board& b, Topology& t, const BranchOptions& o) {
  ProfScope pAll("branch points: merged");
  BranchResult r;
  // Pairs of branch points of one net and layer, one within the other's copper.
  struct Pair {
    int keep, gone;
  };
  std::vector<Pair> pairs;
  std::set<int> taken;
  for (int i = 0; i < int(t.owners.size()); ++i) {
    const Owner& x = t.owners[i];
    if (x.kind != Owner::Kind::Junction || x.layers == 0 || x.locked || b.flexFixed(x.net) || taken.contains(i)) continue;
    for (int j = i + 1; j < int(t.owners.size()); ++j) {
      const Owner& y = t.owners[j];
      if (y.kind != Owner::Kind::Junction || y.net != x.net || y.layers != x.layers || y.locked || taken.contains(j)) continue;
      if ((x.c - y.c).len() > std::max(x.halfWidth, y.halfWidth)) continue;
      pairs.push_back({i, j});
      taken.insert(i);
      taken.insert(j);
      break;
    }
  }
  if (pairs.empty()) return r;
  r.candidates = int(pairs.size());
  const DrawingScore was = scoreDrawing(b);
  Board eb = b;
  std::set<uint32_t> gone;
  for (const Pair& p : pairs) {
    const Owner& keep = t.owners[p.keep];
    const Owner& lost = t.owners[p.gone];
    for (const Wire& w : t.wires)
      if ((w.end[0] == p.keep && w.end[1] == p.gone) || (w.end[0] == p.gone && w.end[1] == p.keep)) gone.insert(w.tracks.begin(), w.tracks.end());
    for (Track& tr : eb.tracks) {
      if (tr.net != lost.net || !((lost.layers >> tr.layer) & 1) || tr.isArc()) continue;
      if ((tr.a.v() - lost.c).len() <= kAt) tr.a = Point(keep.c);
      if ((tr.b.v() - lost.c).len() <= kAt) tr.b = Point(keep.c);
    }
  }
  std::erase_if(eb.tracks, [&](const Track& tr) { return (tr.id && gone.contains(tr.id)) || (!tr.isArc() && tr.a == tr.b); });
  auto drawn = redraw(eb, o.flips, r.drawings);
  // Not by the length (nothing is gained yet: the four wires are paired anew afterwards): no real place of
  // violation more.
  const bool taken2 = drawn && std::tuple(drawn->score.unrouted, drawn->score.shorts, drawn->score.deep, drawn->score.real) <=
                                   std::tuple(was.unrouted, was.shorts, was.deep, was.real);
  r.log.push_back(std::format("branch points come together: {} pair(s) made one: {}", pairs.size(), !drawn ? "the model of the tracks does not stand" : taken2 ? "taken" : "no better"));
  if (taken2) {
    b = std::move(drawn->board);
    t = std::move(drawn->model);
    r.made = int(pairs.size());
  }
  return r;
}

}  // namespace xr::topo
