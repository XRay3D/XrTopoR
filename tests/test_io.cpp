#include <gtest/gtest.h>

#include <algorithm>
#include <filesystem>

#include "core/Connectivity.h"
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
