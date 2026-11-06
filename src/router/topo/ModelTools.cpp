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
    // A wire of an oval pad is laid from the pad's centre (TopoR: every wire ends at the centre of its pad):
    // the lead from the centre to the end vertex — the centre of the rounded end, the inner point of the
    // pattern — is drawn with the wire. It covers no crossing: the wire's crossings start beyond that vertex.
    for (size_t k = 0; k < wires.size(); ++k) {
      const Wire& w = t.wires[chosen[k]];
      const LayerMesh& m = *t.mesh(w.layer);
      for (int end = 0; end < 2; ++end) {
        const Owner& o = t.owners[w.end[end]];
        if (o.kind != Owner::Kind::Pad || o.shape.kind != Shape::Kind::Segment) continue;
        const Vec2 v = m.verts[w.endVertex[end]].p;
        if ((v - o.c).len() > 1) in.stubs[k][end] = Stub{o.c, v, v, true, 0};
      }
    }
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
  RealizeStats st = drawRealized(b, wires, {}, opt, in, RealizeStats{});
  // The wires' forces by owner: the push at the bends, and the pull at the ends.
  st.ownerForce = st.ownerPush;
  for (int k = 0; k < NW && k < int(st.endDir.size()); ++k)
    for (int end = 0; end < 2; ++end) {
      const int owner = t.wires[chosen[k]].end[end];
      if (owner >= 0) st.ownerForce[owner] = st.ownerForce[owner] + st.endDir[k][end];
    }
  return st;
}

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
