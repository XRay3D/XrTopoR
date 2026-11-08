// The new autorouter (router/auto): the combined plane, the layering, the metric stage on the model.
#include <gtest/gtest.h>

#include "core/BoardGen.h"
#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "router/auto/AutoRouter.h"
#include "router/auto/Layering.h"

using namespace xr;

namespace {

size_t violations(const Board& b) {
  DrcOptions d;
  d.unconnected = false;
  return runDrc(b, d).size();
}

}  // namespace

// Two points crossing must take different layers; a wire's two points one layer when nothing forces them apart.
TEST(Autoroute, LayeringKeepsCrossingsApartWithFewVias) {
  autoroute::LayerProblem p;
  p.vars = 4;  // wire A: points 0, 1; wire B: 2; wire C: 3
  p.same = {{0, 1}};
  p.differ = {{0, 2}, {1, 3}};
  auto r = autoroute::solveLayers(p);
  EXPECT_EQ(r.conflicts, 0);
  EXPECT_EQ(r.vias, 0);  // A on one layer, B and C on the other
  EXPECT_NE(r.layer[0], r.layer[2]);
  EXPECT_NE(r.layer[1], r.layer[3]);
  // B and C on the same pad layer as A's ends would force a via on A.
  p.ends = {{2, 1u}, {3, 2u}};  // B pinned to layer 0, C to layer 1
  r = autoroute::solveLayers(p);
  EXPECT_EQ(r.conflicts, 0);
  EXPECT_EQ(r.vias, 1);  // A changes layer between its two crossings
}

// An odd cycle of crossings cannot be layered on two layers: reported, not hidden.
TEST(Autoroute, OddCycleIsAConflict) {
  autoroute::LayerProblem p;
  p.vars = 3;
  p.differ = {{0, 1}, {1, 2}, {2, 0}};
  EXPECT_EQ(autoroute::solveLayers(p).conflicts, 1);
}

// A plain bus is laid on one plane without crossings; a bus whose order is reversed at one end crosses itself all
// over the plane, is layered with vias and drawn without a violation.
TEST(Autoroute, BusesStraightAndTwisted) {
  for (const char* kind : {"bus_straight", "bus_twisted"}) {
    auto b = makeBusBoard(kind, 8);
    ASSERT_TRUE(b) << kind;
    auto r = autoroute::route(*b);
    EXPECT_EQ(r.failed, 0) << kind;
    EXPECT_EQ(r.conflicts, 0) << kind;
    EXPECT_EQ(Connectivity::compute(*b).ratsnest.size(), 0u) << kind;
    EXPECT_EQ(violations(*b), 0u) << kind;
    if (std::string_view(kind) == "bus_straight") {
      EXPECT_EQ(r.crossings, 0);
      EXPECT_EQ(r.vias, 0);
    } else {
      EXPECT_GT(r.crossings, 0);
    }
  }
}
