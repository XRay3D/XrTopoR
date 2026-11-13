#pragma once
// F7 on the topological model, as TopoR moves its vias and branch points (Bessonov, Luzin, Lyachek, Popov,
// "Dynamic construction of Steiner trees in CAD TopoR", Izv. SPbGETU LETI 2014 no. 4): every wire pulls the
// elements its ends are fixed to along itself, presses on the elements it bends round — by what its length
// gains per unit of the element's shift — and pushes apart the elements it has no room between; the sum of
// those forces on an element says which way it goes and how far, and the steps shrink from iteration to
// iteration. The forces are taken from the drawing itself (RealizeStats::ownerForce: the realiser's bends
// and tangents are the wire of the paper's figure), so what is descended is the length that is drawn.
#include <memory>
#include <optional>
#include <string>
#include <vector>

#include "core/Board.h"
#include "drc/Drc.h"
#include "router/topo/ModelTools.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

struct OptimizeModelOptions {
  bool flips = true;                // Lawson's loop before the first drawing
  // TopoR's schedule of the step limit: `hold` iterations at `tol`, then × `decay` down to `floor`.
  double tol = 1.0 * kNmPerMm;
  int hold = 6;
  double decay = 0.8;
  double floor = 0.01 * kNmPerMm;
  int clearRounds = 4;              // at most so many rounds of vias stepping off the copper they are too close to, first
  bool vias = true, junctions = true;
  bool clasps = true;               // the clasps of the differential pairs move as branch points (F5 leaves them: TopoR's does)
  bool contacts = true;             // a via pressed against another shares its force with it (the pair moves as one)
  bool merge = true;                // a branch point that ends inside copper of its own net merges with the pad or via
  // These owners alone move (empty: all the options name), and their wires alone are drawn (the rest as they lie).
  std::vector<int> owners;
};

struct OptimizeModelResult {
  bool drawn = false;
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int iterations = 0, viaMoves = 0, junctionMoves = 0;
  int junctionsInCopper = 0;  // branch points that ended inside copper of their own net
  int merged = 0;             // ... and were merged with the pad or via there
  int untangled = 0;          // double crossings taken apart first (resolveCrossings)
  int drawings = 0;    // how many times the model was drawn and judged
  int rollbacks = 0;   // iterations whose drawing was worse and stayed worse without the steps blamed
  int conflictsBefore = 0, conflictsAfter = 0;  // the DRC of the first drawing and of the result
  double lengthBefore = 0, lengthAfter = 0;      // the drawn tracks, nm
  double depthBefore = 0, depthAfter = 0;        // the violations' shortfall summed, nm
  double forceBefore = 0, forceAfter = 0;        // the forces on the movable objects, summed lengths (unit vectors)
  std::vector<std::string> log;
  int wires = 0;
  RealizeStats stats;
};

// The DRC names a violation once per pair of pieces (an arc is many tracks): the places are what is judged —
// the violations of one pair of nets within a millimetre of each other, as deep as the deepest of them.
struct Place {
  std::pair<int, int> nets;
  Vec2 pos;
  double depth = 0;
  bool shorted = false;
};
// The DRC's violations of a board gathered into places.
std::vector<Place> placesOf(const Board& b, const std::vector<DrcViolation>& vs);
// The places of `now` that `was` has not, or has shallower by more than the drawing's noise: what a change added.
std::vector<Place> addedPlaces(const std::vector<Place>& was, const std::vector<Place>& now);

// What a drawing is worth to the judge of F6 and F7: the DRC's violations gathered into places (one pair of
// nets within a millimetre, as deep as the deepest), nothing unrouted counted in.
struct DrawingScore {
  size_t unrouted = 0;
  int shorts = 0, deep = 0, real = 0;  // places shorted; deeper than the limit of a violation; deeper than the noise
  int places = 0, conflicts = 0;       // places; violations as the DRC counts them
  double shortfall = 0;                // the DRC's violations' depth summed, nm
  double depth = 0, length = 0;        // the places' depth; the tracks' length, nm
  int vias = 0;
  std::vector<Place> at;               // the places themselves
  double score() const;                // length + 100 mm per mm of depth + 1 mm per place + kViaCost per via
};
// What a via is worth in length to the judge (F6 takes a via away when the wires get no longer than this for
// it; the number of vias changes nowhere else).
constexpr double kViaCost = 3.0 * kNmPerMm;
DrawingScore scoreDrawing(const Board& b);
// A violation is not bought with length: less unrouted, then fewer places shorted, deep, real; then the score.
bool betterDrawing(const DrawingScore& a, const DrawingScore& than);

// The tracks of a board edited (ends moved, tracks and vias added and taken away), drawn anew through a model
// built from them. Nothing when the model of the tracks has wires crossing or a wire through another net's pad.
struct Redrawn {
  Topology model;
  Board board;
  DrawingScore score;
  std::shared_ptr<const ModelDrawing> kept;  // the drawing itself (ModelTools.h): one of the same model's wires is brought up from it
  bool followed = false;     // the model is the live one brought to the edit, not one built anew
  std::vector<int> wireMap;  // ... and, per wire of the live model, its number in this one (-1: laid again)
};
// The model the edited board was drawn from, and that board as it was before the edit (its wires own that board's
// tracks): with them the model follows the edit instead of being built anew.
struct LiveModel {
  const Topology* model = nullptr;
  const Board* board = nullptr;
  std::vector<uint32_t> touched;  // tracks to lay again though they stand (Topology::follow)
};
// The model of an edited board: the live one brought to the edit, or — where it cannot follow — one built anew.
// True: it followed. (`edited` has its ids.)
bool modelOfEdited(Topology& model, const Board& edited, const LiveModel& live, std::vector<int>* wireMap = nullptr);
std::optional<Redrawn> redrawTracks(const Board& edited, bool flips, int& drawings, const LiveModel& live = {});

// The vias that stand closer to copper of other nets than the rule (per owner; F7's first steps take them off
// it). F6 leaves the edges at them alone: a wire led past such a via takes the room it has to step into
// (Arcs_standard_routing: F7 after such an F6 was left with 5 deep violations of via against pad, 2 without).
std::vector<char> viasTooClose(const Board& b, const Topology& t);

// Relaxes the unlocked vias and the branch points of unlocked wires and draws the model: the board gets the
// best drawing seen. The first one is F5's own, so the result is never worse than F5 by the judge: less
// unrouted, then fewer places shorted, deeper than the limit of a violation, real at all (a violation is not
// bought with length), then length + 100 mm per mm of shortfall + 1 mm per place.
OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o = {});

}  // namespace xr::topo
