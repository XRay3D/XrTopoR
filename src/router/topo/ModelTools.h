#pragma once
// F5 on the topological model: the mesh is taken to its weighted Delaunay fixed point, the wires get their
// sketches from the model (the slot midpoints of their crossings), and the realiser draws them once. A
// topological violation (wires crossing on a layer, a wire through another net's pad, a chain the mesh
// does not hold) stops it before anything is drawn.
#include <vector>

#include "core/Board.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

struct F5ModelOptions {
  bool flips = true;      // Lawson's loop before drawing (the mesh is Delaunay after a conversion already)
  bool weighted = false;  // ... weighted by the edges' loads
  bool direct = true;  // the realiser fed from the model (else from the sketches alone)
  // The branch points go to their balance after the drawing, by the wires' forces (ModelRelax.h, the vias
  // standing; TopoR's own F5 moves nothing — its branch points move in F6 and F7 — ours has moved them on the
  // tracks, settleJunctions, and does so here).
  bool junctions = true;
  // Only the wires with a track edited by hand since the last computation (Track::edited) are drawn, the
  // rest stay as they lie (F5 without a selection in the editor).
  bool editedOnly = false;
};

struct F5ModelResult {
  bool drawn = false;                 // false: stopped by the violations
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int flips = 0;
  int wires = 0;
  int junctionMoves = 0;  // branch points moved to their balance
  RealizeStats stats;
};

// The sketch the realiser gets for a wire of the model: its end vertices, the slot midpoints of its
// crossings, a point in every triangle it passes (nudged towards the centroid, as the router does).
RealWire sketchOf(const Board& b, const Topology& t, int wire);

// Re-draws every unlocked wire of the model on the board: their tracks are replaced by the realiser's.
F5ModelResult runF5Model(Board& b, Topology& t, const F5ModelOptions& o = {});

// Stops before anything is drawn when wires cross or a wire runs through another net's copper; else the
// flips and the edges' capacities. False: `stopping` says why.
bool prepareModel(Topology& t, bool flips, bool weighted, int& nFlips, std::vector<Violation>& stopping);
// Draws every unlocked wire of the model on the board: their tracks go, and the hand-drawn runs inside the
// pads they end at; the model's wires then own the new tracks.
void drawModel(Board& b, Topology& t, bool direct, RealizeStats& stats, int& nWires, bool editedOnly = false);

// The model's violations as DRC violations (Type::Topology) for the message list and the selection: `a`
// and `b` are tracks of the wires concerned (or the pad a wire runs through).
std::vector<DrcViolation> topologyViolations(const Board& b, const Topology& t, const std::vector<Violation>& vs);

}  // namespace xr::topo

namespace xr::topo {

// Draws the given wires of the model with the realiser fed from the model itself: the obstacles are the
// mesh's vertices, every wire's crossings and the wires' order on every edge come from the model, nothing
// is derived from the sketches again. Appends the tracks to the board; `wires` receives the sketches used.
RealizeStats realizeFromModel(Board& b, const Topology& t, const std::vector<int>& chosen, const RealizeOptions& opt,
                              std::vector<RealWire>* wires = nullptr);

}  // namespace xr::topo
