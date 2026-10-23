#pragma once
// Geometric realisation of topological routes: each wire's planar "sketch" polyline is pulled
// taut around the obstacles of other nets (funnel algorithm in a constrained Delaunay
// triangulation of obstacle points), then thickened into tangent segments + arcs whose
// radii nest wires that wrap the same obstacle.
#include <vector>

#include "core/Board.h"

namespace xr::topo {

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

// Appends tracks for the wires and vias to the board.
RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias);

}  // namespace xr::topo
