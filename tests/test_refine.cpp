#include <gtest/gtest.h>

#include <algorithm>

#include <cstdio>
#include <print>
#include <string_view>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/ModelRefine.h"
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
    // Arcs_master: 26 records, 13 of them one place (AD0 between the via of ADR21 and the pad D1-30, 0.016 mm
    // short of the rule at both, as TopoR's F5 draws it: the deficit shared, the wire in short arcs there).
    EXPECT_LE(was, std::string_view(name).ends_with(".pcb") ? 26 : 18);
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
// of F5 on the tracks (arz_2L 9, arz_4L 10) or a few more (Arcs_master 32 against 26: local stacking
// defects at the QFP still to be found; 13 of the records are one place, AD0 between the via of ADR21 and the
// pad D1-30, where two bends of opposite sense overlap and both shrink until the circles touch, the deficit
// shared as TopoR's F5 has it: 0.284 and 0.268 against its 0.283 and 0.267). With the nominal clearance
// kept from round copper (the arz boards' rules: 0.2 / 0.3) arz_4L has 13: one bend of net 84 round a via,
// the outer of two wires there, is dropped where its radius grew (3 records of one place, 0.066 mm deep); 10
// at the minimum.
TEST(Realizer, ModelReshapeIsAFixedPoint) {
  struct Expect { const char* file; int conflicts; };
  for (Expect x : {Expect{"topor/Example_03/arz_2L.fst", 9}, Expect{"topor/Example_03/arz_4L.fst", 13}, Expect{"topor/Example_04/Arcs_master.pcb", 32}}) {
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
// the wires are pulled taut: Arcs_master 32 -> 4 violations and 6405.6 -> 6200.6 mm (TopoR's own F7 of that
// board: 6245.4 mm at its nominal clearance), the forces left on the objects halved (248 -> 117; TopoR's F7
// leaves 125 by the same measure), arz_2L 9 -> 5 and 24 mm shorter (its branch points merged into their pads,
// the wires led from the pads' centres again).
TEST(Optimizer, ModelRelaxDoesNotBreak) {
  // gain: mm the drawing gets shorter by, at least; force: what is left of the forces on the objects, at most
  // (arz_2L: its vias stand against the pads of their own nets, pulled into them and held off, and — its rules
  // have a nominal clearance, 0.2 / 0.3 — stop where their wires would lose the nominal's room: 7 mm gained
  // where 24 were with the stop at the minimum; Arcs_master.pcb has the one clearance).
  struct Expect { const char* file; int f5; int conflicts; double gain; double force; };
  for (Expect x : {Expect{"topor/Example_04/Arcs_master.pcb", 32, 5, 150, 0.6}, Expect{"topor/Example_03/arz_2L.fst", 9, 6, 5, 0.97}}) {
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

// F6 on the model: the wires re-laid by cheaper paths over the triangulation (TopoR's re-laying; its own F6 of
// Arcs_standard_routing takes 63 mm with 28 wires moved to the other side of other nets' pads, 8 branch
// points moved and no via). Ours after F5 on the model (which has taken the branch points to their balance
// already): 19 wires re-laid — the same nets — 43 mm shorter, no place of violation added; no wire is led past
// a via that still stands too close to a pad (F7 has to take it off, and after an F6 that used that room it
// was left with 5 deep violations for 2); the model whole (its invariants, no wires crossing), and what F5
// drew at the pads and the width joints kept.
TEST(Refine, ModelRelaysTheLongWaysRound) {
  auto lb = io::loadBoard(data("topor/Example_04/Arcs_standard_routing.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  auto f5 = topo::runF5Model(b, t);
  ASSERT_TRUE(f5.drawn);
  const size_t unrouted = Connectivity::compute(b).ratsnest.size();
  const topo::RelayStats s5 = topo::relayStats(b);
  const topo::DrawingScore before = topo::scoreDrawing(b);
  auto res = topo::refineModel(b, t);
  ASSERT_TRUE(res.drawn);
  const topo::DrawingScore after = topo::scoreDrawing(b);
  std::println("F6 model: {} wires tried, {} found, {} re-laid ({} in a clinch), {} vias removed, {} branch points made, {} moved, {} drawings; places {} -> {}, "
               "length {:.1f} -> {:.1f} mm",
               res.wires, res.found, res.relaid, res.clinches, res.viasRemoved, res.branches, res.junctionMoves, res.drawings, before.places, after.places,
               before.length / 1e6, after.length / 1e6);
  EXPECT_GE(res.relaid, 15);
  EXPECT_GE(res.clinches, 1);  // DCLO with RPLY
  // The vias that need not be (ModelVias.h): the pair of SD3 at (218.55, 46.3) and (221.65, 46.3) — TopoR's own
  // F6 takes the first of the two — and three more next to through pins.
  EXPECT_GE(res.viasRemoved, 3);
  EXPECT_EQ(after.vias, before.vias - res.viasRemoved);
  const int sd3 = b.findNet("SD3");
  ASSERT_GE(sd3, 0);
  EXPECT_EQ(std::ranges::count_if(b.vias, [&](const Via& v) { return v.net == sd3; }), 0);
  EXPECT_LT(after.length, before.length - 35 * kNmPerMm);
  EXPECT_LE(after.real, before.real);
  EXPECT_LE(after.shorts, before.shorts);
  EXPECT_LE(Connectivity::compute(b).ratsnest.size(), unrouted);
  EXPECT_EQ(t.check(), std::vector<std::string>{});
  for (const topo::LayerMesh& m : t.layers) EXPECT_TRUE(t.findCrossings(m).empty());
  const topo::RelayStats s = topo::relayStats(b);
  EXPECT_EQ(s.widths.size(), 2u);
  EXPECT_EQ(s.necks, 0);
  EXPECT_EQ(s.deadEnds, 0);
  EXPECT_EQ(s.padsAtCentre, s.pads);
  EXPECT_EQ(s.viasAtCentre, s.vias);
  EXPECT_EQ(s.exitsSide, s5.exitsSide);
  EXPECT_EQ(s.exitsBridge, s5.exitsBridge);
  EXPECT_EQ(s.innerOther, 0);
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

// A wire between two pads of a DIP at what the rules take exactly, with a wire of another net between it and
// the one pad: the circles the realiser bends it round touch (MinVia_standard_routing, D4 between U7-3 of
// PA1 and U7-4, 1.016 + 1.524 = the pitch of 2.54). The tangent between two touching circles is the line
// across the point of touching; it used to be no tangent, the bends were dropped and D4 drawn through the
// pad of PA1 (and D0 through the pad of WR): shorts F5 made, that F7 then stopped at, marked 7 mm away.
TEST(Refine, WireBetweenTwoPadsAtTheRulesExactly) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  ASSERT_EQ(conflicts(b), 0) << "the drawing fits the rules";
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(topo::runF5Model(b, t).drawn);
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  int shorts = 0;
  for (const DrcViolation& v : runDrc(b, o))
    if (v.type == DrcViolation::Type::Short) {
      ++shorts;
      std::println("short: {} at ({:.3f}, {:.3f})", v.message, v.pos.x / 1e6, v.pos.y / 1e6);
    }
  EXPECT_EQ(shorts, 0);
  // D4 passes between the two pads as it was drawn: 1.016 mm from U7-3 at (196.85, 222.504) of the file.
  const Vec2 pa1{196.85 * kNmPerMm, -222.504 * kNmPerMm};
  const int d4 = b.findNet("D4");
  ASSERT_GE(d4, 0);
  double nearest = 1e18;
  for (const Track& tr : b.tracks)
    if (tr.net == d4 && b.layers[tr.layer].name == "Bottom") {
      const Polyline path = tr.path();
      for (size_t i = 0; i + 1 < path.size(); ++i) nearest = std::min(nearest, distPointSegment(pa1, path[i], path[i + 1]));
    }
  EXPECT_NEAR(nearest, 1.016 * kNmPerMm, 0.01 * kNmPerMm);
  // The model built from the drawing stands: F7 has something to work on.
  topo::Topology t2;
  t2.build(b);
  int flips = 0;
  std::vector<topo::Violation> vs;
  EXPECT_TRUE(topo::prepareModel(t2, false, false, flips, vs));
  for (const DrcViolation& v : topo::topologyViolations(b, t2, vs)) std::println("{} at ({:.3f}, {:.3f})", v.message, v.pos.x / 1e6, v.pos.y / 1e6);
}

// A keepout area over a bus (Placement_standard_routing: 5 x 3 mm across three tracks on Top, two of them
// 1.5 mm wide, and two on Bottom, no pad or via within 1.3 mm) empties on F5 by the model: every wire goes
// round, the wide ones first, the last squeezed in with its width narrowed where there is no other way;
// the board's own 10 clearance violations stay what they were, no short. TopoR leaves the error 5031.
TEST(Refine, PlacementWithAKeepoutOverTracks) {
  auto lb = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  auto count = [&](DrcViolation::Type kind) {
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    int n = 0;
    for (const DrcViolation& v : runDrc(b, o)) n += v.type == kind;
    return n;
  };
  auto f5 = [&] {
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    auto res = topo::runF5Model(b, t);
    EXPECT_TRUE(res.drawn);
    for (const topo::Violation& v : res.violations) EXPECT_NE(v.kind, topo::Violation::Kind::Blocked) << "no way round";
  };
  Board clean = b;
  f5();
  const int clearances = count(DrcViolation::Type::Clearance);
  b = clean;
  Keepout k;
  Graphic g;
  g.kind = GraphicKind::Poly;
  for (auto [x, y] : {std::pair{130.0, 95.0}, {135.0, 95.0}, {135.0, 98.0}, {130.0, 98.0}}) g.pts.push_back({x * kNmPerMm, -y * kNmPerMm});
  k.shape.push_back(g);
  b.keepouts.push_back(k);
  EXPECT_EQ(count(DrcViolation::Type::Keepout), 5) << "drawn through";
  f5();
  EXPECT_EQ(count(DrcViolation::Type::Keepout), 0);
  EXPECT_EQ(count(DrcViolation::Type::Short), 0);
  EXPECT_LE(count(DrcViolation::Type::Clearance), clearances + 3) << clearances << " without the keepout";
}

// SingleLayer is a ring: TopoR wrote its hole as a second circle of the outline's Contour (as arz's Specctra
// signal boundary is, with all the copper inside it: not a hole). With the hole known, F5 on the model keeps
// every wire the clearance to the board edge off it (the wire of NET00015 along its bottom used to come
// 0.13 mm inside). A track drawn by hand across the hole, from VD3-3 to R8-1 of NET00015, finds no way round
// (the net's own wire runs along the hole there, no room for a second beside it on the one layer) and is
// reported, not drawn into the hole.
TEST(Refine, SingleLayerHoleIsACutout) {
  auto lb = io::loadBoard(data("topor/Example_01/SingleLayer.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  ASSERT_EQ(b.outline.size(), 2u) << "the hole";
  const Vec2 centre{13.975 * kNmPerMm, -14.141 * kNmPerMm};
  const double hole = 6.985 * kNmPerMm;
  auto nearestCopper = [&](int net) {
    double nearest = 1e18;
    for (const Track& tr : b.tracks) {
      if (net >= 0 && tr.net != net) continue;
      const Polyline path = tr.path();
      for (size_t i = 0; i + 1 < path.size(); ++i) nearest = std::min(nearest, distPointSegment(centre, path[i], path[i + 1]) - tr.width / 2.0);
    }
    return nearest;
  };
  auto f5 = [&] {
    topo::Topology::assignIds(b);
    topo::Topology m;
    m.build(b);
    return topo::runF5Model(b, m);
  };
  ASSERT_TRUE(f5().drawn);
  EXPECT_GE(nearestCopper(-1), hole + b.edgeClearance - 0.005 * kNmPerMm) << "the edge clearance off the hole";
  const int net = b.findNet("NET00015");
  ASSERT_GE(net, 0);
  Track t;
  t.a = Point(Vec2{9.8077 * kNmPerMm, -7.7011 * kNmPerMm});
  t.b = Point(Vec2{22.9413 * kNmPerMm, -10.9147 * kNmPerMm});
  t.width = mmToNm(0.4);
  t.layer = b.topCopper();
  t.net = net;
  b.tracks.push_back(t);
  auto res = f5();
  ASSERT_TRUE(res.drawn);
  int blocked = 0;
  for (const topo::Violation& v : res.violations) blocked += v.kind == topo::Violation::Kind::Blocked;
  EXPECT_EQ(blocked, 1) << "the hand-drawn track across the hole is reported";
}

// A board with poured planes (Signals: 7 zones of 6 power nets on INT_PWR, every connection made through
// them) keeps them through F5 on the model: the fills used to be dropped on every layer drawn on, and 73
// connections came out unrouted.
TEST(Refine, SignalsKeepsItsPlanes) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  ASSERT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(topo::runF5Model(b, t).drawn);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  EXPECT_EQ(conflicts(b), 0);
}

// The wires widened past what the layout has room for (MinVia_standard_routing with every track 0.4 mm wide
// in a layout drawn at 0.254: 756 clearance violations, none of them a short) are laid tight, the deficit
// shared, as TopoR draws it: no wire through a pad and no loop. Three things used to go wrong: a bend round
// the wire's own end (another wire's arc round that pad), a bend dropped where two circles overlapped by more
// than a hairline (the wire then through the pad, or 276 degrees round the next), and a chord near one end
// of a pad's side blamed on the side's other corner (277 degrees round it): 127 shorts after F5, A3 286
// degrees round the pad of A2.
TEST(Realizer, WidenedWiresAreLaidTight) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb.has_value());
  Board& b = **lb;
  for (Track& tr : b.tracks) tr.width = mmToNm(0.4);
  topo::Topology::assignIds(b);
  topo::Topology t;
  t.build(b);
  ASSERT_TRUE(topo::runF5Model(b, t).drawn);
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  int shorts = 0, clearances = 0;
  for (const DrcViolation& v : runDrc(b, o)) {
    if (v.type == DrcViolation::Type::Short) {
      ++shorts;
      std::println("short: {} at ({:.3f}, {:.3f})", v.message, v.pos.x / 1e6, v.pos.y / 1e6);
    } else {
      ++clearances;
    }
  }
  std::println("widened MinVia_standard_routing after F5: {} clearance violations, {} shorts", clearances, shorts);
  EXPECT_LE(shorts, 2) << "one of 0.014 mm between two tracks of a tight stack is known";
  // No loop: an arc of more than 240 degrees (the U-turns of the layout round a pin are 210-216).
  int loops = 0;
  for (const Track& tr : b.tracks) {
    if (!tr.isArc()) continue;
    const ArcGeom g = ArcGeom::fromThreePoints(tr.a.v(), tr.mid->v(), tr.b.v());
    if (g.valid && std::abs(g.sweep) > 240.0 * kPi / 180.0) {
      ++loops;
      std::println("loop: {} degrees of {} at ({:.2f}, {:.2f})", std::abs(g.sweep) * 180.0 / kPi, b.nets[tr.net].name, g.center.x / 1e6, g.center.y / 1e6);
    }
  }
  EXPECT_EQ(loops, 0);
}
