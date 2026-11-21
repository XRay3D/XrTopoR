// «Преобразовать проводники в обл. металлизации» (core/WiresToCopper.h): the wires of nets or of layers made copper
// areas over the Voronoi cells of the layer's copper.
#include <gtest/gtest.h>

#include <algorithm>
#include <print>

#include "core/Connectivity.h"
#include "core/WiresToCopper.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// A board 30 x 12 of one layer: net A's wire along y = 4 and net B's along y = `yB`, each 0.3 wide between two
// round pads; the clearance 0.2.
struct TwoWires {
  Board b;
  LayerId top = 0;
  int netA = 0, netB = 0;
  explicit TwoWires(double yB = 8) {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[size_t(top)].copperIndex = 0;
    b.outline.push_back({at(0, 0), at(30, 0), at(30, 12), at(0, 12)});
    b.netClasses[0].clearance = mmToNm(0.2);
    Component c;
    c.ref = "U1";
    b.components.push_back(c);
    netA = b.addNet("A");
    netB = b.addNet("B");
    wire(netA, 4);
    wire(netB, yB);
  }
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }
  void wire(int net, double y) {
    for (double x : {4.0, 26.0}) {
      Pad p;
      p.number = std::to_string(b.pads.size() + 1);
      p.component = 0;
      p.net = net;
      p.pos = Point(at(x, y));
      p.shape.kind = PadShapeKind::Circle;
      p.shape.w = p.shape.h = mmToNm(0.3);
      p.copper = LayerMask(1) << top;
      b.pads.push_back(p);
    }
    Track t;
    t.a = Point(at(4, y));
    t.b = Point(at(26, y));
    t.width = mmToNm(0.3);
    t.layer = top;
    t.net = net;
    b.tracks.push_back(t);
  }
  bool copperAt(int net, double x, double y) const {
    for (const Zone& z : b.zones)
      if (z.net == net)
        for (const auto& f : z.filled)
          if (pointInPolygon(at(x, y), f)) return true;
    return false;
  }
  size_t violations() const {
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    return runDrc(b, o).size();
  }
};

}  // namespace

// One net gets an area round its wire: it takes the room to half way to the neighbour's wire (less half the
// clearance) and to the board's edge. The wires stay, as TopoR leaves them; nothing comes nearer than the
// clearance, nothing gets unconnected.
TEST(WiresToCopper, ANetTakesItsCell) {
  TwoWires s;
  const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
  EXPECT_EQ(r.areas, 1);
  EXPECT_EQ(r.nets, 1);
  EXPECT_EQ(s.b.tracks.size(), 2u) << "the wires are not touched";
  ASSERT_EQ(s.b.zones.size(), 1u);
  const Zone& z = s.b.zones[0];
  EXPECT_EQ(z.net, s.netA);
  EXPECT_EQ(z.layer, s.top);
  EXPECT_FALSE(z.solid);
  // As TopoR makes them: the line as wide as the wires, priority 50, the pads joined solid.
  EXPECT_EQ(z.lineWidth, mmToNm(0.3));
  EXPECT_EQ(z.priority, 50);
  EXPECT_EQ(z.pads.connection, PadConnection::Solid);
  EXPECT_FALSE(z.filled.empty());
  EXPECT_TRUE(s.copperAt(s.netA, 15, 4)) << "round the wire";
  EXPECT_TRUE(s.copperAt(s.netA, 15, 5.8)) << "up to the middle between the wires (y = 6) less 0.1";
  EXPECT_FALSE(s.copperAt(s.netA, 15, 6.0));
  EXPECT_TRUE(s.copperAt(s.netA, 15, 1.5)) << "towards the board's edge";
  EXPECT_TRUE(s.copperAt(s.netA, 4, 4)) << "the pads are in it";
  EXPECT_EQ(s.violations(), 0u);
  EXPECT_EQ(Connectivity::compute(s.b).ratsnest.size(), 0u);
}

// Both nets (every net of the layer): two areas, the clearance apart along the middle.
TEST(WiresToCopper, NeighboursShareTheRoom) {
  TwoWires s;
  const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {}, .layers = {s.top}});
  EXPECT_EQ(r.areas, 2);
  EXPECT_EQ(r.nets, 2);
  EXPECT_EQ(s.b.tracks.size(), 2u);
  EXPECT_TRUE(s.copperAt(s.netA, 15, 5.85));
  EXPECT_TRUE(s.copperAt(s.netB, 15, 6.15));
  EXPECT_FALSE(s.copperAt(s.netA, 15, 6.0));
  EXPECT_FALSE(s.copperAt(s.netB, 15, 6.0));
  EXPECT_TRUE(s.copperAt(s.netB, 15, 10.5));
  EXPECT_EQ(s.violations(), 0u);
  // The copper of the two is the clearance apart, not more than a few hundredths over.
  double gap = 1e300;
  for (const auto& f : s.b.zones[0].filled)
    for (const auto& g : s.b.zones[1].filled) gap = std::min(gap, Shape::polygon(f).distance(Shape::polygon(g)));
  EXPECT_GE(gap, mmToNm(0.2) - 2000);
  EXPECT_LE(gap, mmToNm(0.26));
}

// Nothing to do: nothing chosen, a net without wires. A wire nearer its neighbour than the clearance: the area
// gives way there, and the check finds nothing against it.
TEST(WiresToCopper, EdgeCases) {
  {
    TwoWires s;
    EXPECT_EQ(wiresToCopper(s.b, {}).areas, 0);
    EXPECT_EQ(wiresToCopper(s.b, {.nets = {s.b.addNet("C")}, .layers = {}}).areas, 0);
    EXPECT_TRUE(s.b.zones.empty());
  }
  {
    TwoWires s(4.4);  // 0.1 between the wires' edges (and between the pads)
    const size_t was = s.violations();
    const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
    EXPECT_EQ(r.areas, 1);
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    const auto now = runDrc(s.b, o);
    EXPECT_EQ(now.size(), was) << "the wires' own violations, as they were";
    for (const DrcViolation& v : now) EXPECT_TRUE(v.a.type != ItemType::Zone && (!v.hasB || v.b.type != ItemType::Zone)) << "the area keeps the clearance: " << v.message;
    EXPECT_TRUE(s.copperAt(s.netA, 15, 2.5)) << "on the free side";
  }
}

// A routed board of TopoR's (Example_04, 2 layers): every net of the top layer gets its areas — no violation of the
// clearances comes of it, no wire is touched, the bottom layer has none. Two nets only: areas of those two.
TEST(WiresToCopper, ALayerOfARoutedBoard) {
  auto load = [] {
    auto r = io::loadBoard(data("topor/Example_04/Arcs_master_f5f7.fst"));
    EXPECT_TRUE(r) << r.error();
    return std::move(*r);
  };
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  {
    auto bp = load();
    Board& b = *bp;
    const LayerId top = b.findLayer("Top");
    ASSERT_GE(top, 0);
    const std::vector<Track> tracksWas = b.tracks;
    const size_t zonesWas = b.zones.size(), drcWas = runDrc(b, o).size();
    const WiresToCopperResult r = wiresToCopper(b, {.nets = {}, .layers = {top}});
    std::println("Arcs, Top: {} areas of {} nets", r.areas, r.nets);
    EXPECT_GT(r.areas, 100);
    EXPECT_GT(r.nets, 80);
    EXPECT_EQ(size_t(r.areas), b.zones.size() - zonesWas);
    ASSERT_EQ(b.tracks.size(), tracksWas.size());
    for (size_t i = 0; i < b.tracks.size(); ++i) EXPECT_TRUE(b.tracks[i].a == tracksWas[i].a && b.tracks[i].b == tracksWas[i].b);
    for (size_t z = zonesWas; z < b.zones.size(); ++z) {
      EXPECT_EQ(b.zones[z].layer, top);
      EXPECT_GE(b.zones[z].net, 0);
      EXPECT_FALSE(b.zones[z].filled.empty());
      EXPECT_GT(b.zones[z].lineWidth, 0);
    }
    EXPECT_EQ(runDrc(b, o).size(), drcWas);
    EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  }
  {
    auto bp = load();
    Board& b = *bp;
    const int n0 = b.findNet("0B"), n1 = b.findNet("+5B");
    ASSERT_GE(n0, 0);
    ASSERT_GE(n1, 0);
    const size_t tracksWas = b.tracks.size();
    const WiresToCopperResult r = wiresToCopper(b, {.nets = {n0, n1}, .layers = {}});
    EXPECT_EQ(r.nets, 2);
    EXPECT_GT(r.areas, 1);
    EXPECT_EQ(b.tracks.size(), tracksWas);
    for (const Zone& z : b.zones) EXPECT_TRUE(z.net == n0 || z.net == n1);
    EXPECT_EQ(runDrc(b, o).size(), 0u);
  }
}

// TopoR's own conversion of Example_01 (saved by TopoR Lite 7.0: 13 nets, 13 areas, the wires all there): the same
// board without its areas, converted by us, gets an area for every net as well, and the areas keep the clearances.
TEST(WiresToCopper, LikeTopoRsOwn) {
  auto r = io::loadBoard(data("topor/Example_01/SingleLayer_polygons.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  ASSERT_EQ(b.zones.size(), 13u);
  for (const Zone& z : b.zones) {
    EXPECT_EQ(z.priority, 50);
    EXPECT_EQ(z.lineWidth, mmToNm(0.4));
    EXPECT_EQ(z.pads.connection, PadConnection::Solid);
  }
  const size_t tracks = b.tracks.size();
  b.zones.clear();
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  const size_t drcWas = runDrc(b, o).size();
  const WiresToCopperResult res = wiresToCopper(b, {.nets = {}, .layers = {b.findLayer("Top")}});
  std::println("Example_01: {} areas of {} nets (TopoR: 13 of 13)", res.areas, res.nets);
  EXPECT_EQ(res.nets, 13);
  EXPECT_EQ(b.tracks.size(), tracks);
  for (const Zone& z : b.zones) {
    EXPECT_EQ(z.priority, 50);
    EXPECT_EQ(z.lineWidth, mmToNm(0.4));
  }
  EXPECT_EQ(runDrc(b, o).size(), drcWas);
}
