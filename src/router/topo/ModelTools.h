#pragma once
// F5 on the topological model: the mesh is taken to its weighted Delaunay fixed point, the wires get their
// sketches from the model (the slot midpoints of their crossings), and the realiser draws them once. A
// topological violation (wires crossing on a layer, a wire through another net's pad, a chain the mesh
// does not hold) stops it before anything is drawn.
#include <vector>

#include <memory>

#include "router/topo/Drawn.h"
#include "router/topo/RealizerInput.h"
#include "core/Board.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

struct ModelDrawing;  // a drawing kept (below)

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
  int untangled = 0;      // double crossings taken apart first (resolveCrossings)
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
// F5, F6 and F7 take the crossings apart before they give up on them: a model whose wires cross (built from tracks
// drawn across each other before this was done, or read from a file that keeps no violations) is built anew from the
// board's tracks, where the double crossings of wires are taken apart (Chains.h untangleChains). The
// swaps made; a crossing left is in the model's violations, and prepareModel stops on it.
int resolveCrossings(const Board& b, Topology& t);
// Draws every unlocked wire of the model on the board: their tracks go, and the hand-drawn runs inside the
// pads they end at; the model's wires then own the new tracks.
// `only` (with editedOnly false): these wires alone, the rest as they lie.
// `keep` receives the drawing (ModelDrawing, below); `from` is an earlier drawing of the same wires, of the model as it
// was before a few of its objects moved: the drawing is brought up from it (updateDrawn) instead of computed whole.
void drawModel(Board& b, Topology& t, bool direct, RealizeStats& stats, int& nWires, bool editedOnly = false,
               const std::vector<int>* only = nullptr, ModelDrawing* keep = nullptr, const ModelDrawing* from = nullptr);

// A connection for manual routing, on the model: a copy of it with the new wire laid over the triangles from `from` to
// `to` on the layer (findRelay, as F6 re-lays a wire: among the wires as they run, each edge with room for it; squeezed
// in when there is no way with room, or only a very long one). An end on a pad, a via or a branch point of the net is that owner, one anywhere
// else a new free end of the wire. Nothing when there is no way on the layer.
struct ModelConnection {
  Topology model;
  int wire = -1;
  double length = 0;      // over the triangles, nm
  bool squeezed = false;  // no way with room
  Vec2 from, to;
  bool freeFrom = false, freeTo = false;  // the end stands off the point meant (a free end is put beside it: see the .cpp)
};
std::optional<ModelConnection> connectionOnModel(const Topology& live, Vec2 from, Vec2 to, LayerId layer, int net, Coord width, Coord widthMin, Coord clearance);
// The wire drawn as F5 draws it: with the wires of other nets sharing an edge with it, packed there, the rest as they
// lie (a way over the triangles may need them moved over); the wires of its own net stay.
struct DrawnConnection {
  std::vector<Track> tracks;  // the wire, from `from` to `to`
  std::vector<Track> board;   // the board's tracks with those wires redrawn, the wire not among them
};
DrawnConnection drawConnection(const Board& b, ModelConnection c);

// The model's violations as DRC violations (Type::Topology) for the message list and the selection: `a`
// and `b` are tracks of the wires concerned (or the pad a wire runs through).
std::vector<DrcViolation> topologyViolations(const Board& b, const Topology& t, const std::vector<Violation>& vs);

}  // namespace xr::topo

namespace xr::topo {

// Draws the given wires of the model with the realiser fed from the model itself: the obstacles are the
// mesh's vertices, every wire's crossings and the wires' order on every edge come from the model, nothing
// is derived from the sketches again. Appends the tracks to the board; `wires` receives the sketches used.
// `keep` receives the drawing itself: what was computed before the tracks were made (ModelDrawing).
RealizeStats realizeFromModel(Board& b, const Topology& t, const std::vector<int>& chosen, const RealizeOptions& opt,
                              std::vector<RealWire>* wires = nullptr, ModelDrawing* keep = nullptr, const ModelDrawing* from = nullptr);

// A drawing of wires of the model, kept: the realiser's input made from the model (the obstacles of every layer,
// the wires' crossings in their order on every edge), and what it computed from it — every wire's place and
// width on every edge it crosses, its bends and tangents (Drawn.h). The state that is to live with the model
// between drawings; for now it is of the board and the model as they were when it was drawn, and answers
// without a track made: measureDrawing.
struct ModelDrawing {
  std::vector<int> chosen;      // the model's wires drawn, in the realiser's order
  std::vector<RealWire> wires;  // ... as the realiser had them
  RealizeOptions opt;
  std::unique_ptr<RealizeInput> in;
  DrawnWires drawn;
};
// The counts, the length (RealizeStats::length) and the forces by owner (ownerForce) of a kept drawing, as
// realizeFromModel returned them when it made the tracks; `b` is the board it was drawn on (the board is read).
RealizeStats measureDrawing(const Board& b, const Topology& t, const ModelDrawing& drawing);

}  // namespace xr::topo
