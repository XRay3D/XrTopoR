#include "core/Connectivity.h"

#include <limits>
#include <map>
#include <numeric>

#include "core/Prof.h"

namespace xr {

namespace {
struct Dsu {
  std::vector<int> p;
  explicit Dsu(int n) : p(n) { r::iota(p, 0); }
  int find(int x) { while (p[x] != x) x = p[x] = p[p[x]]; return x; }
  void unite(int a, int b) { p[find(a)] = find(b); }
};

struct Anchor {
  Vec2 p;
  ItemRef ref;
};
}  // namespace

Connectivity Connectivity::compute(const Board& b) {
  SpatialIndex idx;
  {
    ProfScope ps("conn.index");
    idx.build(b);
  }
  return compute(b, idx);
}

Connectivity Connectivity::compute(const Board& b, const SpatialIndex& idx) {
  const int P = int(b.pads.size()), T = int(b.tracks.size()), V = int(b.vias.size()), Z = int(b.zones.size());
  auto id = [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Pad: return r.index;
      case ItemType::Track: return P + r.index;
      case ItemType::Via: return P + T + r.index;
      case ItemType::Zone: return P + T + V + r.index;
    }
    return 0;
  };
  Dsu dsu(P + T + V + Z);
  const double eps = 1000;  // 1 um contact tolerance

  // An item's shapes and their boxes, made once: a pour's fill is polygons of thousands of points, and every
  // track, via and pad of its net asks for them (made anew for each, a board with four pours took 130 ms).
  struct Cached {
    std::vector<Shape> shapes;
    std::vector<BBox> boxes;
    bool made = false;
  };
  std::vector<Cached> cache(size_t(P + T + V + Z));
  auto shapesOf = [&](ItemRef r) -> const Cached& {
    Cached& c = cache[size_t(id(r))];
    if (!c.made) {
      c.shapes = itemShapes(b, r);
      c.boxes.reserve(c.shapes.size());
      for (const Shape& s : c.shapes) c.boxes.push_back(s.bbox());
      c.made = true;
    }
    return c;
  };
  // Two shapes whose boxes are further apart than the tolerance do not touch: no need to measure.
  auto apart = [&](const BBox& p, const BBox& q) {
    return p.minX - q.maxX > eps || q.minX - p.maxX > eps || p.minY - q.maxY > eps || q.minY - p.maxY > eps;
  };
  auto connect = [&](ItemRef r) {
    int net = itemNet(b, r);
    if (net == kNoNet) return;
    const Cached& mine = shapesOf(r);
    LayerMask lm = itemLayers(b, r);
    BBox bb;
    for (const BBox& sb : mine.boxes) bb.add(sb);
    idx.query(bb.inflated(eps), lm, [&](ItemRef o) {
      if (o == r || itemNet(b, o) != net) return;
      if (dsu.find(id(o)) == dsu.find(id(r))) return;
      const Cached& theirs = shapesOf(o);
      for (size_t i = 0; i < mine.shapes.size(); ++i)
        for (size_t k = 0; k < theirs.shapes.size(); ++k) {
          if (apart(mine.boxes[i], theirs.boxes[k])) continue;
          if (mine.shapes[i].distance(theirs.shapes[k], eps) <= eps) { dsu.unite(id(r), id(o)); return; }
        }
    });
  };
  {
    ProfScope ps("conn.tracks");
    for (int i = 0; i < T; ++i) connect({ItemType::Track, i});
  }
  {
    ProfScope ps("conn.vias");
    for (int i = 0; i < V; ++i) connect({ItemType::Via, i});
  }
  {
    ProfScope ps("conn.zones");
    for (int i = 0; i < Z; ++i) connect({ItemType::Zone, i});
  }
  ProfScope psMst("conn.clusters");

  Connectivity c;
  c.padCluster.assign(P, -1);
  c.trackCluster.assign(T, -1);
  c.viaCluster.assign(V, -1);

  // Group anchors per net and cluster.
  std::map<int, std::map<int, std::vector<Anchor>>> nets;
  for (int i = 0; i < P; ++i) {
    if (b.pads[i].net == kNoNet) continue;
    int cl = dsu.find(i);
    c.padCluster[i] = cl;
    nets[b.pads[i].net][cl].push_back({b.pads[i].pos.v(), {ItemType::Pad, i}});
  }
  for (int i = 0; i < V; ++i) {
    if (b.vias[i].net == kNoNet) continue;
    int cl = dsu.find(P + T + i);
    c.viaCluster[i] = cl;
    nets[b.vias[i].net][cl].push_back({b.vias[i].pos.v(), {ItemType::Via, i}});
  }
  for (int i = 0; i < T; ++i) {
    if (b.tracks[i].net == kNoNet) continue;
    int cl = dsu.find(P + i);
    c.trackCluster[i] = cl;
    auto& v = nets[b.tracks[i].net][cl];
    v.push_back({b.tracks[i].a.v(), {ItemType::Track, i}});
    v.push_back({b.tracks[i].b.v(), {ItemType::Track, i}});
  }

  for (auto& [net, clusters] : nets) {
    // Only clusters containing a pad matter (stray track islands still count as clusters).
    std::vector<std::vector<Anchor>*> cl;
    for (auto& [k, v] : clusters) cl.push_back(&v);
    int n = int(cl.size());
    if (n <= 1) continue;
    ++c.unroutedNets;
    // Prim's MST over clusters, edge weight = closest anchor pair.
    std::vector<bool> in(n, false);
    std::vector<double> best(n, std::numeric_limits<double>::max());
    std::vector<std::pair<Anchor, Anchor>> link(n);
    in[0] = true;
    auto relax = [&](int from) {
      for (int j = 0; j < n; ++j) {
        if (in[j]) continue;
        for (auto& a : *cl[from])
          for (auto& bb : *cl[j]) {
            double d = (a.p - bb.p).len2();
            if (d < best[j]) { best[j] = d; link[j] = {a, bb}; }
          }
      }
    };
    relax(0);
    for (int it = 1; it < n; ++it) {
      int pick = -1;
      for (int j = 0; j < n; ++j)
        if (!in[j] && (pick < 0 || best[j] < best[pick])) pick = j;
      in[pick] = true;
      c.ratsnest.push_back({net, link[pick].first.p, link[pick].second.p, link[pick].first.ref, link[pick].second.ref});
      relax(pick);
    }
  }
  return c;
}

}  // namespace xr
