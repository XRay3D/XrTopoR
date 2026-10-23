#include <gtest/gtest.h>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/Freestyle.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

int conflicts(const Board& b) {
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  return int(runDrc(b, o).size());
}

// A component of the board with wires on its pads, not locked.
int routedComponent(const Board& b, int skip = 0) {
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    if (b.components[ci].locked || b.components[ci].pads.size() < 2) continue;
    for (int pi : b.components[ci].pads)
      for (auto& t : b.tracks)
        if (t.net == b.pads[pi].net && b.pads[pi].shapeGeom().contains(t.a.v()) && skip-- == 0) return ci;
  }
  return -1;
}

}  // namespace

// Moved in Freestyle, a component keeps all its connections and its wires get their shape again.
TEST(Freestyle, MoveKeepsRoutingWhole) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb);
  Board& b = **lb;
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  int ci = routedComponent(b);
  ASSERT_GE(ci, 0);
  topo::FreestyleTarget t;
  t.fragment.components = {ci};
  Vec2 pos = b.components[ci].pos.v();
  auto r = topo::freestyle(b, t, {1.0 * kNmPerMm, 0.5 * kNmPerMm}, 90, pos, topo::Push::None);
  EXPECT_FALSE(r.blocked);
  EXPECT_NEAR(r.moved.x, 1.0 * kNmPerMm, 1);
  EXPECT_NEAR(r.turned, 90, 1e-9);
  EXPECT_NEAR(b.components[ci].pos.x, pos.x + 1.0 * kNmPerMm, 1);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), unrouted);
}

// With pushing, a via dragged into another via moves it out of the way; no new conflicts appear.
TEST(Freestyle, PushedViaGivesWay) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb);
  Board& b = **lb;
  ASSERT_GE(b.vias.size(), 2u);
  // Two unlocked vias of different nets close to each other.
  int va = -1, vb = -1;
  double best = 1e18;
  for (int i = 0; i < int(b.vias.size()); ++i)
    for (int j = 0; j < int(b.vias.size()); ++j)
      if (i != j && b.vias[i].net != b.vias[j].net && !b.vias[i].locked && !b.vias[j].locked) {
        double d = (b.vias[i].pos.v() - b.vias[j].pos.v()).len();
        if (d < best) {
          best = d;
          va = i;
          vb = j;
        }
      }
  ASSERT_GE(va, 0);
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  int c0 = conflicts(b);
  Vec2 a0 = b.vias[va].pos.v(), b0 = b.vias[vb].pos.v();
  Vec2 dir = (b0 - a0).normalized();
  topo::FreestyleTarget t;
  t.fragment.vias = {va};
  auto r = topo::freestyle(b, t, dir * (best * 0.7), 0, a0, topo::Push::Vias);
  EXPECT_GT(r.moved.len(), 0);
  EXPECT_LE(conflicts(b), c0);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), unrouted);
  if (!r.blocked) EXPECT_GT((b.vias[vb].pos.v() - b0).len(), 0);  // the other via was pushed
}

// Two vias with wires to pads: the via dragged into the other pushes it ahead.
TEST(Freestyle, ViaPushesVia) {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  LayerId bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  b.layers[top].copperIndex = 0;
  b.layers[bot].copperIndex = 1;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 30), mm(0, 30)});
  int na = b.addNet("A"), nb = b.addNet("B");
  auto pad = [&](Vec2 at, int net) {
    Component c;
    c.ref = "P" + std::to_string(b.components.size());
    c.pos = Point(at);
    Pad p;
    p.component = int(b.components.size());
    p.net = net;
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = b.allCopperMask();
    p.drill = mmToNm(0.5);
    c.pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
    b.components.push_back(c);
    b.updatePadPositions(int(b.components.size()) - 1);
  };
  auto via = [&](Vec2 at, int net) {
    Via v;
    v.pos = Point(at);
    v.net = net;
    v.diameter = mmToNm(0.6);
    v.drill = mmToNm(0.3);
    v.layers = b.allCopperMask();
    b.vias.push_back(v);
  };
  auto track = [&](Vec2 a, Vec2 c, int net) {
    Track t;
    t.a = Point(a);
    t.b = Point(c);
    t.width = mmToNm(0.25);
    t.net = net;
    t.layer = top;
    b.tracks.push_back(t);
  };
  pad(mm(5, 15), na);
  pad(mm(35, 15), nb);
  via(mm(18, 15), na);
  via(mm(19.2, 15), nb);
  track(mm(5, 15), mm(18, 15), na);
  track(mm(19.2, 15), mm(35, 15), nb);
  ASSERT_EQ(conflicts(b), 0);
  topo::FreestyleTarget t;
  t.fragment.vias = {0};
  auto r = topo::freestyle(b, t, mm(1.0, 0), 0, mm(18, 15), topo::Push::Vias);
  EXPECT_FALSE(r.blocked);
  EXPECT_NEAR(b.vias[0].pos.x, 19 * kNmPerMm, 1);
  EXPECT_GE(b.vias[1].pos.x, 19.8 * kNmPerMm);  // pushed to the clearance (0.2 mm) ahead
  EXPECT_EQ(conflicts(b), 0);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  // Without pushing the via goes through.
  topo::FreestyleTarget t2;
  t2.fragment.vias = {0};
  Vec2 other = b.vias[1].pos.v();
  topo::freestyle(b, t2, mm(1.0, 0), 0, b.vias[0].pos.v(), topo::Push::None);
  EXPECT_EQ(b.vias[1].pos.v(), other);
}
