#pragma once
// Post-routing optimiser in the spirit of TopoR's "Выполнить подвижку" (F7): vias (and optionally
// components) are moved to where the wires attached to them become shorter and free of clearance
// conflicts; the attached wires are re-shaped (F5) after every trial move.
#include <atomic>
#include <functional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::topo {

struct OptimizeOptions {
  int iterations = 3;
  double step = 0.4 * kNmPerMm;  // first trial displacement; halved every iteration
  bool vias = true;
  bool junctions = true;    // also move the free branch points where wires of one net meet
  bool components = false;  // also move unlocked components (pads keep their relative layout)
  std::vector<int> nets;    // only vias of these nets (and no components); empty: everything unlocked
  std::function<void(int done, int total, const std::string& stage)> progress;
  const std::atomic<bool>* cancel = nullptr;
};

struct OptimizeResult {
  int viaMoves = 0;
  int junctionMoves = 0;
  int componentMoves = 0;
  int conflictsBefore = 0, conflictsAfter = 0;  // clearance/short/edge violations
  double lengthBefore = 0, lengthAfter = 0;     // nm
  double seconds = 0;
  std::vector<std::string> log;
};

OptimizeResult optimize(Board& b, const OptimizeOptions& opt = {});

// F5's second half: every free branch point (three or more tracks of one net and layer meeting at no
// pad or via) slides towards the point that makes the wires from it shortest (the geometric median of
// their first vertices), the wires are re-shaped around the copper as it lies, and the move stays
// when it leaves the neighbourhood no worse. Returns the number of junctions moved.
int settleJunctions(Board& b, const std::vector<int>& nets = {}, int rounds = 3);

}  // namespace xr::topo
