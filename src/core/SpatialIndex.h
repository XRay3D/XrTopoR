#pragma once
// R-tree over board copper items, used for picking, DRC and connectivity.
#include <functional>
#include <memory>
#include <vector>

#include "core/Board.h"

namespace xr {

// Copper items are indexed; keepouts, texts and board drawings (details, outline) are selectable
// objects too but stay out of the index.
enum class ItemType { Pad, Track, Via, Zone, Keepout, Text, Detail };

struct ItemRef {
  ItemType type = ItemType::Pad;
  int index = -1;
  bool operator==(const ItemRef&) const = default;
};

// Copper shape of an item on one layer (tracks: capsule; arcs: several capsules).
std::vector<Shape> itemShapes(const Board& b, ItemRef r, double expand = 0);
int itemNet(const Board& b, ItemRef r);
LayerMask itemLayers(const Board& b, ItemRef r);
BBox itemBBox(const Board& b, ItemRef r);

class SpatialIndex {
 public:
  SpatialIndex();
  ~SpatialIndex();
  void build(const Board& b);
  // Calls f for every item whose bbox intersects box and that is on any layer of mask.
  void query(const BBox& box, LayerMask mask, const std::function<void(ItemRef)>& f) const;
  std::vector<ItemRef> query(const BBox& box, LayerMask mask) const;

 private:
  struct Impl;
  std::unique_ptr<Impl> d_;
};

}  // namespace xr
