#pragma once
// The making and editing of signals (HiSpeed; the namespace is `sig`: «signals» is a Qt keyword) as TopoR's «High-speed правила > Сигналы» does it.
//
// A signal cluster («сигнальный кластер») is the part of the circuit a signal goes through: the source pin's net
// and the nets joined to it through passive components, but not the nets excluded from the search (the power
// nets), the nets of other clusters, nor the opposite net of a differential pair (by the naming rules); no more
// nets than the search allows — over that, the net just added and the one it was reached from go (never the
// source's). Its receivers are the pins of the active components on its nets, but the source's component, one
// per component — the nearest to the source; a signal is made for each, named after the source's net and the
// receiver's component («MEM_MA[0]_DD2»). With «Автоматически задавать связи» the links of the nets
// (SignalCluster::pinPairs) join the source to every receiver, net by net.
//
// A passive component is a two-terminal one (TopoR: or a two-pin gate with equivalent pins — the design keeps
// no gates, so resistor arrays are not seen as passive).
//
// The search of buses: signals whose sources and receivers are on the same components and whose source nets'
// names differ only by an index (digits, perhaps in () or []); TopoR names the groups it makes of them
// «SignalNet», «SignalNet_1»... The search of differential pairs: two signals of the same components, as many
// nets each, whose nets' names differ by the substrings of a naming rule at one place.
#include <optional>
#include <string>
#include <string_view>
#include <vector>

#include "core/Board.h"

namespace xr::sig {

// TopoR's naming rules of a pair's nets, highest priority first: «» / «#», «+» / «-», «P» / «N», «p» / «n», «H» /
// «L», «» / «_B».
std::vector<DiffNamesRule> defaultDiffNames();
// The settings of the search a design without its own has (SignalSearch::present false).
SignalSearch defaultSearch();
// The settings in force: the design's, or the defaults (the naming rules too, when the design has none).
SignalSearch searchOf(const HiSpeed& h);

bool isPassive(const Board& b, int comp);
// «Автозаполнение» of the nets excluded from the search: those with at least `minPins` pins, and those of the
// reference layers.
std::vector<std::string> autoExcludedNets(const Board& b, int minPins);

// The two names differ only by the rule's substrings at one place (`pos` in the first, `neg` in the second).
bool diffNamesMatch(std::string_view pos, std::string_view neg, const DiffNamesRule& rule);
// The first enabled rule the two names follow, either way round; `swapped`: the second is the positive one.
std::optional<int> diffRuleOf(std::string_view a, std::string_view b, const std::vector<DiffNamesRule>& rules, bool* swapped = nullptr);

// A source pin's pad (nullopt: no such pin), and a pad's reference.
std::optional<int> padOf(const Board& b, const PinRef& p);
PinRef pinOf(const Board& b, int pad);

// The cluster of the source pin with its signals: what «Создание сигналов» shows first. The impedance is the
// first single-ended rule of the design. Fails (with the reason) when the pin has no net, or its net is excluded
// or in a signal already.
struct ClusterResult {
  std::optional<SignalCluster> cluster;
  std::string error;
};
ClusterResult buildCluster(const Board& b, const HiSpeed& h, int sourcePad, const SignalSearch& s);
// The cluster's signals made anew from its nets (after a net is added or removed): receivers, names, and the
// links when they are set automatically. A receiver that stays keeps its signal's name.
void refreshSignals(const Board& b, const HiSpeed& h, SignalCluster& c, const SignalSearch& s);
// A net joined to the cluster's through any component; not one excluded or in another cluster. The reason when
// not.
std::string addNet(const Board& b, const HiSpeed& h, SignalCluster& c, const std::string& net, const SignalSearch& s);
// Not the source's net, nor a net that alone joins the source's to another of the cluster.
std::string removeNet(const Board& b, SignalCluster& c, const std::string& net);
// The pins of a net (as «Заданные связи» offers them).
std::vector<PinRef> pinsOfNet(const Board& b, const std::string& net);
// The links of one net among the cluster's (pairs whose pins are on it), and a cycle among them (TopoR: «В цепи
// '…' имеется контур, необходимо исправить заданные связи»).
std::vector<int> linksOfNet(const Board& b, const SignalCluster& c, const std::string& net);
bool linksHaveCycle(const Board& b, const SignalCluster& c, const std::string& net);

// A name no signal nor differential signal has: `base`, else base_1, base_2...
std::string uniqueName(const HiSpeed& h, const std::string& base, const std::vector<std::string>& taken = {});
std::string uniqueGroupName(const HiSpeed& h, const std::string& base);

// The cluster is added: its signals named uniquely.
void addCluster(HiSpeed& h, SignalCluster c);

// The objects in no group of signals.
bool grouped(const HiSpeed& h, const ObjectSignal& o);
// The signals not in a differential signal, and the differential signals: the objects the page lists.
std::vector<ObjectSignal> listedObjects(const HiSpeed& h);

struct Bus {
  std::string name;
  std::vector<std::string> members;  // its signals («signals» is a Qt keyword)
};
// Buses among the signals `among` (the names of signals not in a differential signal; empty: those in no group).
std::vector<Bus> findBuses(const HiSpeed& h, std::vector<std::string> among = {});
// Makes a group of the bus's signals; its name.
std::string addBusGroup(HiSpeed& h, const Bus& bus);

struct DiffCandidate {
  std::string name, positive, negative;  // the name the pair would have; its two signals
};
std::vector<DiffCandidate> findDiffPairs(const Board& b, const HiSpeed& h, const SignalSearch& s, std::vector<std::string> among = {});

// «Объединить в дифф. сигнал» of two signals: of different clusters, as many nets each, alike links. The reason
// when they cannot.
std::string canJoinDiff(const Board& b, const HiSpeed& h, const std::string& a, const std::string& c);
// Joins them (the positive one by the naming rules, else `a`) under `name` (empty: made as the search names it);
// the new differential signal's index, or -1.
int joinDiff(const Board& b, HiSpeed& h, const std::string& a, const std::string& c, std::string name = {});
// «Разделить»: the differential signal goes, its two signals take its place in the groups and the rules of delays.
void splitDiff(HiSpeed& h, DesignRules* rules, const std::string& name);

// «Удалить»: a signal goes from its cluster (an empty cluster goes), a differential signal with its two signals,
// a group with its own place in the groups (its members stay). What referred to them goes too: their places in
// the groups, in the rules of delays, the design's rules naming them.
void removeObjects(HiSpeed& h, DesignRules* rules, const std::vector<ObjectSignal>& objects);
// A signal, differential signal or group renamed, with what refers to it; the reason when the name is taken.
std::string renameObject(HiSpeed& h, DesignRules* rules, const ObjectSignal& o, const std::string& name);

// The impedance rule of the object's cluster (a differential signal: its own), as «Свойства» shows it.
std::string impedanceOf(const HiSpeed& h, const ObjectSignal& o);
// Sets it: for a signal, its whole cluster's; for a differential signal, its own and that of every differential
// signal from the same source.
void setImpedance(HiSpeed& h, const ObjectSignal& o, const std::string& impedance);

}  // namespace xr::sig
