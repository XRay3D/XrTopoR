#include <gtest/gtest.h>

#include <cstdio>
#include <print>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/ModelTools.h"
#include "router/topo/Optimizer.h"
#include "router/topo/Wires.h"
#include "router/topo/Refine.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

int conflicts(const Board& b) {
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  return int(runDrc(b, o).size());
}

double length(const Board& b) { return b.tracksLength(); }

}  // namespace

// F6 on routed boards: the routing gets shorter, stays connected and gains no conflicts.
TEST(Refine, ShorterWithoutNewConflicts) {
  for (const char* file : {"topor/Example_05/MinVia_standard_routing.fst", "adg508f_tester_v11.kicad_pcb"}) {
    SCOPED_TRACE(file);
    auto lb = io::loadBoard(data(file));
    ASSERT_TRUE(lb);
    Board& b = **lb;
    size_t unrouted = Connectivity::compute(b).ratsnest.size();
    int c0 = conflicts(b);
    double l0 = length(b);
    size_t v0 = b.vias.size();
    auto r = topo::refine(b);
    std::printf("%s: %d wires, %d shorter (%d to another layer), vias %zu -> %zu (-%d), length %.1f -> %.1f mm, conflicts %d -> %d, %.2f s\n",
                file, r.wires, r.improved, r.layerChanges, v0, b.vias.size(), r.viasRemoved, l0 / 1e6, length(b) / 1e6, c0,
                conflicts(b), r.seconds);
    EXPECT_LE(length(b), l0);
    EXPECT_LE(conflicts(b), c0);
    EXPECT_LE(Connectivity::compute(b).ratsnest.size(), unrouted);
  }
}

// A whole-board F5 of an F5 result lays the wires where they are: the realiser's own short tangents do
// not cut the chains at the next pass, and the radii of one wire's several passes around an obstacle
// do not mix (arz_2L: 11 -> 45 -> 108 -> 132 violations before).
TEST(Realizer, ReshapeIsAFixedPoint) {
  for (const char* name : {"topor/Example_03/arz_2L.fst", "topor/Example_03/arz_4L.fst",
                           "topor/Example_03/arz_standard_routing.fst", "topor/Example_04/Arcs_master.pcb"}) {
    SCOPED_TRACE(name);
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value());
    Board& b = **lb;
    int was = 0;
    double wasLength = 0;
    for (int pass = 0; pass < 3; ++pass) {
      topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
      int now = conflicts(b);
      double len = length(b);
      if (pass > 0) {
        EXPECT_EQ(now, was) << "pass " << pass;
        EXPECT_NEAR(len, wasLength, 0.5 * kNmPerMm) << "pass " << pass;
      }
      was = now;
      wasLength = len;
    }
    EXPECT_LE(was, 18);
  }
}

// The same with the junctions settling, as F5 runs: their moves survive the next whole re-lay.
TEST(Realizer, SettledReshapeIsAFixedPoint) {
  for (const char* name : {"topor/Example_03/arz_2L.fst", "topor/Example_03/arz_4L.fst", "topor/Example_03/arz_standard_routing.fst"}) {
    SCOPED_TRACE(name);
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value());
    Board& b = **lb;
    int was = 0;
    for (int pass = 0; pass < 3; ++pass) {
      topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
      topo::settleJunctions(b);
      int now = conflicts(b);
      if (pass > 0) {
        EXPECT_EQ(now, was) << "pass " << pass;
      }
      was = now;
    }
  }
}

// The relaxation takes the vias off the pads they are too close to (P-CAD's fanouts on Arcs_master are
// 0.1-0.2 mm short of the clearance around the QFP), without a connection lost.
TEST(Optimizer, RelaxationClearsViasOffPads) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  double before = length(b);
  topo::OptimizeOptions o;
  o.relax = true;
  topo::optimize(b, o);
  EXPECT_LE(conflicts(b), 4);
  EXPECT_LT(length(b), before);
  EXPECT_LE(Connectivity::compute(b).ratsnest.size(), unrouted);
  DrcOptions d;
  d.unconnected = false;
  for (const DrcViolation& v : runDrc(b, d)) EXPECT_LT(v.required - v.actual, 50000.0) << v.message;
}

// F5 on the model draws the reference boards no worse than F5 on the tracks (arz_2L apart). Not a fixed
// point yet: the realiser reads the order of the wires and their exits from the pads out of the sketch
// again, and a board re-laid from its own result gathers a few violations per pass (arz_2L 16, 21, 42) —
// what passing the model's crossings to the realiser directly is for.
TEST(Realizer, ModelReshapeDrawsTheReferenceBoards) {
  struct Expect { const char* file; int conflicts; };
  for (Expect x : {Expect{"topor/Example_03/arz_2L.fst", 16}, Expect{"topor/Example_03/arz_4L.fst", 10}, Expect{"topor/Example_04/Arcs_master.pcb", 18}}) {
    const char* name = x.file;
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb.has_value()) << name;
    Board& b = **lb;
    std::vector<int> conflictsAt;
    std::vector<double> lengthAt;
    for (int pass = 0; pass < 3; ++pass) {
      topo::Topology::assignIds(b);
      topo::Topology t;
      t.build(b);
      auto res = topo::runF5Model(b, t);
      ASSERT_TRUE(res.drawn) << name << " pass " << pass;
      conflictsAt.push_back(conflicts(b));
      lengthAt.push_back(length(b));
    }
    std::println("{}: conflicts {} {} {}, length {:.1f} {:.1f} {:.1f} mm", name, conflictsAt[0], conflictsAt[1], conflictsAt[2], lengthAt[0] / 1e6,
                 lengthAt[1] / 1e6, lengthAt[2] / 1e6);
    EXPECT_LE(conflictsAt[0], x.conflicts) << name;
  }
}
