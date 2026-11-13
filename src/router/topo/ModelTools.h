#pragma once
// F5 on the topological model: the mesh is taken to its weighted Delaunay fixed point, the wires get their
// sketches from the model (the slot midpoints of their crossings), and the realiser draws them once. A
// topological violation (wires crossing on a layer, a wire through another net's pad, a chain the mesh
// does not hold) stops it before anything is drawn.
#include <vector>

#include <map>
#include <memory>
#include <optional>

#include "router/topo/Drawn.h"
#include "router/topo/RealizerInput.h"
#include "core/Board.h"
#include "drc/Drc.h"
#include "router/topo/Realizer.h"
#include "topo/Capacity.h"
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
  // The nets made trees first (ModelSimplify.h): twins and loops taken out, where a net is not flexibly fixed.
  bool simplify = true;
  // ... and their trees made anew where that is shorter, after the drawing (F6's branch points: ModelRefine.h
  // branchesOnly). Not with editedOnly.
  bool branches = true;
};

struct F5ModelResult {
  bool drawn = false;                 // false: stopped by the violations
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int flips = 0;
  int wires = 0;
  int junctionMoves = 0;  // branch points moved to their balance
  int untangled = 0;      // double crossings taken apart first (resolveCrossings)
  int spareLinks = 0, spareVias = 0;  // twins and loops taken out first (simplifyNets), and the vias inside them
  int branches = 0, reattached = 0, branchesMerged = 0;  // the trees made anew: branch points made, moved, made one
  RealizeStats stats;
};

// The sketch the realiser gets for a wire of the model: its end vertices, the slot midpoints of its
// crossings, a point in every triangle it passes (nudged towards the centroid, as the router does).
// Where the wires cross one layer's edges — every crossing's slot middle, from the edge's first end — found edge by
// edge as asked for, once (every wire's sketch asks at each of its crossings, the realiser's input once more). An
// edge that stands as in an earlier drawing's points (`was`: the same ends where they were, the same wires in
// order) has that drawing's: the capacity that gives them is not computed again.
struct SlotPoints {
  struct Edge {
    int v0 = -1, v1 = -1, along = -1;
    int at = -1, n = 0;  // its crossings in `wires` and `mid` (at < 0: not asked for yet)
    Vec2 p0, p1, c0, c1;  // its ends, and the centres of their owners
    double L = 0;
  };
  std::vector<Edge> edges;   // by the mesh's edge number
  std::vector<int> wires;    // the crossing wires of the edges asked for, in each edge's order
  std::vector<double> mid;   // ... and the slot middle of each
  const Edge& of(const Topology& t, const LayerMesh& m, int e, const SlotPoints* was = nullptr);
};
// `slots`: the layer's points for the sketches of many wires of one model, `slotsWas` an earlier drawing's.
// `key` receives what the sketch is made of (the crossed edges' ends, the slot points); with `was` and `wasKey` — the
// wire's sketch and key of an earlier drawing — the sketch is that one when the key is the same.
using SketchKey = std::vector<double>;
RealWire sketchOf(const Board& b, const Topology& t, int wire, SlotPoints* slots = nullptr, const SlotPoints* slotsWas = nullptr, SketchKey* key = nullptr,
                  const RealWire* was = nullptr, const SketchKey* wasKey = nullptr);

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

// The vertex of an owner on a layer that a new wire coming from `from` ends at: a polygon pad's centre, else the
// vertex of its axis nearest.
int wireEndVertex(const Topology& t, const LayerMesh& m, int owner, Vec2 from);

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

// A wire led another way by hand (Freestyle: a wire dragged by the mouse): from its one end to the point and from the
// point to its other end, each the cheapest way over the triangles among the wires as they run (connectionOnModel's
// search), the wire itself out of the way. On a copy of the model; the two legs drawn as drawConnection draws —
// what is shown dashed while the mouse is down. Nothing: no way through the point, or the point is on copper of the
// net, or the wire is not one to lead (fixed, a pair's, of a flexibly fixed net).
struct WireThrough {
  std::vector<Track> tracks;  // from the wire's first end through the point to its other end
  bool squeezed = false;      // a leg found no way with room
  double length = 0;          // over the triangles, nm
};
std::optional<WireThrough> wireThrough(const Board& b, const Topology& live, int wire, Vec2 p);
// ... and laid so for good: the wire's tracks give way to the two legs, the model follows the board (built anew if
// it cannot), and the wire's shape is computed as F5 computes the edited wires' — the bend at the point goes where
// nothing holds it, the wire lies on the other side of what it was led round. False: nothing changed.
bool leadWireThrough(Board& b, Topology& t, int wire, Vec2 p);

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
  std::vector<SketchKey> sketchKeys;  // ... and what each one's sketch was made of (sketchOf)
  std::map<LayerId, SlotPoints> slotPoints;  // where the wires cross the edges, as the sketches and the input had it
  RealizeOptions opt;
  std::unique_ptr<RealizeInput> in;
  DrawnWires drawn;
};
// The counts, the length (RealizeStats::length) and the forces by owner (ownerForce) of a kept drawing, as
// realizeFromModel returned them when it made the tracks; `b` is the board it was drawn on (the board is read).
RealizeStats measureDrawing(const Board& b, const Topology& t, const ModelDrawing& drawing);

}  // namespace xr::topo
