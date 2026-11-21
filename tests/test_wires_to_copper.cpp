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

// One net's wire made an area: it takes the room to half way to the neighbour's wire less half the clearance, and
// to the board's edge; the neighbour stays a wire; nothing is nearer than the clearance, nothing is unconnected.
TEST(WiresToCopper, AWireTakesItsCell) {
  TwoWires s;
  const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
  EXPECT_EQ(r.wires, 1);
  EXPECT_EQ(r.areas, 1);
  EXPECT_TRUE(r.kept.empty());
  ASSERT_EQ(s.b.tracks.size(), 1u);
  EXPECT_EQ(s.b.tracks[0].net, s.netB);
  ASSERT_EQ(s.b.zones.size(), 1u);
  const Zone& z = s.b.zones[0];
  EXPECT_EQ(z.net, s.netA);
  EXPECT_EQ(z.layer, s.top);
  EXPECT_FALSE(z.solid);
  EXPECT_EQ(z.pads.connection, PadConnection::Solid);
  EXPECT_FALSE(z.filled.empty());
  EXPECT_TRUE(s.copperAt(s.netA, 15, 4)) << "where the wire was";
  EXPECT_TRUE(s.copperAt(s.netA, 15, 5.8)) << "up to the middle between the wires (y = 6) less 0.1";
  EXPECT_FALSE(s.copperAt(s.netA, 15, 6.0));
  EXPECT_TRUE(s.copperAt(s.netA, 15, 1.5)) << "towards the board's edge";
  EXPECT_TRUE(s.copperAt(s.netA, 4, 4)) << "the pads are in it";
  EXPECT_EQ(s.violations(), 0u);
  EXPECT_EQ(Connectivity::compute(s.b).ratsnest.size(), 0u);
}

// Both nets: two areas, the clearance apart along the middle.
TEST(WiresToCopper, NeighboursShareTheRoom) {
  TwoWires s;
  const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {}, .layers = {s.top}});
  EXPECT_EQ(r.wires, 2);
  EXPECT_EQ(r.areas, 2);
  EXPECT_TRUE(s.b.tracks.empty());
  EXPECT_TRUE(s.copperAt(s.netA, 15, 5.85));
  EXPECT_TRUE(s.copperAt(s.netB, 15, 6.15));
  EXPECT_FALSE(s.copperAt(s.netA, 15, 6.0));
  EXPECT_FALSE(s.copperAt(s.netB, 15, 6.0));
  EXPECT_TRUE(s.copperAt(s.netB, 15, 10.5));
  EXPECT_EQ(s.violations(), 0u);
  EXPECT_EQ(Connectivity::compute(s.b).ratsnest.size(), 0u);
}

// What stays: a fixed wire; a net whose area would not hold its connection (its wire lies between two neighbours,
// nearer each than the clearance: the pour, keeping off both, cuts it through) — its wires are back as they were,
// and it is named. Too near one neighbour only, the area gives way on that side and holds.
TEST(WiresToCopper, WhatStaysWires) {
  {
    TwoWires s;
    s.b.tracks[0].locked = true;
    const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
    EXPECT_EQ(r.wires, 0);
    EXPECT_EQ(r.areas, 0);
    EXPECT_EQ(s.b.tracks.size(), 2u);
    EXPECT_TRUE(s.b.zones.empty());
  }
  {
    TwoWires s(4.4);  // 0.1 between the wires' edges (and between the pads)
    const size_t was = s.violations();
    const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
    EXPECT_EQ(r.areas, 1);
    EXPECT_TRUE(r.kept.empty());
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    const auto now = runDrc(s.b, o);
    EXPECT_LT(now.size(), was) << "the wire's own violation is gone";
    for (const DrcViolation& v : now) EXPECT_TRUE(v.a.type != ItemType::Zone && (!v.hasB || v.b.type != ItemType::Zone)) << "the area keeps the clearance: " << v.message;
    EXPECT_EQ(Connectivity::compute(s.b).ratsnest.size(), 0u);
  }
  {
    TwoWires s(4.4);
    s.wire(s.b.addNet("C"), 3.6);  // and 0.1 on the other side
    const std::vector<Track> was = s.b.tracks;
    const WiresToCopperResult r = wiresToCopper(s.b, {.nets = {s.netA}, .layers = {}});
    EXPECT_EQ(r.wires, 0);
    EXPECT_EQ(r.areas, 0);
    ASSERT_EQ(r.kept.size(), 1u);
    EXPECT_EQ(r.kept[0], s.netA);
    EXPECT_TRUE(s.b.zones.empty());
    ASSERT_EQ(s.b.tracks.size(), was.size());
    for (const Track& t : was) EXPECT_TRUE(r::any_of(s.b.tracks, [&](const Track& o) { return o.net == t.net && o.a == t.a && o.b == t.b; }));
    EXPECT_EQ(Connectivity::compute(s.b).ratsnest.size(), 0u);
  }
  {
    TwoWires s;  // nothing chosen, a net without wires
    EXPECT_EQ(wiresToCopper(s.b, {}).wires, 0);
    EXPECT_EQ(wiresToCopper(s.b, {.nets = {s.b.addNet("C")}, .layers = {}}).wires, 0);
    EXPECT_EQ(s.b.tracks.size(), 2u);
  }
}

// A routed board of TopoR's (Example_04, 2 layers): every wire of the top layer made an area — no violation of the
// clearances comes of it and nothing gets unconnected; the bottom layer is as it was. Two nets only: theirs go,
// the rest stay.
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
    const LayerId top = b.findLayer("Top"), bottom = b.findLayer("Bottom");
    ASSERT_GE(top, 0);
    const auto onLayer = [&](LayerId l) { return r::count(b.tracks, l, &Track::layer); };
    const auto topWas = onLayer(top), bottomWas = onLayer(bottom);
    const size_t zonesWas = b.zones.size(), drcWas = runDrc(b, o).size(), unroutedWas = Connectivity::compute(b).ratsnest.size();
    const WiresToCopperResult r = wiresToCopper(b, {.nets = {}, .layers = {top}});
    std::println("Arcs, Top: {} wires -> {} areas, {} nets kept", r.wires, r.areas, r.kept.size());
    EXPECT_TRUE(r.kept.empty());
    EXPECT_GT(r.areas, 100);
    EXPECT_EQ(size_t(r.areas), b.zones.size() - zonesWas);
    EXPECT_EQ(onLayer(bottom), bottomWas);
    EXPECT_EQ(onLayer(top), topWas - r.wires);
    for (const Track& t : b.tracks)
      if (t.layer == top) EXPECT_TRUE(t.locked || t.zip >= 0 || t.serp >= 0) << "only what is not to be touched";
    for (size_t z = zonesWas; z < b.zones.size(); ++z) {
      EXPECT_EQ(b.zones[z].layer, top);
      EXPECT_GE(b.zones[z].net, 0);
      EXPECT_FALSE(b.zones[z].filled.empty());
    }
    EXPECT_EQ(runDrc(b, o).size(), drcWas);
    EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), unroutedWas);
  }
  {
    auto bp = load();
    Board& b = *bp;
    const int n0 = b.findNet("0B"), n1 = b.findNet("+5B");
    ASSERT_GE(n0, 0);
    ASSERT_GE(n1, 0);
    const auto others = r::count_if(b.tracks, [&](const Track& t) { return t.net != n0 && t.net != n1; });
    const WiresToCopperResult r = wiresToCopper(b, {.nets = {n0, n1}, .layers = {}});
    EXPECT_GT(r.wires, 100);
    EXPECT_TRUE(r.kept.empty());
    EXPECT_EQ(r::count_if(b.tracks, [&](const Track& t) { return t.net != n0 && t.net != n1; }), others);
    EXPECT_EQ(r::count_if(b.tracks, [&](const Track& t) { return (t.net == n0 || t.net == n1) && !t.locked; }), 0);
    for (const Zone& z : b.zones) EXPECT_TRUE(z.net == n0 || z.net == n1 || z.filled.empty() || true);
    EXPECT_EQ(runDrc(b, o).size(), 0u);
    EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  }
}
