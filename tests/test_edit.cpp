#include <gtest/gtest.h>

#include "core/Connectivity.h"
#include "core/Edit.h"
#include "core/ZoneFill.h"
#include "io/BoardIO.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

Point mm(double x, double y) { return Point(Vec2{x * kNmPerMm, y * kNmPerMm}); }

// Two copper layers; U1 with SMD pads 1 (net A) at (10,10) and 2 (net B) at (12,10), a through pad 3
// (net C) at (11,12); wires from the pads to (20,10), (20,14) and (20,12).
struct Fixture {
  Board b;
  LayerId top, bot, silkTop, silkBot;
  int netA, netB, netC;

  Fixture() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    silkTop = b.addLayer("SilkTop", LayerKind::Silk, Side::Top);
    silkBot = b.addLayer("SilkBottom", LayerKind::Silk, Side::Bottom);
    b.layers[top].copperIndex = 0;
    b.layers[bot].copperIndex = 1;
    netA = b.addNet("A");
    netB = b.addNet("B");
    netC = b.addNet("C");
    Component c;
    c.ref = "U1";
    c.pos = mm(11, 10);
    Graphic g;
    g.kind = GraphicKind::Line;
    g.layer = silkTop;
    g.a = mm(10, 9).v();
    g.b = mm(12, 9).v();
    c.graphics.push_back(g);
    b.components.push_back(c);
    addPad("1", mm(-1, 0), netA, LayerMask(1) << top, 0);
    addPad("2", mm(1, 0), netB, LayerMask(1) << top, 0);
    addPad("3", mm(0, 2), netC, b.allCopperMask(), mmToNm(0.5));
    b.updatePadPositions(0);
    addTrack(mm(10, 10), mm(20, 10), top, netA);
    addTrack(mm(12, 10), mm(16, 14), top, netB);
    addTrack(mm(16, 14), mm(20, 14), top, netB);
    addTrack(mm(11, 12), mm(20, 12), bot, netC);
  }
  void addPad(const char* num, Point local, int net, LayerMask copper, Coord drill) {
    Pad p;
    p.number = num;
    p.component = 0;
    p.net = net;
    p.localPos = local;
    p.shape.kind = PadShapeKind::Rect;
    p.shape.w = p.shape.h = mmToNm(0.8);
    p.copper = copper;
    p.drill = drill;
    b.components[0].pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
  }
  int addTrack(Point a, Point c, LayerId l, int net) {
    Track t;
    t.a = a;
    t.b = c;
    t.width = mmToNm(0.25);
    t.layer = l;
    t.net = net;
    b.tracks.push_back(t);
    return int(b.tracks.size()) - 1;
  }
  size_t unrouted() const { return Connectivity::compute(b).ratsnest.size(); }
};

edit::Fragment components(std::vector<int> c) {
  edit::Fragment f;
  f.components = std::move(c);
  return f;
}

}  // namespace

TEST(Edit, MovedComponentDragsAttachedEnds) {
  Fixture fx;
  ASSERT_EQ(fx.unrouted(), 0u);
  edit::Motion m;
  m.shift = mm(-3, 2).v();
  ASSERT_TRUE(edit::move(fx.b, components({0}), m));
  EXPECT_EQ(fx.b.components[0].pos, mm(8, 12));
  EXPECT_EQ(fx.b.tracks[0].a, mm(7, 12));   // on pad 1
  EXPECT_EQ(fx.b.tracks[0].b, mm(20, 10));  // far end stays
  EXPECT_EQ(fx.b.tracks[1].a, mm(9, 12));
  EXPECT_EQ(fx.b.tracks[1].b, mm(16, 14));  // the bend stays
  EXPECT_EQ(fx.b.tracks[3].a, mm(8, 14));
  EXPECT_EQ(fx.b.components[0].graphics[0].a, mm(7, 11).v());
  EXPECT_EQ(fx.unrouted(), 0u);
}

TEST(Edit, RotatedComponentKeepsWires) {
  Fixture fx;
  edit::Fragment f = components({0});
  edit::Motion m;
  m.pivot = edit::pivotOf(fx.b, f);
  m.rotate = 90;
  ASSERT_TRUE(edit::move(fx.b, f, m));
  // Counter-clockwise on screen (Y down): pad 1 at (-1, 0) goes to (0, +1).
  EXPECT_EQ(fx.b.pads[0].pos, mm(11, 11));
  EXPECT_EQ(fx.b.tracks[0].a, mm(11, 11));
  EXPECT_EQ(fx.b.tracks[1].a, mm(11, 9));
  EXPECT_EQ(fx.b.tracks[3].a, mm(13, 10));
  EXPECT_EQ(fx.unrouted(), 0u);
}

TEST(Edit, FlipLeavesSmdWiresBehind) {
  Fixture fx;
  edit::Fragment f = components({0});
  edit::Motion m;
  m.pivot = edit::pivotOf(fx.b, f);
  m.mirror = true;
  ASSERT_TRUE(edit::move(fx.b, f, m));
  const Component& c = fx.b.components[0];
  EXPECT_EQ(c.side, Side::Bottom);
  EXPECT_EQ(fx.b.pads[0].pos, mm(12, 10));
  EXPECT_EQ(fx.b.pads[0].copper, LayerMask(1) << fx.bot);
  EXPECT_EQ(c.graphics[0].layer, fx.silkBot);
  // SMD wires stay on the top where they were; the through pad's wire follows.
  EXPECT_EQ(fx.b.tracks[0].a, mm(10, 10));
  EXPECT_EQ(fx.b.tracks[1].a, mm(12, 10));
  EXPECT_EQ(fx.b.tracks[3].a, mm(11, 12));
  EXPECT_EQ(fx.unrouted(), 2u);
  // Flipping back restores the pads exactly.
  ASSERT_TRUE(edit::move(fx.b, f, m));
  EXPECT_EQ(fx.b.pads[0].pos, mm(10, 10));
  EXPECT_EQ(fx.b.pads[0].copper, LayerMask(1) << fx.top);
  EXPECT_EQ(fx.unrouted(), 0u);
}

TEST(Edit, LockedWireGetsConnector) {
  Fixture fx;
  fx.b.tracks[0].locked = true;
  edit::Motion m;
  m.shift = mm(0, 1).v();
  ASSERT_TRUE(edit::move(fx.b, components({0}), m));
  EXPECT_EQ(fx.b.tracks[0].a, mm(10, 10));
  ASSERT_EQ(fx.b.tracks.size(), 5u);
  EXPECT_EQ(fx.b.tracks[4].a, mm(10, 11));
  EXPECT_EQ(fx.b.tracks[4].b, mm(10, 10));
  EXPECT_FALSE(fx.b.tracks[4].locked);
  EXPECT_EQ(fx.unrouted(), 0u);
  // A locked component is not moved.
  fx.b.components[0].locked = true;
  EXPECT_FALSE(edit::move(fx.b, components({0}), m));
}

TEST(Edit, VertexAndSegmentDrags) {
  Fixture fx;
  // The bend of net B: both segments follow.
  ASSERT_TRUE(edit::moveVertex(fx.b, 1, 1, mm(17, 15).v()));
  EXPECT_EQ(fx.b.tracks[1].b, mm(17, 15));
  EXPECT_EQ(fx.b.tracks[2].a, mm(17, 15));
  // On a pad the vertex stays and the track breaks off it.
  ASSERT_TRUE(edit::moveVertex(fx.b, 0, 0, mm(12, 8).v()));
  EXPECT_EQ(fx.b.tracks[0].a, mm(12, 8));
  ASSERT_EQ(fx.b.tracks.size(), 5u);
  EXPECT_EQ(fx.b.tracks[4].a, mm(10, 10));
  EXPECT_EQ(fx.b.tracks[4].b, mm(12, 8));
  EXPECT_EQ(fx.unrouted(), 0u);
  // Parallel transfer of the middle segment of B: the neighbour stretches, the pad end gets a link.
  size_t n = fx.b.tracks.size();
  ASSERT_TRUE(edit::moveSegment(fx.b, 1, mm(0, -1).v()));
  EXPECT_EQ(fx.b.tracks[1].b, mm(17, 14));
  EXPECT_EQ(fx.b.tracks[2].a, mm(17, 14));
  ASSERT_EQ(fx.b.tracks.size(), n + 1);
  EXPECT_EQ(fx.b.tracks[n].b, mm(12, 10));
  EXPECT_EQ(fx.unrouted(), 0u);
}

TEST(Edit, StretchedArcKeepsShape) {
  Fixture fx;
  Track& t = fx.b.tracks[0];
  t.mid = mm(15, 8);
  edit::Motion m;
  m.shift = mm(-5, 0).v();
  ASSERT_TRUE(edit::move(fx.b, components({0}), m));
  // Chord (10,10)-(20,10) became (5,10)-(20,10): the mid point scales with it.
  EXPECT_EQ(fx.b.tracks[0].mid, mm(12.5, 7));
}

TEST(Edit, SplitStraightenChangeLayer) {
  Fixture fx;
  int second = edit::splitTrack(fx.b, 0, mm(15, 11).v());
  EXPECT_EQ(fx.b.tracks[0].b, mm(15, 10));
  EXPECT_EQ(fx.b.tracks[second].a, mm(15, 10));
  ASSERT_TRUE(edit::moveVertex(fx.b, 0, 1, mm(15, 7).v()));
  EXPECT_EQ(edit::straighten(fx.b, {0, second}), 1);
  ASSERT_EQ(fx.b.tracks.size(), 4u);
  EXPECT_EQ(fx.b.tracks.back().a, mm(10, 10));
  EXPECT_EQ(fx.b.tracks.back().b, mm(20, 10));

  // Net B's far segment goes to the bottom: a via at the bend joins it to the top segment.
  Fixture f2;
  EXPECT_EQ(edit::changeLayer(f2.b, {2}, f2.bot).added, 1);
  ASSERT_EQ(f2.b.vias.size(), 1u);
  EXPECT_EQ(f2.b.vias[0].pos, mm(16, 14));
  EXPECT_EQ(f2.unrouted(), 0u);
  // Both segments on the bottom: the via at the bend goes, and the SMD pad end needs one instead.
  auto both = edit::changeLayer(f2.b, {1}, f2.bot);
  EXPECT_EQ(both.added, 1);
  EXPECT_EQ(both.removed, 1);
  ASSERT_EQ(f2.b.vias.size(), 1u);
  EXPECT_EQ(f2.b.vias[0].pos, mm(12, 10));
  EXPECT_EQ(f2.unrouted(), 0u);
}

// A via stays when it still joins two layers, however it does, and when it is fixed.
TEST(Edit, ChangeLayerKeepsAViaThatIsNeeded) {
  auto viaAtTheBend = [] {
    auto f = std::make_unique<Fixture>();
    edit::changeLayer(f->b, {2}, f->bot);
    return f;
  };
  // The third wire ending on it stays on the top.
  auto third = viaAtTheBend();
  third->addTrack(mm(16, 14), mm(16, 20), third->top, third->netB);
  EXPECT_EQ(edit::changeLayer(third->b, {1}, third->bot).removed, 0);
  // A wire of the top going over it, with no end there.
  auto over = viaAtTheBend();
  over->addTrack(mm(14, 14), mm(18, 14), over->top, over->netB);
  EXPECT_EQ(edit::changeLayer(over->b, {1}, over->bot).removed, 0);
  // Locked.
  auto locked = viaAtTheBend();
  locked->b.vias[0].locked = true;
  EXPECT_EQ(edit::changeLayer(locked->b, {1}, locked->bot).removed, 0);
  // Of another wire: a via of the net no moved track ends on is not this tool's.
  auto other = viaAtTheBend();
  Via far = other->b.vias[0];
  far.pos = mm(30, 30);
  other->b.vias.push_back(far);
  EXPECT_EQ(edit::changeLayer(other->b, {1}, other->bot).removed, 1);
  EXPECT_EQ(other->b.vias[0].pos, mm(30, 30));
}

TEST(Edit, UnlinkAndDegenerate) {
  Fixture fx;
  EXPECT_EQ(edit::unlink(fx.b, components({0})), 3);
  ASSERT_EQ(fx.b.tracks.size(), 1u);
  fx.b.tracks[0].b = fx.b.tracks[0].a;
  auto map = edit::removeDegenerate(fx.b);
  EXPECT_TRUE(fx.b.tracks.empty());
  EXPECT_EQ(map[0], -1);
}

TEST(Edit, RoutedBoardStaysConnected) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb);
  Board& b = **lb;
  size_t before = Connectivity::compute(b).ratsnest.size();
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    if (b.components[ci].locked) continue;
    edit::Fragment f = components({ci});
    edit::Motion m;
    m.pivot = edit::pivotOf(b, f);
    m.rotate = 90;
    m.shift = mm(0.7, -0.3).v();
    ASSERT_TRUE(edit::move(b, f, m));
  }
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), before);
}

// A part flipped and turned in the editor is written so that every CAD places its pads where the
// editor shows them.
TEST(Edit, FlippedPartRoundTrips) {
  struct Case {
    const char* file;
    const char* ext;
  };
  for (auto [file, ext] : {Case{"el4134_pcad_ascii.pcb", ".pcb"}, Case{"astable.kicad_pcb", ".kicad_pcb"},
                           Case{"astable.kicad_pcb", ".fst"}}) {
    SCOPED_TRACE(file + std::string(" -> ") + ext);
    auto lb = io::loadBoard(data(file));
    ASSERT_TRUE(lb);
    Board& b = **lb;
    std::vector<Side> sides0;
    for (int ci = 0; ci < int(b.components.size()) && ci < 3; ++ci) {
      sides0.push_back(b.components[ci].side);
      edit::Fragment f = components({ci});
      edit::Motion m;
      m.pivot = edit::pivotOf(b, f);
      m.mirror = true;
      m.rotate = 30 + 60 * ci;
      ASSERT_TRUE(edit::move(b, f, m));
    }
    std::string out = ::testing::TempDir() + "xr_flipped" + ext;
    ASSERT_TRUE(io::saveBoard(b, out));
    auto rb = io::loadBoard(out);
    ASSERT_TRUE(rb) << rb.error();
    const Board& r = **rb;
    for (int ci = 0; ci < 3; ++ci) {
      int rc = r.findComponent(b.components[ci].ref);
      ASSERT_GE(rc, 0);
      EXPECT_NE(r.components[rc].side, sides0[size_t(ci)]);
      ASSERT_EQ(r.components[rc].pads.size(), b.components[ci].pads.size());
      for (size_t k = 0; k < b.components[ci].pads.size(); ++k) {
        const Pad &p = b.pads[b.components[ci].pads[k]], &q = r.pads[r.components[rc].pads[k]];
        EXPECT_NEAR((p.pos.v() - q.pos.v()).len(), 0, 2000) << b.components[ci].ref << " pad " << p.number;
        auto sides = [](const Board& x, LayerMask lm) {
          unsigned m = 0;
          for (LayerId l : x.copperLayers())
            if ((lm >> l) & 1) m |= 1u << x.layers[l].copperIndex;
          return m;
        };
        EXPECT_EQ(sides(b, p.copper), sides(r, q.copper)) << b.components[ci].ref << " pad " << p.number;
      }
    }
  }
}

// Figures by their handles: a rectangle's corner keeps it a rectangle, ends meeting at a vertex go with it, an
// arc's side moved keeps its shape, a line's middle breaks it, a polygon's side gets a vertex.
TEST(Edit, FiguresByTheirHandles) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  std::vector<Graphic> list(4);
  list[0].kind = GraphicKind::Rect;
  list[0].a = mm(0, 0);
  list[0].b = mm(10, 10);
  list[1].kind = GraphicKind::Line;
  list[1].a = mm(10, 0);
  list[1].b = mm(20, 0);
  list[2].kind = GraphicKind::Arc;
  list[2].a = mm(20, 0);
  list[2].m = mm(25, 5);
  list[2].b = mm(30, 0);
  list[3].kind = GraphicKind::Poly;
  list[3].pts = {mm(0, 20), mm(10, 20), mm(10, 30)};
  list[3].layer = 1;  // another layer: nothing of it joins
  edit::moveFigureVertex(list, 0, 1, mm(12, -2));  // the corner (b.x, a.y)
  EXPECT_EQ(list[0].a, (mm(0, -2)));
  EXPECT_EQ(list[0].b, (mm(12, 10)));
  EXPECT_EQ(list[1].a, (mm(12, -2)));
  edit::moveFigureSide(list, 2, mm(0, 4));
  EXPECT_EQ(list[2].a, (mm(20, 4)));
  EXPECT_EQ(list[2].b, (mm(30, 4)));
  EXPECT_NEAR((list[2].m - mm(25, 9)).len(), 0, 1);
  EXPECT_EQ(list[1].b, (mm(20, 4)));  // the line's end met the arc's
  edit::bendFigure(list, 1, 0, mm(16, 6));
  ASSERT_EQ(list.size(), 5u);
  EXPECT_EQ(list[1].b, (mm(16, 6)));
  EXPECT_EQ(list[4].a, (mm(16, 6)));
  EXPECT_EQ(list[4].b, (mm(20, 4)));
  auto mids = edit::figureMiddles(list[3]);
  ASSERT_EQ(mids.size(), 3u);  // closed
  edit::bendFigure(list, 3, 2, mm(0, 30));
  EXPECT_EQ(list[3].pts.size(), 4u);
  EXPECT_EQ(list[3].pts[3], (mm(0, 30)));
  edit::moveFigureVertex(list, 3, 3, mm(0, 20));  // onto its neighbour
  edit::tidyFigure(list[3]);
  EXPECT_EQ(list[3].pts.size(), 3u);
}

// A rectangle stays one by its handles (a side moves across itself), a circle by its centre and rim; a polygon's
// arc side bends through the point it is dragged to.
TEST(Edit, RectanglesAndCirclesKeepTheirKind) {
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  std::vector<Graphic> list(3);
  list[0].kind = GraphicKind::Rect;
  list[0].a = mm(0, 0);
  list[0].b = mm(10, 6);
  ASSERT_EQ(edit::figureMiddles(list[0]).size(), 4u);
  edit::bendFigure(list, 0, 1, mm(14, 2));  // the side x = b.x
  EXPECT_EQ(list[0].kind, GraphicKind::Rect);
  EXPECT_EQ(list[0].b, mm(14, 6));
  EXPECT_EQ(list[0].a, mm(0, 0));
  list[1].kind = GraphicKind::Circle;
  list[1].a = mm(20, 0);
  list[1].b = mm(22, 0);
  edit::moveFigureVertex(list, 1, 0, mm(30, 5));  // the centre takes the circle along
  EXPECT_EQ(list[1].b, mm(32, 5));
  edit::moveFigureVertex(list, 1, 1, mm(30, 8));  // the rim: the radius
  EXPECT_NEAR((list[1].b - list[1].a).len(), 3 * kNmPerMm, 1);
  list[2].kind = GraphicKind::Poly;
  list[2].pts = {mm(0, 20), mm(10, 20), mm(10, 30)};
  list[2].arcs = {90, 0, 0};
  auto mids = edit::figureMiddles(list[2]);
  EXPECT_NEAR((mids[0] - arcMiddle(mm(0, 20), mm(10, 20), 90)).len(), 0, 1);
  edit::bendFigure(list, 2, 0, mm(5, 20));  // onto the chord: straight
  EXPECT_EQ(list[2].arcOf(0), 0);
  EXPECT_EQ(list[2].pts.size(), 3u);
  edit::bendFigure(list, 2, 1, mm(12, 25));  // a straight side: a vertex
  EXPECT_EQ(list[2].pts.size(), 4u);
  EXPECT_EQ(list[2].arcs.size(), 4u);
}

namespace {

// A 20 x 20 mm board, the rules' clearance 1 mm from everything; a copper area of G over the whole of it.
struct PourBoard {
  Board b;
  LayerId top;
  int g, o;
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }
  PourBoard() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    g = b.addNet("G");
    o = b.addNet("O");
    b.netClasses[0].clearance = mmToNm(1);
    b.edgeClearance = mmToNm(1);
    b.outline.push_back({at(0, 0), at(20, 0), at(20, 20), at(0, 20)});
    Zone z;
    z.net = g;
    z.layer = top;
    z.outline = b.outline[0];
    z.removeIslands = false;
    z.minIslandArea = 0;
    z.pads.gap = z.vias.gap = mmToNm(0.5);
    z.pads.spoke = z.vias.spoke = mmToNm(0.5);
    b.zones.push_back(z);
  }
  Zone& zone() { return b.zones[0]; }
  void via(double x, double y, int net) {
    Via v;
    v.pos = Point(at(x, y));
    v.net = net;
    v.diameter = mmToNm(1);
    v.drill = mmToNm(0.5);
    v.layers = b.allCopperMask();
    b.vias.push_back(v);
  }
  void pad(double x, double y, int net) {
    Pad p;
    p.pos = Point(at(x, y));
    p.net = net;
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = b.allCopperMask();
    b.pads.push_back(p);
  }
  bool poured(double x, double y) {
    return r::any_of(zone().filled, [&](const Polyline& f) { return pointInPolygon(at(x, y), f); });
  }
};

}  // namespace

// Pads and vias of the area's net are joined each as the area says: a barrier crossed by spokes, or solid.
TEST(ZoneFill, PadsAndViasHaveTheirOwnConnection) {
  PourBoard t;
  t.via(5, 5, t.g);
  t.pad(15, 5, t.g);
  t.zone().vias.connection = PadConnection::Thermal;
  t.zone().pads.connection = PadConnection::Solid;
  fillZones(t.b);
  EXPECT_FALSE(t.poured(5 + 0.53, 5 + 0.53)) << "the via's barrier, between the spokes";
  EXPECT_TRUE(t.poured(5 + 0.75, 5)) << "its spoke";
  EXPECT_TRUE(t.poured(15 + 0.53, 5 + 0.53)) << "the pad is joined solid";
  t.zone().vias.connection = PadConnection::Solid;
  t.zone().pads.connection = PadConnection::Thermal;
  fillZones(t.b);
  EXPECT_TRUE(t.poured(5 + 0.53, 5 + 0.53));
  EXPECT_FALSE(t.poured(15 + 0.53, 5 + 0.53));
}

// The clearance is the rules' unless the area uses its own, and then that one holds for everything, the edge too.
TEST(ZoneFill, OwnClearanceForEverything) {
  PourBoard t;
  t.via(10, 10, t.o);
  fillZones(t.b);
  EXPECT_FALSE(t.poured(10 + 0.5 + 0.5, 10)) << "the rule, 1 mm";
  EXPECT_FALSE(t.poured(0.5, 10)) << "the edge's rule";
  t.zone().clearance = mmToNm(5);
  fillZones(t.b);
  EXPECT_TRUE(t.poured(10 + 0.5 + 2, 10)) << "not used: only the rules";
  t.zone().clearance = mmToNm(0.2);
  t.zone().useClearance = true;
  fillZones(t.b);
  EXPECT_TRUE(t.poured(10 + 0.5 + 0.5, 10));
  EXPECT_TRUE(t.poured(0.5, 10));
  EXPECT_FALSE(t.poured(10 + 0.5 + 0.1, 10));
  EXPECT_FALSE(t.poured(0.1, 10));
}

// A strip of the area cut off from the rest: it goes when the area removes what is not connected, and when it is
// smaller than the area's minimum, connected or not.
TEST(ZoneFill, IslandsByTheAreasSettings) {
  PourBoard t;
  t.b.netClasses[0].clearance = mmToNm(0.2);
  t.b.edgeClearance = 0;
  t.zone().cutouts.push_back({PourBoard::at(4, -1), PourBoard::at(5, -1), PourBoard::at(5, 21), PourBoard::at(4, 21)});
  t.via(10, 10, t.g);
  fillZones(t.b);
  EXPECT_TRUE(t.poured(2, 10)) << "kept: the area does not remove them";
  t.zone().removeIslands = true;
  fillZones(t.b);
  EXPECT_FALSE(t.poured(2, 10));
  EXPECT_TRUE(t.poured(10 + 3, 10));
  t.zone().removeIslands = false;
  t.zone().minIslandArea = 100e12;  // 100 mm²: the strip has 80
  fillZones(t.b);
  EXPECT_FALSE(t.poured(2, 10));
  EXPECT_TRUE(t.poured(10 + 3, 10));
}
