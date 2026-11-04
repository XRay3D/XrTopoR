#include "router/topo/ModelTools.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <print>
#include <cmath>
#include <map>
#include <set>

#include "core/Connectivity.h"
#include "core/Prof.h"
#include "core/SpatialIndex.h"
#include "router/topo/RealizerInput.h"
#include "topo/Capacity.h"
#include "topo/Flip.h"
#include "topo/Move.h"
#include "drc/Drc.h"
#include "geom/Geometry.h"

namespace xr::topo {

RealWire sketchOf(const Board& b, const Topology& t, int wi) {
  const Wire& w = t.wires[wi];
  const LayerMesh& m = *t.mesh(w.layer);
  RealWire r;
  r.net = w.net;
  r.layer = w.layer;
  r.width = w.width;
  r.widthMin = w.widthMin;
  r.clearance = w.clr;
  // The slot midpoints of the crossings; between two consecutive points (a slot point, an end) the chord
  // lies in one triangle of the mesh, and where it would cut the copper of one of that triangle's corners
  // (a wide pad, a wide angle: the slot points keep their distance along their edges, the chord between
  // them does not) it rounds that corner instead, at the wire's stack radius there or the copper's reach
  // plus the rule, whichever is more. The realiser reads the sketch against its own obstacles and would
  // take a chord through a pad for a wire laid through it.
  struct Pt {
    Vec2 p;
    int edge = -1;  // the crossed edge (-1: an end vertex, an exit point)
  };
  std::vector<Pt> pts;
  pts.push_back({m.verts[w.endVertex[0]].p});
  if (w.hasExit[0]) pts.push_back({w.exit[0]});
  for (int cid : w.cross) {
    const Crossing& c = t.crossings[cid];
    const Edge& E = m.edges[c.edge];
    EdgeCapacity cap = edgeCapacity(t, m, c.edge);
    int k = int(std::ranges::find(E.cross, cid) - E.cross.begin());
    Slot s = slotOf(cap, k);
    Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
    double L = cap.L > 0 ? cap.L : 1;
    pts.push_back({U + (V - U) * (s.mid() / L), c.edge});
  }
  if (w.hasExit[1]) pts.push_back({w.exit[1]});
  pts.push_back({m.verts[w.endVertex[1]].p});
  const double rule = double(w.clr) + w.width / 2.0 + kRealizeMargin;
  auto triOf = [&](const Pt& x, const Pt& y, int endVertex) {  // the triangle the chord x -> y lies in
    if (x.edge < 0 && y.edge < 0) return -1;  // an end and its exit point
    if (x.edge >= 0 && y.edge >= 0) {
      const Edge& A = m.edges[x.edge];
      const Edge& B = m.edges[y.edge];
      for (int ta : A.t)
        if (ta >= 0 && (ta == B.t[0] || ta == B.t[1])) return ta;
      return -1;
    }
    const Edge& E = m.edges[x.edge >= 0 ? x.edge : y.edge];
    for (int ta : E.t)
      if (ta >= 0 && m.localVertex(ta, endVertex) >= 0) return ta;
    return -1;
  };
  for (size_t k = 0; k + 1 < pts.size(); ++k) {
    const Pt& x = pts[k];
    const Pt& y = pts[k + 1];
    r.sketch.push_back(x.p);
    int tri = triOf(x, y, k == 0 ? w.endVertex[0] : w.endVertex[1]);
    if (tri < 0) continue;
    for (int i = 0; i < 3; ++i) {
      int v = m.tris[tri].v[i];
      if (v == w.endVertex[0] || v == w.endVertex[1]) continue;
      const Owner& o = t.owners[m.verts[v].owner];
      if (o.net == w.net && w.net != kNoNet) continue;
      Vec2 P = m.verts[v].p;
      // Only where the chord comes within the rule of the vertex's copper. The stack radius is the
      // realiser's business: samples on it rounded neighbouring vertices into one another (a via row,
      // arcs of 2 mm overlapping, the sketch crossing itself).
      if (o.shape.distanceToSegment(x.p, y.p) >= rule) continue;
      // Along the copper's outline offset by the rule (a rectangle's corners rounded): a straight step
      // between two samples on it stays out of the copper.
      const Shape offset = o.shape.inflated(rule);
      Vec2 d1 = (x.p - P).normalized(), d2 = (y.p - P).normalized();
      double a1 = std::atan2(d1.y, d1.x), sweep = std::atan2(d1.cross(d2), d1.dot(d2));
      // Round the vertex on the side the chord passes it: the arc from d1 to d2 must go through the
      // direction of the chord's nearest point (the shorter way round may be the other side when the
      // chord nearly turns back on itself).
      {
        Vec2 foot = closestPointOnSegment(P, x.p, y.p);
        Vec2 df = foot - P;
        if (df.len() > 1 && o.shape.distance(foot) >= 0) {  // beside the copper; through it, the shorter way
          double af = std::atan2(df.y, df.x);
          double rel = sweep >= 0 ? normalizeAngle(af - a1) : normalizeAngle(a1 - af);  // in [0, 2 pi)
          // The foot at x itself comes out as 0 or as a hair under 2 pi: both are on the arc.
          if (rel > std::abs(sweep) + 1e-6 && rel < 2 * kPi - 1e-6) sweep += sweep >= 0 ? -2 * kPi : 2 * kPi;
        }
      }
      int n = std::max(1, int(std::ceil(std::abs(sweep) / (kPi / 12))));
      for (int s = 1; s < n; ++s) {
        double ang = a1 + sweep * (double(s) / n);
        Vec2 d{std::cos(ang), std::sin(ang)};
        r.sketch.push_back(P + d * offset.rayExit(P, d));
      }
      break;  // one corner per chord
    }
  }
  r.sketch.push_back(pts.back().p);
  return r;
}

RealizeStats realizeFromModel(Board& b, const Topology& t, const std::vector<int>& chosen, const RealizeOptions& opt,
                              std::vector<RealWire>* wiresOut) {
  ProfScope pAll("realizeFromModel");
  std::vector<RealWire> wires;
  for (int wi : chosen) wires.push_back(sketchOf(b, t, wi));
  if (wiresOut) *wiresOut = wires;
  RealizeInput in;
  // No stubs out of narrow pads yet (XR_TOPO_STUBS=1 tries them): which of the model's crossings a stub
  // covers is not settled, and the wires of a fine-pitch row came out weaving (Arcs_master: 1500
  // violations against 25 without).
  if (std::getenv("XR_TOPO_STUBS")) {
    prepareStubs(b, wires, opt, in);
  } else {
    for (const RealWire& w : wires) in.sketches.push_back(w.sketch);
    in.stubs.assign(wires.size(), {});
    if (opt.region) in.oidx.build(b, *opt.region);
    else in.oidx.build(b);
  }
  const int NW = int(wires.size());
  if (std::getenv("XR_TOPO_DEBUG")) {
    int on = 0;
    for (auto& st : in.stubs) on += st[0].on + st[1].on;
    std::println(stderr, "realizeFromModel: {} wires, {} stubs", NW, on);
  }
  in.hits.assign(NW, {});
  std::map<int, int> localOf;  // model wire -> index in `wires`
  for (int k = 0; k < NW; ++k) localOf[chosen[k]] = k;
  // The obstacles of every layer drawn on: the mesh's vertices as the realiser's points, the owners' copper
  // as their shapes, the pads' corners and the outline's pieces as sides.
  std::set<LayerId> layersUsed;
  for (const RealWire& w : wires) layersUsed.insert(w.layer);
  for (LayerId layer : layersUsed) {
    const LayerMesh& m = *t.mesh(layer);
    LayerObstacles& ob = in.obstacles[layer];
    std::map<int, int> centreOf;  // owner -> its centre point
    for (int v = 0; v < int(m.verts.size()); ++v) {
      const Vertex& x = m.verts[v];
      if (x.owner < 0) continue;  // removed
      const Owner& o = t.owners[x.owner];
      double clr = m.ownerClr[x.owner];
      int id;
      switch (o.kind) {
        case Owner::Kind::Pad:
          if (o.net == kNoNet && o.shape.kind == Shape::Kind::Point) {  // a hole without copper
            id = ob.add(x.p, o.halfWidth, clr, kNoNet);
            break;
          }
          // A corner or an end is a point with the copper's rounding, as the realiser has it (its reach by
          // the shape would differ from edge to edge round one vertex, and the stacks with it).
          {
            const bool centre = x.t == 0 && x.off.len2() < 1;
            // A round pad is its radius; a polygon's centre is enclosed by its corners, a bare point.
            double r = o.shape.kind == Shape::Kind::Point ? o.halfWidth : centre ? 0.0 : o.shape.r;
            id = ob.add(x.p, r, clr, o.net);
            if (centre && o.shape.kind != Shape::Kind::Point) centreOf[x.owner] = id;
          }
          break;
        case Owner::Kind::Via:
          id = ob.add(x.p, o.halfWidth, clr, o.net);
          ob.pts[id].via = o.via;
          break;
        case Owner::Kind::Junction: id = ob.add(x.p, o.halfWidth, clr, o.net); break;
        case Owner::Kind::Outline: id = ob.add(x.p, 0, clr, kBoardEdge); break;
        case Owner::Kind::Keepout: id = ob.add(x.p, 0, 0, kBoardEdge); break;
      }
      if (id >= 0) ob.pts[id].owner = x.owner;
    }
    // The sides: a pad's perimeter between its corners (or its two ends), the outline and keepout pieces.
    for (const Edge& E : m.edges) {
      const Vertex& a = m.verts[E.v[0]];
      const Vertex& c = m.verts[E.v[1]];
      const Owner& oa = t.owners[a.owner];
      if (a.owner == c.owner) {
        if (oa.kind != Owner::Kind::Pad) continue;
        bool aCentre = a.t == 0 && a.off.len2() < 1, cCentre = c.t == 0 && c.off.len2() < 1;
        if (aCentre || cCentre) continue;  // a spoke, not a side
        ob.side(E.v[0], E.v[1], oa.shape.r);
      } else if (E.constrained && (oa.kind == Owner::Kind::Outline || oa.kind == Owner::Kind::Keepout)) {
        ob.side(E.v[0], E.v[1], 0);
      }
    }
    for (auto [owner, centre] : centreOf)
      for (int v : m.ownerVerts[owner])
        if (v != centre && !(m.verts[v].t == 0 && m.verts[v].off.len2() < 1)) ob.cornersOf[centre].push_back(v);
    // The stubs' copper, as the realiser adds it.
    for (int k = 0; k < NW; ++k)
      if (wires[k].layer == layer)
        for (const Stub& st : in.stubs[k])
          if (st.on) {
            double r = wires[k].width / 2.0, clr = double(wires[k].clearance);
            int i = ob.add(st.mid, r, clr, wires[k].net), j = ob.add(st.to, r, clr, wires[k].net);
            ob.link(i, j, r);
          }
    // The crossings, in the wires' order and in the edges' order.
    auto& onEdge = in.edgeLists[layer];
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const Edge& E = m.edges[e];
      if (E.cross.empty()) continue;
      EdgeCapacity cap = edgeCapacity(t, m, e);
      for (int k = 0; k < int(E.cross.size()); ++k) {
        const Crossing& c = t.crossings[E.cross[k]];
        auto it = localOf.find(c.wire);
        if (it == localOf.end()) continue;  // a wire that stays as it lies: its copper is in the obstacles
        int li = it->second;
        std::vector<EdgeHit>& hs = in.hits[li];
        if (hs.size() <= size_t(c.idx)) hs.resize(c.idx + 1);
        Slot s = slotOf(cap, k);
        hs[c.idx] = {E.v[0], E.v[1], cap.L > 0 ? s.mid() / cap.L : 0.5, false, -1, -1, false};
      }
    }
    std::vector<int> dropFront(NW, 0);  // crossings a stub covers at the start of a wire
    for (int k = 0; k < NW; ++k) {
      if (wires[k].layer != layer) continue;
      const Wire& w = t.wires[chosen[k]];
      std::vector<EdgeHit>& hs = in.hits[k];
      // A stub out of a narrow pad covers the crossings next to the pad: the wire starts at the stub's
      // exit, past them (as the sketch's points within the envelope go).
      for (int end = 0; end < 2; ++end) {
        const Stub& st = in.stubs[k][end];
        if (!st.on) continue;
        // Covered: the edges the stub itself crosses on its way from the end vertex to its exit (the wire
        // starts at the exit and crosses what lies beyond).
        const Vec2 from = m.verts[w.endVertex[end]].p;
        auto covered = [&](const EdgeHit& h) {
          // The stub's segment crosses the edge inside it: an edge the stub only touches at one of its
          // ends (the fan of the pad's end, which the wire crosses beyond the exit) is not covered.
          Vec2 a = ob.pts[h.u].p, c = ob.pts[h.v].p;
          double den = (c - a).cross(st.to - from);
          if (std::abs(den) < 1e-9) return false;
          double s = (from - a).cross(st.to - from) / den;    // along a -> c
          double r = (from - a).cross(c - a) / den;           // along from -> to
          double L = (c - a).len();
          return r >= 0 && r <= 1 && s * L > 1000 && (1 - s) * L > 1000;
        };
        if (end == 0)
          while (!hs.empty() && covered(hs.front())) {
            hs.erase(hs.begin());
            ++dropFront[k];
          }
        else
          while (!hs.empty() && covered(hs.back())) hs.pop_back();
      }
      // Where the wire crosses the side of its own end pad it is pinned at the exit point (where the tracks
      // had it; the realiser's slot on an own side spans the side, and the taut path went to the corner
      // itself, out of the copper — and a track through a vertex sent the next conversion's walk astray).
      for (int end = 0; end < 2; ++end) {
        if (!w.hasExit[end] || hs.empty()) continue;
        const Owner& o = t.owners[w.end[end]];
        if (o.shape.kind != Shape::Kind::Polygon) continue;
        const Vec2 c = m.verts[w.endVertex[end]].p;
        for (int step = 0; step < int(hs.size()); ++step) {
          EdgeHit& h = hs[end ? int(hs.size()) - 1 - step : step];
          if (ob.pts[h.u].owner != w.end[end] || ob.pts[h.v].owner != w.end[end]) break;
          Vec2 a = ob.pts[h.u].p, d = ob.pts[h.v].p - a, e = w.exit[end] - c;
          double den = d.cross(e);
          if (std::abs(den) < 1e-9) continue;
          double s = (c - a).cross(e) / den;  // along u -> v
          if (s >= 0 && s <= 1) h.pin = s;
        }
      }
      // Which side the edge's u lies on: the wire crosses the edge into the triangle it shares with the
      // next crossing (or the one holding the end vertex); that triangle, counter-clockwise, runs the edge
      // from u to v exactly when u is on the wire's left (by the sketch's points it was wrong where a wire
      // wraps round u, the chord between its neighbours passing through u).
      for (size_t i = 0; i < hs.size(); ++i) {
        const Edge& E = m.edges[t.crossings[w.cross[i]].edge];
        int into = -1;
        if (i + 1 < hs.size()) {
          const Edge& N = m.edges[t.crossings[w.cross[i + 1]].edge];
          for (int ta : E.t)
            if (ta >= 0 && (ta == N.t[0] || ta == N.t[1])) into = ta;
        } else {
          for (int ta : E.t)
            if (ta >= 0 && m.localVertex(ta, w.endVertex[1]) >= 0) into = ta;
        }
        if (into < 0) continue;
        int j = m.localVertex(into, hs[i].u);
        hs[i].uLeft = j >= 0 && m.tris[into].v[(j + 1) % 3] == hs[i].v;
      }
      for (size_t i = 0; i < hs.size(); ++i) onEdge[{hs[i].u, hs[i].v}].push_back({k, int(i)});
    }
    // Along every edge the list runs from u to v, as Edge::cross does, but by hit indices of the wires
    // in that order (the wires not drawn left out).
    for (auto& [uv, list] : onEdge) {
      const Edge* E = nullptr;
      for (int e = 0; e < int(m.edges.size()) && !E; ++e)
        if (m.edges[e].v[0] == uv.first && m.edges[e].v[1] == uv.second) E = &m.edges[e];
      if (!E) continue;
      std::vector<std::pair<int, int>> ordered;
      for (int cid : E->cross) {
        auto it = localOf.find(t.crossings[cid].wire);
        if (it == localOf.end()) continue;
        int hi = t.crossings[cid].idx - dropFront[it->second];
        if (hi >= 0 && hi < int(in.hits[it->second].size())) ordered.push_back({it->second, hi});
      }
      list = std::move(ordered);
    }
  }
  return drawRealized(b, wires, {}, opt, in, RealizeStats{});
}

namespace {

// Stops before anything is drawn when wires cross or a wire runs through another net's copper (TopoR's
// 5032 and the like); else the flips and the capacities. A wire the mesh does not hold stays as drawn,
// locked, and is no bar (as an unrouted connection, TopoR's 5007, is none) — it is reported with the result.
bool prepareModel(Topology& t, bool flips, bool weighted, int& nFlips, std::vector<Violation>& stopping) {
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad) stopping.push_back(v);
  if (!stopping.empty()) return false;
  if (flips) {
    ProfScope p("F5 model: flips");
    if (const char* n = std::getenv("XR_TOPO_SCRAMBLE")) {  // a check of the transfer: random flips, then back to Delaunay
      unsigned x = 5;
      for (LayerMesh& m : t.layers)
        for (int k = 0; k < std::atoi(n); ++k) {
          x = x * 1664525u + 1013904223u;
          nFlips += flip(t, m, int((x >> 8) % m.edges.size()));
        }
    }
    for (LayerMesh& m : t.layers) nFlips += flipLoop(t, m, {}, {}, weighted);
  }
  {
    ProfScope p("F5 model: capacity");
    for (LayerMesh& m : t.layers)
      for (int e = 0; e < int(m.edges.size()); ++e)
        if (!m.edges[e].cross.empty()) refreshEdge(t, m, e);
  }
  return true;
}

// Draws every unlocked wire of the model: their tracks go, and the hand-drawn runs inside the pads they
// end at (the wire is drawn to the pad's connection point); the locked ones stay as obstacles.
void drawModel(Board& b, Topology& t, bool direct, RealizeStats& stats, int& nWires) {
  std::vector<int> chosen;
  std::set<uint32_t> gone;
  std::set<int> redrawnAt;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked) continue;
    chosen.push_back(wi);
    for (uint32_t id : w.tracks) gone.insert(id);
    redrawnAt.insert(w.end[0]);
    redrawnAt.insert(w.end[1]);
  }
  for (auto [owner, id] : t.ownerTracks)
    if (redrawnAt.contains(owner)) gone.insert(id);
  std::vector<RealWire> wires;
  for (int wi : chosen) wires.push_back(sketchOf(b, t, wi));
  if (const char* dbg = std::getenv("XR_TOPO_NEAR")) {
    double nx = 0, ny = 0;
    std::sscanf(dbg, "%lf,%lf", &nx, &ny);
    Vec2 near{nx * kNmPerMm, ny * kNmPerMm};
    for (size_t k = 0; k < wires.size(); ++k) {
      const Wire& w = t.wires[chosen[k]];
      bool hit = false;
      for (Vec2 p : wires[k].sketch) hit |= (p - near).len() < 3 * kNmPerMm;
      if (!hit) continue;
      const LayerMesh& m = *t.mesh(w.layer);
      std::print(stderr, "wire {} net {} L{} ends {} ({:.3f},{:.3f}) {} ({:.3f},{:.3f}); edges:", chosen[k], b.nets[w.net].name, int(w.layer), w.end[0],
                 m.verts[w.endVertex[0]].p.x / 1e6, m.verts[w.endVertex[0]].p.y / 1e6, w.end[1], m.verts[w.endVertex[1]].p.x / 1e6,
                 m.verts[w.endVertex[1]].p.y / 1e6);
      for (int cid : w.cross) {
        const Edge& E = m.edges[t.crossings[cid].edge];
        int k2 = int(std::ranges::find(E.cross, cid) - E.cross.begin());
        std::print(stderr, " [({:.2f},{:.2f})-({:.2f},{:.2f}) {}/{}]", m.verts[E.v[0]].p.x / 1e6, m.verts[E.v[0]].p.y / 1e6, m.verts[E.v[1]].p.x / 1e6,
                   m.verts[E.v[1]].p.y / 1e6, k2, E.cross.size());
      }
      std::print(stderr, "\n  sketch:");
      for (Vec2 p : wires[k].sketch) std::print(stderr, " ({:.3f},{:.3f})", p.x / 1e6, p.y / 1e6);
      std::println(stderr, "");
    }
  }
  if (const char* dbg = std::getenv("XR_TOPO_NET"))
    for (size_t k = 0; k < wires.size(); ++k)
      if (b.nets[wires[k].net].name == dbg) {
        const Wire& w = t.wires[chosen[k]];
        std::print(stderr, "wire {} net {} L{} ends {} {} ({} crossings):", chosen[k], dbg, int(w.layer), w.end[0], w.end[1], w.cross.size());
        for (Vec2 p : wires[k].sketch) std::print(stderr, " ({:.3f},{:.3f})", p.x / 1e6, p.y / 1e6);
        std::println(stderr, "");
      }
  std::erase_if(b.tracks, [&](const Track& tr) { return tr.id && gone.contains(tr.id); });
  for (auto& z : b.zones)
    for (auto& w : wires)
      if (z.layer == w.layer) { z.filled.clear(); break; }
  RealizeOptions opt;
  opt.tracksAsObstacles = true;
  for (const Junction& j : t.junctions) opt.anchors.push_back({j.pos, j.layer, j.net, t.owners[j.owner].halfWidth});
  const size_t before = b.tracks.size();
  {
    ProfScope p("F5 model: realize");
    stats = direct ? realizeFromModel(b, t, chosen, opt) : realize(b, wires, {}, opt);
  }
  Topology::assignIds(b);
  for (int wi : chosen) t.wires[wi].tracks.clear();
  for (size_t k = 0; k < stats.trackWire.size(); ++k) {
    int wi = chosen[stats.trackWire[k]];
    t.wires[wi].tracks.push_back(b.tracks[before + k].id);
    t.wires[wi].dirty = false;
  }
  nWires = int(wires.size());
}

}  // namespace

F5ModelResult runF5Model(Board& b, Topology& t, const F5ModelOptions& o) {
  ProfScope pAll("F5 model total");
  F5ModelResult r;
  if (!prepareModel(t, o.flips, o.weighted, r.flips, r.violations)) return r;
  drawModel(b, t, o.direct, r.stats, r.wires);
  r.drawn = true;
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow || v.kind == Violation::Kind::OutsideBoard) r.violations.push_back(v);
  return r;
}

// ---- F7 on the model -------------------------------------------------------------------------------

namespace {

// The owners by 2 mm cells, for what is near a point.
struct OwnerGrid {
  static constexpr double kCell = 2 * kNmPerMm;
  std::map<std::pair<long, long>, std::vector<int>> cells;
  void build(const Topology& t) {
    cells.clear();
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& o = t.owners[oi];
      if (o.layers == 0 || (o.kind != Owner::Kind::Pad && o.kind != Owner::Kind::Via)) continue;
      BBox bb = o.shape.bbox();
      for (long cx = long(std::floor(bb.minX / kCell)); cx <= long(std::floor(bb.maxX / kCell)); ++cx)
        for (long cy = long(std::floor(bb.minY / kCell)); cy <= long(std::floor(bb.maxY / kCell)); ++cy) cells[{cx, cy}].push_back(oi);
    }
  }
  template <class F>
  void near(Vec2 p, double r, F&& f) const {
    std::set<int> seen;
    for (long cx = long(std::floor((p.x - r) / kCell)); cx <= long(std::floor((p.x + r) / kCell)); ++cx)
      for (long cy = long(std::floor((p.y - r) / kCell)); cy <= long(std::floor((p.y + r) / kCell)); ++cy) {
        auto it = cells.find({cx, cy});
        if (it == cells.end()) continue;
        for (int oi : it->second)
          if (seen.insert(oi).second) f(oi);
      }
  }
};

struct RelaxObj {
  int owner = -1;
  Vec2 lastForce;
  double scale = 1.0;
};

// The slot positions of every crossing (the sketch points), the wires' length through them, and the
// shortfall on the edges.
struct ModelState {
  std::vector<Vec2> pos;  // per crossing
  std::vector<double> lo, hi;  // per crossing: its slot along the edge from v[0]
  std::vector<double> edgeDeficit;  // per layer, flattened: layer offset + edge
  std::vector<size_t> edgeBase;
  std::vector<double> ownerDeficit;  // per owner: the shortfall of the chords to its vertex
  double length = 0, deficit = 0;
  double edgePart = 0, pinchPart = 0, chordPart = 0;  // what the deficit is made of
  struct Worst { double d; int wire; Vec2 at; const char* what; };
  std::vector<Worst> worst;  // the largest, for a look
};

ModelState modelState(const Topology& t, bool chords = true) {
  ModelState s;
  s.pos.assign(t.crossings.size(), {});
  s.lo.assign(t.crossings.size(), 0);
  s.hi.assign(t.crossings.size(), 0);
  s.edgeBase.resize(t.layers.size());
  size_t base = 0;
  for (size_t li = 0; li < t.layers.size(); ++li) {
    s.edgeBase[li] = base;
    base += t.layers[li].edges.size();
  }
  s.edgeDeficit.assign(base, 0);
  s.ownerDeficit.assign(t.owners.size(), 0);
  for (size_t li = 0; li < t.layers.size(); ++li) {
    const LayerMesh& m = t.layers[li];
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const Edge& E = m.edges[e];
      if (E.v[0] < 0 || E.cross.empty()) continue;
      EdgeCapacity c = edgeCapacity(t, m, e);
      s.edgeDeficit[s.edgeBase[li] + e] = c.deficit;
      s.deficit += c.deficit;
      s.edgePart += c.deficit;
      if (c.deficit > 0) s.worst.push_back({c.deficit, E.cross.empty() ? -1 : t.crossings[E.cross[0]].wire, (m.verts[E.v[0]].p + m.verts[E.v[1]].p) * 0.5, "edge"});
      Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
      double L = c.L > 0 ? c.L : 1;
      for (int k = 0; k < int(E.cross.size()); ++k) {
        Slot sl = slotOf(c, k);
        s.pos[E.cross[k]] = U + (V - U) * (sl.mid() / L);
        s.lo[E.cross[k]] = sl.lo;
        s.hi[E.cross[k]] = sl.hi;
      }
    }
  }
  for (const Wire& w : t.wires) {
    const LayerMesh& m = *t.mesh(w.layer);
    const size_t li = size_t(&m - t.layers.data());
    Vec2 p = m.verts[w.endVertex[0]].p;
    for (int cid : w.cross) {
      s.length += (s.pos[cid] - p).len();
      p = s.pos[cid];
    }
    s.length += (m.verts[w.endVertex[1]].p - p).len();
    // A chord (between two slots, or a slot and an end) keeps the rule from the copper at the corners of
    // its triangle: the slots keep their distance along their edges, the chord between them does not,
    // and the realiser's bend round that corner may not fit with the next one (an S between two pads a
    // millimetre apart: one bend dropped, the wire through the pad). The shortfall is the chord's edges'
    // and, at an end, the end owner's (what moved).
    auto corner = [&](Vec2 a, Vec2 c, int x, double& deficit) {
      const Owner& o = t.owners[m.verts[x].owner];
      if (o.net == w.net) return;
      double req = w.width / 2.0 + (o.kind == Owner::Kind::Outline ? double(m.ownerClr[m.verts[x].owner]) : o.kind == Owner::Kind::Keepout ? 0.0 : std::max(double(w.clr), m.ownerClr[m.verts[x].owner]));
      double d = o.shape.distanceToSegment(a, c);
      if (d < req) deficit += req - d;
    };
    auto triBetween = [&](const Edge& E1, const Edge& E2) {
      for (int ta : E1.t)
        if (ta >= 0 && (ta == E2.t[0] || ta == E2.t[1])) return ta;
      return -1;
    };
    auto triAtEnd = [&](const Edge& E, int v) {
      for (int ta : E.t)
        if (ta >= 0 && m.localVertex(ta, v) >= 0) return ta;
      return -1;
    };
    // The realiser's taut path takes the best point of every slot, not its midpoint: against a corner the
    // chord is taken from the slot's point farthest from it, so only what cannot be avoided counts.
    auto farFrom = [&](int cid, int x) {
      const Edge& E = m.edges[t.crossings[cid].edge];
      Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
      double L = (V - U).len();
      if (L <= 0) return U;
      double at = E.v[0] == x ? s.hi[cid] : E.v[1] == x ? s.lo[cid] : (s.lo[cid] + s.hi[cid]) / 2;
      return U + (V - U) * (at / L);
    };
    const size_t n = w.cross.size();
    for (size_t k = 0; k <= n; ++k) {
      int ti = -1;
      if (k == 0 && n == 0) continue;  // along an edge, or straight between the ends
      if (k == 0) ti = triAtEnd(m.edges[t.crossings[w.cross[0]].edge], w.endVertex[0]);
      else if (k == n) ti = triAtEnd(m.edges[t.crossings[w.cross[n - 1]].edge], w.endVertex[1]);
      else ti = triBetween(m.edges[t.crossings[w.cross[k - 1]].edge], m.edges[t.crossings[w.cross[k]].edge]);
      if (ti < 0) continue;
      // Not the vertex the wire bends round (the chord cuts that corner by design, the realiser puts the
      // arc of the stack radius there; the pinch above is its measure), nor the end it goes to.
      int bend = -1;
      if (k > 0 && k < n) {
        const Edge& E1 = m.edges[t.crossings[w.cross[k - 1]].edge];
        const Edge& E2 = m.edges[t.crossings[w.cross[k]].edge];
        bend = E1.v[0] == E2.v[0] || E1.v[0] == E2.v[1] ? E1.v[0] : E1.v[1];
      }
      double deficit = 0;
      Vec2 a, c;
      for (int x : m.tris[ti].v) {
        if ((k == 0 && x == w.endVertex[0]) || (k == n && x == w.endVertex[1]) || x == bend) continue;
        a = k == 0 ? m.verts[w.endVertex[0]].p : farFrom(w.cross[k - 1], x);
        c = k == n ? m.verts[w.endVertex[1]].p : farFrom(w.cross[k], x);
        corner(a, c, x, deficit);
      }
      if (deficit <= 0 || !chords) continue;
      s.deficit += deficit;
      s.chordPart += deficit;
      s.worst.push_back({deficit, int(&w - t.wires.data()), (a + c) * 0.5, k == 0 || k == n ? "end chord" : "chord"});
      if (k > 0) s.edgeDeficit[s.edgeBase[li] + size_t(t.crossings[w.cross[k - 1]].edge)] += deficit;
      if (k < n) s.edgeDeficit[s.edgeBase[li] + size_t(t.crossings[w.cross[k]].edge)] += deficit;
      if (k == 0) s.ownerDeficit[w.end[0]] += deficit;
      if (k == n) s.ownerDeficit[w.end[1]] += deficit;
    }
    // A bend round a vertex has one radius on both edges: where the slots on the two edges from it leave
    // no radius that fits both (a pinch between the vertex's copper on one edge and a stack on the other)
    // the realiser drops a bend and the wire cuts through. What is missing counts as shortfall on both.
    for (size_t k = 0; k + 1 < w.cross.size(); ++k) {
      int c1 = w.cross[k], c2 = w.cross[k + 1];
      const Edge& E1 = m.edges[t.crossings[c1].edge];
      const Edge& E2 = m.edges[t.crossings[c2].edge];
      int x = E1.v[0] == E2.v[0] || E1.v[0] == E2.v[1] ? E1.v[0] : E1.v[1] == E2.v[0] || E1.v[1] == E2.v[1] ? E1.v[1] : -1;
      if (x < 0) continue;
      auto fromX = [&](const Edge& E, int cid, double& lo, double& hi) {
        double L = (m.verts[E.v[1]].p - m.verts[E.v[0]].p).len();
        if (E.v[0] == x) { lo = s.lo[cid]; hi = s.hi[cid]; }
        else { lo = L - s.hi[cid]; hi = L - s.lo[cid]; }
      };
      double lo1, hi1, lo2, hi2;
      fromX(E1, c1, lo1, hi1);
      fromX(E2, c2, lo2, hi2);
      double pinch = std::max(lo1, lo2) - std::min(hi1, hi2);
      if (pinch <= 0) continue;
      s.deficit += pinch;
      s.pinchPart += pinch;
      s.worst.push_back({pinch, int(&w - t.wires.data()), m.verts[x].p, "pinch"});
      for (const Edge* E : {&E1, &E2}) {
        size_t li = size_t(t.mesh(w.layer) - t.layers.data());
        s.edgeDeficit[s.edgeBase[li] + size_t(E - m.edges.data())] += pinch;
      }
    }
  }
  return s;
}

// The copper along the far sides of the object's star that its capacity never sees: a wire running along
// an edge (between two vertices, crossing none of the object's spokes), the outline, a keepout's wall.
// Each is a segment the object keeps its rule from; what is short of it, summed, and the way off.
struct CopperPush {
  Vec2 push;
  double shortfall = 0;
};
void segmentPush(const Board& b, const Topology& t, int oi, Vec2 at, CopperPush& out) {
  const Owner& ob = t.owners[oi];
  for (const LayerMesh& m : t.layers) {
    if (oi >= int(m.ownerVerts.size())) continue;
    for (int v : m.ownerVerts[oi])
      for (int ti : m.verts[v].tris) {
        const Tri& T = m.tris[ti];
        const Edge& F = m.edges[T.e[m.localVertex(ti, v)]];
        if (F.v[0] < 0) continue;
        double req = -1;
        const Owner& fa = t.owners[m.verts[F.v[0]].owner];
        if (F.constrained) {
          req = ob.halfWidth + (fa.kind == Owner::Kind::Outline ? double(b.edgeClearance) : 0.0);
        } else if (F.along >= 0 && t.wires[F.along].net != ob.net) {
          const Wire& w = t.wires[F.along];
          req = ob.halfWidth + std::max(m.ownerClr[oi], double(w.clr)) + w.width / 2.0;
        }
        if (req < 0) continue;
        Vec2 A = m.verts[F.v[0]].p, B = m.verts[F.v[1]].p;
        double d = distPointSegment(at, A, B);
        if (d >= req - 1000) continue;
        // The normal off the segment at the nearest point.
        Vec2 ab = B - A;
        double s = ab.len2() > 0 ? std::clamp((at - A).dot(ab) / ab.len2(), 0.0, 1.0) : 0.0;
        Vec2 n = at - (A + ab * s);
        if (n.len() < 1) n = Vec2{-ab.y, ab.x};
        if (n.len() < 1) continue;
        out.shortfall += req - 1000 - d;
        out.push = out.push + n.normalized() * (req - d + 2000);
      }
  }
}
CopperPush copperPush(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 at) {
  const Owner& ob = t.owners[oi];
  CopperPush out;
  segmentPush(b, t, oi, at, out);
  const double maxClr = double(b.maxClearance());
  grid.near(at, ob.halfWidth + maxClr + 1000, [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (o.net == ob.net || !(o.layers & ob.layers)) return;
    double req = ob.halfWidth + requiredClearance(b, ob.net, o.net, ob.layers & o.layers);
    double d = o.shape.distance(at);
    if (d >= req - 1000) return;
    constexpr double e = 2000;
    Vec2 n{o.shape.distance(at + Vec2{e, 0}) - o.shape.distance(at - Vec2{e, 0}), o.shape.distance(at + Vec2{0, e}) - o.shape.distance(at - Vec2{0, e})};
    if (n.len() < 1) n = at - o.c;
    if (n.len() < 1) return;
    out.shortfall += req - 1000 - d;
    out.push = out.push + n.normalized() * ((req - d + 2000) * (o.kind == Owner::Kind::Via ? 0.5 : 1.0));
  });
  return out;
}

// What stops the object at p: copper of other nets closer than the rule by more in sum than where it
// comes from (a step out of a conflict is no conflict). The worst such copper's centre.
std::optional<Vec2> blockerAt(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 p) {
  const Owner& ob = t.owners[oi];
  const double maxClr = double(b.maxClearance());
  double shortThere = 0, shortHere = 0, worstShort = 0;
  std::optional<Vec2> worst;
  {
    CopperPush there, here;
    segmentPush(b, t, oi, p, there);
    segmentPush(b, t, oi, ob.c, here);
    shortThere += there.shortfall;
    shortHere += here.shortfall;
    if (there.shortfall > 0) {
      worstShort = there.shortfall;
      worst = p - there.push;
    }
  }
  grid.near(p, ob.halfWidth + maxClr + 1000 + (p - ob.c).len(), [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (o.net == ob.net || !(o.layers & ob.layers)) return;
    double req = ob.halfWidth + requiredClearance(b, ob.net, o.net, ob.layers & o.layers);
    double there = std::max(0.0, req - 1000 - o.shape.distance(p)), here = std::max(0.0, req - 1000 - o.shape.distance(ob.c));
    shortThere += there;
    shortHere += here;
    if (there > worstShort) {
      worstShort = there;
      worst = o.c;
    }
  });
  if (shortThere > 0 && shortThere >= shortHere) return worst;
  return std::nullopt;
}

// The violations on `now` with none of the same nets close by on `was`: what a change added.
std::vector<DrcViolation> addedViolations(const Board& was, const std::vector<DrcViolation>& wasV, const Board& now, const std::vector<DrcViolation>& nowV) {
  auto netsOf = [](const Board& x, const DrcViolation& v) { return std::minmax(itemNet(x, v.a), v.hasB ? itemNet(x, v.b) : kNoNet); };
  std::vector<char> used(wasV.size(), 0);
  std::vector<DrcViolation> added;
  for (const DrcViolation& v : nowV) {
    bool old = false;
    for (size_t k = 0; k < wasV.size() && !old; ++k)
      if (!used[k] && netsOf(was, wasV[k]) == netsOf(now, v) && (wasV[k].pos - v.pos).len() < 1 * kNmPerMm) old = used[k] = 1;
    if (!old) added.push_back(v);
  }
  return added;
}

}  // namespace

OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o) {
  ProfScope pAll("F7 model total");
  OptimizeModelResult r;
  int nFlips = 0;
  if (!prepareModel(t, o.flips, false, nFlips, r.violations)) return r;
  constexpr double kDepthCost = 100;  // a mm of shortfall costs 100 mm of wire
  constexpr int kTries = 4;
  // The objects: unlocked vias, and the branch points of unlocked wires.
  std::vector<RelaxObj> objs;
  {
    std::set<int> lockedAt;
    for (const Wire& w : t.wires)
      if (w.locked) {
        lockedAt.insert(w.end[0]);
        lockedAt.insert(w.end[1]);
      }
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& ow = t.owners[oi];
      if (ow.layers == 0 || ow.locked || lockedAt.contains(oi)) continue;
      if ((ow.kind == Owner::Kind::Via && o.vias) || (ow.kind == Owner::Kind::Junction && o.junctions)) objs.push_back({oi});
    }
  }
  OwnerGrid grid;
  std::vector<double> objShort(objs.size(), 0);  // per object: what it is short of the copper around it
  auto copperShort = [&](std::vector<double>& per) {
    double sum = 0;
    for (size_t k = 0; k < objs.size(); ++k) {
      const Owner& ow = t.owners[objs[k].owner];
      CopperPush cp = copperPush(b, t, grid, objs[k].owner, ow.c);
      per[k] = cp.shortfall;
      sum += cp.shortfall;
    }
    return sum;
  };
  grid.build(t);
  ModelState state = modelState(t, o.chords);
  double copper = copperShort(objShort);
  if (std::getenv("XR_TOPO_DEBUG")) {
    std::println(stderr, "F7 model: shortfall {:.3f} mm = edges {:.3f} + pinch {:.3f} + chords {:.3f} + copper {:.3f}", (state.deficit + copper) / 1e6,
                 state.edgePart / 1e6, state.pinchPart / 1e6, state.chordPart / 1e6, copper / 1e6);
    std::ranges::sort(state.worst, [](auto& x, auto& y) { return x.d > y.d; });
    for (size_t k = 0; k < std::min<size_t>(12, state.worst.size()); ++k) {
      const auto& x = state.worst[k];
      std::println(stderr, "  {} {:.3f} mm at ({:.3f},{:.3f}) wire {} net {}", x.what, x.d / 1e6, x.at.x / 1e6, x.at.y / 1e6, x.wire,
                   x.wire >= 0 ? b.nets[t.wires[x.wire].net].name : "-");
    }
  }
  r.lengthBefore = state.length;
  r.deficitBefore = state.deficit + copper;
  auto cost = [&](const ModelState& s, double cu) { return s.length + (s.deficit + cu) * kDepthCost; };
  // The checkpoints: the model drawn on a copy of the board, judged as the legacy optimiser judges a
  // re-lay (fewer conflicts first, then length with a mm of shortfall worth 100 mm; nothing lost).
  struct Checkpoint {
    Topology t;       // the model as it was: its wires own the board's tracks (what a rollback restores)
    Topology tDrawn;  // the model whose wires own the drawn copy's tracks (what the result keeps)
    Board drawn;
    std::vector<DrcViolation> violations;
    std::vector<Vec2> pos;  // the objects' centres
    int conflicts = 0;
    double depth = 0, length = 0;
    size_t unrouted = 0;
    double score() const { return length + depth * kDepthCost; }
  };
  std::optional<Checkpoint> best;
  auto betterThanBest = [&](const Checkpoint& c) {
    return c.unrouted <= best->unrouted && (c.conflicts < best->conflicts || (c.conflicts == best->conflicts && c.score() <= best->score()));
  };
  auto checkpoint = [&] {
    ProfScope p("F7 model: checkpoint");
    Checkpoint c{t, t, b};
    for (const RelaxObj& ob : objs) c.pos.push_back(t.owners[ob.owner].c);
    // The vias on the 0.1 um grid the board's files keep (a position between two of its points would be
    // written either way, and the model next to the board would not hash the same).
    for (const Owner& ow : t.owners)
      if (ow.kind == Owner::Kind::Via && ow.via >= 0 && ow.via < int(c.drawn.vias.size()))
        c.drawn.vias[ow.via].pos = Point(Vec2{std::round(ow.c.x / 100) * 100, std::round(ow.c.y / 100) * 100});
    RealizeStats st;
    int nw = 0;
    drawModel(c.drawn, c.tDrawn, true, st, nw);
    DrcOptions d;
    d.unconnected = false;
    c.violations = runDrc(c.drawn, d);
    for (const DrcViolation& v : c.violations) {
      ++c.conflicts;
      c.depth += std::max(0.0, v.required - v.actual);
    }
    c.length = c.drawn.tracksLength();
    c.unrouted = Connectivity::compute(c.drawn).ratsnest.size();
    ++r.checkpoints;
    return c;
  };
  if (o.checkpointEvery > 0) {
    best = checkpoint();
    r.conflictsBefore = best->conflicts;
  }
  // A worse checkpoint: the objects moved since the best one that stand near a violation it added go back
  // where they were (the nearest if none does), the model is drawn again, three times wider; what is
  // still worse rolls back whole. Returns whether something was kept.
  auto judge = [&](const char* when) {
    Checkpoint c = checkpoint();
    const double kBlame = 0.5 * kNmPerMm;
    int tries = 0;
    for (; !betterThanBest(c) && tries < 3; ++tries) {
      auto added = addedViolations(best->drawn, best->violations, c.drawn, c.violations);
      std::vector<char> blamed(objs.size(), 0);
      bool any = false;
      const double blame = kBlame * (tries + 1);
      for (const DrcViolation& v : added) {
        std::array<int, 2> nets{itemNet(c.drawn, v.a), v.hasB ? itemNet(c.drawn, v.b) : kNoNet};
        size_t nearest = objs.size();
        double nd = std::numeric_limits<double>::max();
        bool hit = false;
        for (size_t k = 0; k < objs.size(); ++k) {
          const Owner& ow = t.owners[objs[k].owner];
          if ((ow.c - best->pos[k]).len() < 1 || blamed[k]) continue;
          double dist = (ow.c - v.pos).len();
          if (dist < nd) { nd = dist; nearest = k; }
          if (dist < blame || (dist < 3 * blame && std::ranges::contains(nets, ow.net))) { blamed[k] = 1; hit = any = true; }
        }
        if (!hit && nearest < objs.size()) { blamed[nearest] = 1; any = true; }
      }
      if (!any) break;
      for (size_t k = 0; k < objs.size(); ++k)
        if (blamed[k]) {
          moveOwner(t, objs[k].owner, best->pos[k] - t.owners[objs[k].owner].c);
          objs[k].scale = std::max(0.1, objs[k].scale * 0.6);
        }
      c = checkpoint();
    }
    const bool kept = betterThanBest(c);
    r.log.push_back(std::format("{}: {} conflict(s), {:.3f} mm short, {:.1f} mm, {} unrouted after {} blame round(s): {}", when, c.conflicts, c.depth / 1e6,
                                c.length / 1e6, c.unrouted, tries, kept ? "kept" : "rolled back"));
    if (kept) {
      best = std::move(c);
    } else {
      t = best->t;
      ++r.rollbacks;
      for (RelaxObj& ob : objs) ob.scale = std::max(0.1, ob.scale * 0.6);
    }
    grid.build(t);
    state = modelState(t, o.chords);
    copper = copperShort(objShort);
    return kept;
  };
  int clearRounds = o.clearRounds;
  int sinceCheckpoint = 0;
  bool wasClearing = clearRounds > 0;
  for (double tol = o.tol; tol >= o.floor; tol *= clearRounds > 0 ? (--clearRounds, 1.0) : 0.8, ++r.iterations) {
    const bool clearing = clearRounds > 0;
    // Checkpoints every so many iterations, and right after the clearing rounds.
    if (o.checkpointEvery > 0 && (sinceCheckpoint >= o.checkpointEvery || (wasClearing && !clearing && sinceCheckpoint > 0))) {
      sinceCheckpoint = 0;
      judge(std::format("checkpoint {}", r.iterations).c_str());
    }
    wasClearing = clearing;
    ++sinceCheckpoint;
    // Forces: off the copper a via is too close to; else towards the straight line of the wires through
    // the object and away from the tight edges at it.
    std::vector<Vec2> force(objs.size());
    for (size_t k = 0; k < objs.size(); ++k) {
      const Owner& ob = t.owners[objs[k].owner];
      const int oi = objs[k].owner;
      {
        CopperPush cp = copperPush(b, t, grid, oi, ob.c);
        if (cp.push.len() > 0) {
          force[k] = cp.push;
          continue;
        }
      }
      if (clearing) continue;
      Polyline qs;
      for (const Wire& w : t.wires)
        for (int end = 0; end < 2; ++end) {
          if (w.end[end] != oi) continue;
          const LayerMesh& m = *t.mesh(w.layer);
          if (w.cross.empty()) qs.push_back(m.verts[w.endVertex[1 - end]].p);
          else qs.push_back(state.pos[end == 0 ? w.cross.front() : w.cross.back()]);
        }
      Vec2 F{};
      if (qs.size() >= 2) F = qs.size() == 2 ? (qs[0] + qs[1]) * 0.5 - ob.c : geometricMedian(qs, ob.c) - ob.c;
      // The crowding: the edges at the object whose wires do not fit with the margin, each pulling
      // towards its far end by what is missing (the realiser's squeeze, eight times).
      Vec2 push{};
      for (const LayerMesh& m : t.layers) {
        if (oi >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[oi])
          for (int e : starEdges(m, v)) {
            const Edge& E = m.edges[e];
            if ((E.v[0] != v && E.v[1] != v) || E.cross.empty()) continue;
            EdgeCapacity c = edgeCapacity(t, m, e);
            if (c.slack >= kCapacityMargin || c.L <= 0) continue;
            Vec2 other = m.verts[E.v[0] == v ? E.v[1] : E.v[0]].p;
            push = push + (other - m.verts[v].p) / c.L * (kCapacityMargin - c.slack);
          }
      }
      force[k] = F - push * 8.0;
    }
    // Steps: Rprop scale, clipped to tol·scale, each checked against the copper around the new place.
    struct Step {
      size_t k;
      Vec2 d;
    };
    std::vector<Step> steps;
    for (size_t k = 0; k < objs.size(); ++k) {
      RelaxObj& ob = objs[k];
      Vec2 F = force[k];
      if (clearing && F.len() < 1000) continue;
      if (F.len() < 1000) {
        ob.lastForce = F;
        continue;
      }
      if (ob.lastForce.len() > 0) ob.scale = std::clamp(ob.scale * (F.dot(ob.lastForce) > 0 ? 1.5 : 0.6), 0.1, 4.0);
      ob.lastForce = F;
      double limit = tol * ob.scale;
      Vec2 delta = F.len() > limit ? F.normalized() * limit : F;
      if (delta.len() < 500) continue;
      std::optional<Vec2> use;
      const Vec2 at = t.owners[ob.owner].c;
      for (double f : {1.0, 0.5, 0.25}) {
        Vec2 d = delta * f;
        auto blk = blockerAt(b, t, grid, ob.owner, at + d);
        if (!blk) {
          use = d;
          break;
        }
        if (f == 1.0) {
          Vec2 n = at + d - *blk;
          if (n.len() > 1) {
            n = n.normalized();
            Vec2 tg{-n.y, n.x};
            Vec2 slide = tg * delta.dot(tg) * 0.9;
            if (slide.len() > 500 && !blockerAt(b, t, grid, ob.owner, at + slide)) {
              use = slide;
              break;
            }
          }
        }
      }
      if (use) steps.push_back({k, *use});
    }
    if (steps.empty()) {
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, nothing moved", r.iterations + 1, tol / kNmPerMm));
      continue;
    }
    // The steps go in and the model is judged: the steps at the edges whose shortfall grew (or at the
    // copper a via got closer to) stay out and the rest are tried again.
    const double costBefore = cost(state, copper);
    const Topology saved = t;
    std::vector<char> out(steps.size(), 0);
    bool taken = false;
    int tries = 0;
    double lastCost = costBefore;
    for (; tries < kTries; ++tries) {
      int moved = 0;
      for (size_t m = 0; m < steps.size(); ++m) {
        if (out[m]) continue;
        moveOwner(t, objs[steps[m].k].owner, steps[m].d);
        ++moved;
      }
      if (moved == 0) break;
      grid.build(t);
      ModelState now = modelState(t, o.chords);
      std::vector<double> nowShort(objs.size(), 0);
      double cu = copperShort(nowShort);
      lastCost = cost(now, cu);
      bool fine = clearing ? cu < copper - 1000 || (cu <= copper && lastCost <= costBefore) : lastCost <= costBefore + 1;
      if (fine) {
        state = std::move(now);
        copper = cu;
        objShort = std::move(nowShort);
        taken = true;
        break;
      }
      // Blame: the objects at the edges whose shortfall grew; the nearest step to the worst one if none.
      bool any = false;
      std::vector<char> blamed(t.owners.size(), 0);
      for (size_t li = 0; li < t.layers.size(); ++li) {
        const LayerMesh& m = t.layers[li];
        for (int e = 0; e < int(m.edges.size()); ++e) {
          size_t id = now.edgeBase[li] + e;
          double before = id < state.edgeDeficit.size() ? state.edgeDeficit[id] : 0;
          if (now.edgeDeficit[id] <= before + 1) continue;
          const Edge& E = m.edges[e];
          for (int v : E.v)
            if (v >= 0 && m.verts[v].owner >= 0) blamed[m.verts[v].owner] = 1;
        }
      }
      for (size_t oi = 0; oi < now.ownerDeficit.size(); ++oi)
        if (now.ownerDeficit[oi] > (oi < state.ownerDeficit.size() ? state.ownerDeficit[oi] : 0) + 1) blamed[oi] = 1;
      for (size_t m = 0; m < steps.size(); ++m)
        if (!out[m] && (blamed[objs[steps[m].k].owner] || nowShort[steps[m].k] > objShort[steps[m].k] + 1)) {
          out[m] = 1;
          any = true;
        }
      if (!any && clearing) break;
      if (!any) {
        // No edge to blame (the length grew, or vias sit closer to copper): the longest step goes.
        size_t worst = steps.size();
        double wl = 0;
        for (size_t m = 0; m < steps.size(); ++m)
          if (!out[m] && steps[m].d.len() > wl) {
            wl = steps[m].d.len();
            worst = m;
          }
        if (worst == steps.size()) break;
        out[worst] = 1;
      }
      t = saved;
    }
    if (!taken) {
      t = saved;
      grid.build(t);
      ++r.undoneIterations;
      for (RelaxObj& ob : objs) ob.scale = std::max(0.1, ob.scale * 0.6);
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} step(s) undone after {} tries (cost {:.1f} -> {:.1f} mm)", r.iterations + 1,
                                  tol / kNmPerMm, steps.size(), tries, costBefore / 1e6, lastCost / 1e6));
      continue;
    }
    int moved = 0;
    for (size_t m = 0; m < steps.size(); ++m) {
      RelaxObj& ob = objs[steps[m].k];
      if (out[m]) {
        ob.scale = std::max(0.1, ob.scale * 0.6);
        continue;
      }
      ++moved;
      if (t.owners[ob.owner].kind == Owner::Kind::Via) ++r.viaMoves;
      else ++r.junctionMoves;
    }
    r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} of {} step(s), length {:.1f} mm, shortfall {:.3f} mm", r.iterations + 1, tol / kNmPerMm,
                                moved, steps.size(), state.length / 1e6, (state.deficit + copper) / 1e6));
  }
  r.lengthAfter = state.length;
  r.deficitAfter = state.deficit + copper;
  if (o.checkpointEvery > 0 && o.draw) {
    // The last state against the best drawn one: the better of the two is the result.
    judge("final");
    t = std::move(best->tDrawn);
    b = std::move(best->drawn);
    r.conflictsAfter = best->conflicts;
    r.wires = int(t.wires.size());
    r.drawn = true;
  } else {
    // The board's vias follow their owners (on the files' 0.1 um grid).
    for (const Owner& ow : t.owners)
      if (ow.kind == Owner::Kind::Via && ow.via >= 0 && ow.via < int(b.vias.size()))
        b.vias[ow.via].pos = Point(Vec2{std::round(ow.c.x / 100) * 100, std::round(ow.c.y / 100) * 100});
    if (o.draw) {
      drawModel(b, t, true, r.stats, r.wires);
      r.drawn = true;
    }
  }
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow || v.kind == Violation::Kind::OutsideBoard) r.violations.push_back(v);
  return r;
}

std::vector<DrcViolation> topologyViolations(const Board& b, const Topology& t, const std::vector<Violation>& vs) {
  std::map<uint32_t, int> trackOfId;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[i].id) trackOfId[b.tracks[i].id] = i;
  auto trackOf = [&](int wire) -> std::optional<ItemRef> {
    if (wire < 0 || wire >= int(t.wires.size())) return std::nullopt;
    for (uint32_t id : t.wires[wire].tracks)
      if (auto it = trackOfId.find(id); it != trackOfId.end()) return ItemRef{ItemType::Track, it->second};
    return std::nullopt;
  };
  auto netOf = [&](int wire) { return wire >= 0 && wire < int(t.wires.size()) ? b.nets[t.wires[wire].net].name : std::string("?"); };
  std::vector<DrcViolation> out;
  for (const Violation& v : vs) {
    DrcViolation d;
    d.type = DrcViolation::Type::Topology;
    d.pos = v.pos;
    d.layer = v.layer;
    using K = Violation::Kind;
    switch (v.kind) {
      case K::Crossing: d.message = std::format("wires crossing: {} / {}", netOf(v.wireA), netOf(v.wireB)); break;
      case K::ThroughPad: d.message = std::format("wire {} through another net's copper", netOf(v.wireA)); break;
      case K::OutsideBoard: d.message = std::format("wire {} the mesh does not hold", netOf(v.wireA)); break;
      case K::Overflow: d.message = std::format("edge overflowing by {:.3f} mm", v.deficit / 1e6); break;
    }
    if (auto a = trackOf(v.wireA)) d.a = *a;
    if (auto c = trackOf(v.wireB)) {
      d.b = *c;
      d.hasB = true;
    } else if (v.kind == K::ThroughPad && v.owner >= 0 && v.owner < int(t.owners.size()) && t.owners[v.owner].pad >= 0) {
      d.b = ItemRef{ItemType::Pad, t.owners[v.owner].pad};
      d.hasB = true;
    }
    out.push_back(std::move(d));
  }
  return out;
}

}  // namespace xr::topo
