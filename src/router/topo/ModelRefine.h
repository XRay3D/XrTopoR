#pragma once
// F6 on the topological model: TopoR's re-laying of the wires (Polubasov, Elektronika NTB 2010 no. 6: a wire
// is taken out and led by a cheaper path over the triangulation, the clearances kept). A wire's new path may
// run between the wires of other nets — they move over when the shapes are computed — which the search among
// the copper as it lies (Refine.h) cannot do. Measured on TopoR's own F6 of Arcs_standard_routing: 28 of 375
// wires go the other side of other nets' pads (59.6 mm), 8 of 25 branch points move, no via does.
#include <string>
#include <vector>

#include "core/Board.h"
#include "router/topo/Realizer.h"
#include "topo/Topology.h"

namespace xr::topo {

struct RefineModelOptions {
  bool flips = true;       // Lawson's loop before the first drawing
  bool junctions = true;   // the branch points go to their balance afterwards (the forces of F7, vias standing)
  // New branch points where two wires of a net leave a vertex at less than 120 degrees, and the branch points
  // the forces bring together made one and paired anew (ModelBranch.h; the paper's fig. 4 and 5); the wires at
  // the branch points are then re-laid once more (fig. 6: a branch round a vertex in its way goes the other
  // side of it).
  bool branches = true;
  // A wire is tried when it is this much longer than the straight line between its ends, and its new path
  // taken to the drawing when it is shorter than the old by the larger of the two.
  double detour = 0.3 * kNmPerMm;
  double gain = 0.05 * kNmPerMm;
  double gainPart = 0.01;
};

struct RefineModelResult {
  bool drawn = false;
  std::vector<Violation> violations;  // what stopped it
  int wires = 0;      // wires looked at
  int found = 0;      // ... with a shorter path found
  int relaid = 0;     // ... and kept: the drawing was better with it
  int junctionMoves = 0;
  int branches = 0;        // branch points made
  int branchesMerged = 0;  // pairs of branch points made one
  int drawings = 0;
  int conflictsBefore = 0, conflictsAfter = 0;
  double lengthBefore = 0, lengthAfter = 0;  // the drawn tracks, nm
  std::vector<std::string> log;
  RealizeStats stats;
};

// Re-lays the unlocked wires and draws the model; the board gets the best drawing (the first one is F5's own).
RefineModelResult refineModel(Board& b, Topology& t, const RefineModelOptions& o = {});

}  // namespace xr::topo
