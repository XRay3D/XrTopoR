#pragma once
// TopoR's high-speed rules («High-speed правила»: HiSpeedRules of the .fst) and the objects of the board they
// make: impedances with the widths (and, for a differential pair, the gap) per layer, signal clusters and
// signals, differential signals (the pairs), signal groups, the delay rules, the settings of the signal
// search; the serpents («змейки») and the zipped pairs of wires («застёгнутые пары проводников»). The rules
// are kept as the file has them and written back; the pairs are what the board and the model work with.
#include <string>
#include <string_view>
#include <utility>
#include <vector>

#include "geom/Geometry.h"

namespace xr {

struct Track;
using LayerId = int;        // (Board.h takes these from here)
constexpr int kNoNet = -1;

struct ImpedanceLayerRule {
  std::string layer;  // the layer's name, as the file names it
  Coord width = 0;
  Coord gap = 0;      // a differential pair only: between the two conductors
};

// «Волновое сопротивление»: a named set of widths per layer (and gaps for a pair).
struct Impedance {
  std::string name;
  double z0 = 0;  // Ohm, informative
  bool diff = false;
  std::vector<ImpedanceLayerRule> rules;
  const ImpedanceLayerRule* on(std::string_view layer) const {
    for (const ImpedanceLayerRule& r : rules)
      if (r.layer == layer) return &r;
    return nullptr;
  }
};

struct PinRef {
  std::string comp, pin;
};

// A signal: from the cluster's source pin to this receiver, through passive components.
struct Signal {
  std::string name;
  PinRef receiver;
  std::vector<std::string> components;
};

struct SignalCluster {
  std::string impedance;
  PinRef source;
  std::vector<std::string> nets;
  std::vector<std::pair<PinRef, PinRef>> pinPairs;
  std::vector<Signal> signalList;  // ("signals" is a Qt macro)
};

// «Дифференциальный сигнал»: a pair of signals, the first positive.
struct DiffSignal {
  std::string name;
  Coord mismatch = 0;  // the allowed difference of the two conductors' lengths
  std::string impedance;
  std::string signalA, signalB;
};

struct ObjectSignal {
  enum class Kind { Signal, DiffSignal, SignalGroup } kind = Kind::Signal;
  std::string name;
};

struct SignalGroup {
  std::string name;
  std::vector<ObjectSignal> members;
};

// RulesDelay: DelayEqual (the group's signals equal within the tolerance), DelayConstant (the objects' delay
// a constant within the tolerances), DelayRelation (the difference of left and right). Values as the file has
// them: a time in ps or a length in the file's units.
struct DelayRule {
  enum class Kind { Equal, Constant, Relation } kind = Kind::Equal;
  bool enabled = true;
  bool time = false;  // valueType Time (else Dist)
  double constant = 0, tolerance = 0, toleranceUnder = 0, toleranceOver = 0;
  std::vector<ObjectSignal> objects, left, right;  // Equal and Constant: objects; Relation: left and right
};

struct DiffNamesRule {
  bool enabled = true;
  std::string pos, neg;
};

struct SignalSearch {
  bool present = false;
  int maxNetsInCluster = 5;
  bool createPinPairs = true;
  std::vector<DiffNamesRule> names;
  int minPinsNumber = 20;
  std::vector<std::string> excludedNets;
};

struct HiSpeed {
  std::vector<Impedance> impedances;
  std::vector<SignalCluster> clusters;
  std::vector<DiffSignal> diffSignals;
  std::vector<SignalGroup> groups;
  std::vector<DelayRule> delays;
  SignalSearch search;
  bool empty() const { return impedances.empty() && clusters.empty() && diffSignals.empty() && groups.empty() && delays.empty() && !search.present; }
  const Impedance* impedance(std::string_view name) const;
  const SignalCluster* clusterOf(std::string_view signal) const;
  // The nets of a signal, a differential signal or a group (groups recursively).
  std::vector<std::string> netsOf(const ObjectSignal& o) const;
  int diffSignal(std::string_view name) const;
};

// «Змейка»: kept as the file has it, its tracks locked.
struct Serpent {
  std::string id;
  double length = 0, gap = 0, h1 = 0, h2 = 0, h3 = 0, h4 = 0;
};

// «Застёгнутая пара проводников»: the axis of a zipped section of a differential pair on a layer; the two
// conductors (Track::zip naming this) lie at offset() either side of it. pSide: on which side of the axis
// the positive net's conductor runs, +1 left of the travel from the first piece's start, -1 right.
struct ZippedWire {
  bool fixed = false;
  LayerId layer = 0;
  int pair = -1;  // into HiSpeed::diffSignals
  int netP = kNoNet, netN = kNoNet;
  int pSide = 0;
  std::vector<Track> axis;  // width 2w + gap, net kNoNet; Track::serp names a serpent on the piece
  Coord condWidth = 0;  // each conductor
  Coord gap = 0;
  Coord width() const { return 2 * condWidth + gap; }
  Coord offset() const { return (condWidth + gap) / 2; }
};

}  // namespace xr
