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

// F7 on the model: the vias and branch points relax under the model's own forces — towards the point
// where the wires through them run straight (by the slots of their first crossings), away from the
// tight edges at them, and off the copper a via is too close to — in shrinking steps (TopoR's
// relaxation as the legacy optimiser has it: tolerance 1 mm · 0.8^k down to 10 µm, Rprop scales), the
// meshes following the moves with flips. An iteration is judged by the model's cost (the wires' length
// through their slots, plus 100 mm per mm of shortfall on the edges and of via-to-copper clearance),
// the steps at the edges it made worse stay out and the rest are tried again. The realiser draws once
// at the end. Nothing is approximated by arcs.
struct OptimizeModelOptions {
  bool flips = true;
  double tol = 1.0 * kNmPerMm;      // first step limit
  double floor = 0.01 * kNmPerMm;   // the loop ends below this
  int clearRounds = 4;              // rounds of pushing vias off copper first
  bool vias = true, junctions = true;
  bool draw = true;                 // the realiser at the end (false: the model and the board's vias only)
  // Every so many iterations the model is drawn on a copy and judged by the DRC and the connectivity:
  // the best drawn state is kept, a worse one rolled back. The model's cost is a proxy for the drawing;
  // this keeps the result from being worse than F5's (0: the model's cost alone).
  int checkpointEvery = 3;
  // The chords' distance to the corners of their triangles as shortfall (a proxy: the realiser's taut path
  // need not take the slot's midpoint; measured from the slot's point farthest from the corner). On:
  // Arcs_master 15 / arz 8 / arz_2L 1 / arz_4L 8 violations; off: 19 / 4 / 4 / 8.
  bool chords = true;
};

struct OptimizeModelResult {
  bool drawn = false;
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int iterations = 0, viaMoves = 0, junctionMoves = 0, undoneIterations = 0;
  int checkpoints = 0, rollbacks = 0;
  int conflictsBefore = 0, conflictsAfter = 0;  // the DRC of the drawing at the checkpoints
  double lengthBefore = 0, lengthAfter = 0;    // the wires' length through their slots, nm
  double deficitBefore = 0, deficitAfter = 0;  // shortfall on the edges plus via-to-copper, nm
  std::vector<std::string> log;
  int wires = 0;
  RealizeStats stats;
};
OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o = {});

}  // namespace xr::topo

namespace xr::topo {

// Draws the given wires of the model with the realiser fed from the model itself: the obstacles are the
// mesh's vertices, every wire's crossings and the wires' order on every edge come from the model, nothing
// is derived from the sketches again. Appends the tracks to the board; `wires` receives the sketches used.
RealizeStats realizeFromModel(Board& b, const Topology& t, const std::vector<int>& chosen, const RealizeOptions& opt,
                              std::vector<RealWire>* wires = nullptr);

}  // namespace xr::topo
