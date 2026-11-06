#pragma once
// F7 on the topological model, as TopoR moves its vias and branch points (Bessonov, Luzin, Lyachek, Popov,
// "Dynamic construction of Steiner trees in CAD TopoR", Izv. SPbGETU LETI 2014 no. 4): every wire pulls the
// elements its ends are fixed to along itself, presses on the elements it bends round — by what its length
// gains per unit of the element's shift — and pushes apart the elements it has no room between; the sum of
// those forces on an element says which way it goes and how far, and the steps shrink from iteration to
// iteration. The forces are taken from the drawing itself (RealizeStats::ownerForce: the realiser's bends
// and tangents are the wire of the paper's figure), so what is descended is the length that is drawn.
#include <string>
#include <vector>

#include "core/Board.h"
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
  bool contacts = true;             // a via pressed against another shares its force with it (the pair moves as one)
  bool merge = true;                // a branch point that ends inside copper of its own net merges with the pad or via
};

struct OptimizeModelResult {
  bool drawn = false;
  std::vector<Violation> violations;  // what stopped it (or the overflows found, when drawn)
  int iterations = 0, viaMoves = 0, junctionMoves = 0;
  int junctionsInCopper = 0;  // branch points that ended inside copper of their own net
  int merged = 0;             // ... and were merged with the pad or via there
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

// Relaxes the unlocked vias and the branch points of unlocked wires and draws the model: the board gets the
// best drawing seen. The first one is F5's own, so the result is never worse than F5 by the judge: less
// unrouted, then fewer places shorted, deeper than the limit of a violation, real at all (a violation is not
// bought with length), then length + 100 mm per mm of shortfall + 1 mm per place.
OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o = {});

}  // namespace xr::topo
