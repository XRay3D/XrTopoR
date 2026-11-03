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
  // TopoR's way (hand/f6_refine.cpp): first the vias too close to pads and vias are pushed off them,
  // alone; then vias and branch points relax under two forces — towards the point where the wire
  // through them runs straight, and away from the edges whose wires do not fit — in shrinking steps
  // (tolerance 1 mm · 0.8^k down to 10 µm, a per-object step scale that grows while the force keeps its
  // direction and shrinks when it turns), all wires re-laid after every iteration. A step next to what
  // that breaks (an added violation, a lost connection) stays out and the rest are tried again, so
  // one bad step does not cost the iteration. After F5, conflicts / shortfall in mm / length, against
  // the trial-move search: Arcs_master 2 / 0.021 / 6344.7 against 13 / 1.345 / 6346.8 (TopoR's F7:
  // 3 / 0.040 / 6277.5), arz 7 / 0.141 / 9643 against 9 / 0.062 / 9712, arz_2L 6 against 9, arz_4L 10
  // both. Off by default: inside the router's run it costs a connection on tt and adg508f.
  bool relax = false;
  double relaxTol = 1.0 * kNmPerMm;    // first step limit
  double relaxFloor = 0.01 * kNmPerMm;  // the loop ends below this
  // Every re-lay after a move takes the chains of the other nets' wires this close along: a chain
  // laid alone against fixed neighbours loses its nesting with them (0: the moved chains only).
  double relayAround = 0;  // (measured worse: see Realizer.h on `around`)
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
  int relaxIterations = 0;
  int conflictsBefore = 0, conflictsAfter = 0;  // clearance/short/edge violations
  double lengthBefore = 0, lengthAfter = 0;     // nm
  double seconds = 0;
  std::vector<std::string> log;
};

OptimizeResult optimize(Board& b, const OptimizeOptions& opt = {});

// F5's second half: every free branch point (three or more tracks of one net and layer meeting at no
// pad or via) slides towards the point that makes the wires from it shortest (the geometric median of
// their first vertices), the wires are re-shaped around the copper as it lies, and the move stays
// when it leaves the neighbourhood no worse. On the whole board (`nets` empty) the moves are then checked
// by re-laying it: the junctions next to a violation that adds stay put, and the board comes back re-laid,
// so that the next F5 leaves it as it is. Returns the number of junctions moved.
int settleJunctions(Board& b, const std::vector<int>& nets = {}, int rounds = 3);

}  // namespace xr::topo
