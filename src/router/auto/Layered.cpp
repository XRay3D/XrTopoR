#include "router/auto/Layered.h"

#include <algorithm>
#include <map>
#include <queue>
#include <set>
#include <unordered_map>

#include "topo/Capacity.h"

namespace xr::autoroute {

using namespace xr::topo;

namespace {

// A place on a triangle's perimeter (as in Relay.cpp): corner i at i, the edge opposite corner i between i + 1 and
// i + 2, `f` of the way from the edge's v[0].
double perimeter(const LayerMesh& m, int tri, int le, double f) {
  const Tri& T = m.tris[size_t(tri)];
  const Edge& E = m.edges[size_t(T.e[le])];
  const bool sameWay = E.v[0] == T.v[(le + 1) % 3];
  return (le + 1) % 3 + (sameWay ? f : 1 - f);
}
bool chordsCross(double p, double q, double x, double y) {
  if (p > q) std::swap(p, q);
  auto inside = [&](double z) { return z > p + 1e-9 && z < q - 1e-9; };
  auto on = [&](double z) { return std::abs(z - p) <= 1e-9 || std::abs(z - q) <= 1e-9; };
  if (on(x) || on(y)) return false;
  return inside(x) != inside(y);
}

struct Chord {
  double a, b;
  int net, layer;
};

}  // namespace

std::optional<LayeredPath> findLayeredPath(const Topology& t, int wi, const std::vector<std::vector<int>>& chordLayer, const LayeredCosts& c,
                                           uint32_t startLayers, uint32_t endLayers) {
  const Wire& w = t.wires[size_t(wi)];
  const LayerMesh& m = *t.mesh(w.layer);
  const int NL = c.layers;
  const uint32_t all = (1u << NL) - 1;
  if (!(startLayers & all)) startLayers = all;
  if (!(endLayers & all)) endLayers = all;
  const int S = w.endVertex[0], G = w.endVertex[1];
  const Vec2 goalP = m.verts[size_t(G)].p;
  auto layerOf = [&](int wire, int chord) {
    const auto& v = chordLayer[size_t(wire)];
    return chord >= 0 && chord < int(v.size()) ? v[size_t(chord)] : 0;
  };

  std::unordered_map<int, std::vector<Chord>> chordCache;
  auto chords = [&](int tri) -> const std::vector<Chord>& {
    auto [it, fresh] = chordCache.try_emplace(tri);
    if (!fresh) return it->second;
    const Tri& T = m.tris[size_t(tri)];
    for (int i = 0; i < 3; ++i) {
      const Edge& E = m.edges[size_t(T.e[i])];
      const int n = int(E.cross.size());
      for (int k = 0; k < n; ++k) {
        const Crossing& x = t.crossings[size_t(E.cross[size_t(k)])];
        if (x.wire < 0 || x.wire == wi) continue;
        const Wire& X = t.wires[size_t(x.wire)];
        const double here = perimeter(m, tri, i, double(k + 1) / (n + 1));
        const int nx = int(X.cross.size());
        if (x.idx == 0 && T.v[i] == X.endVertex[0]) it->second.push_back({here, double(i), X.net, layerOf(x.wire, 0)});
        if (x.idx == nx - 1 && T.v[i] == X.endVertex[1]) it->second.push_back({here, double(i), X.net, layerOf(x.wire, nx)});
        if (x.idx + 1 < nx) {
          const Crossing& d = t.crossings[size_t(X.cross[size_t(x.idx + 1)])];
          const int j = m.localEdge(tri, d.edge);
          if (j >= 0 && j != i) {
            const Edge& F = m.edges[size_t(d.edge)];
            const int kf = int(r::find(F.cross, X.cross[size_t(x.idx + 1)]) - F.cross.begin());
            it->second.push_back({here, perimeter(m, tri, j, double(kf + 1) / (F.cross.size() + 1)), X.net, layerOf(x.wire, x.idx + 1)});
          }
        }
      }
    }
    return it->second;
  };
  // The chord p - q on layer l crosses no chord of another net on that layer.
  auto legal = [&](int tri, double p, double q, int l) {
    for (const Chord& ch : chords(tri))
      if (ch.net != w.net && ch.layer == l && chordsCross(p, q, ch.a, ch.b)) return false;
    return true;
  };
  auto gapPlace = [&](int tri, int le, int n, int gap) { return perimeter(m, tri, le, (gap + 0.5) / (n + 1)); };
  // Room on layer l at the gap of edge e: the wires crossing it on l (a via there takes both its layers), and this one.
  std::map<std::tuple<int, int, int>, bool> roomCache;
  std::map<std::tuple<int, int, int>, double> slackOf;
  auto room = [&](int e, int gap, int l) {
    auto [it, fresh] = roomCache.try_emplace({e, gap, l}, false);
    if (!fresh) return it->second;
    const Edge& E = m.edges[size_t(e)];
    // A side of the wire's own end pad (its corner ring): crossed on the way out, whatever the capacity says.
    const int o0 = m.verts[size_t(E.v[0])].owner;
    if (o0 == m.verts[size_t(E.v[1])].owner && (o0 == w.end[0] || o0 == w.end[1])) return it->second = true;
    std::vector<int> ws;
    int before = 0;
    for (int k = 0; k < int(E.cross.size()); ++k) {
      const Crossing& x = t.crossings[size_t(E.cross[size_t(k)])];
      if (x.wire < 0) continue;
      if (layerOf(x.wire, x.idx) != l && layerOf(x.wire, x.idx + 1) != l) continue;
      ws.push_back(x.wire);
      before += k < gap;
    }
    ws.insert(ws.begin() + before, wi);
    const int along = E.along >= 0 && layerOf(E.along, 0) == l ? E.along : -1;
    const EdgeCapacity cap = capacityOf(t, m, E.v[0], E.v[1], ws, along);
    it->second = cap.cls < 3 && cap.deficit <= 0;
    slackOf[{e, gap, l}] = cap.slack;
    return it->second;
  };
  // A via at the gap: the wire's room on both layers and the via's width beyond the wire's.
  auto viaRoom = [&](int e, int gap, int l0, int l1) {
    if (!room(e, gap, l0) || !room(e, gap, l1)) return false;
    const double extra = c.viaDiameter - double(w.width);
    return slackOf[{e, gap, l0}] >= extra && slackOf[{e, gap, l1}] >= extra;
  };
  std::unordered_map<int, EdgeCapacity> capCache;
  auto pointAt = [&](int e, int gap) {
    auto [it, fresh] = capCache.try_emplace(e);
    if (fresh) it->second = edgeCapacity(t, m, e);
    const EdgeCapacity& cap = it->second;
    const Edge& E = m.edges[size_t(e)];
    const Vec2 U = m.verts[size_t(E.v[0])].p, V = m.verts[size_t(E.v[1])].p;
    const int n = int(E.cross.size());
    const double f = cap.L > 0 && cap.freeLen > 0 ? (cap.reachU + cap.freeLen * (gap + 1.0) / (n + 2)) / cap.L : (gap + 1.0) / (n + 2);
    return U + (V - U) * f;
  };
  auto usable = [&](int tri) {
    if (tri < 0) return false;
    const Tri& T = m.tris[size_t(tri)];
    return T.inside && !T.blocked && (T.zone < 0 || t.owners[size_t(T.zone)].net == w.net);
  };

  struct Node {
    double g = 0;
    int parent = -1;
    int tri = -1, le = -1, corner = -1;
    int edge = -1, gap = -1;
    int layer = 0;
    double place = 0;
    Vec2 p;
  };
  std::vector<Node> nodes;
  using Item = std::pair<double, int>;
  std::priority_queue<Item, std::vector<Item>, std::greater<>> open;
  std::map<std::tuple<int, int, int, int>, double> seen;
  auto push = [&](Node nd) {
    const auto key = std::tuple(nd.tri, nd.le >= 0 ? nd.le : -1 - nd.corner, nd.gap, nd.layer);
    auto [it, fresh] = seen.try_emplace(key, nd.g);
    if (!fresh) {
      if (it->second <= nd.g) return;
      it->second = nd.g;
    }
    nodes.push_back(nd);
    open.push({nd.g + (goalP - nd.p).len(), int(nodes.size()) - 1});
  };
  const Vec2 startP = m.verts[size_t(S)].p;
  for (int tri : m.verts[size_t(S)].tris)
    if (usable(tri))
      for (int l = 0; l < NL; ++l)
        if ((startLayers >> l) & 1) {
          const int corner = m.localVertex(tri, S);
          push({0, -1, tri, -1, corner, -1, -1, l, double(corner), startP});
        }
  int goal = -1;
  double goalCost = 0;
  LayeredPath out;
  constexpr size_t kMaxNodes = 2'000'000;
  while (!open.empty() && nodes.size() < kMaxNodes) {
    const auto [f, ni] = open.top();
    open.pop();
    const Node nd = nodes[size_t(ni)];
    if (seen[std::tuple(nd.tri, nd.le >= 0 ? nd.le : -1 - nd.corner, nd.gap, nd.layer)] < nd.g) continue;
    const Tri& T = m.tris[size_t(nd.tri)];
    if (nd.le >= 0 && T.v[nd.le] == G && ((endLayers >> nd.layer) & 1) && legal(nd.tri, nd.place, double(nd.le), nd.layer)) {
      goal = ni;
      goalCost = nd.g + (goalP - nd.p).len();
      break;
    }
    if (nd.le < 0) {  // straight along a free edge to the goal (two neighbouring vertices)
      const int j = m.localVertex(nd.tri, G);
      if (j >= 0 && j != nd.corner && ((endLayers >> nd.layer) & 1)) {
        const Edge& E = m.edges[size_t(T.e[3 - nd.corner - j])];
        if (!E.constrained && E.along < 0 && E.cross.empty()) {
          out.path.along = true;
          out.path.alongEdge = T.e[3 - nd.corner - j];
          out.chordLayer = {nd.layer};
          out.cost = (goalP - startP).len();
          return out;
        }
      }
    }
    for (int j = 0; j < 3; ++j) {
      if (j == nd.le) continue;
      if (nd.le < 0 && j != nd.corner) continue;
      const int e = T.e[j];
      const int next = T.nb[j];
      if (!usable(next)) continue;
      const Edge& E = m.edges[size_t(e)];
      if (E.constrained || E.v[0] == S || E.v[1] == S || E.v[0] == G || E.v[1] == G) continue;
      // Along it runs another net's wire: crossing the edge crosses that wire, on another layer only.
      const bool alongOther = E.along >= 0 && E.along != wi && t.wires[size_t(E.along)].net != w.net;
      const int n = int(E.cross.size());
      const int le = m.localEdge(next, e);
      for (int gap = 0; gap <= n; ++gap) {
        if (!legal(nd.tri, nd.place, gapPlace(nd.tri, j, n, gap), nd.layer)) continue;
        if (alongOther && layerOf(E.along, 0) == nd.layer) continue;
        if (!room(e, gap, nd.layer)) continue;
        const Vec2 p = pointAt(e, gap);
        const double step = (p - nd.p).len();
        for (int l = 0; l < NL; ++l) {
          if (l != nd.layer && (!viaRoom(e, gap, nd.layer, l) || (alongOther && layerOf(E.along, 0) == l))) continue;
          push({nd.g + step + (l != nd.layer ? c.via : 0), ni, next, le, -1, e, gap, l, gapPlace(next, le, n, gap), p});
        }
      }
    }
  }
  if (goal < 0) return std::nullopt;
  out.cost = goalCost;
  std::set<int> edges;
  std::vector<int> layersRev;
  for (int ni = goal; ni >= 0; ni = nodes[size_t(ni)].parent) {
    const Node& nd = nodes[size_t(ni)];
    layersRev.push_back(nd.layer);
    if (nd.gap < 0) continue;
    if (!edges.insert(nd.edge).second) return std::nullopt;  // an edge twice: the gaps would not hold
    out.path.steps.push_back({nd.edge, nd.gap});
  }
  r::reverse(out.path.steps);
  r::reverse(layersRev);
  out.chordLayer = layersRev;  // the start's layer, then the layer after each edge
  out.path.first = out.path.last = 0;
  for (size_t k = 1; k < out.chordLayer.size(); ++k) out.vias += out.chordLayer[k] != out.chordLayer[k - 1];
  return out;
}

}  // namespace xr::autoroute
