#include "topo/Flip.h"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <algorithm>
#include <deque>

namespace xr::topo {

namespace {

using K = CGAL::Exact_predicates_inexact_constructions_kernel;

// The quad of edge e: T1 = (a, p, q) counter-clockwise with e = (p, q), T2 = (b, q, p).
struct Quad {
  int t1, t2, i1, i2;  // triangles and the local index of e in each
  int a, p, q, b;
};

bool quadOf(const LayerMesh& m, int e, Quad& Q) {
  const Edge& E = m.edges[e];
  Q.t1 = E.t[0];
  Q.t2 = E.t[1];
  if (Q.t1 < 0 || Q.t2 < 0) return false;
  Q.i1 = m.localEdge(Q.t1, e);
  Q.i2 = m.localEdge(Q.t2, e);
  if (Q.i1 < 0 || Q.i2 < 0) return false;
  const Tri& T1 = m.tris[Q.t1];
  const Tri& T2 = m.tris[Q.t2];
  Q.a = T1.v[Q.i1];
  Q.p = T1.v[(Q.i1 + 1) % 3];
  Q.q = T1.v[(Q.i1 + 2) % 3];
  Q.b = T2.v[Q.i2];
  return T2.v[(Q.i2 + 1) % 3] == Q.q && T2.v[(Q.i2 + 2) % 3] == Q.p;
}

}  // namespace

bool inCircle(Vec2 a, Vec2 p, Vec2 q, Vec2 b) {
  K::Side_of_oriented_circle_2 side;
  return side(K::Point_2(a.x, a.y), K::Point_2(p.x, p.y), K::Point_2(q.x, q.y), K::Point_2(b.x, b.y)) == CGAL::ON_POSITIVE_SIDE;
}

bool flippable(const LayerMesh& m, int e, const std::function<bool(int, int, int)>& gate) {
  const Edge& E = m.edges[e];
  if (E.constrained) return false;
  Quad Q;
  if (!quadOf(m, e, Q)) return false;
  const Tri& T1 = m.tris[Q.t1];
  const Tri& T2 = m.tris[Q.t2];
  if (!T1.inside || !T2.inside || T1.blocked || T2.blocked) return false;
  Vec2 A = m.verts[Q.a].p, P = m.verts[Q.p].p, Qp = m.verts[Q.q].p, B = m.verts[Q.b].p;
  if (orient(A, P, B) <= 0 || orient(A, B, Qp) <= 0) return false;  // the quad is not strictly convex
  return !gate || gate(e, Q.a, Q.b);
}

bool flip(LayerMesh& m, int e, const std::function<bool(int, int, int)>& gate) {
  if (!flippable(m, e, gate)) return false;
  Quad Q;
  quadOf(m, e, Q);
  Tri& T1 = m.tris[Q.t1];
  Tri& T2 = m.tris[Q.t2];
  // The sides, by the old triangles.
  const int eQA = T1.e[(Q.i1 + 1) % 3], nQA = T1.nb[(Q.i1 + 1) % 3];  // opposite p in T1
  const int eAP = T1.e[(Q.i1 + 2) % 3], nAP = T1.nb[(Q.i1 + 2) % 3];  // opposite q in T1
  const int ePB = T2.e[(Q.i2 + 1) % 3], nPB = T2.nb[(Q.i2 + 1) % 3];  // opposite q in T2
  const int eBQ = T2.e[(Q.i2 + 2) % 3], nBQ = T2.nb[(Q.i2 + 2) % 3];  // opposite p in T2
  // T1 becomes (a, p, b), T2 becomes (a, b, q).
  T1.v[0] = Q.a; T1.v[1] = Q.p; T1.v[2] = Q.b;
  T1.e[0] = ePB; T1.nb[0] = nPB;
  T1.e[1] = e;   T1.nb[1] = Q.t2;
  T1.e[2] = eAP; T1.nb[2] = nAP;
  T2.v[0] = Q.a; T2.v[1] = Q.b; T2.v[2] = Q.q;
  T2.e[0] = eBQ; T2.nb[0] = nBQ;
  T2.e[1] = eQA; T2.nb[1] = nQA;
  T2.e[2] = e;   T2.nb[2] = Q.t1;
  // The side edges that changed triangle, and the neighbours across them.
  auto retarget = [&](int side, int from, int to) {
    Edge& S = m.edges[side];
    if (S.t[0] == from) S.t[0] = to;
    else if (S.t[1] == from) S.t[1] = to;
  };
  retarget(eQA, Q.t1, Q.t2);
  retarget(ePB, Q.t2, Q.t1);
  if (nQA >= 0) m.tris[nQA].nb[m.localEdge(nQA, eQA)] = Q.t2;
  if (nPB >= 0) m.tris[nPB].nb[m.localEdge(nPB, ePB)] = Q.t1;
  // The diagonal itself, and the vertices' triangle lists.
  Edge& E = m.edges[e];
  E.v[0] = std::min(Q.a, Q.b);
  E.v[1] = std::max(Q.a, Q.b);
  E.t[0] = Q.t1;
  E.t[1] = Q.t2;
  std::erase(m.verts[Q.p].tris, Q.t2);
  std::erase(m.verts[Q.q].tris, Q.t1);
  m.verts[Q.a].tris.push_back(Q.t2);
  m.verts[Q.b].tris.push_back(Q.t1);
  return true;
}

int flipLoop(LayerMesh& m, std::vector<int> seed, const std::function<bool(int, int, int)>& gate) {
  std::deque<int> queue;
  std::vector<char> queued(m.edges.size(), 0);
  auto push = [&](int e) {
    if (!queued[e]) {
      queued[e] = 1;
      queue.push_back(e);
    }
  };
  if (seed.empty())
    for (int e = 0; e < int(m.edges.size()); ++e) push(e);
  else
    for (int e : seed) push(e);
  int flips = 0;
  const int cap = 20 * int(m.edges.size()) + 100;
  while (!queue.empty() && flips < cap) {
    int e = queue.front();
    queue.pop_front();
    queued[e] = 0;
    if (!flippable(m, e, gate)) continue;
    Quad Q;
    quadOf(m, e, Q);
    if (!inCircle(m.verts[Q.a].p, m.verts[Q.p].p, m.verts[Q.q].p, m.verts[Q.b].p)) continue;
    flip(m, e, gate);
    ++flips;
    for (int t : {Q.t1, Q.t2})
      for (int i = 0; i < 3; ++i)
        if (m.tris[t].e[i] != e) push(m.tris[t].e[i]);
  }
  return flips;
}

}  // namespace xr::topo
