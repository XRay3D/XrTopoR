#include <gtest/gtest.h>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
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
