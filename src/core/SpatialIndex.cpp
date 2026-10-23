#include "core/SpatialIndex.h"

#include <boost/geometry.hpp>
#include <boost/geometry/index/rtree.hpp>

namespace bg = boost::geometry;
namespace bgi = boost::geometry::index;

namespace xr {

std::vector<Shape> itemShapes(const Board& b, ItemRef r, double expand) {
  std::vector<Shape> out;
  switch (r.type) {
    case ItemType::Pad: out.push_back(b.pads[r.index].shapeGeom(expand)); break;
    case ItemType::Via: {
      const Via& v = b.vias[r.index];
      out.push_back(Shape::circle(v.pos.v(), v.diameter / 2.0 + expand));
      break;
    }
    case ItemType::Track: {
      const Track& t = b.tracks[r.index];
      auto pts = t.path(200);  // 0.2 um chords: DRC on arcs must not under-read the clearance
      for (size_t i = 1; i < pts.size(); ++i) out.push_back(Shape::capsule(pts[i - 1], pts[i], t.width / 2.0 + expand));
      if (pts.size() == 1) out.push_back(Shape::circle(pts[0], t.width / 2.0 + expand));
      break;
    }
    case ItemType::Zone: {
      const Zone& z = b.zones[r.index];
      for (auto& f : z.filled) out.push_back(Shape::polygon(f, expand));
      break;
    }
    case ItemType::Keepout:
      for (auto& s : b.keepouts[r.index].shapes()) out.push_back(s.inflated(expand));
      break;
    case ItemType::Text: {
      auto c = b.textBox(b.texts[r.index]);
      out.push_back(Shape::polygon({c.begin(), c.end()}, expand));
      break;
    }
    case ItemType::Detail: {
      const Graphic& g = b.graphics[r.index];
      double w = g.width / 2.0 + expand;
      switch (g.kind) {
        case GraphicKind::Line: out.push_back(Shape::capsule(g.a, g.b, w)); break;
        case GraphicKind::Arc: {
          auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
          auto pts = arc.valid ? arc.tessellate(2000) : Polyline{g.a, g.b};
          for (size_t i = 1; i < pts.size(); ++i) out.push_back(Shape::capsule(pts[i - 1], pts[i], w));
          break;
        }
        case GraphicKind::Circle: {
          double rad = (g.b - g.a).len();
          if (g.filled) out.push_back(Shape::circle(g.a, rad + w));
          else {
            auto pts = Shape::circle(g.a, rad).outline(2000);
            for (size_t i = 0; i < pts.size(); ++i) out.push_back(Shape::capsule(pts[i], pts[(i + 1) % pts.size()], w));
          }
          break;
        }
        case GraphicKind::Rect:
        case GraphicKind::Poly: {
          Polyline pts = g.kind == GraphicKind::Rect ? Polyline{g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}} : g.pts;
          if (g.filled && pts.size() >= 3) out.push_back(Shape::polygon(pts, w));
          else
            for (size_t i = 0; i + 1 < pts.size() + (pts.size() >= 3); ++i)
              out.push_back(Shape::capsule(pts[i], pts[(i + 1) % pts.size()], w));
          break;
        }
      }
      break;
    }
  }
  return out;
}

int itemNet(const Board& b, ItemRef r) {
  switch (r.type) {
    case ItemType::Pad: return b.pads[r.index].net;
    case ItemType::Via: return b.vias[r.index].net;
    case ItemType::Track: return b.tracks[r.index].net;
    case ItemType::Zone: return b.zones[r.index].net;
    case ItemType::Keepout:
    case ItemType::Text:
    case ItemType::Detail: return kNoNet;
  }
  return kNoNet;
}

LayerMask itemLayers(const Board& b, ItemRef r) {
  switch (r.type) {
    case ItemType::Pad: return b.pads[r.index].copper;
    case ItemType::Via: return b.vias[r.index].layers;
    case ItemType::Track: return LayerMask(1) << b.tracks[r.index].layer;
    case ItemType::Zone: return LayerMask(1) << b.zones[r.index].layer;
    case ItemType::Keepout: {
      const Keepout& k = b.keepouts[r.index];
      return k.role == Keepout::Role::Route ? (k.layers ? k.layers : b.allCopperMask()) : 0;
    }
    case ItemType::Text: return b.texts[r.index].layer >= 0 ? LayerMask(1) << b.texts[r.index].layer : 0;
    case ItemType::Detail: return b.graphics[r.index].layer >= 0 ? LayerMask(1) << b.graphics[r.index].layer : 0;
  }
  return 0;
}

BBox itemBBox(const Board& b, ItemRef r) {
  BBox bb;
  for (auto& s : itemShapes(b, r)) bb.add(s.bbox());
  return bb;
}

using BPoint = bg::model::point<double, 2, bg::cs::cartesian>;
using BBoxG = bg::model::box<BPoint>;
struct Entry {
  ItemRef ref;
  LayerMask layers;
};
using Value = std::pair<BBoxG, Entry>;

struct SpatialIndex::Impl {
  bgi::rtree<Value, bgi::rstar<16>> tree;
};

SpatialIndex::SpatialIndex() : d_(std::make_unique<Impl>()) {}
SpatialIndex::~SpatialIndex() = default;

void SpatialIndex::build(const Board& b) {
  std::vector<Value> vals;
  auto add = [&](ItemType t, int n) {
    for (int i = 0; i < n; ++i) {
      ItemRef r{t, i};
      BBox bb = itemBBox(b, r);
      if (!bb.valid()) continue;
      vals.push_back({BBoxG(BPoint(bb.minX, bb.minY), BPoint(bb.maxX, bb.maxY)), Entry{r, itemLayers(b, r)}});
    }
  };
  add(ItemType::Pad, int(b.pads.size()));
  add(ItemType::Track, int(b.tracks.size()));
  add(ItemType::Via, int(b.vias.size()));
  add(ItemType::Zone, int(b.zones.size()));
  d_->tree = bgi::rtree<Value, bgi::rstar<16>>(vals.begin(), vals.end());
}

void SpatialIndex::query(const BBox& box, LayerMask mask, const std::function<void(ItemRef)>& f) const {
  if (!box.valid()) return;
  BBoxG q(BPoint(box.minX, box.minY), BPoint(box.maxX, box.maxY));
  for (auto it = d_->tree.qbegin(bgi::intersects(q)); it != d_->tree.qend(); ++it)
    if (it->second.layers & mask) f(it->second.ref);
}

std::vector<ItemRef> SpatialIndex::query(const BBox& box, LayerMask mask) const {
  std::vector<ItemRef> out;
  query(box, mask, [&](ItemRef r) { out.push_back(r); });
  return out;
}

}  // namespace xr
