#pragma once
// The wires as all the tools see them: the board keeps tracks, a wire is a chain of tracks of one net,
// layer and width between pads, vias and branch points. F5 re-lays such chains, F6 looks for a new path
// for each, F7 and F8 re-lay the chains attached to what they move.
#include <array>
#include <optional>
#include <utility>
#include <vector>

#include "core/Board.h"
#include "core/SpatialIndex.h"
#include "router/topo/Realizer.h"

namespace xr::topo {

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
  int count = 0;
};
WireGraph wireGraph(const Board& b, const std::vector<char>& chosen, double glue = kWireGlue);

// The pads and vias a wire may end on.
class OwnCopper {
 public:
  explicit OwnCopper(const Board& b);
  // On a pad or via of the net.
  bool touches(Point p, int net, LayerId layer) const;
  // The via or round pad of the net at p: its centre and radius.
  std::optional<std::pair<Vec2, double>> roundAt(Vec2 p, int net, LayerId layer) const;
  // The points where p->q runs through a pad or via of the net, not at an end, ordered along it.
  std::vector<Vec2> crossedBetween(Vec2 p, Vec2 q, int net, LayerId layer, Coord width) const;

 private:
  const Board& b_;
  SpatialIndex idx_;
};

struct WireChain {
  std::vector<int> tracks;  // the tracks of the wire, the short ones glued inside it too
  Polyline path;            // from end to end, arcs in points; from the track ends as they lie
  LayerId layer = 0;
  int net = kNoNet;
  Coord width = 0;
  bool closed = false;  // a loop: no end of its own
  Vec2 a() const { return path.front(); }
  Vec2 b() const { return path.back(); }
};

// The chosen tracks grown to whole chains of one net and layer, as a mask over the tracks; no geometry
// is touched.
std::vector<char> growChains(const Board& b, std::vector<char> chosen, double glue = kWireGlue);
void growChains(const Board& b, std::vector<char>& chosen, const WireGraph& g);

// The chains of the chosen tracks (grown already). Chains end at branch points and wherever a vertex
// touches a pad or via of its net: manual routes often enter a pad off-centre, and the taut path must
// still pass through that copper.
std::vector<WireChain> wireChains(const Board& b, const WireGraph& g, const std::vector<char>& chosen,
                                  const OwnCopper& copper);

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
