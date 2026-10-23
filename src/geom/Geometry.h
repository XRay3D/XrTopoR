#pragma once
// Basic geometry: integer board coordinates (nanometres) and double-precision vector math.
#include <cmath>
#include <cstdint>
#include <limits>
#include <optional>
#include <vector>

namespace xr {

using Coord = std::int64_t;  // nanometres

constexpr Coord kNmPerMm = 1'000'000;
constexpr Coord kNmPerMil = 25'400;
constexpr double kPi = 3.14159265358979323846;

inline Coord mmToNm(double mm) { return static_cast<Coord>(std::llround(mm * kNmPerMm)); }
inline Coord milToNm(double mil) { return static_cast<Coord>(std::llround(mil * kNmPerMil)); }
inline double nmToMm(double nm) { return nm / kNmPerMm; }
inline double degToRad(double d) { return d * kPi / 180.0; }
inline double radToDeg(double r) { return r * 180.0 / kPi; }

struct Vec2 {
  double x = 0, y = 0;
  constexpr Vec2() = default;
  constexpr Vec2(double x_, double y_) : x(x_), y(y_) {}
  Vec2 operator+(Vec2 o) const { return {x + o.x, y + o.y}; }
  Vec2 operator-(Vec2 o) const { return {x - o.x, y - o.y}; }
  Vec2 operator*(double s) const { return {x * s, y * s}; }
  Vec2 operator/(double s) const { return {x / s, y / s}; }
  Vec2 operator-() const { return {-x, -y}; }
  Vec2& operator+=(Vec2 o) { x += o.x; y += o.y; return *this; }
  Vec2& operator-=(Vec2 o) { x -= o.x; y -= o.y; return *this; }
  bool operator==(const Vec2&) const = default;
  double dot(Vec2 o) const { return x * o.x + y * o.y; }
  double cross(Vec2 o) const { return x * o.y - y * o.x; }
  double len2() const { return x * x + y * y; }
  double len() const { return std::sqrt(len2()); }
  Vec2 normalized() const { double l = len(); return l > 0 ? Vec2{x / l, y / l} : Vec2{}; }
  Vec2 perp() const { return {-y, x}; }  // rotate +90 degrees
  // Rotation by angle (radians), counter-clockwise in a Y-up frame.
  Vec2 rotated(double a) const {
    double c = std::cos(a), s = std::sin(a);
    return {x * c - y * s, x * s + y * c};
  }
};

struct Point {
  Coord x = 0, y = 0;
  constexpr Point() = default;
  constexpr Point(Coord x_, Coord y_) : x(x_), y(y_) {}
  explicit Point(Vec2 v) : x(std::llround(v.x)), y(std::llround(v.y)) {}
  bool operator==(const Point&) const = default;
  Point operator+(Point o) const { return {x + o.x, y + o.y}; }
  Point operator-(Point o) const { return {x - o.x, y - o.y}; }
  Vec2 v() const { return {double(x), double(y)}; }
};

struct BBox {
  double minX = std::numeric_limits<double>::max();
  double minY = std::numeric_limits<double>::max();
  double maxX = std::numeric_limits<double>::lowest();
  double maxY = std::numeric_limits<double>::lowest();
  bool valid() const { return minX <= maxX && minY <= maxY; }
  void add(Vec2 p) {
    minX = std::min(minX, p.x); minY = std::min(minY, p.y);
    maxX = std::max(maxX, p.x); maxY = std::max(maxY, p.y);
  }
  void add(const BBox& b) { if (b.valid()) { add(Vec2{b.minX, b.minY}); add(Vec2{b.maxX, b.maxY}); } }
  BBox inflated(double d) const { return {minX - d, minY - d, maxX + d, maxY + d}; }
  bool intersects(const BBox& o) const {
    return valid() && o.valid() && minX <= o.maxX && o.minX <= maxX && minY <= o.maxY && o.minY <= maxY;
  }
  bool contains(Vec2 p) const { return p.x >= minX && p.x <= maxX && p.y >= minY && p.y <= maxY; }
  Vec2 center() const { return {(minX + maxX) / 2, (minY + maxY) / 2}; }
  double width() const { return maxX - minX; }
  double height() const { return maxY - minY; }
};

using Polyline = std::vector<Vec2>;

// --- primitive queries ---
double distPointSegment(Vec2 p, Vec2 a, Vec2 b);
Vec2 closestPointOnSegment(Vec2 p, Vec2 a, Vec2 b);
bool segmentsIntersect(Vec2 a, Vec2 b, Vec2 c, Vec2 d);
double distSegmentSegment(Vec2 a, Vec2 b, Vec2 c, Vec2 d);
double orient(Vec2 a, Vec2 b, Vec2 c);  // >0 if c is left of a->b
bool pointInPolygon(Vec2 p, const Polyline& poly);
double polygonArea(const Polyline& poly);  // signed
// Merges holes into the outer contour with zero-width slits ("keyholes") so the result
// is a single weakly-simple polygon usable by point-in-polygon and distance queries.
Polyline fracture(const Polyline& outer, std::vector<Polyline> holes);
// Distance between a point and a polygon boundary/interior (0 if inside).
double distPointPolygon(Vec2 p, const Polyline& poly);
double distSegmentPolygon(Vec2 a, Vec2 b, const Polyline& poly);
double distPolygonPolygon(const Polyline& a, const Polyline& b);

// Circular arc defined by start, mid and end points.
struct ArcGeom {
  Vec2 center;
  double radius = 0;
  double startAngle = 0;  // radians
  double sweep = 0;       // radians, signed (+ = counter-clockwise in Y-up math frame)
  bool valid = false;
  static ArcGeom fromThreePoints(Vec2 s, Vec2 m, Vec2 e);
  static ArcGeom fromCenter(Vec2 c, Vec2 s, double sweep);
  Vec2 pointAt(double t) const;  // t in [0,1]
  Vec2 start() const { return pointAt(0); }
  Vec2 end() const { return pointAt(1); }
  Vec2 mid() const { return pointAt(0.5); }
  double length() const { return std::abs(sweep) * radius; }
  // Approximate the arc with a polyline whose max chord error <= tol.
  Polyline tessellate(double tol) const;
};

double normalizeAngle(double a);  // to [0, 2pi)

}  // namespace xr
