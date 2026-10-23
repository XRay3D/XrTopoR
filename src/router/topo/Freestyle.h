#pragma once
// Freestyle (F8) as in TopoR: components, vias and wire branch points are dragged over a routed board
// and the wires attached to them take their optimal shape again after every small step (F5), so the
// routing stays whole and keeps its topology. With pushing, vias (and unlocked components) of other
// nets in the way give way, the wires of other nets bend around the moved objects, and a step that
// would leave a conflict with something that cannot give way is not made.
#include <optional>

#include "core/Edit.h"

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

// A branch point of a wire near `p` (where three or more track ends meet, off pads and vias).
std::optional<FreestyleTarget> branchPointAt(const Board& b, Vec2 p, double tol);

}  // namespace xr::topo
