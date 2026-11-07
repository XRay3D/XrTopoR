#pragma once
// Freestyle (F8) as in TopoR: components, vias and wire branch points are dragged over a routed board
// and the wires attached to them take their optimal shape again after every small step (F5), so the
// routing stays whole and keeps its topology. With pushing, vias (and unlocked components) of other
// nets in the way give way, the wires of other nets bend around the moved objects, and a step that
// would leave a conflict with something that cannot give way is not made.
#include <optional>

#include "core/Edit.h"
#include "topo/Topology.h"

namespace xr::topo {

enum class Push { None, Vias, ViasAndComponents };

struct FreestyleTarget {
  edit::Fragment fragment;     // components and vias (wire shapes are not edited in Freestyle)
  std::optional<Vec2> vertex;  // or a branch point of a wire: its position, layer and net
  LayerId vertexLayer = -1;
  int vertexNet = kNoNet;
};

struct FreestyleResult {
  Vec2 moved;         // the shift made (less than asked when blocked)
  double turned = 0;  // the rotation made, degrees
  bool blocked = false;
};

// Moves the target by `shift` and turns it by `rotate` about `pivot`, step by step; a vertex target
// follows its new position.
FreestyleResult freestyle(Board& b, FreestyleTarget& t, Vec2 shift, double rotate, Vec2 pivot, Push push);
// Freestyle on the live model, a shift without pushing: the target's owners (its vias, its components' pads, the
// branch point) moved in the model step by step (moveOwner: the mesh flips round them, the wires keep their
// topology), the vias and components with them on the board (no track stretched), and the wires at them and across
// the edges round them drawn again from the model, the rest as they lie. Stops where the mesh refuses a step;
// `inStep` false when the model and the board no longer agree (a component's pads moved apart): build it anew.
FreestyleResult freestyleModel(Board& b, Topology& t, FreestyleTarget& tg, Vec2 shift, bool& inStep);

// A branch point of a wire near `p` (where three or more track ends meet, off pads and vias).
std::optional<FreestyleTarget> branchPointAt(const Board& b, Vec2 p, double tol);

}  // namespace xr::topo
