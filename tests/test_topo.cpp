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
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "topo/Capacity.h"
#include "topo/Chains.h"
#include "topo/Flip.h"
#include "topo/Move.h"
#include "topo/Sidecar.h"
#include "router/topo/ModelTools.h"
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
    auto chains = topo::wireChains(b, g, all, topo::OwnCopper(b));
    std::erase_if(chains, [](const topo::WireChain& c) { return c.closed; });
    // Chains lying inside the copper they start and end on are that copper, not wires.
    topo::OwnCopper own(b);
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
    // arz_2L: a few wires in its via rows come out a little differently (the sketch's exit from a via
    // depends on the first crossing); their drawings stay clean.
    EXPECT_LE(moved, std::string(name).ends_with("arz_2L.fst") ? 12 : 0) << name;
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
  // Stale: a track changed.
  Board edited = b;
  edited.tracks.front().width += 1000;
  auto stale = topo::loadTopology(edited, path);
  EXPECT_FALSE(stale.has_value());
  std::filesystem::remove(path);
}
