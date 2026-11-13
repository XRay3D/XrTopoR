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
#include "core/DiffPairs.h"
#include "core/Edit.h"
#include "core/Rules.h"
#include "core/Runs.h"
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
  int crossing = 0, throughPad = 0, outside = 0, overflow = 0, blocked = 0;
};
Counts countViolations(const topo::Topology& t) {
  Counts c;
  for (const topo::Violation& v : t.violations) {
    using K = topo::Violation::Kind;
    (v.kind == K::Crossing ? c.crossing : v.kind == K::ThroughPad ? c.throughPad : v.kind == K::OutsideBoard ? c.outside : v.kind == K::Blocked ? c.blocked : c.overflow)++;
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
        inside = r::any_of(itemShapes(b, *r0), [&](const Shape& s) { return s.contains(c.path[k]); });
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
      int k = int(r::find(E.cross, cid) - E.cross.begin());
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
    if (A.owners[A.wires[wi].end[0]].c != C.owners[C.wires[it->second].end[0]].c) r::reverse(ec);  // ranks are per edge, not per wire
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

// The pour keeps the rules, the pair's from the copper of the other net, unless it has a clearance of its own: that
// one holds for everything.
TEST(Topo, PourKeepsThePairRule) {
  auto lb = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  ASSERT_FALSE(b.zones.empty());
  b.zones.front().useClearance = false;
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
  const double byTheRule = gapToOther();
  b.zones.front().useClearance = true;
  b.zones.front().clearance = mmToNm(0.2);
  fillZones(b);
  EXPECT_LT(gapToOther(), byTheRule - 0.3 * kNmPerMm) << "its own one, for everything";
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
  // A second copper layer; pads and vias made after it are on both layers unless told otherwise.
  LayerId bottom = -1;
  void twoLayers() {
    bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    b.layers[bottom].copperIndex = 1;
  }
  // A routing keepout: an area (a polygon) or a line, for wires and/or vias, on all copper layers (0) or
  // the given ones.
  void keepout(std::initializer_list<std::pair<double, double>> poly, bool wires = true, bool vias = true, LayerMask layers = 0) {
    Keepout k;
    k.wires = wires;
    k.vias = vias;
    k.layers = layers;
    Graphic g;
    g.kind = GraphicKind::Poly;
    for (const auto& q : poly) g.pts.push_back(at(q.first, q.second));
    k.shape.push_back(g);
    b.keepouts.push_back(k);
  }
  void keepoutLine(std::pair<double, double> a, std::pair<double, double> c, bool wires = true, bool vias = true, LayerMask layers = 0) {
    Keepout k;
    k.wires = wires;
    k.vias = vias;
    k.layers = layers;
    Graphic g;
    g.kind = GraphicKind::Line;
    g.a = at(a.first, a.second);
    g.b = at(c.first, c.second);
    k.shape.push_back(g);
    b.keepouts.push_back(k);
  }
  // A cutout in the board: a hole in the outline.
  void cutout(std::initializer_list<std::pair<double, double>> poly) {
    std::vector<Vec2> loop;
    for (const auto& q : poly) loop.push_back(at(q.first, q.second));
    b.outline.push_back(loop);
  }
  // A copper area of the net on the top layer; poured round what the board has so far (fillZones) unless
  // told otherwise, so add the pads and tracks first (an island keeps only the copper touching its net:
  // a pour with no pad of its net in it is kept whole by removeIslands = false).
  int zone(const std::string& n, std::initializer_list<std::pair<double, double>> poly, bool pour = true, double clearance = 0) {
    Zone z;
    z.net = net(n);
    z.layer = top;
    z.clearance = mmToNm(clearance);
    z.useClearance = clearance > 0;
    z.removeIslands = false;
    for (const auto& q : poly) z.outline.push_back(at(q.first, q.second));
    b.zones.push_back(z);
    if (pour) {
      ZoneFillOptions o;
      fillZones(b, o);
    }
    return int(b.zones.size() - 1);
  }
  // A differential pair of the nets P and N: an impedance rule with the conductor width and the gap on every
  // copper layer, a cluster and a signal per net, the differential signal; the rules compiled (the board's own
  // rules as they are, DesignRules of the classes).
  int pair(const std::string& P, const std::string& N, double w, double gap, double mismatch = 0.1) {
    net(P);
    net(N);
    Impedance z;
    z.name = "ZD";
    z.z0 = 100;
    z.diff = true;
    for (LayerId l : b.copperLayers()) z.rules.push_back({b.layers[l].name, mmToNm(w), mmToNm(gap)});
    b.hispeed.impedances.push_back(z);
    for (const std::string& n : {P, N}) {
      SignalCluster c;
      c.impedance = "ZD";
      c.nets = {n};
      Signal sg;
      sg.name = n + "_sig";
      c.signalList.push_back(sg);
      b.hispeed.clusters.push_back(c);
    }
    DiffSignal d;
    d.name = P + "/" + N;
    d.mismatch = mmToNm(mismatch);
    d.impedance = "ZD";
    d.signalA = P + "_sig";
    d.signalB = N + "_sig";
    b.hispeed.diffSignals.push_back(d);
    if (!b.rules) b.rules = rulesFromBoard(b);
    compileRules(b);
    return int(b.hispeed.diffSignals.size() - 1);
  }
  // A zipped section of the pair on the top layer along the axis (straight pieces): the axis as the board
  // keeps it, the two conductors at the offset either side (P on the left of the travel), and a straight
  // single track from each conductor end to the nearest pad of its net.
  int zip(const std::string& P, const std::string& N, std::initializer_list<std::pair<double, double>> axis) {
    const int d = b.pairOfNet(net(P));
    Coord w = 0, g = 0;
    if (!b.pairRule(d, top, w, g)) return -1;
    ZippedWire z;
    z.layer = top;
    z.pair = d;
    z.netP = net(P);
    z.netN = net(N);
    z.pSide = 1;
    z.condWidth = w;
    z.gap = g;
    std::vector<Vec2> pts;
    for (const auto& q : axis) pts.push_back(at(q.first, q.second));
    for (size_t i = 0; i + 1 < pts.size(); ++i) {
      Track t;
      t.a = Point(pts[i]);
      t.b = Point(pts[i + 1]);
      t.width = z.width();
      t.layer = top;
      t.net = kNoNet;
      z.axis.push_back(t);
    }
    const int zi = int(b.zips.size());
    b.zips.push_back(z);
    // The conductors: the axis's points offset along the bisector of the normals at the corners.
    auto offsetPoint = [&](size_t i, double side) {
      Vec2 n;
      if (i > 0) n = n + (pts[i] - pts[i - 1]).normalized().perp();
      if (i + 1 < pts.size()) n = n + (pts[i + 1] - pts[i]).normalized().perp();
      n = n.normalized();
      // (At a corner the offset along the bisector is the offset over the cosine of the half angle.)
      double k = 1;
      if (i > 0 && i + 1 < pts.size()) k = 1.0 / std::max(0.2, n.dot((pts[i] - pts[i - 1]).normalized().perp()));
      return pts[i] + n * (side * double(z.offset()) * k);
    };
    Vec2 ends[2][2];
    for (int side = 0; side < 2; ++side) {
      const double sg = side ? 1.0 : -1.0;  // P (+perp) left, N right
      const int nt = side ? z.netP : z.netN;
      for (size_t i = 0; i + 1 < pts.size(); ++i) {
        Track t;
        t.a = Point(offsetPoint(i, sg));
        t.b = Point(offsetPoint(i + 1, sg));
        t.width = w;
        t.layer = top;
        t.net = nt;
        t.zip = zi;
        b.tracks.push_back(t);
      }
      ends[side][0] = offsetPoint(0, sg);
      ends[side][1] = offsetPoint(pts.size() - 1, sg);
      // The single tracks to the nearest pads of the net at each end.
      for (int e = 0; e < 2; ++e) {
        const Pad* best = nullptr;
        for (const Pad& p : b.pads)
          if (p.net == nt && (!best || (p.pos.v() - ends[side][e]).len() < (best->pos.v() - ends[side][e]).len())) best = &p;
        if (!best) continue;
        Track t;
        t.a = Point(ends[side][e]);
        t.b = best->pos;
        t.width = w;
        t.layer = top;
        t.net = nt;
        b.tracks.push_back(t);
      }
    }
    return zi;
  }
  int drcOf(DrcViolation::Type kind) const {
    DrcOptions d;
    d.unconnected = false;
    d.widths = false;
    int n = 0;
    for (const DrcViolation& v : runDrc(b, d)) n += v.type == kind;
    return n;
  }
  // F5 on the model, built from the tracks as they lie; the model is kept for the checks.
  struct F5 {
    topo::Topology t;
    topo::F5ModelResult res;
  };
  F5 f5Model() {
    topo::Topology::assignIds(b);
    F5 f;
    f.t.build(b);
    f.res = topo::runF5Model(b, f.t);
    return f;
  }
  topo::RefineModelResult f6(const topo::RefineModelOptions& o = {}) {
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    return topo::refineModel(b, t, o);
  }
  // The least distance from the net's tracks (their centre lines) to a point / a segment, in mm.
  double centreLineTo(const std::string& n, Vec2 a, Vec2 c) const {
    double best = 1e18;
    for (const Track& t : b.tracks) {
      if (b.nets[t.net].name != n) continue;
      Polyline p = t.path();
      for (size_t i = 0; i + 1 < p.size(); ++i) best = std::min(best, distSegmentSegment(p[i], p[i + 1], a, c));
    }
    return best / kNmPerMm;
  }
};

}  // namespace

// A differential pair's rule: the gap of the impedance rule is the clearance between the two nets of the pair on
// the layer (0.2 where the class says 0.3), nothing changes between a pair's net and another; the conductor is as
// wide as the rule says and no narrower; two conductors a gap apart, 0.3 wide where the class says 0.4, are no
// violation (AMK310: 126 width records of 0.3 < 0.4 on the pairs' nets gone).
TEST(Topo, PairRuleGivesTheGapAndTheWidth) {
  PinBoard p;
  p.b.netClasses[0].clearance = mmToNm(0.3);
  p.b.netClasses[0].trackWidth = mmToNm(0.4);
  p.pad("P", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N", 5, 12, PadShapeKind::Circle, 1, 1);
  p.pad("X", 5, 16, PadShapeKind::Circle, 1, 1);
  const int d = p.pair("P", "N", 0.3, 0.2);
  EXPECT_EQ(d, 0);
  const int P = p.net("P"), N = p.net("N"), X = p.net("X");
  EXPECT_EQ(p.b.pairOfNet(P), 0);
  EXPECT_EQ(p.b.pairOfNet(X), -1);
  EXPECT_EQ(p.b.clearance(P, N, p.top), mmToNm(0.2));
  EXPECT_EQ(p.b.clearance(P, X, p.top), mmToNm(0.3));
  EXPECT_EQ(p.b.trackWidth(P, p.top), mmToNm(0.3));
  EXPECT_EQ(p.b.minTrackWidth(P, p.top), mmToNm(0.3));
  EXPECT_EQ(p.b.trackWidth(X, p.top), mmToNm(0.4));
  p.track("P", {{8, 10}, {30, 10}}, 0.3);
  p.track("N", {{8, 10.5}, {30, 10.5}}, 0.3);  // 0.2 apart edge to edge
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Width), 0);
  p.track("X", {{8, 11.0}, {30, 11.0}}, 0.4);  // 0.15 from N: a violation of the ordinary rule
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 1);
}

namespace {

// A pair P/N (0.3 wide, 0.2 apart) zipped from (8,10) to (32,10) with a kink, its four pads outside the
// section, and a third net X with a pad above.
PinBoard pairBoard() {
  PinBoard p;
  p.b.netClasses[0].clearance = mmToNm(0.2);
  p.pad("P", 4, 11, PadShapeKind::Circle, 1, 1);
  p.pad("N", 4, 9, PadShapeKind::Circle, 1, 1);
  p.pad("P", 36, 11, PadShapeKind::Circle, 1, 1);
  p.pad("N", 36, 9, PadShapeKind::Circle, 1, 1);
  p.pad("X", 20, 6, PadShapeKind::Circle, 1, 1);
  p.pair("P", "N", 0.3, 0.2);
  p.zip("P", "N", {{8, 10}, {20, 12}, {32, 10}});
  return p;
}

}  // namespace

// The runs (core/Runs.h): a wire from a pad's centre, out of the pad and on to a via is one run (the lead inside
// the pad is the wire's), and ends on the via; the next one from the via on is another; a width change starts a
// third; an exact run splits where two ends miss each other by 0.5 um, a glued one does not.
TEST(Topo, RunsEndOnViasPadCentresAndWidthChanges) {
  PinBoard p;
  p.pad("A", 4, 10, PadShapeKind::Rect, 2, 1);
  p.via("A", 20, 10, 0.6);
  p.pad("A", 36, 10, PadShapeKind::Circle, 1, 1);
  p.track("A", {{4, 10}, {6, 10}, {12, 12}, {20, 10}}, 0.3);
  p.track("A", {{20, 10}, {28, 10}}, 0.3);
  p.track("A", {{28, 10}, {36, 10}}, 0.5);
  const std::vector<xr::Run> runs = buildRuns(p.b);
  ASSERT_EQ(runs.size(), 3u);
  EXPECT_EQ(runs[0].steps.size(), 3u) << "pad centre to the via, the lead inside the pad with it";
  EXPECT_EQ(runs[0].start(p.b), Point(PinBoard::at(4, 10)));
  EXPECT_EQ(runs[1].steps.size(), 1u);
  EXPECT_EQ(runs[2].width, mmToNm(0.5));
  // Two ends 0.5 um apart: one vertex glued, two exact.
  p.b.tracks[1].a = Point(PinBoard::at(6, 10) + Vec2{500, 0});
  EXPECT_EQ(buildRuns(p.b).size(), 3u);
  EXPECT_EQ(buildRuns(p.b, {.exact = true}).size(), 4u);
}

// A zipped section of a differential pair is one wire of the model, as wide as the pair (2w + gap), between
// two clasps: owners with three vertices across the pair, the conductors' ends (where the single wires of
// the two nets to their pads start) and the centre (where the pair's wire ends).
TEST(Topo, PairIsOneWireBetweenClasps) {
  PinBoard p = pairBoard();
  ASSERT_EQ(p.b.zips.size(), 1u);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  int pairWires = 0, clasps = 0, singlesAtClasps = 0;
  for (const topo::Wire& w : t.wires) {
    if (w.pair >= 0) {
      ++pairWires;
      EXPECT_EQ(w.width, mmToNm(0.8));
      EXPECT_EQ(w.widthMin, w.width) << "never narrowed";
      EXPECT_EQ(w.zip, 0);
      for (int e = 0; e < 2; ++e) {
        const topo::Owner& o = t.owners[w.end[e]];
        EXPECT_EQ(o.kind, topo::Owner::Kind::Clasp);
        EXPECT_EQ(t.mesh(w.layer)->verts[w.endVertex[e]].t, 0.0) << "at the clasp's centre";
      }
      EXPECT_FALSE(w.locked);
    } else {
      for (int e = 0; e < 2; ++e)
        if (t.owners[w.end[e]].kind == topo::Owner::Kind::Clasp) {
          ++singlesAtClasps;
          const topo::Vertex& v = t.mesh(w.layer)->verts[w.endVertex[e]];
          EXPECT_NE(v.t, 0.0) << "a single wire starts at a conductor's end";
          EXPECT_EQ(t.netAt(*t.mesh(w.layer), w.endVertex[e]), w.net) << "the end of its own net";
        }
    }
  }
  for (const topo::Owner& o : t.owners)
    if (o.kind == topo::Owner::Kind::Clasp) {
      ++clasps;
      EXPECT_EQ(o.net, p.net("P"));
      EXPECT_EQ(o.net2, p.net("N"));
      EXPECT_EQ(o.pair, 0);
      EXPECT_EQ(t.mesh(p.top)->ownerVerts[int(&o - t.owners.data())].size(), 3u);
      EXPECT_NEAR(o.axis.len(), mmToNm(0.25), 2000) << "half of w + gap";
    }
  EXPECT_EQ(pairWires, 1);
  EXPECT_EQ(clasps, 2);
  EXPECT_EQ(singlesAtClasps, 4);
  EXPECT_TRUE(t.violations.empty());
  EXPECT_TRUE(t.check().empty());
}

// F5 draws a pair's wire as its axis and two conductors offset either side of it (the positive on its side),
// as wide as the rule says, their ends meeting the single wires at the clasps exactly: no clearance violation,
// no short, every connection made.
TEST(Topo, PairDrawnAsTwoConductors) {
  PinBoard p = pairBoard();
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  ASSERT_EQ(p.b.zips.size(), 1u);
  const ZippedWire& z = p.b.zips[0];
  EXPECT_GE(z.axis.size(), 1u) << "the axis drawn";
  int cond[2] = {0, 0};
  for (const Track& t : p.b.tracks) {
    if (t.zip != 0) continue;
    EXPECT_EQ(t.width, mmToNm(0.3));
    EXPECT_TRUE(t.net == z.netP || t.net == z.netN);
    ++cond[t.net == z.netP];
  }
  EXPECT_GE(cond[0], 1) << "the negative conductor";
  EXPECT_GE(cond[1], 1) << "the positive conductor";
  // The conductors run at the offset either side of the axis, the pair's wire in the model as wide as both.
  for (const Track& t : p.b.tracks) {
    if (t.zip != 0) continue;
    for (Vec2 q : {t.a.v(), t.b.v()}) {
      double d = 1e18;
      for (const Track& a : z.axis) {
        const Polyline path = a.path();
        for (size_t i = 0; i + 1 < path.size(); ++i) d = std::min(d, distPointSegment(q, path[i], path[i + 1]));
      }
      EXPECT_NEAR(d, z.offset(), 3000) << "conductor point off the axis";
    }
  }
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u) << "the conductors meet the single wires at the clasps";
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Width), 0);
  for (const topo::Wire& w : f.t.wires)
    if (w.pair >= 0) EXPECT_EQ(int(w.tracks.size()), cond[0] + cond[1]) << "the conductors are the pair wire's tracks";
  // Drawn again: as long, as clean.
  const double length = p.length("P") + p.length("N");
  auto f2 = p.f5Model();
  ASSERT_TRUE(f2.res.drawn);
  EXPECT_NEAR(p.length("P") + p.length("N"), length, 0.05);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
}

// A via of another net in the pair's way: the pair bends round it as one, both conductors keep the clearance,
// and the clasps turn square to the pair's wire where it meets them.
TEST(Topo, PairBendsRoundAnotherNetAsOne) {
  PinBoard p = pairBoard();
  p.via("X", 20, 11.6, 0.6);  // 0.4 off the kink of the axis at (20, 12): inside the pair's room
  p.track("X", {{20, 11.6}, {20, 6}}, 0.3);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);
  const Vec2 via = PinBoard::at(20, 11.6);
  for (const Track& t : p.b.tracks) {
    if (t.net == p.net("X")) continue;
    for (Vec2 q : {t.a.v(), t.b.v()}) EXPECT_GE((q - via).len(), mmToNm(0.3 + 0.2 + 0.15) - 3000) << "conductor into the via's room";
  }
  const ZippedWire& z = p.b.zips[0];
  ASSERT_GE(z.axis.size(), 1u);
  for (const topo::Owner& o : f.t.owners) {
    if (o.kind != topo::Owner::Kind::Clasp) continue;
    const Track& piece = o.claspEnd ? z.axis.back() : z.axis.front();
    const Vec2 end = o.claspEnd ? piece.b.v() : piece.a.v();
    Vec2 dir = o.claspEnd ? piece.b.v() - (piece.mid ? piece.mid->v() : piece.a.v()) : (piece.mid ? piece.mid->v() : piece.b.v()) - piece.a.v();
    EXPECT_LT((end - o.c).len(), 3000) << "the axis ends at the clasp's centre";
    const double cosine = std::abs(dir.normalized().dot(o.axis.normalized()));
    EXPECT_LT(cosine, std::sin(3 * std::numbers::pi / 180)) << "the clasp square to the pair";
  }
}

// A pair is never narrowed (TopoR's widths of a pair change only by its rule): between two pads of another net
// with less room than the pair needs, the conductors keep their width and the edge is reported overflowing.
TEST(Topo, PairIsNeverNarrowed) {
  PinBoard p = pairBoard();
  // Two pads of X either side of the axis at x = 26 (y 11): 0.9 of room between their copper where the pair
  // needs 0.8 + 2 x 0.2.
  p.pad("X", 26, 10.5, PadShapeKind::Circle, 0.5, 0.5);
  p.pad("X", 26, 11.9, PadShapeKind::Circle, 0.5, 0.5);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  for (const Track& t : p.b.tracks) {
    if (t.zip >= 0) EXPECT_EQ(t.width, mmToNm(0.3)) << "a conductor narrowed";
    EXPECT_FALSE(t.isArc() && t.a == t.b) << "an arc of no length";
  }
  bool overflow = false;
  for (const topo::Violation& v : f.res.violations) overflow |= v.kind == topo::Violation::Kind::Overflow;
  EXPECT_TRUE(overflow || p.drcOf(DrcViolation::Type::Clearance) > 0) << "the pair through a gap too narrow, and nothing said";
}

// F7 moves a clasp as a branch point, by the pull of the pair's wire and its two single wires: the pads of P
// and N at the left end stand far below the section, the clasp goes down towards them, and the drawing stays
// clean and connected. F6 re-lays the pair as one wire.
TEST(Topo, ClaspMovesWithF7) {
  PinBoard p;
  p.b.netClasses[0].clearance = mmToNm(0.2);
  p.pad("P", 4, 4, PadShapeKind::Circle, 1, 1);
  p.pad("N", 6, 4, PadShapeKind::Circle, 1, 1);
  p.pad("P", 36, 11, PadShapeKind::Circle, 1, 1);
  p.pad("N", 36, 9, PadShapeKind::Circle, 1, 1);
  p.pair("P", "N", 0.3, 0.2);
  p.zip("P", "N", {{8, 10}, {32, 10}});
  topo::Topology::assignIds(p.b);
  Vec2 before;
  {
    topo::Topology t;
    t.build(p.b);
    for (const topo::Owner& o : t.owners)
      if (o.kind == topo::Owner::Kind::Clasp && o.claspEnd == 0) before = o.c;
  }
  auto r = p.f7();
  ASSERT_TRUE(r.drawn);
  EXPECT_GE(r.junctionMoves, 1) << "the clasp moved";
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  Vec2 after;
  for (const topo::Owner& o : t.owners)
    if (o.kind == topo::Owner::Kind::Clasp && o.claspEnd == 0) after = o.c;
  EXPECT_LT(after.y, before.y - 500000) << "towards the pads below (board y down is +y up here)";
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
  for (const Track& tr : p.b.tracks)
    if (tr.zip >= 0) EXPECT_EQ(tr.width, mmToNm(0.3));
  // F6 after: the pair one wire still, the drawing as clean.
  auto r6 = p.f6();
  ASSERT_TRUE(r6.drawn);
  EXPECT_EQ(p.b.zips.size(), 1u);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
}

// The editing of a section: two runs of the pair's nets zipped (the axis between them, the conductors from it,
// nothing moves when the runs lie at the rule already), swapped where the single wires cross at both clasps
// (each conductor takes the other net, the singles go over: no short after), unzipped (the conductors stay).
TEST(Topo, ZipSwapUnzip) {
  PinBoard p;
  p.b.netClasses[0].clearance = mmToNm(0.2);
  p.pad("P", 4, 9, PadShapeKind::Circle, 1, 1);
  p.pad("N", 4, 11, PadShapeKind::Circle, 1, 1);
  p.pad("P", 36, 9, PadShapeKind::Circle, 1, 1);
  p.pad("N", 36, 11, PadShapeKind::Circle, 1, 1);
  p.pair("P", "N", 0.3, 0.2);
  p.track("P", {{4, 9}, {8, 10.25}, {32, 10.25}, {36, 9}}, 0.3);
  p.track("N", {{4, 11}, {8, 9.75}, {32, 9.75}, {36, 11}}, 0.3);
  std::vector<int> sel;
  for (int i = 0; i < int(p.b.tracks.size()); ++i)
    if (p.b.tracks[i].a.v().x == PinBoard::at(8, 0).x) sel.push_back(i);
  ASSERT_EQ(sel.size(), 2u);
  EXPECT_FALSE(zipTracks(p.b, {sel[0]}).has_value()) << "one net only";
  auto z = zipTracks(p.b, sel);
  ASSERT_TRUE(z.has_value()) << z.error();
  ASSERT_EQ(p.b.zips.size(), 1u);
  const ZippedWire& zw = p.b.zips[0];
  for (const Track& t : zw.axis) {
    EXPECT_NEAR(t.a.v().y, PinBoard::at(0, 10).y, 1000);
    EXPECT_NEAR(t.b.v().y, PinBoard::at(0, 10).y, 1000);
  }
  int conductors = 0;
  for (const Track& t : p.b.tracks) conductors += t.zip == 0;
  EXPECT_EQ(conductors, 2);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_GT(p.drcOf(DrcViolation::Type::Short), 0) << "the singles cross at the clasps";
  swapZipNets(p.b, 0);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0) << "swapped, the singles no longer cross";
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
  for (const Track& t : p.b.tracks)
    if (t.zip == 0 && t.net == p.net("P")) EXPECT_NEAR(t.a.v().y, PinBoard::at(0, 9.75).y, 1000) << "P below now";
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
  // Moved whole, the section goes with its conductors.
  {
    edit::Fragment fr;
    for (int i = 0; i < int(p.b.tracks.size()); ++i) fr.tracks.push_back(i);
    edit::Motion m;
    m.shift = PinBoard::at(0, 1);
    const Vec2 a0 = p.b.zips[0].axis.front().a.v();
    ASSERT_TRUE(edit::move(p.b, fr, m));
    EXPECT_EQ(p.b.zips[0].axis.front().a.v(), a0 + PinBoard::at(0, 1));
  }
  unzip(p.b, 0);
  EXPECT_TRUE(p.b.zips.empty());
  for (const Track& t : p.b.tracks) EXPECT_EQ(t.zip, -1);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
}

namespace {

// How far each conductor piece's middle lies from the section's axis (the nearest piece of it), the worst
// miss of the offset; -1 when a conductor is missing.
double axisMiss(const Board& b, int zip) {
  const ZippedWire& z = b.zips[size_t(zip)];
  double worst = 0;
  int n = 0;
  for (const Track& t : b.tracks) {
    if (t.zip != zip) continue;
    ++n;
    const Vec2 m = t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
    double d = 1e300;
    for (const Track& a : z.axis) {
      if (a.mid) {
        const ArcGeom arc = ArcGeom::fromThreePoints(a.a.v(), a.mid->v(), a.b.v());
        d = std::min(d, std::abs((m - arc.center).len() - arc.radius));
      } else d = std::min(d, distPointSegment(m, a.a.v(), a.b.v()));
    }
    worst = std::max(worst, std::abs(d - double(z.offset())));
  }
  return n ? worst : -1;
}

}  // namespace

// The pair edited by its axis: a joint of the axis moved, a straight piece bent, an end (a clasp) moved; each
// time the conductors are made again at the offset from the axis, in place (the tracks keep their indices),
// and the single wires at a moved clasp follow it. A fixed section refuses.
TEST(Topo, AxisEditRebuildsTheConductors) {
  PinBoard p = pairBoard();
  auto conductors = [&] {
    std::vector<int> c;
    for (int i = 0; i < int(p.b.tracks.size()); ++i)
      if (p.b.tracks[i].zip == 0) c.push_back(i);
    return c;
  };
  const std::vector<int> before = conductors();
  ASSERT_EQ(before.size(), 4u);
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  ASSERT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  ASSERT_EQ(p.violations(), 0);

  ASSERT_TRUE(moveAxisVertex(p.b, 0, 1, PinBoard::at(20, 13)));
  EXPECT_EQ(p.b.zips[0].axis[0].b.v(), PinBoard::at(20, 13));
  EXPECT_EQ(conductors(), before) << "rewritten in place";
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);

  ASSERT_TRUE(bendAxis(p.b, 0, 1, PinBoard::at(26, 12.5)));
  EXPECT_EQ(p.b.zips[0].axis.size(), 3u);
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);

  // The start clasp moved: the single wires from the pads go to the conductors' new ends.
  ASSERT_TRUE(moveAxisVertex(p.b, 0, 0, PinBoard::at(10, 10)));
  EXPECT_EQ(p.b.zips[0].axis.front().a.v(), PinBoard::at(10, 10));
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);

  ASSERT_TRUE(moveAxisPiece(p.b, 0, 0, PinBoard::at(0, -0.5)));
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0);

  // Where a clasp turned with the axis the single wires leave it at an angle and come inside the rule of the
  // other net's end: F5 lays them again (as TopoR after a change by hand).
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);

  const auto axis = p.b.zips[0].axis;
  p.b.zips[0].fixed = true;
  EXPECT_FALSE(moveAxisVertex(p.b, 0, 1, PinBoard::at(20, 14)));
  EXPECT_FALSE(bendAxis(p.b, 0, 0, PinBoard::at(14, 13)));
  EXPECT_EQ(p.b.zips[0].axis.size(), axis.size());
  EXPECT_EQ(p.b.zips[0].axis[0].b, axis[0].b);
}

// A section whose conductors are all erased goes with them; one whose conductors all change the layer goes
// to it, the conductors made again by the pair's rule there, the wire still connected.
TEST(Topo, ErasingAndChangingLayerOfASection) {
  {
    PinBoard p = pairBoard();
    edit::Fragment f;
    for (int i = 0; i < int(p.b.tracks.size()); ++i)
      if (p.b.tracks[i].zip == 0) f.tracks.push_back(i);
    edit::erase(p.b, f);
    EXPECT_TRUE(p.b.zips.empty());
    for (const Track& t : p.b.tracks) EXPECT_EQ(t.zip, -1);
  }
  PinBoard p;
  p.twoLayers();
  p.b.netClasses[0].clearance = mmToNm(0.2);
  p.pad("P", 4, 11, PadShapeKind::Circle, 1, 1);
  p.pad("N", 4, 9, PadShapeKind::Circle, 1, 1);
  p.pad("P", 36, 11, PadShapeKind::Circle, 1, 1);
  p.pad("N", 36, 9, PadShapeKind::Circle, 1, 1);
  for (Pad& pd : p.b.pads) pd.copper = (LayerMask(1) << p.top) | (LayerMask(1) << p.bottom);
  p.pair("P", "N", 0.3, 0.2);
  ASSERT_EQ(p.zip("P", "N", {{8, 10}, {20, 12}, {32, 10}}), 0);
  for (auto& r : p.b.hispeed.impedances[0].rules)
    if (r.layer == "Bottom") r.gap = mmToNm(0.3);
  std::vector<int> all;
  for (int i = 0; i < int(p.b.tracks.size()); ++i) all.push_back(i);
  edit::changeLayer(p.b, all, p.bottom);
  ASSERT_EQ(p.b.zips.size(), 1u);
  EXPECT_EQ(p.b.zips[0].layer, p.bottom);
  EXPECT_EQ(p.b.zips[0].gap, mmToNm(0.3));
  for (const Track& t : p.b.zips[0].axis) EXPECT_EQ(t.layer, p.bottom);
  for (const Track& t : p.b.tracks) {
    EXPECT_EQ(t.layer, p.bottom);
  }
  EXPECT_LT(axisMiss(p.b, 0), 2000);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
}

// The clasp's copper is the pair wire's own and each single wire's own at its end: the capacity of an edge at
// the clasp takes no clearance from it for them, and does for a wire of another net.
TEST(Topo, ClaspIsOwnToItsThreeWires) {
  PinBoard p = pairBoard();
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  const topo::LayerMesh& m = *t.mesh(p.top);
  int pairWire = -1, xWire = -1;
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    if (t.wires[wi].pair >= 0) pairWire = wi;
    if (t.wires[wi].net == p.net("X")) xWire = wi;
  }
  ASSERT_GE(pairWire, 0);
  int claspVertex = -1;
  for (int v = 0; v < int(m.verts.size()); ++v)
    if (t.owners[m.verts[v].owner].kind == topo::Owner::Kind::Clasp && m.verts[v].t < 0) claspVertex = v;
  ASSERT_GE(claspVertex, 0);
  EXPECT_TRUE(t.own(m, claspVertex, t.wires[pairWire]));
  EXPECT_EQ(t.netAt(m, claspVertex), p.net("N"));
  for (const topo::Wire& w : t.wires)
    if (w.pair < 0 && w.net == p.net("N") && (w.endVertex[0] == claspVertex || w.endVertex[1] == claspVertex)) EXPECT_TRUE(t.own(m, claspVertex, w));
  for (const topo::Wire& w : t.wires)
    if (w.pair < 0 && w.net == p.net("P")) EXPECT_FALSE(t.own(m, claspVertex, w)) << "the N end is not P's";
  if (xWire >= 0) EXPECT_FALSE(t.own(m, claspVertex, t.wires[xWire]));
}

// The sidecar keeps the clasps and the pair wires.
TEST(Topo, SidecarKeepsClasps) {
  PinBoard p = pairBoard();
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  const std::string path = (std::filesystem::temp_directory_path() / "xr_clasps.xrtopo").string();
  ASSERT_TRUE(topo::saveTopology(t, p.b, path));
  auto back = topo::loadTopology(p.b, path);
  ASSERT_TRUE(back) << back.error();
  ASSERT_EQ(back->owners.size(), t.owners.size());
  for (size_t i = 0; i < t.owners.size(); ++i) {
    EXPECT_EQ(back->owners[i].kind, t.owners[i].kind);
    EXPECT_EQ(back->owners[i].net2, t.owners[i].net2);
    EXPECT_EQ(back->owners[i].pair, t.owners[i].pair);
    EXPECT_EQ(back->owners[i].zip, t.owners[i].zip);
    EXPECT_EQ(back->owners[i].claspEnd, t.owners[i].claspEnd);
  }
  ASSERT_EQ(back->wires.size(), t.wires.size());
  for (size_t i = 0; i < t.wires.size(); ++i) {
    EXPECT_EQ(back->wires[i].pair, t.wires[i].pair);
    EXPECT_EQ(back->wires[i].zip, t.wires[i].zip);
  }
  std::filesystem::remove(path);
}

// A wire keeps no clearance from a routing keepout: its copper may touch the keepout's boundary (TopoR has
// no rule for the distance, only the error of a wire across). Between a pad's edge and a keepout's wall
// 0.6 mm apart a 0.3 mm wire with the clearance 0.2 needs 0.5: it fits, its centre line from 9.9 to 10.0.
// With the wire's own clearance kept from the wall it needed 0.7 and the edge overflowed.
TEST(Topo, KeepoutClearanceIsZero) {
  PinBoard p;
  p.pad("N", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N", 35, 10, PadShapeKind::Circle, 1, 1);
  p.pad("M", 20, 9.3, PadShapeKind::Rect, 16, 0.5);  // its top edge at y = 9.55
  p.keepout({{12, 10.15}, {28, 10.15}, {28, 15}, {12, 15}});  // the wall at y = 10.15
  p.track("N", {{5, 10}, {35, 10}}, 0.3);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(f.res.stats.overflowEdges, 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 0);
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
  const Vec2 wall0 = PinBoard::at(12, 10.15), wall1 = PinBoard::at(28, 10.15);
  EXPECT_GE(p.centreLineTo("N", wall0, wall1), 0.15 - 0.001) << "half the width from the wall";
  for (const Track& t : p.b.tracks) {
    if (p.b.nets[t.net].name != "N") continue;
    for (Vec2 q : t.path()) {
      if (q.x < PinBoard::at(14, 0).x || q.x > PinBoard::at(26, 0).x) continue;
      EXPECT_GE(q.y, PinBoard::at(0, 9.9).y - 1000) << "the pad's rule";
      EXPECT_LE(q.y, PinBoard::at(0, 10.0).y + 1000) << "the wall";
    }
  }
}

namespace {

// After F5 on the model: the wire N drawn straight through the obstacle between its pads at (5,10) and
// (35,10) went round it; `detour`: the longest way round allowed, in mm over the straight 30.
void expectReLaidRound(PinBoard& p, double detour, const char* how) {
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn) << how;
  for (const topo::Violation& v : f.res.violations)
    EXPECT_NE(v.kind, topo::Violation::Kind::Blocked) << how << ": no way round found";
  for (const topo::Violation& v : f.t.violations)
    EXPECT_NE(v.kind, topo::Violation::Kind::OutsideBoard) << how << ": the mesh does not hold it";
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 0) << how;
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Edge), 0) << how;
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Short), 0) << how;
  EXPECT_GT(p.length("N"), 30.1) << how << ": still straight through";
  EXPECT_LT(p.length("N"), 30 + detour) << how << ": the long way round";
  // The model's wire crosses no edge of a blocked triangle.
  for (const topo::Wire& w : f.t.wires) {
    const topo::LayerMesh& m = *f.t.mesh(w.layer);
    for (int cid : w.cross)
      for (int ti : m.edges[f.t.crossings[cid].edge].t)
        if (ti >= 0) EXPECT_FALSE(m.tris[ti].blocked) << how;
  }
}

}  // namespace

// A wire drawn through a keepout area is laid round it by F5 on the model, the shorter way (TopoR leaves
// the error 5031 and runs no automatic procedure until the wire is moved out by hand). The keepout is
// 4 x 6 mm across the wire, from y 7 to 13: round its lower side is the shorter way, under 2 x 3.2 extra.
TEST(Topo, WireInsideAKeepoutIsReLaidRound) {
  PinBoard p;
  p.pad("N", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N", 35, 10, PadShapeKind::Circle, 1, 1);
  p.track("N", {{5, 10}, {35, 10}}, 0.3);
  p.keepout({{18, 7}, {22, 7}, {22, 13}, {18, 13}});
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 1) << "drawn through";
  expectReLaidRound(p, 2 * 3.2 + 1, "area");
}

// The same across a keepout line (a barrier from y 5 to 15): round one of its ends.
TEST(Topo, WireAcrossAKeepoutLineIsReLaid) {
  PinBoard p;
  p.pad("N", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N", 35, 10, PadShapeKind::Circle, 1, 1);
  p.track("N", {{5, 10}, {35, 10}}, 0.3);
  p.keepoutLine({20, 5}, {20, 15});
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 1) << "drawn across";
  expectReLaidRound(p, 2 * 5.2 + 1, "line");
}

// And across a cutout in the board: a keepout with the clearance to the board edge, nothing more.
TEST(Topo, WireThroughACutoutIsReLaid) {
  PinBoard p;
  p.pad("N", 5, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N", 35, 10, PadShapeKind::Circle, 1, 1);
  p.track("N", {{5, 10}, {35, 10}}, 0.3);
  p.cutout({{18, 7}, {22, 7}, {22, 13}, {18, 13}});
  EXPECT_GE(p.drcOf(DrcViolation::Type::Edge), 1) << "drawn through";
  expectReLaidRound(p, 2 * 3.2 + 2 * 0.25 + 1, "cutout");
  const Vec2 c[4] = {PinBoard::at(18, 7), PinBoard::at(22, 7), PinBoard::at(22, 13), PinBoard::at(18, 13)};
  for (int i = 0; i < 4; ++i) EXPECT_GE(p.centreLineTo("N", c[i], c[(i + 1) % 4]), 0.15 + 0.25 - 0.005) << "side " << i;
}

// A keepout for vias holds a via off itself (touching allowed, as the DRC takes it): F7 does not move a via
// into it and pushes one out that stands inside. Net N from a pad on Top through a via to a pad on Bottom,
// the via first beside the keepout, then inside it.
TEST(Topo, ViaStaysOutOfAViaKeepout) {
  for (double y0 : {13.0, 10.7}) {
    PinBoard p;
    p.twoLayers();
    p.pad("N", 5, 10, PadShapeKind::Circle, 1, 1);
    p.pad("N", 35, 10, PadShapeKind::Circle, 1, 1);
    p.b.pads.back().copper = LayerMask(1) << p.bottom;
    p.via("N", 20, y0, 0.6);
    p.b.vias.back().layers = (LayerMask(1) << p.top) | (LayerMask(1) << p.bottom);
    p.track("N", {{5, 10}, {20, y0}}, 0.3);
    p.track("N", {{20, y0}, {35, 10}}, 0.3);
    p.b.tracks.back().layer = p.bottom;
    p.keepout({{15, 9}, {25, 9}, {25, 12}, {15, 12}}, /*wires*/ false, /*vias*/ true);
    const bool inside = y0 < 12;
    EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), inside ? 1 : 0) << y0;
    auto res = p.f7();
    ASSERT_TRUE(res.drawn) << y0;
    ASSERT_EQ(p.b.vias.size(), 1u);
    const Vec2 v = p.b.vias.front().pos.v();
    const Shape bar = Shape::polygon({PinBoard::at(15, 9), PinBoard::at(25, 9), PinBoard::at(25, 12), PinBoard::at(15, 12)});
    if (!inside) {
      EXPECT_GE(bar.distance(v), 0.3 * kNmPerMm - 1000) << "F7 moved the via into the keepout: " << v.x / 1e6 << "," << v.y / 1e6;
      EXPECT_LT(v.y, PinBoard::at(0, 13).y - 100000) << "the via was pulled towards the straight line between the pads";
    } else {
      EXPECT_GE(bar.distance(v), 0.3 * kNmPerMm - 1000) << "the via stayed inside: " << v.x / 1e6 << "," << v.y / 1e6;
    }
    EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 0) << y0;
  }
}

namespace {

// A board with a zone of G over (10,5)-(30,15): N wholly inside it with a bend, N2 from outside into it.
PinBoard zoneBoard(bool poured) {
  PinBoard p;
  p.pad("N", 12, 8, PadShapeKind::Circle, 1, 1);
  p.pad("N", 28, 8, PadShapeKind::Circle, 1, 1);
  p.track("N", {{12, 8}, {20, 12}, {28, 8}}, 0.3);
  p.pad("N2", 2, 10, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 20, 13.5, PadShapeKind::Circle, 1, 1);
  p.track("N2", {{2, 10}, {20, 13.5}}, 0.3);
  p.zone("G", {{10, 5}, {30, 5}, {30, 15}, {10, 15}}, poured);
  return p;
}

}  // namespace

// In a poured zone nothing is touched (TopoR): the tracks lying wholly inside its outline are locked
// whatever their net, so are those of another net reaching into it; F5 and F6 leave them as they are.
TEST(Topo, TracksInsideAPouredZoneAreLocked) {
  PinBoard p = zoneBoard(true);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  int zones = 0;
  for (const topo::Owner& o : t.owners) zones += o.kind == topo::Owner::Kind::Zone;
  EXPECT_EQ(zones, 1);
  ASSERT_EQ(t.wires.size(), 2u);
  for (const topo::Wire& w : t.wires) {
    EXPECT_TRUE(w.locked) << p.b.nets[w.net].name;
    EXPECT_GE(w.zone, 0) << p.b.nets[w.net].name;
  }
  EXPECT_TRUE(t.violations.empty());
  const size_t tracks = p.b.tracks.size();
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(p.b.tracks.size(), tracks);
  EXPECT_TRUE(p.vertexAt(20, 12)) << "the bend of N stays";
  auto r = p.f6();
  EXPECT_EQ(p.b.tracks.size(), tracks);
  EXPECT_TRUE(p.vertexAt(20, 12)) << "F6 left the bend";
  DrcOptions d;
  d.unconnected = false;
  d.widths = false;
  for (const DrcViolation& v : runDrc(p.b, d)) ADD_FAILURE() << v.message << " at " << v.pos.x / 1e6 << "," << v.pos.y / 1e6;
}

// An unpoured zone is nothing to the model: the same tracks are free, F6 straightens N.
TEST(Topo, UnpouredZoneIsNothing) {
  PinBoard p = zoneBoard(false);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  for (const topo::Owner& o : t.owners) EXPECT_NE(o.kind, topo::Owner::Kind::Zone);
  for (const topo::Wire& w : t.wires) EXPECT_FALSE(w.locked) << p.b.nets[w.net].name;
  const double bent = p.length("N");
  p.f6();
  EXPECT_LT(p.length("N"), bent - 1) << "F6 straightened N";
  EXPECT_FALSE(p.vertexAt(20, 12));
}

// A wire of the zone's own net lying wholly in its pour is copper twice over: F6 takes it out, where the
// pour connects what it did. With the fill in two halves (the wire bridging them) it stays; so with the
// option off.
TEST(Topo, OwnNetTrackInsideTheFillIsRemoved) {
  auto board = [] {
    PinBoard p;
    p.pad("G", 14, 10, PadShapeKind::Circle, 1, 1);
    p.pad("G", 26, 10, PadShapeKind::Circle, 1, 1);
    p.track("G", {{14, 10}, {26, 10}}, 0.3);
    p.zone("G", {{10, 5}, {30, 5}, {30, 15}, {10, 15}}, false);
    return p;
  };
  auto gTracks = [](const PinBoard& p) {
    int n = 0;
    for (const Track& t : p.b.tracks) n += p.b.nets[t.net].name == "G";
    return n;
  };
  {
    PinBoard p = board();
    p.b.zones[0].filled.push_back(p.b.zones[0].outline);  // one solid piece (the pads are of its net: no relief)
    ASSERT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
    auto r = p.f6();
    EXPECT_EQ(r.zoneTracksRemoved, 1);
    EXPECT_EQ(gTracks(p), 0);
    EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u) << "the pour connects the pads";
  }
  {
    PinBoard p = board();
    p.b.zones[0].filled.push_back({PinBoard::at(10, 5), PinBoard::at(19, 5), PinBoard::at(19, 15), PinBoard::at(10, 15)});
    p.b.zones[0].filled.push_back({PinBoard::at(21, 5), PinBoard::at(30, 5), PinBoard::at(30, 15), PinBoard::at(21, 15)});
    auto r = p.f6();
    EXPECT_EQ(r.zoneTracksRemoved, 0) << "the wire bridges the two halves";
    EXPECT_EQ(gTracks(p), 1);
  }
  {
    PinBoard p = board();
    p.b.zones[0].filled.push_back(p.b.zones[0].outline);
    topo::RefineModelOptions o;
    o.zoneTracks = false;
    auto r = p.f6(o);
    EXPECT_EQ(r.zoneTracksRemoved, 0);
    EXPECT_EQ(gTracks(p), 1);
  }
}

// From outside a poured zone is a pad of its net: a wire of another net along its edge keeps the zone's
// clearance (0.5 here, above the net's 0.2) and is not locked.
TEST(Topo, ForeignWireKeepsTheZoneClearance) {
  PinBoard p;
  p.pad("N", 5, 12.3, PadShapeKind::Circle, 1, 1);
  p.pad("N", 35, 12.3, PadShapeKind::Circle, 1, 1);
  p.track("N", {{5, 12.3}, {35, 12.3}}, 0.3);
  p.zone("G", {{10, 5}, {30, 5}, {30, 12}, {10, 12}}, true, 0.5);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  for (const topo::Wire& w : f.t.wires) EXPECT_FALSE(w.locked);
  const Vec2 a = PinBoard::at(10, 12), c = PinBoard::at(30, 12);
  EXPECT_GE(p.centreLineTo("N", a, c), 0.5 + 0.15 - 0.003) << "the zone's clearance plus half the width";
  EXPECT_EQ(p.drcOf(DrcViolation::Type::Clearance), 0);
}

// A round wall is gone round as one arc, as a round pad is, not as a chord for every point of its rim: a
// round keepout, and the rounded corner of a polygon keepout (its arc's circle lies within the polygon).
// The wire of N, drawn straight through, comes out with one arc centred on the circle at half its width
// off it, and no short piece beside it.
TEST(Topo, RoundWallsAreGoneRoundAsOneArc) {
  struct Case {
    const char* how;
    Vec2 centre;
    double r;
  };
  for (int which = 0; which < 2; ++which) {
    PinBoard p;
    // Straight through the circle; diagonally through the rounded corner.
    const double y0 = which == 0 ? 10 : 16, y1 = which == 0 ? 10 : 5;
    p.pad("N", 5, y0, PadShapeKind::Circle, 1, 1);
    p.pad("N", 35, y1, PadShapeKind::Circle, 1, 1);
    p.track("N", {{5, y0}, {35, y1}}, 0.3);
    Keepout k;
    Graphic g;
    Case c;
    if (which == 0) {
      g.kind = GraphicKind::Circle;
      g.a = PinBoard::at(20, 11.5);
      g.b = g.a + Vec2{2 * kNmPerMm, 0};
      c = {"circle", g.a, 2 * kNmPerMm};
    } else {
      // A box from (17,10.3) to (23,16) with its lower left corner rounded by a quarter arc of radius 2:
      // the corner is where the wire, pushed down, goes round.
      g.kind = GraphicKind::Poly;
      g.pts = {PinBoard::at(19, 10.3), PinBoard::at(23, 10.3), PinBoard::at(23, 16), PinBoard::at(17, 16), PinBoard::at(17, 12.3)};
      g.arcs = {0, 0, 0, 0, -90};  // the side from (17,12.3) back to (19,10.3) turns by 90 degrees clockwise
      c = {"rounded corner", PinBoard::at(19, 12.3), 2 * kNmPerMm};
    }
    k.shape.push_back(g);
    p.b.keepouts.push_back(k);
    auto f = p.f5Model();
    ASSERT_TRUE(f.res.drawn) << c.how;
    EXPECT_EQ(p.drcOf(DrcViolation::Type::Keepout), 0) << c.how;
    int arcsOnIt = 0, piecesNear = 0;
    for (const Track& t : p.b.tracks) {
      if (p.b.nets[t.net].name != "N") continue;
      const bool near = std::min((t.a.v() - c.centre).len(), (t.b.v() - c.centre).len()) < c.r + 0.5 * kNmPerMm;
      if (t.isArc()) {
        const ArcGeom arc = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
        if ((arc.center - c.centre).len() < 2000 && std::abs(arc.radius - (c.r + 0.15 * kNmPerMm)) < 3000) ++arcsOnIt;
      } else if (near && t.length() < 0.5 * kNmPerMm) ++piecesNear;
    }
    EXPECT_EQ(arcsOnIt, 1) << c.how << ": one arc on the wall's circle";
    EXPECT_EQ(piecesNear, 0) << c.how << ": no short pieces round the wall";
  }
}

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
  // Drawn out of the end x = 12.8 at y = 10.35; F5 aims the exit where the wire goes (TopoR: «v towards where the
  // wire goes»): the straight way from the centre to the round pad passes the end at y = 10 + 2.8 * 6 / 20 = 10.84.
  p.track("A", {{10, 10}, {14, 10.5}, {30, 16}}, 0.3);
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
  EXPECT_TRUE(p.vertexAt(12.65, 10.84)) << "the inner point: " << s.text();
  EXPECT_TRUE(p.vertexAt(12.8, 10.84)) << "the point of the edge";
  EXPECT_EQ(s.inRect, 2) << "centre - inner point - edge: " << s.text();
  EXPECT_EQ(p.violations(), 0);
  const size_t tracks = p.b.tracks.size();
  const double length = p.b.tracksLength();
  f5();
  EXPECT_EQ(p.b.tracks.size(), tracks);
  EXPECT_NEAR(p.b.tracksLength(), length, 2000);
  EXPECT_TRUE(p.vertexAt(12.65, 10.84));
}

// A wire between two pins next to each other, drawn aslant inside both (it once went to a branch point beside them,
// which was made one with the lower pin): F5 lays it straight from centre to centre. The exit a wire took from its
// pad was kept as drawn — pinned —, so it never straightened: «как у металлизации запрет на изменение».
TEST(Topo, AWireBetweenTwoPinsIsLaidStraight) {
  PinBoard p;
  p.pad("A", 10, 10, PadShapeKind::Rect, 1.5, 0.76);
  p.pad("A", 10, 11.27, PadShapeKind::Rect, 1.5, 0.76);
  p.pad("A", 14, 11.27, PadShapeKind::Circle, 1, 1);
  p.track("A", {{10, 10}, {10.48, 10.38}, {10.12, 10.89}, {10, 11.27}}, 0.25);
  p.track("A", {{10, 11.27}, {14, 11.27}}, 0.25);
  const double drawn = p.b.tracksLength();
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  ASSERT_TRUE(topo::runF5Model(p.b, t).drawn);
  double off = 0;
  for (const Track& tr : p.b.tracks)
    for (Vec2 q : {tr.a.v(), tr.b.v()})
      if (q.y < PinBoard::at(0, 11.27).y - 1000) off = std::max(off, std::abs(q.x - PinBoard::at(10, 0).x));
  EXPECT_LT(off, 0.01 * kNmPerMm) << "the wire between the two pins runs down the line of their centres";
  EXPECT_LT(p.b.tracksLength(), drawn - 0.15 * kNmPerMm);
  EXPECT_NEAR(p.b.tracksLength(), (1.27 + 4.0) * kNmPerMm, 0.02 * kNmPerMm);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_EQ(p.violations(), 0);
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
  r::sort(dirs);
  std::vector<double> out;
  for (size_t i = 0; i < dirs.size(); ++i) {
    double d = dirs[(i + 1) % dirs.size()] - dirs[i];
    if (d <= 0) d += 2 * std::numbers::pi;
    out.push_back(d * 180 / std::numbers::pi);
  }
  r::sort(out);
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

// PinBoard with a second copper layer: through pads and vias, tracks on either layer.
struct TwoLayerBoard : PinBoard {
  LayerId bottom = 0;
  TwoLayerBoard() {
    bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    b.layers[bottom].copperIndex = 1;
  }
  LayerMask both() const { return (LayerMask(1) << top) | (LayerMask(1) << bottom); }
  void throughPad(const std::string& n, double x, double y, double d) {
    pad(n, x, y, PadShapeKind::Circle, d, d);
    b.pads.back().copper = both();
  }
  void bottomPad(const std::string& n, double x, double y, double d) {
    pad(n, x, y, PadShapeKind::Circle, d, d);
    b.pads.back().copper = LayerMask(1) << bottom;
  }
  void throughVia(const std::string& n, double x, double y, double d) {
    via(n, x, y, d);
    b.vias.back().layers = both();
  }
  void trackOn(LayerId l, const std::string& n, std::initializer_list<std::pair<double, double>> pts, double width) {
    const size_t from = b.tracks.size();
    track(n, pts, width);
    for (size_t i = from; i < b.tracks.size(); ++i) b.tracks[i].layer = l;
  }
  double lengthOn(LayerId l, const std::string& n) const {
    double len = 0;
    for (const Track& t : b.tracks)
      if (t.layer == l && b.nets[t.net].name == n) len += t.length();
    return len / kNmPerMm;
  }
  topo::RefineModelResult f6(const topo::RefineModelOptions& o = {}) {
    topo::Topology::assignIds(b);
    model = {};
    model.build(b);
    return topo::refineModel(b, model, o);
  }
  topo::Topology model;
};

// The local via minimisation (Luzin, Popov, Popov, NTV ITMO 2013 no. 6) as TopoR's F6 does it on Arcs_master's
// SD3: a via next to a through pin. The pin at (10, 10), a wire on Top to the via at (13, 10), on Bottom to the
// via at (17, 10), on Top to the pad at (30, 10); a wire of another net crosses on Top between the two vias and
// has no way round the row, so the pair cannot go. The first via can: its Bottom wire is led on to the pin,
// which is copper there too.
TEST(Topo, ViaNextToAThroughPadIsRemoved) {
  auto board = [](TwoLayerBoard& p) {
    p.throughPad("S", 10, 10, 1.2);
    p.pad("S", 30, 10, PadShapeKind::Circle, 1, 1);
    p.pad("X", 15, 6, PadShapeKind::Circle, 1, 1);
    p.pad("X", 15, 14, PadShapeKind::Circle, 1, 1);
    p.throughVia("S", 13, 10, 1.0);
    p.throughVia("S", 17, 10, 1.0);
    p.trackOn(p.top, "S", {{10, 10}, {13, 10}}, 0.3);
    p.trackOn(p.bottom, "S", {{13, 10}, {17, 10}}, 0.3);
    p.trackOn(p.top, "S", {{17, 10}, {30, 10}}, 0.3);
    p.trackOn(p.top, "X", {{15, 6}, {15, 14}}, 0.3);
  };
  {
    TwoLayerBoard p;
    board(p);
    EXPECT_EQ(p.violations(), 0);
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 1);
    ASSERT_EQ(p.b.vias.size(), 1u);
    EXPECT_NEAR(p.b.vias[0].pos.v().x / kNmPerMm, 17.0, 0.01);
    EXPECT_NEAR(p.lengthOn(p.bottom, "S"), 7.0, 0.05);  // from the pin now
    EXPECT_NEAR(p.lengthOn(p.top, "S"), 13.0, 0.05);
    EXPECT_NEAR(p.length("X"), 8.0, 0.05);
    EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
    expectSoundModel(p.model);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    TwoLayerBoard p;
    board(p);
    topo::RefineModelOptions off;
    off.vias = false;
    auto res = p.f6(off);
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 0);
    EXPECT_EQ(p.b.vias.size(), 2u);
  }
}

// A jump with nothing left to jump over: pad, via, 4 mm on Bottom, via, pad, and nothing on Top between the
// vias. The Bottom wire is laid on Top, both vias go, the net is one wire on Top.
TEST(Topo, ViaPairWithNothingToJumpIsRemoved) {
  TwoLayerBoard p;
  p.pad("S", 8, 10, PadShapeKind::Circle, 1, 1);
  p.pad("S", 30, 10, PadShapeKind::Circle, 1, 1);
  p.throughVia("S", 13, 10, 1.0);
  p.throughVia("S", 17, 10, 1.0);
  p.trackOn(p.top, "S", {{8, 10}, {13, 10}}, 0.3);
  p.trackOn(p.bottom, "S", {{13, 10}, {17, 10}}, 0.3);
  p.trackOn(p.top, "S", {{17, 10}, {30, 10}}, 0.3);
  auto res = p.f6();
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.viasRemoved, 2);
  EXPECT_TRUE(p.b.vias.empty());
  EXPECT_NEAR(p.lengthOn(p.top, "S"), 22.0, 0.05);
  EXPECT_NEAR(p.lengthOn(p.bottom, "S"), 0.0, 0.001);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  expectSoundModel(p.model);
  EXPECT_EQ(p.violations(), 0);
}

// The paper's fig. 1 and its step 3. A wire of another net crosses on Top between the via and its neighbour.
// Where it has a short way round the neighbour (a through pin the net ends at) it is led behind it and the via
// goes; where the net runs on both ways on Top (the pair of the test above) it has none, and the vias stay.
TEST(Topo, ViaAndTheWireThatCrosses) {
  {
    TwoLayerBoard p;
    p.pad("S", 6, 10, PadShapeKind::Circle, 1, 1);
    p.throughPad("S", 16, 10, 1.0);
    p.pad("X", 15, 5, PadShapeKind::Circle, 1, 1);
    p.pad("X", 15, 15, PadShapeKind::Circle, 1, 1);
    p.throughVia("S", 12, 10, 1.0);
    p.trackOn(p.top, "S", {{6, 10}, {12, 10}}, 0.3);
    p.trackOn(p.bottom, "S", {{12, 10}, {16, 10}}, 0.3);
    p.trackOn(p.top, "X", {{15, 5}, {15, 15}}, 0.3);
    EXPECT_EQ(p.violations(), 0);
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 1);
    EXPECT_TRUE(p.b.vias.empty());
    EXPECT_NEAR(p.lengthOn(p.top, "S"), 10.0, 0.05);
    EXPECT_NEAR(p.lengthOn(p.bottom, "S"), 0.0, 0.001);
    EXPECT_GT(p.length("X"), 10.2);  // round the pin
    EXPECT_LT(p.length("X"), 12.5);
    EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
    expectSoundModel(p.model);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    TwoLayerBoard p;
    p.pad("S", 8, 10, PadShapeKind::Circle, 1, 1);
    p.pad("S", 30, 10, PadShapeKind::Circle, 1, 1);
    p.pad("X", 15, 6, PadShapeKind::Circle, 1, 1);
    p.pad("X", 15, 14, PadShapeKind::Circle, 1, 1);
    p.throughVia("S", 13, 10, 1.0);
    p.throughVia("S", 17, 10, 1.0);
    p.trackOn(p.top, "S", {{8, 10}, {13, 10}}, 0.3);
    p.trackOn(p.bottom, "S", {{13, 10}, {17, 10}}, 0.3);
    p.trackOn(p.top, "S", {{17, 10}, {30, 10}}, 0.3);
    p.trackOn(p.top, "X", {{15, 6}, {15, 14}}, 0.3);
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 0);
    EXPECT_EQ(p.b.vias.size(), 2u);
    EXPECT_NEAR(p.length("X"), 8.0, 0.05);
    expectSoundModel(p.model);
    EXPECT_EQ(p.violations(), 0);
  }
}

// The vias that stay: of a flexibly fixed net, locked, and one a pad of its net holds (the pad is copper on
// Bottom alone: the via is its way to Top).
TEST(Topo, ViasThatAreHeldStay) {
  auto board = [](TwoLayerBoard& p) {
    p.pad("S", 8, 10, PadShapeKind::Circle, 1, 1);
    p.pad("S", 30, 10, PadShapeKind::Circle, 1, 1);
    p.throughVia("S", 13, 10, 1.0);
    p.throughVia("S", 17, 10, 1.0);
    p.trackOn(p.top, "S", {{8, 10}, {13, 10}}, 0.3);
    p.trackOn(p.bottom, "S", {{13, 10}, {17, 10}}, 0.3);
    p.trackOn(p.top, "S", {{17, 10}, {30, 10}}, 0.3);
  };
  {
    TwoLayerBoard p;
    board(p);
    p.b.nets[size_t(p.net("S"))].flexFixed = true;
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 0);
    EXPECT_EQ(p.b.vias.size(), 2u);
  }
  {
    TwoLayerBoard p;
    board(p);
    for (Via& v : p.b.vias) v.locked = true;
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 0);
    EXPECT_EQ(p.b.vias.size(), 2u);
  }
  {
    TwoLayerBoard p;
    board(p);
    p.bottomPad("S", 13, 10, 1.4);
    p.bottomPad("S", 17, 10, 1.4);
    auto res = p.f6();
    ASSERT_TRUE(res.drawn);
    EXPECT_EQ(res.viasRemoved, 0);
    EXPECT_EQ(p.b.vias.size(), 2u);
  }
}

// The paper's step 8.2: the neighbour is a blind via that is no copper on the layer the wire is to be copied
// onto, and becomes a via of a type whose range holds both. Four layers; a via of layers 1-2 at (13, 10) with a
// wire of layer 1 from a pad, a via of layers 2-3 at (17, 10) with a wire of layer 3 to a pad, 4 mm on layer 2
// between them. One via of layers 1-3 is left, with the wires of layers 1 and 3 on it, and nothing on layer 2.
TEST(Topo, ViaGoesAndItsNeighbourTakesAWiderType) {
  PinBoard p;
  LayerId l[4] = {p.top, 0, 0, 0};
  p.b.layers[p.top].name = "L1";
  for (int k = 1; k < 4; ++k) {
    l[k] = p.b.addLayer(std::format("L{}", k + 1), LayerKind::Copper, k == 3 ? Side::Bottom : Side::None);
    p.b.layers[l[k]].copperIndex = k;
  }
  auto mask = [&](int from, int to) {
    LayerMask m = 0;
    for (int k = from; k <= to; ++k) m |= LayerMask(1) << l[k];
    return m;
  };
  p.b.rules = DesignRules{};
  for (auto [name, from, to] : {std::tuple("b12", "L1", "L2"), std::tuple("b23", "L2", "L3"), std::tuple("b13", "L1", "L3")}) {
    ViaType vt;
    vt.name = name;
    vt.diameter = mmToNm(1.0);
    vt.drill = mmToNm(0.5);
    vt.from = from;
    vt.to = to;
    p.b.rules->viaTypes.push_back(vt);
  }
  auto on = [&](int k, std::initializer_list<std::pair<double, double>> pts) {
    const size_t from = p.b.tracks.size();
    p.track("S", pts, 0.3);
    for (size_t i = from; i < p.b.tracks.size(); ++i) p.b.tracks[i].layer = l[k];
  };
  p.pad("S", 8, 10, PadShapeKind::Circle, 1, 1);
  p.pad("S", 30, 10, PadShapeKind::Circle, 1, 1);
  p.b.pads.back().copper = LayerMask(1) << l[2];
  p.via("S", 13, 10, 1.0);
  p.b.vias.back().layers = mask(0, 1);
  p.via("S", 17, 10, 1.0);
  p.b.vias.back().layers = mask(1, 2);
  on(0, {{8, 10}, {13, 10}});
  on(1, {{13, 10}, {17, 10}});
  on(2, {{17, 10}, {30, 10}});
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  auto res = topo::refineModel(p.b, t);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.viasRemoved, 1);
  ASSERT_EQ(p.b.vias.size(), 1u);
  EXPECT_EQ(p.b.vias[0].layers, mask(0, 2));
  double len[4] = {0, 0, 0, 0};
  for (const Track& tr : p.b.tracks)
    for (int k = 0; k < 4; ++k)
      if (tr.layer == l[k]) len[k] += tr.length() / kNmPerMm;
  EXPECT_NEAR(len[0] + len[2], 22.0, 0.05);
  EXPECT_NEAR(len[1], 0.0, 0.001);
  EXPECT_NEAR(len[3], 0.0, 0.001);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  expectSoundModel(t);
  EXPECT_EQ(p.violations(), 0);
}

// The clinch paper's fig. 6: the only wire of a pad goes to a branch point the long way while another wire, or
// another pad, of the net is nearer. Trunk of N1 from (2, 18) to (38, 18) with its branch point at (36, 18), the
// pad at (10, 10) wired to it (27 mm): the tree is 63.2 mm. F6 re-attaches a branch (the trunk's left end to the
// pad, 11.3 mm for 34) and the forces take the branch point on: the tree of least length, 40.4 mm. With a wire of
// N2 between the pad and the trunk the pad's own way up is barred and N2 has no short way round it; the wire
// stays, and what is re-attached goes round its end.
TEST(Topo, BranchIsMovedToTheNearWire) {
  auto board = [](PinBoard& p) {
    p.pad("N1", 2, 18, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 38, 18, PadShapeKind::Circle, 1, 1);
    p.pad("N1", 10, 10, PadShapeKind::Circle, 1, 1);
    p.track("N1", {{2, 18}, {36, 18}, {38, 18}}, 0.3);
    p.track("N1", {{10, 10}, {36, 18}}, 0.3);
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
    EXPECT_GE(res.reattached, 1);
    EXPECT_NEAR(p.length("N1"), 40.43, 0.5);
    EXPECT_LE(branchPointsOf(p.b, "N1").size(), 1u);
    expectSoundModel(t);
    EXPECT_EQ(p.violations(), 0);
  }
  {
    PinBoard p;
    board(p);
    p.pad("N2", 6, 14, PadShapeKind::Circle, 1, 1);
    p.pad("N2", 14, 14, PadShapeKind::Circle, 1, 1);
    p.track("N2", {{6, 14}, {14, 14}}, 0.3);
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    auto res = topo::refineModel(p.b, t);
    ASSERT_TRUE(res.drawn);
    EXPECT_GE(res.reattached, 1);
    EXPECT_NEAR(p.length("N2"), 8.0, 0.05);
    EXPECT_LT(p.length("N1"), 50.0);
    EXPECT_GT(p.length("N1"), 40.5);  // round N2's end (40.43 without it)
    expectSoundModel(t);
    EXPECT_EQ(p.violations(), 0);
  }
}

// A clinch with two hindering wires (the paper: «все мешающие проводники следует переложить по очереди»): two
// wires of N2 leave its pad at (25, 5) side by side and both go round N1's lower pad; with one of them taken out
// the other still bars N1's straight way, so neither alone is a clinch F6 would undo. Both are taken out, N1 is
// laid straight (10 mm), and they are laid anew one after the other.
TEST(Topo, ClinchWithTwoHinderingWires) {
  PinBoard p;
  p.pad("N1", 15, 5, PadShapeKind::Circle, 1, 1);
  p.pad("N1", 15, 15, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 25, 5, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 25, 15, PadShapeKind::Circle, 1, 1);
  p.pad("N2", 28, 17, PadShapeKind::Circle, 1, 1);
  p.track("N1", {{15, 5}, {28, 2}, {28, 8}, {20, 10}, {15, 15}}, 0.3);
  p.track("N2", {{25, 5}, {17, 8}, {13, 10}, {13, 17}, {25, 15}}, 0.3);
  p.track("N2", {{25, 5}, {17, 7}, {12, 9.5}, {12, 18.5}, {28, 17}}, 0.3);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_EQ(p.violations(), 0);
  const double was = p.length("N2");
  auto res = topo::refineModel(p.b, t);
  ASSERT_TRUE(res.drawn);
  EXPECT_EQ(res.clinches, 1);
  EXPECT_TRUE(r::any_of(res.log, [](const std::string& l) { return l.contains("more than one wire"); }));
  EXPECT_NEAR(p.length("N1"), 10.0, 0.05);
  EXPECT_LT(p.length("N2"), 23.0) << "was " << was;
  expectSoundModel(t);
  EXPECT_EQ(p.violations(), 0);
}

namespace {

// The live model against one built anew from the board: the same wires (by their tracks), the same crossings and
// wires through copper.
void expectLikeBuilt(Board& b, const topo::Topology& live, const char* how) {
  topo::Topology::assignIds(b);
  topo::Topology built;
  built.build(b);
  auto wiresOf = [](const topo::Topology& t) {
    std::multiset<std::vector<uint32_t>> out;
    for (const topo::Wire& w : t.wires) {
      std::vector<uint32_t> ids = w.tracks;
      r::sort(ids);
      out.insert(ids);
    }
    return out;
  };
  EXPECT_EQ(live.wires.size(), built.wires.size()) << how;
  EXPECT_TRUE(wiresOf(live) == wiresOf(built)) << how;
  auto stops = [](const topo::Topology& t) {
    int n = 0;
    for (const topo::Violation& v : t.violations) n += v.kind == topo::Violation::Kind::Crossing || v.kind == topo::Violation::Kind::ThroughPad;
    return n;
  };
  EXPECT_EQ(stops(live), stops(built)) << how;
  for (const std::string& p : live.check()) ADD_FAILURE() << how << ": " << p;
  for (const topo::Wire& w : live.wires) {
    ASSERT_GE(w.end[0], 0) << how;
    ASSERT_GE(w.end[1], 0) << how;
    for (int cid : w.cross) EXPECT_EQ(live.crossings[size_t(cid)].wire, int(&w - live.wires.data())) << how;
  }
}

}  // namespace

// The live model (Topology::relayTracks): a vertex in the middle of a wire moved, a branch drawn off it (the wire
// cut at a new branch point), the branch taken away (the two joined again), a track taken out of a wire's middle
// (two dangling ends) — each time the wires of the touched tracks laid again from the board, and the model as one
// built anew from it.
TEST(Topo, LiveModelRelaysEditedTracks) {
  auto r = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  // A wire of three or more straight tracks, unlocked: the joint after its first track.
  int wi = -1;
  for (int k = 0; k < int(t.wires.size()) && wi < 0; ++k) {
    const topo::Wire& w = t.wires[size_t(k)];
    if (w.locked || w.tracks.size() < 3 || w.pair >= 0) continue;
    bool straight = true;
    for (uint32_t id : w.tracks)
      for (const Track& tr : b.tracks)
        if (tr.id == id && tr.isArc()) straight = false;
    if (straight) wi = k;
  }
  ASSERT_GE(wi, 0);
  auto indexOf = [&](uint32_t id) {
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (b.tracks[size_t(i)].id == id) return i;
    return -1;
  };
  const int t0 = indexOf(t.wires[size_t(wi)].tracks[0]);
  ASSERT_GE(t0, 0);
  // Its end shared with the wire's next track: a joint inside the wire.
  const Track first = b.tracks[size_t(t0)];
  const int t1 = indexOf(t.wires[size_t(wi)].tracks[1]);
  ASSERT_GE(t1, 0);
  int joint = -1;
  for (int e = 0; e < 2; ++e) {
    const Vec2 p = e ? first.b.v() : first.a.v();
    if ((b.tracks[size_t(t1)].a.v() - p).len() < 1000 || (b.tracks[size_t(t1)].b.v() - p).len() < 1000) joint = e;
  }
  ASSERT_GE(joint, 0);
  const Vec2 at = joint ? first.b.v() : first.a.v();
  auto changedAt = [&](Vec2 p) {
    std::vector<uint32_t> ids;
    for (const Track& tr : b.tracks)
      if ((tr.a.v() - p).len() < 1000 || (tr.b.v() - p).len() < 1000) ids.push_back(tr.id);
    return ids;
  };
  // Moved by 10 um.
  {
    const std::vector<uint32_t> ids = changedAt(at);
    edit::moveVertex(b, t0, joint, at + Vec2{10000, 0});
    topo::Topology::assignIds(b);
    ASSERT_TRUE(t.relayTracks(b, ids));
    expectLikeBuilt(b, t, "vertex moved");
  }
  const Vec2 at2 = at + Vec2{10000, 0};
  // A branch off the joint, 1 mm along the normal of the first track.
  Vec2 dir = (first.b.v() - first.a.v()).perp().normalized();
  Track br = first;
  br.a = Point(at2);
  br.b = Point(at2 + dir * 1000000.0);
  br.id = 0;
  br.mid.reset();
  b.tracks.push_back(br);
  topo::Topology::assignIds(b);
  const uint32_t brId = b.tracks.back().id;
  const size_t wiresBefore = t.wires.size();
  ASSERT_TRUE(t.relayTracks(b, {brId}));
  expectLikeBuilt(b, t, "branch drawn");
  EXPECT_EQ(t.wires.size(), wiresBefore + 2) << "the wire cut at the branch point, and the branch";
  // The branch taken away.
  b.tracks.pop_back();
  ASSERT_TRUE(t.relayTracks(b, {brId}));
  expectLikeBuilt(b, t, "branch taken away");
  // A track taken out of the wire's middle.
  const uint32_t midId = t.wires[size_t(wi)].tracks.size() > 1 ? t.wires[size_t(wi)].tracks[1] : 0;
  for (const topo::Wire& w : t.wires)
    if (r::contains(w.tracks, first.id)) {
      const uint32_t id = w.tracks[w.tracks.size() / 2];
      const int ti = indexOf(id);
      ASSERT_GE(ti, 0);
      b.tracks.erase(b.tracks.begin() + ti);
      ASSERT_TRUE(t.relayTracks(b, {id}));
      expectLikeBuilt(b, t, "middle track taken out");
      break;
    }
  (void)midId;
}

namespace {

// The y of the net's tracks where they pass x (mm), the first found.
double yAt(const PinBoard& p, const std::string& net, double x) {
  const Vec2 a = PinBoard::at(x, -100), c = PinBoard::at(x, 100);
  for (const Track& t : p.b.tracks) {
    if (p.b.nets[size_t(t.net)].name != net) continue;
    const Polyline pts = t.path();
    for (size_t k = 1; k < pts.size(); ++k)
      if (segmentsIntersect(pts[k - 1], pts[k], a, c)) {
        const Vec2 d = pts[k] - pts[k - 1];
        if (std::abs(d.x) < 1) return pts[k].y / kNmPerMm;
        return (pts[k - 1].y + d.y * (a.x - pts[k - 1].x) / d.x) / kNmPerMm;
      }
  }
  return std::nan("");
}

int crossingsOf(const topo::Topology& t) {
  return int(r::count_if(t.violations, [](const topo::Violation& v) { return v.kind == topo::Violation::Kind::Crossing; }));
}

// Three nets left to right, A below, B, C above, at both ends (the pads); C drawn as `cPath`.
PinBoard threeWires(std::initializer_list<std::pair<double, double>> cPath, double cWidth = 0.3) {
  PinBoard p;
  p.b.netClasses[0].clearance = mmToNm(0.2);
  p.pad("A", 4, 8, PadShapeKind::Circle, 1, 1);
  p.pad("A", 36, 8, PadShapeKind::Circle, 1, 1);
  p.pad("B", 4, 10, PadShapeKind::Circle, 1, 1);
  p.pad("B", 36, 10, PadShapeKind::Circle, 1, 1);
  p.pad("C", 4, 12, PadShapeKind::Circle, 1, 1);
  p.pad("C", 36, 12, PadShapeKind::Circle, 1, 1);
  p.track("A", {{4, 8}, {36, 8}}, 0.3);
  p.track("B", {{4, 10}, {36, 10}}, 0.3);
  p.track("C", cPath, cWidth);
  return p;
}

}  // namespace

// The article's fig. 1 (Polubasov, 2010): a wire drawn across another and back is taken apart from it — the two
// exchange their pieces between the two crossings — and F5 lays them side by side: no crossing, no violation, C
// above B all the way (of another width too: the realiser lays them by their widths).
TEST(Topo, DoubleCrossingUntangled) {
  PinBoard p = threeWires({{4, 12}, {10, 12}, {14, 9}, {26, 9}, {30, 12}, {36, 12}}, 0.4);  // across B only
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_EQ(crossingsOf(t), 0);
  EXPECT_EQ(t.untangled, 1);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(p.violations(), 0);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  EXPECT_GT(yAt(p, "C", 20), yAt(p, "B", 20)) << "C above B";
}

// Fig. 2: C drawn down across B and A and back up — taken apart from one, it crosses the other twice, and that is
// taken apart the next step; F5 lays three parallel wires in the order of their ends.
TEST(Topo, DoubleCrossingsUntangledInTwoSteps) {
  PinBoard p = threeWires({{4, 12}, {10, 12}, {14, 6}, {26, 6}, {30, 12}, {36, 12}});
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_EQ(crossingsOf(t), 0);
  EXPECT_GE(t.untangled, 2);
  auto f = p.f5Model();
  ASSERT_TRUE(f.res.drawn);
  EXPECT_EQ(p.violations(), 0);
  EXPECT_EQ(Connectivity::compute(p.b).ratsnest.size(), 0u);
  const double a = yAt(p, "A", 20), bb = yAt(p, "B", 20), c = yAt(p, "C", 20);
  EXPECT_LT(a, bb);
  EXPECT_LT(bb, c);
}

// A single crossing (C goes from above B to below it and stays) is no double one: it stays, and F5 stops on it.
TEST(Topo, SingleCrossingStays) {
  PinBoard p = threeWires({{4, 12}, {10, 12}, {14, 9}, {36, 9}});
  p.b.tracks.erase(p.b.tracks.begin());
  p.pad("C", 36, 9, PadShapeKind::Circle, 1, 1);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_GT(crossingsOf(t), 0);
  EXPECT_FALSE(p.f5Model().res.drawn);
}

// The live model takes a double crossing apart as the build does: C laid straight, then drawn down across B and A
// and back (relayTracks): the wires of A and B come with it, no crossing, as a model built anew.
TEST(Topo, LiveModelUntanglesADoubleCrossing) {
  PinBoard p = threeWires({{4, 12}, {36, 12}});
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  std::vector<uint32_t> changed;
  for (const Track& tr : p.b.tracks)
    if (p.b.nets[size_t(tr.net)].name == "C") changed.push_back(tr.id);
  std::erase_if(p.b.tracks, [&](const Track& tr) { return p.b.nets[size_t(tr.net)].name == "C"; });
  p.track("C", {{4, 12}, {10, 12}, {14, 6}, {26, 6}, {30, 12}, {36, 12}}, 0.3);
  topo::Topology::assignIds(p.b);
  for (const Track& tr : p.b.tracks)
    if (p.b.nets[size_t(tr.net)].name == "C") changed.push_back(tr.id);
  ASSERT_TRUE(t.relayTracks(p.b, changed));
  EXPECT_EQ(crossingsOf(t), 0);
  expectLikeBuilt(p.b, t, "C drawn across B and A and back");
}

// F6 and F7 take the crossings apart before they give up: handed a model with a crossing (built before this, or
// read from a file), they build it anew from the tracks and go on; a single crossing stops them.
TEST(Topo, F6AndF7TakeTheCrossingsApart) {
  for (int which : {6, 7}) {
    PinBoard p = threeWires({{4, 12}, {10, 12}, {14, 6}, {26, 6}, {30, 12}, {36, 12}});
    topo::Topology::assignIds(p.b);
    topo::Topology t;
    t.build(p.b);
    topo::Violation v;  // as a model of before had it
    v.kind = topo::Violation::Kind::Crossing;
    t.violations.push_back(v);
    const bool drawn = which == 6 ? topo::refineModel(p.b, t).drawn : topo::optimizeModel(p.b, t).drawn;
    EXPECT_TRUE(drawn) << "F" << which;
    EXPECT_EQ(crossingsOf(t), 0) << "F" << which;
  }
  PinBoard p = threeWires({{4, 12}, {10, 12}, {14, 9}, {36, 9}});
  p.b.tracks.erase(p.b.tracks.begin());
  p.pad("C", 36, 9, PadShapeKind::Circle, 1, 1);
  topo::Topology::assignIds(p.b);
  topo::Topology t;
  t.build(p.b);
  EXPECT_FALSE(topo::optimizeModel(p.b, t).drawn) << "a single crossing";
}

// A board with zipped pairs saved with its model and read back: the model is the board's (the axes come back from
// the file rounded — the arcs by their centres on the 0.1 um grid — and the model was stale, built anew).
TEST(Topo, SidecarOfAPairedBoardReadsBack) {
  auto r = io::loadBoard(data("topor/AMK310/AMK310_MCU_V2.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(topo::runF5Model(b, t).drawn);
  const auto dir = std::filesystem::temp_directory_path() / "xrtopor_paired_sidecar";
  std::filesystem::create_directories(dir);
  const std::string path = (dir / "board.fst").string();
  ASSERT_TRUE(io::saveBoard(b, path).has_value());
  ASSERT_TRUE(topo::saveTopology(t, b, topo::sidecarPath(path)).has_value());
  auto again = io::loadBoard(path);
  ASSERT_TRUE(again) << again.error();
  topo::Topology::assignIds(**again);
  auto loaded = topo::loadTopology(**again, topo::sidecarPath(path));
  EXPECT_TRUE(loaded.has_value()) << (loaded ? "" : loaded.error());
  std::filesystem::remove_all(dir);
}

// The live model follows a via's going (Topology::follow): the via and the tracks of its wires taken off the board —
// the wires leave, the via's owner leaves the meshes (beside a row of pads too: the spokes flip past the pads'
// copper), and the model left is whole and has the wires a model built anew from that board has.
// A component's pads are one body in the model: shifted or turned, they go together or not at all (pad by pad, the
// first one the mesh stopped left the others ahead: Freestyle tore the wires off the pads), and the model follows a
// board whose component was moved or turned.
TEST(Topo, AComponentGoesAsOneBody) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(lb.has_value());
  Board& b0 = **lb;
  topo::Topology::assignIds(b0);
  topo::Topology t0;
  t0.build(b0);
  ASSERT_EQ(t0.check(), std::vector<std::string>{});
  auto bodyOf = [&](const topo::Topology& t, int ci) {
    std::vector<int> body;
    for (int pi : b0.components[size_t(ci)].pads)
      if (pi >= 0 && pi < int(t.padOwner.size()) && t.padOwner[size_t(pi)] >= 0) body.push_back(t.padOwner[size_t(pi)]);
    return body;
  };
  std::mt19937 rng(11);
  std::uniform_real_distribution<double> ang(0, 2 * std::numbers::pi), len(0.05 * kNmPerMm, 1.5 * kNmPerMm), deg(-25, 25);
  topo::Topology t = t0;
  int moves = 0, whole = 0, turns = 0, turnedWhole = 0;
  for (int k = 0; k < 200; ++k) {
    const int ci = int(rng() % b0.components.size());
    const std::vector<int> body = bodyOf(t, ci);
    if (body.size() < 2) continue;
    std::vector<Vec2> was;
    for (int oi : body) was.push_back(t.owners[size_t(oi)].c);
    if (k % 3 == 2) {
      const Vec2 pivot = was.front();
      const double a = deg(rng);
      const double f = topo::turnOwners(t, body, pivot, a);
      ++turns;
      turnedWhole += f > 0.999;
      for (size_t i = 0; i < body.size(); ++i) {
        const Vec2 want = pivot + rotateBoard(was[i] - pivot, a * f);
        EXPECT_LT((t.owners[size_t(body[i])].c - want).len(), 1.0) << "turn " << k << ", pad " << i;
      }
    } else {
      const double a = ang(rng), l = len(rng);
      const Vec2 d{l * std::cos(a), l * std::sin(a)};
      const double f = topo::moveOwners(t, body, d);
      ++moves;
      whole += f > 0.999;
      for (size_t i = 0; i < body.size(); ++i) EXPECT_LT((t.owners[size_t(body[i])].c - (was[i] + d * f)).len(), 1e-3) << "move " << k << ", pad " << i;
    }
    // (Every vertex where its owner says.)
    for (const topo::LayerMesh& m : t.layers)
      for (int oi : body)
        if (oi < int(m.ownerVerts.size()))
          for (int v : m.ownerVerts[size_t(oi)]) {
            const topo::Vertex& x = m.verts[size_t(v)];
            EXPECT_LT((x.p - (t.owners[size_t(oi)].c + t.owners[size_t(oi)].axis * x.t + x.off)).len(), 1e-3);
            EXPECT_TRUE(t.owners[size_t(oi)].shape.distance(x.p) < 2.0) << "a vertex off its owner's copper after step " << k;
          }
    if (k % 20 == 19) ASSERT_EQ(t.check(), std::vector<std::string>{}) << "after step " << k;
  }
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  EXPECT_EQ(staleCapacities(t), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  std::println("Arcs_master: {} shifts of a component, {} whole; {} turns, {} whole", moves, whole, turns, turnedWhole);
  EXPECT_GT(moves, 60);
  EXPECT_GT(whole * 3, moves);
  EXPECT_GT(turnedWhole * 4, turns);

  // The model follows the board: a component shifted, and turned a quarter, by the editor (its tracks' ends dragged).
  int tried = 0, followed = 0;
  for (int ci = 0; ci < int(b0.components.size()) && tried < 16; ci += std::max(1, int(b0.components.size()) / 16)) {
    if (b0.components[size_t(ci)].locked || bodyOf(t0, ci).size() < 2) continue;
    ++tried;
    Board b = b0;
    edit::Fragment f;
    f.components = {ci};
    edit::Motion mo;
    mo.pivot = b.components[size_t(ci)].pos.v();
    mo.shift = {0.3 * kNmPerMm, -0.2 * kNmPerMm};
    if (tried % 2 == 0) mo.rotate = 90;
    if (!edit::move(b, f, mo)) continue;
    topo::Topology m = t0;
    if (!m.follow(b0, b)) continue;
    ++followed;
    EXPECT_EQ(m.check(), std::vector<std::string>{}) << "component " << ci;
    for (int pi : b.components[size_t(ci)].pads) {
      if (pi < 0 || m.padOwner[size_t(pi)] < 0) continue;
      const topo::Owner& o = m.owners[size_t(m.padOwner[size_t(pi)])];
      const BBox mine = o.shape.bbox(), theirs = b.pads[size_t(pi)].shapeGeom().bbox();
      EXPECT_LT(std::max({std::abs(mine.minX - theirs.minX), std::abs(mine.minY - theirs.minY), std::abs(mine.maxX - theirs.maxX), std::abs(mine.maxY - theirs.maxY)}), 5.0)
          << "component " << ci << ", pad " << pi;
      EXPECT_LT((o.shape.center() - b.pads[size_t(pi)].shapeGeom().center()).len(), 5.0) << "component " << ci << ", pad " << pi;
    }
  }
  std::println("Arcs_master: {} components moved by the editor, the model followed {}", tried, followed);
  EXPECT_GT(tried, 8);
  EXPECT_GE(followed * 2, tried);
}

// The pads of a component with no room for any wire between them are joined by rigid edges: a row of an IC's pads is
// a wall of the mesh, and stays one when the component is moved.
TEST(Topo, PadsNoWirePassesBetweenAreAWall) {
  auto lb = io::loadBoard(data("topor/AMK310/AMK310_MCU_V2.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology t;
  t.build(b);
  ASSERT_EQ(t.check(), std::vector<std::string>{});
  double widest = 0;
  for (int n = 0; n < int(b.nets.size()); ++n) widest = std::max(widest, double(b.trackWidth(n, -1)));
  struct Wall {
    size_t layer;
    int edge;
    double len;
  };
  std::vector<Wall> walls;
  std::vector<int> comps;
  for (size_t li = 0; li < t.layers.size(); ++li) {
    const topo::LayerMesh& m = t.layers[li];
    for (int e = 0; e < int(m.edges.size()); ++e) {
      const topo::Edge& E = m.edges[size_t(e)];
      if (E.v[0] < 0 || !E.rigid) continue;
      const int oa = m.verts[size_t(E.v[0])].owner, ob = m.verts[size_t(E.v[1])].owner;
      if (oa == ob) continue;
      const topo::Owner& A = t.owners[size_t(oa)];
      const topo::Owner& B = t.owners[size_t(ob)];
      // (A branch point standing on a pad's side has the side's two pieces: rigid edges to another owner too.)
      if (A.kind != topo::Owner::Kind::Pad || B.kind != topo::Owner::Kind::Pad) continue;
      ASSERT_GE(A.pad, 0);
      ASSERT_GE(B.pad, 0);
      EXPECT_EQ(b.pads[size_t(A.pad)].component, b.pads[size_t(B.pad)].component);
      EXPECT_LT(A.shape.distance(B.shape), widest + 2 * double(b.maxClearance()));
      EXPECT_FALSE(E.constrained);
      walls.push_back({li, e, (m.verts[size_t(E.v[0])].p - m.verts[size_t(E.v[1])].p).len()});
      if (!r::contains(comps, b.pads[size_t(A.pad)].component)) comps.push_back(b.pads[size_t(A.pad)].component);
    }
  }
  std::println("AMK310: {} rigid edges between the pads of {} components", walls.size(), comps.size());
  EXPECT_GT(walls.size(), 100u);
  // Moved, the components keep their walls: the same edges, as long as they were.
  int moved = 0;
  for (int ci : comps) {
    std::vector<int> body;
    for (int pi : b.components[size_t(ci)].pads)
      if (pi >= 0 && t.padOwner[size_t(pi)] >= 0) body.push_back(t.padOwner[size_t(pi)]);
    moved += topo::moveOwners(t, body, Vec2{0.15 * kNmPerMm, -0.1 * kNmPerMm}) > 0;
  }
  EXPECT_GT(moved, 0);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  for (const Wall& w : walls) {
    const topo::LayerMesh& m = t.layers[w.layer];
    const topo::Edge& E = m.edges[size_t(w.edge)];
    EXPECT_TRUE(E.rigid);
    EXPECT_NEAR((m.verts[size_t(E.v[0])].p - m.verts[size_t(E.v[1])].p).len(), w.len, 1e-3);
  }
}

TEST(Topo, TheModelFollowsAViaGone) {
  for (const char* name : {"topor/Example_04/Arcs_master.pcb", "topor/Example_03/arz_4L.fst"}) {
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    Board& b0 = **lb;
    topo::Topology::assignIds(b0);
    topo::Topology t0;
    t0.build(b0);
    ASSERT_EQ(t0.check(), std::vector<std::string>{}) << name;
    int tried = 0, followed = 0, returned = 0;
    for (size_t vi = 0; vi < b0.vias.size() && tried < 12; vi += std::max<size_t>(1, b0.vias.size() / 12)) {
      const int oi = vi < t0.viaOwner.size() ? t0.viaOwner[vi] : -1;
      if (oi < 0) continue;
      std::set<uint32_t> gone;
      bool plain = true;
      for (const topo::Wire& w : t0.wires)
        if (w.end[0] == oi || w.end[1] == oi) {
          plain &= !w.locked && w.pair < 0;
          gone.insert(w.tracks.begin(), w.tracks.end());
        }
      if (!plain || gone.empty()) continue;
      ++tried;
      Board b = b0;
      b.vias.erase(b.vias.begin() + long(vi));
      std::erase_if(b.tracks, [&](const Track& tr) { return gone.contains(tr.id); });
      topo::Topology t = t0;
      std::vector<int> map;
      if (!t.follow(b0, b, &map)) continue;
      ++followed;
      EXPECT_EQ(t.check(), std::vector<std::string>{}) << name << ", via " << vi;
      EXPECT_EQ(t.owners[size_t(oi)].layers, LayerMask(0)) << name;
      for (const topo::Wire& w : t.wires) EXPECT_TRUE(w.end[0] != oi && w.end[1] != oi) << name;
      EXPECT_EQ(map.size(), t0.wires.size()) << name;
      topo::Topology fresh;
      fresh.build(b);
      auto wiresOf = [&](const topo::Topology& m) {
        std::multiset<std::tuple<int, int, long, long, long, long>> out;
        for (const topo::Wire& w : m.wires) {
          if (w.end[0] < 0 || w.end[1] < 0) continue;
          const topo::LayerMesh& lm = *m.mesh(w.layer);
          Vec2 p = lm.verts[size_t(w.endVertex[0])].p, q = lm.verts[size_t(w.endVertex[1])].p;
          if (std::pair{q.x, q.y} < std::pair{p.x, p.y}) std::swap(p, q);
          out.insert({w.net, int(w.layer), std::lround(p.x / 1000), std::lround(p.y / 1000), std::lround(q.x / 1000), std::lround(q.y / 1000)});
        }
        return out;
      };
      const auto mine = wiresOf(t), theirs = wiresOf(fresh);
      std::vector<std::tuple<int, int, long, long, long, long>> onlyMine, onlyTheirs;
      r::set_difference(mine, theirs, std::back_inserter(onlyMine));
      r::set_difference(theirs, mine, std::back_inserter(onlyTheirs));
      EXPECT_TRUE(onlyMine.empty() && onlyTheirs.empty()) << name << ", via " << vi << ": " << onlyMine.size() << " wire(s) only in the model that followed, " << onlyTheirs.size()
                                                           << " only in the one built anew";
      for (auto& [net, layer, x0, y0, x1, y1] : onlyMine) std::println("  followed only: net {} L{} ({}, {}) - ({}, {})", net, layer, x0, y0, x1, y1);
      for (auto& [net, layer, x0, y0, x1, y1] : onlyTheirs) std::println("  built only:    net {} L{} ({}, {}) - ({}, {})", net, layer, x0, y0, x1, y1);
      // ... and the via's coming back with its tracks: an owner again, its wires laid.
      if (t.follow(b, b0)) {
        ++returned;
        EXPECT_EQ(t.check(), std::vector<std::string>{}) << name << ", via " << vi << " back";
        EXPECT_EQ(wiresOf(t), wiresOf(t0)) << name << ", via " << vi << " back";
      }
    }
    std::println("{}: {} vias taken off with their wires, the model followed {}; put back, it followed {}", name, tried, followed, returned);
    EXPECT_GT(tried, 3) << name;
    EXPECT_EQ(followed, tried) << name;
    EXPECT_GE(returned * 4, tried * 3) << name;
  }
}
