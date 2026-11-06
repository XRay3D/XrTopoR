#include <gtest/gtest.h>

#include <cstdio>
#include <print>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "router/topo/Optimizer.h"
#include "router/topo/Wires.h"
#include "router/topo/Refine.h"
#include "topo/RelayStats.h"

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

// F5 on the model, the realiser fed from the model: a fixed point — a board re-laid from its own result
// comes out the same (the same violations, the length within half a millimetre). The violations are those
// of F5 on the tracks (arz_2L 9, arz_4L 10) or a few more (Arcs_master 22 against 18, local stacking
// defects at the QFP still to be found).
TEST(Realizer, ModelReshapeIsAFixedPoint) {
  struct Expect { const char* file; int conflicts; };
  for (Expect x : {Expect{"topor/Example_03/arz_2L.fst", 9}, Expect{"topor/Example_03/arz_4L.fst", 10}, Expect{"topor/Example_04/Arcs_master.pcb", 22}}) {
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
      for (const topo::Violation& v : res.violations)
        if (v.kind != topo::Violation::Kind::Overflow)
          std::println("{} pass {}: violation kind {} at ({:.3f},{:.3f}) wire {} net {}", name, pass, int(v.kind), v.pos.x / 1e6, v.pos.y / 1e6, v.wireA,
                       v.wireA >= 0 ? b.nets[t.wires[v.wireA].net].name : "-");
      ASSERT_TRUE(res.drawn) << name << " pass " << pass;
      conflictsAt.push_back(conflicts(b));
      lengthAt.push_back(length(b));
    }
    std::println("{}: conflicts {} {} {}, length {:.1f} {:.1f} {:.1f} mm", name, conflictsAt[0], conflictsAt[1], conflictsAt[2], lengthAt[0] / 1e6,
                 lengthAt[1] / 1e6, lengthAt[2] / 1e6);
    EXPECT_LE(conflictsAt[0], x.conflicts) << name;
    EXPECT_EQ(conflictsAt[1], conflictsAt[0]) << name;
    EXPECT_EQ(conflictsAt[2], conflictsAt[1]) << name;
    EXPECT_NEAR(lengthAt[2], lengthAt[1], 0.5 * kNmPerMm) << name;
    EXPECT_NEAR(lengthAt[1], lengthAt[0], 0.5 * kNmPerMm) << name;
  }
}

// F7 on the model: the vias and branch points go down the gradient of the drawn length (the wires' pull at
// their ends and their push at their bends, taken from the realiser's drawing), every iteration judged by the
// drawing. Never worse than F5 from the model (the best drawing is kept), nothing lost, the mesh whole; and
// the wires are pulled taut: Arcs_master 22 -> 4 violations and 6405.6 -> 6200.8 mm (TopoR's own F7 of that
// board: 6245.4 mm at its nominal clearance), the forces left on the objects halved (248 -> 117; TopoR's F7
// leaves 125 by the same measure), arz_2L 9 -> 5 and 24 mm shorter (its branch points merged into their pads,
// the wires led from the pads' centres again).
TEST(Optimizer, ModelRelaxDoesNotBreak) {
  // gain: mm the drawing gets shorter by, at least; force: what is left of the forces on the objects, at most
  // (arz_2L: its vias stand against the pads of their own nets, pulled into them and held off).
  struct Expect { const char* file; int f5; int conflicts; double gain; double force; };
  for (Expect x : {Expect{"topor/Example_04/Arcs_master.pcb", 22, 5, 150, 0.6}, Expect{"topor/Example_03/arz_2L.fst", 9, 6, 15, 0.9}}) {
    auto lb = io::loadBoard(data(x.file));
    ASSERT_TRUE(lb.has_value()) << x.file;
    Board& b = **lb;
    size_t unrouted = Connectivity::compute(b).ratsnest.size();
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto res = topo::optimizeModel(b, t);
    ASSERT_TRUE(res.drawn) << x.file;
    std::println("{}: F7 model {} iterations, {} drawings ({} rolled back), {} vias and {} branch points moved, conflicts {} -> {}, length {:.1f} -> {:.1f} mm, forces {:.1f} -> {:.1f}",
                 x.file, res.iterations, res.drawings, res.rollbacks, res.viaMoves, res.junctionMoves, res.conflictsBefore, res.conflictsAfter, res.lengthBefore / 1e6,
                 length(b) / 1e6, res.forceBefore, res.forceAfter);
    EXPECT_LE(res.conflictsBefore, x.f5) << x.file;
    EXPECT_LE(conflicts(b), x.conflicts) << x.file;
    EXPECT_LE(conflicts(b), res.conflictsBefore) << x.file;
    EXPECT_LT(res.lengthAfter, res.lengthBefore - x.gain * kNmPerMm) << x.file;
    EXPECT_LT(res.forceAfter, res.forceBefore * x.force) << x.file;
    EXPECT_LE(Connectivity::compute(b).ratsnest.size(), unrouted) << x.file;
    EXPECT_EQ(t.check(), std::vector<std::string>{}) << x.file;
  }
}

// F6 keeps what F5 drew at the pads and at the joints (TopoR's F6 touches neither): after F5 on the model
// and F6 Arcs_standard_routing has its two widths and no neck, every wire at the centre of its pad and no
// wire's end left inside a pad off the centre (the lead of a re-laid chain goes with it: the realiser
// draws a new one), one exit through a long side (D1-30, drawn so) and the width joints where they were.
TEST(Refine, KeepsWidthsAndExits) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_standard_routing.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(topo::runF5Model(b, t).drawn);
  const auto f5 = topo::relayStats(b);
  const int c5 = conflicts(b);
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  auto r = topo::refine(b);
  const auto s = topo::relayStats(b);
  std::println("F5 on the model {} conflicts, F6 {} ({} of {} wires re-laid)\n{}", c5, conflicts(b), r.improved, r.wires, s.text());
  EXPECT_GT(r.improved, 0);
  EXPECT_LE(conflicts(b), c5);
  EXPECT_LE(Connectivity::compute(b).ratsnest.size(), unrouted);
  EXPECT_EQ(s.widths.size(), 2u) << "0.3 and 0.8 mm and no other";
  EXPECT_EQ(s.necks, 0);
  EXPECT_EQ(s.padsAtCentre, s.pads);
  EXPECT_EQ(s.viasAtCentre, s.vias);
  EXPECT_EQ(s.deadEnds, 0);
  EXPECT_EQ(s.exitsSide, f5.exitsSide);
  EXPECT_EQ(s.exitsBridge, f5.exitsBridge);
  EXPECT_EQ(s.innerOther, 0);
  EXPECT_EQ(s.jointVia, f5.jointVia);
  EXPECT_EQ(s.jointPad, f5.jointPad);
  EXPECT_EQ(s.jointSeries, f5.jointSeries);
  EXPECT_EQ(s.jointBranch, f5.jointBranch);
  EXPECT_EQ(s.jointInCopper, 0);
  EXPECT_EQ(s.tees, 0);
}

// TopoR's rules at the pads, measured on its own F5, F6 and F7 of Arcs_standard_routing (xrtopor-cli
// padstats gives the same numbers for its three files): no wire narrower than drawn; every wire at the
// centre of its pad or via and none ending in copper off the centre; the pins left through their ends
// (109), but for the one dog-leg another wire runs round (D1-30) and the four bridges to the pin beside;
// no vertex inside a pad off the pattern; the widths joined end to end — 3 at via centres, 1 at a pad's
// centre, 2 in series, 5 at branches — and never on a track's inside. Ours after F5 on the tracks, F5 on
// the model and F7 on the model.
TEST(Realizer, ArcsFollowsToporPadRules) {
  auto rules = [](const Board& b, int narrowed, const char* how) {
    const auto s = topo::relayStats(b);
    SCOPED_TRACE(std::string(how) + "\n" + s.text());
    EXPECT_EQ(narrowed, 0);
    EXPECT_EQ(s.widths.size(), 2u);
    EXPECT_EQ(s.necks, 0);
    EXPECT_EQ(s.padsAtCentre, s.pads);
    EXPECT_EQ(s.viasAtCentre, s.vias);
    EXPECT_EQ(s.deadEnds, 0);
    EXPECT_EQ(s.exitsEnd, 109);
    EXPECT_EQ(s.exitsSide, 1);
    EXPECT_EQ(s.exitsBridge, 4);
    EXPECT_EQ(s.innerOther, 0);
    EXPECT_EQ(s.jointVia, 3);
    EXPECT_EQ(s.jointPad, 1);
    EXPECT_EQ(s.jointSeries, 2);
    EXPECT_EQ(s.jointBranch, 5);
    EXPECT_EQ(s.jointInCopper, 0);
    EXPECT_EQ(s.tees, 0);
  };
  {
    auto lb = io::loadBoard(data("topor/Example_04/Arcs_standard_routing.fst"));
    ASSERT_TRUE(lb.has_value());
    Board& b = **lb;
    auto st = topo::reshapeTracks(b, std::vector<char>(b.tracks.size(), 1));
    rules(b, st.narrowedWires, "F5 on the tracks");
  }
  {
    auto lb = io::loadBoard(data("topor/Example_04/Arcs_standard_routing.fst"));
    ASSERT_TRUE(lb.has_value());
    Board& b = **lb;
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto f5 = topo::runF5Model(b, t);
    ASSERT_TRUE(f5.drawn);
    rules(b, f5.stats.narrowedWires, "F5 on the model");
    auto f7 = topo::optimizeModel(b, t);
    ASSERT_TRUE(f7.drawn);
    rules(b, 0, "F7 on the model");
    for (const Track& tr : b.tracks) EXPECT_TRUE(tr.width == mmToNm(0.3) || tr.width == mmToNm(0.8)) << "F7 narrowed a track to " << tr.width;
  }
}
