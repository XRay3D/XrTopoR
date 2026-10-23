#pragma once
// Geometric realisation of topological routes: each wire's planar "sketch" polyline is pulled
// taut around the obstacles of other nets (funnel algorithm in a constrained Delaunay
// triangulation of obstacle points), then thickened into tangent segments + arcs whose
// radii nest wires that wrap the same obstacle.
#include <vector>

#include "core/Board.h"

namespace xr::topo {

// Safety margin (nm) the realiser adds to every wire's clearance so that arc tessellation and
// integer rounding never eat into the rule; the router reserves the same amount per wire.
constexpr double kRealizeMargin = 2000;

struct RealWire {
  int net = kNoNet;
  LayerId layer = 0;
  Coord width = 0;
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
  int droppedApexes = 0;
  std::vector<int> trackWire;  // wire index of every track appended, in order
};

struct RealizeOptions {
  // Existing board tracks of other nets act as obstacles (manual re-shaping of a few wires);
  // the autorouter realises all wires at once and leaves this off.
  bool tracksAsObstacles = false;
};

// TopoR "F5": the chosen tracks (chains of one net/layer between pads, vias or branch points)
// become sketches, are removed from the board and realised again with all other copper as
// obstacles. Returns the sketches used (for diagnostics) through `wires` when given.
RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, std::vector<RealWire>* wires = nullptr);

// Appends tracks for the wires and vias to the board.
RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                     const RealizeOptions& opt = {});

}  // namespace xr::topo
