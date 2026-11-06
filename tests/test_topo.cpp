// The topological model: owners, the mesh of every layer, and what the tools do with them.
#include <gtest/gtest.h>

#include <algorithm>
#include <chrono>
#include <cmath>
#include <filesystem>
#include <format>
#include <print>
#include <numbers>
#include <random>
#include <set>
#include <string>

#include "core/Connectivity.h"
#include "core/Rules.h"
#include "core/SpatialIndex.h"
#include "core/ZoneFill.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "topo/Capacity.h"
#include "topo/Chains.h"
#include "topo/Flip.h"
#include "topo/Move.h"
#include "topo/RelayStats.h"
#include "topo/Sidecar.h"
#include "router/topo/ModelRefine.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "router/topo/Wires.h"
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
        // An oval has its two ends; a polygon its centre and its corners; a round pad its centre.
        const Pad& pad = b.pads[o.pad];
        Shape ps = pad.shapeGeom();
        size_t want = ps.kind == Shape::Kind::Polygon ? ps.poly.size() + 1 : ps.kind == Shape::Kind::Segment ? 2u : 1u;
        EXPECT_EQ(m.ownerVerts[oi].size(), want) << name << " pad " << o.pad;
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
    scrambled += topo::flip(t, m, int((x >> 8) % m.edges.size()));
  }
  EXPECT_GT(scrambled, 1000);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  int notDelaunay = 0;
  for (int e = 0; e < int(m.edges.size()); ++e) {
    if (!topo::flippable(t, m, e)) continue;
    const topo::Edge& E = m.edges[e];
    const topo::Tri& T1 = m.tris[E.t[0]];
    int i = m.localEdge(E.t[0], e);
    const topo::Tri& T2 = m.tris[E.t[1]];
    notDelaunay += topo::inCircle(m.verts[T1.v[i]].p, m.verts[T1.v[(i + 1) % 3]].p, m.verts[T1.v[(i + 2) % 3]].p,
                                  m.verts[T2.v[m.localEdge(E.t[1], e)]].p);
  }
  EXPECT_GT(notDelaunay, 0);
  int flips = topo::flipLoop(t, m);
  EXPECT_GT(flips, 0);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  // Locally Delaunay everywhere, which for a triangulation means Delaunay.
  for (int e = 0; e < int(m.edges.size()); ++e) {
    if (!topo::flippable(t, m, e)) continue;
    const topo::Edge& E = m.edges[e];
    const topo::Tri& T1 = m.tris[E.t[0]];
    int i = m.localEdge(E.t[0], e);
    const topo::Tri& T2 = m.tris[E.t[1]];
    EXPECT_FALSE(topo::inCircle(m.verts[T1.v[i]].p, m.verts[T1.v[(i + 1) % 3]].p, m.verts[T1.v[(i + 2) % 3]].p,
                                m.verts[T2.v[m.localEdge(E.t[1], e)]].p)) << "edge " << e;
  }
  EXPECT_EQ(topo::flipLoop(t, m), 0);
}

namespace {

// One edge between two round pads 1 mm across, `wires` wires of another net crossing it.
topo::Topology edgeModel(double lengthMm, int wires, double widthMm, double minWidthMm) {
  topo::Topology t;
  for (int i = 0; i < 2; ++i) {
    topo::Owner o;
    o.kind = topo::Owner::Kind::Pad;
    o.net = i;
    o.c = {i * lengthMm * kNmPerMm, 0};
    o.halfWidth = 0.5 * kNmPerMm;
    o.shape = Shape::circle(o.c, o.halfWidth);
    o.layers = 1;
    t.owners.push_back(o);
  }
  topo::LayerMesh m;
  m.layer = 0;
  m.ownerClr = {0.2 * kNmPerMm, 0.2 * kNmPerMm};
  for (int i = 0; i < 2; ++i) {
    topo::Vertex v;
    v.owner = i;
    v.p = t.owners[i].c;
    m.verts.push_back(v);
  }
  topo::Edge e;
  e.v[0] = 0;
  e.v[1] = 1;
  for (int k = 0; k < wires; ++k) {
    topo::Wire w;
    w.net = 2 + k;
    w.width = mmToNm(widthMm);
    w.widthMin = mmToNm(minWidthMm);
    w.clr = mmToNm(0.2);
    t.wires.push_back(w);
    t.crossings.push_back({k, 0, 0, double(w.width)});
    e.cross.push_back(k);
  }
  m.edges.push_back(e);
  t.layers.push_back(std::move(m));
  return t;
}

}  // namespace

TEST(Topo, CapacityIsTheRealisersPacking) {
  const double m = topo::kCapacityMargin;
  // Two wires 0.2 mm: 0.5 + 0.5 of copper, 0.4 of wire, three clearances of 0.2 and three margins.
  {
    topo::Topology t = edgeModel(3.0, 2, 0.2, 0.2);
    auto c = topo::edgeCapacity(t, t.layers[0], 0);
    EXPECT_NEAR(c.freeLen, 2.0 * kNmPerMm, 1);
    EXPECT_NEAR(c.need, 2.0 * kNmPerMm + 3 * m, 1);
    EXPECT_EQ(c.cls, 0);
    EXPECT_TRUE(c.margin);
    EXPECT_NEAR(c.a[0], 0.8 * kNmPerMm + m, 1);
    EXPECT_NEAR(c.a[1], 1.2 * kNmPerMm + 2 * m, 1);
    EXPECT_NEAR(topo::slotOf(c, 0).hi, 3.0 * kNmPerMm - 1.2 * kNmPerMm - 2 * m, 1);
    EXPECT_NEAR(topo::stackRadius(c, 1, 0), c.a[1], 0);
  }
  // Exactly the bare rule: the margin goes, as the realiser drops it.
  {
    topo::Topology t = edgeModel(2.0, 2, 0.2, 0.2);
    auto c = topo::edgeCapacity(t, t.layers[0], 0);
    EXPECT_EQ(c.cls, 1);
    EXPECT_FALSE(c.margin);
    EXPECT_NEAR(c.slack, 0, 1);
  }
  // 0.1 mm short: overflow by that much, the slots collapse to shared points in order.
  {
    topo::Topology t = edgeModel(1.9, 2, 0.2, 0.2);
    auto c = topo::edgeCapacity(t, t.layers[0], 0);
    EXPECT_EQ(c.cls, 2);
    EXPECT_NEAR(c.deficit, 0.1 * kNmPerMm, 1);
    EXPECT_LT(topo::slotOf(c, 0).mid(), topo::slotOf(c, 1).mid());
    topo::refreshEdge(t, t.layers[0], 0);
    EXPECT_EQ(t.layers[0].edges[0].cls, 2);
  }
  // Narrowing makes room: 0.3 mm wires with a minimum of 0.15 on an edge that holds 2 × 0.15.
  {
    topo::Topology t = edgeModel(1.9, 2, 0.3, 0.15);
    auto c = topo::edgeCapacity(t, t.layers[0], 0);
    EXPECT_TRUE(c.narrowed);
    EXPECT_EQ(c.cls, 1);
    EXPECT_EQ(c.deficit, 0);
    topo::refreshEdge(t, t.layers[0], 0);
    EXPECT_EQ(t.crossings[0].width, 0.15 * kNmPerMm);
  }
  // Nothing crosses: nothing is needed.
  {
    topo::Topology t = edgeModel(1.0, 0, 0.2, 0.2);
    auto c = topo::edgeCapacity(t, t.layers[0], 0);
    EXPECT_EQ(c.cls, 0);
    EXPECT_EQ(c.need, 0);
  }
}

namespace {

struct Counts {
  int crossing = 0, throughPad = 0, outside = 0, overflow = 0;
};
Counts countViolations(const topo::Topology& t) {
  Counts c;
  for (const topo::Violation& v : t.violations) {
    using K = topo::Violation::Kind;
    (v.kind == K::Crossing ? c.crossing : v.kind == K::ThroughPad ? c.throughPad : v.kind == K::OutsideBoard ? c.outside : c.overflow)++;
  }
  return c;
}

}  // namespace

TEST(Topo, ConvertsReferenceBoards) {
  struct Expect { const char* file; int crossing, throughPad, outside; };
  for (Expect x : {Expect{"topor/Example_04/Arcs_master.pcb", 0, 0, 0}, Expect{"topor/Example_03/arz_standard_routing.fst", 0, 0, 0},
                   Expect{"topor/Example_03/arz_2L.fst", 0, 0, 0}, Expect{"topor/Example_03/arz_4L.fst", 0, 0, 0}}) {
    auto lb = io::loadBoard(data(x.file));
    ASSERT_TRUE(lb.has_value()) << x.file;
    Board& b = **lb;
    topo::Topology::assignIds(b);
    topo::Topology t;
    auto t0 = std::chrono::steady_clock::now();
    t.build(b);
    double ms = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - t0).count();
    EXPECT_EQ(t.check(), std::vector<std::string>{}) << x.file;
    std::vector<char> all(b.tracks.size(), 1);
    auto g = topo::wireGraph(b, all);
    topo::OwnCopper own(b);
    topo::effectiveWidths(b, g, own);  // as the conversion builds its chains: stubs with their branches, necks with their wires
    auto chains = topo::wireChains(b, g, all, own);
    std::erase_if(chains, [](const topo::WireChain& c) { return c.closed; });
    // Chains lying inside the copper they start and end on are that copper, not wires.
    size_t real = 0;
    for (const topo::WireChain& c : chains) {
      auto r0 = own.at(c.a(), c.net, c.layer), r1 = own.at(c.b(), c.net, c.layer);
      bool inside = r0 && r1 && *r0 == *r1;
      for (size_t k = 0; inside && k < c.path.size(); ++k)
        inside = std::ranges::any_of(itemShapes(b, *r0), [&](const Shape& s) { return s.contains(c.path[k]); });
      real += !inside;
    }
    EXPECT_EQ(t.wires.size(), real) << x.file;
    Counts c = countViolations(t);
    std::println("{}: {} of {} chains are wires, {} crossings, {} junctions, {:.0f} ms; violations: crossing {}, through pad {}, outside {}, overflow {}",
                 x.file, t.wires.size(), chains.size(), t.crossings.size(), t.junctions.size(), ms, c.crossing, c.throughPad, c.outside, c.overflow);
    EXPECT_EQ(c.crossing, x.crossing) << x.file;
    EXPECT_EQ(c.throughPad, x.throughPad) << x.file;
    EXPECT_EQ(c.outside, x.outside) << x.file;
    for (const topo::Wire& w : t.wires) EXPECT_FALSE(w.cross.empty() && w.end[0] == w.end[1]) << x.file;
  }
}

namespace {

// Two nets, two pads each, on one layer 30 x 30 mm.
Board crossBoard(bool crossing) {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(30, 0), mm(30, 30), mm(0, 30)});
  int A = b.addNet("A"), B = b.addNet("B");
  Component c;
  c.ref = "U1";
  b.components.push_back(c);
  auto pad = [&](Vec2 at, int net) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = 0;
    p.net = net;
    p.pos = Point(at);
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  };
  auto track = [&](Vec2 p, Vec2 q, int net) {
    Track t;
    t.a = Point(p);
    t.b = Point(q);
    t.width = mmToNm(0.3);
    t.layer = top;
    t.net = net;
    b.tracks.push_back(t);
  };
  pad(mm(5, 15), A);
  pad(mm(25, 15), A);
  pad(mm(15, 5), B);
  pad(mm(15, 25), B);
  track(mm(5, 15), mm(25, 15), A);
  if (crossing) track(mm(15, 5), mm(15, 25), B);
  else track(mm(15, 5), mm(15, 12), B), track(mm(15, 12), mm(3, 12), B), track(mm(3, 12), mm(3, 18), B), track(mm(3, 18), mm(15, 18), B), track(mm(15, 18), mm(15, 25), B);
  return b;
}

}  // namespace

TEST(Topo, DetectsCrossing) {
  {
    Board b = crossBoard(true);
    topo::Topology t;
    t.build(b);
    Counts c = countViolations(t);
    EXPECT_EQ(c.crossing, 1);
    ASSERT_FALSE(t.violations.empty());
    const topo::Violation& v = t.violations.front();
    EXPECT_EQ(v.kind, topo::Violation::Kind::Crossing);
    EXPECT_NE(t.wires[v.wireA].net, t.wires[v.wireB].net);
    EXPECT_NEAR(v.pos.x, 15 * kNmPerMm, 0.5 * kNmPerMm);
    EXPECT_NEAR(v.pos.y, 15 * kNmPerMm, 0.5 * kNmPerMm);
  }
  {
    Board b = crossBoard(false);  // B goes round A's pad: no crossing, one wire each
    topo::Topology t;
    t.build(b);
    EXPECT_EQ(countViolations(t).crossing, 0);
    EXPECT_EQ(t.check(), std::vector<std::string>{});
    EXPECT_EQ(t.wires.size(), 2u);
  }
}

TEST(Topo, ThroughForeignPad) {
  // A wire of net A drawn straight through an oval pad of net C lying across its way.
  auto board = [](bool locked) {
    Board b = crossBoard(false);
    b.tracks.clear();
    Pad p;
    p.number = "c";
    p.component = 0;
    p.net = b.addNet("C");
    p.pos = Point(Vec2{15 * kNmPerMm, 15 * kNmPerMm});
    p.shape.kind = PadShapeKind::Oval;
    p.shape.w = mmToNm(0.8);
    p.shape.h = mmToNm(3.0);
    p.copper = 1;
    b.pads.push_back(p);
    Track t;
    t.a = Point(Vec2{5 * kNmPerMm, 15 * kNmPerMm});
    t.b = Point(Vec2{25 * kNmPerMm, 15 * kNmPerMm});
    t.width = mmToNm(0.3);
    t.layer = 0;
    t.net = 0;
    t.locked = locked;
    b.tracks.push_back(t);
    return b;
  };
  {
    topo::Topology t;
    t.build(board(true));  // locked where it lies: through the pad, a violation
    Counts c = countViolations(t);
    EXPECT_GE(c.throughPad, 1);
    EXPECT_EQ(c.crossing, 0);
  }
  {
    topo::Topology t;
    t.build(board(false));  // pushed out of the pad: laid round it
    Counts c = countViolations(t);
    EXPECT_EQ(c.throughPad, 0);
    EXPECT_EQ(t.check(), std::vector<std::string>{});
    ASSERT_EQ(t.wires.size(), 1u);
    EXPECT_GT(t.wires[0].cross.size(), 0u);
  }
}


namespace {

// Every wire as the sequence of its crossed edges' end positions (the ids change with flips).
std::vector<std::vector<std::pair<Vec2, Vec2>>> wirePaths(const topo::Topology& t) {
  std::vector<std::vector<std::pair<Vec2, Vec2>>> out(t.wires.size());
  for (size_t wi = 0; wi < t.wires.size(); ++wi) {
    const topo::LayerMesh& m = *t.mesh(t.wires[wi].layer);
    for (int cid : t.wires[wi].cross) {
      const topo::Edge& e = m.edges[t.crossings[cid].edge];
      out[wi].push_back({m.verts[e.v[0]].p, m.verts[e.v[1]].p});
    }
  }
  return out;
}

}  // namespace

TEST(Topo, FlipKeepsWires) {
  auto lb = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(lb.has_value());
  topo::Topology t;
  t.build(**lb);
  ASSERT_EQ(t.check(), std::vector<std::string>{});
  auto before = wirePaths(t);
  int flipped = 0, carried = 0;
  for (topo::LayerMesh& m : t.layers) {
    for (int e = 0; e < int(m.edges.size()); ++e) {
      topo::FlipPlan plan;
      if (!topo::planFlip(t, m, e, plan)) continue;
      // Only where the way back is open too: the old diagonal may run through the copper of a new end.
      auto clear = [&](int v, int x, int y) {
        const topo::Vertex& X = m.verts[v];
        if (X.owner == m.verts[x].owner || X.owner == m.verts[y].owner) return true;
        return distPointSegment(X.p, m.verts[x].p, m.verts[y].p) > t.owners[X.owner].halfWidth;
      };
      if (!clear(plan.a, plan.p, plan.q) || !clear(plan.b, plan.p, plan.q)) continue;
      size_t had = m.edges[e].cross.size();
      int wasAlong = m.edges[e].along;
      ASSERT_TRUE(topo::flip(t, m, e)) << "edge " << e;
      carried += int(m.edges[e].cross.size());
      if (flipped % 200 == 0) ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after flipping edge " << e;
      ASSERT_TRUE(topo::flip(t, m, e)) << "edge " << e << " back";
      EXPECT_EQ(m.edges[e].cross.size(), had) << "edge " << e;
      EXPECT_EQ(m.edges[e].along, wasAlong) << "edge " << e;
      ++flipped;
    }
    EXPECT_TRUE(t.findCrossings(m).empty());
  }
  EXPECT_GT(flipped, 1000);
  EXPECT_GT(carried, 1000);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  auto after = wirePaths(t);
  ASSERT_EQ(after.size(), before.size());
  int differ = 0;
  for (size_t wi = 0; wi < before.size(); ++wi) differ += before[wi] != after[wi];
  EXPECT_EQ(differ, 0);
}

TEST(Topo, WeightedLawsonKeepsWires) {
  for (const char* name : {"topor/Example_04/Arcs_master.pcb", "topor/Example_03/arz_standard_routing.fst", "topor/Example_03/arz_2L.fst"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    topo::Topology t;
    t.build(**lb);
    auto crossingsBefore = t.crossings.size();
    double loadBefore = 0;
    for (const topo::LayerMesh& m : t.layers)
      for (int e = 0; e < int(m.edges.size()); ++e) loadBefore += topo::load(topo::edgeCapacity(t, m, e));
    int flips = 0;
    for (topo::LayerMesh& m : t.layers) flips += topo::flipLoop(t, m, {}, {}, true);
    EXPECT_GT(flips, 0) << name;
    EXPECT_EQ(t.check(), std::vector<std::string>{}) << name;
    double loadAfter = 0;
    int overflow = 0;
    for (topo::LayerMesh& m : t.layers) {
      EXPECT_TRUE(t.findCrossings(m).empty()) << name;
      for (int e = 0; e < int(m.edges.size()); ++e) {
        auto c = topo::edgeCapacity(t, m, e);
        loadAfter += topo::load(c);
        overflow += c.cls == 2;
      }
    }
    std::println("{}: {} flips, crossings {} -> {}, load {:.1f} -> {:.1f}, {} overflowing edges", name, flips, crossingsBefore,
                 t.crossings.size(), loadBefore, loadAfter, overflow);
    EXPECT_LE(loadAfter, loadBefore + 1e-6) << name;
  }
}

// The sketch the realiser gets for a wire crosses, on the model's own mesh, exactly the edges the wire
// crosses: before and after the flips.
TEST(Topo, SketchesFollowTheModel) {
  // arz_2L: TopoR's own routing, nothing drawn along a mesh edge or through a vertex (Arcs_master has
  // tracks between pad centres that lie on the edges themselves, where the walk's ties are arbitrary).
  for (const char* name : {"topor/Example_03/arz_2L.fst"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    Board& b = **lb;
    topo::Topology t;
    t.build(b);
    for (int round = 0; round < 2; ++round) {
      if (round == 1)
        for (topo::LayerMesh& m : t.layers) topo::flipLoop(t, m, {}, {}, true);
      int off = 0, lost = 0;
      for (int wi = 0; wi < int(t.wires.size()); ++wi) {
        const topo::Wire& w = t.wires[wi];
        const topo::LayerMesh& m = *t.mesh(w.layer);
        topo::RealWire sk = topo::sketchOf(b, t, wi);
        bool ok = true;
        std::vector<int> edges = t.walkEdges(m, w.endVertex[0], w.endVertex[1], sk.sketch, ok);
        std::vector<int> want;
        for (int cid : w.cross) want.push_back(t.crossings[cid].edge);
        if (!ok) ++lost;
        else if (edges != want) {
          if (off < 3) {
            std::print("{} round {} wire {} net {}: model", name, round, wi, b.nets[w.net].name);
            for (int e : want) std::print(" {}", e);
            std::print(" / sketch");
            for (int e : edges) std::print(" {}", e);
            std::println("");
          }
          ++off;
        }
      }
      std::println("{} round {}: {} wires off, {} lost", name, round, off, lost);
      EXPECT_EQ(off, 0) << name << " round " << round;
      EXPECT_EQ(lost, 0) << name << " round " << round;
    }
  }
}

// The flips keep every wire where it was: drawn from the model before and after the loop, a wire comes
// out the same length (a change of side around an obstacle shows as a different length).
TEST(Topo, FlipsKeepTheWiresWhereTheyWere) {
  const char* which = std::getenv("XR_TOPO_BOARD");
  for (const char* name : {which ? which : "topor/Example_04/Arcs_master.pcb", which ? which : "topor/Example_03/arz_4L.fst", which ? which : "topor/Example_03/arz_2L.fst"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    Board& b = **lb;
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto draw = [&](const topo::Topology& tt) {
      std::vector<double> len(tt.wires.size(), 0);
      std::vector<topo::RealWire> ws;
      std::vector<int> ids;
      for (int wi = 0; wi < int(tt.wires.size()); ++wi) {
        ws.push_back(topo::sketchOf(b, tt, wi));
        ids.push_back(wi);
      }
      Board copy = b;
      copy.tracks.clear();
      topo::RealizeOptions ro;
      ro.tracksAsObstacles = true;
      ro.padPattern = false;  // the end a wire leaves its pad through is chosen by the sketch's shape, not by its side
      for (const topo::Junction& j : tt.junctions) ro.anchors.push_back({j.pos, j.layer, j.net, tt.owners[j.owner].halfWidth});
      auto st = topo::realize(copy, ws, {}, ro);
      for (size_t k = 0; k < st.trackWire.size(); ++k) len[ids[st.trackWire[k]]] += copy.tracks[k].length();
      return len;
    };
    auto before = draw(t);
    for (topo::LayerMesh& m : t.layers) topo::flipLoop(t, m, {}, {}, true);
    auto after = draw(t);
    int moved = 0;
    for (size_t wi = 0; wi < before.size(); ++wi)
      if (std::abs(before[wi] - after[wi]) > 0.2 * kNmPerMm) {
        if (const char* dir = std::getenv("XR_TOPO_DUMP"); dir && moved == 0) {
          auto sk = topo::sketchOf(b, t, int(wi));
          std::print("  sketch after:");
          for (Vec2 q : sk.sketch) std::print(" ({:.3f},{:.3f})", q.x / 1e6, q.y / 1e6);
          std::println("");
          Board copy = b;
          copy.tracks.clear();
          topo::RealizeOptions ro;
          ro.tracksAsObstacles = true;
          topo::realize(copy, {sk}, {}, ro);
          (void)io::saveBoard(copy, std::format("{}/loop_after.fst", dir));
        }
        if (moved < 6)
          std::println("{}: wire {} net {} L{} {:.3f} -> {:.3f} mm, {} -> {} crossings", name, wi, b.nets[t.wires[wi].net].name, int(t.wires[wi].layer),
                       before[wi] / 1e6, after[wi] / 1e6, 0, t.wires[wi].cross.size());
        ++moved;
      }
    std::println("{}: {} of {} wires drawn differently after the flips", name, moved, before.size());
    EXPECT_EQ(moved, 0) << name;
  }
}

// One flip at a time: every wire through the quad, drawn alone against the board as it lies, comes out the
// same before and after the flip. Finds the flip that changes a wire's side.
// A diagnostic, run by hand with XR_TOPO_BOARD=<board> [XR_TOPO_DUMP=<dir>]: the flips of one board one by
// one, each wire drawn alone before and after.
TEST(Topo, EverySingleFlipKeepsItsWires) {
  const char* which = std::getenv("XR_TOPO_BOARD");
  if (!which) GTEST_SKIP() << "set XR_TOPO_BOARD to run";
  auto lb = io::loadBoard(data(which));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  // The board without the wires' tracks: every wire is drawn alone against the rest.
  Board bare = b;
  bare.tracks.clear();
  topo::RealizeOptions ro;
  ro.tracksAsObstacles = true;
  for (const topo::Junction& j : t.junctions) ro.anchors.push_back({j.pos, j.layer, j.net, t.owners[j.owner].halfWidth});
  auto drawOne = [&](int wi) {
    Board copy = bare;
    topo::realize(copy, {topo::sketchOf(b, t, wi)}, {}, ro);
    double len = 0;
    for (const Track& tr : copy.tracks) len += tr.length();
    return len;
  };
  int bad = 0, flips = 0;
  for (topo::LayerMesh& m : t.layers) {
    for (int e = 0; e < int(m.edges.size()) && bad < 3; ++e) {
      topo::FlipPlan plan;
      if (!topo::planFlip(t, m, e, plan)) continue;
      auto clear = [&](int v, int x, int y) {  // the way back must be open too
        const topo::Vertex& X = m.verts[v];
        if (X.owner == m.verts[x].owner || X.owner == m.verts[y].owner) return true;
        return distPointSegment(X.p, m.verts[x].p, m.verts[y].p) > t.owners[X.owner].halfWidth;
      };
      if (!clear(plan.a, plan.p, plan.q) || !clear(plan.b, plan.p, plan.q)) continue;
      std::set<int> touched(plan.wires.begin(), plan.wires.end());
      for (int cid : plan.erase) touched.insert(t.crossings[cid].wire);
      for (int cid : m.edges[e].cross) touched.insert(t.crossings[cid].wire);
      if (m.edges[e].along >= 0) touched.insert(m.edges[e].along);
      if (touched.empty()) continue;
      std::map<int, double> before;
      for (int wi : touched) before[wi] = drawOne(wi);
      std::map<int, std::vector<int>> wasCross;
      for (int wi : touched) wasCross[wi] = t.wires[wi].cross;
      ASSERT_TRUE(topo::flip(t, m, e));
      ++flips;
      for (int wi : touched) {
        double after = drawOne(wi);
        if (std::abs(after - before[wi]) <= 0.05 * kNmPerMm) continue;
        ++bad;
        if (const char* dir = std::getenv("XR_TOPO_DUMP")) {  // the two drawings, for a look
          Board copy = bare;
          topo::realize(copy, {topo::sketchOf(b, t, wi)}, {}, ro);
          (void)io::saveBoard(copy, std::format("{}/flip{}_after.fst", dir, bad));
          ASSERT_TRUE(topo::flip(t, m, e));
          copy = bare;
          topo::realize(copy, {topo::sketchOf(b, t, wi)}, {}, ro);
          (void)io::saveBoard(copy, std::format("{}/flip{}_before.fst", dir, bad));
          auto sk = topo::sketchOf(b, t, wi);
          {
            auto la = io::loadBoard(std::format("{}/flip{}_after.fst", dir, bad)), lbf = io::loadBoard(std::format("{}/flip{}_before.fst", dir, bad));
            if (la && lbf) {
              const Board& A = **la;
              const Board& B = **lbf;
              for (size_t k = 0; k < std::min(A.tracks.size(), B.tracks.size()); ++k)
                if (A.tracks[k].a != B.tracks[k].a || A.tracks[k].b != B.tracks[k].b) {
                  std::println("  first differing track {} at ({:.3f},{:.3f})", k, B.tracks[k].a.x / 1e6, B.tracks[k].a.y / 1e6);
                  break;
                }
            }
          }
          std::print("  sketch before:");
          for (Vec2 q : sk.sketch) std::print(" ({:.3f},{:.3f})", q.x / 1e6, q.y / 1e6);
          std::println("");
          ASSERT_TRUE(topo::flip(t, m, e));
          sk = topo::sketchOf(b, t, wi);
          std::print("  sketch after: ");
          for (Vec2 q : sk.sketch) std::print(" ({:.3f},{:.3f})", q.x / 1e6, q.y / 1e6);
          std::println("");
        }
        const topo::Wire& w = t.wires[wi];
        std::println("layer {} edge {} quad a{} p{} q{} b{} (a ({:.2f},{:.2f}) p ({:.2f},{:.2f}) q ({:.2f},{:.2f}) b ({:.2f},{:.2f})): wire {} net {} {:.3f} -> {:.3f} mm; ends v{} v{}",
                     int(m.layer), e, plan.a, plan.p, plan.q, plan.b, m.verts[plan.a].p.x / 1e6, m.verts[plan.a].p.y / 1e6, m.verts[plan.p].p.x / 1e6,
                     m.verts[plan.p].p.y / 1e6, m.verts[plan.q].p.x / 1e6, m.verts[plan.q].p.y / 1e6, m.verts[plan.b].p.x / 1e6, m.verts[plan.b].p.y / 1e6,
                     wi, b.nets[w.net].name, before[wi] / 1e6, after / 1e6, w.endVertex[0], w.endVertex[1]);
        auto show = [&](const std::vector<int>& cross) {
          for (int cid : cross) {
            const topo::Edge& E = m.edges[t.crossings[cid].edge];
            std::print(" ({},{})", E.v[0], E.v[1]);
          }
          std::println("");
        };
        std::print("  before:");
        show(wasCross[wi]);
        std::print("  after: ");
        show(w.cross);
        for (const topo::FlipPlan::Run& r : plan.diag)
          if (r.wire == wi) std::println("  run: oldCid {} insertAt {} posP {} posQ {}", r.oldCid, r.insertAt, r.posP, r.posQ);
      }
      // Back, so that the next edge is tested on the original model.
      ASSERT_TRUE(topo::flip(t, m, e)) << "back " << e;
    }
  }
  std::println("{} flips tried", flips);
  EXPECT_EQ(bad, 0);
}

// After the flips, the wires' crossings are what the tracks as drawn cross on the new mesh: the transfer
// kept every wire where it was.
TEST(Topo, FlipsAgreeWithTheWalk) {
  const char* which = std::getenv("XR_TOPO_BOARD");
  for (const char* name : {which ? which : "topor/Example_03/arz_2L.fst"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    Board& b = **lb;
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    // The chains, matched to the wires by their tracks.
    std::vector<char> all(b.tracks.size(), 1);
    auto g = topo::wireGraph(b, all);
    auto chains = topo::wireChains(b, g, all, topo::OwnCopper(b));
    std::map<uint32_t, int> chainOfTrack;
    for (int ci = 0; ci < int(chains.size()); ++ci)
      for (int ti : chains[ci].tracks) chainOfTrack[b.tracks[ti].id] = ci;
    auto polyline = [&](int wi) {
      const topo::Wire& w = t.wires[wi];
      const topo::LayerMesh& m = *t.mesh(w.layer);
      const topo::WireChain& c = chains[chainOfTrack.at(w.tracks.front())];
      Polyline sk{m.verts[w.endVertex[0]].p};
      bool forward = (c.a() - sk.front()).len2() <= (c.b() - sk.front()).len2();
      for (size_t k = 0; k < c.path.size(); ++k) {
        Vec2 p = forward ? c.path[k] : c.path[c.path.size() - 1 - k];
        if (t.owners[w.end[0]].shape.contains(p) || t.owners[w.end[1]].shape.contains(p)) continue;
        if ((p - sk.back()).len2() >= 1) sk.push_back(p);
      }
      sk.push_back(m.verts[w.endVertex[1]].p);
      return sk;
    };
    int flips = 0;
    for (topo::LayerMesh& m : t.layers) flips += topo::flipLoop(t, m, {}, {}, true);
    int off = 0, lost = 0;
    for (int wi = 0; wi < int(t.wires.size()); ++wi) {
      const topo::Wire& w = t.wires[wi];
      if (w.tracks.empty()) continue;
      const topo::LayerMesh& m = *t.mesh(w.layer);
      bool ok = true;
      std::vector<int> edges = t.walkEdges(m, w.endVertex[0], w.endVertex[1], polyline(wi), ok);
      std::vector<int> want;
      for (int cid : w.cross) want.push_back(t.crossings[cid].edge);
      if (!ok) { ++lost; continue; }
      if (edges == want) continue;
      if (off < 4) {
        std::print("{} wire {} net {} L{}: model", name, wi, b.nets[w.net].name, int(w.layer));
        for (int e : want) std::print(" {}", e);
        std::print(" / walk");
        for (int e : edges) std::print(" {}", e);
        std::println("");
      }
      ++off;
    }
    std::println("{}: {} flips; {} wires off, {} lost of {}", name, flips, off, lost, t.wires.size());
    EXPECT_EQ(off, 0) << name;
    EXPECT_EQ(lost, 0) << name;
  }
}

// A diagnostic, run by hand with XR_TOPO_BOARD=<a> XR_TOPO_BOARD2=<b>: the models of two boards (a board
// and its F5 result) compared wire by wire.
TEST(Topo, CompareTwoModels) {
  const char* a = std::getenv("XR_TOPO_BOARD");
  const char* c = std::getenv("XR_TOPO_BOARD2");
  if (!a || !c) GTEST_SKIP() << "set XR_TOPO_BOARD and XR_TOPO_BOARD2";
  auto la = io::loadBoard(std::string(a)[0] == '/' ? a : data(a)), lc = io::loadBoard(std::string(c)[0] == '/' ? c : data(c));
  ASSERT_TRUE(la.has_value() && lc.has_value());
  topo::Topology A, C;
  A.build(**la);
  C.build(**lc);
  std::println("A: {} wires, {} junctions, {} crossings; C: {} wires, {} junctions, {} crossings", A.wires.size(), A.junctions.size(),
               A.crossings.size(), C.wires.size(), C.junctions.size(), C.crossings.size());
  auto key = [](const Board& b, const topo::Topology& t, const topo::Wire& w) {  // the nets by name: a saved board may number them anew
    Vec2 p = t.owners[w.end[0]].c, q = t.owners[w.end[1]].c;
    if (std::tie(p.x, p.y) > std::tie(q.x, q.y)) std::swap(p, q);
    // (not the layer: a saved board numbers its layers anew)
    return std::tuple{b.nets[w.net].name, std::llround(p.x / 1000), std::llround(p.y / 1000), std::llround(q.x / 1000), std::llround(q.y / 1000)};
  };
  auto edges = [](const topo::Topology& t, const topo::Wire& w) {
    const topo::LayerMesh& m = *t.mesh(w.layer);
    std::vector<std::tuple<long, long, long, long, int, int>> out;  // edge ends (um) and the wire's rank / count on it
    for (int cid : w.cross) {
      const topo::Edge& E = m.edges[t.crossings[cid].edge];
      Vec2 u = m.verts[E.v[0]].p, v = m.verts[E.v[1]].p;
      int k = int(std::ranges::find(E.cross, cid) - E.cross.begin());
      out.push_back({std::llround(u.x / 1000), std::llround(u.y / 1000), std::llround(v.x / 1000), std::llround(v.y / 1000), k, int(E.cross.size())});
    }
    return out;
  };
  std::map<decltype(key(**la, A, A.wires[0])), int> inC;
  for (int wi = 0; wi < int(C.wires.size()); ++wi) inC[key(**lc, C, C.wires[wi])] = wi;
  int matched = 0, unmatched = 0, differ = 0, differRank = 0;
  for (int wi = 0; wi < int(A.wires.size()); ++wi) {
    auto it = inC.find(key(**la, A, A.wires[wi]));
    if (it == inC.end()) { ++unmatched; continue; }
    ++matched;
    auto ea = edges(A, A.wires[wi]), ec = edges(C, C.wires[it->second]);
    // The same wire may run the other way round in the other model.
    if (A.owners[A.wires[wi].end[0]].c != C.owners[C.wires[it->second].end[0]].c) std::ranges::reverse(ec);  // ranks are per edge, not per wire
    auto strip = [](auto v) { for (auto& e : v) { std::get<4>(e) = 0; std::get<5>(e) = 0; } return v; };
    if (strip(ea) != strip(ec)) {
      if (differ < 5) std::println("wire net {} L{}: {} vs {} crossings", (**la).nets[A.wires[wi].net].name, int(A.wires[wi].layer), ea.size(), ec.size());
      if (const char* near = std::getenv("XR_TOPO_NEAR")) {
        double nx = 0, ny = 0;
        std::sscanf(near, "%lf,%lf", &nx, &ny);
        const char* netName = std::getenv("XR_TOPO_NET");  // this net's wires in full
        bool full = netName && (**la).nets[A.wires[wi].net].name == netName;
        auto show = [&](const char* what, const auto& es) {
          std::print("  {}:", what);
          for (auto& e : es)
            if (full || std::hypot(std::get<0>(e) / 1e3 - nx, std::get<1>(e) / 1e3 - ny) < 3)
              std::print(" ({:.2f},{:.2f})-({:.2f},{:.2f}) {}/{}", std::get<0>(e) / 1e3, std::get<1>(e) / 1e3, std::get<2>(e) / 1e3, std::get<3>(e) / 1e3, std::get<4>(e), std::get<5>(e));
          std::println("");
        };
        bool nearby = false;
        for (auto& e : ea) nearby |= std::hypot(std::get<0>(e) / 1e3 - nx, std::get<1>(e) / 1e3 - ny) < 3;
        if (nearby) {
          auto ends = [](const topo::Topology& t, const topo::Wire& w) {
            std::string out;
            for (int end = 0; end < 2; ++end) {
              const topo::Owner& o = t.owners[w.end[end]];
              out += std::format(" {}({:.3f},{:.3f})", int(o.kind), o.c.x / 1e6, o.c.y / 1e6);
            }
            return out;
          };
          auto endVerts = [](const topo::Topology& t, const topo::Wire& w) {
            const topo::LayerMesh& m = *t.mesh(w.layer);
            return std::format(" v({:.3f},{:.3f})-v({:.3f},{:.3f})", m.verts[w.endVertex[0]].p.x / 1e6, m.verts[w.endVertex[0]].p.y / 1e6, m.verts[w.endVertex[1]].p.x / 1e6,
                               m.verts[w.endVertex[1]].p.y / 1e6);
          };
          std::println("near: wire net {} L{}: ends A{}{} C{}{}", (**la).nets[A.wires[wi].net].name, int(A.wires[wi].layer), ends(A, A.wires[wi]), endVerts(A, A.wires[wi]),
                       ends(C, C.wires[it->second]), endVerts(C, C.wires[it->second]));
          if (full)
            for (auto [tag, bp] : {std::pair{"A", &**la}, std::pair{"C", &**lc}})
              for (const Track& tr : bp->tracks) {
                if (tr.net < 0 || bp->nets[tr.net].name != netName) continue;
                bool close = false;
                for (Vec2 q : tr.path()) close |= std::hypot(q.x / 1e6 - nx, q.y / 1e6 - ny) < 4;
                if (!close) continue;
                std::print("  {} track L{} w{:.3f}:", tag, int(tr.layer), tr.width / 1e6);
                for (Point q : {tr.a, tr.b}) std::print(" ({:.3f},{:.3f}){}", q.x / 1e6, q.y / 1e6, tr.mid ? "~" : "");
                std::println("");
              }
          show("A", ea);
          show("C", ec);
          for (auto [tag, T] : {std::pair{"A", &A}, std::pair{"C", &C}})
            for (const topo::Junction& j : T->junctions)
              if (std::hypot(j.pos.x / 1e6 - nx, j.pos.y / 1e6 - ny) < 3)
              {
                std::println("  {} junction ({:.3f},{:.3f}) net {} degree {} r {:.3f}", tag, j.pos.x / 1e6, j.pos.y / 1e6, (tag[0] == 'A' ? **la : **lc).nets[j.net].name, j.degree,
                             T->owners[j.owner].halfWidth / 1e6);
                for (const topo::Wire& w : T->wires)
                  if (w.end[0] == j.owner || w.end[1] == j.owner)
                    std::println("    wire w{:.3f} {} crossings, locked {}, {} tracks", w.width / 1e6, w.cross.size(), w.locked, w.tracks.size());
              }
          for (auto [tag, T] : {std::pair{"A", &A}, std::pair{"C", &C}})
            for (const topo::Owner& o : T->owners)
              if (o.kind != topo::Owner::Kind::Junction && std::hypot(o.c.x / 1e6 - nx, o.c.y / 1e6 - ny) < 3)
                std::println("  {} owner kind {} ({:.3f},{:.3f}) net {}", tag, int(o.kind), o.c.x / 1e6, o.c.y / 1e6, o.net >= 0 ? (tag[0] == 'A' ? **la : **lc).nets[o.net].name : "-");
        }
      }
      ++differ;
    } else if (ea != ec) {
      if (differRank < 5) {
        std::print("wire net {} L{}: same edges, other rank at", (**la).nets[A.wires[wi].net].name, int(A.wires[wi].layer));
        for (size_t k = 0; k < ea.size(); ++k)
          if (ea[k] != ec[k]) std::print(" [({:.1f},{:.1f})-({:.1f},{:.1f}) {}/{} vs {}/{}]", std::get<0>(ea[k]) / 1e3, std::get<1>(ea[k]) / 1e3, std::get<2>(ea[k]) / 1e3, std::get<3>(ea[k]) / 1e3, std::get<4>(ea[k]), std::get<5>(ea[k]), std::get<4>(ec[k]), std::get<5>(ec[k]));
        std::println("");
      }
      ++differRank;
    }
  }
  if (const char* netName = std::getenv("XR_TOPO_WIRES"))  // every wire of this net in both models
    for (auto [tag, T, bp] : {std::tuple{"A", &A, &**la}, std::tuple{"C", &C, &**lc}}) {
      std::vector<char> all(bp->tracks.size(), 1);
      topo::WireGraph g = topo::wireGraph(*bp, all);
      topo::OwnCopper copper(*bp);
      for (const topo::WireChain& c : topo::wireChains(*bp, g, all, copper)) {
        if (bp->nets[c.net].name != netName) continue;
        std::println("  {} chain L{} w{:.3f} {} tracks, {} points, closed {}: ({:.4f},{:.4f})-({:.4f},{:.4f})", tag, int(c.layer), c.width / 1e6, c.tracks.size(), c.path.size(), c.closed,
                     c.a().x / 1e6, c.a().y / 1e6, c.b().x / 1e6, c.b().y / 1e6);
      }
      for (const topo::Wire& w : T->wires) {
        if (bp->nets[w.net].name != netName) continue;
        std::print("  {} wire L{} w{:.3f} {} crossings:", tag, int(w.layer), w.width / 1e6, w.cross.size());
        for (int end = 0; end < 2; ++end) {
          const topo::Owner& o = T->owners[w.end[end]];
          std::print(" {}({:.4f},{:.4f})", int(o.kind), o.c.x / 1e6, o.c.y / 1e6);
        }
        std::println("");
      }
    }
  std::println("{} matched ({} unmatched): {} with other crossings, {} with another rank on an edge", matched, unmatched, differ, differRank);
  if (const char* ed = std::getenv("XR_TOPO_EDGE")) {  // the wires across one edge, given by its ends in mm
    double x1, y1, x2, y2;
    std::sscanf(ed, "%lf,%lf,%lf,%lf", &x1, &y1, &x2, &y2);
    for (auto [name, t] : {std::pair{"A", &A}, std::pair{"C", &C}})
      for (const topo::LayerMesh& m : t->layers)
        for (const topo::Edge& E : m.edges) {
          Vec2 u = m.verts[E.v[0]].p / 1e6, v = m.verts[E.v[1]].p / 1e6;
          bool hit = (std::hypot(u.x - x1, u.y - y1) < 0.02 && std::hypot(v.x - x2, v.y - y2) < 0.02) || (std::hypot(u.x - x2, u.y - y2) < 0.02 && std::hypot(v.x - x1, v.y - y1) < 0.02);
          if (!hit) continue;
          std::print("{} layer {} edge ({:.2f},{:.2f})-({:.2f},{:.2f}) along {}:", name, int(m.layer), u.x, u.y, v.x, v.y, E.along);
          for (int cid : E.cross) std::print(" {}", (**la).nets[t->wires[t->crossings[cid].wire].net].name);
          std::println("");
        }
  }
}

// The realiser fed from the model draws the simplest board right: B round A's pad, no violation.
TEST(Topo, DirectDrawingOfTheSimplestBoard) {
  Board b = crossBoard(false);
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(t.violations.empty());
  for (int direct = 0; direct < 2; ++direct) {
    Board copy = b;
    topo::Topology tc = t;
    topo::F5ModelOptions o;
    o.flips = false;
    o.direct = direct;
    auto res = topo::runF5Model(copy, tc, o);
    ASSERT_TRUE(res.drawn);
    DrcOptions d;
    d.unconnected = false;
    auto v = runDrc(copy, d);
    for (const DrcViolation& x : v) std::println("direct {}: {}", direct, x.message);
    EXPECT_TRUE(v.empty()) << "direct " << direct;
    EXPECT_EQ(Connectivity::compute(copy).ratsnest.size(), 0u) << "direct " << direct;
    std::println("direct {}: {} tracks, {:.2f} mm", direct, copy.tracks.size(), copy.tracksLength() / 1e6);
  }
}

// Every edge's cached capacity equals a fresh computation.
static std::vector<std::string> staleCapacities(const topo::Topology& t) {
  std::vector<std::string> bad;
  for (const topo::LayerMesh& m : t.layers)
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const topo::Edge& E = m.edges[e];
      if (E.v[0] < 0 || E.cross.empty()) continue;
      auto c = topo::edgeCapacity(t, m, e);
      if (std::abs(c.freeLen - E.freeLen) > 1 || std::abs(c.need - E.need) > 1 || c.cls != E.cls)
        if (bad.size() < 10) bad.push_back(std::format("layer {} edge {}: cached {:.0f}/{:.0f}/{} fresh {:.0f}/{:.0f}/{}", m.layer, e, E.freeLen, E.need, E.cls, c.freeLen, c.need, c.cls));
    }
  return bad;
}

// Vias moved at random (200 shifts of up to 0.3 mm on Arcs_master): the meshes stay sound, no wire crosses
// another, the cached capacities are the fresh ones, and most of the moves go the whole way.
TEST(Topo, MoveViaKeepsInvariants) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(lb.has_value());
  topo::Topology t;
  t.build(**lb);
  ASSERT_EQ(t.check(), std::vector<std::string>{});
  std::vector<int> vias;
  for (int oi = 0; oi < int(t.owners.size()); ++oi)
    if (t.owners[oi].kind == topo::Owner::Kind::Via) vias.push_back(oi);
  ASSERT_GT(vias.size(), 50u);
  std::mt19937 rng(7);
  std::uniform_real_distribution<double> ang(0, 2 * std::numbers::pi), len(0, 0.3 * kNmPerMm);
  double asked = 0, went = 0;
  int whole = 0;
  for (int k = 0; k < 200; ++k) {
    int oi = vias[rng() % vias.size()];
    double a = ang(rng), l = len(rng);
    Vec2 d{l * std::cos(a), l * std::sin(a)};
    double f = topo::moveOwner(t, oi, d);
    asked += l;
    went += f * l;
    whole += f > 0.999;
    if (k % 20 == 19) ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after move " << k;
  }
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  std::println("Arcs_master: 200 via moves, {:.1f} of {:.1f} mm went, {} whole", went / 1e6, asked / 1e6, whole);
  EXPECT_GT(whole, 150);
  // Long moves (up to 2 mm) take a via across edges, the flips carrying the wires.
  std::uniform_real_distribution<double> far(0.5 * kNmPerMm, 2 * kNmPerMm);
  int crossed = 0;
  for (int k = 0; k < 60; ++k) {
    int oi = vias[rng() % vias.size()];
    double a = ang(rng), l = far(rng);
    const topo::LayerMesh& m0 = t.layers[0];
    size_t starBefore = 0;
    for (int v : m0.ownerVerts[oi]) starBefore += m0.verts[v].tris.size();
    topo::moveOwner(t, oi, {l * std::cos(a), l * std::sin(a)});
    size_t starAfter = 0;
    for (int v : m0.ownerVerts[oi]) starAfter += m0.verts[v].tris.size();
    crossed += starAfter != starBefore;
    if (k % 10 == 9) ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after long move " << k;
  }
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  std::println("Arcs_master: 60 long via moves, {} changed the via's star", crossed);
  EXPECT_GT(crossed, 10);
  // The vertices are where their owners are.
  for (const topo::LayerMesh& m : t.layers)
    for (const topo::Vertex& x : m.verts)
      if (x.owner >= 0) EXPECT_LT((x.p - (t.owners[x.owner].c + t.owners[x.owner].axis * x.t + x.off)).len(), 1.0);
}

// A vertex put into a triangle and taken out again, the mesh left as split (no Lawson's loop): the mesh
// and the wires' paths are exactly what they were. With the loop: the meshes stay sound and the wires
// clear of each other.
TEST(Topo, InsertAndRemoveVertexRoundTrip) {
  auto lb = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(lb.has_value());
  topo::Topology t;
  t.build(**lb);
  ASSERT_EQ(t.check(), std::vector<std::string>{});
  std::mt19937 rng(11);
  std::uniform_real_distribution<double> u01(0.05, 0.95);
  auto randomPoint = [&](const topo::LayerMesh& m) {
    while (true) {
      int ti = int(rng() % m.tris.size());
      const topo::Tri& T = m.tris[ti];
      if (!T.inside || T.blocked) continue;
      double a = u01(rng), b = u01(rng);
      if (a + b > 0.95) continue;
      Vec2 p0 = m.verts[T.v[0]].p, p1 = m.verts[T.v[1]].p, p2 = m.verts[T.v[2]].p;
      return p0 + (p1 - p0) * a + (p2 - p0) * b;
    }
  };
  for (bool lawson : {false, true}) {
    int inserted = 0, chords = 0;
    for (int k = 0; k < 150; ++k) {
      topo::LayerMesh& m = t.layers[rng() % t.layers.size()];
      auto before = wirePaths(t);
      size_t edges = m.edges.size(), tris = m.tris.size(), crossings = t.crossings.size();
      topo::Owner o;
      o.kind = topo::Owner::Kind::Via;
      o.c = randomPoint(m);
      o.halfWidth = 0.3 * kNmPerMm;
      o.shape = Shape::circle(o.c, o.halfWidth);
      o.net = kNoNet;
      o.layers = LayerMask(1) << m.layer;
      int oi = topo::insertOwner(t, o, lawson);
      ASSERT_GE(oi, 0) << "insert " << k;
      ++inserted;
      int v = m.ownerVerts[oi].front();
      for (int ti : m.verts[v].tris)
        for (int e : m.tris[ti].e)
          if (m.edges[e].v[0] == v || m.edges[e].v[1] == v) chords += int(m.edges[e].cross.size());
      if (k % 10 == 0) {
        ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after insert " << k;
        EXPECT_TRUE(t.findCrossings(m).empty()) << "after insert " << k;
      }
      ASSERT_TRUE(topo::removeOwner(t, oi, lawson)) << "remove " << k;
      if (k % 10 == 0) ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after remove " << k;
      if (!lawson) {
        EXPECT_EQ(wirePaths(t), before) << "round trip " << k;
        // The dead slots stay; nothing else grew.
        EXPECT_EQ(m.edges.size(), edges + 3);
        EXPECT_EQ(m.tris.size(), tris + 2);
        for (size_t c = crossings; c < t.crossings.size(); ++c) EXPECT_LT(t.crossings[c].wire, 0);
      }
      // The owner's slot stays, with no layers and no vertices.
      EXPECT_EQ(t.owners[oi].layers, 0u);
      EXPECT_TRUE(m.ownerVerts[oi].empty());
    }
    EXPECT_EQ(t.check(), std::vector<std::string>{});
    for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
    EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
    std::println("arz_2L: {} vertices inserted and removed ({}), {} crossings of the spokes", inserted, lawson ? "Lawson's loop on" : "no loop", chords);
    EXPECT_GT(chords, 100);
  }
}

// The model saved next to the board and read back: the same meshes, wires, crossings, capacities and
// tracks; a board edited since is refused as stale.
TEST(Topo, SidecarRoundTrip) {
  auto lb = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  const std::string path = (std::filesystem::temp_directory_path() / "xrtopor_sidecar_test.xrtopo").string();
  ASSERT_TRUE(topo::saveTopology(t, b, path).has_value());
  auto loaded = topo::loadTopology(b, path);
  ASSERT_TRUE(loaded.has_value()) << loaded.error();
  const topo::Topology& u = *loaded;
  EXPECT_EQ(u.check(), std::vector<std::string>{});
  EXPECT_EQ(u.boardHash, t.boardHash);
  ASSERT_EQ(u.owners.size(), t.owners.size());
  ASSERT_EQ(u.wires.size(), t.wires.size());
  EXPECT_EQ(u.crossings.size(), t.crossings.size());
  EXPECT_EQ(u.junctions.size(), t.junctions.size());
  EXPECT_EQ(u.ownerTracks, t.ownerTracks);
  {
    auto pu = wirePaths(u), pt = wirePaths(t);
    int differ = 0;
    auto same = [](const auto& a, const auto& c) {  // within a nanometre: the file carries fractional nanometres loosely
      if (a.size() != c.size()) return false;
      for (size_t k = 0; k < a.size(); ++k)
        if ((a[k].first - c[k].first).len() > 1 || (a[k].second - c[k].second).len() > 1) return false;
      return true;
    };
    for (size_t wi = 0; wi < pt.size(); ++wi) {
      if (same(pu[wi], pt[wi])) continue;
      if (differ++ == 0) {
        std::print("wire {} differs: {} vs {} crossings\n  saved:", wi, pt[wi].size(), pu[wi].size());
        for (auto [a, c] : pt[wi]) std::print(" ({:.3f},{:.3f})-({:.3f},{:.3f})", a.x / 1e6, a.y / 1e6, c.x / 1e6, c.y / 1e6);
        std::print("\n  loaded:");
        for (auto [a, c] : pu[wi]) std::print(" ({:.3f},{:.3f})-({:.3f},{:.3f})", a.x / 1e6, a.y / 1e6, c.x / 1e6, c.y / 1e6);
        std::println("");
      }
    }
    EXPECT_EQ(differ, 0);
  }
  for (size_t wi = 0; wi < t.wires.size(); ++wi) {
    EXPECT_EQ(u.wires[wi].tracks, t.wires[wi].tracks) << "wire " << wi;
    EXPECT_EQ(u.wires[wi].end[0], t.wires[wi].end[0]) << "wire " << wi;
    EXPECT_EQ(u.wires[wi].hasExit[0], t.wires[wi].hasExit[0]) << "wire " << wi;
  }
  ASSERT_EQ(u.layers.size(), t.layers.size());
  for (size_t li = 0; li < t.layers.size(); ++li) {
    const topo::LayerMesh& a = t.layers[li];
    const topo::LayerMesh& c = u.layers[li];
    ASSERT_EQ(c.edges.size(), a.edges.size());
    for (size_t e = 0; e < a.edges.size(); ++e) {
      EXPECT_EQ(c.edges[e].cross, a.edges[e].cross) << "edge " << e;
      EXPECT_NEAR(c.edges[e].freeLen, a.edges[e].freeLen, 1) << "edge " << e;
      EXPECT_NEAR(c.edges[e].need, a.edges[e].need, 1) << "edge " << e;
      EXPECT_EQ(c.edges[e].cls, a.edges[e].cls) << "edge " << e;
    }
    for (size_t v = 0; v < a.verts.size(); ++v) EXPECT_LT((c.verts[v].p - a.verts[v].p).len(), 1) << "vertex " << v;
  }
  // Stale: a track changed; a track dragged elsewhere (the counts the hash sees are the same).
  Board edited = b;
  edited.tracks.front().width += 1000;
  auto stale = topo::loadTopology(edited, path);
  EXPECT_FALSE(stale.has_value());
  Board dragged = b;
  dragged.tracks.front().a.x += Coord(1 * kNmPerMm);
  auto stale2 = topo::loadTopology(dragged, path);
  EXPECT_FALSE(stale2.has_value());
  std::filesystem::remove(path);
}

// A wire the mesh does not hold (here: a track to nowhere, its end on no copper and no vertex the walk
// can reach) stays as drawn and does not stop F5: only crossings and wires through copper do.
TEST(Topo, LostWireDoesNotStopF5) {
  Board b = crossBoard(false);
  LayerId top = b.tracks.front().layer;
  Track t;
  t.a = Point(Vec2{5 * kNmPerMm, 15 * kNmPerMm});
  t.b = Point(Vec2{200 * kNmPerMm, 15 * kNmPerMm});  // far outside the 30 x 30 mm board
  t.width = mmToNm(0.3);
  t.layer = top;
  t.net = 0;
  b.tracks.push_back(t);
  topo::Topology::assignIds(b);
  topo::Topology m;
  m.build(b);
  bool lost = false;
  for (const topo::Violation& v : m.violations) lost |= v.kind == topo::Violation::Kind::OutsideBoard;
  ASSERT_TRUE(lost);
  auto res = topo::runF5Model(b, m);
  EXPECT_TRUE(res.drawn);
  bool reported = false;
  for (const topo::Violation& v : res.violations) reported |= v.kind == topo::Violation::Kind::OutsideBoard;
  EXPECT_TRUE(reported);
}

// A clearance rule between two sets of nets: the board answers it for the pair and the nets' own clearance
// otherwise, later rules take priority, the DRC asks for it, the capacity packs the two wires that far apart.
TEST(Topo, PairClearanceRule) {
  Board b = crossBoard(false);
  const int A = 0, B = 1;
  const LayerId top = b.tracks.front().layer;
  const Coord own = b.clearance(A, top);
  EXPECT_EQ(b.clearance(A, B, top), own);
  b.pairRules.push_back({{A}, {B}, 0, mmToNm(0.5)});
  EXPECT_EQ(b.clearance(A, B, top), mmToNm(0.5));
  EXPECT_EQ(b.clearance(B, A, top), mmToNm(0.5));
  EXPECT_EQ(b.clearance(A, kNoNet, top), own);
  EXPECT_EQ(b.clearance(A, top), own);
  EXPECT_EQ(b.clearanceUpper(A, top), mmToNm(0.5));
  EXPECT_EQ(requiredClearance(b, A, B, LayerMask(1) << top), double(mmToNm(0.5)));
  // The capacity: 0.3 mm more between the two wires on an edge, the rule 0.5 against their own 0.2.
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_EQ(t.pairRules.size(), 1u);
  const topo::LayerMesh& m = t.layers.front();
  int wa = -1, wb = -1;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) (t.wires[wi].net == A ? wa : wb) = wi;
  ASSERT_GE(wa, 0);
  ASSERT_GE(wb, 0);
  int va = -1, vb = -1;  // two outline points far apart: a long edge, where the margin stays
  double far = 0;
  for (int v = 0; v < int(m.verts.size()); ++v) {
    if (m.verts[v].owner < 0 || t.owners[m.verts[v].owner].kind != topo::Owner::Kind::Outline) continue;
    if (va < 0) va = v;
    else if (double d = (m.verts[v].p - m.verts[va].p).len(); d > far) far = d, vb = v;
  }
  ASSERT_GE(vb, 0);
  auto with = topo::capacityOf(t, m, va, vb, {wa, wb}, -1);
  t.pairRules.clear();
  auto without = topo::capacityOf(t, m, va, vb, {wa, wb}, -1);
  EXPECT_NEAR(with.need - without.need, double(mmToNm(0.5) - own), 1);
  // The design rules as a .fst carries them.
  Board c = crossBoard(false);
  DesignRules r;
  r.netGroups = {{"GA", {"A"}}, {"GB", {"B"}}, {"NONE", {}}};
  ClearanceRule all{true, {}, {}, {}, mmToNm(0.2), mmToNm(0.2)};
  ClearanceRule pair{true, {}, {RuleNets::Kind::Group, "GA"}, {RuleNets::Kind::Group, "GB"}, mmToNm(0.4), mmToNm(0.4)};
  ClearanceRule emptyGroup{true, {}, {RuleNets::Kind::Group, "NONE"}, {RuleNets::Kind::Group, "GB"}, mmToNm(0.9), mmToNm(0.9)};
  r.clearances = {all, pair, emptyGroup};
  c.rules = r;
  compileRules(c);
  ASSERT_EQ(c.pairRules.size(), 1u) << "a group without nets is no rule for all nets";
  EXPECT_EQ(c.clearance(A, B, top), mmToNm(0.4));
  EXPECT_EQ(c.clearance(A, top), mmToNm(0.2)) << "the nets' own clearance stays";
  // A rule for all nets after the pair rule overrides it; before it, it does not.
  r.clearances = {pair, all};
  c.rules = r;
  compileRules(c);
  EXPECT_EQ(c.clearance(A, B, top), mmToNm(0.2));
}

// The tools keep the pair's rule: two wires stacked round a pad of a third net, F5 on the model and on the
// tracks. Between the two nets 0.5 mm, the rule; from the third net the inner wire stays at its own clearance
// (a rule between two sets is no clearance of those nets against everybody).
TEST(Topo, ToolsKeepThePairRule) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  const int A = 0, B = 1, C = 2;
  auto board = [&] {
    Board b;
    LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 20), mm(0, 20)});
    b.addNet("A"), b.addNet("B"), b.addNet("C");
    Component c;
    c.ref = "U1";
    b.components.push_back(c);
    auto pad = [&](Vec2 at, int net) {
      Pad p;
      p.number = std::to_string(b.pads.size());
      p.component = 0;
      p.net = net;
      p.pos = Point(at);
      p.shape.w = p.shape.h = mmToNm(0.6);
      p.copper = LayerMask(1) << top;
      b.pads.push_back(p);
    };
    auto track = [&](Vec2 p, Vec2 q, int net) {
      Track t;
      t.a = Point(p);
      t.b = Point(q);
      t.width = mmToNm(0.2);
      t.layer = top;
      t.net = net;
      b.tracks.push_back(t);
    };
    pad(mm(8, 5), A), pad(mm(32, 5), A), pad(mm(5, 5), B), pad(mm(35, 5), B), pad(mm(20, 10), C);
    track(mm(8, 5), mm(20, 11), A), track(mm(20, 11), mm(32, 5), A);
    track(mm(5, 5), mm(20, 13), B), track(mm(20, 13), mm(35, 5), B);
    b.pairRules.push_back({{A}, {B}, 0, mmToNm(0.5)});
    return b;
  };
  auto gapBetween = [](const Board& b, int netX, int netY) {
    double best = 1e18;
    for (const Track& x : b.tracks) {
      if (x.net != netX) continue;
      Polyline px = x.path(500);
      for (const Track& y : b.tracks) {
        if (y.net != netY) continue;
        Polyline py = y.path(500);
        for (size_t i = 0; i + 1 < px.size(); ++i)
          for (size_t j = 0; j + 1 < py.size(); ++j)
            for (Vec2 q : {py[j], py[j + 1]}) best = std::min(best, distPointSegment(q, px[i], px[i + 1]));
        for (size_t i = 0; i + 1 < py.size(); ++i)
          for (Vec2 q : px) best = std::min(best, distPointSegment(q, py[i], py[i + 1]));
      }
    }
    return best - double(mmToNm(0.2));  // centre lines to copper: two half widths
  };
  auto wireToPad = [](const Board& b, int net) {
    double best = 1e18;
    const Shape pad = b.pads[4].shapeGeom();
    for (const Track& x : b.tracks)
      if (x.net == net)
        for (Vec2 p : x.path(500)) best = std::min(best, pad.distance(p));
    return best - double(mmToNm(0.2)) / 2;
  };
  auto judge = [&](const Board& b, const char* what) {
    std::println("{}: A-B {:.3f} mm, A-C pad {:.3f} mm, length {:.2f} mm", what, gapBetween(b, A, B) / 1e6, wireToPad(b, A) / 1e6, b.tracksLength() / 1e6);
    EXPECT_GE(gapBetween(b, A, B), 0.495 * kNmPerMm) << what;
    EXPECT_LT(wireToPad(b, A), 0.3 * kNmPerMm) << what << ": the third net stays at its own clearance";
    DrcOptions d;
    d.unconnected = false;
    d.widths = false;  // the stand's tracks are narrower than the default rule
    for (const DrcViolation& v : runDrc(b, d)) ADD_FAILURE() << what << ": " << v.message;
  };
  {
    Board b = board();
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto res = topo::runF5Model(b, t);
    ASSERT_TRUE(res.drawn);
    judge(b, "F5 on the model");
  }
  {
    Board b = board();
    topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
    judge(b, "F5 on the tracks");
  }
  {
    Board b = board();
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto res = topo::optimizeModel(b, t);
    ASSERT_TRUE(res.drawn);
    judge(b, "F7 on the model");
  }
}

// The pour keeps the pair's rule from the copper of the other net, and its own clearance from the rest.
TEST(Topo, PourKeepsThePairRule) {
  auto lb = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  ASSERT_FALSE(b.zones.empty());
  const Zone& z = b.zones.front();
  int other = kNoNet;
  for (const Track& t : b.tracks)
    if (t.layer == z.layer && t.net != z.net && t.net != kNoNet) { other = t.net; break; }
  ASSERT_NE(other, kNoNet);
  auto gapToOther = [&] {
    double best = 1e18;
    for (const Polyline& f : b.zones.front().filled)
      for (const Track& t : b.tracks)
        if (t.layer == z.layer && t.net == other) {
          Shape poly = Shape::polygon(f);
          for (Vec2 p : t.path(1000)) best = std::min(best, poly.distance(p) - t.width / 2.0);
        }
    return best;
  };
  fillZones(b);
  const double before = gapToOther();
  const Coord rule = b.clearance(z.net, other, z.layer) + mmToNm(0.5);
  b.pairRules.push_back({{z.net}, {other}, 0, rule});
  fillZones(b);
  EXPECT_GT(gapToOther(), before + 0.3 * kNmPerMm);
  EXPECT_GE(gapToOther(), double(rule) - 1000);
}

// Which wires of an edge are narrowed: the fewest, by what is missing and no more; nothing when it cannot be had.
TEST(Topo, ChooseNarrowing) {
  std::vector<double> out;
  const double mm = kNmPerMm;
  EXPECT_FALSE(topo::chooseNarrowing({0.8 * mm, 0.3 * mm}, {0.3 * mm, 0.3 * mm}, 0, out));
  EXPECT_EQ(out, (std::vector<double>{0.8 * mm, 0.3 * mm}));
  EXPECT_TRUE(topo::chooseNarrowing({0.8 * mm, 0.3 * mm}, {0.3 * mm, 0.3 * mm}, 0.2 * mm, out));
  EXPECT_EQ(out, (std::vector<double>{0.6 * mm, 0.3 * mm})) << "only the wire that can give, only what is missing";
  EXPECT_TRUE(topo::chooseNarrowing({0.5 * mm, 0.8 * mm}, {0.3 * mm, 0.3 * mm}, 0.6 * mm, out));
  EXPECT_EQ(out, (std::vector<double>{0.4 * mm, 0.3 * mm})) << "the one with the most to give first";
  EXPECT_FALSE(topo::chooseNarrowing({0.8 * mm, 0.8 * mm}, {0.3 * mm, 0.3 * mm}, 1.2 * mm, out));
  EXPECT_EQ(out, (std::vector<double>{0.8 * mm, 0.8 * mm})) << "what cannot cure the edge is not done";
}

// Narrowing is the last resort, on the model and on the tracks: a 0.8 mm wire (minimum 0.3, clearance 0.3)
// between two pads of another net keeps its width where it fits at the bare rule and where it is short of
// room by less than the limit; it is narrowed by what is missing, between the bends at the gap only, where
// that cures the gap; and it stays whole where even the minimum does not fit.
TEST(Topo, NarrowingIsTheLastResort) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  auto board = [&](double gap) {
    Board b;
    LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 20), mm(0, 20)});
    int A = b.addNet("A"), C = b.addNet("C");
    Component c;
    c.ref = "U1";
    b.components.push_back(c);
    auto pad = [&](Vec2 at, int net) {
      Pad p;
      p.number = std::to_string(b.pads.size());
      p.component = 0;
      p.net = net;
      p.pos = Point(at);
      p.shape.w = p.shape.h = mmToNm(1.0);
      p.copper = LayerMask(1) << top;
      b.pads.push_back(p);
    };
    pad(mm(5, 10), A), pad(mm(35, 10), A);
    pad(mm(20, 10 - gap / 2 - 0.5), C), pad(mm(20, 10 + gap / 2 + 0.5), C);
    Track t;
    t.a = Point(mm(5, 10));
    t.b = Point(mm(35, 10));
    t.width = mmToNm(0.8);
    t.layer = top;
    t.net = A;
    b.tracks.push_back(t);
    DesignRules r;
    r.widths = {{true, {}, {}, mmToNm(0.3), mmToNm(0.8)}};
    r.clearances = {{true, {}, {}, {}, mmToNm(0.3), mmToNm(0.3)}};
    b.rules = r;
    compileRules(b);
    return b;
  };
  struct Case {
    double gap;        // between the copper of the two pads, mm
    double narrowest;  // of the wire afterwards, mm
    bool clean;        // no clearance violation
    const char* what;
  };
  for (Case c : {Case{1.4, 0.8, true, "fits at the bare rule"}, Case{1.37, 0.8, false, "short by less than the limit"},
                 Case{1.2, 0.6, true, "short by 0.2 mm: narrowed by that"}, Case{0.8, 0.8, false, "the minimum does not fit either"}})
    for (bool model : {true, false}) {
      Board b = board(c.gap);
      if (model) {
        topo::Topology::assignIds(b);
        topo::Topology t;
        t.build(b);
        ASSERT_TRUE(topo::runF5Model(b, t).drawn);
      } else {
        topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
      }
      const std::string name = std::format("gap {} mm ({}), {}", c.gap, c.what, model ? "model" : "tracks");
      Coord narrowest = mmToNm(0.8);
      for (const Track& t : b.tracks) narrowest = std::min(narrowest, t.width);
      EXPECT_NEAR(narrowest / 1e6, c.narrowest, 0.0015) << name;
      // The ends at the pads are of the nominal width.
      for (const Track& t : b.tracks)
        for (Point p : {t.a, t.b})
          if ((p.v() - mm(5, 10)).len() < 1000 || (p.v() - mm(35, 10)).len() < 1000) EXPECT_EQ(t.width, mmToNm(0.8)) << name;
      int clearance = 0, width = 0;
      for (const DrcViolation& v : runDrc(b)) {
        clearance += v.type == DrcViolation::Type::Clearance || v.type == DrcViolation::Type::Short;
        width += v.type == DrcViolation::Type::Width;
      }
      EXPECT_EQ(clearance == 0, c.clean) << name << ": " << clearance << " clearance violation(s)";
      EXPECT_EQ(width, 0) << name;
    }
}

namespace {

// A one-layer board 40 x 20 mm of round pads and straight tracks of one net, for the width rules.
struct WidthBoard {
  Board b;
  LayerId top = 0;
  int net = 0;
  WidthBoard() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
    net = b.addNet("A");
    Component c;
    c.ref = "U1";
    b.components.push_back(c);
  }
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }
  void pad(double x, double y) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = 0;
    p.net = net;
    p.pos = Point(at(x, y));
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  }
  void track(double x1, double y1, double x2, double y2, double width) {
    Track t;
    t.a = Point(at(x1, y1));
    t.b = Point(at(x2, y2));
    t.width = mmToNm(width);
    t.layer = top;
    t.net = net;
    b.tracks.push_back(t);
  }
  // The widths of the tracks with an end at the point.
  std::set<Coord> widthsAt(double x, double y) const {
    std::set<Coord> out;
    for (const Track& t : b.tracks)
      if ((t.a.v() - at(x, y)).len() < 1000 || (t.b.v() - at(x, y)).len() < 1000) out.insert(t.width);
    return out;
  }
  void relay(bool model) {
    if (model) {
      topo::Topology::assignIds(b);
      topo::Topology t;
      t.build(b);
      ASSERT_TRUE(topo::runF5Model(b, t).drawn);
    } else {
      topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
    }
  }
};

}  // namespace

// A short wide stub between a node and the point where a thinner wire goes on is that thinner wire's
// (TopoR's F5 brings the branch up to the node); a long wide piece keeps its joint.
TEST(Topo, WideStubIsAbsorbed) {
  for (bool model : {true, false}) {
    WidthBoard w;
    w.pad(5, 10), w.pad(20, 18), w.pad(35, 10), w.pad(20, 2);
    w.track(5, 10, 6.5, 10, 0.8);   // 1.5 mm of bus out of the pad ...
    w.track(6.5, 10, 20, 18, 0.3);  // ... and the thin branch on from it
    w.track(35, 10, 23, 10, 0.8);   // 12 mm of bus: stays
    w.track(23, 10, 20, 2, 0.3);
    w.relay(model);
    const char* how = model ? "model" : "tracks";
    EXPECT_EQ(w.widthsAt(5, 10), (std::set<Coord>{mmToNm(0.3)})) << how << ": the stub took the branch's width";
    EXPECT_EQ(w.widthsAt(35, 10), (std::set<Coord>{mmToNm(0.8)})) << how << ": the long piece is the bus still";
    auto s = topo::relayStats(w.b);
    EXPECT_EQ(s.jointSeries, 1) << how;
    EXPECT_EQ(s.tees, 0) << how;
  }
}

// A neck in series between two pieces of one wider wire is a piece of that wire: laid with its width again
// where there is room (what the realiser narrowed does not stay narrow). A thin branch from a junction to a
// pad is a wire of its own and stays thin.
TEST(Topo, NarrowedPieceRejoinsItsWire) {
  for (bool model : {true, false}) {
    const char* how = model ? "model" : "tracks";
    {
      WidthBoard w;
      w.pad(5, 10), w.pad(35, 10);
      w.track(5, 10, 15, 10, 0.8), w.track(15, 10, 25, 10, 0.3), w.track(25, 10, 35, 10, 0.8);
      w.relay(model);
      for (const Track& t : w.b.tracks) EXPECT_EQ(t.width, mmToNm(0.8)) << how << ": the neck is the wire again";
      EXPECT_EQ(topo::relayStats(w.b).necks, 0) << how;
    }
    {
      WidthBoard w;
      w.pad(5, 10), w.pad(35, 10), w.pad(20, 18);
      w.track(5, 10, 20, 10, 0.8), w.track(20, 10, 35, 10, 0.8), w.track(20, 10, 20, 18, 0.3);
      w.relay(model);
      EXPECT_EQ(w.widthsAt(20, 18), (std::set<Coord>{mmToNm(0.3)})) << how << ": the branch stays thin";
      EXPECT_EQ(w.widthsAt(5, 10), (std::set<Coord>{mmToNm(0.8)})) << how;
      EXPECT_EQ(topo::relayStats(w.b).jointBranch, 1) << how;
    }
  }
}

namespace {

// Pads of several shapes and nets on one layer, and the tracks drawn between them.
struct PinBoard {
  Board b;
  LayerId top = 0;
  PinBoard() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
    Component c;
    c.ref = "U1";
    b.components.push_back(c);
  }
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }
  int net(const std::string& name) {
    for (size_t i = 0; i < b.nets.size(); ++i)
      if (b.nets[i].name == name) return int(i);
    return b.addNet(name);
  }
  void pad(const std::string& n, double x, double y, PadShapeKind kind, double w, double h) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = 0;
    p.net = net(n);
    p.pos = Point(at(x, y));
    p.shape.kind = kind;
    p.shape.w = mmToNm(w);
    p.shape.h = mmToNm(h);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  }
  void track(const std::string& n, std::initializer_list<std::pair<double, double>> pts, double width) {
    const std::pair<double, double>* prev = nullptr;
    for (const auto& q : pts) {
      if (prev) {
        Track t;
        t.a = Point(at(prev->first, prev->second));
        t.b = Point(at(q.first, q.second));
        t.width = mmToNm(width);
        t.layer = top;
        t.net = net(n);
        b.tracks.push_back(t);
      }
      prev = &q;
    }
  }
  bool vertexAt(double x, double y) const {
    for (const Track& t : b.tracks)
      if ((t.a.v() - at(x, y)).len() < 1000 || (t.b.v() - at(x, y)).len() < 1000) return true;
    return false;
  }
  int violations() const {
    DrcOptions d;
    d.unconnected = false;
    d.widths = false;
    return int(runDrc(b, d).size());
  }
  void f5() { topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1)); }
  void via(const std::string& n, double x, double y, double diameter) {
    Via v;
    v.pos = Point(at(x, y));
    v.diameter = mmToNm(diameter);
    v.drill = mmToNm(diameter / 2);
    v.layers = LayerMask(1) << top;
    v.net = net(n);
    b.vias.push_back(v);
  }
  // F7 on the model, built from the tracks as they lie.
  topo::OptimizeModelResult f7() {
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    return topo::optimizeModel(b, t);
  }
  double length(const std::string& n) const {
    double l = 0;
    for (const Track& t : b.tracks)
      if (b.nets[t.net].name == n) l += t.length();
    return l / kNmPerMm;
  }
};

}  // namespace

// The pins of a row are left through their ends only (TopoR's F5: 109 of the 110 exits of
// Arcs_standard_routing, the one left is a dog-leg another wire runs round): a wire drawn out of the long
// side is led from the pad's centre to the centre of the rounded end and straight out. Two pins of one net
// side by side keep their bridge, centre to centre. The next F5 draws the same.
TEST(Topo, RowPinsLeaveThroughTheEnd) {
  PinBoard p;
  const double x0 = 15, y0 = 10, pitch = 0.65;
  for (int i = 0; i < 8; ++i) {
    const std::string n = i == 4 ? "N3" : std::format("N{}", i);  // pins 3 and 4: one net
    p.pad(n, x0 + i * pitch, y0, PadShapeKind::Oval, 0.3, 1.9);
  }
  // Out of the long side: the first pin to the left, the last one to the right.
  p.pad("N0", 9, 4, PadShapeKind::Circle, 1, 1);
  p.track("N0", {{x0, y0}, {13, y0}, {9, 4}}, 0.2);
  p.pad("N7", 26, 16, PadShapeKind::Circle, 1, 1);
  p.track("N7", {{x0 + 7 * pitch, y0}, {x0 + 7 * pitch + 2, y0}, {26, 16}}, 0.2);
  // The pins between: from the centre through an end, at a slant.
  p.pad("N1", 13, 3, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{x0 + pitch, y0}, {x0 + pitch, y0 - 2}, {13, 3}}, 0.2);
  p.pad("N2", 16, 17, PadShapeKind::Circle, 1, 1);
  p.track("N2", {{x0 + 2 * pitch, y0}, {x0 + 2 * pitch, y0 + 2}, {16, 17}}, 0.2);
  p.track("N3", {{x0 + 3 * pitch, y0}, {x0 + 4 * pitch, y0}}, 0.2);  // the bridge
  p.pad("N5", 19, 3, PadShapeKind::Circle, 1, 1);
  p.track("N5", {{x0 + 5 * pitch, y0}, {x0 + 5 * pitch, y0 - 2}, {19, 3}}, 0.2);
  p.pad("N6", 21, 17, PadShapeKind::Circle, 1, 1);
  p.track("N6", {{x0 + 6 * pitch, y0}, {x0 + 6 * pitch, y0 + 2}, {21, 17}}, 0.2);
  ASSERT_GT(topo::relayStats(p.b).exitsSide, 0) << "the drawing leaves two pins through their sides";

  p.f5();
  auto s = topo::relayStats(p.b);
  EXPECT_EQ(s.exitsSide, 0) << s.text();
  EXPECT_EQ(s.exitsEnd, 6) << s.text();
  EXPECT_GT(s.exitsBridge, 0) << s.text();
  EXPECT_EQ(s.padsAtCentre, s.pads) << s.text();
  EXPECT_EQ(s.deadEnds, 0) << s.text();
  EXPECT_EQ(p.violations(), 0);
  // The first pin: its wire goes up, so through the upper end — the centre of the rounded end, then on.
  EXPECT_TRUE(p.vertexAt(x0, y0)) << "the wire begins at the pad's centre";
  EXPECT_TRUE(p.vertexAt(x0, y0 - 0.8)) << "... and goes through the centre of the rounded end";
  EXPECT_TRUE(p.vertexAt(x0 + 7 * pitch, y0 + 0.8));
  EXPECT_TRUE(p.vertexAt(x0 + 3 * pitch, y0) && p.vertexAt(x0 + 4 * pitch, y0)) << "the bridge is there";

  const size_t tracks = p.b.tracks.size();
  const double length = p.b.tracksLength();
  p.f5();
  auto again = topo::relayStats(p.b);
  EXPECT_EQ(p.b.tracks.size(), tracks) << "the second F5 draws the same";
  EXPECT_NEAR(p.b.tracksLength(), length, 2000);
  EXPECT_EQ(again.exitsSide, 0);
  EXPECT_EQ(again.exitsEnd, 6);
  EXPECT_EQ(p.violations(), 0);
}

// A rectangular pad: from the centre to the inner point half a width short of the end, on the side the
// wire goes to (TopoR: a pad 5.6 x 2 with a 0.3 wire — centre, (2.65, ±0.85)); a wire drawn out of the
// long side leaves through the end. A run drawn inside the pad is gone, and nothing piles up there with
// the passes.
TEST(Topo, RectPadPattern) {
  PinBoard p;
  p.pad("A", 10, 10, PadShapeKind::Rect, 5.6, 2);
  p.pad("A", 30, 16, PadShapeKind::Circle, 1, 1);
  // Drawn by hand: a dog-leg inside the pad, out of the long side.
  p.track("A", {{10, 10}, {11, 10.5}, {12, 10.5}, {12, 13}, {30, 16}}, 0.3);
  p.f5();
  auto s = topo::relayStats(p.b);
  EXPECT_EQ(s.exitsSide, 0) << s.text();
  EXPECT_EQ(s.padsAtCentre, s.pads) << s.text();
  EXPECT_EQ(s.deadEnds, 0) << s.text();
  EXPECT_TRUE(p.vertexAt(10, 10));
  EXPECT_TRUE(p.vertexAt(12.65, 10.85)) << "the inner point: half a width short of the end, in the corner the wire goes to";
  EXPECT_FALSE(p.vertexAt(11, 10.5)) << "the run drawn inside the pad is gone";
  EXPECT_FALSE(p.vertexAt(12, 10.5));
  EXPECT_EQ(s.inRect, 1) << "the lead from the centre and no more: " << s.text();
  EXPECT_EQ(p.violations(), 0);

  const size_t tracks = p.b.tracks.size();
  const double length = p.b.tracksLength();
  for (int pass = 0; pass < 2; ++pass) {
    p.f5();
    EXPECT_EQ(p.b.tracks.size(), tracks) << "pass " << pass;
    EXPECT_NEAR(p.b.tracksLength(), length, 2000) << "pass " << pass;
    EXPECT_TRUE(p.vertexAt(12.65, 10.85)) << "pass " << pass;
  }
}

// The model's wires leave a rectangular pad where the tracks had them (the exit is pinned), and are drawn
// with the pattern's vertices on the way: the inner point half a width short of the edge and the point of
// the edge straight beyond it. The next F5 on the model draws the same.
TEST(Topo, RectPadPatternOnTheModel) {
  PinBoard p;
  p.pad("A", 10, 10, PadShapeKind::Rect, 5.6, 2);
  p.pad("A", 30, 16, PadShapeKind::Circle, 1, 1);
  p.track("A", {{10, 10}, {14, 10.5}, {30, 16}}, 0.3);  // out of the end x = 12.8 at y = 10.35
  auto f5 = [&] {
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    ASSERT_TRUE(topo::runF5Model(p.b, t).drawn);
  };
  f5();
  auto s = topo::relayStats(p.b);
  EXPECT_EQ(s.padsAtCentre, s.pads) << s.text();
  EXPECT_EQ(s.exitsSide, 0) << s.text();
  EXPECT_TRUE(p.vertexAt(10, 10));
  EXPECT_TRUE(p.vertexAt(12.65, 10.35)) << "the inner point: " << s.text();
  EXPECT_TRUE(p.vertexAt(12.8, 10.35)) << "the point of the edge";
  EXPECT_EQ(s.inRect, 2) << "centre - inner point - edge: " << s.text();
  EXPECT_EQ(p.violations(), 0);
  const size_t tracks = p.b.tracks.size();
  const double length = p.b.tracksLength();
  f5();
  EXPECT_EQ(p.b.tracks.size(), tracks);
  EXPECT_NEAR(p.b.tracksLength(), length, 2000);
  EXPECT_TRUE(p.vertexAt(12.65, 10.35));
}

// F5 of a selection: the tracks of a wire outside its pad are chosen, the selection grows to the wire and
// its lead inside the pad. The wire is led through the same inner point again and nothing is doubled: the
// arc that begins at the inner point starts with a run shorter than the glue, the wire's sketch begins at
// its far end, and the inner point was looked for from there (it crept 13 um a pass).
TEST(Topo, SelectedWireTakesItsLead) {
  // Two wires of the rectangle leave through one inner point (a branch there: the selection does not grow
  // through it); the pin's wire has a plain vertex at its inner point.
  PinBoard p;
  p.pad("A", 10, 10, PadShapeKind::Rect, 5.6, 2);
  p.pad("A", 30, 16, PadShapeKind::Circle, 1, 1);
  p.pad("A", 30, 19, PadShapeKind::Circle, 1, 1);
  p.track("A", {{10, 10}, {14, 10.5}, {30, 16}}, 0.3);
  p.track("A", {{10, 10}, {14, 10.6}, {30, 19}}, 0.3);
  p.pad("B", 10, 4, PadShapeKind::Oval, 1.9, 0.3);  // a pin lying along x
  p.pad("B", 30, 4, PadShapeKind::Circle, 1, 1);
  p.track("B", {{10, 4}, {14, 4}, {30, 4}}, 0.2);
  p.f5();
  const double length = p.b.tracksLength();
  const auto before = topo::relayStats(p.b);
  ASSERT_EQ(before.deadEnds, 0) << before.text();
  // One wire of the rectangle and the pin's: only their tracks that reach outside the pads.
  auto inside = [&](const Track& t) {
    for (const Pad& pad : p.b.pads)
      if (pad.net == t.net && pad.shapeGeom().distance(t.a.v()) <= 1000 && pad.shapeGeom().distance(t.b.v()) <= 1000) return true;
    return false;
  };
  auto reaches = [&](const Track& t, double x, double y) { return (t.a.v() - PinBoard::at(x, y)).len() < 1000 || (t.b.v() - PinBoard::at(x, y)).len() < 1000; };
  std::vector<char> chosen(p.b.tracks.size(), 0);
  int picked = 0;
  for (size_t i = 0; i < p.b.tracks.size(); ++i) {
    const Track& t = p.b.tracks[i];
    if (inside(t)) continue;
    if (reaches(t, 30, 16) || reaches(t, 30, 4)) chosen[i] = 1, ++picked;
  }
  ASSERT_GT(picked, 0);
  // The tracks between two points: the leads from the pads' centres to their inner points.
  auto between = [&](double x1, double y1, double x2, double y2) {
    int n = 0;
    for (const Track& t : p.b.tracks) n += (reaches(t, x1, y1) && reaches(t, x2, y2));
    return n;
  };
  ASSERT_EQ(between(10, 10, 12.65, 10.85), 2) << "a lead for each of the rectangle's two wires";
  ASSERT_EQ(between(10, 4, 10.8, 4), 1);
  topo::reshapeTracks(p.b, chosen, {.local = true});
  EXPECT_EQ(between(10, 10, 12.65, 10.85), 2) << "the wire is led through the same inner point";
  EXPECT_EQ(between(10, 4, 10.8, 4), 1);
  const auto s = topo::relayStats(p.b);
  EXPECT_NEAR(p.b.tracksLength(), length, 0.02 * kNmPerMm);  // laid against the wire beside it as it lies: microns
  EXPECT_EQ(s.deadEnds, 0) << s.text();
  EXPECT_EQ(s.padsAtCentre, s.pads) << s.text();
  EXPECT_EQ(p.violations(), 0);
}

// F7 moves a via by what its wires do to it (TopoR's forces, Bessonov et al. 2014, fig. 3a). A via in the corner
// of an L of its two wires is pulled by both: it goes to the straight line between the pads, where the pulls
// cancel, and the wire gets as short as the straight line.
TEST(Topo, F7PullsAViaOntoTheStraightLine) {
  PinBoard p;
  p.pad("N1", 5, 5, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 25, 15, PadShapeKind::Circle, 1, 1);
  p.via("N1", 25, 5, 1.0);
  p.track("N1", {{5, 5}, {25, 5}}, 0.3);
  p.track("N1", {{25, 5}, {25, 15}}, 0.3);
  auto res = p.f7();
  ASSERT_TRUE(res.drawn);
  ASSERT_EQ(p.b.vias.size(), 1u);
  const Vec2 v = p.b.vias[0].pos.v();
  EXPECT_LT(distPointSegment(v, PinBoard::at(5, 5), PinBoard::at(25, 15)), 0.05 * kNmPerMm) << "the via at (" << v.x / 1e6 << ", " << v.y / 1e6 << ")";
  EXPECT_LT(p.length("N1"), std::hypot(20.0, 10.0) + 0.05);
  EXPECT_LT(res.forceAfter, 0.1);
  EXPECT_EQ(p.violations(), 0);
}

// ... and a wire of another net bent round the via presses on it, towards the centre of the bend: the via
// leaves the wire's way and the wire runs straight. Here the via's own wires pull it the same way; it ends on
// the line between its pads, and the other net's wire is as long as the straight line between its own.
TEST(Topo, F7MovesAViaOutOfAWiresWay) {
  PinBoard p;
  p.pad("N2", 14, 4, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 26, 4, PadShapeKind::Circle, 1, 1);
  p.via("N2", 20, 10, 1.0);
  p.track("N2", {{14, 4}, {20, 10}}, 0.3);
  p.track("N2", {{20, 10}, {26, 4}}, 0.3);
  p.pad("N1", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 35, 10, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{5, 10}, {19, 11.5}, {21, 11.5}, {35, 10}}, 0.3);  // over the via
  auto res = p.f7();
  ASSERT_TRUE(res.drawn);
  const Vec2 v = p.b.vias[0].pos.v();
  EXPECT_LT(distPointSegment(v, PinBoard::at(14, 4), PinBoard::at(26, 4)), 0.05 * kNmPerMm) << "the via at (" << v.x / 1e6 << ", " << v.y / 1e6 << ")";
  EXPECT_LT(p.length("N1"), 30.05);
  EXPECT_LT(p.length("N2"), 12.05);
  EXPECT_EQ(p.violations(), 0);
}

// TopoR's rules carry two clearances: the minimum, which every spot must keep (Board::clearance — what the DRC
// asks for), and the nominal, kept wherever there is room (Board::clearanceNom). Arcs: 0.3 and 0.45 for all nets.
TEST(Topo, NominalClearanceIsRead) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_master_f5.fst"));
  ASSERT_TRUE(lb.has_value());
  const Board& b = **lb;
  ASSERT_GE(b.nets.size(), 2u);
  EXPECT_TRUE(b.hasNominal());
  EXPECT_EQ(b.clearance(0, 1, 0), mmToNm(0.3));
  EXPECT_EQ(b.clearanceNom(0, 1, 0), mmToNm(0.45));
  EXPECT_EQ(b.clearanceNom(0, kNoNet, 0), mmToNm(0.45));  // a pad without a net: the wire's own rule
  auto pcb = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));  // P-CAD has the one clearance
  ASSERT_TRUE(pcb.has_value());
  EXPECT_FALSE((**pcb).hasNominal());
  EXPECT_EQ((**pcb).clearanceNom(0, 1, 0), (**pcb).clearance(0, 1, 0));
}

// F6 on the model re-lays a wire by a shorter path over the triangulation (TopoR's re-laying). A wire drawn
// the long way round a pad of another net goes the short way; the model stays whole: no wires crossing, every
// consecutive pair of crossings on one triangle, the capacities fresh.
TEST(Topo, RelayTakesTheShortWay) {
  PinBoard p;
  p.pad("N2", 20, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 20, 17, PadShapeKind::Circle, 1, 1);
  p.track("N2", {{20, 10}, {20, 17}}, 0.3);
  p.pad("N1", 5, 8, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 35, 8, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{5, 8}, {17, 13}, {18.5, 13}, {18.5, 18.5}, {21.5, 18.5}, {21.5, 13}, {23, 13}, {35, 8}}, 0.3);  // over the two pads and their wire
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  const double before = p.length("N1");
  topo::RefineModelOptions o;
  o.junctions = false;
  auto res = topo::refineModel(p.b, t, o);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.relaid, 1);
  EXPECT_GT(before, 40.0);
  EXPECT_LT(p.length("N1"), 30.3);  // the straight line is 30 mm; it passes 1.5 mm below the first pad's edge
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
  EXPECT_EQ(p.violations(), 0);
}

// ... and the short way may lie between two wires of other nets: the new path is led between them and crosses
// neither (the search among the copper as it lies finds such a way only where there is room already).
TEST(Topo, RelayGoesBetweenTwoWires) {
  PinBoard p;
  p.pad("N2", 10, 4, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 30, 4, PadShapeKind::Circle, 1, 1);
  p.track("N2", {{10, 4}, {30, 4}}, 0.3);
  p.pad("N3", 10, 12, PadShapeKind::Circle, 1, 1);
  p.pad("N3", 30, 12, PadShapeKind::Circle, 1, 1);
  p.track("N3", {{10, 12}, {30, 12}}, 0.3);
  p.pad("N1", 5, 8, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 35, 8, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{5, 8}, {8, 16}, {32, 16}, {35, 8}}, 0.3);  // round the outside of N3
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  topo::RefineModelOptions o;
  o.junctions = false;
  auto res = topo::refineModel(p.b, t, o);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.relaid, 1);
  EXPECT_LT(p.length("N1"), 30.3);
  EXPECT_NEAR(p.length("N2"), 20.0, 0.01);
  EXPECT_NEAR(p.length("N3"), 20.0, 0.01);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  EXPECT_EQ(p.violations(), 0);
}

// The flexible fixation of a net: F6 does not re-lay its wires (the long way round stays), F7 does not move its
// vias; F5 draws its wires anew — their shape is not fixed.
TEST(Topo, FlexFixedNetKeepsItsTopology) {
  {
    PinBoard p;
    p.pad("N2", 20, 10, PadShapeKind::Circle, 1, 1);
    p.pad("N2", 20, 17, PadShapeKind::Circle, 1, 1);
    p.track("N2", {{20, 10}, {20, 17}}, 0.3);
    p.pad("N1", 5, 8, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 35, 8, PadShapeKind::Circle, 1, 1);
    p.track("N1", {{5, 8}, {17, 13}, {18.5, 13}, {18.5, 18.5}, {21.5, 18.5}, {21.5, 13}, {23, 13}, {35, 8}}, 0.3);
    p.b.nets[size_t(p.net("N1"))].flexFixed = true;
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    topo::RefineModelOptions o;
    o.junctions = false;
    auto res = topo::refineModel(p.b, t, o);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.relaid, 0);
    EXPECT_GT(p.length("N1"), 34.0);  // still over the two pads (pulled taut: the shape is F6's to draw)
    EXPECT_EQ(p.violations(), 0);
  }
  {
    PinBoard p;
    p.pad("N1", 5, 5, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 25, 15, PadShapeKind::Circle, 1, 1);
    p.via("N1", 25, 5, 1.0);
    p.track("N1", {{5, 5}, {12, 7}, {25, 5}}, 0.3);  // a bend F5 pulls out
    p.track("N1", {{25, 5}, {25, 15}}, 0.3);
    p.b.nets[size_t(p.net("N1"))].flexFixed = true;
    const double drawn = p.length("N1");
    auto res = p.f7();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viaMoves, 0);
    EXPECT_EQ(p.b.vias[0].pos, Point(PinBoard::at(25, 5)));
    EXPECT_LT(p.length("N1"), drawn - 0.2);  // the bend is gone: the wires were drawn anew
    EXPECT_NEAR(p.length("N1"), 30.0, 0.05);
  }
}

namespace {

// The points of a net where three track ends and more meet.
std::vector<Vec2> branchPointsOf(const Board& b, const std::string& net) {
  std::map<std::pair<long, long>, std::pair<int, Vec2>> ends;
  for (const Track& t : b.tracks)
    if (b.nets[t.net].name == net)
      for (Vec2 e : {t.a.v(), t.b.v()}) {
        auto& at = ends[{std::lround(e.x / 1000), std::lround(e.y / 1000)}];
        ++at.first;
        at.second = e;
      }
  std::vector<Vec2> out;
  for (auto& [key, at] : ends)
    if (at.first >= 3) out.push_back(at.second);
  return out;
}

// The angles (degrees, ascending) between the tracks that end at a point.
std::vector<double> anglesAt(const Board& b, Vec2 p) {
  std::vector<double> dirs;
  for (const Track& t : b.tracks) {
    if (t.isArc()) continue;
    if ((t.a.v() - p).len() < 1000) dirs.push_back(std::atan2(t.b.v().y - p.y, t.b.v().x - p.x));
    if ((t.b.v() - p).len() < 1000) dirs.push_back(std::atan2(t.a.v().y - p.y, t.a.v().x - p.x));
  }
  std::ranges::sort(dirs);
  std::vector<double> out;
  for (size_t i = 0; i < dirs.size(); ++i) {
    double d = dirs[(i + 1) % dirs.size()] - dirs[i];
    if (d <= 0) d += 2 * std::numbers::pi;
    out.push_back(d * 180 / std::numbers::pi);
  }
  std::ranges::sort(out);
  return out;
}

void expectSoundModel(const topo::Topology& t) {
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
}

}  // namespace

// Two wires of a net leaving a vertex at less than 120 degrees share their way: F6 makes a branch point at
// the point of least length (Bessonov, Luzin, Lyachek, Popov 2014, fig. 4), the three wires meet there at 120
// degrees. A via at (5, 10) and two pads at (25, 10 -+ 7.28): the wires leave at 40 degrees, 42.57 mm; the tree
// with the branch point at (20.80, 10) is 32.61 mm.
TEST(Topo, TwoWiresUnder120DegreesGetABranchPoint) {
  PinBoard p;
  const double h = 20 * std::tan(20 * std::numbers::pi / 180);
  p.via("N1", 5, 10, 1.0);
  p.pad("N1", 25, 10 - h, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 25, 10 + h, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{5, 10}, {25, 10 - h}}, 0.3);
  p.track("N1", {{5, 10}, {25, 10 + h}}, 0.3);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_NEAR(p.length("N1"), 42.57, 0.01);
  auto res = topo::refineModel(p.b, t);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.branches, 1);
  const double x = 25 - h / std::tan(60 * std::numbers::pi / 180);
  EXPECT_NEAR(p.length("N1"), (x - 5) + 2 * h / std::sin(60 * std::numbers::pi / 180), 0.1);
  const std::vector<Vec2> at = branchPointsOf(p.b, "N1");
  ASSERT_EQ(at.size(), 1u);
  EXPECT_LT((at[0] - PinBoard::at(x, 10)).len(), 0.1 * kNmPerMm);
  for (double a : anglesAt(p.b, at[0])) EXPECT_NEAR(a, 120.0, 2.0);
  EXPECT_EQ(p.b.vias[0].pos, Point(PinBoard::at(5, 10)));  // F6 moves no via
  expectSoundModel(t);
  EXPECT_EQ(p.violations(), 0);
  // Switched off, the two wires stay as they were.
  PinBoard q;
  q.via("N1", 5, 10, 1.0);
  q.pad("N1", 25, 10 - h, PadShapeKind::Circle, 1, 1);
  q.pad("N1", 25, 10 + h, PadShapeKind::Circle, 1, 1);
  q.track("N1", {{5, 10}, {25, 10 - h}}, 0.3);
  q.track("N1", {{5, 10}, {25, 10 + h}}, 0.3);
  topo::Topology::assignIds(q.b);
  topo::Topology tq;
  tq.build(q.b);
  topo::RefineModelOptions off;
  off.branches = false;
  auto none = topo::refineModel(q.b, tq, off);
  ASSERT_TRUE(none.drawn);
  EXPECT_EQ(none.branches, 0);
  EXPECT_NEAR(q.length("N1"), 42.57, 0.01);
}

// ... and with something of another net between the two wires (fig. 6). A pad in the shared way alone: the
// way goes round it and the branch point stands where it would without the pad (the trunk passes the pad, which
// is one of the two paths laid the other side of it). A wire across the fork: the shared way ends before it,
// the branches go either side.
TEST(Topo, BranchPointAndWhatStandsBetweenTheBranches) {
  const double h = 20 * std::tan(20 * std::numbers::pi / 180);
  auto fork = [&](PinBoard& p) {
    p.via("N1", 5, 10, 1.0);
    p.pad("N1", 25, 10 - h, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 25, 10 + h, PadShapeKind::Circle, 1, 1);
    p.track("N1", {{5, 10}, {25, 10 - h}}, 0.3);
    p.track("N1", {{5, 10}, {25, 10 + h}}, 0.3);
  };
  const double x = 25 - h / std::tan(60 * std::numbers::pi / 180);  // the branch point with nothing in the way
  {
    PinBoard p;
    fork(p);
    p.pad("N2", 15, 10, PadShapeKind::Circle, 1, 1);  // at x = 15 the two wires pass 3.64 mm above and below
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    auto res = topo::refineModel(p.b, t);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.branches, 1);
    const std::vector<Vec2> at = branchPointsOf(p.b, "N1");
    ASSERT_EQ(at.size(), 1u);
    // Beyond the pad, and a little to the side of where it would stand without it: the trunk comes to it off the
    // pad's side, 8 degrees off the axis, and the three wires meet at 120 degrees round that.
    EXPECT_GT(at[0].x, 19.5 * kNmPerMm);
    EXPECT_LT((at[0] - PinBoard::at(x, 10)).len(), 1.0 * kNmPerMm);
    const double tree = (x - 5) + 2 * h / std::sin(60 * std::numbers::pi / 180);
    EXPECT_GT(p.length("N1"), tree);        // the trunk bends round the pad
    EXPECT_LT(p.length("N1"), tree + 0.3);  // ... by 0.85 mm off the straight line over 10 and 6 mm
    expectSoundModel(t);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    PinBoard p;
    fork(p);
    p.pad("N2", 15, 10, PadShapeKind::Circle, 1, 1);
    p.pad("N2", 33, 10, PadShapeKind::Circle, 1, 1);
    p.track("N2", {{15, 10}, {33, 10}}, 0.3);  // out of the fork between the two pads
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    const double before = p.length("N1");
    auto res = topo::refineModel(p.b, t);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.branches, 1);
    const std::vector<Vec2> at = branchPointsOf(p.b, "N1");
    ASSERT_EQ(at.size(), 1u);
    EXPECT_LT(at[0].x, 14.5 * kNmPerMm);  // before the pad's copper
    EXPECT_GT(at[0].x, 10.0 * kNmPerMm);  // ... and as far towards it as the rule lets the branches pass
    EXPECT_LT(p.length("N1"), before - 2.0);
    EXPECT_NEAR(p.length("N2"), 18.0, 0.05);
    expectSoundModel(t);
    EXPECT_EQ(p.violations(), 0);
  }
}

// Four pads and two branch points that join them by the wrong pairs (fig. 5): the forces bring the two branch
// points together, F6 makes them one and pairs the four wires anew. Pads at (10, 5), (10, 15), (30, 5), (30, 15);
// the upper two joined at one branch point and the lower two at the other is 4 x 11.2 mm and more, the left two
// and the right two is 20 + 10 x sqrt(3) = 37.32 mm.
TEST(Topo, BranchPointsThatComeTogetherArePairedAnew) {
  PinBoard p;
  p.pad("N1", 10, 5, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 10, 15, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 30, 5, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 30, 15, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{10, 5}, {20, 7}, {30, 5}}, 0.3);
  p.track("N1", {{10, 15}, {20, 13}, {30, 15}}, 0.3);
  p.track("N1", {{20, 7}, {20, 13}}, 0.3);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_GT(p.length("N1"), 46.0);
  auto res = topo::refineModel(p.b, t);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.branchesMerged, 1);
  EXPECT_EQ(res.branches, 2);
  EXPECT_NEAR(p.length("N1"), 20 + 10 * std::sqrt(3.0), 0.1);
  const std::vector<Vec2> at = branchPointsOf(p.b, "N1");
  ASSERT_EQ(at.size(), 2u);
  for (Vec2 j : at) {
    EXPECT_NEAR(j.y / kNmPerMm, 10.0, 0.1);  // on the line between the pairs now
    for (double a : anglesAt(p.b, j)) EXPECT_NEAR(a, 120.0, 2.0);
  }
  expectSoundModel(t);
  EXPECT_EQ(p.violations(), 0);
}

// A clinch (Luzin, Popov, Popov, NTV ITMO 2012 no. 4, fig. 1 and 5): two wires bent round each other's ends, and
// no wire alone has a shorter way — the other is in it. F6 takes the hindering wire out, leads the long one
// straight and lays the other anew. Pads of N1 at (15, 5) and (15, 15), of N2 at (25, 5) and (25, 15): N1 goes
// round N2's upper pad and N2 round N1's lower one; unhooked, both are 10 mm.
TEST(Topo, ClinchOfTwoWiresIsUndone) {
  auto board = [](PinBoard& p) {
    p.pad("N1", 15, 5, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 15, 15, PadShapeKind::Circle, 1, 1);
    p.pad("N2", 25, 5, PadShapeKind::Circle, 1, 1);
    p.pad("N2", 25, 15, PadShapeKind::Circle, 1, 1);
    p.track("N1", {{15, 5}, {28, 2}, {28, 8}, {20, 10}, {15, 15}}, 0.3);
    p.track("N2", {{25, 5}, {17, 8}, {13, 10}, {13, 17}, {25, 15}}, 0.3);
  };
  {
    PinBoard p;
    board(p);
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    EXPECT_EQ(p.violations(), 0);
    auto res = topo::refineModel(p.b, t);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.clinches, 1);
    EXPECT_NEAR(p.length("N1"), 10.0, 0.05);
    EXPECT_NEAR(p.length("N2"), 10.0, 0.05);
    expectSoundModel(t);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    // Switched off, each wire is pulled taut round the other's pad and that is all.
    PinBoard p;
    board(p);
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    topo::RefineModelOptions off;
    off.clinches = false;
    auto res = topo::refineModel(p.b, t, off);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.clinches, 0);
    EXPECT_GT(p.length("N1") + p.length("N2"), 30.0);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    // A flexibly fixed net is neither the long wire nor the one taken out.
    PinBoard p;
    board(p);
    p.b.nets[size_t(p.net("N2"))].flexFixed = true;
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    auto res = topo::refineModel(p.b, t);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.clinches, 0);
    EXPECT_GT(p.length("N2"), 15.0);
  }
}
