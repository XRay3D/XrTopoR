#include "topo/Move.h"

#include <algorithm>
#include <map>
#include <set>

#include "geom/Geometry.h"
#include "topo/Capacity.h"

namespace xr::topo {

namespace {

Shape moved(Shape s, Vec2 d) {
  s.a = s.a + d;
  s.b = s.b + d;
  for (Vec2& p : s.poly) p = p + d;
  return s;
}

// The position of a crossing along its edge by its rank: consistent, and the chords of one triangle do
// not cross each other (I2), which is all the side tests need.
Vec2 rankPos(const LayerMesh& m, const Edge& E, int cid) {
  int n = int(E.cross.size());
  int k = int(r::find(E.cross, cid) - E.cross.begin());
  Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
  return U + (V - U) * (double(k + 1) / double(n + 1));
}

// Rebuilds the wires' crossing lists after some crossings vanished (`gone`) and others are to go in
// (`inserts`: wire -> (before this index, crossing)), and renumbers.
void spliceWires(Topology& t, const std::vector<char>& gone, std::map<int, std::vector<std::pair<int, int>>>& inserts,
                 std::vector<int> touched) {
  for (auto& [wi, _] : inserts) touched.push_back(wi);
  r::sort(touched);
  touched.erase(r::unique(touched).begin(), touched.end());
  for (int wi : touched) {
    Wire& w = t.wires[wi];
    std::vector<int> out;
    auto& ins = inserts[wi];
    r::stable_sort(ins, {}, &std::pair<int, int>::first);
    size_t next = 0;
    for (size_t i = 0; i <= w.cross.size(); ++i) {
      while (next < ins.size() && ins[next].first == int(i)) out.push_back(ins[next++].second);
      if (i < w.cross.size() && !(w.cross[i] < int(gone.size()) && gone[w.cross[i]])) out.push_back(w.cross[i]);
    }
    w.cross = std::move(out);
    for (size_t i = 0; i < w.cross.size(); ++i) t.crossings[w.cross[i]].idx = int(i);
  }
}

// A wire that crosses an edge and comes straight back over it (after a vertex it went round has gone)
// loses the pair: the chord is tightened away.
void tighten(Topology& t, LayerMesh& m, int wi) {
  Wire& w = t.wires[wi];
  for (size_t i = 0; i + 1 < w.cross.size();) {
    int a = w.cross[i], b = w.cross[i + 1];
    int e = t.crossings[a].edge;
    if (e != t.crossings[b].edge) { ++i; continue; }
    std::erase(m.edges[e].cross, a);
    std::erase(m.edges[e].cross, b);
    t.crossings[a] = Crossing{};
    t.crossings[b] = Crossing{};
    w.cross.erase(w.cross.begin() + int(i), w.cross.begin() + int(i) + 2);
    for (size_t k = 0; k < w.cross.size(); ++k) t.crossings[w.cross[k]].idx = int(k);
    refreshEdge(t, m, e);
    if (i > 0) --i;
  }
}

}  // namespace

std::vector<int> starEdges(const LayerMesh& m, int v) {
  std::vector<int> out;
  for (int ti : m.verts[v].tris)
    for (int e : m.tris[ti].e) out.push_back(e);
  r::sort(out);
  out.erase(r::unique(out).begin(), out.end());
  return out;
}

// The least height (nm) a move leaves to a triangle at the owner.
constexpr double kMinHeight = 1000;

double moveOwner(Topology& t, int owner, Vec2 d, const FlipGate& gate, int rounds) {
  if (d.len2() == 0) return 1;
  Owner& o = t.owners[owner];
  double done = 0;
  for (int round = 0; round < rounds && done < 1 - 1e-9; ++round) {
    // As far as every incident triangle stays counter-clockwise: orient() is linear in the step.
    double lam = 1 - done;
    for (LayerMesh& m : t.layers) {
      if (owner >= int(m.ownerVerts.size())) continue;
      for (int v : m.ownerVerts[owner])
        for (int ti : m.verts[v].tris) {
          const Tri& T = m.tris[ti];
          Vec2 p[3], q[3];
          for (int i = 0; i < 3; ++i) {
            const Vertex& x = m.verts[T.v[i]];
            p[i] = x.p;
            q[i] = x.owner == owner ? x.p + d * (1 - done) : x.p;
          }
          double f0 = orient(p[0], p[1], p[2]), f1 = orient(q[0], q[1], q[2]) - f0;
          // ... and keeps a micron of height: an owner pulled onto a vertex or a side of its own net (a branch
          // point onto its pad — nothing of another net's rule holds it off) came nine tenths closer with
          // every step, down to a triangle the rounding turned over.
          const double base = std::max({(p[1] - p[0]).len(), (p[2] - p[1]).len(), (p[0] - p[2]).len()});
          const double fmin = kMinHeight * base;
          if (f1 < 0 && f0 > fmin) lam = std::min(lam, 0.9 * (f0 - fmin) / -f1 * (1 - done));
          else if (f1 < 0) lam = 0;
        }
    }
    const Vec2 step = d * lam;
    if (lam > 0) {
      o.c = o.c + step;
      o.shape = moved(o.shape, step);
      if (o.junction >= 0) t.junctions[o.junction].pos = t.junctions[o.junction].pos + step;
      for (Wire& w : t.wires)
        for (int end = 0; end < 2; ++end)
          if (w.end[end] == owner && w.hasExit[end]) w.exit[end] = w.exit[end] + step;
    }
    int flips = 0;
    for (LayerMesh& m : t.layers) {
      if (owner >= int(m.ownerVerts.size())) continue;
      std::vector<int> seed;
      for (int v : m.ownerVerts[owner]) {
        t.placeVertex(m, v);
        for (int e : starEdges(m, v)) seed.push_back(e);
        for (int ti : m.verts[v].tris)
          for (int e : m.tris[ti].e)
            if ((m.edges[e].v[0] == v || m.edges[e].v[1] == v) && !m.edges[e].cross.empty()) refreshEdge(t, m, e);
      }
      flips += flipLoop(t, m, seed, gate, false);
    }
    done += lam;
    if (lam <= 1e-9 && flips == 0) break;  // blocked: a constrained or rigid edge, or copper in the way of the flip
  }
  return std::min(done, 1.0);
}

int insertVertex(Topology& t, LayerMesh& m, int owner, double at, Vec2 off, bool lawson) {
  if (owner >= int(m.ownerVerts.size())) m.ownerVerts.resize(owner + 1);
  Vertex nx;
  nx.owner = owner;
  nx.t = at;
  nx.off = off;
  const Owner& o = t.owners[owner];
  nx.p = o.c + o.axis * at + off;
  const Vec2 P = nx.p;
  if (o.kind == Owner::Kind::Via && t.viaBarIntrusion(P, o.halfWidth, LayerMask(1) << m.layer) > 1000) return -1;  // in a via keepout
  const int ti = m.locate(P);
  if (ti < 0) return -1;
  const Tri T = m.tris[ti];  // a copy: the slot is reused
  for (int i = 0; i < 3; ++i)
    if ((m.verts[T.v[i]].p - P).len2() < 1) return -1;  // on a vertex
  int onEdge = -1;
  for (int i = 0; i < 3; ++i) {
    const Edge& E = m.edges[T.e[i]];
    if (distPointSegment(P, m.verts[E.v[0]].p, m.verts[E.v[1]].p) < 1) {
      if (E.constrained || E.rigid || E.t[0] < 0 || E.t[1] < 0) return -1;
      onEdge = T.e[i];
    }
  }
  // The chords through the triangle: between consecutive crossings on two of its edges, and from a
  // crossing to a wire's end at one of its corners.
  struct Chord {
    int wire;
    Vec2 a, b;    // from a to b along the wire
    int endV;     // the corner the chord ends or starts at (-1: none)
    int insertAt;  // where in Wire::cross the new crossings go
  };
  std::vector<Chord> chords;
  auto cornerOf = [&](int v) {
    for (int i = 0; i < 3; ++i)
      if (T.v[i] == v) return i;
    return -1;
  };
  auto edgeOf = [&](int e) {
    for (int i = 0; i < 3; ++i)
      if (T.e[i] == e) return i;
    return -1;
  };
  for (int i = 0; i < 3; ++i) {
    const Edge& E = m.edges[T.e[i]];
    for (int cid : E.cross) {
      const Crossing& c = t.crossings[cid];
      const Wire& w = t.wires[c.wire];
      Vec2 here = rankPos(m, E, cid);
      if (c.idx + 1 < int(w.cross.size())) {
        int nc = w.cross[c.idx + 1];
        int ne = t.crossings[nc].edge;
        if (ne != T.e[i] && edgeOf(ne) >= 0) chords.push_back({c.wire, here, rankPos(m, m.edges[ne], nc), -1, c.idx + 1});
      } else if (cornerOf(w.endVertex[1]) >= 0) {
        chords.push_back({c.wire, here, m.verts[w.endVertex[1]].p, w.endVertex[1], c.idx + 1});
      }
      if (c.idx == 0 && cornerOf(w.endVertex[0]) >= 0) chords.push_back({c.wire, m.verts[w.endVertex[0]].p, here, w.endVertex[0], 0});
    }
  }
  // The vertex, the three spokes, the three triangles (the old slot becomes the one opposite corner 0).
  m.verts.push_back(nx);
  const int x = int(m.verts.size() - 1);
  m.ownerVerts[owner].push_back(x);
  int spoke[3];
  for (int i = 0; i < 3; ++i) {
    Edge e;
    e.v[0] = std::min(x, T.v[i]);
    e.v[1] = std::max(x, T.v[i]);
    e.rigid = m.verts[T.v[i]].owner == owner;
    m.edges.push_back(e);
    spoke[i] = int(m.edges.size() - 1);
  }
  int tri[3] = {ti, int(m.tris.size()), int(m.tris.size()) + 1};
  m.tris.resize(m.tris.size() + 2);
  for (int i = 0; i < 3; ++i) {
    // Triangle i is opposite corner i: (x, v[i+1], v[i+2]); its far side is the old edge e[i].
    Tri& N = m.tris[tri[i]];
    const int j = (i + 1) % 3, k = (i + 2) % 3;
    N.v[0] = x;
    N.v[1] = T.v[j];
    N.v[2] = T.v[k];
    N.e[0] = T.e[i];
    N.nb[0] = T.nb[i];
    N.e[1] = spoke[k];  // opposite v[j]: (x, v[k])
    N.nb[1] = tri[j];
    N.e[2] = spoke[j];  // opposite v[k]: (x, v[j])
    N.nb[2] = tri[k];
    N.inside = T.inside;
    N.blocked = T.blocked;
    N.zone = T.zone;
    Edge& F = m.edges[T.e[i]];
    if (F.t[0] == ti) F.t[0] = tri[i];
    else if (F.t[1] == ti) F.t[1] = tri[i];
    if (T.nb[i] >= 0) m.tris[T.nb[i]].nb[m.localEdge(T.nb[i], T.e[i])] = tri[i];
  }
  for (int i = 0; i < 3; ++i) {
    // The spoke to corner i lies between the triangles opposite the other two corners.
    const int j = (i + 1) % 3, k = (i + 2) % 3;
    m.edges[spoke[i]].t[0] = tri[j];
    m.edges[spoke[i]].t[1] = tri[k];
  }
  for (int i = 0; i < 3; ++i) {
    std::vector<int>& list = m.verts[T.v[i]].tris;
    std::erase(list, ti);
    list.push_back(tri[(i + 1) % 3]);
    list.push_back(tri[(i + 2) % 3]);
  }
  m.verts[x].tris = {tri[0], tri[1], tri[2]};
  // The chords cross the spokes to the corners on their far side, in order along the chord; on each
  // spoke the chords lie in order of their distance from x.
  struct OnSpoke {
    double dist;
    int cid;
  };
  std::vector<std::vector<OnSpoke>> onSpoke(3);
  std::map<int, std::vector<std::pair<int, int>>> inserts;
  for (const Chord& ch : chords) {
    double side = orient(ch.a, ch.b, P);
    if (side == 0) continue;
    struct Hit {
      double u;  // along the chord
      int i;     // the corner
      double dist;
    };
    std::vector<Hit> hs;
    for (int i = 0; i < 3; ++i) {
      if (T.v[i] == ch.endV) continue;
      Vec2 vk = m.verts[T.v[i]].p;
      double s = orient(ch.a, ch.b, vk);
      if (s == 0 || (s > 0) == (side > 0)) continue;
      double den = (ch.b - ch.a).cross(vk - P);
      if (std::abs(den) < 1e-12) continue;
      double u = (P - ch.a).cross(vk - P) / den;
      Vec2 at = ch.a + (ch.b - ch.a) * u;
      hs.push_back({u, i, (at - P).len()});
    }
    r::sort(hs, {}, &Hit::u);
    for (const Hit& h : hs) {
      int cid = int(t.crossings.size());
      t.crossings.push_back({ch.wire, spoke[h.i], -1, double(t.wires[ch.wire].width)});
      inserts[ch.wire].push_back({ch.insertAt, cid});
      onSpoke[h.i].push_back({h.dist, cid});
    }
  }
  for (int i = 0; i < 3; ++i) {
    r::stable_sort(onSpoke[i], {}, &OnSpoke::dist);
    Edge& S = m.edges[spoke[i]];
    for (const OnSpoke& s : onSpoke[i]) S.cross.push_back(s.cid);
    if (S.v[0] != x) r::reverse(S.cross);  // the list runs from v[0]
  }
  spliceWires(t, {}, inserts, {});
  for (int i = 0; i < 3; ++i) refreshEdge(t, m, spoke[i]);
  // On an edge: the degenerate piece opposite it is flipped away (the quad is convex, the wires carried).
  if (onEdge >= 0) flip(t, m, onEdge);  // convex by construction; a refusal leaves the sliver to Lawson
  if (lawson) flipLoop(t, m, {T.e[0], T.e[1], T.e[2]}, {}, false);
  return x;
}

int insertOwner(Topology& t, Owner o, bool lawson) {
  const int owner = int(t.owners.size());
  t.owners.push_back(std::move(o));
  const Owner& O = t.owners[owner];
  for (LayerMesh& m : t.layers)
    if (int(m.ownerVerts.size()) <= owner) m.ownerVerts.resize(owner + 1);
  std::vector<std::pair<LayerMesh*, int>> made;
  bool ok = true;
  for (LayerMesh& m : t.layers) {
    if (!((O.layers >> m.layer) & 1)) continue;
    int v = insertVertex(t, m, owner, 0, {}, lawson);
    if (v < 0) { ok = false; break; }
    made.push_back({&m, v});
  }
  if (!ok) {
    for (auto [m, v] : made) removeVertex(t, *m, v, lawson);
    t.owners.pop_back();
    for (LayerMesh& m : t.layers)
      if (int(m.ownerVerts.size()) > owner) m.ownerVerts.resize(owner);
    return -1;
  }
  for (LayerMesh& m : t.layers) {
    if (int(m.ownerClr.size()) <= owner) m.ownerClr.resize(owner + 1, 0);
    // The clearance its net keeps on the layer: as another owner of the net has it, else the widest known.
    double clr = 0;
    for (int oi = 0; oi < owner; ++oi)
      if (t.owners[oi].net == O.net && oi < int(m.ownerClr.size())) { clr = m.ownerClr[oi]; break; }
    if (clr == 0)
      for (double c : m.ownerClr) clr = std::max(clr, c);
    m.ownerClr[owner] = clr;
  }
  return owner;
}

bool removeVertex(Topology& t, LayerMesh& m, int v, bool lawson) {
  for (const Wire& w : t.wires)
    if (w.layer == m.layer && (w.endVertex[0] == v || w.endVertex[1] == v)) return false;
  // Flip the star down to three triangles. The departing vertex's copper is no bar to the new diagonals
  // (they cut close to it by nature).
  Owner& o = t.owners[m.verts[v].owner];
  const double halfWidth = o.halfWidth;
  o.halfWidth = 0;
  while (m.verts[v].tris.size() > 3) {
    bool flipped = false;
    for (int ti : std::vector<int>(m.verts[v].tris)) {
      for (int e : m.tris[ti].e) {
        const Edge& E = m.edges[e];
        if (E.v[0] != v && E.v[1] != v) continue;
        if (flip(t, m, e)) { flipped = true; break; }
      }
      if (flipped) break;
    }
    if (!flipped) {
      o.halfWidth = halfWidth;
      return false;
    }
  }
  o.halfWidth = halfWidth;
  if (m.verts[v].tris.size() != 3) return false;
  // The three triangles in counter-clockwise order round v: T[i] = (v, c[i], c[i+1]).
  int T[3], c[3], spoke[3], far[3], farNb[3];
  {
    std::vector<int> ts = m.verts[v].tris;
    int t0 = ts[0];
    int i0 = m.localVertex(t0, v);
    T[0] = t0;
    c[0] = m.tris[t0].v[(i0 + 1) % 3];
    c[1] = m.tris[t0].v[(i0 + 2) % 3];
    T[1] = -1;
    for (int tt : ts)
      if (tt != t0 && m.localVertex(tt, c[1]) >= 0) T[1] = tt;
    if (T[1] < 0) return false;
    int i1 = m.localVertex(T[1], v);
    c[2] = m.tris[T[1]].v[(i1 + 2) % 3];
    for (int tt : ts)
      if (tt != t0 && tt != T[1]) T[2] = tt;
    for (int i = 0; i < 3; ++i) {
      int iv = m.localVertex(T[i], v);
      far[i] = m.tris[T[i]].e[iv];
      farNb[i] = m.tris[T[i]].nb[iv];
      // The spoke to c[i] is opposite c[i+1] in T[i].
      spoke[i] = m.tris[T[i]].e[m.localVertex(T[i], c[(i + 1) % 3])];
    }
  }
  // The crossings of the spokes go; a wire that came back over an edge loses the pair.
  std::vector<char> gone(t.crossings.size(), 0);
  std::vector<int> touched;
  for (int i = 0; i < 3; ++i)
    for (int cid : m.edges[spoke[i]].cross) {
      gone[cid] = 1;
      touched.push_back(t.crossings[cid].wire);
    }
  std::map<int, std::vector<std::pair<int, int>>> none;
  spliceWires(t, gone, none, touched);
  for (int i = 0; i < 3; ++i)
    for (int cid : m.edges[spoke[i]].cross) t.crossings[cid] = Crossing{};
  // One triangle (c0, c1, c2) in T[0]'s slot; T[1], T[2], the spokes and the vertex are dead.
  Tri& N = m.tris[T[0]];
  N.v[0] = c[0];
  N.v[1] = c[1];
  N.v[2] = c[2];
  N.e[0] = far[1];  // opposite c0: (c1, c2)
  N.nb[0] = farNb[1];
  N.e[1] = far[2];  // opposite c1: (c2, c0)
  N.nb[1] = farNb[2];
  N.e[2] = far[0];  // opposite c2: (c0, c1)
  N.nb[2] = farNb[0];
  for (int i = 1; i < 3; ++i) {
    Edge& F = m.edges[far[i]];
    if (F.t[0] == T[i]) F.t[0] = T[0];
    else if (F.t[1] == T[i]) F.t[1] = T[0];
    if (farNb[i] >= 0) m.tris[farNb[i]].nb[m.localEdge(farNb[i], far[i])] = T[0];
    m.tris[T[i]] = Tri{};
  }
  for (int i = 0; i < 3; ++i) {
    Edge& S = m.edges[spoke[i]];
    S = Edge{};
    S.v[0] = S.v[1] = -1;
    S.t[0] = S.t[1] = -1;
    std::vector<int>& list = m.verts[c[i]].tris;
    std::erase(list, T[1]);
    std::erase(list, T[2]);
    if (!r::contains(list, T[0])) list.push_back(T[0]);
  }
  std::erase(m.ownerVerts[m.verts[v].owner], v);
  m.verts[v] = Vertex{};
  m.verts[v].owner = -1;
  r::sort(touched);
  touched.erase(r::unique(touched).begin(), touched.end());
  for (int wi : touched) tighten(t, m, wi);
  if (lawson) flipLoop(t, m, {far[0], far[1], far[2]}, {}, false);
  return true;
}

bool removeOwner(Topology& t, int owner, bool lawson) {
  for (LayerMesh& m : t.layers)
    if (owner < int(m.ownerVerts.size()) && m.ownerVerts[owner].size() > 1) return false;
  for (LayerMesh& m : t.layers) {
    if (owner >= int(m.ownerVerts.size()) || m.ownerVerts[owner].empty()) continue;
    if (!removeVertex(t, m, m.ownerVerts[owner].front(), lawson)) return false;
  }
  t.owners[owner].layers = 0;
  return true;
}

}  // namespace xr::topo
