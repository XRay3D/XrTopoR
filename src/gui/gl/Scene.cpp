#include "gui/gl/Scene.h"

#include <QPainterPath>
#include <QTransform>
#include <cmath>

namespace xr::gui::gl {

namespace {

std::int32_t nm(double v) { return std::int32_t(std::llround(v)); }

// A unit of the fill's stencil: a triangle of plain vertices, or one cut by a curve.
void tri(std::vector<FillVertex>& v, BBox& box, Vec2 a, Vec2 b, Vec2 c) {
  for (Vec2 p : {a, b, c}) {
    v.push_back({nm(p.x), nm(p.y), 0, 0, 0});
    box.add(p);
  }
}

double signedArea(const Polyline& p) {
  double s = 0;
  for (size_t i = 0; i < p.size(); ++i) s += p[i].cross(p[(i + 1) % p.size()]);
  return s / 2;
}

}  // namespace

Step& SceneBuilder::step(Step::Kind kind, std::uint32_t first) {
  Step s;
  s.kind = kind;
  s.first = first;
  s.blend = blend_;
  s.layer = layer_;
  out_.steps.push_back(s);
  return out_.steps.back();
}

void SceneBuilder::flush() {
  for (Fill& f : fill_) {
    if (f.v.empty()) continue;
    Step& s = step(Step::Kind::Fill, std::uint32_t(out_.fill.size()));
    s.count = std::uint32_t(f.v.size());
    s.color = f.color;
    s.hatch = f.hatch;
    s.curved = f.curved;
    s.box[0] = nm(std::floor(f.box.minX)), s.box[1] = nm(std::floor(f.box.minY));
    s.box[2] = nm(std::ceil(f.box.maxX)), s.box[3] = nm(std::ceil(f.box.maxY));
    out_.fill.insert(out_.fill.end(), f.v.begin(), f.v.end());
  }
  fill_.clear();
  if (!seg_.empty()) {
    step(Step::Kind::Segments, std::uint32_t(out_.segments.size())).count = std::uint32_t(seg_.size());
    out_.segments.insert(out_.segments.end(), seg_.begin(), seg_.end());
    seg_.clear();
  }
  if (!arc_.empty()) {
    step(Step::Kind::Arcs, std::uint32_t(out_.arcs.size())).count = std::uint32_t(arc_.size());
    out_.arcs.insert(out_.arcs.end(), arc_.begin(), arc_.end());
    arc_.clear();
  }
}

void SceneBuilder::segment(Vec2 a, Vec2 b, const Stroke& s, Color c) {
  seg_.push_back({nm(a.x), nm(a.y), nm(b.x), nm(b.y), float(s.half), s.minPx, s.maxPx, s.dash, c});
}

void SceneBuilder::arc(const ArcGeom& g, const Stroke& s, Color c) {
  if (!g.valid) return;
  const double mid = g.startAngle + g.sweep / 2;
  arc_.push_back({nm(g.center.x), nm(g.center.y), float(g.radius), float(std::cos(mid)), float(std::sin(mid)),
                  float(std::min(std::abs(g.sweep) / 2, kPi)), float(s.half), s.minPx, s.maxPx, s.dash, c});
}

void SceneBuilder::circle(Vec2 centre, double radius, const Stroke& s, Color c) {
  arc_.push_back({nm(centre.x), nm(centre.y), float(radius), 1, 0, float(kPi), float(s.half), s.minPx, s.maxPx, s.dash, c});
}

void SceneBuilder::track(const Track& t, const Stroke& s, Color c) {
  if (t.mid)
    if (ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()); g.valid) {
      arc(g, s, c);
      return;
    }
  segment(t.a.v(), t.b.v(), s, c);
}

SceneBuilder::Fill& SceneBuilder::fillOf(Color c, bool hatch) {
  for (Fill& f : fill_)
    if (f.color == c && f.hatch == hatch) return f;
  fill_.push_back({c, hatch, {}, {}, false});
  return fill_.back();
}

// The contour's triangles for the stencil; an arc side goes in pieces of a quarter turn at most, each a point of
// the loop and two triangles more over the piece between its chord and the arc, cut by the circle in the shader.
void SceneBuilder::fan(Fill& f, const Contour& c, bool reversed) {
  if (c.pts.size() < 2) return;
  struct Side {
    Vec2 a, b;
    const ArcGeom* arc;
    double a0, sweep;  // the piece's angles, when on an arc
  };
  std::vector<Side> sides;
  const size_t n = c.pts.size();
  for (size_t k = 0; k < n; ++k) {
    const Vec2 p = c.pts[k], q = c.pts[(k + 1) % n];
    const ArcGeom* g = k < c.arcs.size() && c.arcs[k] && c.arcs[k]->valid ? &*c.arcs[k] : nullptr;
    if (!g) {
      sides.push_back({p, q, nullptr, 0, 0});
      continue;
    }
    const int parts = std::max(1, int(std::ceil(std::abs(g->sweep) / (kPi / 2) - 1e-9)));
    Vec2 from = p;
    for (int i = 0; i < parts; ++i) {
      const double a0 = g->startAngle + g->sweep * i / parts, a1 = g->startAngle + g->sweep * (i + 1) / parts;
      const Vec2 to = i + 1 == parts ? q : g->center + Vec2{std::cos(a1), std::sin(a1)} * g->radius;
      sides.push_back({from, to, g, a0, g->sweep / parts});
      from = to;
    }
  }
  if (reversed) {
    r::reverse(sides);
    for (Side& s : sides) {
      std::swap(s.a, s.b);
      s.a0 += s.sweep;
      s.sweep = -s.sweep;
    }
  }
  // The loop through the sides' starts, halved again and again: a triangle on the ends and the middle of a run of
  // points, then the same for its two halves. They sum to the loop as a fan from one point does, but stay as small
  // as the runs they span (a fan of a pour's thousands of points covered the pour thousands of times over).
  auto halve = [&](auto&& self, size_t lo, size_t hi) -> void {
    if (hi - lo < 2) return;
    const size_t mid = (lo + hi) / 2;
    tri(f.v, f.box, sides[lo].a, sides[mid].a, sides[hi].a);
    self(self, lo, mid);
    self(self, mid, hi);
  };
  halve(halve, 0, sides.size() - 1);
  for (const Side& s : sides) {
    if (!s.arc) continue;
    f.curved = true;
    // Over the chord, as high as the arc rises and a little more (the circle cuts it): from a to b round the arc.
    const double half = std::abs(s.sweep) / 2, mid = s.a0 + s.sweep / 2;
    const Vec2 out{std::cos(mid), std::sin(mid)};
    const double rise = s.arc->radius * (1 - std::cos(half)) * 1.02 + 2;
    const Vec2 a2 = s.a + out * rise, b2 = s.b + out * rise;
    auto put = [&](Vec2 p) {
      const Vec2 rel = (p - s.arc->center) * (1 / s.arc->radius);
      f.v.push_back({nm(p.x), nm(p.y), float(rel.x), float(rel.y), 1});
      f.box.add(p);
    };
    for (Vec2 p : {s.a, a2, b2, s.a, b2, s.b}) put(p);
  }
}

void SceneBuilder::polygon(const std::vector<Contour>& contours, Color c, bool hatch) {
  if (contours.empty()) return;
  // Counted by the winding: a polygon is turned so that its first contour runs the positive way, or two polygons
  // of opposite ways lying over one another would cancel.
  const bool reversed = signedArea(contours.front().pts) < 0;
  Fill& f = fillOf(c, hatch);
  for (const Contour& k : contours) fan(f, k, reversed);
}

void SceneBuilder::polygon(const Polyline& pts, Color c, bool hatch) {
  if (pts.size() < 3) return;
  polygon(std::vector<Contour>{{pts, {}}}, c, hatch);
}

void SceneBuilder::path(const QPainterPath& p, const QTransform& tr, Color c) {
  Fill& f = fillOf(c, false);
  Vec2 start, at;
  auto pt = [&](int i) {
    const QPointF q = tr.map(QPointF(p.elementAt(i)));
    return Vec2{q.x(), q.y()};
  };
  auto quad = [&](Vec2 a, Vec2 q, Vec2 b) {  // the fan's triangle to the chord, and Loop and Blinn's over the curve
    tri(f.v, f.box, start, a, b);
    f.curved = true;
    f.v.push_back({nm(a.x), nm(a.y), 0, 0, 2});
    f.v.push_back({nm(q.x), nm(q.y), 0.5f, 0, 2});
    f.v.push_back({nm(b.x), nm(b.y), 1, 1, 2});
    f.box.add(q);
  };
  // A cubic that came of a quadratic (TrueType outlines through QPainterPath) gives its control point back; another
  // is halved until it nearly is one.
  auto cubic = [&](auto&& self, Vec2 a, Vec2 c1, Vec2 c2, Vec2 b, int depth) -> void {
    const Vec2 q1 = (c1 * 3 - a) * 0.5, q2 = (c2 * 3 - b) * 0.5;
    if (depth >= 3 || (q1 - q2).len() <= 1e-3 * ((b - a).len() + (c1 - a).len() + 1)) {
      quad(a, (q1 + q2) * 0.5, b);
      return;
    }
    const Vec2 ab = (a + c1) * 0.5, bc = (c1 + c2) * 0.5, cd = (c2 + b) * 0.5, abc = (ab + bc) * 0.5, bcd = (bc + cd) * 0.5, m = (abc + bcd) * 0.5;
    self(self, a, ab, abc, m, depth + 1);
    self(self, m, bcd, cd, b, depth + 1);
  };
  for (int i = 0; i < p.elementCount(); ++i) {
    const QPainterPath::Element e = p.elementAt(i);
    if (e.isMoveTo()) {
      start = at = pt(i);  // (a contour closes on its first point: the fan's last triangle would be flat)
    } else if (e.isLineTo()) {
      const Vec2 to = pt(i);
      tri(f.v, f.box, start, at, to);
      at = to;
    } else if (e.isCurveTo() && i + 2 < p.elementCount()) {
      const Vec2 c1 = pt(i), c2 = pt(i + 1), to = pt(i + 2);
      cubic(cubic, at, c1, c2, to, 0);
      at = to;
      i += 2;
    }
  }
}

void SceneBuilder::shape(const Shape& s, Color c) {
  switch (s.kind) {
    case Shape::Kind::Point: disc(s.a, s.r, c); break;
    case Shape::Kind::Segment: segment(s.a, s.b, {s.r}, c); break;
    case Shape::Kind::Polygon:
      polygon(s.poly, c);
      if (s.r > 0) loop(s.poly, {s.r}, c);
      break;
  }
}

void SceneBuilder::loop(const Polyline& pts, const Stroke& s, Color c) {
  for (size_t i = 0; i < pts.size(); ++i) segment(pts[i], pts[(i + 1) % pts.size()], s, c);
}

std::optional<SceneBuilder::Contour> contourOf(const Graphic& g) {
  SceneBuilder::Contour c;
  switch (g.kind) {
    case GraphicKind::Circle: {
      const double r = (g.b - g.a).len();
      if (r <= 0) return std::nullopt;
      for (int k = 0; k < 4; ++k) {
        c.pts.push_back(g.a + Vec2{std::cos(k * kPi / 2), std::sin(k * kPi / 2)} * r);
        ArcGeom a;
        a.center = g.a, a.radius = r, a.startAngle = k * kPi / 2, a.sweep = kPi / 2, a.valid = true;
        c.arcs.push_back(a);
      }
      return c;
    }
    case GraphicKind::Rect: c.pts = {g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}}; return c;
    case GraphicKind::Poly:
      if (g.pts.size() < 3) return std::nullopt;
      c.pts = g.pts;
      for (size_t k = 0; k < g.pts.size(); ++k) {
        const Vec2 p = g.pts[k], q = g.pts[(k + 1) % g.pts.size()];
        std::optional<ArcGeom> a;
        if (const double deg = g.arcOf(k); deg != 0 && p != q)
          if (ArcGeom arc = ArcGeom::fromThreePoints(p, arcMiddle(p, q, deg), q); arc.valid) a = arc;
        c.arcs.push_back(a);
      }
      return c;
    default: return std::nullopt;
  }
}

void SceneBuilder::graphic(const Graphic& g, const Stroke& s, Color c, bool filled) {
  if (filled)
    if (auto k = contourOf(g)) polygon(std::vector<Contour>{*k}, c);
  switch (g.kind) {
    case GraphicKind::Line: segment(g.a, g.b, s, c); break;
    case GraphicKind::Arc:
      if (ArcGeom a = ArcGeom::fromThreePoints(g.a, g.m, g.b); a.valid) arc(a, s, c);
      else segment(g.a, g.b, s, c);
      break;
    case GraphicKind::Circle: circle(g.a, (g.b - g.a).len(), s, c); break;
    case GraphicKind::Rect: loop({g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}}, s, c); break;
    case GraphicKind::Poly:
      if (g.pts.size() < 2) break;
      if (auto k = contourOf(g)) {
        for (size_t i = 0; i < k->pts.size(); ++i) {
          if (k->arcs[i]) arc(*k->arcs[i], s, c);
          else segment(k->pts[i], k->pts[(i + 1) % k->pts.size()], s, c);
        }
      } else {
        segment(g.pts[0], g.pts[1], s, c);
      }
      break;
  }
}

void SceneBuilder::hole(Vec2 a, Vec2 b, double radius) {
  flush();
  if (out_.steps.empty() || out_.steps.back().kind != Step::Kind::Holes) step(Step::Kind::Holes, std::uint32_t(out_.holes.size()));
  out_.holes.push_back({nm(a.x), nm(a.y), nm(b.x), nm(b.y), float(radius), 0, 0, 0, {}});
  ++out_.steps.back().count;
}

void SceneBuilder::marker(Vec2 at, Color c) {
  flush();
  if (out_.steps.empty() || out_.steps.back().kind != Step::Kind::Markers) step(Step::Kind::Markers, std::uint32_t(out_.markers.size()));
  out_.markers.push_back({nm(at.x), nm(at.y), c});
  ++out_.steps.back().count;
}

void SceneBuilder::dim(Color c) {
  flush();
  step(Step::Kind::Dim, 0).color = c;
}

}  // namespace xr::gui::gl
