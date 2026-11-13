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
#include "topo/Relay.h"

namespace xr::topo {

namespace {

constexpr double kAt = 3;                       // nm: two points are one
constexpr double kKeepOff = 0.05 * kNmPerMm;    // a new branch point stands this far off the copper of its net, beyond its own half width
constexpr double kNotAtAnEnd = 0.05 * kNmPerMm; // ... and off the far ends of the two segments (there it would be no new vertex)

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

// A segment of a wire of `net` keeps the rule from the copper of other nets.
bool segmentClear(const Board& b, const SpatialIndex& idx, double maxClr, Vec2 p, Vec2 q, int net, LayerId layer, double width, ItemRef* hit = nullptr) {
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
        if (hit) *hit = it;
        return;
      }
  });
  return ok;
}

// Not inside copper of its own net: there the conversion would end the wires at the pad, off its centre.
bool offOwnCopper(const Topology& t, Vec2 p, int net, LayerId layer, double half) {
  for (const Owner& x : t.owners)
    if (x.net == net && x.layers != 0 && ((x.layers >> layer) & 1) && (x.kind == Owner::Kind::Pad || x.kind == Owner::Kind::Via) && x.shape.distance(p) < half + kKeepOff)
      return false;
  return true;
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
  auto clear = [&](Vec2 p, Vec2 q, int net, LayerId layer, double width, ItemRef* hit = nullptr) { return segmentClear(b, idx, maxClr, p, q, net, layer, width, hit); };
  auto offOwnCopper = [&](Vec2 p, int net, LayerId layer, double half) { return topo::offOwnCopper(t, p, net, layer, half); };

  // The legs by the vertex they leave.
  std::map<std::tuple<int, LayerId, long, long>, std::vector<Leg>> at;  // (owner, layer, the point) -> legs
  int dEnds = 0, dNoVertex = 0, dNoLeg = 0, dPairs = 0, dWidth = 0, dWide = 0, dGain = 0, dInV = 0, dEnd = 0, dOwn = 0, dClear = 0;
  // What is not done, counted (XR_TOPO_DEBUG): pairs of two widths and pairs at polygon pads that would gain,
  // obstacles not looked at; a pair stopped by another net's track, and by its pad or via.
  int dWidthCould = 0, dPolyCould = 0, dClearTrack = 0;
  double gWidth = 0, gPoly = 0;
  std::map<std::pair<int, LayerId>, std::vector<Leg>> atPoly;  // the legs at the polygon pads
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked || w.pair >= 0 || b.flexFixed(w.net) || w.net < 0) continue;  // a flexibly fixed net keeps its wires
    for (int end = 0; end < 2; ++end) {
      if (w.end[end] < 0) continue;
      const Owner& V = t.owners[w.end[end]];
      if (V.locked) continue;
      const bool vertex = V.kind == Owner::Kind::Via || V.kind == Owner::Kind::Junction ||
                          (V.kind == Owner::Kind::Pad && (V.shape.kind == Shape::Kind::Point || V.shape.kind == Shape::Kind::Segment));
      ++dEnds;
      if (!vertex) {
        ++dNoVertex;
        if (debug && V.kind == Owner::Kind::Pad && V.shape.kind == Shape::Kind::Polygon)
          if (auto leg = legOf(b, t, trackOf, wi, end)) atPoly[{w.end[end], leg->layer}].push_back(*leg);
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
    std::optional<Vec2> round;
  };
  std::vector<Split> splits;
  for (auto& [key, legs] : at) {
    if (legs.size() < 2) continue;
    const int owner = std::get<0>(key);
    const Owner& V = t.owners[owner];
    if (V.kind == Owner::Kind::Junction && wiresAt[size_t(owner)] < 4) continue;
    // A via with these two wires alone is a point of one wire, not a vertex of the net's tree: with a branch point
    // made before it, it would be left at the end of a stub (the vias' tool takes such a via out, and F7 pulls it
    // onto the wire's straight line).
    if (!o.bareVias && V.kind == Owner::Kind::Via && wiresAt[size_t(owner)] < 3) continue;
    std::vector<Split> here;
    for (size_t i = 0; i < legs.size(); ++i)
      for (size_t j = i + 1; j < legs.size(); ++j) {
        const Leg& x = legs[i];
        const Leg& y = legs[j];
        if (x.wire == y.wire || (x.from - y.from).len() > kAt) continue;
        ++dPairs;
        if (x.width != y.width) {
          ++dWidth;
          if (debug) {
            const Vec2 n = x.from, dx = x.to - n, dy = y.to - n;
            if (dx.len() >= 1 && dy.len() >= 1 && dx.dot(dy) / (dx.len() * dy.len()) > -0.5) {
              const Vec2 s = steinerPoint(n, x.to, y.to);
              const double g = dx.len() + dy.len() - ((s - n).len() + (s - x.to).len() + (s - y.to).len());
              if (g >= o.gain && V.shape.distance(s) >= std::max(x.width, y.width) / 2.0 + kKeepOff) {
                ++dWidthCould;
                gWidth += g;
              }
            }
          }
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
        std::optional<Vec2> round;  // the trunk's vertex beside what it goes round
        double roundGain = 0;
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
          // ... or the shared way goes round it, when it is a pad or a via in the trunk's way alone (fig. 6:
          // one of the two paths that bend round the object is laid the other side of it, which is the trunk
          // passing it): the branch point stands where it would without the object, the trunk has a vertex
          // beside the object and the drawing bends it round.
          ItemRef hit{};
          if (!clear(n, steiner, net, x.layer, x.width, &hit) && (hit.type == ItemType::Pad || hit.type == ItemType::Via) && clear(steiner, x.to, net, x.layer, x.width) &&
              clear(steiner, y.to, net, x.layer, x.width) && V.shape.distance(steiner) >= half + kKeepOff && (steiner - x.to).len() >= kNotAtAnEnd &&
              (steiner - y.to).len() >= kNotAtAnEnd && offOwnCopper(steiner, net, x.layer, half)) {
            BBox box;
            for (const Shape& sh : itemShapes(b, hit)) box.add(sh.bbox());
            const int other = itemNet(b, hit);
            const double off = std::max(box.width(), box.maxY - box.minY) / 2 + half + double(other >= 0 ? b.clearance(net, other, x.layer) : b.clearance(net, x.layer)) +
                               0.02 * kNmPerMm;
            const Vec2 d = (steiner - n).normalized(), side{-d.y, d.x};
            for (double sign : {1.0, -1.0}) {
              const Vec2 q = box.center() + side * (sign * off);
              if ((q - n).dot(d) <= 0 || (steiner - q).dot(d) <= 0) continue;  // beside the trunk, not behind either end
              if (!clear(n, q, net, x.layer, x.width) || !clear(q, steiner, net, x.layer, x.width)) continue;
              const double g = all - ((q - n).len() + (steiner - q).len() + (steiner - x.to).len() + (steiner - y.to).len());
              if (g >= o.gain && (why != 0 || g > gainAt(p)) && (!round || g > roundGain)) {
                round = q;
                roundGain = g;
              }
            }
            if (round) {
              p = steiner;
              why = 0;
            }
          }
        }
        if (why != 0) {
          ++(why == 1 ? dInV : why == 2 ? dEnd : why == 3 ? dOwn : why == 4 ? dClear : dGain);
          if (debug && why == 4) {
            ItemRef hit{};
            if ((!clear(n, steiner, net, x.layer, x.width, &hit) || !clear(steiner, x.to, net, x.layer, x.width, &hit) || !clear(steiner, y.to, net, x.layer, x.width, &hit)) &&
                hit.type == ItemType::Track)
              ++dClearTrack;
          }
          continue;
        }
        const double gain = round ? roundGain : gainAt(p);
        here.push_back(Split{owner, x, y, p, gain, round});
      }
    // The pair with the most to gain, and the best of the pairs of the other wires there: a vertex of four
    // wires gives two pairs at once (of a branch point nothing is left then but a bend in the way between the
    // two new ones, and the drawing pulls that out).
    r::sort(here, std::greater{}, &Split::gain);
    for (size_t k = 0, taken = 0; k < here.size() && taken < 2; ++k) {
      if (taken == 1 && (here[k].x.wire == splits.back().x.wire || here[k].x.wire == splits.back().y.wire || here[k].y.wire == splits.back().x.wire ||
                         here[k].y.wire == splits.back().y.wire))
        continue;
      splits.push_back(here[k]);
      ++taken;
    }
  }
  if (debug) {
    std::println(stderr, "new branch points: {} wire ends, {} not at a vertex, {} with no straight leg; {} pairs: {} of two widths, {} at 120 degrees or more, {} with too "
                         "little to gain, {} with the point in the vertex's copper, {} at a leg's end, {} in copper of the net, {} too close to another net; {} left",
                 dEnds, dNoVertex, dNoLeg, dPairs, dWidth, dWide, dGain, dInV, dEnd, dOwn, dClear, splits.size());
    // The pairs at polygon pads: from the pad's centre, as if it were a vertex.
    for (auto& [key, legs] : atPoly) {
      const Owner& V = t.owners[size_t(key.first)];
      for (size_t i = 0; i < legs.size(); ++i)
        for (size_t j = i + 1; j < legs.size(); ++j) {
          const Leg& x = legs[i];
          const Leg& y = legs[j];
          const Vec2 n = V.c, dx = x.to - n, dy = y.to - n;
          if (x.wire == y.wire || x.width != y.width || dx.len() < 1 || dy.len() < 1 || dx.dot(dy) / (dx.len() * dy.len()) <= -0.5) continue;
          const Vec2 s = steinerPoint(n, x.to, y.to);
          const double g = dx.len() + dy.len() - ((s - n).len() + (s - x.to).len() + (s - y.to).len());
          if (g >= o.gain && V.shape.distance(s) >= x.width / 2.0 + kKeepOff) {
            ++dPolyCould;
            gPoly += g;
          }
        }
    }
    // The only wire of a pad or a via, to a branch point of three wires, and a track of the net that is no wire
    // of that branch point nearer to the pad than the wire is long (the clinch paper's fig. 6: the wire goes,
    // the pad is joined to the near wire by a new branch point). What stands between is not looked at.
    int dReattach = 0;
    double gReattach = 0;
    for (int wi = 0; wi < int(t.wires.size()); ++wi) {
      const Wire& w = t.wires[size_t(wi)];
      if (w.locked || w.pair >= 0 || w.net < 0 || b.flexFixed(w.net) || w.end[0] < 0 || w.end[1] < 0) continue;
      for (int end = 0; end < 2; ++end) {
        const Owner& T = t.owners[size_t(w.end[end])];
        const int ji = w.end[1 - end];
        const Owner& J = t.owners[size_t(ji)];
        if ((T.kind != Owner::Kind::Pad && T.kind != Owner::Kind::Via) || wiresAt[size_t(w.end[end])] != 1 || J.kind != Owner::Kind::Junction || wiresAt[size_t(ji)] != 3)
          continue;
        std::set<uint32_t> skip;  // the tracks of the wires of that branch point
        for (const Wire& x : t.wires)
          if (x.end[0] == ji || x.end[1] == ji) skip.insert(x.tracks.begin(), x.tracks.end());
        double near = 1e18;
        for (const Track& tr : b.tracks) {
          if (tr.net != w.net || tr.layer != w.layer || (tr.id && skip.contains(tr.id))) continue;
          const Polyline pl = tr.path();
          for (size_t k = 1; k < pl.size(); ++k) near = std::min(near, Shape::circle(T.c, 1).distanceToSegment(pl[k - 1], pl[k]));
        }
        const double len = tautLength(t, wi);
        if (near < len - std::max(0.3 * kNmPerMm, 0.05 * len)) {
          ++dReattach;
          gReattach += len - near;
          std::println(stderr, "  wire of {} from ({:.3f}, {:.3f}) to its branch point: {:.2f} mm, another wire of the net {:.2f} mm away", b.nets[size_t(w.net)].name,
                       T.c.x / 1e6, -T.c.y / 1e6, len / 1e6, near / 1e6);
        }
      }
    }
    std::println(stderr, "not done: {} pair(s) of two widths would gain {:.2f} mm; {} pair(s) at polygon pads {:.2f} mm; of the {} too close to another net {} are stopped "
                         "by its track; {} wire(s) to a branch point with another wire of the net nearer, {:.2f} mm",
                 dWidthCould, gWidth / 1e6, dPolyCould, gPoly / 1e6, dClear, dClearTrack, dReattach, gReattach / 1e6);
  }
  r::sort(splits, std::greater{}, &Split::gain);
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
    trunk.id = 0;
    trunk.mid.reset();
    trunk.a = Point(s.x.from);
    if (s.round) {
      trunk.b = Point(*s.round);
      eb.tracks.push_back(trunk);
      trunk.a = trunk.b;
    }
    trunk.b = Point(s.p);
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
    auto drawn = redrawTracks(eb, o.flips, r.drawings, {&t, &b, {}});
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
        modelOfEdited(m, one, {&t, &b, {}});
        if (r::any_of(m.violations, [](const Violation& v) { return v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad; })) {
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

BranchResult reattachBranches(Board& b, Topology& t, const BranchOptions& o) {
  ProfScope pAll("branch points: re-attached");
  BranchResult r;
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  SpatialIndex idx;
  idx.build(b);
  std::vector<int> wiresAt(t.owners.size(), 0);
  for (const Wire& w : t.wires)
    for (int end = 0; end < 2; ++end)
      if (w.end[end] >= 0) ++wiresAt[size_t(w.end[end])];
  std::vector<char> fixedNets(b.nets.size(), 0);
  for (int n = 0; n < int(b.nets.size()); ++n) fixedNets[size_t(n)] = b.flexFixed(n);
  struct Cand {
    int wire, term, junction;
    size_t track;     // the near wire's track, and the point on it nearest the pad...
    Vec2 p;
    int target = -1;  // ... or a pad or via of the net nearer than that (the wire is laid to it, no stub)
    double len, near;
  };
  std::vector<Cand> cands;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[size_t(wi)];
    if (w.locked || w.pair >= 0 || w.net < 0 || b.flexFixed(w.net) || w.end[0] < 0 || w.end[1] < 0 || w.tracks.empty()) continue;
    for (int end = 0; end < 2; ++end) {
      const int ti = w.end[end], ji = w.end[1 - end];
      const Owner& T = t.owners[size_t(ti)];
      const Owner& J = t.owners[size_t(ji)];
      if ((T.kind != Owner::Kind::Pad && T.kind != Owner::Kind::Via) || T.locked || wiresAt[size_t(ti)] != 1 || J.kind != Owner::Kind::Junction || wiresAt[size_t(ji)] != 3)
        continue;
      std::set<uint32_t> skip;  // the tracks of the wires of that branch point (its own two: the forces slide it)
      for (const Wire& x : t.wires)
        if (x.end[0] == ji || x.end[1] == ji) skip.insert(x.tracks.begin(), x.tracks.end());
      ++r.candidates;
      Cand c{.wire = wi, .term = ti, .junction = ji, .track = 0, .p = {}, .target = -1, .len = tautLength(t, wi), .near = 1e18};
      // The nearest point of the net's tracks on the layer: on a straight track anywhere, on an arc at its ends.
      for (size_t k = 0; k < b.tracks.size(); ++k) {
        const Track& tr = b.tracks[k];
        if (tr.net != w.net || tr.layer != w.layer || tr.locked || (tr.id && skip.contains(tr.id))) continue;
        const Vec2 a = tr.a.v(), d = tr.b.v() - a;
        if (d.len2() < 1) continue;
        const double f = tr.isArc() ? ((T.c - a).len() <= (T.c - tr.b.v()).len() ? 0.0 : 1.0) : std::clamp((T.c - a).dot(d) / d.len2(), 0.0, 1.0);
        const Vec2 q = a + d * f;
        const double dist = (q - T.c).len();
        if (dist < c.near) {
          c.near = dist;
          c.p = q;
          c.track = k;
        }
      }
      // A pad or a via of the net nearer than that (the near point found may be the lead inside one): the wire
      // goes to it.
      for (int oi = 0; oi < int(t.owners.size()); ++oi) {
        const Owner& Q = t.owners[size_t(oi)];
        if (oi == ti || oi == ji || Q.net != w.net || (Q.kind != Owner::Kind::Pad && Q.kind != Owner::Kind::Via) || !((Q.layers >> w.layer) & 1) || Q.locked) continue;
        const double dist = Q.shape.distance(T.c);
        if (dist < c.near || (c.target < 0 && !offOwnCopper(t, c.p, w.net, w.layer, w.width / 2.0) && Q.shape.distance(c.p) < w.width / 2.0 + kKeepOff)) {
          c.near = std::min(c.near, dist);
          c.target = oi;
        }
      }
      if (c.near < c.len - std::max(o.gain, 0.05 * c.len)) cands.push_back(c);
    }
  }
  r::sort(cands, std::greater{}, [](const Cand& c) { return c.len - c.near; });
  const DrawingScore was = scoreDrawing(b);
  int attempts = 0;
  for (const Cand& c : cands) {
    if (attempts >= 8) break;
    const Wire& A = t.wires[size_t(c.wire)];
    const Owner& T = t.owners[size_t(c.term)];
    const double width = double(A.width);
    // The stub from the near wire towards the pad: the new branch point and, at its free end, the vertex the
    // wire to the pad is laid from (two tracks meeting there are one chain when the drawing is built anew).
    const bool toOwner = c.target >= 0;
    const Vec2 dir = toOwner ? Vec2{} : (T.c - c.p).normalized();
    const double stub = toOwner ? 0.0 : std::min(std::max(width, 0.2 * kNmPerMm), (T.c - c.p).len() / 2);
    const Vec2 f = toOwner ? t.owners[size_t(c.target)].c : c.p + dir * stub;
    // The stub may stand nearer another net than the rule (a hindering wire right beside the near one is to be
    // led behind the pad), not in its copper.
    auto overlaps = [&] {
      BBox box;
      box.add(c.p);
      box.add(f);
      bool hit = false;
      idx.query(box.inflated(width / 2 + 1000), LayerMask(1) << A.layer, [&](ItemRef it) {
        if (hit || itemNet(b, it) == A.net) return;
        for (const Shape& sh : itemShapes(b, it))
          if (sh.distanceToSegment(c.p, f) < width / 2) hit = true;
      });
      return hit;
    };
    auto why = [&](const char* what) {
      if (debug)
        std::println(stderr, "branch of {} at ({:.3f}, {:.3f}), {:.2f} mm, the near wire {:.2f} mm away: {}", b.nets[size_t(A.net)].name, T.c.x / 1e6, -T.c.y / 1e6,
                     c.len / 1e6, c.near / 1e6, what);
    };
    if (!toOwner && (overlaps() || !offOwnCopper(t, f, A.net, A.layer, width / 2))) {
      why("no room for the stub");
      continue;
    }
    ++attempts;
    Board eb = b;
    if (!toOwner) {
      Track& tr = eb.tracks[c.track];
      if ((c.p - tr.a.v()).len() > 1 && (c.p - tr.b.v()).len() > 1) {
        Track second = tr;
        second.id = 0;
        second.a = Point(c.p);
        tr.b = Point(c.p);
        eb.tracks.push_back(second);
      }
      Track s = eb.tracks[c.track];
      s.id = 0;
      s.mid.reset();
      s.a = Point(c.p);
      s.b = Point(f);
      eb.tracks.push_back(s);
    }
    {
      const std::set<uint32_t> gone(A.tracks.begin(), A.tracks.end());
      std::erase_if(eb.tracks, [&](const Track& x) { return x.id && gone.contains(x.id); });
    }
    Topology::assignIds(eb);
    Topology mt;
    modelOfEdited(mt, eb, {&t, &b, {}});
    int nFlips = 0;
    std::vector<Violation> stop;
    if (!prepareModel(mt, o.flips, false, nFlips, stop)) {
      why("the model of the tracks with the stub does not stand");
      continue;
    }
    // The pad, and the stub's free end (or the pad the wire goes to) in the new model.
    int term = -1, free = -1;
    for (int oi = 0; oi < int(mt.owners.size()); ++oi) {
      const Owner& x = mt.owners[size_t(oi)];
      if (x.net != T.net) continue;
      if (x.kind == T.kind && (x.c - T.c).len() < 1000) term = oi;
      if (x.kind == (toOwner ? t.owners[size_t(c.target)].kind : Owner::Kind::Junction) && (x.c - f).len() < 1000) free = oi;
    }
    const LayerMesh* m = term >= 0 && free >= 0 ? mt.mesh(A.layer) : nullptr;
    if (!m || m->ownerVerts[size_t(term)].empty() || m->ownerVerts[size_t(free)].empty()) {
      why("the pad or the stub's end not found in the model");
      continue;
    }
    Wire n = A;
    n.end[0] = free;
    n.end[1] = term;
    auto vertexOf = [&](int owner, Vec2 from) {
      if (mt.owners[size_t(owner)].shape.kind == Shape::Kind::Polygon)
        for (int v : m->ownerVerts[size_t(owner)])
          if (m->verts[size_t(v)].t == 0 && m->verts[size_t(v)].off.len2() < 1) return v;
      return mt.nearestVertex(*m, owner, from);
    };
    n.endVertex[0] = vertexOf(free, T.c);
    n.endVertex[1] = vertexOf(term, f);
    n.hasExit[0] = n.hasExit[1] = false;
    n.cross.clear();
    n.tracks.clear();
    n.locked = false;
    n.dirty = true;
    const int ni = int(mt.wires.size());
    mt.wires.push_back(std::move(n));
    const std::vector<char> unsettled = viasTooClose(eb, mt);
    const double limit = c.len - stub - std::max(o.gain, 0.05 * c.len);
    bool ok = false;
    double others = 0;
    if (const std::optional<RelayPath> path = findRelay(mt, ni, &unsettled, nullptr, false, limit); path && path->length <= limit) {
      applyRelay(mt, ni, *path);
      ok = true;
    } else {
      std::optional<Topology> saved;
      const std::vector<int> holders = wiresRound(mt, A.layer, free, term, A.net, ni, &fixedNets);
      const std::optional<PastResult> past = relayPast(mt, ni, holders, limit, &unsettled, saved);
      ok = past && past->length + past->othersAfter <= limit + past->othersBefore;
      if (ok) others = past->othersAfter - past->othersBefore;
    }
    if (!ok) {
      why("no way from the stub to the pad short enough");
      continue;
    }
    {
      RealizeStats st;
      int nWires = 0;
      drawModel(eb, mt, true, st, nWires);
      ++r.drawings;
    }
    // (The stub and the wire laid from its end are one chain: laid again, they are one wire and the end is gone.)
    LiveModel live{&mt, &eb, {}};
    for (const Wire& w : mt.wires)
      if (!toOwner && (w.end[0] == free || w.end[1] == free)) live.touched.insert(live.touched.end(), w.tracks.begin(), w.tracks.end());
    std::optional<Redrawn> drawn = redrawTracks(eb, o.flips, r.drawings, live);
    const bool better = drawn && betterDrawing(drawn->score, was);
    r.log.push_back(std::format("branch of {} at ({:.3f}, {:.3f}) re-attached: {:.2f} mm to the branch point, the near {} {:.2f} mm away, {:.2f} mm in the model{}: {}",
                                b.nets[size_t(A.net)].name, T.c.x / 1e6, -T.c.y / 1e6, c.len / 1e6, toOwner ? "pad or via" : "wire", c.near / 1e6,
                                (stub + tautLength(mt, ni)) / 1e6,
                                others != 0 ? std::format(", others {:+.2f}", others / 1e6) : "",
                                !drawn ? "the model of the tracks does not stand"
                                       : std::format("{} conflict(s) in {} place(s), {:.3f} mm short, {:.1f} mm (was {} in {}, {:.1f}): {}", drawn->score.conflicts,
                                                     drawn->score.places, drawn->score.shortfall / 1e6, drawn->score.length / 1e6, was.conflicts, was.places,
                                                     was.length / 1e6, better ? "taken" : "no better")));
    if (debug) std::println(stderr, "{}", r.log.back());
    if (better) {
      r.gain = was.length - drawn->score.length;
      b = std::move(drawn->board);
      t = std::move(drawn->model);
      r.made = 1;
      return r;
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
  auto drawn = redrawTracks(eb, o.flips, r.drawings, {&t, &b, {}});
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
