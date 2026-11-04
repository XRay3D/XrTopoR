#pragma once
// F5 on the topological model: the mesh is taken to its weighted Delaunay fixed point, the wires get their
// sketches from the model (the slot midpoints of their crossings), and the realiser draws them once. A
// topological violation (wires crossing on a layer, a wire through another net's pad, a chain the mesh
// does not hold) stops it before anything is drawn.
#include <vector>

#include "core/Board.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

struct F5ModelOptions {
  bool flips = true;      // Lawson's loop before drawing (the mesh is Delaunay after a conversion already)
  bool weighted = false;  // ... weighted by the edges' loads
  bool direct = true;  // the realiser fed from the model (else from the sketches alone)
};

struct F5ModelResult {
  bool drawn = false;                 // false: stopped by the violations
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int flips = 0;
  int wires = 0;
  RealizeStats stats;
};

// The sketch the realiser gets for a wire of the model: its end vertices, the slot midpoints of its
// crossings, a point in every triangle it passes (nudged towards the centroid, as the router does).
RealWire sketchOf(const Board& b, const Topology& t, int wire);

// Re-draws every unlocked wire of the model on the board: their tracks are replaced by the realiser's.
F5ModelResult runF5Model(Board& b, Topology& t, const F5ModelOptions& o = {});

}  // namespace xr::topo

namespace xr::topo {

// Draws the given wires of the model with the realiser fed from the model itself: the obstacles are the
// mesh's vertices, every wire's crossings and the wires' order on every edge come from the model, nothing
// is derived from the sketches again. Appends the tracks to the board; `wires` receives the sketches used.
RealizeStats realizeFromModel(Board& b, const Topology& t, const std::vector<int>& chosen, const RealizeOptions& opt,
                              std::vector<RealWire>* wires = nullptr);

}  // namespace xr::topo
