#include <gtest/gtest.h>

#include "geom/Geometry.h"
#include <random>

#include "geom/PolyIndex.h"
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
  EXPECT_LE(r.distance(cap), 0.0);  // overlapping: negative depth
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

// The sides of a large polygon in a grid (PolyIndex): the answers of the plain loops over every side, to the bit
// (the same functions are called, on the sides near), and with a cutoff the distance when it is within it.
TEST(Geometry, PolyIndexAnswersAsThePlainLoops) {
  std::mt19937 rng(7);
  std::uniform_real_distribution<double> u(0, 1);
  // A star of 700 points about the origin, radii 20 to 60 mm: narrow spikes, concave between them.
  Polyline poly;
  const int n = 700;
  for (int i = 0; i < n; ++i) {
    double ang = 2 * kPi * i / n, rad = (20 + 40 * u(rng)) * 1e6;
    poly.push_back({std::round(rad * std::cos(ang)), std::round(rad * std::sin(ang))});
  }
  PolyIndex ix(poly);
  auto plainPoint = [&](Vec2 p) {
    double d = std::numeric_limits<double>::max();
    for (size_t i = 0, j = poly.size() - 1; i < poly.size(); j = i++) d = std::min(d, distPointSegment(p, poly[j], poly[i]));
    return d;
  };
  auto plainSegment = [&](Vec2 a, Vec2 b) {
    double d = std::numeric_limits<double>::max();
    for (size_t i = 0, j = poly.size() - 1; i < poly.size(); j = i++) d = std::min(d, distSegmentSegment(a, b, poly[j], poly[i]));
    return d;
  };
  auto point = [&] { return Vec2{(u(rng) - 0.5) * 160e6, (u(rng) - 0.5) * 160e6}; };
  for (int k = 0; k < 4000; ++k) {
    const Vec2 p = k % 5 == 0 ? poly[size_t(k) % poly.size()] + Vec2{u(rng) * 2000 - 1000, u(rng) * 2000 - 1000} : point();
    ASSERT_EQ(ix.contains(p), pointInPolygon(p, poly)) << k;
    const double d = plainPoint(p);
    ASSERT_EQ(ix.distPoint(p), d) << k;
    const double cut = u(rng) * 5e6;
    if (d <= cut) ASSERT_EQ(ix.distPoint(p, cut), d) << k;
    else ASSERT_GT(ix.distPoint(p, cut), cut) << k;
    const Vec2 q = p + Vec2{(u(rng) - 0.5) * 6e6, (u(rng) - 0.5) * 6e6};
    const double ds = plainSegment(p, q);
    ASSERT_EQ(ix.distSegment(p, q), ds) << k;
    if (ds <= cut) ASSERT_EQ(ix.distSegment(p, q, cut), ds) << k;
    else ASSERT_GT(ix.distSegment(p, q, cut), cut) << k;
  }
  // The shapes: an indexed polygon against circles, capsules and a rectangle, as the plain one.
  const Shape plain = Shape::polygon(poly), fast = Shape::indexedPolygon(poly);
  ASSERT_TRUE(fast.index);
  for (int k = 0; k < 2000; ++k) {
    const Vec2 p = point(), q = p + Vec2{(u(rng) - 0.5) * 8e6, (u(rng) - 0.5) * 8e6};
    const double rad = u(rng) * 1e6;
    for (const Shape& s : {Shape::circle(p, rad), Shape::capsule(p, q, rad), Shape::rect(p, 3e6, 1e6, u(rng) * kPi, 0.1e6)}) {
      ASSERT_EQ(fast.distance(s), plain.distance(s)) << k;
      ASSERT_EQ(s.distance(fast), s.distance(plain)) << k;
      ASSERT_EQ(fast.contains(p), plain.contains(p)) << k;
      const double d = plain.distance(s);
      if (d <= 1000) ASSERT_EQ(fast.distance(s, 1000), d) << k;
      else ASSERT_GT(fast.distance(s, 1000), 1000) << k;
    }
  }
}

// rayExit by the formula (a disc, a capsule, a convex polygon with its rounding) is where the halving of the ray
// ends: checked against the halving done here, from points inside, in every direction.
TEST(Shape, RayExitByFormulaIsTheHalvings) {
  std::mt19937 rng(11);
  std::uniform_real_distribution<double> u(0, 1);
  auto halved = [](const Shape& s, Vec2 p, Vec2 d) {
    if (!s.contains(p)) return 0.0;
    BBox bb = s.bbox();
    double hi = std::hypot(bb.width(), bb.height()) + 1, lo = 0;
    for (int i = 0; i < 60; ++i) {
      double m = (lo + hi) / 2;
      if (s.contains(p + d * m)) lo = m; else hi = m;
    }
    return hi;
  };
  for (int k = 0; k < 3000; ++k) {
    const Vec2 c{u(rng) * 50e6, u(rng) * 50e6};
    const double ang = u(rng) * 2 * kPi, rad = (0.05 + u(rng)) * 1e6;
    Shape s;
    switch (k % 4) {
      case 0: s = Shape::circle(c, rad); break;
      case 1: s = Shape::capsule(c, c + Vec2{std::cos(ang), std::sin(ang)} * (u(rng) * 4e6), rad); break;
      case 2: s = Shape::rect(c, (0.3 + u(rng) * 3) * 1e6, (0.3 + u(rng) * 3) * 1e6, ang, u(rng) < 0.5 ? 0.0 : 0.1e6); break;
      default: {  // a convex polygon: points on an ellipse, rounded or not
        Polyline pts;
        const int n = 3 + k % 6;
        for (int i = 0; i < n; ++i) {
          const double t = 2 * kPi * (i + 0.3 * u(rng)) / n;
          pts.push_back(c + Vec2{2e6 * std::cos(t), 1e6 * std::sin(t)}.rotated(ang));
        }
        s = Shape::polygon(pts, u(rng) < 0.5 ? 0.0 : 0.15e6);
      }
    }
    const BBox bb = s.bbox();
    const Vec2 p{bb.minX + u(rng) * bb.width(), bb.minY + u(rng) * bb.height()};
    const double dir = u(rng) * 2 * kPi;
    const Vec2 d{std::cos(dir), std::sin(dir)};
    ASSERT_NEAR(s.rayExit(p, d), halved(s, p, d), 1e-3) << k;
  }
}
