#pragma once
// The branch points a net's wires are given and lose (Bessonov, Luzin, Lyachek, Popov, "Dynamic construction
// of Steiner trees in CAD TopoR", Izv. SPbGETU LETI 2014 no. 4, fig. 4 and 5). Two wires of a net that leave a
// vertex at less than 120 degrees are a sign that the net is not the shortest it can be: the pair of segments
// is replaced by three at a new vertex — a trunk and the two branches — and the vertex goes to its balance by
// the force algorithm. Two branch points the forces have brought together are one: its four wires are then
// paired anew by the same rule (the paper's re-stitching of a four-terminal net).
//
// Both work on the drawn tracks: the model has no operation that cuts a wire at a vertex, and needs none —
// the conversion makes a branch point where three tracks meet. The board's tracks are edited, the model is
// built from them anew, drawn, and the drawing judged.
#include <string>
#include <vector>

#include "core/Board.h"
#include "router/topo/ModelRelax.h"
#include "topo/Topology.h"

namespace xr::topo {

struct BranchOptions {
  double gain = 0.1 * kNmPerMm;  // what a new branch point has to save at the least
  bool flips = true;
};

struct BranchResult {
  int candidates = 0;  // pairs of wires under 120 degrees with the gain
  int made = 0;        // branch points made (splitBranches) or merged (mergeBranchPoints)
  int drawings = 0;
  double gain = 0;     // the sum the new branch points save where they are made, nm (the forces take them on)
  std::vector<std::string> log;
};

// New branch points for the pairs of wires leaving a via, a round pad, an oval pad's end or a branch point
// at less than 120 degrees: one pair a vertex and one use of a wire a pass. `b` is the model's drawing (the
// wires of `t` own its tracks); both are replaced when the new drawing is better by the judge.
BranchResult splitBranches(Board& b, Topology& t, const BranchOptions& o = {});

// The branch points of a net and layer that stand within each other's copper become one.
BranchResult mergeBranchPoints(Board& b, Topology& t, const BranchOptions& o = {});

// The clinch paper's fig. 6 (Luzin, Popov, Popov 2012): the only wire of a pad or a via goes to a branch point
// of three wires the long way, while another wire of the net passes nearer to the pad. That wire is taken off,
// the pad is joined to the near wire by a new branch point (a wire of the model laid from a stub on the near
// wire to the pad, the wires of other nets that hold it taken out and laid anew after it), and the old branch
// point is left a bend. One re-attachment a call, the one with the most to gain that the judge takes.
BranchResult reattachBranches(Board& b, Topology& t, const BranchOptions& o = {});

}  // namespace xr::topo
