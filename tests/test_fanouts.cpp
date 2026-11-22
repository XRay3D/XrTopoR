#include <gtest/gtest.h>

#include <cmath>
#include <map>

#include "core/Connectivity.h"
#include "core/Edit.h"
#include "core/Fanouts.h"
#include "core/ZoneFill.h"
#include "drc/Drc.h"
#include "geom/Ranges.h"
#include "io/BoardIO.h"
#include "router/topo/TopoRouter.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }
Vec2 mm(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }

// A board of two copper layers, 40 × 40 mm, the class: wire 0.15, clearance 0.1, via 0.45 / 0.2.
struct Bed {
  Board b;
  LayerId top, bot;
  Bed() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    b.layers[top].copperIndex = 0;
    b.layers[bot].copperIndex = 1;
    b.netClasses[0].trackWidth = mmToNm(0.15);
    b.netClasses[0].clearance = mmToNm(0.1);
    b.netClasses[0].viaDiameter = mmToNm(0.45);
    b.netClasses[0].viaDrill = mmToNm(0.2);
    b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 40), mm(0, 40)});
  }
  int component(const char* ref, Vec2 at, double angle = 0) {
    Component c;
    c.ref = ref;
    c.pos = Point(at);
    c.angle = angle;
    b.components.push_back(c);
    return int(b.components.size()) - 1;
  }
  // A planar pad of the component at `local` of its frame: round of diameter w, or a w × h rectangle.
  int pad(int comp, Vec2 local, double w, double h, LayerId layer, const std::string& net, bool round = true) {
    Pad p;
    p.number = std::to_string(b.components[size_t(comp)].pads.size() + 1);
    p.component = comp;
    p.net = net.empty() ? kNoNet : b.addNet(net);
    p.pos = Point(b.components[size_t(comp)].toBoard(local));
    p.angle = b.components[size_t(comp)].angle;
    p.shape.kind = round ? PadShapeKind::Circle : PadShapeKind::Rect;
    p.shape.w = mmToNm(w);
    p.shape.h = mmToNm(h);
    p.copper = LayerMask(1) << layer;
    b.components[size_t(comp)].pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
    return int(b.pads.size()) - 1;
  }
  // A BGA of n × n balls of 0.4 mm at a pitch of 1 mm round the component's origin, every ball its own net.
  int bga(const char* ref, Vec2 at, int n, double angle = 0) {
    const int c = component(ref, at, angle);
    for (int j = 0; j < n; ++j)
      for (int i = 0; i < n; ++i) pad(c, mm(i - (n - 1) / 2.0, j - (n - 1) / 2.0), 0.4, 0.4, top, std::string(ref) + "_" + std::to_string(i) + "_" + std::to_string(j));
    return c;
  }
  // Clearance violations and shorts (the nets are not routed: those are not counted).
  size_t faults() const {
    const auto v = runDrc(b, {});
    return size_t(r::count_if(v, [](const DrcViolation& x) { return x.type == DrcViolation::Type::Clearance || x.type == DrcViolation::Type::Short; }));
  }
};

}  // namespace

// A regular BGA: every pad but those of the two outer rows gets a via in the middle of the cell that lies away
// from the component's centre, joined to it by one straight track on the pad's layer; nothing breaks the
// clearances. Turned by any angle the BGA gets the same. Done again, nothing is added.
TEST(Fanout, RegularGridByQuadrants) {
  for (double angle : {0.0, 30.0}) {
    Bed t;
    const int u = t.bga("U1", mm(20, 20), 10, angle);
    Board& b = t.b;
    ASSERT_TRUE(isBga(b, u));
    const FanoutResult res = placeFanouts(b);
    EXPECT_EQ(res.components, 1) << angle;
    EXPECT_EQ(res.vias, 36) << angle << ": the 6 × 6 inner pads";
    EXPECT_EQ(res.pads, 36);
    EXPECT_TRUE(res.blocked.empty());
    ASSERT_EQ(b.vias.size(), 36u);
    ASSERT_EQ(b.tracks.size(), 36u);
    EXPECT_EQ(t.faults(), 0u) << angle;
    const Component& c = b.components[size_t(u)];
    int inner = 0;
    for (int pi : c.pads) {
      const Pad& p = b.pads[size_t(pi)];
      const Vec2 local = c.toLocal(p.pos.v());
      const bool outer = std::abs(local.x) > 2.6 * kNmPerMm || std::abs(local.y) > 2.6 * kNmPerMm;
      const int vi = fanoutViaOf(b, pi);
      if (outer) {
        EXPECT_EQ(vi, -1) << "a pad of the two outer rows";
        continue;
      }
      ++inner;
      ASSERT_GE(vi, 0) << angle;
      EXPECT_EQ(fanoutPadOf(b, vi), pi);
      const Via& v = b.vias[size_t(vi)];
      EXPECT_EQ(v.net, p.net);
      EXPECT_EQ(v.layers, b.allCopperMask());
      EXPECT_FALSE(v.locked);
      // Half a pitch along each axis of the lattice, away from the centre.
      const Vec2 off = c.toLocal(v.pos.v()) - local;
      EXPECT_NEAR(off.x, (local.x > 0 ? 0.5 : -0.5) * kNmPerMm, 2000) << angle;
      EXPECT_NEAR(off.y, (local.y > 0 ? 0.5 : -0.5) * kNmPerMm, 2000) << angle;
    }
    EXPECT_EQ(inner, 36);
    for (const Track& w : b.tracks) {
      EXPECT_EQ(w.width, mmToNm(0.15));
      EXPECT_EQ(w.layer, t.top);
      EXPECT_FALSE(w.locked);
    }
    const FanoutResult again = placeFanouts(b);
    EXPECT_EQ(again.vias, 0);
    EXPECT_EQ(b.vias.size(), 36u);
  }
  // A row of pads round a body, two rows of a connector: no BGAs.
  Bed t;
  const int q = t.component("D1", mm(20, 20));
  for (int i = 0; i < 12; ++i) {
    t.pad(q, mm(i - 5.5, -6), 0.5, 1.5, t.top, "A" + std::to_string(i), false);
    t.pad(q, mm(i - 5.5, 6), 0.5, 1.5, t.top, "B" + std::to_string(i), false);
    t.pad(q, mm(-6, i - 5.5), 1.5, 0.5, t.top, "C" + std::to_string(i), false);
    t.pad(q, mm(6, i - 5.5), 1.5, 0.5, t.top, "D" + std::to_string(i), false);
  }
  EXPECT_FALSE(isBga(t.b, q));
  EXPECT_EQ(placeFanouts(t.b).vias, 0);
}

// TopoR's own design has its fanouts: pads of the two BGAs joined to a via by one track. With all the routing
// taken off, ours are placed anew: a pad TopoR fanned out gets a via of ours in the same cell (TopoR's board is
// a routed one, its vias moved by the optimisation and some taken by the routing: the share is not the whole).
TEST(Fanout, MatchTopoROnSignals) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  Board& b = **lb;
  std::map<int, Vec2> theirs;  // pad -> the via TopoR joined it to
  int bgas = 0;
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    if (!isBga(b, ci)) continue;
    ++bgas;
    for (int pi : b.components[size_t(ci)].pads)
      if (const int vi = fanoutViaOf(b, pi); vi >= 0) theirs[pi] = b.vias[size_t(vi)].pos.v();
  }
  EXPECT_EQ(bgas, 2) << "U1 and U2";
  ASSERT_GT(theirs.size(), 150u);
  b.tracks.clear();
  b.vias.clear();
  b.zips.clear();
  b.serpents.clear();
  const FanoutResult res = placeFanouts(b);
  EXPECT_EQ(res.components, 2);
  int same = 0, fanned = 0;
  for (auto& [pi, at] : theirs) {
    const int vi = fanoutViaOf(b, pi);
    if (vi < 0) continue;
    ++fanned;
    same += (b.vias[size_t(vi)].pos.v() - at).len() < 0.3 * kNmPerMm;
  }
  std::printf("TopoR's fanouts %zu; of those pads ours fanned %d, %d in the same cell; ours in all: %d vias, %d pads, blocked %zu\n", theirs.size(), fanned, same, res.vias,
              res.pads, res.blocked.size());
  // Pads of the two BGAs that TopoR fanned and ours did too (the rest of TopoR's are of the outer rows: vias of
  // its routing), and those of them whose via of ours stands in TopoR's cell: 104 of 133 when this was written.
  EXPECT_GE(fanned, 125);
  EXPECT_GE(same, 100);
  EXPECT_TRUE(res.blocked.empty());
  // The pours give way to the new vias; then nothing breaks the clearances.
  ZoneFillOptions pour;
  for (int z = 0; z < int(b.zones.size()); ++z)
    if (!b.zones[size_t(z)].filled.empty() && !b.zones[size_t(z)].alwaysCopper()) pour.only.push_back(z);
  fillZones(b, pour);
  const auto v = runDrc(b, {});
  EXPECT_EQ(r::count_if(v, [](const DrcViolation& x) { return x.type == DrcViolation::Type::Clearance || x.type == DrcViolation::Type::Short; }), 0);
}

// The middle of a cell covered by a pad of a component on the other side: the via is moved within the cell, or the
// pad takes another cell; the planar pads of that component, under the BGA, get vias of the places that are left.
TEST(Fanout, BlockedCellsAndOtherSide) {
  Bed t;
  const int u = t.bga("U1", mm(20, 20), 8);
  Board& b = t.b;
  // A capacitor underneath: its pads over two cells' middles near the BGA's centre.
  const int cap = t.component("C1", mm(20.5, 20.5));
  const int c1 = t.pad(cap, mm(0, 0), 0.5, 0.5, t.bot, "VCC", false);
  const int c2 = t.pad(cap, mm(1, 0), 0.5, 0.5, t.bot, "GNDX", false);
  const FanoutResult res = placeFanouts(b);
  EXPECT_TRUE(res.blocked.empty());
  EXPECT_EQ(t.faults(), 0u);
  // Every inner pad of the BGA has its fanout; no via stands over the capacitor's pads.
  int fanned = 0;
  for (int pi : b.components[size_t(u)].pads) fanned += fanoutViaOf(b, pi) >= 0;
  EXPECT_EQ(fanned, 16) << "the 4 × 4 inner pads";
  for (const Via& v : b.vias)
    for (int pi : {c1, c2})
      if (v.net != b.pads[size_t(pi)].net) EXPECT_GT((v.pos.v() - b.pads[size_t(pi)].pos.v()).len(), 0.25 * kNmPerMm + 0.225 * kNmPerMm);
  // The capacitor's pads are joined to vias too, on their own layer.
  for (int pi : {c1, c2}) {
    const int vi = fanoutViaOf(b, pi);
    ASSERT_GE(vi, 0);
    EXPECT_EQ(b.vias[size_t(vi)].net, b.pads[size_t(pi)].net);
  }
  EXPECT_TRUE(r::any_of(b.tracks, [&](const Track& w) { return w.layer == t.bot; }));
  EXPECT_EQ(res.vias, 18);
}

// Outside BGAs only the pads of the plane layers' nets get vias: at the end of the pad on its long axis, away from
// the component. In a BGA such a pad gets its via in the outer rows too.
TEST(Fanout, PlaneNetPads) {
  Bed t;
  Board& b = t.b;
  const LayerId inner = b.addLayer("GND", LayerKind::Copper, Side::None);
  b.layers[t.bot].copperIndex = 2;
  b.layers[inner].copperIndex = 1;
  b.layers[inner].plane = true;
  b.layers[inner].planeNet = b.addNet("GND");
  // Eight pads of 0.6 × 1.6 in two rows; pad 4 is GND, the others signals.
  const int ic = t.component("D1", mm(10, 20));
  std::vector<int> pads;
  for (int i = 0; i < 4; ++i) pads.push_back(t.pad(ic, mm(i * 1.27 - 1.9, 2.7), 0.6, 1.6, t.top, i == 3 ? "GND" : "S" + std::to_string(i), false));
  for (int i = 0; i < 4; ++i) pads.push_back(t.pad(ic, mm(i * 1.27 - 1.9, -2.7), 0.6, 1.6, t.top, "T" + std::to_string(i), false));
  // A BGA whose corner ball is GND.
  const int u = t.bga("U1", mm(28, 20), 6);
  b.pads[size_t(b.components[size_t(u)].pads[0])].net = b.findNet("GND");
  const FanoutResult res = placeFanouts(b);
  EXPECT_TRUE(res.blocked.empty());
  EXPECT_EQ(t.faults(), 0u);
  for (int k = 0; k < 8; ++k) {
    const int vi = fanoutViaOf(b, pads[size_t(k)]);
    if (k != 3) {
      EXPECT_EQ(vi, -1) << "a signal's pad " << k;
      continue;
    }
    ASSERT_GE(vi, 0);
    const Pad& p = b.pads[size_t(pads[3])];
    const Vec2 off = b.vias[size_t(vi)].pos.v() - p.pos.v();
    EXPECT_NEAR(off.x, 0, 1000) << "on the pad's long axis";
    EXPECT_GT(off.y, 0.8 * kNmPerMm) << "beyond the end away from the component";
    EXPECT_LT(off.y, 1.6 * kNmPerMm);
  }
  EXPECT_GE(fanoutViaOf(b, b.components[size_t(u)].pads[0]), 0) << "the corner ball of the plane's net";
  EXPECT_EQ(res.vias, 4 + 1 + 1) << "the BGA's 2 × 2 inner balls, its GND corner, the GND pad";
}

// «Удалить избыточные переходы» leaves a fanout alone while its net has unrouted connections, and takes it away
// once the net is routed without it.
TEST(Fanout, KeptWhileNetIsOpen) {
  Bed t;
  Board& b = t.b;
  const int u = t.bga("U1", mm(20, 20), 6);
  // One inner ball's net goes to a pad far away as well.
  const int inner = b.components[size_t(u)].pads[size_t(2 * 6 + 2)];
  const int r1 = t.component("R1", mm(5, 5));
  const int far = t.pad(r1, mm(0, 0), 0.8, 0.8, t.top, b.nets[size_t(b.pads[size_t(inner)].net)].name, false);
  ASSERT_EQ(placeFanouts(b).vias, 4);
  EXPECT_EQ(edit::removeExcessVias(b), 3) << "the three whose nets have nowhere to go";
  ASSERT_EQ(b.vias.size(), 1u);
  EXPECT_EQ(fanoutPadOf(b, 0), inner);
  // Routed on the pads' own layer, past the via: the fanout is not needed any more.
  Track w;
  w.a = b.pads[size_t(inner)].pos;
  w.b = b.pads[size_t(far)].pos;
  w.width = mmToNm(0.15);
  w.layer = t.top;
  w.net = b.pads[size_t(inner)].net;
  b.tracks.push_back(w);
  EXPECT_EQ(edit::removeExcessVias(b), 1);
  EXPECT_TRUE(b.vias.empty());
}

// The autorouter and fanouts. Unused fanouts stand through the rip-up and the wires of their pads begin on their
// vias: the inner balls of a BGA are led out on the other layer from the vias in their cells. Told not to use them
// (RouterOptions::useFanouts off) it takes them off with the rest of the routing.
TEST(Fanout, AutorouterStartsFromThem) {
  auto make = [](Bed& t, std::vector<int>& inner) {
    const int u = t.bga("U1", mm(14, 20), 8);
    // The 4 × 4 inner balls go to the pins of a connector (through pads) at the right edge.
    const int x = t.component("X1", mm(34, 20));
    int k = 0;
    for (int pi : t.b.components[size_t(u)].pads) {
      const Vec2 local = t.b.components[size_t(u)].toLocal(t.b.pads[size_t(pi)].pos.v());
      if (std::abs(local.x) > 1.6 * kNmPerMm || std::abs(local.y) > 1.6 * kNmPerMm) {
        t.b.pads[size_t(pi)].net = kNoNet;  // (the outer balls are not used)
        continue;
      }
      inner.push_back(pi);
      const int pin = t.pad(x, mm(k % 2 ? 1.27 : 0, (k / 2 - 3.5) * 1.27), 0.9, 0.9, t.top, t.b.nets[size_t(t.b.pads[size_t(pi)].net)].name);
      t.b.pads[size_t(pin)].drill = mmToNm(0.5);
      t.b.pads[size_t(pin)].copper = t.b.allCopperMask();
      ++k;
    }
  };
  Bed t;
  std::vector<int> inner;
  make(t, inner);
  Board& b = t.b;
  ASSERT_EQ(inner.size(), 16u);
  ASSERT_EQ(placeFanouts(b).vias, 16);
  ASSERT_EQ(findFanouts(b).size(), 16u);
  std::vector<Vec2> sites;
  for (const Via& v : b.vias) sites.push_back(v.pos.v());
  Board plain = b;
  topo::RouterOptions o;
  o.optimizeIterations = 0;
  o.refine = false;
  const topo::RouterResult res = topo::routeBoard(b, o);
  EXPECT_EQ(res.routed, res.connections);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  // The fanouts are where they were, their tracks with them; wires begin on their vias on the other layer.
  int stood = 0, begun = 0;
  for (Vec2 at : sites) {
    const bool there = r::any_of(b.vias, [&](const Via& v) { return (v.pos.v() - at).len() < 2; });
    stood += there;
    begun += there && r::any_of(b.tracks, [&](const Track& w) { return w.layer == t.bot && ((w.a.v() - at).len() < 2000 || (w.b.v() - at).len() < 2000); });
  }
  EXPECT_EQ(stood, 16);
  EXPECT_GE(begun, 8) << "most of the inner balls go out underneath, from their fanouts";
  for (int pi : inner) EXPECT_GE(fanoutViaOf(b, pi), 0);
  // Not to use them: they go with the rip-up, the board is routed as if they had not been placed.
  o.useFanouts = false;
  const topo::RouterResult without = topo::routeBoard(plain, o);
  EXPECT_EQ(without.routed, without.connections);
  int left = 0;
  for (Vec2 at : sites) left += r::any_of(plain.vias, [&](const Via& v) { return (v.pos.v() - at).len() < 2; });
  EXPECT_LT(left, 16);
}
