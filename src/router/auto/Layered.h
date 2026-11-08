#pragma once
// Re-laying on the combined plane with the layers known (TopoR's optimisation after the layering, Polubasov 2010):
// every wire's chords have a layer (chord k: from its crossing k-1 to its crossing k; the ends are its vertices);
// a wire is taken out and laid again by the cheapest path where it may cross another net's chord only on another
// layer, may change layer at an edge it crosses (a via there, at a price), and an edge holds on each layer what that
// layer's wires across it leave room for.
#include <cstdint>
#include <functional>
#include <optional>
#include <vector>

#include "topo/Relay.h"
#include "topo/Topology.h"

namespace xr::autoroute {

struct LayeredPath {
  topo::RelayPath path;        // the crossings, for applyRelay
  std::vector<int> chordLayer;  // per chord of the new path (steps + 1)
  double cost = 0;
  int vias = 0;
};

struct LayeredCosts {
  int layers = 2;
  std::vector<LayerId> layerIds;  // the board layer of each layer index (the room of an edge is that layer's)
  double via = 3e6;  // a change of layer, nm of length
  double viaDiameter = 0;  // the via's copper: a change of layer at an edge needs that much room there on both layers
  std::function<double(int net)> viaOf;  // another net's via diameter (vias already on an edge); empty: viaDiameter
};

// chordLayer: per wire of t, the layer of each of its chords (the wire laid again: ignored). startLayers, endLayers:
// the layers its pads offer (bits by layer index; 0: any).
std::optional<LayeredPath> findLayeredPath(const topo::Topology& t, int wire, const std::vector<std::vector<int>>& chordLayer,
                                           const LayeredCosts& c, uint32_t startLayers, uint32_t endLayers);

}  // namespace xr::autoroute
