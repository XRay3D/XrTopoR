#pragma once
// What Topology::buildOwners hands on to buildMeshes and convertWires (Topology.cpp, Convert.cpp).
#include <utility>
#include <vector>

#include "topo/Topology.h"

namespace xr::topo {

// A wall the wires may not cross, as the list of its owners in order: the board's outline and its cutouts
// (border: what is beyond is outside the mesh), a keepout's boundary (a wall inside the mesh; an area's
// triangles are blocked). A cutout is a keepout with the clearance to the board edge, nothing more.
struct WallLoop {
  LayerMask layers;
  std::vector<int> owners;
  bool area;    // closed: the last owner joins the first
  bool border;  // the outline or a cutout
};

struct BuildScratch {
  std::vector<std::vector<Vec2>> corners;  // per owner: the fixed corners of a custom pad (else empty)
  std::vector<WallLoop> walls;
  std::vector<int> zoneOwner;  // per board zone: its owner, -1 when unpoured or not on a copper layer
  std::vector<int> displaced;  // wires drawn through a keepout or a cutout: convertWires leaves them without crossings, relayDisplaced lays them round
};

}  // namespace xr::topo
