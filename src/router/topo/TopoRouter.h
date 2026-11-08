#pragma once
// Topological autorouter (TopoR-style): routes are first found as homotopy classes in a
// constrained Delaunay triangulation of the obstacles (which edges they cross, in which order),
// then realised geometrically as taut "rubber band" paths made of tangent segments and arcs.
#include <atomic>
#include <functional>
#include <memory>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::topo {

// What the router has laid so far, for showing the process (TopoR's «Показывать процесс трассировки»): while the
// paths are searched the wires as sketches, straight through the places where they cross the mesh's edges, and the
// vias; once realised the tracks; with the wires kept on the board, and the copper areas (unpoured till the end).
struct RouteSketch {
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  std::string stage;
};

struct RouterOptions {
  int maxPasses = 6;                 // rip-up & reroute iterations
  double viaCost = 3.0;              // in mm of equivalent track length
  bool useVias = true;
  bool ripupExisting = true;         // remove unlocked routing before routing
  bool softPlanarity = false;        // early passes may cross other nets' routes at a growing cost
  int optimizeIterations = 2;        // final via optimisation (TopoR F7), 0 = off
  bool refine = true;                // final F6: wires in violation re-laid around the copper as it lies
  bool fillZones = true;             // pour the zones again when done (they are cleared for routing)
  bool buses = false;                // buses found (Buses.h) are laid first, each on one layer
  std::vector<std::string> nets;     // empty = all nets
  std::vector<int> copperIndices;    // allowed copper layers by index (empty = all)
  double viaPitch = 0;               // via candidate grid pitch (nm), 0 = auto
  std::function<void(int done, int total, const std::string& stage)> progress;
  const std::atomic<bool>* cancel = nullptr;
  // Called with what is laid at most every `sketchInterval` seconds while the paths are searched, and after every
  // realisation; from the routing thread.
  std::function<void(std::shared_ptr<const RouteSketch>)> sketch;
  double sketchInterval = 0.25;
};

struct RouterResult {
  int connections = 0;
  int routed = 0;
  int failed = 0;
  int vias = 0;
  double length = 0;  // nm
  double seconds = 0;
  bool cancelled = false;
  std::vector<std::string> log;
};

RouterResult routeBoard(Board& b, const RouterOptions& opt = {});

}  // namespace xr::topo
