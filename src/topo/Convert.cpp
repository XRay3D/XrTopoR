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

#include "core/SpatialIndex.h"
#include "topo/Build.h"
#include "topo/Capacity.h"
#include "topo/Chains.h"
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
// the mesh.
std::vector<Hit> walk(const LayerMesh& m, int v0, int v1, const Polyline& sk, bool& ok, std::string* why) {
  std::vector<Hit> out;
  ok = true;
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
      if (n < 0)  // a constrained edge, or the outside
        return fail(std::format("edge {} ({}) at segment {} after {} hits", e, m.edges[e].constrained ? "constrained" : "hull", s, out.size()));
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
      int k = int(std::ranges::find(E.cross, cid) - E.cross.begin());
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
    auto endTri = [&](int cid, int owner, double& coord) {  // the triangle of a wire's first/last crossing at its end owner
      const Edge& E = m.edges[crossings[cid].edge];
      for (int t : E.t) {
        if (t < 0) continue;
        for (int i = 0; i < 3; ++i)
          if (m.verts[m.tris[t].v[i]].owner == owner) {
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
      if (int t = endTri(w.cross.front(), w.end[0], c0); t >= 0) chordsOf[t].push_back({wi, c0, coordOf(t, w.cross.front())});
      if (int t = endTri(w.cross.back(), w.end[1], c1); t >= 0) chordsOf[t].push_back({wi, coordOf(t, w.cross.back()), c1});
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

void Topology::convertWires(const Board& b, BuildScratch& scratch) {
  std::vector<char> all(b.tracks.size(), 1);
  WireGraph g = wireGraph(b, all);
  OwnCopper copper(b);
  std::vector<WireChain> chains = wireChains(b, g, all, copper);
  std::erase_if(chains, [](const WireChain& c) { return c.closed || c.path.size() < 2; });
  // The ends: a pad or via of the net, or else a branch point or free end — a junction owner there.
  struct End {
    int owner = -1;
  };
  std::vector<std::array<End, 2>> ends(chains.size());
  // Keyed by the wire graph's glued vertex: the ends of the chains meeting at a branch point lie within
  // the glue of each other (a 50 um track between two of them on Arcs_master), one junction for all.
  std::map<std::tuple<int, LayerId, int>, int> junctionAt;
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    const WireChain& c = chains[ci];
    for (int end = 0; end < 2; ++end) {
      Vec2 p = end ? c.b() : c.a();
      if (auto r = copper.at(p, c.net, c.layer)) {
        ends[ci][end].owner = r->type == ItemType::Pad ? padOwner[r->index] : viaOwner[r->index];
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
  // when its wires are redrawn, or they would be left behind by a move.
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!g.relevant[i] || !g.tiny[i]) continue;
    const Track& tr = b.tracks[i];
    auto it = junctionAt.find(std::tuple{g.vid[i][0], tr.layer, tr.net});
    if (it != junctionAt.end()) ownerTracks.push_back({it->second, tr.id});
  }
  buildMeshes(b, scratch);

  // The copper of the other nets, for pushing a wire out of a pad it was drawn through.
  SpatialIndex idx;
  idx.build(b, false, false);
  const double kJoin = 1000;
  wires.clear();
  crossings.clear();
  ownerTracks.clear();
  struct Laid {
    int wire;
    std::vector<Hit> hits;
    Vec2 from, to;
  };
  std::vector<std::vector<Laid>> laidOn(layers.size());
  int noEnd = 0, insideOwn = 0, loops = 0;
  for (size_t ci = 0; ci < chains.size(); ++ci) {
    const WireChain& c = chains[ci];
    LayerMesh* mp = mesh(c.layer);
    if (!mp) continue;
    LayerMesh& m = *mp;
    const int li = int(mp - layers.data());
    Wire w;
    w.net = c.net;
    w.layer = c.layer;
    w.width = c.width;
    w.widthMin = std::min(c.width, b.minTrackWidth(c.net, c.layer));
    w.clr = b.clearance(c.net, c.layer);
    w.end[0] = ends[ci][0].owner;
    w.end[1] = ends[ci][1].owner;
    for (int ti : c.tracks) w.tracks.push_back(b.tracks[ti].id);
    w.locked = std::ranges::any_of(c.tracks, [&](int ti) { return b.tracks[ti].locked; });
    w.dirty = true;
    if (w.end[0] < 0 || w.end[1] < 0 || m.ownerVerts[w.end[0]].empty() || m.ownerVerts[w.end[1]].empty()) {
      ++noEnd;
      continue;
    }
    // The sketch: from the end owner's vertex, through the path's points outside the own copper, to the
    // other's. A polygon connects at its centre (TopoR's connection point; the realiser draws the wire
    // from there, inside the copper): drawn to the corner nearest the path's end, the track's round end
    // stuck out of the pad into the gap beside it (arz_2L: 13 violations at one connector). An oval is
    // drawn to the end nearer the path's end (from the centre a wire ran the pad's length and out the other
    // end, 470 mm over arz_2L), the rest have one vertex.
    auto endVertexOf = [&](int owner, Vec2 at) {
      const Owner& o = owners[owner];
      if (o.shape.kind == Shape::Kind::Polygon)
        for (int v : m.ownerVerts[owner])
          if (m.verts[v].t == 0 && m.verts[v].off.len2() < 1) return v;
      return nearestVertex(m, owner, at);
    };
    int v0 = endVertexOf(w.end[0], c.a()), v1 = endVertexOf(w.end[1], c.b());
    w.endVertex[0] = v0;
    w.endVertex[1] = v1;
    Polyline sk{m.verts[v0].p};
    const Owner& o0 = owners[w.end[0]];
    const Owner& o1 = owners[w.end[1]];
    // Where the path leaves each end's copper: the boundary point between the last point inside and the
    // first outside.
    for (int end = 0; end < 2; ++end) {
      const Owner& o = end ? o1 : o0;
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
    const double want = double(w.clr) + w.width / 2.0;
    for (int round = 0; round < 60 && !through; ++round) {
      bool bent = false;
      for (size_t k = 1; k < sk.size() && !bent && !through; ++k) {
        Vec2 p = sk[k - 1], q = sk[k];
        BBox box;
        box.add(p);
        box.add(q);
        idx.query(box.inflated(w.width), LayerMask(1) << c.layer, [&](ItemRef r) {
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
      v.wireA = int(wires.size());
      v.owner = through->type == ItemType::Pad ? padOwner[through->index] : viaOwner[through->index];
      v.layer = c.layer;
      v.pos = c.path[c.path.size() / 2];
      violations.push_back(v);
      w.locked = true;
    }
    // A chain lying wholly inside the copper it starts and ends on is that copper, not a wire.
    if (w.end[0] == w.end[1] && sk.size() <= 2 && (sk.front() - sk.back()).len2() < 1) {
      ++insideOwn;
      for (int ti : c.tracks) ownerTracks.push_back({w.end[0], b.tracks[ti].id});
      continue;
    }
    bool ok = true;
    std::string why;
    std::vector<Hit> hits = walk(m, v0, v1, sk, ok, &why);
    // Out of its copper and back without crossing anything: that copper, not a wire.
    if (ok && hits.empty() && w.end[0] == w.end[1]) {
      ++loops;
      if (std::getenv("XR_TOPO_DEBUG") && loops <= 5)
        std::println(stderr, "loop: net {} L{} owner {} kind {} path {} points from ({:.3f},{:.3f}) to ({:.3f},{:.3f}), sketch {} points",
                     b.nets[c.net].name, int(c.layer), w.end[0], int(owners[w.end[0]].kind), c.path.size(), c.a().x / 1e6, c.a().y / 1e6,
                     c.b().x / 1e6, c.b().y / 1e6, sk.size());
      continue;
    }
    // Nothing crossed between two different owners: the wire runs along the edge joining them.
    int along = -1;
    if (ok && hits.empty()) {
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
    int wi = int(wires.size());
    if (!ok) {
      if (std::getenv("XR_TOPO_DEBUG"))
        std::println(stderr, "wire {} net {} L{} from ({:.3f},{:.3f}) to ({:.3f},{:.3f}), {} points: {}", wi, b.nets[c.net].name, int(c.layer),
                     sk.front().x / 1e6, sk.front().y / 1e6, sk.back().x / 1e6, sk.back().y / 1e6, sk.size(), why);
      Violation v;
      v.kind = Violation::Kind::OutsideBoard;
      v.wireA = wi;
      v.layer = c.layer;
      v.pos = c.path[c.path.size() / 2];
      violations.push_back(v);
      w.locked = true;
      hits.clear();
    }
    if (along >= 0) m.edges[along].along = wi;
    wires.push_back(std::move(w));
    laidOn[li].push_back({wi, std::move(hits), m.verts[v0].p, m.verts[v1].p});
  }

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
    std::set<std::pair<int, int>> crossed;  // wire pairs reported
    for (auto& [e, list] : onEdge) {
      auto before = [&](std::pair<int, int> a, std::pair<int, int> c) {
        const Hit& hA = laid[a.first].hits[a.second];
        const Hit& hB = laid[c.first].hits[c.second];
        int dB = hA.uLeft == hB.uLeft ? +1 : -1;
        int f = side(a.first, a.second, +1, c.first, c.second, dB, 0);
        int bk = side(a.first, a.second, -1, c.first, c.second, -dB, 0);
        if (f != 0 && bk != 0 && f != bk) {
          int wa = laid[a.first].wire, wb = laid[c.first].wire;
          if (wires[wa].net != wires[wb].net && crossed.insert(std::minmax(wa, wb)).second) {
            Violation v;
            v.kind = Violation::Kind::Crossing;
            v.wireA = wa;
            v.wireB = wb;
            v.layer = m.layer;
            v.edge = e;
            v.pos = (crossPt(hA) + crossPt(hB)) * 0.5;
            violations.push_back(v);
          }
          return hA.t < hB.t;
        }
        int r = f != 0 ? f : bk;
        if (r != 0 && (r > 0) != (hA.t < hB.t) && std::getenv("XR_TOPO_DEBUG")) {
          const Edge& E = m.edges[e];
          std::println(stderr, "order against geometry on layer {} edge {} ({:.3f},{:.3f})-({:.3f},{:.3f}): {} (t {:.3f}, {}/{}) vs {} (t {:.3f}, {}/{}): fwd {} back {}",
                       int(m.layer), e, m.verts[E.v[0]].p.x / 1e6, m.verts[E.v[0]].p.y / 1e6, m.verts[E.v[1]].p.x / 1e6, m.verts[E.v[1]].p.y / 1e6,
                       b.nets[wires[laid[a.first].wire].net].name, hA.t, a.second, laid[a.first].hits.size(),
                       b.nets[wires[laid[c.first].wire].net].name, hB.t, c.second, laid[c.first].hits.size(), f, bk);
        }
        return r != 0 ? r > 0 : hA.t < hB.t;
      };
      for (size_t k = 1; k < list.size(); ++k)  // insertion sort: the order is pairwise, not a key
        for (size_t q = k; q > 0 && before(list[q], list[q - 1]); --q) std::swap(list[q], list[q - 1]);
    }
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
        for (int end = 0; end < 2; ++end) {
          const Owner& o = owners[m.verts[E.v[end]].owner];
          if (o.net == w.net || o.kind == Owner::Kind::Junction) continue;
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
}

}  // namespace xr::topo
