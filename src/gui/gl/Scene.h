#pragma once
// What the board view gives the video card: one record an object, no chords. A straight wire, a line or a disc is a
// segment; an arc of a wire or of a drawing, a circle, is an arc by its centre, radius and sweep (the fragment
// shader measures the distance to it); a polygon (a pour, a pad's core, a filled figure, a text's glyphs) is the
// triangle fans of its contours for the stencil, an arc side or a glyph's curve a triangle more that is cut by the
// curve itself. No OpenGL here: SceneBuilder turns the board's objects into SceneData, gl::Renderer draws it.
#include <cstdint>
#include <optional>
#include <vector>

#include "core/Board.h"

class QPainterPath;
class QTransform;

namespace xr::gui::gl {

struct Color {
  std::uint8_t r = 0, g = 0, b = 0, a = 255;
  bool operator==(const Color&) const = default;
};

// A capsule from a to b (a disc when they are one point). The half width on screen is `half` nm, at least `minPx`
// and, when `maxPx` is set, at most that many pixels. dash > 0: dashes and gaps of that many pixels; dash < 0: of
// that many widths (flat ends).
struct SegmentRec {
  std::int32_t ax, ay, bx, by;  // nm
  float half, minPx, maxPx, dash;
  Color color;
};
// An arc: its centre and radius, the unit vector from the centre to its middle, half its sweep (pi: a circle).
struct ArcRec {
  std::int32_t cx, cy;
  float radius, ux, uy, halfSweep;
  float half, minPx, maxPx, dash;
  Color color;
};
// A vertex of a fill's stencil triangles. kind 0: a plain one; 1: of an arc side, (u, v) the place from the circle's
// centre in radii (what lies outside the circle is cut); 2: of a quadratic curve, Loop and Blinn's (u, v).
struct FillVertex {
  std::int32_t x, y;
  float u, v, kind;
};
// A mark of a size in pixels at a point of the board (a DRC violation: a ring with a cross).
struct MarkerRec {
  std::int32_t x, y;
  Color color;
};

// How a step is laid over what is under it: as it is, or with its copper layer's transparency.
enum class Blend : std::uint8_t { Opaque, Copper, ActiveCopper };

struct Step {
  enum class Kind : std::uint8_t { Segments, Arcs, Fill, Holes, Markers, Dim } kind;
  std::uint32_t first = 0, count = 0;  // records (Fill: vertices)
  Color color;                         // Fill, Dim
  bool hatch = false;                  // Fill: diagonal lines instead of solid
  bool curved = false;                 // Fill: has triangles cut by a curve (shaded sample by sample)
  std::int32_t box[4] = {0, 0, 0, 0};  // Fill: what its triangles cover (min x, min y, max x, max y)
  Blend blend = Blend::Opaque;
  int layer = -1;  // the copper layer a blended step is of
};

struct SceneData {
  std::vector<SegmentRec> segments, holes;
  std::vector<ArcRec> arcs;
  std::vector<FillVertex> fill;
  std::vector<MarkerRec> markers;
  std::vector<Step> steps;  // in the order drawn
  void clear() { *this = {}; }
};

// A stroke's width on screen: half the width in nm, and the limits in pixels (0: none).
struct Stroke {
  double half = 0;
  float minPx = 0, maxPx = 0, dash = 0;
};

class SceneBuilder {
 public:
  explicit SceneBuilder(SceneData& out) : out_(out) {}
  ~SceneBuilder() { flush(); }

  // What is added goes out at flush(): the fills (one stencil pass a colour), then the segments, then the arcs.
  // Flush between what must lie over one another.
  void flush();
  void setBlend(Blend b, int layer) {
    flush();
    blend_ = b, layer_ = layer;
  }

  void segment(Vec2 a, Vec2 b, const Stroke& s, Color c);
  void disc(Vec2 centre, double radius, Color c) { segment(centre, centre, {radius}, c); }
  void arc(const ArcGeom& g, const Stroke& s, Color c);
  void circle(Vec2 centre, double radius, const Stroke& s, Color c);
  void track(const Track& t, const Stroke& s, Color c);  // a segment, or an arc through its three points

  // A closed contour of a fill; arcs[k] (may be shorter than pts): the arc of the side from pts[k] to the next
  // point. Contours of one polygon() call keep their directions (a hole runs against its outer contour).
  struct Contour {
    Polyline pts;
    std::vector<std::optional<ArcGeom>> arcs;
  };
  void polygon(const std::vector<Contour>& contours, Color c, bool hatch = false);
  void polygon(const Polyline& pts, Color c, bool hatch = false);
  // The outlines of glyphs (lines, quadratic and cubic curves), mapped by `tr` into the board's nm.
  void path(const QPainterPath& p, const QTransform& tr, Color c);

  // The copper of a shape: a disc, a capsule, a polygon grown by its radius (the polygon and capsules along its sides).
  void shape(const Shape& s, Color c);
  // A drawing: its lines, arcs and circles stroked, filled when asked.
  void graphic(const Graphic& g, const Stroke& s, Color c, bool filled);
  // A closed line through the points.
  void loop(const Polyline& pts, const Stroke& s, Color c);

  void hole(Vec2 a, Vec2 b, double radius);  // drilled: a disc or a slot
  void marker(Vec2 at, Color c);
  void dim(Color c);  // the whole view under this colour

 private:
  struct Fill {
    Color color;
    bool hatch;
    std::vector<FillVertex> v;
    BBox box;
    bool curved;
  };
  Fill& fillOf(Color c, bool hatch);
  void fan(Fill& f, const Contour& c, bool reversed);
  Step& step(Step::Kind kind, std::uint32_t first);

  SceneData& out_;
  Blend blend_ = Blend::Opaque;
  int layer_ = -1;
  std::vector<SegmentRec> seg_;
  std::vector<ArcRec> arc_;
  std::vector<Fill> fill_;
};

// The contour of a drawn figure (a circle, a rectangle, a polygon with arc sides) for SceneBuilder::polygon.
std::optional<SceneBuilder::Contour> contourOf(const Graphic& g);

}  // namespace xr::gui::gl
