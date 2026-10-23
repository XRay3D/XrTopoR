#include <gtest/gtest.h>

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
