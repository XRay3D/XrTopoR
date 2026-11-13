#pragma once
// Freestyle (F8) as in TopoR: components, vias and wire branch points are dragged over a routed board and the
// wires take their shape again after every move, the routing whole and its topology as it was. It is done in the
// model: the dragged objects' owners move in the meshes as one body (moveOwners, turnOwners: the flips carry the
// wires' crossings), the board's vias and components are put where the owners are, and the wires round them are
// drawn again from the model. No track is stretched, nothing is read back from the drawing.
//
// Without pushing the clearances are not looked at (TopoR: «без соблюдения зазоров»): only the mesh stops the
// body — an owner does not pass through another, nor through a row of pads no wire passes between. With pushing,
// what the moved body comes nearer to than the rule — copper to copper, or with less room than the wires between
// them need — gives way: a via or a branch point, and with the third mode an unlocked component, whole; what they
// are pushed onto gives way in turn. A step that leaves something too close to what cannot give way (a pad in the
// second mode, a locked object, a via of a flexibly fixed net, the outline) is taken back, all of it. And what the
// model's room does not show the drawing does: with pushing, a move after which the board's check finds a conflict
// it did not have is taken back and tried at half the length (the judge of F7).
#include <memory>
#include <optional>

#include "core/Edit.h"
#include "topo/Topology.h"

namespace xr::topo {

struct FreestyleState;

enum class Push { None, Vias, ViasAndComponents };

struct FreestyleTarget {
  edit::Fragment fragment;     // components and vias (wire shapes are not edited in Freestyle)
  std::optional<Vec2> vertex;  // or a branch point of a wire: its position, layer and net
  LayerId vertexLayer = -1;
  int vertexNet = kNoNet;
  // The components moved since the drag began — the target's and the pushed ones: where each stood and where two of
  // its pads' owners were. The board's component is put by the owners as they are now against that, so the rounding
  // of a thousand mouse steps does not add up between the model and the board.
  struct Carried {
    int component = -1;
    Point pos;
    double angle = 0;
    int ownerA = -1, ownerB = -1;  // (B: -1 for a component of one pad)
    Vec2 atA, atB;
  };
  std::vector<Carried> carried;
  double turned = 0;  // the target's turn since the drag began, degrees
  // What a drag keeps between its moves (Freestyle.cpp): the drawing of the board's wires after the last move — the
  // next one is brought up from it —, and with pushing the board's conflicts as they stood.
  std::shared_ptr<FreestyleState> state;
};

struct FreestyleResult {
  Vec2 moved;         // the shift made (less than asked when blocked)
  double turned = 0;  // the rotation made, degrees
  bool blocked = false;
  bool lockedWire = false;  // ... by a fixed wire at the target: nothing moved
};

// Moves the target by `shift` and turns it by `rotate` degrees about `pivot`, step by step, on the board's model
// `t` (which follows: it is the board's model after the call as before it). A vertex target follows its position.
FreestyleResult freestyle(Board& b, Topology& t, FreestyleTarget& tg, Vec2 shift, double rotate, Vec2 pivot, Push push);

// A branch point of a wire near `p` (where three or more track ends meet, off pads and vias).
std::optional<FreestyleTarget> branchPointAt(const Board& b, Vec2 p, double tol);

}  // namespace xr::topo
