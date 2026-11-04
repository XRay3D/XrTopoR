#include "topo/Flip.h"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <algorithm>
#include <deque>
#include <map>

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

int edgeBetween(const LayerMesh& m, int t, int x, int y) {
  for (int i = 0; i < 3; ++i) {
    const Edge& E = m.edges[m.tris[t].e[i]];
    if ((E.v[0] == x && E.v[1] == y) || (E.v[0] == y && E.v[1] == x)) return m.tris[t].e[i];
  }
  return -1;
}

}  // namespace

bool inCircle(Vec2 a, Vec2 p, Vec2 q, Vec2 b) {
  K::Side_of_oriented_circle_2 side;
  return side(K::Point_2(a.x, a.y), K::Point_2(p.x, p.y), K::Point_2(q.x, q.y), K::Point_2(b.x, b.y)) == CGAL::ON_POSITIVE_SIDE;
}

bool flippable(const Topology& t, const LayerMesh& m, int e, const FlipGate& gate) {
  const Edge& E = m.edges[e];
  if (E.constrained || E.rigid) return false;
  Quad Q;
  if (!quadOf(m, e, Q)) return false;
  const Tri& T1 = m.tris[Q.t1];
  const Tri& T2 = m.tris[Q.t2];
  if (!T1.inside || !T2.inside || T1.blocked || T2.blocked) return false;
  Vec2 A = m.verts[Q.a].p, P = m.verts[Q.p].p, Qp = m.verts[Q.q].p, B = m.verts[Q.b].p;
  if (orient(A, P, B) <= 0 || orient(A, B, Qp) <= 0) return false;  // the quad is not strictly convex
  // The new diagonal must not run through the copper of the old ends (then it could carry nothing).
  for (int v : {Q.p, Q.q}) {
    const Vertex& X = m.verts[v];
    if (X.owner == m.verts[Q.a].owner || X.owner == m.verts[Q.b].owner) continue;
    if (distPointSegment(X.p, A, B) <= t.owners[X.owner].halfWidth) return false;
  }
  return !gate || gate(e, Q.a, Q.b);
}

bool planFlip(const Topology& t, const LayerMesh& m, int e, FlipPlan& plan, const FlipGate& gate) {
  if (!flippable(t, m, e, gate)) return false;
  Quad Q;
  quadOf(m, e, Q);
  plan = FlipPlan{};
  plan.a = Q.a;
  plan.p = Q.p;
  plan.q = Q.q;
  plan.b = Q.b;
  const Edge& E = m.edges[e];
  const int eAP = edgeBetween(m, Q.t1, Q.a, Q.p), eQA = edgeBetween(m, Q.t1, Q.q, Q.a);
  const int ePB = edgeBetween(m, Q.t2, Q.p, Q.b), eBQ = edgeBetween(m, Q.t2, Q.b, Q.q);
  // Positions of the crossings along the two paths a -> p -> b (P side) and a -> q -> b (Q side).
  std::map<int, double> posP, posQ;
  auto along = [&](int s, int from, std::map<int, double>& pos, double base) {
    const Edge& S = m.edges[s];
    int n = int(S.cross.size());
    for (int k = 0; k < n; ++k) pos[S.cross[k]] = base + (S.v[0] == from ? k : n - 1 - k);
    return base + n;
  };
  double nAP = along(eAP, Q.a, posP, 0), nAQ = along(eQA, Q.a, posQ, 0);
  along(ePB, Q.p, posP, nAP + 1);
  along(eBQ, Q.q, posQ, nAQ + 1);
  const double atP = nAP + 0.5, atQ = nAQ + 0.5;
  enum class Cls { P, Q, A, B, None };
  struct Ev {
    Cls cls = Cls::None;
    double pos = 0;  // along the side of its class
  };
  auto crossingEv = [&](int cid) {
    int s = t.crossings[cid].edge;
    Ev ev;
    if (s == eAP || s == ePB) ev = {Cls::P, posP[cid]};
    else if (s == eQA || s == eBQ) ev = {Cls::Q, posQ[cid]};
    return ev;
  };
  // The end of a wire, at the quad vertex it ends at.
  auto endEv = [&](int vertex) {
    if (vertex == Q.a) return Ev{Cls::A, 0};
    if (vertex == Q.b) return Ev{Cls::B, 0};
    if (vertex == Q.p) return Ev{Cls::P, atP};
    if (vertex == Q.q) return Ev{Cls::Q, atQ};
    return Ev{};
  };
  auto triOfSide = [&](int s) { return s == eAP || s == eQA ? Q.t1 : s == ePB || s == eBQ ? Q.t2 : -1; };
  auto consider = [&](int wi, Ev x, Ev y, int oldCid, int insertAt) {
    if (x.cls == Cls::None || y.cls == Cls::None) return;
    bool pq = (x.cls == Cls::P && y.cls == Cls::Q) || (x.cls == Cls::Q && y.cls == Cls::P);
    if (pq) {
      const Ev& P = x.cls == Cls::P ? x : y;
      const Ev& Qe = x.cls == Cls::Q ? x : y;
      plan.diag.push_back({wi, oldCid, insertAt, P.pos, Qe.pos});
      return;
    }
    if (oldCid >= 0) plan.erase.push_back(oldCid);
    if ((x.cls == Cls::A && y.cls == Cls::B) || (x.cls == Cls::B && y.cls == Cls::A)) plan.along = wi;
  };
  // Runs through e.
  for (int cid : E.cross) {
    const Crossing& c = t.crossings[cid];
    const Wire& w = t.wires[c.wire];
    int i = c.idx;
    Ev before = i > 0 ? crossingEv(w.cross[i - 1]) : endEv(w.endVertex[0]);
    Ev after = i + 1 < int(w.cross.size()) ? crossingEv(w.cross[i + 1]) : endEv(w.endVertex[1]);
    consider(c.wire, before, after, cid, i);
  }
  // Chords inside one of the two triangles, from a side crossing forward (or from an end backward).
  for (int s : {eAP, eQA, ePB, eBQ}) {
    const int tx = triOfSide(s);
    for (int cid : m.edges[s].cross) {
      const Crossing& c = t.crossings[cid];
      const Wire& w = t.wires[c.wire];
      int i = c.idx;
      Ev here = crossingEv(cid);
      // Forward.
      if (i + 1 < int(w.cross.size())) {
        int nc = w.cross[i + 1];
        int ns = t.crossings[nc].edge;
        if (ns != e && triOfSide(ns) == tx) {
          // Both on sides of tx: the chord is inside tx only if the two edges share tx (they do by I1).
          consider(c.wire, here, crossingEv(nc), -1, i + 1);
        }
      } else if (m.localVertex(tx, w.endVertex[1]) >= 0) {
        consider(c.wire, here, endEv(w.endVertex[1]), -1, i + 1);
      }
      // Backward only from an end: a crossing before is found from its own side.
      if (i == 0 && m.localVertex(tx, w.endVertex[0]) >= 0) consider(c.wire, endEv(w.endVertex[0]), here, -1, 0);
    }
  }
  // The wire along e, from p to q, now crosses the diagonal.
  if (E.along >= 0) plan.diag.push_back({E.along, -1, 0, atP, atQ});
  std::ranges::sort(plan.diag, [](const FlipPlan::Run& x, const FlipPlan::Run& y) {
    return x.posP != y.posP ? x.posP < y.posP : x.posQ < y.posQ;
  });
  for (const FlipPlan::Run& r : plan.diag) plan.wires.push_back(r.wire);
  return true;
}

bool flip(Topology& t, LayerMesh& m, int e, const FlipGate& gate) {
  FlipPlan plan;
  if (!planFlip(t, m, e, plan, gate)) return false;
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
  auto retarget = [&](int side, int from, int to) {
    Edge& S = m.edges[side];
    if (S.t[0] == from) S.t[0] = to;
    else if (S.t[1] == from) S.t[1] = to;
  };
  retarget(eQA, Q.t1, Q.t2);
  retarget(ePB, Q.t2, Q.t1);
  if (nQA >= 0) m.tris[nQA].nb[m.localEdge(nQA, eQA)] = Q.t2;
  if (nPB >= 0) m.tris[nPB].nb[m.localEdge(nPB, ePB)] = Q.t1;
  Edge& E = m.edges[e];
  E.v[0] = std::min(Q.a, Q.b);
  E.v[1] = std::max(Q.a, Q.b);
  E.t[0] = Q.t1;
  E.t[1] = Q.t2;
  std::erase(m.verts[Q.p].tris, Q.t2);
  std::erase(m.verts[Q.q].tris, Q.t1);
  m.verts[Q.a].tris.push_back(Q.t2);
  m.verts[Q.b].tris.push_back(Q.t1);
  // The crossings: the new diagonal's list in order, the wires' lists spliced.
  std::vector<int> newList;
  std::map<int, std::vector<std::pair<int, int>>> inserts;  // wire -> (insertAt, cid)
  std::vector<char> gone(t.crossings.size(), 0);
  for (int cid : plan.erase) gone[cid] = 1;
  if (E.v[0] == Q.b) std::ranges::reverse(plan.diag);  // the list runs from v[0]
  for (const FlipPlan::Run& r : plan.diag) {
    int cid = r.oldCid;
    if (cid < 0) {
      cid = int(t.crossings.size());
      t.crossings.push_back({r.wire, e, -1, double(t.wires[r.wire].width)});
      gone.push_back(0);
      inserts[r.wire].push_back({r.insertAt, cid});
    }
    newList.push_back(cid);
  }
  E.cross = newList;
  std::vector<int> touched;
  for (int cid : plan.erase) touched.push_back(t.crossings[cid].wire);
  for (auto& [wi, _] : inserts) touched.push_back(wi);
  if (E.along >= 0) touched.push_back(E.along);
  std::ranges::sort(touched);
  touched.erase(std::unique(touched.begin(), touched.end()), touched.end());
  for (int wi : touched) {
    Wire& w = t.wires[wi];
    std::vector<int> out;
    auto& ins = inserts[wi];
    std::ranges::sort(ins);
    size_t next = 0;
    for (size_t i = 0; i <= w.cross.size(); ++i) {
      while (next < ins.size() && ins[next].first == int(i)) out.push_back(ins[next++].second);
      if (i < w.cross.size() && !gone[w.cross[i]]) out.push_back(w.cross[i]);
    }
    w.cross = std::move(out);
    for (size_t i = 0; i < w.cross.size(); ++i) t.crossings[w.cross[i]].idx = int(i);
  }
  for (int cid : plan.erase) t.crossings[cid] = Crossing{};  // dead
  E.along = plan.along;
  refreshEdge(t, m, e);
  return true;
}

double load(const EdgeCapacity& c) {
  if (c.a.empty()) return 0;
  return c.need / std::max(c.freeLen, 1.0);
}

int flipLoop(Topology& t, LayerMesh& m, std::vector<int> seed, const FlipGate& gate) {
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
  constexpr double kEps = 1e-3;
  while (!queue.empty() && flips < cap) {
    int e = queue.front();
    queue.pop_front();
    queued[e] = 0;
    FlipPlan plan;
    if (!planFlip(t, m, e, plan, gate)) continue;
    double now = load(edgeCapacity(t, m, e));
    double then = load(capacityOf(t, m, plan.a, plan.b, plan.wires, plan.along));
    bool go = then < now - kEps;
    if (!go && std::abs(then - now) <= kEps)
      go = inCircle(m.verts[plan.a].p, m.verts[plan.p].p, m.verts[plan.q].p, m.verts[plan.b].p);
    if (!go) continue;
    int t1 = m.edges[e].t[0], t2 = m.edges[e].t[1];
    if (!flip(t, m, e, gate)) continue;
    ++flips;
    for (int tt : {t1, t2})
      for (int i = 0; i < 3; ++i)
        if (m.tris[tt].e[i] != e) push(m.tris[tt].e[i]);
  }
  return flips;
}

}  // namespace xr::topo
