#pragma once
// Buses: groups of nets that run side by side between the same components (a connector's row to another's, an
// address bus from a processor to its memories). TopoR lays a bus as one bundle of parallel wires on one layer,
// the nets across it on another (seen in its routing of a synthetic board: a bus of 16 wires between two
// connectors and 32 nets across it); a router that lays the nets one by one in order of length lets the short
// nets across take both layers first, and the bus then dives under them at every crossing.
//
// A bus here: at least `minNets` nets, each with one pad on each of the same two or more components and no other
// pads, their directions (a pad on one component to its pad on the other) within 30 degrees of each other. Its
// layer: one every pad of its nets is on and their «Назначение цепей на слои» allows, crossing the fewest of
// the buses already given that layer (the larger buses choose first), then the fewest nets with a planar pad on
// the layer whose straight lines cross it (each would need a via to cross the bus there); of equals the last.
#include <vector>

#include "core/Board.h"

namespace xr::topo {

struct Bus {
  std::vector<int> nets;
  std::vector<int> components;  // sorted
  LayerId layer = -1;           // -1: no layer suits all its nets
  int crossedBy = 0;            // the other nets whose straight lines cross the bus's
  bool through = true;          // all its pads through-hole
};

// The buses among the nets of `nets` (all routable nets when empty), with a layer each of `layers`.
std::vector<Bus> findBuses(const Board& b, const std::vector<LayerId>& layers, const std::vector<int>& nets = {}, int minNets = 4);

}  // namespace xr::topo
