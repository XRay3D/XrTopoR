#pragma once
// Per-net connectivity: which copper items touch, the resulting clusters and the ratsnest
// (minimum spanning tree between clusters = connections that still need routing).
#include <vector>

#include "core/SpatialIndex.h"

namespace xr {

struct RatsLine {
  int net = kNoNet;
  Vec2 a, b;
  ItemRef from, to;  // anchor items (pads or vias or tracks)
};

struct Connectivity {
  // cluster id per item, -1 for items without net
  std::vector<int> padCluster, trackCluster, viaCluster;
  std::vector<RatsLine> ratsnest;
  int unroutedNets = 0;

  static Connectivity compute(const Board& b);
  static Connectivity compute(const Board& b, const SpatialIndex& idx);
};

}  // namespace xr
