#include <gtest/gtest.h>

#include <cstdio>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/Realizer.h"
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

double length(const Board& b) {
  double l = 0;
  for (auto& t : b.tracks)
    l += t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : (t.b.v() - t.a.v()).len();
  return l;
}

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
