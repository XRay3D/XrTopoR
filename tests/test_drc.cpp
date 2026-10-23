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
