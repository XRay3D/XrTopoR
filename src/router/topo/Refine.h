#pragma once
// TopoR's «Перекладка проводников» (F6, Refine): the paths of wires are optimised. Every wire (a chain
// of segments of one net and layer between pads, vias and branch points) looks for a shorter path
// around the copper of other nets as it lies now; with layer changes allowed, a wire between through
// pads or vias may also move to another layer. A new path is taken when it leaves fewer clearance
// conflicts around, or as many and is shorter (wires in violation are re-laid around the copper they
// conflict with, as TopoR's F6 repairs them); vias left with nothing to join are removed afterwards.
#include <atomic>
#include <functional>
#include <optional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::topo {

struct RefineOptions {
  bool changeLayers = true;
  std::vector<int> tracks;  // wires to refine (grown to whole chains); empty: all unlocked ones
  std::vector<int> nets;    // only wires of these nets; empty: any
  std::vector<LayerId> layers;  // layers a wire may move to; empty: every signal layer
  std::function<void(int done, int total, const std::string& stage)> progress;
  const std::atomic<bool>* cancel = nullptr;
};

struct RefineResult {
  int wires = 0;         // chains tried
  int improved = 0;      // got a shorter path
  int layerChanges = 0;  // of them on another layer
  int repaired = 0;      // got a path with fewer conflicts
  int viasRemoved = 0;
  double lengthBefore = 0, lengthAfter = 0;  // nm, of the chains tried
  double seconds = 0;
};

RefineResult refine(Board& b, const RefineOptions& o = {});

// Shortest path of a wire of `net` and `width` on `layer` from `from` to `to` that keeps its clearance
// to the copper of other nets and to the board edge (grid search inside `region`); the start and end
// cells are always free. Tracks marked in `ignore` are not obstacles. Empty when there is none.
std::optional<Polyline> findPath(const Board& b, Vec2 from, Vec2 to, LayerId layer, int net, Coord width,
                                 const BBox& region, const std::vector<char>& ignore = {});

}  // namespace xr::topo
