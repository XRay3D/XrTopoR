#include <gtest/gtest.h>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/Optimizer.h"
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
