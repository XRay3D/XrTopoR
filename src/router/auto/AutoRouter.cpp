#include "router/auto/AutoRouter.h"

#include <algorithm>
#include <array>
#include <atomic>
#include <bit>
#include <chrono>
#include <cstdlib>
#include <format>
#include <map>
#include <numeric>
#include <random>
#include <set>

#include "core/Parallel.h"
#include "core/Prof.h"
#include "geom/Geometry.h"
#include "router/auto/Layered.h"
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

// What every variant shares: the layers, the plane before any wire, the connections.
struct Context {
  Board& b;
  const Options& o;
  std::vector<LayerId> layers;
  LayerMask routing = 0;
  Topology base;
  std::vector<Job> jobs;
  bool cancelled() const { return o.cancel && o.cancel->load(); }
  uint32_t layerIndex(LayerMask m) const {  // board layers -> bits of the layer indices
    uint32_t bits = 0;
    for (size_t i = 0; i < layers.size(); ++i)
      if ((m >> layers[i]) & 1) bits |= 1u << i;
    return bits;
  }
  uint32_t padLayers(const Topology& t, const topo::Wire& w, int end) const {
    const int pad = t.owners[size_t(w.end[end])].pad;
    return pad >= 0 ? layerIndex(b.pads[size_t(pad)].copper) : 0u;
  }
};

// A variant: the plane laid with one pair of prices and one order, layered and laid again with the layers.
struct Variant {
  double crossing = 0, via = 0;  // the prices, nm
  unsigned seed = 0;
  Topology plane;
  std::vector<std::vector<int>> chordLayer;  // per wire, per chord
  int routed = 0, failed = 0, crossings = 0, conflicts = 0;
  int vias = 0;           // changes of layer along the wires and at their pads
  int over = 0;           // edge-layers whose wires do not fit
  double deficit = 0;     // ... by how much, nm
  double length = 0;      // the wires' taut length on the plane, nm
  std::vector<std::string> log;
};

// A wire's crossings as steps to lay it again where it was (applyRelay), taken before it is taken out: a wire
// crosses an edge once, so its place in the edge's list without it is its index there.
topo::RelayPath stepsOf(const Topology& t, int wi) {
  topo::RelayPath p;
  const topo::Wire& w = t.wires[size_t(wi)];
  const topo::LayerMesh& m = *t.mesh(w.layer);
  for (int cid : w.cross) {
    const int e = t.crossings[size_t(cid)].edge;
    const auto& list = m.edges[size_t(e)].cross;
    p.steps.push_back({e, int(r::find(list, cid) - list.begin())});
  }
  for (int e = 0; e < int(m.edges.size()); ++e)
    if (m.edges[size_t(e)].along == wi) p.along = true, p.alongEdge = e;
  return p;
}

// Takes a wire's every crossing out (its own pad's sides too: the searches start at the vertices).
void takeAllOut(Topology& t, int wi) {
  topo::RelayPath all;
  all.first = 0;
  all.last = int(t.wires[size_t(wi)].cross.size());
  topo::applyRelay(t, wi, all);
}

Variant makeVariant(const Context& cx, double crossing, double via, unsigned seed) {
  const Board& b = cx.b;
  const Options& o = cx.o;
  Variant V;
  V.crossing = crossing;
  V.via = via;
  V.seed = seed;
  V.plane = cx.base;
  Topology& plane = V.plane;
  topo::LayerMesh& m = plane.layers.front();
  auto log = [&](std::string s) { V.log.push_back(std::move(s)); };
  std::mt19937 rng(seed * 7919u + 1);

  // 1. The connections on the plane: the wide first, the short among them (the lengths jittered by the seed).
  std::vector<Job> jobs = cx.jobs;
  if (seed > 0) {
    std::uniform_real_distribution<double> jitter(0.8, 1.25);
    for (Job& j : jobs) j.length *= jitter(rng);
    r::sort(jobs, [](const Job& a, const Job& c) { return a.width != c.width ? a.width > c.width : a.length < c.length; });
  }
  const topo::RelayMode mode{crossing, int(cx.layers.size()), cx.routing};
  for (const Job& j : jobs) {
    if (cx.cancelled()) break;
    topo::Wire w;
    w.net = j.net;
    w.layer = m.layer;
    w.width = j.width;
    w.widthMin = j.width;
    for (LayerId l : cx.layers) {
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
      ++V.routed;
    } else {
      plane.wires.pop_back();
      ++V.failed;
      if (seed == 0 && V.failed <= 8) {
        const Pad &pa = b.pads[size_t(j.padA)], &pb = b.pads[size_t(j.padB)];
        auto ref = [&](const Pad& p) { return p.component >= 0 ? b.components[size_t(p.component)].ref + "-" + p.number : p.number; };
        log(std::format("no way on the plane: {} {} -> {}", b.nets[size_t(j.net)].name, ref(pa), ref(pb)));
      }
    }
  }
  // Re-laying («перекладка»): each wire taken out and laid again among all the others, in a shuffled order.
  const size_t NW = plane.wires.size();
  const int nw = int(NW);
  std::vector<int> order(NW);
  for (int pass = 0; pass < o.passes && !cx.cancelled(); ++pass) {
    std::iota(order.begin(), order.end(), 0);
    std::shuffle(order.begin(), order.end(), rng);
    int moved = 0;
    for (int wi : order) {
      const topo::RelayPath was = stepsOf(plane, wi);
      takeAllOut(plane, wi);
      auto p = topo::findRelay(plane, wi, nullptr, nullptr, false, mode);
      topo::applyRelay(plane, wi, p ? *p : was);
      if (p) {
        std::vector<int> a, c;
        for (auto& st : was.steps) a.push_back(st.edge);
        for (auto& st : p->steps) c.push_back(st.edge);
        moved += a != c;
      }
    }
    if (moved == 0) break;
  }

  // 2. + 3. The crossings of wires of different nets (each wire's in order along it) and their layering: the chords'
  // layers. `warm`: from the chords' layers as they are (a re-layering of the whole board, Polubasov's «туннельный
  // прыжок»), else from random starts. Returns the layering's vias.
  auto layerAll = [&](bool warm, std::vector<std::vector<int>>& outLayers) {
  std::vector<std::vector<Vec2>> sk(NW);
  for (int wi = 0; wi < nw; ++wi) sk[size_t(wi)] = sketchOf(plane, m, plane.wires[size_t(wi)]);
  struct Event {
    Place at;
    int pair;
  };
  std::vector<std::vector<Event>> events(NW);
  int pairs = 0;
  {
    std::vector<std::vector<std::pair<int, int>>> inTri(m.tris.size());  // (wire, chord)
    auto triOfChord = [&](const topo::Wire& w, int c) {
      const int n = int(w.cross.size());
      auto edgeOf = [&](int k) { return plane.crossings[size_t(w.cross[size_t(k)])].edge; };
      if (n == 0) return -1;
      const topo::Edge& E = m.edges[size_t(c < n ? edgeOf(c) : edgeOf(n - 1))];
      for (int tri : E.t) {
        if (tri < 0) continue;
        if (c == 0 && m.localVertex(tri, w.endVertex[0]) >= 0) return tri;
        if (c == n && m.localVertex(tri, w.endVertex[1]) >= 0) return tri;
        if (c > 0 && c < n && m.localEdge(tri, edgeOf(c - 1)) >= 0) return tri;
      }
      return -1;
    };
    for (int wi = 0; wi < nw; ++wi)
      for (int c = 0; c <= int(plane.wires[size_t(wi)].cross.size()); ++c)
        if (int tri = triOfChord(plane.wires[size_t(wi)], c); tri >= 0) inTri[size_t(tri)].push_back({wi, c});
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
    for (int e = 0; e < int(m.edges.size()); ++e) {  // a wire along an edge is crossed by every other net's across it
      const topo::Edge& E = m.edges[size_t(e)];
      if (E.along < 0 || E.along >= nw) continue;
      for (int cid : E.cross) {
        const topo::Crossing& c = plane.crossings[size_t(cid)];
        if (c.wire < 0 || plane.wires[size_t(c.wire)].net == plane.wires[size_t(E.along)].net) continue;
        const Vec2 p = crossingPoint(plane, m, cid), a = sk[size_t(E.along)][0], z = sk[size_t(E.along)][1];
        const double f = (z - a).len2() > 0 ? std::clamp((p - a).dot(z - a) / (z - a).len2(), 0.0, 1.0) : 0.5;
        events[size_t(E.along)].push_back({{0, f}, pairs});
        events[size_t(c.wire)].push_back({{c.idx + 1, 0.0}, pairs});
        ++pairs;
      }
    }
    for (auto& ev : events) r::sort(ev, {}, [](const Event& e) { return e.at.s(); });
  }
  V.crossings = pairs;

  // 3. Layering: a point per event (a wire with none has one, for its ends).
  LayerProblem lp;
  lp.layers = int(cx.layers.size());
  std::vector<std::vector<int>> vars(NW);
  std::vector<std::array<int, 2>> pairVars(size_t(pairs), {-1, -1});
  for (int wi = 0; wi < nw; ++wi) {
    const topo::Wire& w = plane.wires[size_t(wi)];
    const int count = std::max<int>(1, int(events[size_t(wi)].size()));
    const LayerMask assigned = b.assignedLayers(w.net);
    for (int k = 0; k < count; ++k) {
      vars[size_t(wi)].push_back(lp.vars++);
      lp.allowed.push_back(assigned ? cx.layerIndex(assigned) : 0u);
      if (k > 0) lp.same.push_back({lp.vars - 2, lp.vars - 1});
    }
    for (size_t k = 0; k < events[size_t(wi)].size(); ++k) {
      auto& pv = pairVars[size_t(events[size_t(wi)][k].pair)];
      (pv[0] < 0 ? pv[0] : pv[1]) = vars[size_t(wi)][k];
    }
    for (int end = 0; end < 2; ++end) lp.ends.push_back({end == 0 ? vars[size_t(wi)].front() : vars[size_t(wi)].back(), cx.padLayers(plane, w, end)});
  }
  for (auto& pv : pairVars)
    if (pv[0] >= 0 && pv[1] >= 0) lp.differ.push_back({pv[0], pv[1]});
  if (warm) {
    lp.start.assign(size_t(lp.vars), 0);
    for (int wi = 0; wi < nw; ++wi) {
      const auto& ev = events[size_t(wi)];
      const auto& cl = V.chordLayer[size_t(wi)];
      for (size_t k = 0; k < vars[size_t(wi)].size(); ++k)
        lp.start[size_t(vars[size_t(wi)][k])] = k < ev.size() ? cl[size_t(ev[k].at.chord)] : cl.front();
    }
  }
  const Layering lay = solveLayers(lp, warm ? 8 : 24, seed + 1 + (warm ? 1000 : 0));
  V.conflicts = lay.conflicts;
  if (!warm) log(std::format("plane: {} routed, {} failed, {} crossings; layering {} vias, {} conflicts", V.routed, V.failed, pairs, lay.vias, lay.conflicts));
  // The layer of every chord (chord k: from crossing k-1 to crossing k): its first event's, else the next event's.
  outLayers.assign(NW, {});
  for (int wi = 0; wi < nw; ++wi) {
    const int chordsN = int(plane.wires[size_t(wi)].cross.size()) + 1;
    const auto& ev = events[size_t(wi)];
    auto& cl = outLayers[size_t(wi)];
    cl.assign(size_t(chordsN), 0);
    size_t k = 0;
    for (int c = 0; c < chordsN; ++c) {
      while (k < ev.size() && ev[k].at.chord < c) ++k;
      cl[size_t(c)] = lay.layer[size_t(vars[size_t(wi)][std::min(k, vars[size_t(wi)].size() - 1)])];
    }
  }
    return lay.vias;
  };
  layerAll(false, V.chordLayer);

  // 3a. Re-laying with the layers known: crossings on other layers only, a change of layer at an edge where the
  // via fits, at its price; room on each layer.
  LayeredCosts lc{int(cx.layers.size()), cx.layers, via};
  lc.viaOf = [&](int net) { return double(b.classOf(net).viaDiameter); };
  auto layeredPasses = [&] {
  for (int pass = 0; pass < o.layeredPasses && !cx.cancelled(); ++pass) {
    std::iota(order.begin(), order.end(), 0);
    std::shuffle(order.begin(), order.end(), rng);
    int moved = 0, none = 0;
    for (int wi : order) {
      const std::vector<int> keepLayers = V.chordLayer[size_t(wi)];
      const topo::RelayPath was = stepsOf(plane, wi);
      takeAllOut(plane, wi);
      lc.viaDiameter = double(b.classOf(plane.wires[size_t(wi)].net).viaDiameter);
      const topo::Wire& w = plane.wires[size_t(wi)];
      auto p = findLayeredPath(plane, wi, V.chordLayer, lc, cx.padLayers(plane, w, 0), cx.padLayers(plane, w, 1));
      if (!p) {
        topo::applyRelay(plane, wi, was);
        ++none;
        continue;
      }
      topo::applyRelay(plane, wi, p->path);
      V.chordLayer[size_t(wi)] = p->chordLayer;
      std::vector<int> a, c;
      for (auto& st : was.steps) a.push_back(st.edge);
      for (auto& st : p->path.steps) c.push_back(st.edge);
      moved += a != c || p->chordLayer != keepLayers;
    }
    if (moved == 0) break;
  }
  };
  layeredPasses();
  // The vias of the chords' layers (changes along the wires, ends off their pads' layers).
  auto viasOf = [&](const std::vector<std::vector<int>>& layers) {
    int n = 0;
    for (int wi = 0; wi < nw; ++wi) {
      const auto& cl = layers[size_t(wi)];
      for (size_t k = 1; k < cl.size(); ++k) n += cl[k] != cl[k - 1];
      for (int end = 0; end < 2; ++end) {
        const uint32_t pl = cx.padLayers(plane, plane.wires[size_t(wi)], end);
        n += pl && !((pl >> (end == 0 ? cl.front() : cl.back())) & 1);
      }
    }
    return n;
  };
  // Re-layering the whole board from the layers as they are, then laying again with them: kept while the vias fall.
  for (int round = 0; round < o.relayerings && !cx.cancelled(); ++round) {
    const int before = viasOf(V.chordLayer);
    const Topology keepPlane = plane;
    const auto keepLayers = V.chordLayer;
    std::vector<std::vector<int>> fresh;
    layerAll(true, fresh);
    V.chordLayer = std::move(fresh);
    layeredPasses();
    const int after = viasOf(V.chordLayer);
    if (after >= before) {
      plane = keepPlane;
      V.chordLayer = keepLayers;
      break;
    }
    log(std::format("re-layering {}: vias {} -> {}", round + 1, before, after));
  }

  // Vias kept apart: the pairs of vias (at their crossings' points) nearer than their radii and the clearance; the
  // wires of one of each pair laid again by the layered search, which keeps a new via off the others. A few rounds.
  for (int round = 0; round < 4 && !cx.cancelled(); ++round) {
    struct At {
      Vec2 p;
      double r;
      int wire;
    };
    std::vector<At> vias;
    for (int wi = 0; wi < nw; ++wi) {
      const topo::Wire& w = plane.wires[size_t(wi)];
      const auto& cl = V.chordLayer[size_t(wi)];
      for (size_t k = 1; k < cl.size(); ++k)
        if (cl[k] != cl[k - 1]) vias.push_back({crossingPoint(plane, m, w.cross[k - 1]), b.classOf(w.net).viaDiameter / 2.0, wi});
    }
    std::set<int> redo;
    for (size_t i = 0; i < vias.size(); ++i)
      for (size_t k = i + 1; k < vias.size(); ++k)
        if ((vias[i].p - vias[k].p).len() < vias[i].r + vias[k].r + double(plane.wires[size_t(vias[i].wire)].clr))
          redo.insert(std::max(vias[i].wire, vias[k].wire));
    if (redo.empty()) break;
    int moved = 0;
    for (int wi : redo) {
      const topo::RelayPath was = stepsOf(plane, wi);
      takeAllOut(plane, wi);
      lc.viaDiameter = double(b.classOf(plane.wires[size_t(wi)].net).viaDiameter);
      const topo::Wire& w = plane.wires[size_t(wi)];
      if (auto p = findLayeredPath(plane, wi, V.chordLayer, lc, cx.padLayers(plane, w, 0), cx.padLayers(plane, w, 1))) {
        topo::applyRelay(plane, wi, p->path);
        V.chordLayer[size_t(wi)] = p->chordLayer;
        ++moved;
      } else {
        topo::applyRelay(plane, wi, was);
      }
    }
    log(std::format("vias apart {}: {} wire(s) with a via too near another, {} laid again", round + 1, redo.size(), moved));
    if (moved == 0) break;
  }

  // The measures of the variant: the taut length, the vias, the edge-layers over.
  for (int wi = 0; wi < nw; ++wi) {
    V.length += topo::tautLength(plane, wi);
    const auto& cl = V.chordLayer[size_t(wi)];
    for (size_t k = 1; k < cl.size(); ++k) V.vias += cl[k] != cl[k - 1];
    for (int end = 0; end < 2; ++end) {
      const uint32_t pl = cx.padLayers(plane, plane.wires[size_t(wi)], end);
      V.vias += pl && !((pl >> (end == 0 ? cl.front() : cl.back())) & 1);
    }
  }
  for (int e = 0; e < int(m.edges.size()); ++e) {
    const topo::Edge& E = m.edges[size_t(e)];
    // (A side of a pad, crossed by its own wires on their way out: no room by rule, no overflow.)
    if (E.cross.empty() || m.verts[size_t(E.v[0])].owner == m.verts[size_t(E.v[1])].owner) continue;
    for (int l = 0; l < int(cx.layers.size()); ++l) {
      std::vector<int> ws;
      for (int cid : E.cross) {
        const topo::Crossing& x = plane.crossings[size_t(cid)];
        const auto& cl = V.chordLayer[size_t(x.wire)];
        if (cl[size_t(x.idx)] == l || cl[size_t(x.idx) + 1] == l) ws.push_back(x.wire);
      }
      if (ws.empty()) continue;
      const topo::EdgeCapacity cap = topo::capacityOf(plane, m, E.v[0], E.v[1], ws, -1, LayerMask(1) << cx.layers[size_t(l)]);
      if (cap.deficit > 0 || cap.cls >= 3) ++V.over, V.deficit += cap.deficit;
    }
  }
  log(std::format("variant cross {:.1f} via {:.1f} seed {}: {:.1f} mm, {} vias, {} edge-layers over", crossing / 1e6, via / 1e6, seed,
                  V.length / 1e6, V.vias, V.over));
  return V;
}

// The variant as tracks along its sketches with a via where the layer changes, then the metric stage.
void realize(const Context& cx, const Variant& V, Result& res) {
  Board& b = cx.b;
  const Options& o = cx.o;
  const Topology& plane = V.plane;
  const topo::LayerMesh& m = plane.layers.front();
  auto log = [&](std::string s) { res.log.push_back(std::move(s)); };
  const auto& chordLayer = V.chordLayer;
  const int nw = int(plane.wires.size());
  std::vector<std::vector<Vec2>> drawnLines;
  std::vector<LayerId> drawnLayers;
  std::vector<Vec2> viaPoints;
  constexpr Coord kViaPoint = 2000;  // 2 um
  const size_t vias0 = b.vias.size();
  std::vector<std::pair<Coord, Coord>> realVia;  // per new via: its diameter and drill
  // A via at a crossing stands where the crossing's sketch point is: between its neighbours on the edge, so that
  // every other wire passes it on its own side.
  for (int wi = 0; wi < nw; ++wi) {
    const topo::Wire& w = plane.wires[size_t(wi)];
    const std::vector<Vec2> pts = sketchOf(plane, m, w);
    const auto& cl = chordLayer[size_t(wi)];
    const int last = int(pts.size()) - 2;
    struct Cut {
      Place at;
      int layer;  // the layer after it
    };
    std::vector<Cut> cuts;
    auto padLayer = [&](int end, int want) {
      const uint32_t pl = cx.padLayers(plane, w, end);
      if (!pl || ((pl >> want) & 1)) return want;
      return std::countr_zero(pl);
    };
    const int startLayer = padLayer(0, cl.front());
    if (startLayer != cl.front()) cuts.push_back({{0, 0.5}, cl.front()});
    for (size_t k = 1; k < cl.size(); ++k)
      if (cl[k] != cl[k - 1]) cuts.push_back({{int(k) - 1, 1.0}, cl[k]});
    if (int endLayer = padLayer(1, cl.back()); endLayer != cl.back()) cuts.push_back({{last, 0.5}, endLayer});
    r::stable_sort(cuts, {}, [](const Cut& c) { return c.at.s(); });
    int cur = startLayer;
    std::vector<Vec2> run{pts.front()};
    auto flush = [&](int layerIdx) {
      const LayerId l = cx.layers[size_t(layerIdx)];
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
        const NetClass& nc = b.classOf(w.net);
        // A point for now: the model is built from the sketches, which pass the via on their side of it but may
        // pass close; its real size comes back once the model knows the sides.
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
  if (o.sketch) o.sketch({drawnLines, drawnLayers, viaPoints});
  log(std::format("tracks: {} along the sketches, {} vias", b.tracks.size(), viaPoints.size()));
  auto realSize = [&] {
    for (size_t k = 0; k < realVia.size(); ++k) {
      b.vias[vias0 + k].diameter = realVia[k].first;
      b.vias[vias0 + k].drill = realVia[k].second;
    }
  };
  if (!o.metric || cx.cancelled()) {
    realSize();
    return;
  }
  // The metric stage: the model from the tracks, F5, F6, F7.
  Topology::assignIds(b);
  Topology t;
  t.build(b);
  realSize();
  for (size_t k = 0; k < realVia.size(); ++k)
    if (const int ow = t.viaOwner[vias0 + k]; ow >= 0) {
      t.owners[size_t(ow)].halfWidth = b.vias[vias0 + k].diameter / 2.0;
      t.owners[size_t(ow)].shape = Shape::circle(b.vias[vias0 + k].pos.v(), b.vias[vias0 + k].diameter / 2.0);
    }
  for (topo::LayerMesh& lm : t.layers)
    for (int e = 0; e < int(lm.edges.size()); ++e) topo::refreshEdge(t, lm, e);
  // The plane is one mesh for all the layers: a wire may find no room on its layer's own mesh where the plane had a
  // pad of the other side between two of this one's (through copper), or cross another there. Such wires are laid
  // again on their layer (with room, else squeezed); one that finds no way stays as drawn, locked.
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
  {
    int over = 0;
    double deficit = 0;
    for (const topo::LayerMesh& lm : t.layers)
      for (const topo::Edge& E : lm.edges)
        if (E.cls >= 2 && !E.cross.empty()) ++over, deficit += std::max(0.0, E.need - E.freeLen);
    log(std::format("model before F5: {} edge(s) over, {:.3f} mm short", over, deficit / 1e6));
    if (std::getenv("XR_AUTO_DEBUG")) {
      std::vector<std::tuple<double, int, int>> worst;  // (deficit, layer index, edge)
      for (int li = 0; li < int(t.layers.size()); ++li)
        for (int e = 0; e < int(t.layers[size_t(li)].edges.size()); ++e) {
          const topo::Edge& E = t.layers[size_t(li)].edges[size_t(e)];
          if (E.cls >= 2 && !E.cross.empty()) worst.push_back({E.need - E.freeLen, li, e});
        }
      r::sort(worst, std::greater{});
      auto kind = [&](const topo::LayerMesh& lm, int v) {
        const topo::Owner& ow = t.owners[size_t(lm.verts[size_t(v)].owner)];
        return std::format("{}{}", int(ow.kind), ow.pad >= 0 ? std::format("/{}-{}", b.pads[size_t(ow.pad)].component >= 0 ? b.components[size_t(b.pads[size_t(ow.pad)].component)].ref : "", b.pads[size_t(ow.pad)].number) : "");
      };
      for (auto& [d, li, e] : worst | v::take(10)) {
        const topo::LayerMesh& lm = t.layers[size_t(li)];
        const topo::Edge& E = lm.edges[size_t(e)];
        log(std::format("  over {:.3f} mm on {}: {} - {} len {:.3f} free {:.3f}, {} wires", d / 1e6, b.layers[size_t(lm.layer)].name, kind(lm, E.v[0]), kind(lm, E.v[1]),
                        (lm.verts[size_t(E.v[1])].p - lm.verts[size_t(E.v[0])].p).len() / 1e6, E.freeLen / 1e6, E.cross.size()));
      }
    }
  }
  if (o.progress) o.progress(0, 3, "F5");
  auto f5 = topo::runF5Model(b, t, {});
  log(std::format("F5: {}", f5.drawn ? "drawn" : "stopped by the model's violations"));
  if (!f5.drawn)
    for (const DrcViolation& d : topo::topologyViolations(b, t, f5.violations) | v::take(8))
      log(std::format("  {} at ({:.3f}, {:.3f}) on {}", d.message, d.pos.x / 1e6, d.pos.y / 1e6, b.layers[size_t(d.layer)].name));
  if (f5.drawn && !cx.cancelled()) {
    if (o.progress) o.progress(1, 3, "F6");
    auto f6 = topo::refineModel(b, t, {});
    log(std::format("F6: {} re-laid, {} via(s) removed; conflicts {} -> {}", f6.relaid, f6.viasRemoved, f6.conflictsBefore, f6.conflictsAfter));
    if (!cx.cancelled()) {
      if (o.progress) o.progress(2, 3, "F7");
      auto f7 = topo::optimizeModel(b, t, {});
      log(std::format("F7: {} via move(s); conflicts {} -> {}", f7.viaMoves, f7.conflictsBefore, f7.conflictsAfter));
    }
  }
}

}  // namespace

Result route(Board& b, const Options& o) {
  ProfScope prof("autoroute");
  const auto t0 = std::chrono::steady_clock::now();
  Result res;
  auto log = [&](std::string s) { res.log.push_back(std::move(s)); };
  Context cx{b, o, {}, 0, {}, {}};
  for (LayerId l : b.copperLayers())
    if (!b.layers[size_t(l)].plane) cx.layers.push_back(l);
  if (cx.layers.empty()) return res;
  for (LayerId l : cx.layers) cx.routing |= LayerMask(1) << l;

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

  // The plane and the connections (the nets' spanning trees over their pads), the wide first, the short among them.
  cx.base.buildPlane(b, cx.layers.front(), cx.routing);
  const topo::LayerMesh& m = cx.base.layers.front();
  {
    std::map<int, std::vector<int>> pads;
    for (int pi = 0; pi < int(b.pads.size()); ++pi) {
      const Pad& p = b.pads[size_t(pi)];
      const int ow = cx.base.padOwner[size_t(pi)];
      if (!routed(p.net) || ow < 0 || m.ownerVerts[size_t(ow)].empty()) continue;
      pads[p.net].push_back(pi);
    }
    for (auto& [net, ps] : pads) {
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
          for (LayerId l : cx.layers) j.width = std::max(j.width, b.trackWidth(net, l));
          cx.jobs.push_back(j);
        }
        for (size_t q = 0; q < ps.size(); ++q)
          if (!in[q])
            if (double d = (b.pads[size_t(ps[k])].pos.v() - b.pads[size_t(ps[q])].pos.v()).len(); d < best[q]) best[q] = d, from[q] = int(k);
      }
    }
  }
  r::sort(cx.jobs, [](const Job& a, const Job& c) { return a.width != c.width ? a.width > c.width : a.length < c.length; });
  res.connections = int(cx.jobs.size());
  log(std::format("plane: {} vertices, {} triangles; {} layers; {} connections", m.verts.size(), m.tris.size(), cx.layers.size(), cx.jobs.size()));

  // The variants: the pairs of prices (and seeds), in parallel.
  struct Plan {
    double crossing, via;
    unsigned seed;
  };
  std::vector<Plan> plans;
  if (o.variants <= 1) {
    plans.push_back({o.crossing * kNmPerMm, o.via * kNmPerMm, 0});
  } else {
    const double crossings[] = {1, 3, 8, 20};
    const double vias[] = {3, 8, 20, 50};
    for (unsigned seed = 0; int(plans.size()) < o.variants; ++seed)
      for (double cr : crossings)
        for (double vi : vias)
          if (int(plans.size()) < o.variants) plans.push_back({cr * kNmPerMm, vi * kNmPerMm, seed});
  }
  std::vector<Variant> vs(plans.size());
  std::atomic<int> done{0};
  parallelFor(plans.size(), [&](size_t i) {
    vs[i] = makeVariant(cx, plans[i].crossing, plans[i].via, plans[i].seed);
    if (o.progress) o.progress(++done, int(plans.size()), "variants");
  });
  if (cx.cancelled()) {
    res.cancelled = true;
    return res;
  }
  // The best: no failure and no edge over first, then the length with the vias at their weight.
  auto key = [&](const Variant& V) {
    return std::tuple{V.failed, V.over > 0, V.over, V.length + o.viaWeight * kNmPerMm * V.vias};
  };
  size_t bi = 0;
  for (size_t i = 0; i < vs.size(); ++i) {
    for (auto& l : vs[i].log) log(l);
    VariantInfo vi{vs[i].crossing / 1e6, vs[i].via / 1e6, vs[i].seed, vs[i].length, vs[i].vias, vs[i].over, vs[i].failed};
    res.variants.push_back(vi);
    if (key(vs[i]) < key(vs[bi])) bi = i;
  }
  // The convex hull of (length, vias) among those without failures: the variants best for some price of a via.
  for (size_t i = 0; i < vs.size(); ++i) {
    bool dominated = false;
    for (size_t k = 0; k < vs.size() && !dominated; ++k)
      dominated = k != i && vs[k].failed <= vs[i].failed && vs[k].over <= vs[i].over && vs[k].length <= vs[i].length && vs[k].vias <= vs[i].vias &&
                  (vs[k].length < vs[i].length || vs[k].vias < vs[i].vias || vs[k].over < vs[i].over);
    res.variants[i].pareto = !dominated;
  }
  const Variant& V = vs[bi];
  res.chosen = int(bi);
  res.routed = V.routed;
  res.failed = V.failed;
  res.crossings = V.crossings;
  res.conflicts = V.conflicts;
  res.planeLength = V.length;
  log(std::format("chosen: variant {} (cross {:.1f}, via {:.1f}, seed {}): {:.1f} mm, {} vias, {} edge-layers over", bi, V.crossing / 1e6, V.via / 1e6,
                  V.seed, V.length / 1e6, V.vias, V.over));
  realize(cx, V, res);
  res.vias = int(b.vias.size());
  res.length = b.tracksLength();
  res.cancelled = cx.cancelled();
  res.seconds = std::chrono::duration<double>(std::chrono::steady_clock::now() - t0).count();
  return res;
}

}  // namespace xr::autoroute
