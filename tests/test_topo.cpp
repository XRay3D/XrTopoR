// The topological model: owners, the mesh of every layer, and what the tools do with them.
#include <gtest/gtest.h>

#include <set>
#include <string>

#include "io/BoardIO.h"
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
