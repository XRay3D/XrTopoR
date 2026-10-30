#pragma once
// Geometric realisation of topological routes: each wire's planar "sketch" polyline is pulled
// taut around the obstacles of other nets (funnel algorithm in a constrained Delaunay
// triangulation of obstacle points), then thickened into tangent segments + arcs whose
// radii nest wires that wrap the same obstacle.
#include <optional>
#include <vector>

#include "core/Board.h"
#include "router/topo/TopoMesh.h"

namespace xr::topo {

// Safety margin (nm) the realiser adds to every wire's clearance so that arc tessellation and
// integer rounding never eat into the rule; the router reserves the same amount per wire.
constexpr double kRealizeMargin = 2000;

struct RealWire {
  int net = kNoNet;
  LayerId layer = 0;
  Coord width = 0;     // nominal
  Coord widthMin = 0;  // TopoR's «подрезка»: the width used where the nominal one does not fit (0: none)
  Coord clearance = 0;
  Polyline sketch;  // start vertex, edge crossing points..., end vertex
};

struct RealVia {
  Vec2 pos;
  int net = kNoNet;
  Coord diameter = 0;
  Coord drill = 0;
};

struct RealizeStats {
  int wires = 0;
  int arcs = 0;
  int narrowed = 0;  // edge crossings realised at the minimum width
  int overflowEdges = 0;  // edges of the realiser's triangulation whose wires did not fit (violations)
  int droppedApexes = 0;
  int guardBends = 0;  // bends added by geometry around copper the taut path ran into
  std::vector<int> trackWire;  // wire index of every track appended, in order
};

struct RealizeOptions {
  // The router's mesh: the realiser then triangulates the very same points with the same constraints
  // (via sites and other layers' pads as transparent points), so that a wire crosses exactly the edges
  // the topology put it on and the slots on those edges hold what the capacity said they hold.
  const TopoMesh* mesh = nullptr;
  // Existing board tracks of other nets act as obstacles (manual re-shaping of a few wires);
  // the autorouter realises all wires at once and leaves this off.
  bool tracksAsObstacles = false;
  // Only obstacles intersecting this box are considered (local re-shaping); outline always is.
  std::optional<BBox> region;
  // Wire ends that lie on no pad or via (branch points of a manual routing): obstacles of their net
  // for everybody else, or the taut paths of other nets run straight through the junction.
  struct Anchor {
    Vec2 pos;
    LayerId layer;
    int net;
    double radius;
  };
  std::vector<Anchor> anchors;
};

// TopoR "F5": the chosen tracks (chains of one net/layer between pads, vias or branch points)
// become sketches, are removed from the board and realised again with all other copper as
// obstacles. Returns the sketches used (for diagnostics) through `wires` when given.
// `grown` receives the final choice (whole chains) as a mask over the tracks before the call;
// `local` limits the obstacles to the neighbourhood of the chosen chains (faster, same result).
RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, std::vector<RealWire>* wires = nullptr,
                           std::vector<char>* grown = nullptr, bool local = false);

// TopoR's «подрезка» by the copper as it lies: every track from `firstTrack` on that comes closer to
// other nets' copper than its clearance is narrowed to what fits, down to the minimum width of its
// net on its layer. Returns the number of tracks narrowed.
int narrowToFit(Board& b, size_t firstTrack);

// Appends tracks for the wires and vias to the board.
RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                     const RealizeOptions& opt = {});

}  // namespace xr::topo
