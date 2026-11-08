#include "router/auto/AutoRouter.h"

#include <algorithm>
#include <array>
#include <bit>
#include <chrono>
#include <format>
#include <map>
#include <numeric>
#include <random>
#include <set>

#include "core/Prof.h"
#include "geom/Geometry.h"
#include "router/auto/Layering.h"
#include "router/topo/ModelRefine.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "topo/Capacity.h"
#include "topo/Relay.h"

namespace xr::autoroute {

using topo::Topology;

namespace {

// A connection to lay: two pads of a net (a branch of the net's spanning tree over its pads).
struct Job {
  int net = kNoNet;
  int padA = -1, padB = -1;
  Coord width = 0;
  double length = 0;
};

// The point a crossing stands for on the plane: its place in the order of the edge, spread evenly over the edge's
// free part (the shapes come later; here only the order and a point inside each triangle matter).
Vec2 crossingPoint(const Topology& t, const topo::LayerMesh& m, int cid) {
  const topo::Crossing& c = t.crossings[size_t(cid)];
  const topo::Edge& E = m.edges[size_t(c.edge)];
  const Vec2 U = m.verts[size_t(E.v[0])].p, V = m.verts[size_t(E.v[1])].p;
  const topo::EdgeCapacity cap = topo::edgeCapacity(t, m, c.edge);
  const int n = int(E.cross.size());
  const int k = int(r::find(E.cross, cid) - E.cross.begin());
  double f;
  if (cap.freeLen > 0 && cap.L > 0) f = (cap.reachU + cap.freeLen * double(k + 1) / double(n + 1)) / cap.L;
  else f = double(k + 1) / double(n + 1);
  return U + (V - U) * f;
}

// A wire's sketch on the plane: its start vertex, its crossings' points, its end vertex.
std::vector<Vec2> sketchOf(const Topology& t, const topo::LayerMesh& m, const topo::Wire& w) {
  std::vector<Vec2> pts{m.verts[size_t(w.endVertex[0])].p};
  for (int cid : w.cross) pts.push_back(crossingPoint(t, m, cid));
  pts.push_back(m.verts[size_t(w.endVertex[1])].p);
  return pts;
}

// A place along a sketch: chord c (from point c to point c+1) at fraction f of it.
struct Place {
  int chord = 0;
  double f = 0;
  double s() const { return chord + f; }
};
Vec2 at(const std::vector<Vec2>& pts, Place p) { return pts[size_t(p.chord)] + (pts[size_t(p.chord) + 1] - pts[size_t(p.chord)]) * p.f; }

// Halfway along the sketch between two places (by length).
Place midway(const std::vector<Vec2>& pts, Place a, Place b) {
  auto lenTo = [&](Place p) {
    double s = 0;
    for (int c = 0; c < p.chord; ++c) s += (pts[size_t(c) + 1] - pts[size_t(c)]).len();
    return s + (pts[size_t(p.chord) + 1] - pts[size_t(p.chord)]).len() * p.f;
  };
  const double target = (lenTo(a) + lenTo(b)) / 2;
  double s = 0;
  for (int c = 0; c + 1 < int(pts.size()); ++c) {
    const double l = (pts[size_t(c) + 1] - pts[size_t(c)]).len();
    if (s + l >= target || c + 2 == int(pts.size())) return {c, l > 0 ? std::clamp((target - s) / l, 0.0, 1.0) : 0.5};
    s += l;
  }
  return a;
}

// Proper crossing of segments p0-p1 and q0-q1: the fractions along each, or nothing.
std::optional<std::pair<double, double>> segCross(Vec2 p0, Vec2 p1, Vec2 q0, Vec2 q1) {
  const Vec2 r = p1 - p0, s = q1 - q0;
  const double d = r.cross(s);
  if (std::abs(d) < 1e-9) return std::nullopt;
  const double t = (q0 - p0).cross(s) / d, u = (q0 - p0).cross(r) / d;
  constexpr double eps = 1e-9;
  if (t <= eps || t >= 1 - eps || u <= eps || u >= 1 - eps) return std::nullopt;
  return std::pair{t, u};
}

}  // namespace

Result route(Board& b, const Options& o) {
  ProfScope prof("autoroute");
  const auto t0 = std::chrono::steady_clock::now();
  Result res;
  auto log = [&](std::string s) { res.log.push_back(std::move(s)); };
  auto cancelled = [&] { return o.cancel && o.cancel->load(); };

  // The layers routed: the signal layers (a plane layer carries its net as a pour).
  std::vector<LayerId> layers;
  for (LayerId l : b.copperLayers())
    if (!b.layers[size_t(l)].plane) layers.push_back(l);
  if (layers.empty()) return res;
  LayerMask routing = 0;
  for (LayerId l : layers) routing |= LayerMask(1) << l;
  auto layerIndex = [&](LayerMask m) {  // board layers -> bits of the layer indices
    uint32_t bits = 0;
    for (size_t i = 0; i < layers.size(); ++i)
      if ((m >> layers[i]) & 1) bits |= 1u << i;
    return bits;
  };

  // What is routed: the nets with «Трассировать», not flexibly fixed, named in o.nets if any; their unlocked copper goes.
  auto routed = [&](int net) {
    if (net < 0) return false;
    const Net& n = b.nets[size_t(net)];
    if (n.flexFixed || !n.route) return false;
    return o.nets.empty() || r::contains(o.nets, n.name);
  };
  std::erase_if(b.tracks, [&](const Track& t) { return !t.locked && routed(t.net); });
  std::erase_if(b.vias, [&](const Via& v) { return !v.locked && routed(v.net); });
  for (auto& z : b.zones)
    if (routed(z.net)) z.filled.clear();
  if (!b.tracks.empty()) log(std::format("{} track(s) kept on the board (locked or not routed): the plane does not see them yet", b.tracks.size()));

  // 1. The combined plane and the connections, the wide ones first and the short among them.
  Topology plane;
  plane.buildPlane(b, layers.front(), routing);
  topo::LayerMesh& m = plane.layers.front();
  std::vector<Job> jobs;
  {
    std::map<int, std::vector<int>> pads;
    for (int pi = 0; pi < int(b.pads.size()); ++pi) {
      const Pad& p = b.pads[size_t(pi)];
      const int ow = plane.padOwner[size_t(pi)];
      if (!routed(p.net) || ow < 0 || m.ownerVerts[size_t(ow)].empty()) continue;
      pads[p.net].push_back(pi);
    }
    for (auto& [net, ps] : pads) {
      // Prim's tree over the pads' centres.
      std::vector<char> in(ps.size(), 0);
      std::vector<double> best(ps.size(), 1e300);
      std::vector<int> from(ps.size(), -1);
      best[0] = 0;
      for (size_t it = 0; it < ps.size(); ++it) {
        size_t k = 0;
        double bd = 1e301;
        for (size_t q = 0; q < ps.size(); ++q)
          if (!in[q] && best[q] < bd) bd = best[q], k = q;
        in[k] = 1;
        if (from[k] >= 0) {
          Job j{net, ps[size_t(from[k])], ps[k], 0, bd};
          for (LayerId l : layers) j.width = std::max(j.width, b.trackWidth(net, l));
          jobs.push_back(j);
        }
        for (size_t q = 0; q < ps.size(); ++q)
          if (!in[q])
            if (double d = (b.pads[size_t(ps[k])].pos.v() - b.pads[size_t(ps[q])].pos.v()).len(); d < best[q]) best[q] = d, from[q] = int(k);
      }
    }
  }
  r::sort(jobs, [](const Job& a, const Job& c) { return a.width != c.width ? a.width > c.width : a.length < c.length; });
  res.connections = int(jobs.size());
  log(std::format("plane: {} vertices, {} triangles; {} layers; {} connections", m.verts.size(), m.tris.size(), layers.size(), jobs.size()));

  const topo::RelayMode mode{o.crossing * kNmPerMm, int(layers.size())};
  std::vector<int> wireOfJob(jobs.size(), -1);
  for (size_t ji = 0; ji < jobs.size() && !cancelled(); ++ji) {
    const Job& j = jobs[ji];
    topo::Wire w;
    w.net = j.net;
    w.layer = m.layer;
    w.width = j.width;
    w.widthMin = j.width;
    for (LayerId l : layers) {
      w.widthMin = std::min(w.widthMin, b.minTrackWidth(j.net, l));
      w.clr = std::max(w.clr, b.clearance(j.net, l));
    }
    w.end[0] = plane.padOwner[size_t(j.padA)];
    w.end[1] = plane.padOwner[size_t(j.padB)];
    w.endVertex[0] = plane.nearestVertex(m, w.end[0], b.pads[size_t(j.padB)].pos.v());
    w.endVertex[1] = plane.nearestVertex(m, w.end[1], b.pads[size_t(j.padA)].pos.v());
    plane.wires.push_back(w);
    const int wi = int(plane.wires.size()) - 1;
    if (auto p = topo::findRelay(plane, wi, nullptr, nullptr, false, mode)) {
      topo::applyRelay(plane, wi, *p);
      wireOfJob[ji] = wi;
      ++res.routed;
    } else {
      plane.wires.pop_back();
      ++res.failed;
    }
    if (o.progress && ji % 16 == 0) o.progress(int(ji), int(jobs.size()), "plane");
  }
  // Re-laying (TopoR's «перекладка»): each wire taken out and laid again by the cheapest path among all the others,
  // in a shuffled order each pass. Its own path is still there for it, so its cost never grows.
  {
    std::mt19937 rng(1);
    std::vector<int> order(plane.wires.size());
    for (int pass = 0; pass < o.passes && !cancelled(); ++pass) {
      std::iota(order.begin(), order.end(), 0);
      std::shuffle(order.begin(), order.end(), rng);
      int moved = 0;
      for (int wi : order) {
        const std::vector<int> was = plane.wires[size_t(wi)].cross;
        std::vector<int> wasEdges;
        for (int cid : was) wasEdges.push_back(plane.crossings[size_t(cid)].edge);
        const Topology keep = plane;
        topo::takeOut(plane, wi);
        if (auto p = topo::findRelay(plane, wi, nullptr, nullptr, false, mode)) {
          topo::applyRelay(plane, wi, *p);
          std::vector<int> nowEdges;
          for (int cid : plane.wires[size_t(wi)].cross) nowEdges.push_back(plane.crossings[size_t(cid)].edge);
          moved += nowEdges != wasEdges;
        } else {
          plane = keep;  // (cannot happen: its old path was free)
        }
      }
      log(std::format("re-lay pass {}: {} wire(s) took another path", pass + 1, moved));
      if (moved == 0) break;
    }
  }
  for (int wi = 0; wi < int(plane.wires.size()); ++wi) res.planeLength += topo::tautLength(plane, wi);
  if (cancelled()) {
    res.cancelled = true;
    return res;
  }

  // 2. The crossings of wires of different nets on the plane, each wire's in order along it.
  const int nw = int(plane.wires.size());
  const size_t NW = plane.wires.size();
  std::vector<std::vector<Vec2>> sk(NW);
  for (int wi = 0; wi < nw; ++wi) sk[size_t(wi)] = sketchOf(plane, m, plane.wires[size_t(wi)]);
  struct Event {
    Place at;
    int pair;  // the crossing's index
  };
  std::vector<std::vector<Event>> events(NW);
  int pairs = 0;
  {
    // The chords by the triangle they lie in: one wire's chord c is between its crossings c-1 and c (the ends:
    // its vertices), in the triangle both touch.
    std::vector<std::vector<std::pair<int, int>>> inTri(m.tris.size());  // (wire, chord)
    auto triOfChord = [&](const topo::Wire& w, int c) {
      const int n = int(w.cross.size());
      auto edgeOf = [&](int k) { return plane.crossings[size_t(w.cross[size_t(k)])].edge; };
      if (n == 0) return -1;
      const int e = c < n ? edgeOf(c) : edgeOf(n - 1);
      const topo::Edge& E = m.edges[size_t(e)];
      for (int tri : E.t) {
        if (tri < 0) continue;
        if (c == 0 && m.localVertex(tri, w.endVertex[0]) >= 0) return tri;
        if (c == n && m.localVertex(tri, w.endVertex[1]) >= 0) return tri;
        if (c > 0 && c < n && m.localEdge(tri, edgeOf(c - 1)) >= 0) return tri;
      }
      return -1;
    };
    for (int wi = 0; wi < nw; ++wi) {
      const topo::Wire& w = plane.wires[size_t(wi)];
      for (int c = 0; c <= int(w.cross.size()); ++c)
        if (int tri = triOfChord(w, c); tri >= 0) inTri[size_t(tri)].push_back({wi, c});
    }
    for (const auto& list : inTri)
      for (size_t i = 0; i < list.size(); ++i)
        for (size_t k = i + 1; k < list.size(); ++k) {
          auto [wa, ca] = list[i];
          auto [wb, cb] = list[k];
          if (plane.wires[size_t(wa)].net == plane.wires[size_t(wb)].net) continue;
          const auto& A = sk[size_t(wa)];
          const auto& B = sk[size_t(wb)];
          if (auto x = segCross(A[size_t(ca)], A[size_t(ca) + 1], B[size_t(cb)], B[size_t(cb) + 1])) {
            events[size_t(wa)].push_back({{ca, x->first}, pairs});
            events[size_t(wb)].push_back({{cb, x->second}, pairs});
            ++pairs;
          }
        }
    // A wire along an edge (between two vertices, no crossings) is crossed by every other net's wire across that edge.
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const topo::Edge& E = m.edges[size_t(e)];
      if (E.along < 0 || E.along >= nw) continue;
      const topo::Wire& x = plane.wires[size_t(E.along)];
      for (int cid : E.cross) {
        const topo::Crossing& c = plane.crossings[size_t(cid)];
        if (c.wire < 0 || plane.wires[size_t(c.wire)].net == x.net) continue;
        const Vec2 p = crossingPoint(plane, m, cid);
        const Vec2 a = sk[size_t(E.along)][0], z = sk[size_t(E.along)][1];
        const double f = (z - a).len2() > 0 ? std::clamp((p - a).dot(z - a) / (z - a).len2(), 0.0, 1.0) : 0.5;
        events[size_t(E.along)].push_back({{0, f}, pairs});
        events[size_t(c.wire)].push_back({{c.idx + 1, 0.0}, pairs});  // at its crossing of the edge: the start of chord idx+1
        ++pairs;
      }
    }
    for (auto& ev : events) r::sort(ev, {}, [](const Event& e) { return e.at.s(); });
  }
  res.crossings = pairs;
  log(std::format("plane: {} routed, {} failed, {} crossings, taut length {:.1f} mm", res.routed, res.failed, pairs, res.planeLength / 1e6));
  if (o.sketch) {
    Options::Sketch s;
    s.lines = sk;
    s.layer.assign(sk.size(), -1);
    o.sketch(s);
  }

  // 3. Layering: a point per event (a wire with none has one, for its ends).
  LayerProblem lp;
  lp.layers = int(layers.size());
  std::vector<std::vector<int>> vars(NW);
  std::vector<std::array<int, 2>> pairVars(size_t(pairs), {-1, -1});
  for (int wi = 0; wi < nw; ++wi) {
    const topo::Wire& w = plane.wires[size_t(wi)];
    const int count = std::max<int>(1, int(events[size_t(wi)].size()));
    const uint32_t allowed = [&] {
      LayerMask a = b.assignedLayers(w.net);
      return a ? layerIndex(a) : 0u;
    }();
    for (int k = 0; k < count; ++k) {
      vars[size_t(wi)].push_back(lp.vars++);
      lp.allowed.push_back(allowed);
      if (k > 0) lp.same.push_back({lp.vars - 2, lp.vars - 1});
    }
    for (size_t k = 0; k < events[size_t(wi)].size(); ++k) {
      auto& pv = pairVars[size_t(events[size_t(wi)][k].pair)];
      (pv[0] < 0 ? pv[0] : pv[1]) = vars[size_t(wi)][k];
    }
    for (int end = 0; end < 2; ++end) {
      const int pad = plane.owners[size_t(w.end[end])].pad;
      const uint32_t padLayers = pad >= 0 ? layerIndex(b.pads[size_t(pad)].copper) : 0u;
      lp.ends.push_back({end == 0 ? vars[size_t(wi)].front() : vars[size_t(wi)].back(), padLayers});
    }
  }
  for (auto& pv : pairVars)
    if (pv[0] >= 0 && pv[1] >= 0) lp.differ.push_back({pv[0], pv[1]});
  const Layering lay = solveLayers(lp, 24, 1);
  res.conflicts = lay.conflicts;
  log(std::format("layering: {} points, {} crossings, {} vias, {} conflicts", lp.vars, lp.differ.size(), lay.vias, lay.conflicts));

  // 4. The tracks along the sketches, a via where the layer changes.
  NetClass dflt = b.netClasses[0];
  std::vector<std::vector<Vec2>> drawnLines;
  std::vector<LayerId> drawnLayers;
  std::vector<Vec2> viaPoints;
  constexpr Coord kViaPoint = 2000;  // 2 um
  const size_t vias0 = b.vias.size();
  std::vector<std::pair<Coord, Coord>> realVia;  // per new via: its diameter and drill
  for (int wi = 0; wi < nw; ++wi) {
    const topo::Wire& w = plane.wires[size_t(wi)];
    const auto& pts = sk[size_t(wi)];
    const auto& ev = events[size_t(wi)];
    const int last = int(pts.size()) - 2;
    // The layers along the wire and the places where they change.
    std::vector<int> lay1;
    for (int v : vars[size_t(wi)]) lay1.push_back(lay.layer[size_t(v)]);
    std::vector<Place> marks;  // the event places (or the middle of the wire, for one without events)
    if (ev.empty()) marks.push_back(midway(pts, {0, 0}, {last, 1}));
    else
      for (const Event& e : ev) marks.push_back(e.at);
    struct Cut {
      Place at;
      int layer;  // the layer after it
    };
    std::vector<Cut> cuts;
    auto padLayer = [&](int end, int want) {
      const int pad = plane.owners[size_t(w.end[end])].pad;
      const uint32_t pl = pad >= 0 ? layerIndex(b.pads[size_t(pad)].copper) : 0u;
      if (!pl || ((pl >> want) & 1)) return want;
      return std::countr_zero(pl);
    };
    int startLayer = padLayer(0, lay1.front());
    if (startLayer != lay1.front()) cuts.push_back({midway(pts, {0, 0}, marks.front()), lay1.front()});
    for (size_t k = 1; k < lay1.size(); ++k)
      if (lay1[k] != lay1[k - 1]) cuts.push_back({midway(pts, marks[k - 1], marks[k]), lay1[k]});
    if (int endLayer = padLayer(1, lay1.back()); endLayer != lay1.back()) cuts.push_back({midway(pts, marks.back(), {last, 1}), endLayer});
    // Walk the sketch, cutting it at the vias.
    int cur = startLayer;
    std::vector<Vec2> run{pts.front()};
    auto flush = [&](int layerIdx) {
      const LayerId l = layers[size_t(layerIdx)];
      for (size_t i = 1; i < run.size(); ++i) {
        if ((run[i] - run[i - 1]).len2() < 1) continue;
        Track t;
        t.a = Point(run[i - 1]);
        t.b = Point(run[i]);
        t.width = b.trackWidth(w.net, l);
        t.layer = l;
        t.net = w.net;
        b.tracks.push_back(t);
      }
      drawnLines.push_back(run);
      drawnLayers.push_back(l);
    };
    size_t ci = 0;
    for (int c = 0; c <= last; ++c) {
      while (ci < cuts.size() && cuts[ci].at.chord == c) {
        const Vec2 p = at(pts, cuts[ci].at);
        run.push_back(p);
        flush(cur);
        Via v;
        v.pos = Point(p);
        const NetClass& nc = w.net >= 0 ? b.classOf(w.net) : dflt;
        // A point for now: the model is built from the sketches, which pass the via on their side of it but
        // may pass close; its real size comes back once the model knows the sides.
        v.diameter = kViaPoint;
        v.drill = kViaPoint / 2;
        realVia.push_back({nc.viaDiameter, nc.viaDrill});
        v.layers = b.allCopperMask();
        v.net = w.net;
        b.vias.push_back(v);
        viaPoints.push_back(p);
        cur = cuts[ci].layer;
        run = {p};
        ++ci;
      }
      run.push_back(pts[size_t(c) + 1]);
    }
    flush(cur);
  }
  res.vias = int(viaPoints.size());
  if (o.sketch) o.sketch({drawnLines, drawnLayers, viaPoints});
  log(std::format("tracks: {} along the sketches, {} vias", b.tracks.size(), res.vias));

  // 5. The metric stage: the model from the tracks, F5, F6, F7.
  if (o.metric && !cancelled()) {
    Topology::assignIds(b);
    Topology t;
    t.build(b);
    // The vias their real size: on the board and in the model, the edges' capacities with them.
    for (size_t k = 0; k < realVia.size(); ++k) {
      Via& v = b.vias[vias0 + k];
      v.diameter = realVia[k].first;
      v.drill = realVia[k].second;
      if (const int ow = t.viaOwner[vias0 + k]; ow >= 0) {
        t.owners[size_t(ow)].halfWidth = v.diameter / 2.0;
        t.owners[size_t(ow)].shape = Shape::circle(v.pos.v(), v.diameter / 2.0);
      }
    }
    for (topo::LayerMesh& lm : t.layers)
      for (int e = 0; e < int(lm.edges.size()); ++e) topo::refreshEdge(t, lm, e);
    // The plane is one mesh for all the layers: a wire may find no room on its layer's own mesh where the plane
    // had a pad of the other side between two of this one's (through copper), or cross another there. Such wires
    // are laid again on their layer (with room, else squeezed); one that finds no way stays as drawn, locked (an
    // unrouted connection: F5 goes on).
    {
      using K = topo::Violation::Kind;
      std::set<int> redo;
      for (const topo::Violation& v : t.violations)
        if ((v.kind == K::ThroughPad || v.kind == K::Crossing) && v.wireA >= 0) redo.insert(v.wireA);
      for (const topo::LayerMesh& lm : t.layers)
        for (const topo::Violation& v : t.findCrossings(lm))
          if (v.wireA >= 0) redo.insert(v.wireA);
      std::vector<int> order(redo.begin(), redo.end());
      r::stable_sort(order, std::greater{}, [&](int wi) { return t.wires[size_t(wi)].width; });
      int relaid = 0, stuck = 0;
      for (int wi : order) {
        t.wires[size_t(wi)].locked = false;
        topo::takeOut(t, wi);
        auto p = topo::findRelay(t, wi);
        if (!p) p = topo::findRelay(t, wi, nullptr, nullptr, true);
        if (p) {
          topo::applyRelay(t, wi, *p);
          ++relaid;
        } else {
          t.wires[size_t(wi)].locked = true;
          ++stuck;
        }
      }
      for (topo::Violation& v : t.violations)
        if (v.kind == K::ThroughPad || v.kind == K::Crossing) v.kind = K::Blocked;
      if (!order.empty()) log(std::format("model: {} wire(s) laid again on their layer, {} found no way", relaid, stuck));
    }
    if (t.untangled) log(std::format("model: {} double crossing(s) taken apart", t.untangled));
    if (o.progress) o.progress(0, 3, "F5");
    auto f5 = topo::runF5Model(b, t, {});
    log(std::format("F5: {}", f5.drawn ? "drawn" : "stopped by the model's violations"));
    if (!f5.drawn)
      for (const DrcViolation& d : topo::topologyViolations(b, t, f5.violations) | v::take(8))
        log(std::format("  {} at ({:.3f}, {:.3f}) on {}", d.message, d.pos.x / 1e6, d.pos.y / 1e6, b.layers[size_t(d.layer)].name));
    if (f5.drawn && !cancelled()) {
      if (o.progress) o.progress(1, 3, "F6");
      auto f6 = topo::refineModel(b, t, {});
      log(std::format("F6: {} re-laid, {} via(s) removed; conflicts {} -> {}", f6.relaid, f6.viasRemoved, f6.conflictsBefore, f6.conflictsAfter));
      if (!cancelled()) {
        if (o.progress) o.progress(2, 3, "F7");
        auto f7 = topo::optimizeModel(b, t, {});
        log(std::format("F7: {} via move(s); conflicts {} -> {}", f7.viaMoves, f7.conflictsBefore, f7.conflictsAfter));
      }
    }
  }
  res.vias = int(b.vias.size());
  res.length = b.tracksLength();
  res.cancelled = cancelled();
  res.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  return res;
}

}  // namespace xr::autoroute
