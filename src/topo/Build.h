#pragma once
// What Topology::buildOwners hands on to buildMeshes and convertWires (Topology.cpp, Convert.cpp).
#include <utility>
#include <vector>

#include "topo/Topology.h"

namespace xr::topo {

// The keepout loops, as owner lists.
struct KeepoutLoop {
  LayerMask layers;
  std::vector<int> owners;
  bool area;
};

struct BuildScratch {
  std::vector<std::vector<Vec2>> corners;  // per owner: the fixed corners of a custom pad (else empty)
  std::vector<KeepoutLoop> keepoutLoops;
  std::vector<std::pair<int, int>> outlineLinks;  // owner pairs
};

}  // namespace xr::topo
