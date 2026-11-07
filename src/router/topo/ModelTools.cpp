#include "router/topo/ModelTools.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <print>
#include <cmath>
#include <map>
#include <optional>
#include <set>

#include "core/Connectivity.h"
#include "core/Prof.h"
#include "core/SpatialIndex.h"
#include "router/topo/ModelRelax.h"
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
  r.pair = w.net >= 0 && w.net < int(t.netPair.size()) ? t.netPair[size_t(w.net)] : -1;
  if (w.pair >= 0 && w.zip >= 0 && w.zip < int(b.zips.size())) {  // a pair's wire: drawn as its two conductors
    const ZippedWire& z = b.zips[size_t(w.zip)];
    r.zip = w.zip;
    r.pair = w.pair;
    r.condWidth = z.condWidth;
    r.netN = z.netN;
    r.pSide = z.pSide ? z.pSide : 1;
  }
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
    int k = int(r::find(E.cross, cid) - E.cross.begin());
    Slot s = slotOf(cap, k);
    Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
    double L = cap.L > 0 ? cap.L : 1;
    pts.push_back({U + (V - U) * (s.mid() / L), c.edge});
  }
  if (w.hasExit[1]) pts.push_back({w.exit[1]});
  pts.push_back({m.verts[w.endVertex[1]].p});
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
      if (t.own(m, v, w)) continue;
      Vec2 P = m.verts[v].p;
      const double rule = vertexClearance(t, m, v, w) + w.width / 2.0 + kRealizeMargin;
      const Shape shape = o.kind == Owner::Kind::Zone ? Shape::circle(P, 0) : o.shape;  // a zone's ring vertex: a bare point
      // Only where the chord comes within the rule of the vertex's copper. The stack radius is the
      // realiser's business: samples on it rounded neighbouring vertices into one another (a via row,
      // arcs of 2 mm overlapping, the sketch crossing itself).
      if (shape.distanceToSegment(x.p, y.p) >= rule) continue;
      // Along the copper's outline offset by the rule (a rectangle's corners rounded): a straight step
      // between two samples on it stays out of the copper.
      const Shape offset = shape.inflated(rule);
      Vec2 d1 = (x.p - P).normalized(), d2 = (y.p - P).normalized();
      double a1 = std::atan2(d1.y, d1.x), sweep = std::atan2(d1.cross(d2), d1.dot(d2));
      // Round the vertex on the side the chord passes it: the arc from d1 to d2 must go through the
      // direction of the chord's nearest point (the shorter way round may be the other side when the
      // chord nearly turns back on itself).
      {
        Vec2 foot = closestPointOnSegment(P, x.p, y.p);
        Vec2 df = foot - P;
        if (df.len() > 1 && shape.distance(foot) >= 0) {  // beside the copper; through it, the shorter way
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
  {
    ProfScope p("realize prep: sketches");
    for (int wi : chosen) wires.push_back(sketchOf(b, t, wi));
  }
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
    ProfScope p("realize prep: index");
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
  std::optional<ProfScope> phase;
  for (LayerId layer : layersUsed) {
    phase.emplace("realize prep: obstacles");
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
            ob.pts[id].round = o.shape.kind == Shape::Kind::Point;
            if (centre && o.shape.kind != Shape::Kind::Point) centreOf[x.owner] = id;
          }
          break;
        case Owner::Kind::Via:
          id = ob.add(x.p, o.halfWidth, clr, o.net);
          ob.pts[id].via = o.via;
          ob.pts[id].round = true;
          break;
        case Owner::Kind::Junction:
          id = ob.add(x.p, o.halfWidth, clr, o.net);
          ob.pts[id].round = true;
          break;
        case Owner::Kind::Outline: id = ob.add(x.p, 0, clr, kBoardEdge); break;
        case Owner::Kind::Keepout: id = ob.add(x.p, 0, 0, kBoardEdge); break;
        case Owner::Kind::Zone: id = ob.add(x.p, 0, clr, o.net); break;  // a bare point of the ring; the ring's pieces are sides
        case Owner::Kind::Clasp:  // the conductors' ends and the centre, round copper of their nets
          id = ob.add(x.p, o.halfWidth, clr, x.t < 0 ? o.net2 : o.net);
          ob.pts[id].round = true;
          ob.pts[id].pair = o.pair;
          ob.pts[id].claspCentre = x.t == 0;
          break;
      }
      if (id >= 0) ob.pts[id].owner = x.owner;
    }
    // The sides: a pad's perimeter between its corners (or its two ends), the outline and keepout pieces.
    for (const Edge& E : m.edges) {
      const Vertex& a = m.verts[E.v[0]];
      const Vertex& c = m.verts[E.v[1]];
      const Owner& oa = t.owners[a.owner];
      if (a.owner == c.owner) {
        if (oa.kind == Owner::Kind::Zone) {
          ob.side(E.v[0], E.v[1], 0);
          continue;
        }
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
    // A round wall (a hole, a round keepout) as one obstacle at its centre: round it as one arc.
    for (const RoundWall& rw : roundWalls(b, layer)) ob.pts[ob.add(rw.c, rw.r, rw.clr, kBoardEdge)].round = true;
    // The wires not drawn in this pass stay as they lie, and the realiser packs the edges with the wires it
    // draws only: their crossings are no slots to it, their tracks are its obstacles, as on the sketch path,
    // near the wires drawn (a locked wire; one not edited in an F5 of the edited ones; the rest when the
    // single wires at a turned clasp are drawn again). Two passes without this laid a 2 mm GND track of
    // AMK310 over a pair: 46 shorts.
    BBox region;
    for (int k = 0; k < NW; ++k)
      if (wires[k].layer == layer)
        for (Vec2 q : wires[k].sketch) region.add(q);
    region = region.inflated(3 * kNmPerMm);
    std::map<uint32_t, const Track*> trackById;
    for (const Track& tr : b.tracks)
      if (tr.id && tr.layer == layer) trackById[tr.id] = &tr;
    for (const Wire& w : t.wires) {
      if (w.layer != layer || localOf.contains(int(&w - t.wires.data()))) continue;
      for (uint32_t id : w.tracks)
        if (auto it = trackById.find(id); it != trackById.end()) {
          const Track& tr = *it->second;
          BBox tb;
          tb.add(tr.a.v());
          tb.add(tr.b.v());
          if (tr.mid) tb.add(tr.mid->v());
          if (!region.intersects(tb.inflated(tr.width))) continue;
          // An arc as its chain of points made a wire hugging it from outside bend round every point (a zipped
          // pair along a wide bend: 27 pieces of axis for 9). From outside it is one round obstacle, its circle to
          // the copper's outer edge, when no wire drawn goes inside that circle (the bend's inner side); its points
          // then are no more (on that circle, a path round it grazed them and bent round each again).
          // (Only for a wire not drawn this time: a locked one, a serpent, stays points, as F5 of the whole board
          // always had it — as discs they made AMK310's F5 34 violations worse.)
          if (tr.isArc() && !w.locked) {
            const ArcGeom g = ArcGeom::fromThreePoints(tr.a.v(), tr.mid->v(), tr.b.v());
            // (No wire drawn may run anywhere into that circle: its sketch's pieces nearer the centre than the
            // copper's outer edge — a disc round a serpent's loop or a short bend pushed the wires passing by.)
            const double outer = g.radius + tr.width / 2.0;
            bool inside = !g.valid;
            for (int k = 0; k < NW && !inside; ++k)
              if (wires[k].layer == layer)
                for (size_t q = 1; q < wires[k].sketch.size() && !inside; ++q)
                  inside = distPointSegment(g.center, wires[k].sketch[q - 1], wires[k].sketch[q]) < outer;
            if (!inside) {
              ob.add(g.center, outer, double(b.clearance(tr.net, layer)), tr.net);
              continue;
            }
          }
          ob.addTrack(tr, double(b.clearance(tr.net, layer)));
        }
    }
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
    phase.emplace("realize prep: crossings");
    auto& onEdge = in.edgeLists[layer];
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const Edge& E = m.edges[e];
      // (The capacity only of an edge a drawn wire crosses: a few wires drawn again took it of every edge.)
      if (r::none_of(E.cross, [&](int cid) { return localOf.contains(t.crossings[cid].wire); })) continue;
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
    // (The first edge of the mesh with the pair of vertices, found in one pass: a scan of all edges for
    // every crossed one was quadratic.)
    std::map<std::pair<int, int>, const Edge*> edgeOf;
    for (const Edge& E : m.edges)
      if (onEdge.contains({E.v[0], E.v[1]})) edgeOf.try_emplace({E.v[0], E.v[1]}, &E);
    for (auto& [uv, list] : onEdge) {
      auto found = edgeOf.find(uv);
      if (found == edgeOf.end()) continue;
      const Edge* E = found->second;
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
  phase.reset();
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

namespace {

// After a drawing: every clasp of a pair's wire drawn turns square to the wire's drawn end, so that its
// conductors' ends (the drawn axis's end offset either way along its normal) are its vertices again, and the
// single wires drawn from the vertices as they were follow them to the conductors' ends (a turn of the
// offset times the angle: tens of microns). A clasp that cannot turn (a locked single wire, the mesh in the
// way) keeps its place, and the conductors' ends go to its vertices instead.
std::vector<int> settleClasps(Board& b, Topology& t, const std::vector<int>& chosen) {
  std::vector<int> moved;  // the single wires whose start went with a turned clasp
  std::map<uint32_t, size_t> trackOf;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (b.tracks[i].id) trackOf[b.tracks[i].id] = i;
  auto moveEnds = [&](const std::vector<uint32_t>& ids, Vec2 from, Vec2 to) {
    if ((from - to).len2() < 1) return;
    for (uint32_t id : ids)
      if (auto it = trackOf.find(id); it != trackOf.end()) {
        Track& tr = b.tracks[it->second];
        if ((tr.a.v() - from).len() < 2000) tr.a = Point(to);
        if ((tr.b.v() - from).len() < 2000) tr.b = Point(to);
      }
  };
  for (int wi : chosen) {
    const Wire& w = t.wires[size_t(wi)];
    if (w.pair < 0 || w.zip < 0 || w.zip >= int(b.zips.size())) continue;
    const ZippedWire& z = b.zips[size_t(w.zip)];
    if (z.axis.empty()) continue;
    const double off = (double(z.condWidth) + double(z.gap)) / 2.0;
    const double side = z.pSide ? z.pSide : 1;
    LayerMesh& m = *t.mesh(w.layer);
    for (int end = 0; end < 2; ++end) {
      const int owner = w.end[end];
      if (t.owners[size_t(owner)].kind != Owner::Kind::Clasp) continue;
      const Track& piece = end ? z.axis.back() : z.axis.front();
      const Vec2 at = end ? piece.b.v() : piece.a.v();
      Vec2 travel;  // forward along the section at this end
      if (piece.mid) {
        const ArcGeom g = ArcGeom::fromThreePoints(piece.a.v(), piece.mid->v(), piece.b.v());
        const Vec2 rad = (at - g.center).normalized();
        travel = g.sweep > 0 ? rad.perp() : rad.perp() * -1.0;
      } else {
        travel = piece.b.v() - piece.a.v();
      }
      if (travel.len2() < 1) continue;
      const Vec2 n = travel.normalized().perp() * off * side;  // towards the positive conductor
      const Vec2 drawn[2] = {at - n, at + n};                 // the conductors' ends: [0] negative, [1] positive
      // The single wires at this clasp, per side.
      std::vector<int> singles[2];
      bool lockedSingle = false;
      for (int wj = 0; wj < int(t.wires.size()); ++wj) {
        const Wire& s = t.wires[size_t(wj)];
        if (s.pair >= 0) continue;
        for (int e = 0; e < 2; ++e)
          if (s.end[e] == owner) {
            singles[s.net == t.owners[size_t(owner)].net].push_back(wj);
            lockedSingle |= s.locked || !r::contains(chosen, wj);
          }
      }
      auto vertexPos = [&](int sd) {
        for (int v : m.ownerVerts[size_t(owner)])
          if ((sd ? m.verts[v].t > 0 : m.verts[v].t < 0)) return m.verts[v].p;
        return Vec2{};
      };
      const Vec2 was[2] = {vertexPos(0), vertexPos(1)};
      if (!lockedSingle && (n - t.owners[size_t(owner)].axis).len() > 1000) reshapeOwner(t, owner, n);
      for (int sd = 0; sd < 2; ++sd) {
        const Vec2 now = vertexPos(sd);
        moveEnds(w.tracks, drawn[sd], now);  // nothing when the turn was made in full
        if ((now - was[sd]).len() < 1000) continue;
        for (int wj : singles[sd]) {
          moveEnds(t.wires[size_t(wj)].tracks, was[sd], now);
          moved.push_back(wj);
        }
      }
    }
  }
  return moved;
}

}  // namespace

// Draws every unlocked wire of the model: their tracks go, and the hand-drawn runs inside the pads they
// end at (the wire is drawn to the pad's connection point); the locked ones stay as obstacles.
void drawModel(Board& b, Topology& t, bool direct, RealizeStats& stats, int& nWires, bool editedOnly, const std::vector<int>* only) {
  std::vector<int> chosen;
  std::set<uint32_t> gone;
  std::set<int> redrawnAt;
  std::set<uint32_t> edited;
  if (editedOnly)
    for (const Track& tr : b.tracks)
      if (tr.edited && tr.id) edited.insert(tr.id);
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked) continue;
    if (editedOnly && r::none_of(w.tracks, [&](uint32_t id) { return edited.contains(id); })) continue;
    if (only && !r::contains(*only, wi)) continue;
    chosen.push_back(wi);
    for (uint32_t id : w.tracks) gone.insert(id);
    redrawnAt.insert(w.end[0]);
    redrawnAt.insert(w.end[1]);
  }
  // Drawn part of the board: with them the wires sharing an edge with one (their stack on that edge is packed with
  // them, as F5 of the whole board packs it; left as they lay, they were obstacles of points the drawn wires
  // bent round one by one — a zipped pair along a bend: 18 pieces of axis for 9).
  if (editedOnly || only) {
    std::set<int> mine(chosen.begin(), chosen.end());
    std::vector<int> ring;
    for (int wi : chosen)
      for (int cid : t.wires[size_t(wi)].cross) {
        const Edge& E = t.mesh(t.wires[size_t(wi)].layer)->edges[size_t(t.crossings[size_t(cid)].edge)];
        for (int other : E.cross)
          if (const int wj = t.crossings[size_t(other)].wire; wj >= 0 && !t.wires[size_t(wj)].locked && mine.insert(wj).second) ring.push_back(wj);
      }
    for (int wi : ring) {
      chosen.push_back(wi);
      const Wire& w = t.wires[size_t(wi)];
      for (uint32_t id : w.tracks) gone.insert(id);
      redrawnAt.insert(w.end[0]);
      redrawnAt.insert(w.end[1]);
    }
    r::sort(chosen);
  }
  for (auto [owner, id] : t.ownerTracks)
    if (redrawnAt.contains(owner)) gone.insert(id);
  // The sketches here only for the drawing by the tracks (`direct` off) and the debugging output:
  // realizeFromModel makes its own (sketchOf was a tenth of F5, done twice).
  static const char* const kNear = std::getenv("XR_TOPO_NEAR");
  static const char* const kNet = std::getenv("XR_TOPO_NET");
  std::vector<RealWire> wires;
  if (!direct || kNear || kNet)
    for (int wi : chosen) wires.push_back(sketchOf(b, t, wi));
  if (const char* dbg = kNear) {
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
        int k2 = int(r::find(E.cross, cid) - E.cross.begin());
        std::print(stderr, " [({:.2f},{:.2f})-({:.2f},{:.2f}) {}/{}]", m.verts[E.v[0]].p.x / 1e6, m.verts[E.v[0]].p.y / 1e6, m.verts[E.v[1]].p.x / 1e6,
                   m.verts[E.v[1]].p.y / 1e6, k2, E.cross.size());
      }
      std::print(stderr, "\n  sketch:");
      for (Vec2 p : wires[k].sketch) std::print(stderr, " ({:.3f},{:.3f})", p.x / 1e6, p.y / 1e6);
      std::println(stderr, "");
    }
  }
  if (const char* dbg = kNet)
    for (size_t k = 0; k < wires.size(); ++k)
      if (b.nets[wires[k].net].name == dbg) {
        const Wire& w = t.wires[chosen[k]];
        std::print(stderr, "wire {} net {} L{} ends {} {} ({} crossings):", chosen[k], dbg, int(w.layer), w.end[0], w.end[1], w.cross.size());
        for (Vec2 p : wires[k].sketch) std::print(stderr, " ({:.3f},{:.3f})", p.x / 1e6, p.y / 1e6);
        std::println(stderr, "");
      }
  std::erase_if(b.tracks, [&](const Track& tr) { return tr.id && gone.contains(tr.id); });
  std::erase_if(t.ownerTracks, [&](const std::pair<int, uint32_t>& ot) { return gone.contains(ot.second); });  // or the model saved names tracks that are not there
  // (The zone fills stay: the model holds the poured zones as owners, and what lies in a pour is locked.)
  RealizeOptions opt;
  opt.tracksAsObstacles = true;
  opt.nominal = true;
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
  // The single wires at a clasp that turned were drawn round its ends as they were: drawn again from the turned
  // ones, the rest as they lie (a single of SCL at AMK310's clasp came 0.02 mm inside the rule from SDA's end).
  std::optional<ProfScope> ps(std::in_place, "draw: settle clasps");
  std::vector<int> again = settleClasps(b, t, chosen);
  r::sort(again);
  again.erase(std::unique(again.begin(), again.end()), again.end());
  if (!again.empty() && direct) {
    std::set<uint32_t> old;
    for (int wi : again)
      for (uint32_t id : t.wires[size_t(wi)].tracks) old.insert(id);
    std::erase_if(b.tracks, [&](const Track& tr) { return tr.id && old.contains(tr.id); });
    const size_t from = b.tracks.size();
    RealizeStats st2 = realizeFromModel(b, t, again, opt);
    Topology::assignIds(b);
    for (int wi : again) t.wires[size_t(wi)].tracks.clear();
    for (size_t k = 0; k < st2.trackWire.size(); ++k) t.wires[size_t(again[st2.trackWire[k]])].tracks.push_back(b.tracks[from + k].id);
  }
  ps.reset();
  nWires = int(chosen.size());
}

F5ModelResult runF5Model(Board& b, Topology& t, const F5ModelOptions& o) {
  ProfScope pAll("F5 model total");
  F5ModelResult r;
  if (!prepareModel(t, o.flips, o.weighted, r.flips, r.violations)) return r;
  // Edited only: the branch points at the edited wires' ends balance, their wires alone drawn (the rest of the
  // board stays as it lies).
  std::vector<int> balanced;
  if (o.editedOnly) {
    std::set<uint32_t> edited;
    for (const Track& tr : b.tracks)
      if (tr.edited && tr.id) edited.insert(tr.id);
    for (const Wire& w : t.wires)
      if (!w.locked && r::any_of(w.tracks, [&](uint32_t id) { return edited.contains(id); }))
        for (int e : w.end)
          if (e >= 0 && t.owners[size_t(e)].kind == Owner::Kind::Junction && !r::contains(balanced, e)) balanced.push_back(e);
  }
  drawModel(b, t, o.direct, r.stats, r.wires, o.editedOnly);
  r.drawn = true;
  if (o.junctions && o.direct && (!o.editedOnly || !balanced.empty()) &&
      r::any_of(t.owners, [](const Owner& x) { return x.kind == Owner::Kind::Junction && x.layers != 0 && !x.locked; })) {
    ProfScope p("F5 model: branch points");
    OptimizeModelOptions mo;
    mo.owners = balanced;
    mo.flips = false;
    mo.vias = false;
    mo.clasps = false;
    mo.merge = false;
    mo.hold = 3;
    mo.decay = 0.6;
    mo.floor = 0.05 * kNmPerMm;
    OptimizeModelResult jr = optimizeModel(b, t, mo);
    if (jr.drawn) {
      r.junctionMoves = jr.junctionMoves;
      r.stats = jr.stats;
    }
  }
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow || v.kind == Violation::Kind::OutsideBoard || v.kind == Violation::Kind::Blocked) r.violations.push_back(v);
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
  // The place the model names for a crossing is the edge where the order of the two wires turns, which may
  // be millimetres from where their tracks touch (MinVia_standard_routing, D4 through the pad of PA1: 7 mm).
  // With tracks on both sides, the mark goes where the two come nearest.
  auto polylines = [&](int wire, LayerId layer) {
    std::vector<Polyline> out;
    if (wire < 0 || wire >= int(t.wires.size())) return out;
    for (uint32_t id : t.wires[size_t(wire)].tracks)
      if (auto it = trackOfId.find(id); it != trackOfId.end() && b.tracks[it->second].layer == layer) out.push_back(b.tracks[it->second].path());
    return out;
  };
  auto nearest = [&](int wireA, int wireB, LayerId layer) -> std::optional<Vec2> {
    const std::vector<Polyline> pa = polylines(wireA, layer), pb = polylines(wireB, layer);
    double best = std::numeric_limits<double>::max();
    std::optional<Vec2> at;
    for (const Polyline& x : pa)
      for (size_t i = 0; i + 1 < x.size(); ++i)
        for (const Polyline& y : pb)
          for (size_t j = 0; j + 1 < y.size(); ++j) {
            const double dd = distSegmentSegment(x[i], x[i + 1], y[j], y[j + 1]);
            if (dd >= best) continue;
            best = dd;
            if (segmentsIntersect(x[i], x[i + 1], y[j], y[j + 1])) {
              const Vec2 r = x[i + 1] - x[i], s = y[j + 1] - y[j];
              const double den = r.cross(s);
              at = std::abs(den) > 1e-9 ? x[i] + r * ((y[j] - x[i]).cross(s) / den) : x[i];
            } else {
              // The nearest pair of points: one is an end of a segment, the other its foot on the other.
              Vec2 p = x[i], q = y[j];
              double dmin = std::numeric_limits<double>::max();
              for (Vec2 e : {x[i], x[i + 1]})
                if (const Vec2 f = closestPointOnSegment(e, y[j], y[j + 1]); (f - e).len() < dmin) dmin = (f - e).len(), p = e, q = f;
              for (Vec2 e : {y[j], y[j + 1]})
                if (const Vec2 f = closestPointOnSegment(e, x[i], x[i + 1]); (f - e).len() < dmin) dmin = (f - e).len(), p = f, q = e;
              at = (p + q) * 0.5;
            }
          }
    return at;
  };
  std::vector<DrcViolation> out;
  for (const Violation& v : vs) {
    DrcViolation d;
    d.type = DrcViolation::Type::Topology;
    d.pos = v.pos;
    d.layer = v.layer;
    using K = Violation::Kind;
    switch (v.kind) {
      case K::Crossing:
        d.message = std::format("wires crossing: {} / {}", netOf(v.wireA), netOf(v.wireB));
        if (auto p = nearest(v.wireA, v.wireB, v.layer)) d.pos = *p;
        break;
      case K::ThroughPad: d.message = std::format("wire {} through another net's copper", netOf(v.wireA)); break;
      case K::OutsideBoard: d.message = std::format("wire {} the mesh does not hold", netOf(v.wireA)); break;
      case K::Blocked: d.message = std::format("wire {} through a keepout, no way round", netOf(v.wireA)); break;
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
