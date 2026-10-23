#pragma once
// Topological autorouter (TopoR-style): routes are first found as homotopy classes in a
// constrained Delaunay triangulation of the obstacles (which edges they cross, in which order),
// then realised geometrically as taut "rubber band" paths made of tangent segments and arcs.
#include <atomic>
#include <functional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::topo {

struct RouterOptions {
  int maxPasses = 6;                 // rip-up & reroute iterations
  double viaCost = 3.0;              // in mm of equivalent track length
  bool useVias = true;
  bool ripupExisting = true;         // remove unlocked routing before routing
  bool softPlanarity = false;        // early passes may cross other nets' routes at a growing cost
  int optimizeIterations = 2;        // final via optimisation (TopoR F7), 0 = off
  bool fillZones = true;             // pour the zones again when done (they are cleared for routing)
  std::vector<std::string> nets;     // empty = all nets
  std::vector<int> copperIndices;    // allowed copper layers by index (empty = all)
  double viaPitch = 0;               // via candidate grid pitch (nm), 0 = auto
  std::function<void(int done, int total, const std::string& stage)> progress;
  const std::atomic<bool>* cancel = nullptr;
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
