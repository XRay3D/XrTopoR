// The topological model: owners, the mesh of every layer, and what the tools do with them.
#include <gtest/gtest.h>

#include <cmath>
#include <set>
#include <string>

#include "io/BoardIO.h"
#include "topo/Flip.h"
#include "topo/Topology.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// V - E + F of the inside region of a layer's mesh.
int euler(const topo::LayerMesh& m) {
  std::set<int> vs, es;
  int f = 0;
  for (int ti = 0; ti < int(m.tris.size()); ++ti) {
    const topo::Tri& t = m.tris[ti];
    if (!t.inside) continue;
    ++f;
    for (int i = 0; i < 3; ++i) {
      vs.insert(t.v[i]);
      es.insert(t.e[i]);
    }
  }
  return int(vs.size()) - int(es.size()) + f;
}

}  // namespace

TEST(Topo, PerLayerMeshBuild) {
  for (const char* name : {"topor/Example_03/arz_2L.fst", "topor/Example_04/Arcs_master.pcb"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    const Board& b = **lb;
    topo::Topology t;
    t.build(b);
    EXPECT_EQ(t.check(), std::vector<std::string>{}) << name;
    EXPECT_EQ(t.layers.size(), b.copperLayers().size()) << name;
    for (const topo::LayerMesh& m : t.layers) {
      // A connected region with as many holes as the outline has inner loops.
      EXPECT_EQ(euler(m), 1 - std::max(0, int(b.outline.size()) - 1)) << name << " layer " << m.layer;
      for (int oi = 0; oi < int(t.owners.size()); ++oi) {
        const topo::Owner& o = t.owners[oi];
        bool here = (o.layers >> m.layer) & 1;
        EXPECT_EQ(!m.ownerVerts[oi].empty(), here) << name << " owner " << oi;
        if (!here || o.kind != topo::Owner::Kind::Pad) continue;
        // An elongated pad has its centre and its two ends.
        EXPECT_EQ(m.ownerVerts[oi].size(), o.axis.len2() > 0 ? 3u : 1u) << name << " pad " << o.pad;
        for (int v : m.ownerVerts[oi]) EXPECT_TRUE(o.shape.contains(m.verts[v].p)) << name << " pad " << o.pad;
      }
    }
    // Every via is on every layer it spans, nowhere else.
    for (const topo::Owner& o : t.owners)
      if (o.kind == topo::Owner::Kind::Via)
        for (const topo::LayerMesh& m : t.layers) EXPECT_EQ(m.ownerVerts[&o - t.owners.data()].empty(), !b.vias[o.via].onLayer(m.layer));
  }
}

TEST(Topo, AssignsIdsOnce) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology::assignIds(b);
  std::set<uint32_t> ids;
  for (const Track& t : b.tracks) EXPECT_TRUE(t.id && ids.insert(t.id).second);
  for (const Via& v : b.vias) EXPECT_TRUE(v.id && ids.insert(v.id).second);
  uint32_t first = b.tracks[0].id;
  b.tracks.push_back(b.tracks[0]);
  b.tracks.back().id = 0;
  topo::Topology::assignIds(b);
  EXPECT_EQ(b.tracks[0].id, first);
  EXPECT_FALSE(ids.contains(b.tracks.back().id));
}

namespace {

// One copper layer 50 x 50 mm with `n` round pads scattered on a jittered grid.
Board scatteredPads(int n, unsigned seed) {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(50, 0), mm(50, 50), mm(0, 50)});
  Component c;
  c.ref = "U1";
  b.components.push_back(c);
  int side = int(std::ceil(std::sqrt(double(n))));
  unsigned x = seed;
  auto rnd = [&] { x = x * 1664525u + 1013904223u; return (x >> 8) / double(1u << 24); };
  for (int i = 0; i < n; ++i) {
    double cell = 46.0 / side;
    Pad p;
    p.number = std::to_string(i);
    p.component = 0;
    p.pos = Point(mm(2 + cell * (i % side + 0.1 + 0.8 * rnd()), 2 + cell * (i / side + 0.1 + 0.8 * rnd())));
    p.shape.w = p.shape.h = mmToNm(0.3);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  }
  return b;
}

}  // namespace

TEST(Topo, LawsonIsDelaunay) {
  Board b = scatteredPads(2000, 7);
  topo::Topology t;
  t.build(b);
  ASSERT_EQ(t.layers.size(), 1u);
  topo::LayerMesh& m = t.layers[0];
  ASSERT_EQ(t.check(), std::vector<std::string>{});
  // Scrambled by random flips of convex quads (a valid triangulation, but no longer Delaunay).
  unsigned x = 11;
  int scrambled = 0;
  for (int k = 0; k < 20000; ++k) {
    x = x * 1664525u + 1013904223u;
    scrambled += topo::flip(m, int((x >> 8) % m.edges.size()));
  }
  EXPECT_GT(scrambled, 1000);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  int notDelaunay = 0;
  for (int e = 0; e < int(m.edges.size()); ++e) {
    if (!topo::flippable(m, e)) continue;
    const topo::Edge& E = m.edges[e];
    const topo::Tri& T1 = m.tris[E.t[0]];
    int i = m.localEdge(E.t[0], e);
    const topo::Tri& T2 = m.tris[E.t[1]];
    notDelaunay += topo::inCircle(m.verts[T1.v[i]].p, m.verts[T1.v[(i + 1) % 3]].p, m.verts[T1.v[(i + 2) % 3]].p,
                                  m.verts[T2.v[m.localEdge(E.t[1], e)]].p);
  }
  EXPECT_GT(notDelaunay, 0);
  int flips = topo::flipLoop(m);
  EXPECT_GT(flips, 0);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  // Locally Delaunay everywhere, which for a triangulation means Delaunay.
  for (int e = 0; e < int(m.edges.size()); ++e) {
    if (!topo::flippable(m, e)) continue;
    const topo::Edge& E = m.edges[e];
    const topo::Tri& T1 = m.tris[E.t[0]];
    int i = m.localEdge(E.t[0], e);
    const topo::Tri& T2 = m.tris[E.t[1]];
    EXPECT_FALSE(topo::inCircle(m.verts[T1.v[i]].p, m.verts[T1.v[(i + 1) % 3]].p, m.verts[T1.v[(i + 2) % 3]].p,
                                m.verts[T2.v[m.localEdge(E.t[1], e)]].p)) << "edge " << e;
  }
  EXPECT_EQ(topo::flipLoop(m), 0);
}
