#include "topo/Relay.h"

#include <algorithm>
#include <cmath>
#include <map>
#include <queue>
#include <set>
#include <unordered_map>

#include "geom/Geometry.h"
#include "topo/Capacity.h"

namespace xr::topo {

namespace {

int commonTri(const Edge& a, const Edge& b) {
  for (int ta : a.t)
    if (ta >= 0 && (ta == b.t[0] || ta == b.t[1])) return ta;
  return -1;
}
int triWithCorner(const LayerMesh& m, const Edge& e, int v) {
  for (int ta : e.t)
    if (ta >= 0 && m.localVertex(ta, v) >= 0) return ta;
  return -1;
}
int across(const Edge& e, int tri) { return e.t[0] == tri ? e.t[1] : e.t[1] == tri ? e.t[0] : -1; }

// A place on a triangle's perimeter as one number: corner i at i, the edge opposite corner i between i + 1
// and i + 2 (the triangle runs counter-clockwise), `f` of the way along it from the edge's v[0].
double perimeter(const LayerMesh& m, int tri, int le, double f) {
  const Tri& T = m.tris[tri];
  const Edge& E = m.edges[T.e[le]];
  const bool sameWay = E.v[0] == T.v[(le + 1) % 3];
  return (le + 1) % 3 + (sameWay ? f : 1 - f);
}
// Does the chord p - q of a triangle cross the chord x - y (places on the perimeter, 0..3 round)?
bool chordsCross(double p, double q, double x, double y) {
  if (p > q) std::swap(p, q);
  auto inside = [&](double z) { return z > p + 1e-9 && z < q - 1e-9; };
  auto on = [&](double z) { return std::abs(z - p) <= 1e-9 || std::abs(z - q) <= 1e-9; };
  if (on(x) || on(y)) return false;
  return inside(x) != inside(y);
}

struct Chord {
  double a, b;
  int net;
};
// The chords of the wires through a triangle, `skip` left out (the wire being laid: its own run is no bar).
std::vector<Chord> chordsOf(const Topology& t, const LayerMesh& m, int tri, int skip, const std::vector<int>* absent) {
  std::vector<Chord> out;
  const Tri& T = m.tris[tri];
  for (int i = 0; i < 3; ++i) {
    const Edge& E = m.edges[T.e[i]];
    const int n = int(E.cross.size());
    for (int k = 0; k < n; ++k) {
      const Crossing& c = t.crossings[E.cross[k]];
      if (c.wire < 0 || c.wire == skip || (absent && std::ranges::find(*absent, c.wire) != absent->end())) continue;
      const Wire& w = t.wires[c.wire];
      const double here = perimeter(m, tri, i, double(k + 1) / (n + 1));
      // To the corner opposite, when the wire ends there.
      if ((c.idx == 0 && T.v[i] == w.endVertex[0]) || (c.idx == int(w.cross.size()) - 1 && T.v[i] == w.endVertex[1])) out.push_back({here, double(i), w.net});
      // To its next crossing, when that is on another edge of this triangle (each chord once).
      if (c.idx + 1 < int(w.cross.size())) {
        const Crossing& d = t.crossings[w.cross[c.idx + 1]];
        const int j = m.localEdge(tri, d.edge);
        if (j >= 0 && j != i) {
          const Edge& F = m.edges[d.edge];
          const int kf = int(std::ranges::find(F.cross, w.cross[c.idx + 1]) - F.cross.begin());
          out.push_back({here, perimeter(m, tri, j, double(kf + 1) / (F.cross.size() + 1)), w.net});
        }
      }
    }
  }
  return out;
}

// Where the wire's own-pad crossings end: [first, last) is what a re-lay may replace.
void middleOf(const Topology& t, const LayerMesh& m, const Wire& w, int& first, int& last) {
  auto ownSide = [&](int cid, int owner) {
    const Edge& E = m.edges[t.crossings[cid].edge];
    return m.verts[E.v[0]].owner == owner && m.verts[E.v[1]].owner == owner;
  };
  first = 0;
  last = int(w.cross.size());
  while (first < last && ownSide(w.cross[first], w.end[0])) ++first;
  while (last > first && ownSide(w.cross[last - 1], w.end[1])) --last;
  // Out of an oval pad the wire goes on through the edge it left by: its end vertex is the centre of the pad's
  // rounded end, and a new first edge could take it out sideways (TopoR: a pin is left through its end; two
  // wires of Arcs_standard_routing came out through the long side after a re-lay).
  auto oval = [&](int owner) { return t.owners[owner].kind == Owner::Kind::Pad && t.owners[owner].shape.kind == Shape::Kind::Segment; };
  if (first == 0 && first < last && oval(w.end[0])) ++first;
  if (last == int(w.cross.size()) && last > first && oval(w.end[1])) --last;
}

Vec2 pointOn(const LayerMesh& m, const Edge& E, double along, double L) {
  const Vec2 U = m.verts[E.v[0]].p, V = m.verts[E.v[1]].p;
  return L > 0 ? U + (V - U) * (along / L) : U;
}

}  // namespace

double tautLength(const Topology& t, int wi) {
  const Wire& w = t.wires[wi];
  const LayerMesh& m = *t.mesh(w.layer);
  const Vec2 from = m.verts[w.endVertex[0]].p, to = m.verts[w.endVertex[1]].p;
  const int n = int(w.cross.size());
  if (n == 0) return (to - from).len();
  // The portals: every crossing's slot, its left end first (the triangle entered runs the edge from v[0] to
  // v[1] exactly when v[0] is on the wire's left).
  std::vector<std::pair<Vec2, Vec2>> portals{{from, from}};
  for (int i = 0; i < n; ++i) {
    const int e = t.crossings[w.cross[i]].edge;
    const Edge& E = m.edges[e];
    const int into = i + 1 < n ? commonTri(E, m.edges[t.crossings[w.cross[i + 1]].edge]) : triWithCorner(m, E, w.endVertex[1]);
    const EdgeCapacity c = edgeCapacity(t, m, e);
    const int k = int(std::ranges::find(E.cross, w.cross[i]) - E.cross.begin());
    Slot s = slotOf(c, k);
    if (s.hi < s.lo) s.lo = s.hi = s.mid();
    const Vec2 a = pointOn(m, E, s.lo, c.L), b = pointOn(m, E, s.hi, c.L);
    bool uLeft = true;
    if (into >= 0) {
      const int j = m.localEdge(into, e);
      uLeft = j >= 0 && m.tris[into].v[(j + 1) % 3] == E.v[0];
    }
    portals.push_back(uLeft ? std::pair{a, b} : std::pair{b, a});
  }
  portals.push_back({to, to});
  // The funnel (as the realiser's): the taut polyline through the portals.
  std::vector<Vec2> path{from};
  Vec2 A = from, lp = from, rp = from;
  int left = 0, right = 0;
  for (int i = 1, guard = 0; i < int(portals.size()) && guard < 100000; ++i, ++guard) {
    const Vec2 li = portals[i].first, ri = portals[i].second;
    if (orient(A, rp, ri) >= 0) {
      if ((rp - A).len2() < 1 || orient(A, lp, ri) < 0) {
        rp = ri;
        right = i;
      } else {
        path.push_back(lp);
        A = lp;
        i = left;
        lp = rp = A;
        right = left;
        continue;
      }
    }
    if (orient(A, lp, li) <= 0) {
      if ((lp - A).len2() < 1 || orient(A, rp, li) > 0) {
        lp = li;
        left = i;
      } else {
        path.push_back(rp);
        A = rp;
        i = right;
        lp = rp = A;
        left = right;
        continue;
      }
    }
  }
  path.push_back(to);
  double len = 0;
  for (size_t i = 1; i < path.size(); ++i) len += (path[i] - path[i - 1]).len();
  return len;
}

std::optional<RelayPath> findRelay(const Topology& t, int wi, const std::vector<char>* avoid, const std::vector<int>* absent) {
  const Wire& w = t.wires[wi];
  const LayerMesh& m = *t.mesh(w.layer);
  RelayPath out;
  middleOf(t, m, w, out.first, out.last);
  const int n = int(w.cross.size());
  // The two ends of what is searched: a vertex, or the pad's own side the wire keeps crossing where it does.
  struct Terminal {
    int vertex = -1;          // the end vertex, or
    int edge = -1, tri = -1;  // the kept crossing's edge and the triangle beyond it (the search's side)
    double f = 0;             // ... and the crossing's place along the edge, as a fraction from v[0]
    Vec2 p;
  };
  auto terminal = [&](int end) {
    Terminal x;
    const int keep = end == 0 ? out.first - 1 : out.last;  // the kept crossing next to the middle
    if (keep < 0 || keep >= n) {
      x.vertex = w.endVertex[end];
      x.p = m.verts[x.vertex].p;
      return x;
    }
    const int cid = w.cross[keep];
    x.edge = t.crossings[cid].edge;
    const Edge& E = m.edges[x.edge];
    // The triangle on the pad's side of that edge: shared with the kept crossing before it, or holding the end vertex.
    const int inner = end == 0 ? (keep > 0 ? commonTri(E, m.edges[t.crossings[w.cross[keep - 1]].edge]) : triWithCorner(m, E, w.endVertex[0]))
                               : (keep + 1 < n ? commonTri(E, m.edges[t.crossings[w.cross[keep + 1]].edge]) : triWithCorner(m, E, w.endVertex[1]));
    x.tri = across(E, inner);
    const int k = int(std::ranges::find(E.cross, cid) - E.cross.begin());
    x.f = double(k + 1) / (E.cross.size() + 1);
    const EdgeCapacity c = edgeCapacity(t, m, x.edge);
    x.p = pointOn(m, E, slotOf(c, k).mid(), c.L);
    return x;
  };
  const Terminal S = terminal(0), G = terminal(1);
  if ((S.edge >= 0 && S.tri < 0) || (G.edge >= 0 && G.tri < 0)) return std::nullopt;

  // The wire's own middle crossings are not there for the search.
  std::set<int> gone(w.cross.begin() + out.first, w.cross.begin() + out.last);
  // ... nor are those of the wires taken out with it.
  auto isAbsent = [&](int wire) { return absent && std::ranges::find(*absent, wire) != absent->end(); };
  if (absent)
    for (int other : *absent) {
      const Wire& x = t.wires[size_t(other)];
      if (x.layer != w.layer) continue;
      int f = 0, l = 0;
      middleOf(t, m, x, f, l);
      gone.insert(x.cross.begin() + f, x.cross.begin() + l);
    }
  auto present = [&](const Edge& E) {
    std::vector<int> cids;
    for (int cid : E.cross)
      if (!gone.contains(cid)) cids.push_back(cid);
    return cids;
  };
  std::unordered_map<int, std::vector<Chord>> chordCache;
  auto chords = [&](int tri) -> const std::vector<Chord>& {
    auto [it, fresh] = chordCache.try_emplace(tri);
    if (fresh) {
      // With the middle gone: the chords of the other wires, and of this wire's kept crossings none (their
      // partners are the middle's, or lie in the pad).
      it->second = chordsOf(t, m, tri, wi, absent);
    }
    return it->second;
  };
  // The places of the crossings on the perimeter count the wire's own middle crossings too (chordsOf sees the
  // edges as they are): a gap's place is taken between the two crossings it lies between, as they are.
  auto gapPlace = [&](int tri, int le, const Edge& E, const std::vector<int>& cids, int gap) {
    auto rank = [&](int cid) { return double(std::ranges::find(E.cross, cid) - E.cross.begin() + 1) / (E.cross.size() + 1); };
    const double lo = gap > 0 ? rank(cids[size_t(gap - 1)]) : 0.0, hi = gap < int(cids.size()) ? rank(cids[size_t(gap)]) : 1.0;
    return perimeter(m, tri, le, (lo + hi) / 2);
  };
  auto planar = [&](int tri, double p, double q) {
    for (const Chord& c : chords(tri))
      if (c.net != w.net && chordsCross(p, q, c.a, c.b)) return false;
    return true;
  };
  // Crossing edge e at the gap: does it still fit, and where does the wire cross?
  struct Fit {
    bool ok = false;
    Vec2 p;
  };
  std::map<std::pair<int, int>, Fit> fitCache;
  auto fit = [&](int e, const std::vector<int>& cids, int gap) -> const Fit& {
    auto [it, fresh] = fitCache.try_emplace({e, gap});
    if (!fresh) return it->second;
    const Edge& E = m.edges[e];
    if (E.constrained) return it->second;
    if (avoid)
      for (int v : E.v)
        if (const int o = m.verts[v].owner; o >= 0 && o < int(avoid->size()) && (*avoid)[size_t(o)]) return it->second;
    std::vector<int> ws;
    for (int cid : cids) ws.push_back(t.crossings[cid].wire);
    ws.insert(ws.begin() + gap, wi);
    const EdgeCapacity c = capacityOf(t, m, E.v[0], E.v[1], ws, isAbsent(E.along) ? -1 : E.along);
    // It fits at the nominal widths: a new path is no reason to narrow a wire (the capacity would narrow one
    // to make room — the automatic tools narrow only as the last resort).
    it->second.ok = c.deficit <= 0 && c.cls < 3 && !c.narrowed;
    it->second.p = pointOn(m, E, slotOf(c, gap).mid(), c.L);
    return it->second;
  };

  struct Node {
    double g = 0;
    int parent = -1;
    int tri = -1, le = -1;  // the triangle the path is in, entered over its local edge le (-1: from its corner `corner`)
    int corner = -1;
    int edge = -1, gap = -1;  // the crossing that brought it here
    double place = 0;         // where it came in, on the triangle's perimeter
    Vec2 p;
  };
  std::vector<Node> nodes;
  using Item = std::pair<double, int>;
  std::priority_queue<Item, std::vector<Item>, std::greater<>> open;
  std::map<std::tuple<int, int, int>, double> seen;  // (triangle, local edge or -1 - corner, gap) -> best g
  auto push = [&](Node nd) {
    const auto key = std::tuple(nd.tri, nd.le >= 0 ? nd.le : -1 - nd.corner, nd.gap);
    auto [it, fresh] = seen.try_emplace(key, nd.g);
    if (!fresh) {
      if (it->second <= nd.g) return;
      it->second = nd.g;
    }
    nodes.push_back(nd);
    open.push({nd.g + (G.p - nd.p).len(), int(nodes.size()) - 1});
  };
  auto usable = [&](int tri) { return tri >= 0 && m.tris[tri].inside && !m.tris[tri].blocked; };
  // The start: every triangle at the start vertex, or the triangle beyond the kept crossing.
  if (S.vertex >= 0) {
    for (int tri : m.verts[S.vertex].tris)
      if (usable(tri)) push({0, -1, tri, -1, m.localVertex(tri, S.vertex), -1, -1, double(m.localVertex(tri, S.vertex)), S.p});
  } else if (usable(S.tri)) {
    const int le = m.localEdge(S.tri, S.edge);
    push({0, -1, S.tri, le, -1, S.edge, -1, perimeter(m, S.tri, le, S.f), S.p});
  }
  int goal = -1;
  double goalCost = 0;
  while (!open.empty()) {
    const auto [f, ni] = open.top();
    open.pop();
    const Node nd = nodes[size_t(ni)];
    {
      const auto key = std::tuple(nd.tri, nd.le >= 0 ? nd.le : -1 - nd.corner, nd.gap);
      if (seen[key] < nd.g) continue;
    }
    const Tri& T = m.tris[nd.tri];
    // The goal from here: the end vertex at the corner opposite the edge come in over (or, straight from the
    // start vertex, along the edge between the two), or the kept crossing on another edge of this triangle.
    if (G.vertex >= 0) {
      if (nd.le >= 0 && T.v[nd.le] == G.vertex && planar(nd.tri, nd.place, double(nd.le))) {
        goal = ni;
        goalCost = nd.g + (G.p - nd.p).len();
        break;
      }
      if (nd.le < 0) {
        const int j = m.localVertex(nd.tri, G.vertex);
        if (j >= 0 && j != nd.corner) {
          // Along the edge between the two end vertices: only a free one.
          const int e = T.e[3 - nd.corner - j];
          const Edge& E = m.edges[e];
          if (!E.constrained && (E.along < 0 || isAbsent(E.along)) && present(E).empty()) {
            out.along = true;
            out.alongEdge = e;
            out.length = (G.p - S.p).len();
            return out;
          }
        }
      }
    } else if (nd.tri == G.tri) {
      const int j = m.localEdge(nd.tri, G.edge);
      if (j >= 0 && j != nd.le && planar(nd.tri, nd.place, perimeter(m, nd.tri, j, G.f))) {
        goal = ni;
        goalCost = nd.g + (G.p - nd.p).len();
        break;
      }
    }
    for (int j = 0; j < 3; ++j) {
      if (j == nd.le) continue;
      if (nd.le < 0 && j != nd.corner) continue;  // from a corner: over the opposite edge only
      const int e = T.e[j];
      const int next = T.nb[j];
      if (!usable(next)) continue;
      const Edge& E = m.edges[e];
      if (E.constrained || e == S.edge || e == G.edge) continue;
      // Never over an edge at the wire's own end vertex (its first and last crossings are not at its ends).
      if (S.vertex >= 0 && (E.v[0] == S.vertex || E.v[1] == S.vertex)) continue;
      if (G.vertex >= 0 && (E.v[0] == G.vertex || E.v[1] == G.vertex)) continue;
      const std::vector<int> cids = present(E);
      for (int gap = 0; gap <= int(cids.size()); ++gap) {
        if (!planar(nd.tri, nd.place, gapPlace(nd.tri, j, E, cids, gap))) continue;
        const Fit& ft = fit(e, cids, gap);
        if (!ft.ok) continue;
        const int le = m.localEdge(next, e);
        push({nd.g + (ft.p - nd.p).len(), ni, next, le, -1, e, gap, gapPlace(next, le, E, cids, gap), ft.p});
      }
    }
  }
  if (goal < 0) return std::nullopt;
  out.length = goalCost;
  std::set<int> edges;
  for (int ni = goal; ni >= 0; ni = nodes[size_t(ni)].parent) {
    const Node& nd = nodes[size_t(ni)];
    if (nd.gap < 0) continue;  // the start
    if (!edges.insert(nd.edge).second) return std::nullopt;  // an edge twice: the gaps would not hold
    out.steps.push_back({nd.edge, nd.gap});
  }
  std::ranges::reverse(out.steps);
  // The gaps were counted without the wire's own middle crossings; they are about to go.
  return out;
}

void applyRelay(Topology& t, int wi, const RelayPath& path) {
  Wire& w = t.wires[wi];
  LayerMesh& m = *t.mesh(w.layer);
  const int was = int(w.cross.size());
  std::set<int> touched;
  // The middle goes: out of its edges' lists, the records left dead (ids are never reused).
  for (int i = path.first; i < path.last; ++i) {
    const int cid = w.cross[size_t(i)];
    Edge& E = m.edges[t.crossings[cid].edge];
    std::erase(E.cross, cid);
    touched.insert(t.crossings[cid].edge);
    t.crossings[cid] = Crossing{};
  }
  for (int e = 0; e < int(m.edges.size()); ++e)
    if (m.edges[e].along == wi) m.edges[e].along = -1;
  std::vector<int> fresh;
  for (const RelayPath::Step& s : path.steps) {
    const int cid = int(t.crossings.size());
    Crossing c;
    c.wire = wi;
    c.edge = s.edge;
    c.width = double(w.width);
    t.crossings.push_back(c);
    Edge& E = m.edges[s.edge];
    E.cross.insert(E.cross.begin() + std::min<int>(s.gap, int(E.cross.size())), cid);
    touched.insert(s.edge);
    fresh.push_back(cid);
  }
  std::vector<int> cross(w.cross.begin(), w.cross.begin() + path.first);
  cross.insert(cross.end(), fresh.begin(), fresh.end());
  cross.insert(cross.end(), w.cross.begin() + path.last, w.cross.end());
  w.cross = std::move(cross);
  for (int i = 0; i < int(w.cross.size()); ++i) t.crossings[w.cross[size_t(i)]].idx = i;
  if (path.along && path.alongEdge >= 0) m.edges[path.alongEdge].along = wi;
  // The wire leaves a vertex end another way now: where the tracks left its copper says nothing any more.
  if (path.first == 0) w.hasExit[0] = false;
  if (path.last == was) w.hasExit[1] = false;
  w.dirty = true;
  for (int e : touched) refreshEdge(t, m, e);
}

void takeOut(Topology& t, int wi) {
  const Wire& w = t.wires[size_t(wi)];
  RelayPath none;
  middleOf(t, *t.mesh(w.layer), w, none.first, none.last);
  applyRelay(t, wi, none);
}

std::vector<int> wiresRound(const Topology& t, LayerId layer, int ownerA, int ownerB, int net, int self, const std::vector<char>* fixed, size_t most) {
  const LayerMesh& m = *t.mesh(layer);
  std::vector<int> out;
  for (const Edge& E : m.edges) {
    if (E.v[0] < 0 || E.cross.empty()) continue;
    const int o0 = m.verts[E.v[0]].owner, o1 = m.verts[E.v[1]].owner;
    if (o0 != ownerA && o0 != ownerB && o1 != ownerA && o1 != ownerB) continue;
    for (int cid : E.cross) {
      const int other = t.crossings[cid].wire;
      if (other < 0 || other == self) continue;
      const Wire& x = t.wires[size_t(other)];
      if (x.net == net || x.locked || x.end[0] < 0 || x.end[1] < 0) continue;
      if (fixed && x.net >= 0 && x.net < int(fixed->size()) && (*fixed)[size_t(x.net)]) continue;
      if (std::ranges::find(out, other) == out.end()) out.push_back(other);
    }
  }
  if (out.size() > most) out.resize(most);
  return out;
}

std::optional<PastResult> relayPast(Topology& t, int wire, const std::vector<int>& holders, double limit, const std::vector<char>* avoid,
                                    std::optional<Topology>& saved, int most) {
  if (holders.empty()) return std::nullopt;
  auto fits = [&](const std::vector<int>& absent) {
    const std::optional<RelayPath> p = findRelay(t, wire, avoid, &absent);
    return p && p->length <= limit;
  };
  // With all of them out there is no way either: no clinch, and none of them is tried alone.
  if (holders.size() > 1 && !fits(holders)) return std::nullopt;
  std::vector<int> out;
  for (int h : holders)
    if (fits({h})) {
      out = {h};
      break;
    }
  if (out.empty()) {
    if (holders.size() < 2) return std::nullopt;
    // Several hold it: those the path does without go back, one by one.
    out = holders;
    for (int h : holders) {
      std::vector<int> less = out;
      std::erase(less, h);
      if (!less.empty() && fits(less)) out = std::move(less);
    }
    if (int(out.size()) > most) return std::nullopt;
  }
  PastResult r;
  for (int h : out) r.othersBefore += tautLength(t, h);
  std::ranges::sort(out, [&](int x, int y) { return tautLength(t, x) < tautLength(t, y); });
  saved = t;
  auto back = [&] {
    t = std::move(*saved);
    saved.reset();
    return std::nullopt;
  };
  for (int h : out) takeOut(t, h);
  const std::optional<RelayPath> own = findRelay(t, wire, avoid);
  if (!own || own->length > limit) return back();
  applyRelay(t, wire, *own);
  for (int h : out) {
    const std::optional<RelayPath> p = findRelay(t, h, avoid);
    if (!p) return back();
    applyRelay(t, h, *p);
  }
  r.taken = out;
  r.length = tautLength(t, wire);
  for (int h : out) r.othersAfter += tautLength(t, h);
  return r;
}

}  // namespace xr::topo
