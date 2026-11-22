#pragma once
// The delays of the signals (HiSpeed) as the board is routed, and the check of the delay rules: «Выравнивание в
// группе» (DelayEqual), «Взаимное выравнивание» (DelayRelation), «Абсолютное значение» (DelayConstant) and the
// allowed difference of a differential signal's two conductors.
//
// A signal's way is the shortest one along the tracks of its cluster's nets from the source pin to the receiver,
// through the passive components the signal names (from pin to pin of one at no length). A serpent on a single
// wire counts as its pieces are drawn; a zipped pair's serpent is on its axis — a straight line there — and adds
// what the design says it adds to each conductor. The delay of a track is its length by the delay per length of its layer; a
// via adds nothing.
//
// The delays per length are TopoR's, measured on its own example of matched signals (Example_06/Signals.fst: of
// its 39 signals 35 fit one delay to 10 nm of length, and the clock pair stands 6.5 ps off them as its rule asks):
// an inner layer √4.3 / 0.3 ps/mm (FR-4, the light at 300 mm/ns), an outer one 0.93627 of that. The design holds
// no data of the stack they could be made from (the thicknesses and the dielectric are not kept).
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr {

inline constexpr double kDelayInnerPsPerMm = 6.912066;
inline constexpr double kDelayOuterPsPerMm = 0.93627 * kDelayInnerPsPerMm;
double delayPsPerMm(const Board& b, LayerId layer);

struct SignalDelay {
  std::string signal;
  bool routed = false;  // a way from the source to the receiver was found
  double length = 0;    // nm
  double ps = 0;
  int net = kNoNet;     // the first net of the signal's cluster
  Vec2 at;              // the receiver pad
};
// Of every signal of the design, in the clusters' order.
std::vector<SignalDelay> signalDelays(const Board& b);

struct DelayViolation {
  enum class Kind { Equal, Constant, Relation, Mismatch } kind = Kind::Equal;
  int rule = -1;               // into HiSpeed::delays; Mismatch: into HiSpeed::diffSignals
  std::string shorter, longer;  // the signals with the largest disagreement, the shorter first; Constant: one
  std::string netShorter, netLonger;
  bool time = true;            // the values are ps; else nm
  double value = 0;            // the difference found (Constant: the delay itself)
  double low = 0, high = 0;    // what is allowed for it
  Vec2 at;                     // the shorter signal's receiver
};
// The enabled rules that the board does not keep. A rule over a signal that is not routed is passed by (the
// unrouted connection is reported as such).
std::vector<DelayViolation> checkDelays(const Board& b);
std::vector<DelayViolation> checkDelays(const Board& b, const std::vector<SignalDelay>& delays);

}  // namespace xr
