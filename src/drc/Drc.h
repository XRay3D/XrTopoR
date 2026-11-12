#pragma once
#include <functional>
#include <string>
#include <vector>

#include "core/Connectivity.h"

namespace xr {

struct DrcViolation {
  // Topology: a violation of the topological model that stopped F5/F7 before anything was drawn (wires
  // crossing on a layer, a wire through another net's pad); `message` names the kind and the nets.
  enum class Type { Clearance, Short, Edge, Unconnected, Width, Keepout, Topology };
  Type type = Type::Clearance;
  std::string message;
  Vec2 pos;
  ItemRef a, b;
  bool hasB = false;
  LayerId layer = -1;
  double actual = 0, required = 0;  // nm
};

struct DrcOptions {
  bool clearance = true;
  bool edge = true;
  bool unconnected = true;
  bool widths = true;        // wires narrower than the minimum of their width rules
  bool keepouts = true;      // wires, vias and copper areas in (or across) routing keepouts
  double tolerance = 2000;   // nm: smaller shortfalls are rounding
  size_t maxViolations = 5000;
};

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt = {});
// The check of a board that differs in a few tracks and vias from one checked before (its pads, zones, outline and
// rules the same): the violations between things that stand are the earlier check's, the changed tracks and vias
// are checked against everything. The same violations in the same order as the check of the whole board gives.
// Without the connections (opt.unconnected off); a board with as many violations as the options' limit is checked whole.
struct DrcEarlier {
  const std::vector<DrcViolation>* violations = nullptr;  // runDrc's of the earlier board, by the same options
  std::vector<int> trackWas, viaWas;  // per track / via of this board: its number on the earlier one; -1: new or changed
};
std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt, const DrcEarlier& earlier);
// The earlier check for it: the tracks of `now` that `was` has just so (found by what they are: ends, arc, width,
// layer, net), the vias that stand where they stood. `changed` receives how many tracks and vias do not.
// With other pads or zones the two boards are not for it: no violations in the result, and runDrc checks the whole.
DrcEarlier drcEarlier(const Board& was, const std::vector<DrcViolation>& violations, const Board& now, size_t* changed = nullptr);
// Required clearance between two nets (max of their class clearances).
double requiredClearance(const Board& b, int netA, int netB, LayerMask layers = 0);
const char* drcTypeName(DrcViolation::Type t);

// Online check of a prospective copper shape: returns the worst (smallest) margin
// distance - required clearance (>= 0 means OK). `hit` receives the offending item.
double shapeMargin(const Board& b, const SpatialIndex& idx, const Shape& s, LayerMask layers, int net,
                   ItemRef* hit = nullptr);

struct ConflictSum {
  int count = 0;
  int shorts = 0;    // of those, pairs whose copper touches or crosses (actual <= 0)
  double depth = 0;  // sum of (required - actual) clearance, nm
};
// Clearance and edge conflicts, counted as runDrc counts them, of the copper item pairs with at least
// one item touching `region`. With `changed`, only the pairs with at least one changed item (the
// others are the same before and after a local move, and cancel out of its score).
ConflictSum regionConflicts(const Board& b, const SpatialIndex& idx, const BBox& region,
                            const std::function<bool(ItemRef)>& changed = {});

}  // namespace xr
