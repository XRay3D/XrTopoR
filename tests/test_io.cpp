#include <gtest/gtest.h>

#include <algorithm>
#include <filesystem>

#include "core/Connectivity.h"
#include "core/ZoneFill.h"
#include "io/BoardIO.h"
#include "io/sexpr/SExpr.h"

using namespace xr;

static std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

TEST(SExpr, ParseAndWrite) {
  auto root = sexpr::parse("(a 1 \"two words\" (b 2.5) (c))");
  ASSERT_EQ(root.kids.size(), 1u);
  const auto& a = root.kids[0];
  EXPECT_TRUE(a.is("a"));
  EXPECT_EQ(a.arg(0), "1");
  EXPECT_EQ(a.arg(1), "two words");
  EXPECT_DOUBLE_EQ(a.find("b")->num(0), 2.5);
  std::string w = sexpr::write(a);
  EXPECT_NE(w.find("\"two words\""), std::string::npos);
  sexpr::ParseOptions o;
  o.dsnQuoting = true;
  auto d = sexpr::parse("(pcb x (parser (string_quote ')) (net 'a b'))", o);
  EXPECT_EQ(d.kids[0].find("net")->arg(0), "a b");
}

TEST(KicadIO, ReadBoards) {
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b) << b.error();
  EXPECT_EQ((*b)->components.size(), 11u);
  EXPECT_EQ((*b)->pads.size(), 24u);
  EXPECT_EQ((*b)->copperCount(), 2);
  EXPECT_EQ((*b)->outline.size(), 1u);
  auto c = Connectivity::compute(**b);
  EXPECT_EQ(c.ratsnest.size(), 0u);  // fully routed board

  auto tt = io::loadBoard(data("tt.kicad_pcb"));  // KiCad 11 (transform) format
  ASSERT_TRUE(tt);
  EXPECT_EQ((*tt)->components.size(), 35u);
  EXPECT_EQ(Connectivity::compute(**tt).ratsnest.size(), 0u);
}

TEST(KicadIO, RoundTripPreservesCounts) {
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  std::string text = io::writeKicad(**b);
  auto again = io::readKicad(text, "x.kicad_pcb");
  ASSERT_TRUE(again);
  EXPECT_EQ((*again)->components.size(), (*b)->components.size());
  EXPECT_EQ((*again)->pads.size(), (*b)->pads.size());
  EXPECT_EQ((*again)->tracks.size(), (*b)->tracks.size());
  EXPECT_EQ((*again)->nets.size(), (*b)->nets.size());
  EXPECT_EQ((*again)->pads[3].pos, (*b)->pads[3].pos);
}

TEST(DsnIO, ReadDsnAndApplySes) {
  auto b = io::loadBoard(data("adg508f_single.dsn"));
  ASSERT_TRUE(b) << b.error();
  Board& brd = **b;
  EXPECT_EQ(brd.components.size(), 74u);
  EXPECT_EQ(brd.nets.size(), 82u);
  EXPECT_EQ(brd.netClasses.size(), 3u);
  BBox bb = brd.bbox();
  EXPECT_NEAR(bb.width() / kNmPerMm, 112.0, 0.01);
  auto ses = io::readFile(data("adg508f_single.ses"));
  ASSERT_TRUE(ses);
  ASSERT_TRUE(io::applySes(brd, *ses));
  EXPECT_GT(brd.tracks.size(), 100u);
  EXPECT_EQ(brd.vias.size(), 16u);
  // Generated DSN parses back with the same pins.
  auto d2 = io::readDsn(io::writeDsn(brd), "x.dsn");
  ASSERT_TRUE(d2);
  EXPECT_EQ((*d2)->pads.size(), brd.pads.size());
  EXPECT_EQ((*d2)->nets.size(), brd.nets.size());
}

TEST(PcadIO, ReadAscii) {
  auto b = io::loadBoard(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(b) << b.error();
  EXPECT_EQ((*b)->components.size(), 52u);
  EXPECT_EQ((*b)->nets.size(), 43u);
  EXPECT_EQ((*b)->vias.size(), 19u);
  EXPECT_GE((*b)->zones.size(), 2u);
  EXPECT_EQ((*b)->outline.size(), 1u);
  // The original routing connects everything except a few known opens.
  auto c = Connectivity::compute(**b);
  EXPECT_LE(c.ratsnest.size(), 3u);
}

// What a P-CAD design holds beside the copper: a pattern's other graphics, as an instance names them (a connector
// placed by its «Second»: other pads), the bridges of a pour to its pads, the texts and their styles.
TEST(PcadIO, PatternGraphicsThermalsAndTexts) {
  auto file = io::readFile(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(file) << file.error();
  std::string text = *file;
  auto insertAt = [&](size_t at, const std::string& what) {
    ASSERT_NE(at, std::string::npos);
    text.insert(at, what);
  };
  insertAt(text.find("(padStyleDef"), R"((textStyleDef "T60" (font (fontType Stroke) (fontHeight 50.0) (strokeWidth 6.0))
    (font (fontType TrueType) (fontFace "Arial") (fontHeight 60.0)) (textStyleAllowTType True) (textStyleDisplayTType True))
  (textStyleDef "S50" (font (fontType Stroke) (fontHeight 50.0) (strokeWidth 6.0)) (textStyleDisplayTType False))
  (patternDefExtended "TWO_WAYS" (patternGraphicsNameRef "Primary")
    (patternGraphicsDef (patternGraphicsNameDef "Primary") (multiLayer (pad (padNum 1) (padStyleRef "smd40x48") (pt 100.0 200.0))))
    (patternGraphicsDef (patternGraphicsNameDef "Second") (multiLayer (pad (padNum 1) (padStyleRef "smd40x48") (pt 300.0 400.0)))))
  )");
  const size_t design = text.find("\n  (multiLayer");
  insertAt(design + 15, R"((pattern (patternRef "TWO_WAYS") (refDesRef "ZA") (pt 1000.0 1000.0) (patternGraphicsNameRef "Second"))
    (pattern (patternRef "TWO_WAYS") (refDesRef "ZB") (pt 2000.0 1000.0))
    )");
  insertAt(text.find("(layerContents (layerNumRef 1)", design) + 30, R"(
    (text (pt 500.0 600.0) "NOTE" (textStyleRef "T60") (rotation 90.0) (justify Center))
    (text (pt 700.0 600.0) "BACK" (textStyleRef "S50") (rotation 20.0) (isFlipped True) (justify UpperRight))
    (copperPour95 (useDesignRules False) (pourBackoff 12.0) (thermalType Therm90) (thermalWidth 10.0) (viaThermalType Therm45) (viaThermalWidth 15.0)
      (pcbPoly (pt 0.0 0.0) (pt 100.0 0.0) (pt 100.0 100.0))
      (island (islandOutline (pt 0.0 0.0) (pt 100.0 0.0) (pt 100.0 100.0))
        (thermal (pt 10.0 10.0) (pt 50.0 10.0) (thermalWidth 10.0))))
    )");
  auto r = io::readPcad(text, "t.pcb");
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  auto padOf = [&](const char* ref) { return b.pads[size_t(b.components[size_t(b.findComponent(ref))].pads[0])].pos.v(); };
  auto mil = [](double v) { return v * kNmPerMil; };
  EXPECT_NEAR(padOf("ZA").x, mil(1300), 1);
  EXPECT_NEAR(padOf("ZA").y, -mil(1400), 1);
  EXPECT_NEAR(padOf("ZB").x, mil(2100), 1) << "no graphics named: the pattern's own";
  EXPECT_NEAR(padOf("ZB").y, -mil(1200), 1);

  auto textOf = [&](const char* what) { return r::find(b.texts, std::string(what), &Text::text); };
  ASSERT_NE(textOf("NOTE"), b.texts.end());
  ASSERT_NE(textOf("BACK"), b.texts.end());
  const Text& note = *textOf("NOTE");
  EXPECT_NEAR(note.pos.x, mil(500), 1);
  EXPECT_NEAR(note.pos.y, -mil(600), 1);
  EXPECT_EQ(note.angle, 90);
  EXPECT_EQ(note.align, TextAlign::CM);
  EXPECT_FALSE(note.mirror);
  EXPECT_EQ(b.styleOf(note).font, "Arial");
  EXPECT_NEAR(double(b.styleOf(note).height), mil(60 * 1.1875), 1);
  const Text& back = *textOf("BACK");
  EXPECT_TRUE(back.mirror);
  EXPECT_EQ(back.angle, 340) << "turned the other way: the model mirrors first";
  EXPECT_EQ(back.align, TextAlign::RT);
  EXPECT_EQ(b.styleOf(back).font, "QUALITY");
  EXPECT_NEAR(double(b.styleOf(back).height), mil(50), 1);

  // The island and its bridge, 40 x 10 mil.
  auto z = r::find_if(b.zones, [](const Zone& x) { return x.filled.size() == 2; });
  ASSERT_NE(z, b.zones.end());
  BBox bridge;
  for (Vec2 p : z->filled[1]) bridge.add(p);
  EXPECT_NEAR(bridge.width(), mil(40), 1);
  EXPECT_NEAR(bridge.height(), mil(10), 1);
  EXPECT_NEAR(bridge.center().x, mil(30), 1);
  EXPECT_NEAR(bridge.center().y, -mil(10), 1);
  // Its settings: its own clearance, the thermals of pads and vias apart.
  EXPECT_TRUE(z->useClearance);
  EXPECT_EQ(z->clearance, Coord(mil(12)));
  EXPECT_EQ(z->pads.connection, PadConnection::Thermal);
  EXPECT_EQ(z->pads.spoke, Coord(mil(10)));
  EXPECT_EQ(z->vias.connection, PadConnection::Thermal);
  EXPECT_EQ(z->vias.spoke, Coord(mil(15)));
  EXPECT_EQ(z->vias.angle, 45);
}

// The copper of a fill, holes taken away, nm².
static double islandsArea(const Zone& z) {
  double a = 0;
  for (const Island& i : zoneIslands(z)) {
    a += std::abs(polygonArea(i.outer));
    for (const Polyline& h : i.holes) a -= std::abs(polygonArea(h));
  }
  return a;
}

TEST(PcadIO, PoursAreSavedAsTheAreasAre) {
  auto b = io::loadBoard(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(b);
  Board& bd = **b;
  ASSERT_FALSE(bd.zones.empty());
  ASSERT_TRUE(r::any_of(bd.zones, [](const Zone& z) { return !z.filled.empty(); }));
  // Changed here: the first area's settings, a new area poured with a hole in it.
  bd.zones[0].useClearance = true;
  bd.zones[0].clearance = mmToNm(0.4);
  bd.zones[0].pads.angle = 45;
  Zone fresh;
  fresh.layer = bd.zones[0].layer;
  fresh.net = bd.zones[0].net;
  const double s = mmToNm(5);
  fresh.outline = {{0, 0}, {s, 0}, {s, s}, {0, s}};
  fresh.filled = {fracture(fresh.outline, {{{s / 4, s / 4}, {s / 2, s / 4}, {s / 2, s / 2}, {s / 4, s / 2}}})};
  bd.zones.push_back(fresh);

  auto text = io::writePcad(bd);
  ASSERT_TRUE(text) << text.error();
  auto again = io::readPcad(*text, "x.pcb");
  ASSERT_TRUE(again) << again.error();
  const Board& b2 = **again;
  ASSERT_EQ(b2.zones.size(), bd.zones.size());
  // Read back layer by layer: an area is found by its layer and outline.
  auto same = [&](const Zone& z) {
    return [&](const Zone& x) {
      return x.layer == z.layer && x.outline.size() == z.outline.size() && (x.outline[0] - z.outline[0]).len() < 1000;
    };
  };
  for (size_t i = 0; i < bd.zones.size(); ++i) {
    const Zone& was = bd.zones[i];
    auto it = r::find_if(b2.zones, same(was));
    ASSERT_NE(it, b2.zones.end()) << i;
    const Zone& now = *it;
    EXPECT_EQ(now.net, was.net) << i;
    const double area = islandsArea(was);
    EXPECT_NEAR(islandsArea(now), area, area * 1e-4 + 1e6) << "the fill of area " << i << " is saved";
  }
  const Zone& first = *r::find_if(b2.zones, same(bd.zones[0]));
  EXPECT_GT(islandsArea(first), 0);
  EXPECT_TRUE(first.useClearance);
  EXPECT_EQ(first.clearance, mmToNm(0.4));
  EXPECT_EQ(first.pads.angle, 45);
  const Zone& made = *r::find_if(b2.zones, same(fresh));
  const auto islands = zoneIslands(made);
  ASSERT_EQ(islands.size(), 1u);
  EXPECT_EQ(islands[0].holes.size(), 1u) << "the hole of a fractured fill is a cutout of its island";
  EXPECT_NEAR(islandsArea(made), s * s * (1 - 1.0 / 16), 1e6);

  // An area deleted is gone from the file; the others keep their own settings.
  bd.zones.erase(bd.zones.begin());
  auto t3 = io::writePcad(bd);
  ASSERT_TRUE(t3);
  auto b3 = io::readPcad(*t3, "y.pcb");
  ASSERT_TRUE(b3);
  EXPECT_EQ((*b3)->zones.size(), bd.zones.size());
}

TEST(PcadIO, WriterRoundTripAndRouting) {
  auto b = io::loadBoard(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(b);
  auto text = io::writePcad(**b);
  ASSERT_TRUE(text) << text.error();
  ASSERT_EQ(text->rfind("ACCEL_ASCII", 0), 0u);
  auto again = io::readPcad(*text, "x.pcb");
  ASSERT_TRUE(again) << again.error();
  EXPECT_EQ((*again)->components.size(), (*b)->components.size());
  EXPECT_EQ((*again)->tracks.size(), (*b)->tracks.size());
  EXPECT_EQ((*again)->vias.size(), (*b)->vias.size());
  EXPECT_EQ((*again)->pads[10].pos, (*b)->pads[10].pos);
  // Moved component and new arc track survive the round trip.
  (*b)->moveComponent(3, (*b)->components[3].pos + Point(mmToNm(1), 0));
  Track arc;
  arc.a = {mmToNm(60), -mmToNm(90)};
  arc.mid = Point(mmToNm(61), -mmToNm(91));
  arc.b = {mmToNm(62), -mmToNm(90)};
  arc.width = mmToNm(0.3);
  arc.layer = (*b)->topCopper();
  arc.net = 0;
  (*b)->tracks.push_back(arc);
  auto t2 = io::writePcad(**b);
  ASSERT_TRUE(t2);
  auto b2 = io::readPcad(*t2, "y.pcb");
  ASSERT_TRUE(b2);
  EXPECT_EQ((*b2)->components[3].pos, (*b)->components[3].pos);
  // Tracks are read layer by layer: find the arc by its end point.
  auto it = r::find_if((*b2)->tracks, [&](const Track& t) {
    auto near = [](Point p, Point q) { return (p.v() - q.v()).len() < 1000; };
    return t.isArc() && ((near(t.a, arc.a) && near(t.b, arc.b)) || (near(t.a, arc.b) && near(t.b, arc.a)));
  });
  ASSERT_NE(it, (*b2)->tracks.end());
  EXPECT_NEAR(double(it->mid->x), double(arc.mid->x), 1000);
  EXPECT_NEAR(double(it->mid->y), double(arc.mid->y), 1000);
}

// The labels of the components' attributes: P-CAD keeps a label's point from the pattern's origin on the board,
// TopoR in the footprint's frame; both are read to the same place, written back and go with their component.
TEST(PcadIO, AttributeLabels) {
  auto pc = io::loadBoard(data("topor/Example_02/Placement_master.pcb"));
  auto fs = io::loadBoard(data("topor/Example_02/Placement.fst"));
  ASSERT_TRUE(pc && fs);
  // R51 turned by 270°: «RefDes» 6.25 mm below its origin, read along the component.
  auto rel = [](const Board& b, int ci, const char* attr) {
    int t = b.labelOf(ci, attr);
    EXPECT_GE(t, 0) << attr;
    return t < 0 ? std::pair{Vec2{}, 0.0} : std::pair{b.texts[size_t(t)].pos - b.components[size_t(ci)].pos.v(), b.texts[size_t(t)].angle};
  };
  for (const Board* b : {pc->get(), fs->get()}) {
    const int ci = b->findComponent("R51");
    ASSERT_GE(ci, 0);
    auto [d, angle] = rel(*b, ci, "RefDes");
    EXPECT_NEAR(d.x, 0, 1000);
    EXPECT_NEAR(d.y, mmToNm(6.25), 1000);
    EXPECT_NEAR(angle, 270, 1e-6);
    EXPECT_EQ(b->texts[size_t(b->labelOf(ci, "RefDes"))].text, "R51");
    EXPECT_EQ(b->labelOf(ci, "Type"), -1);  // not shown
    EXPECT_EQ(b->attributeValue(ci, "Type"), "R025");
  }

  Board& b = **pc;
  const int ci = b.findComponent("R51");
  const int type = b.addLabel(ci, "Type");
  ASSERT_GE(type, 0);
  EXPECT_EQ(b.texts[size_t(type)].text, "R025");
  // With the component: moved, turned.
  b.moveComponent(ci, b.components[size_t(ci)].pos + Point(mmToNm(2), 0));
  b.rotateComponent(ci, 90);
  {
    auto [d, angle] = rel(b, ci, "RefDes");
    EXPECT_NEAR(d.x, mmToNm(6.25), 1000);
    EXPECT_NEAR(d.y, 0, 1000);
    EXPECT_NEAR(angle, 0, 1e-6);
  }
  const auto refAt = rel(b, ci, "RefDes"), typeAt = rel(b, ci, "Type");

  // Written and read again: P-CAD and TopoR.
  auto pcad = io::writePcad(b);
  ASSERT_TRUE(pcad) << pcad.error();
  auto b2 = io::readPcad(*pcad, "x.pcb");
  ASSERT_TRUE(b2);
  auto b3 = io::readFst(io::writeFst(b), "x.fst");
  ASSERT_TRUE(b3);
  for (const Board* o : {b2->get(), b3->get()}) {
    const int c2 = o->findComponent("R51");
    for (auto [attr, want] : {std::pair{"RefDes", refAt}, std::pair{"Type", typeAt}}) {
      auto [d, angle] = rel(*o, c2, attr);
      EXPECT_NEAR(d.x, want.first.x, 1000) << attr;
      EXPECT_NEAR(d.y, want.first.y, 1000) << attr;
      EXPECT_NEAR(std::remainder(angle - want.second, 360.0), 0, 1e-3) << attr;
    }
  }

  // A label taken away stays away; the attribute stays.
  b.texts.erase(b.texts.begin() + b.labelOf(ci, "Type"));
  auto b4 = io::readPcad(*io::writePcad(b), "y.pcb");
  ASSERT_TRUE(b4);
  const int c4 = (*b4)->findComponent("R51");
  EXPECT_EQ((*b4)->labelOf(c4, "Type"), -1);
  EXPECT_GE((*b4)->labelOf(c4, "RefDes"), 0);
  EXPECT_EQ((*b4)->attributeValue(c4, "Type"), "R025");
}
