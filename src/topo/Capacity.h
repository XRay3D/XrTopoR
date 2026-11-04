#pragma once
// How much of an edge the wires crossing it take: the realiser's packing (Realizer.cpp, pack()) done
// on the model, so that what fits and what overflows is known before anything is drawn.
#include <vector>

#include "topo/Topology.h"

namespace xr::topo {

// The margin the realiser adds to every clearance against tessellation and rounding (Realizer.h).
constexpr double kCapacityMargin = 2000;

struct EdgeCapacity {
  double L = 0;                 // the edge's length
  double reachU = 0, reachV = 0;  // how far the end owners' copper reaches along it (for a foreign wire)
  double freeLen = 0;           // L - reachU - reachV
  double need = 0;              // what the crossing wires take, with the margin where it was kept
  double slack = 0;             // freeLen - need (the margin counted: 0 or more means it fits)
  double deficit = 0;           // what is missing at the bare rule with the narrowed widths (0: nothing)
  bool narrowed = false;        // some wire at its minimum width
  bool margin = true;           // the margin kept
  uint8_t cls = 0;              // Edge::cls
  std::vector<double> a, b;     // per crossing: packed centre-line distance from u and from v
  std::vector<double> width;    // per crossing: the width used
};

// The capacity of edge e of mesh m from its crossings as they are.
EdgeCapacity edgeCapacity(const Topology& t, const LayerMesh& m, int e);
// Writes it into the edge (freeLen, need, cls) and the crossings (width).
void refreshEdge(Topology& t, LayerMesh& m, int e);
// The slot of crossing k on edge e: [lo, hi] along u -> v, and its midpoint (the sketch point).
struct Slot {
  double lo = 0, hi = 0;
  double mid() const { return (lo + hi) / 2; }
};
Slot slotOf(const EdgeCapacity& c, int k);
// The radius of the k-th wire's bend around the edge's u (end 0) or v (end 1): the packed stack.
double stackRadius(const EdgeCapacity& c, int k, int end);

}  // namespace xr::topo
