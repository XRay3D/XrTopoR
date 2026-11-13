// The board's tracks become wires of the model: chains of tracks (Chains.h) walked through the layer's
// mesh, their crossings ordered on every edge by the topology, the branch points and free ends made
// owners first. What cannot be laid as drawn is a violation: two wires crossing on a layer, a locked
// wire through another net's pad, a chain the mesh does not hold.
#include <algorithm>
#include <cstdlib>
#include <limits>
#include <map>
#include <optional>
#include <format>
#include <print>
#include <string>
#include <set>
#include <tuple>
#include <unordered_map>
#include <unordered_set>

#include "core/Edit.h"
#include "core/SpatialIndex.h"
#include "topo/Build.h"
#include "topo/Capacity.h"
#include "topo/Move.h"
#include "topo/Chains.h"
#include "topo/Relay.h"
#include "topo/Topology.h"

namespace xr::topo {

namespace {

struct Hit {
  int edge;
  double t;     // along v[0] -> v[1]
  bool uLeft;   // v[0] lies to the left of the direction of travel
  int wBack = -1, wFwd = -1;  // apex of the triangle left and of the one entered (-1: outside)
};

// The fan triangle of vertex v that the direction d leaves it through.
int fanTriangle(const LayerMesh& m, int v, Vec2 d) {
  Vec2 P = m.verts[v].p, Q = P + d;
  int any = -1;
  for (int t : m.verts[v].tris) {
    const Tri& T = m.tris[t];
    int i = m.localVertex(t, v);
    Vec2 a = m.verts[T.v[(i + 1) % 3]].p, c = m.verts[T.v[(i + 2) % 3]].p;
    if (orient(P, a, Q) >= 0 && orient(P, Q, c) >= 0) return t;
    any = t;
  }
  return any;
}

// Where a polyline from vertex v0 to vertex v1 crosses the edges of the mesh (cancelled back-and-forth
// crossings removed), as the realiser walks its sketches. Empty with `ok` false when the walk leaves
// the mesh; `wall` then names the constrained edge it stopped at (a keepout's wall, the outline, a
// cutout), or -1 when it failed otherwise.
std::vector<Hit> walk(const LayerMesh& m, int v0, int v1, const Polyline& sk, bool& ok, std::string* why, int* wall = nullptr) {
  std::vector<Hit> out;
  ok = true;
  if (wall) *wall = -1;
  if (sk.size() < 2) return out;
  auto fail = [&](std::string s) {
    ok = false;
    if (why) *why = std::move(s);
    return out;
  };
  int f = fanTriangle(m, v0, sk[1] - sk[0]);
  if (f < 0) return fail("no fan triangle at the start");
  auto P = [&](int v) { return m.verts[v].p; };
  for (size_t s = 1; s < sk.size(); ++s) {
    Vec2 p = sk[s - 1], q = sk[s];
    if ((q - p).len2() < 1) continue;
    int entry = -1;  // the edge entered by, per segment: the next segment may go back through it
    for (int guard = 0; guard < 100000; ++guard) {
      const Tri& T = m.tris[f];
      Vec2 a0 = P(T.v[0]), a1 = P(T.v[1]), a2 = P(T.v[2]);
      if (orient(a0, a1, q) >= 0 && orient(a1, a2, q) >= 0 && orient(a2, a0, q) >= 0) break;
      int exit = -1;
      for (int i = 0; i < 3 && exit < 0; ++i) {
        if (i == entry) continue;
        Vec2 a = P(T.v[(i + 1) % 3]), c = P(T.v[(i + 2) % 3]);
        double oa = orient(p, q, a), oc = orient(p, q, c);
        if (orient(a, c, q) < 0 && ((oa >= 0 && oc <= 0) || (oa <= 0 && oc >= 0))) exit = i;
      }
      if (exit < 0) return fail(std::format("stuck in triangle {} at segment {} after {} hits", f, s, out.size()));
      int e = T.e[exit];
      int n = T.nb[exit];
      if (n < 0) {  // a constrained edge, or the outside
        if (wall && m.edges[e].constrained) *wall = e;
        return fail(std::format("edge {} ({}) at segment {} after {} hits", e, m.edges[e].constrained ? "constrained" : "hull", s, out.size()));
      }
      const Edge& E = m.edges[e];
      Vec2 a = P(E.v[0]), c = P(E.v[1]);
      double den = (c - a).cross(q - p);
      double t = std::abs(den) > 0 ? (p - a).cross(q - p) / den : 0.5;
      bool uLeft = orient(p, q, a) > 0;
      int wBack = T.v[exit];
      int wFwd = m.tris[n].v[m.localEdge(n, e)];
      if (!out.empty() && out.back().edge == e) out.pop_back();  // went back
      else out.push_back({e, std::clamp(t, 0.0, 1.0), uLeft, wBack, wFwd});
      entry = m.localEdge(n, e);
      f = n;
    }
  }
  // Ends at the end vertex: the last triangle must be one of its fan.
  if (m.localVertex(f, v1) < 0) return fail(std::format("ended in triangle {} away from the end vertex after {} hits", f, out.size()));
  // A polyline leaving its vertex along a fan edge, or arriving along one, touches that edge at the
  // vertex: no crossing (the realiser strips the hits touching an end point too). Only at the ends of
  // the walk: a wire that wraps around its own via crosses the via's fan edges on the way.
  auto touches = [&](const Hit& h, int v) { return m.edges[h.edge].v[0] == v || m.edges[h.edge].v[1] == v; };
  while (!out.empty() && touches(out.front(), v0)) out.erase(out.begin());
  while (!out.empty() && touches(out.back(), v1)) out.pop_back();
  return out;
}

}  // namespace

std::vector<Violation> Topology::findCrossings(const LayerMesh& m) const {
  std::vector<Violation> out;
  std::set<std::pair<int, int>> crossed;
  auto report = [&](Violation v) {
    if (crossed.insert(std::minmax(v.wireA, v.wireB)).second) out.push_back(v);
  };
  // Two chords of different nets that interleave on a triangle's perimeter cross inside it (the router's
  // chordCrossings): a crossing the edge order alone does not show, when the two share no edge.
  {
    struct Chord { int wire; double s0, s1; };  // perimeter coordinates in [0, 3)
    std::vector<std::vector<Chord>> chordsOf(m.tris.size());
    auto coordOf = [&](int t, int cid) {  // a crossing on an edge of triangle t
      const Tri& T = m.tris[t];
      int e = crossings[cid].edge;
      int i = m.localEdge(t, e);
      int from = T.v[(i + 1) % 3];  // the edge runs from v[i+1] to v[i+2] along the perimeter
      const Edge& E = m.edges[e];
      int n = int(E.cross.size());
      int k = int(r::find(E.cross, cid) - E.cross.begin());
      double frac = (k + 1.0) / (n + 1.0);
      if (E.v[0] != from) frac = 1 - frac;
      return double((i + 1) % 3) + frac;
    };
    auto triOf = [&](int ca, int cb) {  // the triangle two consecutive crossings share
      const Edge& A = m.edges[crossings[ca].edge];
      const Edge& B = m.edges[crossings[cb].edge];
      for (int ta : A.t)
        if (ta >= 0 && (ta == B.t[0] || ta == B.t[1])) return ta;
      return -1;
    };
    auto endTri = [&](int cid, int vertex, double& coord) {  // the triangle of a wire's first/last crossing at its end vertex
      const Edge& E = m.edges[crossings[cid].edge];
      for (int t : E.t) {
        if (t < 0) continue;
        if (int i = m.localVertex(t, vertex); i >= 0) {
          coord = i;
          return t;
        }
      }
      return -1;
    };
    for (int wi = 0; wi < int(wires.size()); ++wi) {
      const Wire& w = wires[wi];
      if (w.layer != m.layer || w.cross.empty()) continue;
      for (size_t k = 0; k + 1 < w.cross.size(); ++k) {
        int t = triOf(w.cross[k], w.cross[k + 1]);
        if (t >= 0) chordsOf[t].push_back({wi, coordOf(t, w.cross[k]), coordOf(t, w.cross[k + 1])});
      }
      double c0, c1;
      if (int t = endTri(w.cross.front(), w.endVertex[0], c0); t >= 0) chordsOf[t].push_back({wi, c0, coordOf(t, w.cross.front())});
      if (int t = endTri(w.cross.back(), w.endVertex[1], c1); t >= 0) chordsOf[t].push_back({wi, coordOf(t, w.cross.back()), c1});
    }
    auto inside = [](double x, double a, double b) {  // x strictly between a and b along the circular perimeter
      if (a > b) std::swap(a, b);
      return x > a && x < b;
    };
    for (int t = 0; t < int(m.tris.size()); ++t) {
      const auto& cs = chordsOf[t];
      for (size_t i = 0; i < cs.size(); ++i)
        for (size_t j = i + 1; j < cs.size(); ++j) {
          const Chord& x = cs[i];
          const Chord& y = cs[j];
          if (wires[x.wire].net == wires[y.wire].net) continue;
          if (inside(y.s0, x.s0, x.s1) == inside(y.s1, x.s0, x.s1)) continue;
          Violation v;
          v.kind = Violation::Kind::Crossing;
          v.wireA = x.wire;
          v.wireB = y.wire;
          v.layer = m.layer;
          v.tri = t;
          v.pos = (m.verts[m.tris[t].v[0]].p + m.verts[m.tris[t].v[1]].p + m.verts[m.tris[t].v[2]].p) / 3.0;
          report(v);
        }
    }
  }
  // A wire of another net across the edge a wire runs along: the two cross.
  for (int e = 0; e < int(m.edges.size()); ++e) {
    const Edge& E = m.edges[e];
    if (E.along < 0) continue;
    for (int cid : E.cross) {
      int other = crossings[cid].wire;
      if (wires[other].net == wires[E.along].net) continue;
      Violation v;
      v.kind = Violation::Kind::Crossing;
      v.wireA = E.along;
      v.wireB = other;
      v.layer = m.layer;
      v.edge = e;
      v.pos = (m.verts[E.v[0]].p + m.verts[E.v[1]].p) * 0.5;
      report(v);
    }
  }
  return out;
}

std::vector<int> Topology::walkEdges(const LayerMesh& m, int v0, int v1, const Polyline& sk, bool& ok) const {
  std::vector<int> out;
  for (const Hit& h : walk(m, v0, v1, sk, ok, nullptr)) out.push_back(h.edge);
  return out;
}

namespace {

struct Laid {
  int wire;
  std::vector<Hit> hits;
  Vec2 from, to;
};

// One chain laid as a wire of the model: its ends' owners given (end0, end1), walked through its layer's mesh
// from the sketch of its path (bent out of other nets' copper), pushed onto the model's wires with its hits for
// the edges' order; nothing when it is no wire (no end owner, inside its own copper, a loop crossing nothing).
// zipIndex: the zipped section the chain is the pair's wire of, -1 none.
struct LayContext {
  const Board& b;
  const SpatialIndex& idx;
  std::map<LayerId, std::vector<int>> zonesOn;  // the poured zones' owners per layer
  std::vector<int>& displaced;                  // the wires walked through a keepout, to be laid round
  int noEnd = 0, insideOwn = 0, loops = 0;
};

std::optional<Laid> layChain(Topology& self, LayContext& x, const WireChain& c, int zipIndex, int end0, int end1) {
  const Board& b = x.b;
  LayerMesh* mp = self.mesh(c.layer);
  if (!mp) return std::nullopt;
  LayerMesh& m = *mp;
  Wire w;
  w.net = c.net;
  w.layer = c.layer;
  w.width = c.width;
  w.widthMin = std::min(c.width, b.minTrackWidth(c.net, c.layer));
  w.clr = b.clearance(c.net, c.layer);
  w.end[0] = end0;
  w.end[1] = end1;
  for (int ti : c.tracks) w.tracks.push_back(b.tracks[ti].id);
  w.locked = r::any_of(c.tracks, [&](int ti) { return b.tracks[ti].locked || b.tracks[ti].serp >= 0; });
  w.dirty = true;
  w.rerouted = c.rerouted;
  if (zipIndex >= 0) {  // the pair's wire: as wide as the pair, never narrower
    const ZippedWire& zip = b.zips[size_t(zipIndex)];
    w.pair = zip.pair;
    w.zip = zipIndex;
    w.widthMin = w.width;
    w.locked |= zip.fixed || r::any_of(zip.axis, [](const Track& t) { return t.serp >= 0; });
  }
  if (w.end[0] < 0 || w.end[1] < 0 || m.ownerVerts[w.end[0]].empty() || m.ownerVerts[w.end[1]].empty()) {
    ++x.noEnd;
    return std::nullopt;
  }
  // The sketch: from the end owner's vertex, through the path's points outside the own copper, to the
  // other's. A polygon connects at its centre (TopoR's connection point; the realiser draws the wire
  // from there, inside the copper): drawn to the corner nearest the path's end, the track's round end
  // stuck out of the pad into the gap beside it (arz_2L: 13 self.violations at one connector). An oval is
  // drawn to the end nearer the path's end (from the centre a wire ran the pad's length and out the other
  // end, 470 mm over arz_2L), the rest have one vertex.
  const Owner& o0 = self.owners[w.end[0]];
  const Owner& o1 = self.owners[w.end[1]];
  // In a pour nothing is touched (TopoR): a chain lying wholly inside a poured zone's outline on its
  // layer is locked whatever its net, one of another net that reaches into the pour too (the pour was made
  // round it). The self.wires of the zone's own net that cross its boundary are laid as any other: inside, the
  // zone's copper is their own.
  if (auto it = x.zonesOn.find(c.layer); it != x.zonesOn.end())
    for (int zo : it->second) {
      const Shape& zs = self.owners[zo].shape;
      size_t inside = 0;
      bool touches = false;
      for (Vec2 p : c.path) inside += zs.distance(p) <= 0;
      for (size_t k = 1; k < c.path.size() && !touches; ++k) touches = zs.distanceToSegment(c.path[k - 1], c.path[k]) <= 0;
      if (inside == c.path.size() || (c.net != self.owners[zo].net && (inside > 0 || touches))) {
        w.locked = true;
        w.zone = zo;
        break;
      }
    }
  // Where the path leaves each end's copper: the boundary point between the last point inside and the
  // first outside.
  for (int end = 0; end < 2; ++end) {
    const Owner& o = end ? o1 : o0;
    if (o.kind == Owner::Kind::Zone || o.kind == Owner::Kind::Clasp) continue;  // the wire ends on the zone's ring / at the clasp's vertex
    const Polyline& path = c.path;
    size_t n = path.size();
    for (size_t k = 1; k < n; ++k) {
      Vec2 in = end ? path[n - k] : path[k - 1], out = end ? path[n - 1 - k] : path[k];
      if (o.shape.contains(out)) continue;
      if (!o.shape.contains(in)) break;  // starts outside: no exit to speak of
      for (int it = 0; it < 30; ++it) {
        Vec2 mid = (in + out) * 0.5;
        (o.shape.contains(mid) ? in : out) = mid;
      }
      w.exit[end] = out;
      w.hasExit[end] = true;
      break;
    }
  }
  // An oval's end is chosen by where the path leaves the copper, not by where it ends inside it: a track
  // drawn to the pad's centre is as far from one end as from the other, and from the wrong one the wire
  // ran the pad's length through its own far end (Arcs_master: 30 self.violations on the first pass, 24 on
  // the next, when the drawn wire started at the right end).
  auto endVertexOf = [&](int owner, int end) {
    const Owner& o = self.owners[owner];
    if (o.kind == Owner::Kind::Clasp && w.pair >= 0)  // the pair's wire ends at the clasp's centre
      for (int v : m.ownerVerts[owner])
        if (m.verts[v].t == 0) return v;
    if (o.shape.kind == Shape::Kind::Polygon && o.kind != Owner::Kind::Zone)
      for (int v : m.ownerVerts[owner])
        if (m.verts[v].t == 0 && m.verts[v].off.len2() < 1) return v;
    // (A zone: the ring vertex nearest the path's end, or, for a path from outside, nearest where it enters.)
    Vec2 at = w.hasExit[end] ? w.exit[end] : end ? c.b() : c.a();
    if (o.kind == Owner::Kind::Zone)
      for (size_t k = 0; k < c.path.size(); ++k) {
        Vec2 p = end ? c.path[c.path.size() - 1 - k] : c.path[k];
        if (o.shape.distance(p) > 0) break;
        at = p;
      }
    return self.nearestVertex(m, owner, at);
  };
  int v0 = endVertexOf(w.end[0], 0), v1 = endVertexOf(w.end[1], 1);
  w.endVertex[0] = v0;
  w.endVertex[1] = v1;
  Polyline sk{m.verts[v0].p};
  // Through the exits: from the pad's centre straight to the first point outside, the walk cut across the
  // neighbouring pad where the tracks left near a corner.
  auto push = [&](Vec2 p) {
    if ((p - sk.back()).len2() >= 1) sk.push_back(p);
  };
  if (w.hasExit[0]) push(w.exit[0]);
  for (size_t k = 0; k < c.path.size(); ++k) {
    Vec2 p = c.path[k];
    if (o0.shape.contains(p) || o1.shape.contains(p)) continue;
    push(p);
  }
  if (w.hasExit[1]) push(w.exit[1]);
  push(m.verts[v1].p);
  // Through another net's copper: the sketch is bent out of it, at the point nearest that copper's
  // centre, unless the wire is locked where it lies.
  std::optional<ItemRef> through;
  for (int round = 0; round < 60 && !through; ++round) {
    bool bent = false;
    for (size_t k = 1; k < sk.size() && !bent && !through; ++k) {
      Vec2 p = sk[k - 1], q = sk[k];
      BBox box;
      box.add(p);
      box.add(q);
      x.idx.query(box.inflated(w.width), LayerMask(1) << c.layer, [&](ItemRef r) {
        if (bent || through || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) == c.net) return;
        for (const Shape& s : itemShapes(b, r)) {
          if (s.distanceToSegment(p, q) >= 0) continue;
          if (w.locked || round == 59) {
            through = r;
            return;
          }
          Vec2 at = closestPointOnSegment(s.center(), p, q);
          Vec2 n = at - s.center();
          if (n.len() < 1) n = (q - p).perp();
          if (n.len() < 1) n = {1, 0};
          n = n.normalized();
          Vec2 x = at;
          const double want = double(b.clearance(c.net, itemNet(b, r), c.layer)) + w.width / 2.0;
          for (int it = 0; it < 40 && s.distance(x) < want; ++it) x = x + n * (want - s.distance(x) + 100);
          sk.insert(sk.begin() + long(k), x);
          bent = true;
          return;
        }
      });
    }
    if (!bent) break;
  }
  if (through) {
    Violation v;
    v.kind = Violation::Kind::ThroughPad;
    v.wireA = int(self.wires.size());
    v.owner = through->type == ItemType::Pad ? self.padOwner[through->index] : self.viaOwner[through->index];
    v.layer = c.layer;
    v.pos = c.path[c.path.size() / 2];
    self.violations.push_back(v);
    w.locked = true;
  }
  // A chain lying wholly inside the copper it starts and ends on is that copper, not a wire (not in a
  // pour: the tracks there stay as they are, the zone owns none of them).
  if (w.end[0] == w.end[1] && o0.kind != Owner::Kind::Zone && sk.size() <= 2 && (sk.front() - sk.back()).len2() < 1) {
    ++x.insideOwn;
    for (int ti : c.tracks) self.ownerTracks.push_back({w.end[0], b.tracks[ti].id});
    return std::nullopt;
  }
  bool ok = true;
  std::string why;
  int wall = -1;
  // A wire locked in a pour that ends on the zone itself crosses nothing of the model (a chord across the
  // pour would take the room of its interior edges for nothing); one of another net is walked as any
  // other, the ring being crossable, and silently left without crossings where the walk fails.
  const bool inPour = w.zone >= 0 && (o0.kind == Owner::Kind::Zone || o1.kind == Owner::Kind::Zone);
  std::vector<Hit> hits = inPour ? std::vector<Hit>{} : walk(m, v0, v1, sk, ok, &why, &wall);
  if (!ok && w.zone >= 0) {
    ok = true;
    hits.clear();
  }
  // Out of its copper and back without crossing anything: that copper, not a wire.
  if (ok && hits.empty() && w.end[0] == w.end[1] && o0.kind != Owner::Kind::Zone) {
    ++x.loops;
    if (std::getenv("XR_TOPO_DEBUG") && x.loops <= 5)
      std::println(stderr, "loop: net {} L{} owner {} kind {} path {} points from ({:.3f},{:.3f}) to ({:.3f},{:.3f}), sketch {} points",
                   b.nets[c.net].name, int(c.layer), w.end[0], int(self.owners[w.end[0]].kind), c.path.size(), c.a().x / 1e6, c.a().y / 1e6,
                   c.b().x / 1e6, c.b().y / 1e6, sk.size());
    for (int ti : c.tracks) self.ownerTracks.push_back({w.end[0], b.tracks[ti].id});  // goes when the owner's self.wires are redrawn
    return std::nullopt;
  }
  // Nothing crossed between two different self.owners: the wire runs along the edge joining them.
  int along = -1;
  if (ok && hits.empty() && !inPour && w.zone < 0) {
    for (int t : m.verts[v0].tris) {
      int i = m.localVertex(t, v1);
      if (i < 0) continue;
      const Tri& T = m.tris[t];
      for (int k = 0; k < 3; ++k) {
        const Edge& E = m.edges[T.e[k]];
        if ((E.v[0] == v0 && E.v[1] == v1) || (E.v[0] == v1 && E.v[1] == v0)) along = T.e[k];
      }
    }
    if (along < 0) ok = false, why = "crosses nothing, and its ends are not joined by an edge";
  }
  int wi = int(self.wires.size());
  // Through a keepout (its wall, or an area's triangles), across a cutout, or out of the board and
  // back: the wire is displaced, to be laid round by relayDisplaced once the mesh holds the rest. A wire
  // locked where it lies, or one whose end is outside the board, stays: a violation.
  bool displaced = false;
  if (!w.locked) {
    const bool endsInside = !m.verts[v0].tris.empty() && !m.verts[v1].tris.empty();
    if (!ok) displaced = wall >= 0 && endsInside;
    else {
      auto blockedBeside = [&](int e) {
        const Edge& E = m.edges[e];
        return (E.t[0] >= 0 && m.tris[E.t[0]].blocked) || (E.t[1] >= 0 && m.tris[E.t[1]].blocked);
      };
      for (const Hit& h : hits) displaced |= blockedBeside(h.edge);
      if (hits.empty() && endsInside && sk.size() >= 2) {
        int f = fanTriangle(m, v0, sk[1] - sk[0]);
        displaced |= f >= 0 && m.tris[f].blocked;
      }
    }
  }
  if (displaced) {
    if (std::getenv("XR_TOPO_DEBUG"))
      std::println(stderr, "wire {} net {} L{} from ({:.3f},{:.3f}) to ({:.3f},{:.3f}) is displaced: {}", wi, b.nets[c.net].name, int(c.layer),
                   sk.front().x / 1e6, sk.front().y / 1e6, sk.back().x / 1e6, sk.back().y / 1e6, ok ? "through a keepout area" : why);
    x.displaced.push_back(wi);
    ok = true;
    hits.clear();
    along = -1;
  } else if (!ok) {
    if (std::getenv("XR_TOPO_DEBUG"))
      std::println(stderr, "wire {} net {} L{} from ({:.3f},{:.3f}) to ({:.3f},{:.3f}), {} points: {}", wi, b.nets[c.net].name, int(c.layer),
                   sk.front().x / 1e6, sk.front().y / 1e6, sk.back().x / 1e6, sk.back().y / 1e6, sk.size(), why);
    Violation v;
    v.kind = Violation::Kind::OutsideBoard;
    v.wireA = wi;
    v.layer = c.layer;
    v.pos = c.path[c.path.size() / 2];
    self.violations.push_back(v);
    w.locked = true;
    hits.clear();
  }
  if (along >= 0) m.edges[along].along = wi;
  self.wires.push_back(std::move(w));
  return Laid{wi, std::move(hits), m.verts[v0].p, m.verts[v1].p};
}

}  // namespace

namespace {

// The order of the wires on edge e: `list` (laid wire, hit), the entries from `firstNew` on put in among those
// before them by the topology — an insertion sort, the order being pairwise, not a key: two wires sharing an edge
// are ordered by where their paths part, the positions along the edge decide only where the topology does not.
// Forward and backward verdicts that disagree mean the sketches cross each other: a crossing (a pair once).
void orderOnEdge(Topology& self, const Board& b, const LayerMesh& m, const std::vector<Laid>& laid, int e,
                 std::vector<std::pair<int, int>>& list, size_t firstNew, std::set<std::pair<int, int>>& crossed) {
  auto hasVertex = [&](int e, int x) { return m.edges[e].v[0] == x || m.edges[e].v[1] == x; };
  auto crossPt = [&](const Hit& h) {
    const Edge& E = m.edges[h.edge];
    return m.verts[E.v[0]].p + (m.verts[E.v[1]].p - m.verts[E.v[0]].p) * h.t;
  };
  // +1: A nearer u of the edge shared by hits (A,i) and (B,j), -1: B nearer u, 0: unknown.
  auto side = [&](this auto&& self, int A, int i, int dA, int B, int j, int dB, int depth) -> int {
    if (depth > 64) return 0;
    const Hit& hA = laid[A].hits[i];
    const Hit& hB = laid[B].hits[j];
    int u = m.edges[hA.edge].v[0], v = m.edges[hA.edge].v[1];
    int w = dA > 0 ? hA.wFwd : hA.wBack;
    if (w < 0 || w != (dB > 0 ? hB.wFwd : hB.wBack)) return 0;
    int nA = i + dA, nB = j + dB;
    bool endA = nA < 0 || nA >= int(laid[A].hits.size()), endB = nB < 0 || nB >= int(laid[B].hits.size());
    if (!endA && !endB) {
      int eA = laid[A].hits[nA].edge, eB = laid[B].hits[nB].edge;
      if (eA == eB) {
        int sv = hasVertex(eA, u) ? u : v;  // the vertex the run keeps
        int r = self(A, nA, dA, B, nB, dB, depth + 1);
        if (r == 0) return 0;
        bool aNearS = (r > 0) == (m.edges[eA].v[0] == sv);  // r: A nearer eA.v[0]
        return aNearS == (sv == u) ? +1 : -1;
      }
      if (hasVertex(eA, u) && hasVertex(eB, v)) return +1;
      if (hasVertex(eA, v) && hasVertex(eB, u)) return -1;
      return 0;
    }
    auto endSide = [&](int X, int dX, int Y, int cY, int nY) -> int {  // X ends in the triangle, Y goes on
      Vec2 P = dX > 0 ? laid[X].to : laid[X].from;
      if ((P - m.verts[u].p).len2() < 1) return +1;
      if ((P - m.verts[v].p).len2() < 1) return -1;
      int eY = laid[Y].hits[nY].edge;
      if ((P - m.verts[w].p).len2() < 1) return hasVertex(eY, u) ? -1 : +1;
      Vec2 a = crossPt(laid[Y].hits[cY]), c = crossPt(laid[Y].hits[nY]);
      double o = orient(a, c, P), ou = orient(a, c, m.verts[u].p);
      if (o == 0 || ou == 0) return 0;
      return (o > 0) == (ou > 0) ? +1 : -1;
    };
    if (endA && !endB) return endSide(A, dA, B, j, nB);
    if (endB && !endA) return -endSide(B, dB, A, i, nA);
    return hA.t < hB.t ? +1 : hA.t > hB.t ? -1 : 0;
  };
  auto before = [&](std::pair<int, int> a, std::pair<int, int> c) {
    const Hit& hA = laid[a.first].hits[a.second];
    const Hit& hB = laid[c.first].hits[c.second];
    int dB = hA.uLeft == hB.uLeft ? +1 : -1;
    int f = side(a.first, a.second, +1, c.first, c.second, dB, 0);
    int bk = side(a.first, a.second, -1, c.first, c.second, -dB, 0);
    if (f != 0 && bk != 0 && f != bk) {
      int wa = laid[a.first].wire, wb = laid[c.first].wire;
      if (self.wires[wa].net != self.wires[wb].net && crossed.insert(std::minmax(wa, wb)).second) {
        Violation v;
        v.kind = Violation::Kind::Crossing;
        v.wireA = wa;
        v.wireB = wb;
        v.layer = m.layer;
        v.edge = e;
        v.pos = (crossPt(hA) + crossPt(hB)) * 0.5;
        self.violations.push_back(v);
      }
      return hA.t < hB.t;
    }
    int r = f != 0 ? f : bk;
    if (r != 0 && (r > 0) != (hA.t < hB.t) && std::getenv("XR_TOPO_DEBUG")) {
      const Edge& E = m.edges[e];
      std::println(stderr, "order against geometry on layer {} edge {} ({:.3f},{:.3f})-({:.3f},{:.3f}): {} (t {:.3f}, {}/{}) vs {} (t {:.3f}, {}/{}): fwd {} back {}",
                   int(m.layer), e, m.verts[E.v[0]].p.x / 1e6, m.verts[E.v[0]].p.y / 1e6, m.verts[E.v[1]].p.x / 1e6, m.verts[E.v[1]].p.y / 1e6,
                   b.nets[self.wires[laid[a.first].wire].net].name, hA.t, a.second, laid[a.first].hits.size(),
                   b.nets[self.wires[laid[c.first].wire].net].name, hB.t, c.second, laid[c.first].hits.size(), f, bk);
    }
    return r != 0 ? r > 0 : hA.t < hB.t;
  };
  for (size_t k = std::max<size_t>(firstNew, 1); k < list.size(); ++k)
    for (size_t q = k; q > 0 && before(list[q], list[q - 1]); --q) std::swap(list[q], list[q - 1]);
}

}  // namespace

void Topology::convertWires(const Board& b, BuildScratch& scratch) {
  // A track lying exactly on another of its net and layer (a file with its routing written twice; P-CAD designs
  // have a few of their own) is that track's twin: no wire of its own — two wires on one path are pushed a
  // clearance apart by the first F5, the board comes out with every wire doubled — but listed with the other's
  // wire, so that it goes when the wire is redrawn. Of twins the widest is the track.
  std::vector<int> twinOf(b.tracks.size(), -1);
  twins = 0;
  {
    using Key = std::tuple<LayerId, int, Coord, Coord, Coord, Coord, bool, Coord, Coord>;
    std::map<Key, int> first;
    for (int i = 0; i < int(b.tracks.size()); ++i) {
      const Track& tr = b.tracks[size_t(i)];
      if (tr.zip >= 0 || tr.serp >= 0) continue;
      Point lo = tr.a, hi = tr.b;
      if (std::pair{hi.x, hi.y} < std::pair{lo.x, lo.y}) std::swap(lo, hi);
      const Point mid = tr.mid.value_or(Point{});
      auto [it, fresh] = first.try_emplace(Key{tr.layer, tr.net, lo.x, lo.y, hi.x, hi.y, tr.mid.has_value(), mid.x, mid.y}, i);
      if (fresh) continue;
      if (b.tracks[size_t(it->second)].width < tr.width) {  // the wider one is the track, the other its twin
        twinOf[size_t(it->second)] = i;
        it->second = i;
      } else {
        twinOf[size_t(i)] = it->second;
      }
      ++twins;
    }
  }
  auto twinRoot = [&](int i) {
    while (twinOf[size_t(i)] >= 0) i = twinOf[size_t(i)];
    return i;
  };
  std::vector<char> all(b.tracks.size(), 1);
  for (size_t i = 0; i < all.size(); ++i) all[i] = twinOf[i] < 0;
  WireGraph g = wireGraph(b, all);
  OwnCopper copper(b);
  effectiveWidths(b, g, copper);
  std::vector<WireChain> chains = wireChains(b, g, all, copper);
  if (twins > 0) {
    std::vector<int> chainOf(b.tracks.size(), -1);
    for (int ci = 0; ci < int(chains.size()); ++ci)
      for (int ti : chains[size_t(ci)].tracks) chainOf[size_t(ti)] = ci;
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (twinOf[size_t(i)] >= 0)
        if (int ci = chainOf[size_t(twinRoot(i))]; ci >= 0) chains[size_t(ci)].tracks.push_back(i);
  }
  std::erase_if(chains, [](const WireChain& c) { return c.closed || c.path.size() < 2; });
  // The zipped sections of the differential pairs: one chain each, the axis as its path (the pair's one wire,
  // as wide as the pair), the conductors as its tracks.
  std::vector<int> chainZip(chains.size(), -1);
  for (int z = 0; z < int(b.zips.size()); ++z) {
    const ZippedWire& zip = b.zips[size_t(z)];
    if (zip.axis.empty() || zip.netP < 0 || zip.netN < 0) continue;
    WireChain c;
    c.layer = zip.layer;
    c.net = zip.netP;
    c.width = zip.width();
    for (const Track& t : zip.axis)
      for (Vec2 p : t.path(20000))
        if (c.path.empty() || (p - c.path.back()).len2() >= 1) c.path.push_back(p);
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (b.tracks[i].zip == z) c.tracks.push_back(int(i));
    if (c.path.size() < 2) continue;
    chains.push_back(std::move(c));
    chainZip.push_back(z);
  }
  // The double crossings of wires taken apart, before their ends and walks (untangleChains: a wire
  // drawn across two others and back lies beside them; a locked one, a pair's, stays as drawn).
  {
    std::vector<char> eligible(chains.size(), 0);
    for (size_t ci = 0; ci < chains.size(); ++ci)
      eligible[ci] = chainZip[ci] < 0 && r::none_of(chains[ci].tracks, [&](int ti) { return b.tracks[size_t(ti)].locked || b.tracks[size_t(ti)].serp >= 0; });
    untangled = untangleChains(chains, eligible);
  }
  // The clasps («замки») at the sections' ends: three vertices across the pair, the conductors' free ends
  // nearest the axis end (where the single wires to the pads start, exactly as the tracks have them) and the
  // centre between them (where the pair's wire ends).
  std::map<int, std::array<int, 2>> claspOf;  // zip -> owners at its start and end
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    if (chainZip[ci] < 0) continue;
    const WireChain& c = chains[ci];
    const ZippedWire& zip = b.zips[size_t(chainZip[ci])];
    for (int end = 0; end < 2; ++end) {
      const Vec2 at = end ? c.b() : c.a();
      Vec2 pt[2] = {at, at};  // [0]: the negative net's conductor end, [1]: the positive's
      for (int side = 0; side < 2; ++side) {
        const int net = side ? zip.netP : zip.netN;
        double best = 1e300;
        for (int ti : c.tracks) {
          const Track& t = b.tracks[size_t(ti)];
          if (t.net != net) continue;
          for (Vec2 q : {t.a.v(), t.b.v()})
            if (double d = (q - at).len(); d < best) best = d, pt[side] = q;
        }
      }
      Owner o;
      o.kind = Owner::Kind::Clasp;
      o.c = (pt[0] + pt[1]) * 0.5;
      o.axis = (pt[1] - pt[0]) * 0.5;
      o.halfWidth = zip.condWidth / 2.0;
      o.shape = Shape::capsule(pt[0], pt[1], o.halfWidth);
      o.net = zip.netP;
      o.net2 = zip.netN;
      o.layers = LayerMask(1) << zip.layer;
      o.pair = zip.pair;
      o.zip = chainZip[ci];
      o.claspEnd = end;
      owners.push_back(std::move(o));
      scratch.corners.emplace_back();
      claspOf[chainZip[ci]][size_t(end)] = int(owners.size() - 1);
    }
  }
  // A single wire's end at a clasp: the conductor end of its net, within the join tolerance.
  auto claspAt = [&](Vec2 p, int net, LayerId layer, Coord width) {
    const double tol = std::max(edit::kJoinTol, 0.1 * double(width));
    for (auto& [z, ends2] : claspOf)
      for (int oi : ends2) {
        const Owner& o = owners[size_t(oi)];
        if (!((o.layers >> layer) & 1)) continue;
        if (o.net == net && (o.c + o.axis - p).len() <= tol) return oi;
        if (o.net2 == net && (o.c - o.axis - p).len() <= tol) return oi;
      }
    return -1;
  };
  ownerTracks.clear();
  // The ends: a pad or via of the net, or else a branch point or free end — a junction owner there.
  struct End {
    int owner = -1;
  };
  std::vector<std::array<End, 2>> ends(chains.size());
  // Keyed by the wire graph's glued vertex: the ends of the chains meeting at a branch point lie within
  // the glue of each other (a 50 um track between two of them on Arcs_master), one junction for all.
  std::map<std::tuple<int, LayerId, int>, int> junctionAt;
  // ... and the pad or via a chain ends on, by the same vertex (for the tiny tracks glued into it, below).
  std::map<std::tuple<int, LayerId, int>, int> copperAt;
  // The poured zones of a layer, as owners; a chain's end in one of its net is the zone's.
  std::map<LayerId, std::vector<int>> zonesOn;
  for (int zo : scratch.zoneOwner)
    if (zo >= 0) zonesOn[b.zones[owners[zo].zone].layer].push_back(zo);
  auto zoneAt = [&](Vec2 p, int net, LayerId layer) {
    if (auto it = zonesOn.find(layer); it != zonesOn.end())
      for (int zo : it->second)
        if (owners[zo].net == net && owners[zo].shape.distance(p) <= edit::kJoinTol) return zo;
    return -1;
  };
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    const WireChain& c = chains[ci];
    if (chainZip[ci] >= 0) {
      ends[ci][0].owner = claspOf[chainZip[ci]][0];
      ends[ci][1].owner = claspOf[chainZip[ci]][1];
      continue;
    }
    for (int end = 0; end < 2; ++end) {
      Vec2 p = end ? c.b() : c.a();
      if (auto r = copper.at(p, c.net, c.layer)) {
        ends[ci][end].owner = r->type == ItemType::Pad ? padOwner[r->index] : viaOwner[r->index];
        copperAt.try_emplace(std::tuple{c.vertex[end], c.layer, c.net}, ends[ci][end].owner);
        continue;
      }
      if (int co = claspAt(p, c.net, c.layer, c.width); co >= 0) {
        ends[ci][end].owner = co;
        continue;
      }
      if (int zo = zoneAt(p, c.net, c.layer); zo >= 0) {
        ends[ci][end].owner = zo;
        continue;
      }
      auto key = std::tuple{c.vertex[end], c.layer, c.net};
      auto it = junctionAt.find(key);
      if (it == junctionAt.end()) {
        Owner o;
        o.kind = Owner::Kind::Junction;
        o.net = c.net;
        o.c = p;
        o.halfWidth = c.width / 2.0;
        o.shape = Shape::circle(p, o.halfWidth);
        o.layers = LayerMask(1) << c.layer;
        o.junction = int(junctions.size());
        owners.push_back(o);
        scratch.corners.emplace_back();
        junctions.push_back({p, c.net, c.layer, int(owners.size() - 1), 0});
        it = junctionAt.emplace(key, int(owners.size() - 1)).first;
      }
      Owner& o = owners[it->second];
      o.halfWidth = std::max(o.halfWidth, c.width / 2.0);
      o.shape = Shape::circle(o.c, o.halfWidth);
      ++junctions[o.junction].degree;
      ends[ci][end].owner = it->second;
    }
  }
  // The tiny tracks at a branch point (glued into its vertex, in no chain) are the junction's: they go
  // when its wires are redrawn, or they would be left behind by a move. Those at a pad or a via a wire ends on
  // are that copper's likewise: P-CAD ends a track half a micrometre off its via's centre and joins the two with a
  // track of that length — nobody's, it stayed where the via stood when the via stepped, an island of its net
  // (RMT19M_A8SWA_V5: a connection lost in F7), and stayed loose when the wire was drawn to the centre (the loader
  // then took it for junk, and the board read was not the board written: its model file stale).
  auto ownerOfTiny = [&](size_t i) {
    const Track& tr = b.tracks[i];
    const auto key = std::tuple{g.vid[i][0], tr.layer, tr.net};
    if (auto it = junctionAt.find(key); it != junctionAt.end()) return it->second;
    if (auto it = copperAt.find(key); it != copperAt.end()) return it->second;
    return -1;
  };
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!g.relevant[i] || !g.tiny[i]) continue;
    if (const int o = ownerOfTiny(i); o >= 0) ownerTracks.push_back({o, b.tracks[i].id});
  }
  for (int i = 0; i < int(b.tracks.size()); ++i) {  // ... and their twins
    if (twinOf[size_t(i)] < 0) continue;
    const size_t root = size_t(twinRoot(i));
    if (!g.relevant[root] || !g.tiny[root]) continue;
    if (const int o = ownerOfTiny(root); o >= 0) ownerTracks.push_back({o, b.tracks[size_t(i)].id});
  }
  buildMeshes(b, scratch);

  // The copper of the other nets, for pushing a wire out of a pad it was drawn through.
  SpatialIndex idx;
  idx.build(b, false, false);
  const double kJoin = 1000;
  wires.clear();
  crossings.clear();
  std::vector<std::vector<Laid>> laidOn(layers.size());
  LayContext lay{b, idx, zonesOn, scratch.displaced};
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    const LayerMesh* mp = mesh(chains[ci].layer);
    if (!mp) continue;
    if (auto l = layChain(*this, lay, chains[ci], chainZip[ci], ends[ci][0].owner, ends[ci][1].owner))
      laidOn[size_t(mp - layers.data())].push_back(std::move(*l));
  }
  const int noEnd = lay.noEnd, insideOwn = lay.insideOwn, loops = lay.loops;

  if (std::getenv("XR_TOPO_DEBUG"))
    std::println(stderr, "{} chains: {} wires, {} without an end owner, {} inside their own copper, {} loops without crossings",
                 chains.size(), wires.size(), noEnd, insideOwn, loops);
  // The order of the wires on every edge comes from the topology first (Realizer.cpp): two wires
  // sharing an edge are ordered by where their paths part; the positions along the edge decide only
  // where the topology does not. Forward and backward verdicts that disagree mean the sketches cross
  // each other: a topological crossing.
  for (size_t li = 0; li < layers.size(); ++li) {
    LayerMesh& m = layers[li];
    std::vector<Laid>& laid = laidOn[li];
    std::map<int, std::vector<std::pair<int, int>>> onEdge;  // edge -> (laid index, hit index)
    for (int k = 0; k < int(laid.size()); ++k)
      for (int h = 0; h < int(laid[k].hits.size()); ++h) onEdge[laid[k].hits[h].edge].push_back({k, h});
    std::set<std::pair<int, int>> crossed;  // wire pairs reported
    for (auto& [e, list] : onEdge) orderOnEdge(*this, b, m, laid, e, list, 1, crossed);
    // The crossing records, in edge order; the wires' lists in path order.
    std::vector<std::vector<int>> wireCross(laid.size());
    for (size_t k = 0; k < laid.size(); ++k) wireCross[k].assign(laid[k].hits.size(), -1);
    for (auto& [e, list] : onEdge)
      for (auto [k, h] : list) {
        int cid = int(crossings.size());
        crossings.push_back({laid[k].wire, e, h, double(wires[laid[k].wire].width)});
        m.edges[e].cross.push_back(cid);
        wireCross[k][h] = cid;
      }
    for (size_t k = 0; k < laid.size(); ++k) wires[laid[k].wire].cross = std::move(wireCross[k]);
    for (int e = 0; e < int(m.edges.size()); ++e)
      if (!m.edges[e].cross.empty()) refreshEdge(*this, m, e);
    for (Violation v : findCrossings(m))
      if (crossed.insert(std::minmax(v.wireA, v.wireB)).second) violations.push_back(v);
    // A crossing of an edge with no room at all, at another net's copper: the wire runs through it.
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const Edge& E = m.edges[e];
      if (E.cls != 3) continue;
      for (int cid : E.cross) {
        const Wire& w = wires[crossings[cid].wire];
        if (w.zone >= 0) continue;  // locked in a pour: the zone's interior edges have no room by rule, it lies there all the same
        for (int end = 0; end < 2; ++end) {
          const Owner& o = owners[m.verts[E.v[end]].owner];
          if (own(m, E.v[end], w) || o.kind == Owner::Kind::Junction) continue;
          // At a wall (the board edge, a keepout) no room is an overflow, not a wire through copper: F5
          // goes on and lays the wire tight, the DRC names the clearance to the edge (a board moved whole
          // against its outline stopped at three such places).
          if (o.kind == Owner::Kind::Outline || o.kind == Owner::Kind::Keepout) {
            Violation v;
            v.kind = Violation::Kind::Overflow;
            v.layer = m.layer;
            v.edge = e;
            v.pos = (m.verts[E.v[0]].p + m.verts[E.v[1]].p) * 0.5;
            v.deficit = E.need - E.freeLen;
            violations.push_back(v);
            break;
          }
          Violation v;
          v.kind = Violation::Kind::ThroughPad;
          v.wireA = crossings[cid].wire;
          v.owner = m.verts[E.v[end]].owner;
          v.layer = m.layer;
          v.edge = e;
          v.pos = (m.verts[E.v[0]].p + m.verts[E.v[1]].p) * 0.5;
          violations.push_back(v);
          break;
        }
      }
    }
    for (int e = 0; e < int(m.edges.size()); ++e)
      if (m.edges[e].cls == 2) {
        // (Only locked wires there, a pad of another net inside a pour: nothing will move, nothing to report.)
        if (r::all_of(m.edges[e].cross, &Wire::locked, [&](int cid) -> auto& { return wires[crossings[cid].wire]; })) continue;
        Violation v;
        v.kind = Violation::Kind::Overflow;
        v.layer = m.layer;
        v.edge = e;
        v.pos = (m.verts[m.edges[e].v[0]].p + m.verts[m.edges[e].v[1]].p) * 0.5;
        v.deficit = m.edges[e].need - m.edges[e].freeLen;
        violations.push_back(v);
      }
  }
  (void)kJoin;
  // A track is one owner's, once: a tiny one glued at a branch point is listed there and again with the chain
  // it is glued into when that chain is its end's copper (the model file names a track by its content, and a
  // board has one track for the two).
  {
    std::set<uint32_t> seen;
    std::erase_if(ownerTracks, [&](const std::pair<int, uint32_t>& ot) { return !seen.insert(ot.second).second; });
  }
}

// A wire drawn through a keepout (an area or a line), across a cutout, or out of the board and back is
// laid round by the shortest way the mesh has for it (findRelay tries both ways round and takes the
// shorter), as TopoR does not: there the error 5031 stands until the wire is moved out by hand. No way
// round: the wire stays where it was drawn, locked, with a Blocked violation.
void Topology::relayDisplaced(const Board& b, BuildScratch& scratch) {
  // The wide ones first: they need the room, the thin ones squeeze in beside them.
  r::stable_sort(scratch.displaced, std::greater{}, [&](int i) { return wires[i].width; });
  for (int wi : scratch.displaced) {
    Wire& w = wires[wi];
    auto p = findRelay(*this, wi);
    if (!p) p = findRelay(*this, wi, nullptr, nullptr, true);  // no way with room: squeezed in beside the others
    if (p) {
      applyRelay(*this, wi, *p);
      continue;
    }
    if (std::getenv("XR_TOPO_DEBUG"))
      std::println(stderr, "wire {} net {} L{}: no way round the keepout", wi, b.nets[w.net].name, int(w.layer));
    Violation v;
    v.kind = Violation::Kind::Blocked;
    v.wireA = wi;
    v.layer = w.layer;
    const LayerMesh& m = *mesh(w.layer);
    v.pos = (m.verts[w.endVertex[0]].p + m.verts[w.endVertex[1]].p) * 0.5;
    if (!w.tracks.empty())
      for (const Track& tr : b.tracks)
        if (tr.id == w.tracks[w.tracks.size() / 2]) {
          v.pos = (tr.a.v() + tr.b.v()) * 0.5;
          break;
        }
    violations.push_back(v);
    w.locked = true;
  }
}


bool Topology::relayTracks(const Board& b, const std::vector<uint32_t>& changedIds) {
  const std::unordered_set<uint32_t> changed(changedIds.begin(), changedIds.end());
  std::unordered_map<uint32_t, int> trackOf, wireOf;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[size_t(i)].id) trackOf[b.tracks[size_t(i)].id] = i;
  for (int wi = 0; wi < int(wires.size()); ++wi)
    for (uint32_t id : wires[size_t(wi)].tracks) wireOf[id] = wi;
  // The nets touched; a zipped pair's copper is the build's (its axis is its wire).
  std::set<int> nets;
  for (uint32_t id : changed) {
    if (auto it = trackOf.find(id); it != trackOf.end()) {
      if (b.tracks[size_t(it->second)].zip >= 0) return false;
      nets.insert(b.tracks[size_t(it->second)].net);
    }
    if (auto it = wireOf.find(id); it != wireOf.end()) {
      if (wires[size_t(it->second)].pair >= 0) return false;
      nets.insert(wires[size_t(it->second)].net);
    }
  }
  if (nets.empty()) return true;
  std::unordered_set<uint32_t> ids = changed;
  std::set<int> out;
  auto takeOut = [&](int wi) {
    if (wires[size_t(wi)].pair >= 0) return false;
    if (out.insert(wi).second) {
      nets.insert(wires[size_t(wi)].net);
      for (uint32_t id : wires[size_t(wi)].tracks) ids.insert(id);
    }
    return true;
  };
  for (uint32_t id : changed)
    if (auto it = wireOf.find(id); it != wireOf.end() && !takeOut(it->second)) return false;
  // ... and with a wire taken out the wires at its branch points (a branch taken away joins the two through it).
  for (int w : std::set<int>(out))
    for (int o : wires[size_t(w)].end)
      if (o >= 0 && owners[size_t(o)].kind == Owner::Kind::Junction)
        for (int wj = 0; wj < int(wires.size()); ++wj)
          if ((wires[size_t(wj)].end[0] == o || wires[size_t(wj)].end[1] == o) && !takeOut(wj)) return false;
  OwnCopper copper(b);
  WireGraph g;
  std::vector<WireChain> chains;
  std::vector<char> take;
  std::vector<std::array<int, 2>> ends;
  auto claspAt = [&](Vec2 p, int net, LayerId layer, Coord width) {
    const double tol = std::max(edit::kJoinTol, 0.1 * double(width));
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[size_t(oi)];
      if (o.kind != Owner::Kind::Clasp || !((o.layers >> layer) & 1)) continue;
      if (o.net == net && (o.c + o.axis - p).len() <= tol) return oi;
      if (o.net2 == net && (o.c - o.axis - p).len() <= tol) return oi;
    }
    return -1;
  };
  auto zoneAt = [&](Vec2 p, int net, LayerId layer) {
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[size_t(oi)];
      if (o.kind == Owner::Kind::Zone && o.net == net && ((o.layers >> layer) & 1) && o.shape.distance(p) <= edit::kJoinTol) return oi;
    }
    return -1;
  };
  auto junctionNear = [&](Vec2 p, int net, LayerId layer, double tol) {
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[size_t(oi)];
      if (o.kind == Owner::Kind::Junction && o.layers && o.net == net && ((o.layers >> layer) & 1) && (o.c - p).len() <= tol) return oi;
    }
    return -1;
  };
  // What is laid again, grown until it holds still: the chains of the touched nets holding a changed track (or one
  // meeting a changed track at a vertex: a branch drawn to a wire's joint cuts it there), the wires sharing a track
  // with one of those; the ends the chains need, a new branch point put into the mesh where there is none — and the
  // wires crossing the edges round a new branch point taken too, laid again by their tracks (the insertion would
  // pass them round it on the side the split triangle says, the build by where they are drawn).
  for (int pass = 0;; ++pass) {
    if (pass > 8) return false;
    std::vector<char> chosen(b.tracks.size(), 0);
    for (size_t i = 0; i < b.tracks.size(); ++i) chosen[i] = nets.contains(b.tracks[i].net);
    g = wireGraph(b, chosen);
    effectiveWidths(b, g, copper);
    chains = wireChains(b, g, chosen, copper);
    std::erase_if(chains, [](const WireChain& c) { return c.closed || c.path.size() < 2; });
    for (uint32_t id : changed)
      if (auto it = trackOf.find(id); it != trackOf.end())
        for (int v : g.vid[size_t(it->second)])
          if (v >= 0)
            for (int j : g.ends[size_t(v)]) ids.insert(b.tracks[size_t(j)].id);
    take.assign(chains.size(), 0);
    for (size_t before = 0; before != ids.size();) {
      before = ids.size();
      for (size_t ci = 0; ci < chains.size(); ++ci)
        if (!take[ci] && r::any_of(chains[ci].tracks, [&](int ti) { return ids.contains(b.tracks[size_t(ti)].id); })) {
          take[ci] = 1;
          for (int ti : chains[ci].tracks) ids.insert(b.tracks[size_t(ti)].id);
        }
      for (int wi = 0; wi < int(wires.size()); ++wi)
        if (!out.contains(wi) && r::any_of(wires[size_t(wi)].tracks, [&](uint32_t id) { return ids.contains(id); }) && !takeOut(wi)) return false;
    }
    // A chain taken across a track of another net: that net's wires come too (a double crossing is
    // taken apart by the two together: untangleChains).
    {
      bool grew = false;
      for (size_t ci = 0; ci < chains.size(); ++ci) {
        if (!take[ci]) continue;
        const WireChain& c = chains[ci];
        BBox cb;
        for (Vec2 q : c.path) cb.add(q);
        for (const Track& tr : b.tracks) {
          if (tr.layer != c.layer || tr.net == c.net || nets.contains(tr.net) || tr.zip >= 0) continue;
          BBox tb;
          tb.add(tr.a.v());
          tb.add(tr.b.v());
          if (!cb.intersects(tb)) continue;
          const Polyline tp = tr.path(20000);
          bool hit = false;
          for (size_t q = 1; q < c.path.size() && !hit; ++q)
            for (size_t k = 1; k < tp.size() && !hit; ++k) hit = segmentsIntersect(c.path[q - 1], c.path[q], tp[k - 1], tp[k]);
          if (hit) {
            nets.insert(tr.net);
            ids.insert(tr.id);
            grew = true;
          }
        }
      }
      if (grew) continue;
    }
    // The ends: a pad or via of the net, a clasp, a poured zone, a branch point (one per glued vertex of the
    // graph, as the build has them).
    std::map<std::tuple<int, LayerId, int>, double> junctionWidth;
    std::vector<std::array<std::tuple<int, LayerId, int>, 2>> keys(chains.size());
    ends.assign(chains.size(), {-1, -1});
    for (size_t ci = 0; ci < chains.size(); ++ci) {
      if (!take[ci]) continue;
      const WireChain& c = chains[ci];
      for (int end = 0; end < 2; ++end) {
        const Vec2 p = end ? c.b() : c.a();
        if (auto r = copper.at(p, c.net, c.layer)) ends[ci][size_t(end)] = r->type == ItemType::Pad ? padOwner[size_t(r->index)] : viaOwner[size_t(r->index)];
        else if (int co = claspAt(p, c.net, c.layer, c.width); co >= 0) ends[ci][size_t(end)] = co;
        else if (int zo = zoneAt(p, c.net, c.layer); zo >= 0) ends[ci][size_t(end)] = zo;
        else {
          keys[ci][size_t(end)] = {c.vertex[end], c.layer, c.net};
          double& wdt = junctionWidth[keys[ci][size_t(end)]];
          wdt = std::max(wdt, double(c.width));
        }
      }
    }
    std::map<std::tuple<int, LayerId, int>, int> junctionAt;
  // ... and the pad or via a chain ends on, by the same vertex (for the tiny tracks glued into it, below).
  std::map<std::tuple<int, LayerId, int>, int> copperAt;
    std::vector<int> made;  // the branch points put in on this pass
    for (size_t ci = 0; ci < chains.size(); ++ci) {
      if (!take[ci]) continue;
      const WireChain& c = chains[ci];
      for (int end = 0; end < 2; ++end) {
        if (ends[ci][size_t(end)] >= 0) continue;
        const auto key = keys[ci][size_t(end)];
        auto it = junctionAt.find(key);
        if (it == junctionAt.end()) {
          const Vec2 p = end ? c.b() : c.a();
          const double wdt = junctionWidth[key];
          int oi = junctionNear(p, c.net, c.layer, std::max(edit::kJoinTol, kWireGlue * wdt));
          if (oi < 0) {
            Owner o;
            o.kind = Owner::Kind::Junction;
            o.net = c.net;
            o.c = p;
            o.halfWidth = wdt / 2.0;
            o.shape = Shape::circle(p, o.halfWidth);
            o.layers = LayerMask(1) << c.layer;
            o.junction = int(junctions.size());
            oi = insertOwner(*this, o);
            if (oi < 0) return false;
            junctions.push_back({p, c.net, c.layer, oi, 0});
            made.push_back(oi);
          }
          it = junctionAt.emplace(key, oi).first;
        }
        ends[ci][size_t(end)] = it->second;
      }
    }
    bool more = false;
    for (int oi : made)
      for (LayerMesh& m : layers) {
        if (oi >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[size_t(oi)])
          for (int e : starEdges(m, v))
            for (int cid : m.edges[size_t(e)].cross)
              if (const int wi = crossings[size_t(cid)].wire; wi >= 0 && !out.contains(wi)) {
                if (!takeOut(wi)) return false;
                more = true;
              }
      }
    if (!more) break;
  }
  // Their double crossings taken apart, as the build does.
  {
    std::vector<char> eligible(chains.size(), 0);
    for (size_t ci = 0; ci < chains.size(); ++ci)
      eligible[ci] = take[ci] && r::none_of(chains[ci].tracks, [&](int ti) { return b.tracks[size_t(ti)].locked || b.tracks[size_t(ti)].serp >= 0; });
    untangled += untangleChains(chains, eligible);
  }
  // The tracks of the chains laid again are no owner's any more (a chain inside its own copper is laid as the
  // owner's again).
  {
    std::unordered_set<uint32_t> laidAgain;
    for (size_t ci = 0; ci < chains.size(); ++ci)
      if (take[ci])
        for (int ti : chains[ci].tracks) laidAgain.insert(b.tracks[size_t(ti)].id);
    std::erase_if(ownerTracks, [&](const std::pair<int, uint32_t>& ot) { return laidAgain.contains(ot.second); });
  }
  // Out: their crossings off the edges, their ends' branch points one wire fewer.
  std::set<int> endsOut;  // the branch points the wires taken out ended at
  for (int wi : out) {
    Wire& w = wires[size_t(wi)];
    LayerMesh& m = *mesh(w.layer);
    for (int cid : w.cross) {
      Edge& E = m.edges[size_t(crossings[size_t(cid)].edge)];
      std::erase(E.cross, cid);
      crossings[size_t(cid)] = Crossing{};
    }
    for (int end = 0; end < 2; ++end)
      if (w.end[end] >= 0 && owners[size_t(w.end[end])].kind == Owner::Kind::Junction) endsOut.insert(w.end[end]);
    w.cross.clear();
    w.tracks.clear();
  }
  for (LayerMesh& m : layers)
    for (int e = 0; e < int(m.edges.size()); ++e) {
      Edge& E = m.edges[size_t(e)];
      if (E.along >= 0 && out.contains(E.along)) E.along = -1;
    }
  // Laid in, as the build lays them.
  SpatialIndex idx;
  idx.build(b, false, false);
  BuildScratch scratch;
  std::map<LayerId, std::vector<int>> zonesOn;
  for (int oi = 0; oi < int(owners.size()); ++oi)
    if (owners[size_t(oi)].kind == Owner::Kind::Zone)
      for (LayerId l = 0; l < 64; ++l)
        if ((owners[size_t(oi)].layers >> l) & 1) zonesOn[l].push_back(oi);
  LayContext lay{b, idx, zonesOn, scratch.displaced};
  std::map<int, std::vector<Laid>> laidOn;  // per mesh, the new wires
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    if (!take[ci]) continue;
    const LayerMesh* mp = mesh(chains[ci].layer);
    if (!mp) continue;
    if (auto l = layChain(*this, lay, chains[ci], -1, ends[ci][0], ends[ci][1])) laidOn[int(mp - layers.data())].push_back(std::move(*l));
  }
  // Their crossings put in among those on the edges: the wires already there as the model has them (their hits
  // from their crossings: the triangles they pass, their place on the edge for the position).
  std::set<std::pair<int, int>> crossed;
  for (auto& [li, fresh] : laidOn) {
    LayerMesh& m = layers[size_t(li)];
    std::vector<Laid> laid = fresh;  // the new ones first, the wires already there appended as met
    std::map<int, int> laidOfWire;
    auto shared = [&](int e1, int e2) {
      for (int ta : m.edges[size_t(e1)].t)
        if (ta >= 0 && (ta == m.edges[size_t(e2)].t[0] || ta == m.edges[size_t(e2)].t[1])) return ta;
      return -1;
    };
    auto holding = [&](int e, int v) {
      for (int ta : m.edges[size_t(e)].t)
        if (ta >= 0 && m.localVertex(ta, v) >= 0) return ta;
      return -1;
    };
    auto apex = [&](int tri, int e) {
      if (tri < 0) return -1;
      for (int v : m.tris[size_t(tri)].v)
        if (v != m.edges[size_t(e)].v[0] && v != m.edges[size_t(e)].v[1]) return v;
      return -1;
    };
    auto existing = [&](int wi) {
      if (auto it = laidOfWire.find(wi); it != laidOfWire.end()) return it->second;
      const Wire& w = wires[size_t(wi)];
      Laid L{wi, {}, m.verts[size_t(w.endVertex[0])].p, m.verts[size_t(w.endVertex[1])].p};
      // The wire as drawn: where its tracks cross an edge is its position there, as the build's walk has it (the
      // order decides by it where the topology does not); its place in the edge's order when they do not.
      std::vector<std::pair<Vec2, Vec2>> drawn;
      for (uint32_t id : w.tracks)
        if (auto it = trackOf.find(id); it != trackOf.end()) {
          const Polyline pts = b.tracks[size_t(it->second)].path(20000);
          for (size_t q = 1; q < pts.size(); ++q) drawn.push_back({pts[q - 1], pts[q]});
        }
      const int n = int(w.cross.size());
      for (int i = 0; i < n; ++i) {
        const int e = crossings[size_t(w.cross[size_t(i)])].edge;
        const Edge& E = m.edges[size_t(e)];
        const int k = int(r::find(E.cross, w.cross[size_t(i)]) - E.cross.begin());
        const double place = double(k + 1) / double(E.cross.size() + 1);
        double at = place, best = 1e300;
        const Vec2 a = m.verts[size_t(E.v[0])].p, c = m.verts[size_t(E.v[1])].p;
        for (auto [p, q] : drawn) {
          const double den = (c - a).cross(q - p);
          if (std::abs(den) < 1e-9) continue;
          const double tt = (p - a).cross(q - p) / den, ss = (p - a).cross(c - a) / den;
          if (tt < 0 || tt > 1 || ss < 0 || ss > 1) continue;
          if (std::abs(tt - place) < best) best = std::abs(tt - place), at = tt;
        }
        const int fwd = i + 1 < n ? shared(e, crossings[size_t(w.cross[size_t(i + 1)])].edge) : holding(e, w.endVertex[1]);
        const int back = i > 0 ? shared(e, crossings[size_t(w.cross[size_t(i - 1)])].edge) : holding(e, w.endVertex[0]);
        bool uLeft = false;
        if (fwd >= 0) {
          const int j = m.localVertex(fwd, E.v[0]);
          uLeft = j >= 0 && m.tris[size_t(fwd)].v[size_t((j + 1) % 3)] == E.v[1];
        }
        L.hits.push_back({e, at, uLeft, apex(back, e), apex(fwd, e)});
      }
      laid.push_back(std::move(L));
      return laidOfWire[wi] = int(laid.size() - 1);
    };
    std::map<int, std::vector<std::pair<int, int>>> newOnEdge;
    for (int k = 0; k < int(laid.size()); ++k)
      for (int h = 0; h < int(laid[size_t(k)].hits.size()); ++h) newOnEdge[laid[size_t(k)].hits[size_t(h)].edge].push_back({k, h});
    const int nNew = int(laid.size());
    std::vector<std::vector<int>> newCross(static_cast<size_t>(nNew));
    for (int k = 0; k < nNew; ++k) newCross[size_t(k)].assign(laid[size_t(k)].hits.size(), -1);
    for (auto& [e, mine] : newOnEdge) {
      std::vector<std::pair<int, int>> list;
      for (int cid : m.edges[size_t(e)].cross) list.push_back({existing(crossings[size_t(cid)].wire), crossings[size_t(cid)].idx});
      const size_t firstNew = list.size();
      list.insert(list.end(), mine.begin(), mine.end());
      orderOnEdge(*this, b, m, laid, e, list, firstNew, crossed);
      std::vector<int> cross;
      for (auto [k, h] : list) {
        if (k >= nNew) {
          cross.push_back(wires[size_t(laid[size_t(k)].wire)].cross[size_t(h)]);
          continue;
        }
        const int cid = int(crossings.size());
        crossings.push_back({laid[size_t(k)].wire, e, h, double(wires[size_t(laid[size_t(k)].wire)].width)});
        newCross[size_t(k)][size_t(h)] = cid;
        cross.push_back(cid);
      }
      m.edges[size_t(e)].cross = std::move(cross);
    }
    for (int k = 0; k < nNew; ++k) wires[size_t(laid[size_t(k)].wire)].cross = std::move(newCross[size_t(k)]);
    for (int e = 0; e < int(m.edges.size()); ++e)
      if (!m.edges[size_t(e)].cross.empty()) refreshEdge(*this, m, e);
    // A new wire across an edge with no room at all, at another net's copper: through it (as the build says).
    for (auto& [e, mine] : newOnEdge) {
      const Edge& E = m.edges[size_t(e)];
      if (E.cls != 3) continue;
      for (auto [k, h] : mine) {
        const Wire& w = wires[size_t(laid[size_t(k)].wire)];
        if (w.zone >= 0) continue;
        for (int end = 0; end < 2; ++end) {
          const Owner& o = owners[size_t(m.verts[size_t(E.v[end])].owner)];
          if (own(m, E.v[end], w) || o.kind == Owner::Kind::Junction || o.kind == Owner::Kind::Outline || o.kind == Owner::Kind::Keepout) continue;
          Violation v;
          v.kind = Violation::Kind::ThroughPad;
          v.wireA = laid[size_t(k)].wire;
          v.owner = m.verts[size_t(E.v[end])].owner;
          v.layer = m.layer;
          v.edge = e;
          v.pos = (m.verts[size_t(E.v[0])].p + m.verts[size_t(E.v[1])].p) * 0.5;
          violations.push_back(v);
          break;
        }
      }
    }
  }
  relayDisplaced(b, scratch);
  // The wires taken out go from the table; the violations of theirs with them; the model's crossings found again.
  std::vector<int> map(wires.size(), -1);
  {
    std::vector<Wire> kept;
    for (int wi = 0; wi < int(wires.size()); ++wi)
      if (!out.contains(wi)) {
        map[size_t(wi)] = int(kept.size());
        kept.push_back(std::move(wires[size_t(wi)]));
      }
    wires = std::move(kept);
  }
  for (Crossing& c : crossings)
    if (c.wire >= 0) c.wire = map[size_t(c.wire)];
  for (LayerMesh& m : layers)
    for (Edge& E : m.edges)
      if (E.along >= 0) E.along = map[size_t(E.along)];
  std::erase_if(violations, [&](const Violation& v) {
    return (v.wireA >= 0 && map[size_t(v.wireA)] < 0) || (v.wireB >= 0 && map[size_t(v.wireB)] < 0);
  });
  std::set<std::pair<int, int>> pairs;  // the crossings known, a pair of wires once
  for (Violation& v : violations) {
    if (v.wireA >= 0) v.wireA = map[size_t(v.wireA)];
    if (v.wireB >= 0) v.wireB = map[size_t(v.wireB)];
    if (v.kind == Violation::Kind::Crossing) pairs.insert(std::minmax(v.wireA, v.wireB));
  }
  for (const LayerMesh& m : layers)
    for (Violation v : findCrossings(m))
      if (pairs.insert(std::minmax(v.wireA, v.wireB)).second) violations.push_back(v);
  // Branch points no wire ends at any more go; the others count their wires again.
  std::map<int, int> degree;
  for (const Wire& w : wires)
    for (int o : w.end)
      if (o >= 0) ++degree[o];
  for (int oi : endsOut)
    if (!degree.contains(oi) && owners[size_t(oi)].layers) removeOwner(*this, oi);
  for (Junction& j : junctions) j.degree = degree.contains(j.owner) ? degree[j.owner] : 0;
  std::erase_if(ownerTracks, [&](const std::pair<int, uint32_t>& ot) { return !trackOf.contains(ot.second); });
  r::sort(ownerTracks);
  ownerTracks.erase(std::unique(ownerTracks.begin(), ownerTracks.end()), ownerTracks.end());
  return true;
}

}  // namespace xr::topo
