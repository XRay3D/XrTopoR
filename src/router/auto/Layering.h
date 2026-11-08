#pragma once
// Layering of the combined topology (Polubasov 2010; Luzin, Popov, Popov 2013 after Polubasov 2001): every wire has
// a layer at each of its crossings with wires of other nets; two wires crossing are on different layers there
// (hard), and a wire whose layer differs at two neighbouring crossings has a via between them (soft, one via each).
// Its ends prefer the layers of their pads (an SMD pad's layer; a via next to the pad otherwise).
//
// With two layers the crossing constraints split the points into components, each with two colourings: the search
// flips whole components (Polubasov: the layerings that keep every path and change no crossing are the components'
// flips; of the many equally good ones a random one is taken). More layers: the points one by one.
#include <cstdint>
#include <random>
#include <utility>
#include <vector>

namespace xr::autoroute {

struct LayerProblem {
  int layers = 2;                            // the layers 0 .. layers-1
  int vars = 0;                              // the points
  std::vector<std::pair<int, int>> differ;   // points that must be on different layers (a crossing)
  std::vector<std::pair<int, int>> same;     // neighbouring points of one wire: a via each pair that differs
  std::vector<uint32_t> allowed;             // per point: the layers it may be on (bit mask; 0 or all bits: any)
  struct End {
    int var;
    uint32_t layers;  // the pad's layers: a via when the point is on none of them
  };
  std::vector<End> ends;
};

struct Layering {
  std::vector<int> layer;  // per point
  int vias = 0;            // soft costs paid (vias)
  int conflicts = 0;       // hard pairs on one layer (an odd cycle of crossings: no layering keeps them apart)
};

// The best of `restarts` local searches from random starts (seeded).
Layering solveLayers(const LayerProblem& p, int restarts = 16, unsigned seed = 1);

}  // namespace xr::autoroute
