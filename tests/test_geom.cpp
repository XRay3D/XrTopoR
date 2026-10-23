#include <gtest/gtest.h>

#include "geom/Geometry.h"
#include "geom/Shape.h"

using namespace xr;

TEST(Geometry, SegmentDistance) {
  EXPECT_DOUBLE_EQ(distPointSegment({0, 1}, {-1, 0}, {1, 0}), 1.0);
  EXPECT_DOUBLE_EQ(distPointSegment({3, 0}, {-1, 0}, {1, 0}), 2.0);
  EXPECT_DOUBLE_EQ(distSegmentSegment({0, 0}, {1, 0}, {0, 1}, {1, 1}), 1.0);
  EXPECT_DOUBLE_EQ(distSegmentSegment({0, 0}, {2, 2}, {0, 2}, {2, 0}), 0.0);
}

TEST(Geometry, PolygonContainment) {
  Polyline sq = {{0, 0}, {10, 0}, {10, 10}, {0, 10}};
  EXPECT_TRUE(pointInPolygon({5, 5}, sq));
  EXPECT_FALSE(pointInPolygon({15, 5}, sq));
  EXPECT_DOUBLE_EQ(distPointPolygon({5, 5}, sq), 0.0);
  EXPECT_DOUBLE_EQ(distPointPolygon({13, 5}, sq), 3.0);
  EXPECT_DOUBLE_EQ(std::abs(polygonArea(sq)), 100.0);
}

TEST(Geometry, ArcFromThreePoints) {
  auto g = ArcGeom::fromThreePoints({1, 0}, {0, 1}, {-1, 0});
  ASSERT_TRUE(g.valid);
  EXPECT_NEAR(g.radius, 1.0, 1e-9);
  EXPECT_NEAR(g.center.x, 0, 1e-9);
  EXPECT_NEAR(std::abs(g.sweep), kPi, 1e-9);
  EXPECT_NEAR(g.mid().y, 1.0, 1e-9);
  auto pts = g.tessellate(0.01);
  EXPECT_GT(pts.size(), 5u);
  EXPECT_NEAR(pts.back().x, -1.0, 1e-9);
}

TEST(Geometry, Fracture) {
  Polyline outer = {{0, 0}, {10, 0}, {10, 10}, {0, 10}};
  Polyline hole = {{4, 4}, {6, 4}, {6, 6}, {4, 6}};
  auto f = fracture(outer, {hole});
  EXPECT_FALSE(pointInPolygon({5, 5}, f));
  EXPECT_TRUE(pointInPolygon({2, 2}, f));
}

TEST(Shape, Distances) {
  Shape a = Shape::circle({0, 0}, 1);
  Shape b = Shape::circle({5, 0}, 1);
  EXPECT_DOUBLE_EQ(a.distance(b), 3.0);
  Shape cap = Shape::capsule({0, 0}, {10, 0}, 0.5);
  EXPECT_DOUBLE_EQ(cap.distance({5, 3}), 2.5);
  Shape r = Shape::rect({0, 0}, 4, 2, 0, 0);
  EXPECT_EQ(r.kind, Shape::Kind::Polygon);
  EXPECT_DOUBLE_EQ(r.distance({5, 0}), 3.0);
  EXPECT_DOUBLE_EQ(r.distance(cap), 0.0);
  Shape rr = Shape::rect({0, 0}, 4, 2, 0, 1);  // oval-like
  EXPECT_EQ(rr.kind, Shape::Kind::Segment);
  EXPECT_NEAR(rr.distance({0, 5}), 4.0, 1e-9);
}

TEST(Shape, OutlineAndRayExit) {
  Shape r = Shape::rect({0, 0}, 4, 2, 0, 0.5);
  auto o = r.outline(0.01);
  EXPECT_GT(o.size(), 8u);
  BBox bb = r.bbox();
  EXPECT_NEAR(bb.width(), 4.0, 1e-9);
  EXPECT_NEAR(bb.height(), 2.0, 1e-9);
  EXPECT_NEAR(r.rayExit({0, 0}, {1, 0}), 2.0, 1e-6);
  EXPECT_DOUBLE_EQ(r.rayExit({10, 0}, {1, 0}), 0.0);
}
