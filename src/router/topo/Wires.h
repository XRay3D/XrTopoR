#pragma once
// The wires as all the tools see them: the board keeps tracks, a wire is a chain of tracks of one net,
// layer and width between pads, vias and branch points. F5 re-lays such chains, F6 looks for a new path
// for each, F7 and F8 re-lay the chains attached to what they move.
#include <array>
#include <optional>
#include <utility>
#include <vector>

#include "core/Board.h"
#include "router/topo/Realizer.h"
#include "topo/Chains.h"

namespace xr::topo {

// A wire for the realiser, its widths and clearance by the rules of its net on its layer.
RealWire wireFor(const Board& b, int net, LayerId layer, Coord width, Polyline sketch);

// What the realiser lays for the chains: split where they run through their own pads and vias, the ends
// in a via or a round pad at its centre, the ones wholly inside such copper gone.
std::vector<RealWire> sketchesOf(const Board& b, const std::vector<WireChain>& chains, const OwnCopper& copper);

struct ReshapeOptions {
  // Limits the obstacles to the neighbourhood of the chosen chains (faster, same result).
  bool local = false;
  double glue = kWireGlue;
  // > 0: the chains of every other unlocked track that runs closer than this to a chosen chain are re-laid
  // too — a chain laid alone against the fixed wires next to it does not come out as it does laid
  // together with them (the nesting around shared obstacles is lost). `aroundNets` non-empty: only
  // neighbours of those nets.
  double around = 0;
  std::vector<int> aroundNets;
};

// TopoR "F5": the chosen tracks (grown to whole chains) become sketches, are removed from the board and
// realised again with all other copper as obstacles.
RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, const ReshapeOptions& o = {});

}  // namespace xr::topo
