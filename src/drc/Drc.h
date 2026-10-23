#pragma once
#include <string>
#include <vector>

#include "core/Connectivity.h"

namespace xr {

struct DrcViolation {
  enum class Type { Clearance, Short, Edge, Unconnected };
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
  size_t maxViolations = 5000;
};

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt = {});
// Required clearance between two nets (max of their class clearances).
double requiredClearance(const Board& b, int netA, int netB, LayerMask layers = 0);
const char* drcTypeName(DrcViolation::Type t);

// Online check of a prospective copper shape: returns the worst (smallest) margin
// distance - required clearance (>= 0 means OK). `hit` receives the offending item.
double shapeMargin(const Board& b, const SpatialIndex& idx, const Shape& s, LayerMask layers, int net,
                   ItemRef* hit = nullptr);

}  // namespace xr
