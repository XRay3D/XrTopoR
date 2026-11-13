#pragma once
// A net's wires made a tree again (F5, F6 and F7 begin with it): what connects nothing that is not connected without
// it goes — a wire laid twice between the same two points, a loop (two ways between two points of a net), a
// branch point two wires meet at (they are one wire). TopoR warns of such a net («Цепь содержит контур») and its
// refinement takes the wire out; ours were left: a twin was packed beside its wire a clearance apart, a loop was
// drawn as it was, the knot of wires at a pad stayed.
//
// The net by the model: its owners are nodes, its wires edges. A chain of wires through vias and branch points that
// only two wires meet at is one link; the links that make the net a tree of the least length (a via inside a link
// counts as kViaCost) stay, the rest go — the fixed ones and the pairs' always stay, a free end (routing not
// finished) is never touched. The tracks and the vias of what goes leave the board and the model follows it.
//
// Not for a net with the flexible fixation: its topology is its user's.
#include <string>
#include <vector>

#include "core/Board.h"
#include "topo/Topology.h"

namespace xr::topo {

struct SimplifyResult {
  int links = 0;  // links taken out: twins and loops
  int wires = 0;  // ... their wires
  int vias = 0;   // ... and the vias inside them
  std::vector<std::string> log;
};

// The links of the board's nets that are not needed, taken out; the model is the board's after as before (it
// follows, or is built anew where it cannot). A net whose connections would be fewer for it is left as it is (a wire
// may connect by lying over a pad, which the model does not know).
SimplifyResult simplifyNets(Board& b, Topology& t);

}  // namespace xr::topo
