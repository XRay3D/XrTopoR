#pragma once
// The runs of the board's tracks: what TopoR's .fst calls a Subwire — tracks of one net and layer end to end,
// between branch points, pads and vias. One definition of a chain for the model (topo/Chains.h wireChains),
// the file writer and the editing; the graph of the tracks' ends and the pads and vias a wire may end on.
#include <array>
#include <functional>
#include <optional>
#include <utility>
#include <vector>

#include "core/Board.h"
#include "core/SpatialIndex.h"

namespace xr {

// Ends of one net and layer closer than this fraction of the width (never under 1 µm) are one vertex: a
// wire drawn by hand up to the end of another misses it by a few µm, the copper overlaps all the same.
// Env XR_GLUE overrides it.
constexpr double kWireGlue = 0.1;

// The vertices of the chains: the ends of the tracks of the chosen nets.
struct WireGraph {
  std::vector<char> relevant;           // tracks of the chosen nets (the vertex set is theirs)
  std::vector<std::array<int, 2>> vid;  // per track: vertex of a and of b (-1: not relevant)
  std::vector<std::vector<int>> ends;   // per vertex: the tracks ending there
  std::vector<char> tiny;               // per track: both ends glued into one vertex
  // Per track: the width its wire is laid with. The track's own, until effectiveWidths() has looked at the
  // runs: a neck goes back to the width of the wire it is a piece of, a short wide stub takes the width
  // of the thin branch that goes on from it.
  std::vector<Coord> width;
  int count = 0;
};
// glue < 0: ends meet only where they are equal (the runs as a file writes them). conductors: a zipped pair's
// conductors are in the graph too (else they are no wire of their nets: the pair's axis is, topo/Convert.cpp).
WireGraph wireGraph(const Board& b, const std::vector<char>& chosen, double glue = kWireGlue, bool conductors = false);

// The pads and vias a wire may end on.
class OwnCopper {
 public:
  explicit OwnCopper(const Board& b);
  // On a pad or via of the net.
  bool touches(Point p, int net, LayerId layer) const;
  // The pad or via of the net at p, if any.
  std::optional<ItemRef> at(Vec2 p, int net, LayerId layer) const;
  // The via or round pad of the net at p: its centre and radius.
  std::optional<std::pair<Vec2, double>> roundAt(Vec2 p, int net, LayerId layer) const;
  // The points where p->q runs through a pad or via of the net, not at an end, ordered along it.
  std::vector<Vec2> crossedBetween(Vec2 p, Vec2 q, int net, LayerId layer, Coord width) const;

 private:
  const Board& b_;
  SpatialIndex idx_;
};

// One step of a chain: a track, walked from b to a when `reversed`; `inner`: a tiny track (both ends glued into
// one vertex) that goes with the chain through the vertex it is.
struct ChainStep {
  int track = -1;
  bool reversed = false;
  bool inner = false;
};
struct Chain {
  std::vector<ChainStep> steps;
  bool closed = false;       // a loop: no end of its own
  int vertex[2] = {-1, -1};  // the graph's vertices at the ends
};
// The chains of the chosen tracks: walked from track to track through vertices where exactly two (not tiny)
// tracks meet and `same(i, j)` says j goes on the chain of i; ended at branch points, where the next track is no
// continuation and where `stop` says. Chains with an end first, in the tracks' order, then the loops.
// `stop(p, track)`: the chain ends at the end p of the track (on copper of its net) — null: never.
std::vector<Chain> walkChains(const Board& b, const WireGraph& g, const std::vector<char>& chosen,
                              const std::function<bool(Point, int)>& stop, const std::function<bool(int, int)>& same);

// A run: the tracks of one net and layer, of one width, fixation and zipped section, end to end; ended at branch
// points, on a via of the net and at the centre of a pad of the net (as TopoR ends its wires: the lead inside a
// pad is the wire's), and where the next track differs.
struct Run {
  LayerId layer = 0;
  int net = kNoNet;
  Coord width = 0;
  bool locked = false;
  int zip = -1;
  bool closed = false;
  std::vector<ChainStep> steps;
  Point start(const Board& b) const;  // the first step's start
};
struct RunOptions {
  bool exact = false;    // ends meet only where equal (a file's Start and End points): else glued as the model glues
  bool atCopper = true;  // end on a via of the net and at the centre of a pad of the net
};
// The runs of the chosen tracks (all when none), the pairs' conductors among them.
std::vector<Run> buildRuns(const Board& b, const RunOptions& o = {}, const std::vector<char>* chosen = nullptr);

}  // namespace xr
