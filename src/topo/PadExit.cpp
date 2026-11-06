#include "topo/PadExit.h"

#include <algorithm>
#include <cmath>

namespace xr::topo {

PadFrame padFrame(const Pad& p) {
  PadFrame f;
  const Shape s = p.shapeGeom();
  f.c = p.pos.v();
  switch (s.kind) {
    case Shape::Kind::Point:
      f.kind = PadFrame::Kind::Round;
      f.L = f.W = f.r = s.r;
      break;
    case Shape::Kind::Segment: {
      f.kind = PadFrame::Kind::Oval;
      Vec2 d = s.b - s.a;
      double len = d.len();
      f.c = (s.a + s.b) * 0.5;
      if (len > 0) f.n = d / len;
      f.t = {-f.n.y, f.n.x};
      f.L = len / 2 + s.r;
      f.W = f.r = s.r;
      break;
    }
    case Shape::Kind::Polygon: {
      if (s.poly.size() == 4) {
        Vec2 d0 = s.poly[1] - s.poly[0], d1 = s.poly[2] - s.poly[1];
        double l0 = d0.len(), l1 = d1.len();
        bool rect = l0 > 0 && l1 > 0 && std::abs((s.poly[3] - s.poly[2]).len() - l0) < 10 && std::abs((s.poly[0] - s.poly[3]).len() - l1) < 10 &&
                    std::abs(d0.dot(d1)) < 1e-3 * l0 * l1;
        if (rect) {
          f.kind = PadFrame::Kind::Rect;
          f.c = (s.poly[0] + s.poly[1] + s.poly[2] + s.poly[3]) * 0.25;
          const bool firstLong = l0 >= l1;
          f.n = (firstLong ? d0 : d1) / (firstLong ? l0 : l1);
          f.t = {-f.n.y, f.n.x};
          f.L = std::max(l0, l1) / 2 + s.r;
          f.W = std::min(l0, l1) / 2 + s.r;
          f.r = s.r;
          break;
        }
      }
      BBox bb = s.bbox();
      f.L = f.W = std::min(bb.maxX - bb.minX, bb.maxY - bb.minY) / 2;
      break;
    }
  }
  return f;
}

bool PadFrame::onEnd(Vec2 boundaryPoint) const {
  const double u = std::abs(local(boundaryPoint).x);
  if (kind == Kind::Oval) return u > L - W + 1;  // beyond the centre of the cap
  if (kind == Kind::Rect) return u > L - r - 2;  // on the short side (or its corner's rounding)
  return true;
}

Vec2 PadFrame::innerPoint(int sign, double width, double v) const {
  const double room = std::max(0.0, W - width / 2);
  return world(sign * std::max(0.0, L - width / 2), std::clamp(v, -room, room));
}

Vec2 PadFrame::edgePoint(int sign, double width, double v) const {
  const double room = std::max(0.0, W - width / 2);
  const double vv = std::clamp(v, -room, room);
  // An oval's end is round: the edge straight beyond the inner point.
  double u = L;
  if (kind == Kind::Oval) u = (L - W) + std::sqrt(std::max(0.0, W * W - vv * vv));
  return world(sign * u, vv);
}

}  // namespace xr::topo
