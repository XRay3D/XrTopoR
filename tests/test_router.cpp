#include <gtest/gtest.h>

#include <algorithm>
#include <cstdlib>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/Optimizer.h"
#include "router/topo/TopoMesh.h"
#include "router/topo/TopoRouter.h"

using namespace xr;

static std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

static int clearanceViolations(const Board& b) {
  int n = 0;
  for (auto& v : runDrc(b))
    if (v.type != DrcViolation::Type::Unconnected) ++n;
  return n;
}

TEST(Router, AstableFullyRoutedAndClean) {
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  topo::RouterOptions o;
  auto r = topo::routeBoard(**b, o);
  EXPECT_EQ(r.routed, r.connections);
  EXPECT_EQ(Connectivity::compute(**b).ratsnest.size(), 0u);
  EXPECT_EQ(clearanceViolations(**b), 0);
  bool hasArc = false;
  for (auto& t : (*b)->tracks) hasArc |= t.isArc();
  EXPECT_TRUE(hasArc);
}

TEST(Router, Adg508fDsn) {
  auto b = io::loadBoard(data("adg508f_single.dsn"));
  ASSERT_TRUE(b);
  topo::RouterOptions o;
  auto r = topo::routeBoard(**b, o);
  EXPECT_EQ(r.routed, r.connections);
  EXPECT_LE(clearanceViolations(**b), 2);
  // Session export round trip keeps the routing.
  std::string ses = io::writeSes(**b);
  auto b2 = io::loadBoard(data("adg508f_single.dsn"));
  ASSERT_TRUE(io::applySes(**b2, ses));
  EXPECT_EQ((*b2)->vias.size(), (*b)->vias.size());
  EXPECT_EQ(Connectivity::compute(**b2).ratsnest.size(), 0u);
}

TEST(Router, SelectedNetsOnly) {
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  (*b)->clearRouting(false);
  topo::RouterOptions o;
  o.nets = {"GND"};
  auto r = topo::routeBoard(**b, o);
  EXPECT_GT(r.routed, 0);
  for (auto& t : (*b)->tracks) EXPECT_EQ((*b)->nets[t.net].name, "GND");
}

TEST(Optimizer, MovesViasWithoutBreakingAnything) {
  auto b = io::loadBoard(data("adg508f_single.dsn"));
  ASSERT_TRUE(b);
  topo::routeBoard(**b, {});
  size_t unrouted = Connectivity::compute(**b).ratsnest.size();
  int before = clearanceViolations(**b);
  topo::OptimizeOptions o;
  o.iterations = 2;
  o.components = true;
  auto r = topo::optimize(**b, o);
  EXPECT_GT(r.viaMoves, 0);
  EXPECT_LE(r.lengthAfter, r.lengthBefore);
  EXPECT_LE(Connectivity::compute(**b).ratsnest.size(), unrouted);
  EXPECT_LE(clearanceViolations(**b), before);
}

namespace {

// A two-layer board 40 x 30 mm with through pads of one net at (5,15) and (35,15).
Board twoPads() {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  LayerId bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  b.layers[top].copperIndex = 0;
  b.layers[bot].copperIndex = 1;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 30), mm(0, 30)});
  int net = b.addNet("A");
  for (Vec2 at : {mm(5, 15), mm(35, 15)}) {
    Component c;
    c.ref = "J" + std::to_string(b.components.size());
    c.pos = Point(at);
    Pad p;
    p.number = "1";
    p.component = int(b.components.size());
    p.net = net;
    p.shape.w = p.shape.h = mmToNm(1.6);
    p.drill = mmToNm(0.8);
    p.copper = b.allCopperMask();
    c.pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
    b.components.push_back(c);
    b.updatePadPositions(int(b.components.size()) - 1);
  }
  return b;
}

int keepoutViolations(const Board& b) {
  int n = 0;
  for (auto& v : runDrc(b))
    if (v.type == DrcViolation::Type::Keepout) ++n;
  return n;
}

}  // namespace

// Keepouts are obstacles for the autorouter: a wall across most of the board on the only routing
// layer is gone around; an area over the straight path on one layer leaves the other.
TEST(Router, Keepouts) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  {
    Board b = twoPads();
    Keepout k;
    Graphic g;
    g.kind = GraphicKind::Line;
    g.a = mm(20, 0);
    g.b = mm(20, 24);
    k.shape.push_back(g);
    b.keepouts.push_back(k);
    topo::RouterOptions o;
    o.copperIndices = {0};
    auto r = topo::routeBoard(b, o);
    EXPECT_EQ(r.routed, r.connections);
    EXPECT_EQ(keepoutViolations(b), 0);
    double maxY = 0;
    for (auto& t : b.tracks) maxY = std::max({maxY, t.a.v().y, t.b.v().y});
    EXPECT_GT(maxY, 24 * kNmPerMm);  // around the end of the wall
  }
  {
    Board b = twoPads();
    Keepout k;
    k.layers = LayerMask(1) << b.topCopper();
    Graphic g;
    g.kind = GraphicKind::Poly;
    g.filled = true;
    g.pts = {mm(10, 2), mm(30, 2), mm(30, 28), mm(10, 28)};
    k.shape.push_back(g);
    b.keepouts.push_back(k);
    auto r = topo::routeBoard(b);
    EXPECT_EQ(r.routed, r.connections);
    EXPECT_EQ(keepoutViolations(b), 0);
    bool bottom = false;
    for (auto& t : b.tracks) bottom |= t.layer == b.bottomCopper();
    EXPECT_TRUE(bottom);
  }
}

// «Назначение цепей на слои»: a net assigned to the bottom is routed there.
TEST(Router, NetsOnAssignedLayers) {
  {
    Board free = twoPads();  // without the rule the route takes the top
    topo::routeBoard(free);
    ASSERT_FALSE(free.tracks.empty());
    EXPECT_EQ(free.tracks[0].layer, free.topCopper());
  }
  Board b = twoPads();
  DesignRules r;
  r.layerNets.push_back({true, "Bottom", {RuleNets{RuleNets::Kind::Net, "A"}}});
  b.rules = r;
  EXPECT_EQ(b.assignedLayers(0), LayerMask(1) << b.bottomCopper());
  auto res = topo::routeBoard(b);
  EXPECT_EQ(res.routed, res.connections);
  ASSERT_FALSE(b.tracks.empty());
  for (auto& t : b.tracks) EXPECT_EQ(t.layer, b.bottomCopper());
}

// Wires kept on the board are obstacles: a kept wire of another net across most of the only routing
// layer is gone around; a net removed from a routed board is routed again without violations against
// the rest, which stays as it was.
TEST(Router, KeptWiresAreObstacles) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  {
    Board b = twoPads();
    int nb = b.addNet("B");
    Track wall;
    wall.a = Point(mm(20, 2));
    wall.b = Point(mm(20, 24));
    wall.width = mmToNm(0.3);
    wall.layer = b.topCopper();
    wall.net = nb;
    wall.locked = true;
    b.tracks.push_back(wall);
    if (const char* dump = std::getenv("XR_DUMP")) (void)io::saveBoard(b, dump);
    {
      topo::TopoMesh m;
      topo::MeshOptions mo;
      mo.viaDiameter = double(b.netClasses[0].viaDiameter);
      mo.clearance = double(b.netClasses[0].clearance);
      m.build(b, mo);
      int trackVerts = 0, barrier = 0;
      for (auto& v : m.verts) trackVerts += v.kind == topo::VKind::Track;
      for (auto& e : m.edges) barrier += e.blocked != 0 && e.net == nb;
      EXPECT_GE(trackVerts, 20);
      EXPECT_GE(barrier, 20);
    }
    for (int stage = 0; stage < 3; ++stage) {
      SCOPED_TRACE(stage == 0 ? "route only" : stage == 1 ? "with the optimiser" : "with the refinement");
      Board bb = b;
      topo::RouterOptions o;
      o.copperIndices = {0};
      o.ripupExisting = false;
      o.optimizeIterations = stage == 1 ? 2 : 0;
      o.refine = stage == 2;
      auto r = topo::routeBoard(bb, o);
      EXPECT_EQ(r.routed, r.connections);
      EXPECT_EQ(clearanceViolations(bb), 0);
      double maxY = 0;
      for (auto& t : bb.tracks)
        if (t.net != nb) maxY = std::max({maxY, t.a.v().y, t.b.v().y});
      EXPECT_GT(maxY, 24 * kNmPerMm);
    }
  }
  {
    auto lb = io::loadBoard(data("tt.kicad_pcb"));
    ASSERT_TRUE(lb);
    Board& b = **lb;
    ASSERT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
    // The net with the most wire is taken out.
    std::vector<double> len(b.nets.size(), 0);
    for (auto& t : b.tracks)
      if (t.net >= 0) len[size_t(t.net)] += (t.b.v() - t.a.v()).len();
    int net = int(std::ranges::max_element(len) - len.begin());
    std::erase_if(b.tracks, [&](const Track& t) { return t.net == net; });
    std::erase_if(b.vias, [&](const Via& v) { return v.net == net; });
    size_t others = b.tracks.size();
    int before = clearanceViolations(b);
    topo::RouterOptions o;
    o.ripupExisting = false;
    o.nets = {b.nets[size_t(net)].name};
    auto r = topo::routeBoard(b, o);
    EXPECT_EQ(r.routed, r.connections);
    EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
    EXPECT_LE(clearanceViolations(b), before);
    size_t kept = 0;
    for (auto& t : b.tracks) kept += t.net != net;
    EXPECT_EQ(kept, others);
  }
}

// Splitting a triangle at an inner point keeps the mesh consistent: every edge knows its two
// triangles, neighbours point back, vertices list their triangles, orientation stays positive.
TEST(Mesh, SplitTriangle) {
  Board b = twoPads();
  topo::TopoMesh m;
  topo::MeshOptions mo;
  mo.viaSites = false;
  m.build(b, mo);
  auto check = [&] {
    for (int t = 0; t < int(m.tris.size()); ++t) {
      const auto& T = m.tris[t];
      if (!T.inside) continue;
      Vec2 a = m.verts[T.v[0]].p, c = m.verts[T.v[1]].p, d = m.verts[T.v[2]].p;
      EXPECT_GT(orient(a, c, d), 0) << "triangle " << t;
      for (int i = 0; i < 3; ++i) {
        const auto& e = m.edges[T.e[i]];
        EXPECT_TRUE(e.t[0] == t || e.t[1] == t) << "edge of " << t;
        auto [lo, hi] = std::minmax(T.v[(i + 1) % 3], T.v[(i + 2) % 3]);
        EXPECT_EQ(lo, e.v[0]);
        EXPECT_EQ(hi, e.v[1]);
        if (T.nb[i] >= 0) {
          bool back = false;
          for (int x : m.tris[T.nb[i]].nb) back |= x == t;
          EXPECT_TRUE(back) << "neighbour of " << t;
        }
        bool listed = false;
        for (int x : m.verts[T.v[i]].tris) listed |= x == t;
        EXPECT_TRUE(listed) << "vertex list of " << t;
      }
    }
  };
  check();
  size_t tris0 = m.tris.size(), edges0 = m.edges.size(), verts0 = m.verts.size();
  int t = m.locate(Vec2{20 * kNmPerMm, 10 * kNmPerMm});
  ASSERT_GE(t, 0);
  const auto& T = m.tris[t];
  Vec2 c = (m.verts[T.v[0]].p + m.verts[T.v[1]].p + m.verts[T.v[2]].p) / 3.0;
  int v = m.splitTriangle(t, c, topo::VKind::ViaSite);
  EXPECT_EQ(size_t(v), verts0);
  EXPECT_EQ(m.tris.size(), tris0 + 2);
  EXPECT_EQ(m.edges.size(), edges0 + 3);
  EXPECT_EQ(m.verts[v].tris.size(), 3u);
  check();
  // Splitting one of the new triangles again works too.
  int t2 = m.locate(c + Vec2{1, 1});
  ASSERT_GE(t2, 0);
  const auto& T2 = m.tris[t2];
  Vec2 c2 = (m.verts[T2.v[0]].p + m.verts[T2.v[1]].p + m.verts[T2.v[2]].p) / 3.0;
  m.splitTriangle(t2, c2, topo::VKind::ViaSite);
  check();
}

// A flexibly fixed net is left as it is: its wires stay where they are and are copper to route round, and the
// part of it that is not routed is not finished (TopoR: the autorouter does not change the topology of such
// nets, nor route them to the end). The same board with the fixation off is routed whole.
TEST(Router, FlexFixedNetIsLeftAsItIs) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  Board b = twoPads();
  const int nb = b.addNet("B");
  for (Vec2 at : {mm(20, 3), mm(20, 23), mm(30, 27)}) {
    Component c;
    c.ref = "K" + std::to_string(b.components.size());
    c.pos = Point(at);
    Pad p;
    p.number = "1";
    p.component = int(b.components.size());
    p.net = nb;
    p.shape.w = p.shape.h = mmToNm(1.6);
    p.drill = mmToNm(0.8);
    p.copper = b.allCopperMask();
    c.pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
    b.components.push_back(c);
    b.updatePadPositions(int(b.components.size()) - 1);
  }
  Track wall;  // B's first two pads joined across the way of A; its third pad left unrouted
  wall.a = Point(mm(20, 3));
  wall.b = Point(mm(20, 23));
  wall.width = mmToNm(0.3);
  wall.layer = b.topCopper();
  wall.net = nb;
  b.tracks.push_back(wall);
  auto ofB = [&](const Board& x) {
    std::vector<std::pair<Point, Point>> out;
    for (const Track& t : x.tracks)
      if (t.net == nb) out.push_back({t.a, t.b});
    return out;
  };
  auto unroutedOf = [&](const Board& x, int net) {
    int n = 0;
    for (const auto& r : Connectivity::compute(x).ratsnest) n += r.net == net;
    return n;
  };
  ASSERT_EQ(unroutedOf(b, nb), 1);
  topo::RouterOptions o;
  o.copperIndices = {0};
  {
    Board fixed = b;
    fixed.nets[size_t(nb)].flexFixed = true;
    fixed.nets[size_t(nb)].route = false;
    auto r = topo::routeBoard(fixed, o);
    EXPECT_EQ(r.connections, 1);  // A's only
    EXPECT_EQ(r.routed, 1);
    EXPECT_EQ(ofB(fixed), ofB(b));       // B's wire as it was
    EXPECT_EQ(unroutedOf(fixed, nb), 1);  // ... and its third pad still unrouted
    EXPECT_EQ(unroutedOf(fixed, b.findNet("A")), 0);
    EXPECT_EQ(clearanceViolations(fixed), 0);
  }
  {
    Board free = b;
    auto r = topo::routeBoard(free, o);
    EXPECT_EQ(r.connections, 3);
    EXPECT_EQ(unroutedOf(free, nb), 0);
  }
}
