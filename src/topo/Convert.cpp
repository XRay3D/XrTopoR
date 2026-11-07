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

#include "core/Edit.h"
#include "core/SpatialIndex.h"
#include "topo/Build.h"
#include "topo/Capacity.h"
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

void Topology::convertWires(const Board& b, BuildScratch& scratch) {
  std::vector<char> all(b.tracks.size(), 1);
  WireGraph g = wireGraph(b, all);
  OwnCopper copper(b);
  effectiveWidths(b, g, copper);
  std::vector<WireChain> chains = wireChains(b, g, all, copper);
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
    w.locked = std::ranges::any_of(c.tracks, [&](int ti) { return b.tracks[ti].locked || b.tracks[ti].serp >= 0; });
    w.dirty = true;
    if (chainZip[ci] >= 0) {  // the pair's wire: as wide as the pair, never narrower
      const ZippedWire& zip = b.zips[size_t(chainZip[ci])];
      w.pair = zip.pair;
      w.zip = chainZip[ci];
      w.widthMin = w.width;
      w.locked |= zip.fixed || std::ranges::any_of(zip.axis, [](const Track& t) { return t.serp >= 0; });
    }
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
    const Owner& o0 = owners[w.end[0]];
    const Owner& o1 = owners[w.end[1]];
    // In a pour nothing is touched (TopoR): a chain lying wholly inside a poured zone's outline on its
    // layer is locked whatever its net, one of another net that reaches into the pour too (the pour was made
    // round it). The wires of the zone's own net that cross its boundary are laid as any other: inside, the
    // zone's copper is their own.
    if (auto it = zonesOn.find(c.layer); it != zonesOn.end())
      for (int zo : it->second) {
        const Shape& zs = owners[zo].shape;
        size_t inside = 0;
        bool touches = false;
        for (Vec2 p : c.path) inside += zs.distance(p) <= 0;
        for (size_t k = 1; k < c.path.size() && !touches; ++k) touches = zs.distanceToSegment(c.path[k - 1], c.path[k]) <= 0;
        if (inside == c.path.size() || (c.net != owners[zo].net && (inside > 0 || touches))) {
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
    // ran the pad's length through its own far end (Arcs_master: 30 violations on the first pass, 24 on
    // the next, when the drawn wire started at the right end).
    auto endVertexOf = [&](int owner, int end) {
      const Owner& o = owners[owner];
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
      return nearestVertex(m, owner, at);
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
      v.wireA = int(wires.size());
      v.owner = through->type == ItemType::Pad ? padOwner[through->index] : viaOwner[through->index];
      v.layer = c.layer;
      v.pos = c.path[c.path.size() / 2];
      violations.push_back(v);
      w.locked = true;
    }
    // A chain lying wholly inside the copper it starts and ends on is that copper, not a wire (not in a
    // pour: the tracks there stay as they are, the zone owns none of them).
    if (w.end[0] == w.end[1] && o0.kind != Owner::Kind::Zone && sk.size() <= 2 && (sk.front() - sk.back()).len2() < 1) {
      ++insideOwn;
      for (int ti : c.tracks) ownerTracks.push_back({w.end[0], b.tracks[ti].id});
      continue;
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
      ++loops;
      if (std::getenv("XR_TOPO_DEBUG") && loops <= 5)
        std::println(stderr, "loop: net {} L{} owner {} kind {} path {} points from ({:.3f},{:.3f}) to ({:.3f},{:.3f}), sketch {} points",
                     b.nets[c.net].name, int(c.layer), w.end[0], int(owners[w.end[0]].kind), c.path.size(), c.a().x / 1e6, c.a().y / 1e6,
                     c.b().x / 1e6, c.b().y / 1e6, sk.size());
      for (int ti : c.tracks) ownerTracks.push_back({w.end[0], b.tracks[ti].id});  // goes when the owner's wires are redrawn
      continue;
    }
    // Nothing crossed between two different owners: the wire runs along the edge joining them.
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
    int wi = int(wires.size());
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
      scratch.displaced.push_back(wi);
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

}  // namespace xr::topo
