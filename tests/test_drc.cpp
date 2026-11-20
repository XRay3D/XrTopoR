#include <gtest/gtest.h>

#include "drc/Drc.h"

using namespace xr;

static Board twoPadBoard() {
  Board b;
  b.addLayer("F.Cu", LayerKind::Copper, Side::Top);
  b.addLayer("B.Cu", LayerKind::Copper, Side::Bottom);
  int n1 = b.addNet("A"), n2 = b.addNet("B");
  for (int i = 0; i < 2; ++i) {
    Pad p;
    p.number = std::to_string(i + 1);
    p.pos = {mmToNm(i * 5.0), 0};
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = b.allCopperMask();
    p.net = i == 0 ? n1 : n2;
    b.pads.push_back(p);
  }
  return b;
}

TEST(Drc, CleanBoard) {
  Board b = twoPadBoard();
  auto v = runDrc(b);
  EXPECT_TRUE(v.empty());
}

TEST(Drc, TrackTooClose) {
  Board b = twoPadBoard();
  Track t;
  t.a = {mmToNm(2.5), mmToNm(0.6)};
  t.b = {mmToNm(2.5), mmToNm(3)};
  t.width = mmToNm(0.25);
  t.layer = 0;
  t.net = b.findNet("A");
  b.tracks.push_back(t);
  DrcOptions opt;
  opt.unconnected = false;  // the floating track is deliberately not tied to its pad here
  // Pad B centre at 5 mm, radius 0.5: distance from the track (x = 2.5) = 2.5 - 0.5 - 0.125 > clearance: OK
  for (auto& v : runDrc(b, opt)) ADD_FAILURE() << v.message;
  b.tracks[0].a = {mmToNm(4.4), 0};
  b.tracks[0].b = {mmToNm(4.4), mmToNm(3)};
  auto v = runDrc(b, opt);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].type, DrcViolation::Type::Short);
}

TEST(Drc, UnconnectedAndShapeMargin) {
  Board b = twoPadBoard();
  b.pads[1].net = b.pads[0].net;
  auto v = runDrc(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].type, DrcViolation::Type::Unconnected);
  SpatialIndex idx;
  idx.build(b);
  Shape s = Shape::capsule({mmToNm(0.6), 0}, {mmToNm(4.4), 0}, mmToNm(0.125));
  EXPECT_GT(shapeMargin(b, idx, s, 1, b.pads[0].net), 0);           // same net: no conflict
  EXPECT_LT(shapeMargin(b, idx, s, 1, kNoNet), 0);                  // no net: too close to the pads
}

#include "core/ZoneFill.h"
#include "io/BoardIO.h"

static std::string dataFile(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

TEST(ZoneFill, PourKeepsClearanceAndConnectsThroughThermals) {
  auto b = io::loadBoard(dataFile("tt.kicad_pcb"));  // routed board with a GND zone on B.Cu
  ASSERT_TRUE(b);
  auto st = fillZones(**b);
  EXPECT_EQ(st.zones, 1);
  EXPECT_GE(st.polygons, 1);
  EXPECT_EQ(Connectivity::compute(**b).ratsnest.size(), 0u);
  EXPECT_TRUE(runDrc(**b).empty());
}

TEST(ZoneFill, PlaneLayersFromTopoR) {
  auto b = io::loadBoard(dataFile("topor/Example_06/Signals.fst"));  // GND plane on INT_GND
  ASSERT_TRUE(b);
  LayerId plane = (*b)->findLayer("INT_GND");
  ASSERT_GE(plane, 0);
  EXPECT_TRUE((*b)->layers[plane].plane);
  EXPECT_EQ((*b)->nets[(*b)->layers[plane].planeNet].name, "GND");
  EXPECT_EQ(Connectivity::compute(**b).ratsnest.size(), 0u);
  EXPECT_TRUE(runDrc(**b).empty());
}

// Two components of two SMD pads on the top side, 1.6 × 0.8 mm bodies drawn on the assembly layer; the second
// `dx` mm to the right of the first. A board of 30 × 20 mm round them.
static Board twoComponentBoard(double dx, Side second = Side::Top) {
  Board b;
  const LayerId top = b.addLayer("F.Cu", LayerKind::Copper, Side::Top);
  const LayerId bottom = b.addLayer("B.Cu", LayerKind::Copper, Side::Bottom);
  const LayerId assyTop = b.addLayer("F.Fab", LayerKind::Fab, Side::Top);
  const LayerId assyBottom = b.addLayer("B.Fab", LayerKind::Fab, Side::Bottom);
  b.outline.push_back({{mmToNm(-10.0), mmToNm(-10.0)}, {mmToNm(20.0), mmToNm(-10.0)}, {mmToNm(20.0), mmToNm(10.0)}, {mmToNm(-10.0), mmToNm(10.0)}});
  for (int c = 0; c < 2; ++c) {
    Component comp;
    comp.ref = c == 0 ? "R1" : "R2";
    comp.side = c == 0 ? Side::Top : second;
    const double x = c * dx;
    comp.pos = {mmToNm(x), 0};
    for (int i = 0; i < 2; ++i) {
      Pad p;
      p.number = std::to_string(i + 1);
      p.component = c;
      p.pos = {mmToNm(x + (i ? 0.5 : -0.5)), 0};
      p.localPos = {mmToNm(i ? 0.5 : -0.5), 0};
      p.shape.kind = PadShapeKind::Rect;
      p.shape.w = mmToNm(0.4);
      p.shape.h = mmToNm(0.6);
      p.copper = LayerMask(1) << (comp.side == Side::Top ? top : bottom);
      p.net = b.addNet(std::format("N{}_{}", c, i));
      comp.pads.push_back(int(b.pads.size()));
      b.pads.push_back(p);
    }
    Graphic g;
    g.kind = GraphicKind::Rect;
    g.layer = comp.side == Side::Top ? assyTop : assyBottom;
    g.a = {mmToNm(x - 0.8), mmToNm(-0.4)};
    g.b = {mmToNm(x + 0.8), mmToNm(0.4)};
    comp.graphics.push_back(g);
    b.components.push_back(std::move(comp));
  }
  b.rules = rulesFromBoard(b);
  b.rules->compClearances.push_back({true, {}, {}, {}, {}, mmToNm(0.5)});
  b.rules->edgeComps = mmToNm(1.0);
  compileRules(b);
  return b;
}

// What a component takes up is its outline on the layers considered at placement and its pads.
TEST(Board, ComponentExtentIsItsPlacementOutlinesAndPads) {
  Board b = twoComponentBoard(3.0);
  auto e0 = b.componentExtent(0), e1 = b.componentExtent(1);
  ASSERT_EQ(e0.items.size(), 3u);  // the body and two pads
  EXPECT_NEAR(e0.box.minX, mmToNm(-0.8), 1);
  EXPECT_NEAR(e0.box.maxY, mmToNm(0.4), 1);
  auto g = b.componentGap(0, e0, 1, e1);
  ASSERT_TRUE(g);
  EXPECT_NEAR(g->distance, mmToNm(1.4), 2);  // body to body: 3 − 1.6
  EXPECT_NEAR(g->margin, mmToNm(0.9), 2);
  // The layer is not considered at placement: the pads are what is left, 3 − 1.4 apart.
  for (Layer& l : b.layers) l.placement = false;
  e0 = b.componentExtent(0), e1 = b.componentExtent(1);
  EXPECT_EQ(e0.items.size(), 2u);
  g = b.componentGap(0, e0, 1, e1);
  ASSERT_TRUE(g);
  EXPECT_NEAR(g->distance, mmToNm(1.6), 2);
  // To the edge of the board: 10 mm less the half of the body, and 1 mm is required.
  for (Layer& l : b.layers) l.placement = l.kind == LayerKind::Fab;
  auto edge = b.componentEdgeGap(b.componentExtent(0));
  ASSERT_TRUE(edge);
  EXPECT_NEAR(edge->distance, mmToNm(9.2), 2);
  EXPECT_NEAR(edge->margin, mmToNm(8.2), 2);
}

// Components of the two sides of the board do not meet: the bodies are on different layers, the pads on
// different copper.
TEST(Board, ComponentsOnOppositeSidesDoNotMeet) {
  Board b = twoComponentBoard(0.5, Side::Bottom);
  EXPECT_FALSE(b.componentGap(0, b.componentExtent(0), 1, b.componentExtent(1)));
}

static std::vector<DrcViolation> componentViolations(const Board& b) {
  DrcOptions o;
  o.components = true;
  auto v = runDrc(b, o);
  std::erase_if(v, [](const DrcViolation& x) { return x.type != DrcViolation::Type::Component; });
  return v;
}

// «Зазор между компонентами»: 0.5 mm are required between the bodies.
TEST(Drc, ComponentsKeepTheirClearance) {
  EXPECT_TRUE(componentViolations(twoComponentBoard(3.0)).empty());
  EXPECT_TRUE(componentViolations(twoComponentBoard(2.1)).empty());  // exactly 0.5
  Board b = twoComponentBoard(2.0);
  auto v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_NEAR(v[0].actual, mmToNm(0.4), 2);
  EXPECT_EQ(v[0].required, mmToNm(0.5));
  ASSERT_TRUE(v[0].hasB);
  EXPECT_EQ(b.pads[size_t(v[0].a.index)].component, 0);
  EXPECT_EQ(b.pads[size_t(v[0].b.index)].component, 1);
  // Overlapping bodies.
  v = componentViolations(twoComponentBoard(1.0));
  ASSERT_EQ(v.size(), 1u);
  EXPECT_LE(v[0].actual, 0);
  // Not asked for: the check of the copper only.
  for (auto& x : runDrc(twoComponentBoard(1.0))) EXPECT_NE(x.type, DrcViolation::Type::Component);
  // A rule for the pair allows it.
  b.rules->compClearances.push_back({true, {}, {}, {RuleComps::Kind::Comp, "R1"}, {RuleComps::Kind::Comp, "R2"}, mmToNm(0.3)});
  compileRules(b);
  EXPECT_TRUE(componentViolations(b).empty());
}

TEST(Drc, ComponentKeepsOffTheBoardEdge) {
  Board b = twoComponentBoard(5.0);
  EXPECT_TRUE(componentViolations(b).empty());
  b.moveComponent(1, {mmToNm(18.5), 0});  // the body's side 0.7 mm from the edge, 1 mm required
  auto v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_FALSE(v[0].hasB);
  EXPECT_NEAR(v[0].actual, mmToNm(0.7), 2);
  EXPECT_EQ(b.pads[size_t(v[0].a.index)].component, 1);
  b.moveComponent(1, {mmToNm(25.0), 0});  // off the board
  v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_LT(v[0].actual, 0);
}

// Fixed components are where they are meant to be: not checked against each other nor against the edge.
TEST(Drc, LockedComponentsMayOverlap) {
  Board b = twoComponentBoard(1.0);
  b.components[0].locked = true;
  EXPECT_EQ(componentViolations(b).size(), 1u);
  b.components[1].locked = true;
  EXPECT_TRUE(componentViolations(b).empty());
}

TEST(Drc, ComponentsOnOppositeSidesDoNotMeet) {
  EXPECT_TRUE(componentViolations(twoComponentBoard(0.5, Side::Bottom)).empty());
}

// TopoR's numbers of the warnings its filter of messages switches, for our violations.
TEST(Drc, MessageCodesOfViolations) {
  Board b = twoComponentBoard(1.0);  // the bodies overlap
  auto v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(messageCode(b, v[0]), 5036);
  b = twoComponentBoard(2.0);  // short of the clearance only: not a warning of the filter
  v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(messageCode(b, v[0]), 0);
  b = twoComponentBoard(5.0);
  b.moveComponent(1, {mmToNm(19.5), 0});
  v = componentViolations(b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(messageCode(b, v[0]), 5034);
  // A via on the edge of the board; a fixed wire across a via of another net, a loose one is an error.
  DrcViolation x;
  x.type = DrcViolation::Type::Edge;
  x.a = {ItemType::Via, 0};
  EXPECT_EQ(messageCode(b, x), 5012);
  x.a = {ItemType::Track, 0};
  EXPECT_EQ(messageCode(b, x), 0);
  Track t;
  t.locked = true;
  b.tracks.push_back(t);
  x.type = DrcViolation::Type::Short;
  x.a = {ItemType::Via, 0};
  x.b = {ItemType::Track, 0};
  x.hasB = true;
  EXPECT_EQ(messageCode(b, x), 5018);
  x.a = {ItemType::Pad, 0};
  EXPECT_EQ(messageCode(b, x), 5017);
  b.tracks[0].locked = false;
  EXPECT_EQ(messageCode(b, x), 0);
  x.b = {ItemType::Zone, 0};
  EXPECT_EQ(messageCode(b, x), 5013);
  x.type = DrcViolation::Type::Clearance;  // near, not across
  EXPECT_EQ(messageCode(b, x), 0);
  x.type = DrcViolation::Type::Keepout;
  x.a = {ItemType::Via, 0};
  x.b = {ItemType::Keepout, 0};
  EXPECT_EQ(messageCode(b, x), 5024);
  x.a = {ItemType::Zone, 0};
  EXPECT_EQ(messageCode(b, x), 5026);
}
