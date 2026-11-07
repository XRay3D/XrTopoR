#pragma once
// The wires as chains of the board's tracks: one net, layer and width between pads, vias and branch
// points. The tools and the topological model read the board through these.
#include <array>
#include <optional>
#include <utility>
#include <vector>

#include "core/Board.h"
#include "core/Runs.h"
#include "core/SpatialIndex.h"

namespace xr::topo {

// (The graph of the tracks' ends and the pads and vias a wire may end on: core/Runs.h.)
using xr::kWireGlue;
using xr::OwnCopper;
using xr::WireGraph;
using xr::wireGraph;

struct WireChain {
  std::vector<int> tracks;  // the tracks of the wire, the short ones glued inside it too
  Polyline path;            // from end to end, arcs in points; from the track ends as they lie
  LayerId layer = 0;
  int net = kNoNet;
  Coord width = 0;
  bool closed = false;  // a loop: no end of its own
  int vertex[2] = {-1, -1};  // the wire graph's (glued) vertices at the ends
  Vec2 a() const { return path.front(); }
  Vec2 b() const { return path.back(); }
};

// A wide piece no longer than this many of its widths, between a node (a pad, a via, a branch) and the point
// where a thinner wire goes on, is a stub of that thinner wire. Measured on TopoR's F5 of
// Arcs_standard_routing: 0.8 mm pieces of 1.15, 1.36, 1.85, 2.05, 4.4 and 4.55 mm before a 0.3 mm branch
// are gone and the branch reaches the node; those of 11.35 and 14.0 mm stay. The limit lies between 5.7
// and 14 widths; eight is a choice within that.
constexpr double kStubAbsorb = 8.0;

// The widths the wires are laid with (WireGraph::width), from the runs of equal width between the nodes:
// - a neck — a run in series between two runs of one larger width, off the copper — is a piece of that
//   wire the realiser narrowed, and is laid with the wire's width again (narrowing does not stick);
// - a stub — a short run between a node and a thinner run in series — is laid with the thin width.
void effectiveWidths(const Board& b, WireGraph& g, const OwnCopper& copper);

// The chosen tracks grown to whole chains of one net and layer, as a mask over the tracks; no geometry
// is touched.
std::vector<char> growChains(const Board& b, std::vector<char> chosen, double glue = kWireGlue);
void growChains(const Board& b, std::vector<char>& chosen, const WireGraph& g);

// The chains of the chosen tracks (grown already). Chains end at branch points and wherever a vertex
// touches a pad or via of its net: manual routes often enter a pad off-centre, and the taut path must
// still pass through that copper.
std::vector<WireChain> wireChains(const Board& b, const WireGraph& g, const std::vector<char>& chosen,
                                  const OwnCopper& copper);

}  // namespace xr::topo
