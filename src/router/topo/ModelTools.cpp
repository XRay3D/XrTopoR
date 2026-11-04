#include "router/topo/ModelTools.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <print>
#include <cmath>
#include <map>
#include <set>

#include "core/Prof.h"
#include "topo/Capacity.h"
#include "topo/Flip.h"

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

F5ModelResult runF5Model(Board& b, Topology& t, const F5ModelOptions& o) {
  ProfScope pAll("F5 model total");
  F5ModelResult r;
  for (const Violation& v : t.violations)
    if (v.kind != Violation::Kind::Overflow) r.violations.push_back(v);
  if (!r.violations.empty()) return r;
  if (o.flips) {
    ProfScope p("F5 model: flips");
    for (LayerMesh& m : t.layers) r.flips += flipLoop(t, m);
  }
  {
    ProfScope p("F5 model: capacity");
    for (LayerMesh& m : t.layers)
      for (int e = 0; e < int(m.edges.size()); ++e)
        if (!m.edges[e].cross.empty()) refreshEdge(t, m, e);
  }
  // The wires to draw: every unlocked one. Their tracks go; the locked ones stay as obstacles.
  std::vector<int> chosen;
  std::set<uint32_t> gone;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[wi];
    if (w.locked) continue;
    chosen.push_back(wi);
    for (uint32_t id : w.tracks) gone.insert(id);
  }
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
    r.stats = realize(b, wires, {}, opt);
  }
  Topology::assignIds(b);
  for (int wi : chosen) t.wires[wi].tracks.clear();
  for (size_t k = 0; k < r.stats.trackWire.size(); ++k) {
    int wi = chosen[r.stats.trackWire[k]];
    t.wires[wi].tracks.push_back(b.tracks[before + k].id);
    t.wires[wi].dirty = false;
  }
  r.wires = int(wires.size());
  r.drawn = true;
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow) r.violations.push_back(v);
  return r;
}

}  // namespace xr::topo
