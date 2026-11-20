#include <gtest/gtest.h>

#include "core/Signals.h"
#include "io/BoardIO.h"

using namespace xr;
namespace sg = xr::signals;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// A board to put components on: pins of nets at points, by millimetres.
struct Circuit {
  Board b;
  Circuit() {
    b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  // A component with its pins (number, net, x, y).
  void comp(const std::string& ref, std::initializer_list<std::tuple<const char*, const char*, double, double>> pins) {
    Component c;
    c.ref = ref;
    const int ci = int(b.components.size());
    for (auto& [number, net, x, y] : pins) {
      Pad p;
      p.number = number;
      p.component = ci;
      p.net = *net ? b.addNet(net) : kNoNet;
      p.pos = {mmToNm(x), mmToNm(y)};
      p.shape.kind = PadShapeKind::Circle;
      p.shape.w = p.shape.h = mmToNm(0.5);
      p.copper = b.allCopperMask();
      c.pads.push_back(int(b.pads.size()));
      b.pads.push_back(p);
    }
    b.components.push_back(std::move(c));
  }
  int pad(const std::string& ref, const std::string& pin) const { return *sg::padOf(b, {ref, pin}); }
};

// The help's example: D1 drives MEM_MA[0] to the resistor R1, which drives MEM$MA[0] to DD1 and DD2.
Circuit helpExample() {
  Circuit c;
  c.comp("D1", {{"A10", "MEM_MA[0]", 0, 0}, {"A11", "MEM_MA[1]", 0, 1}, {"A12", "GND", 0, 2}});
  c.comp("R1", {{"1", "MEM_MA[0]", 10, 0}, {"2", "MEM$MA[0]", 12, 0}});
  c.comp("DD1", {{"H8", "MEM$MA[0]", 20, -5}, {"H9", "GND", 20, -4}, {"H10", "X", 20, -3}});
  c.comp("DD2", {{"H8", "MEM$MA[0]", 30, 5}, {"H9", "GND", 30, 6}, {"H10", "Y", 30, 7}});
  return c;
}

using Pair = std::pair<PinRef, PinRef>;

}  // namespace

// The cluster of D1-A10: both nets, through the resistor; a signal per receiver, named after the source's net and
// the receiver's component, the nearer first; the links from the source to each receiver, net by net — as the
// help's «Создание сигналов» shows it.
TEST(Signals, ClusterGoesThroughPassives) {
  Circuit c = helpExample();
  EXPECT_TRUE(sg::isPassive(c.b, 1));
  EXPECT_FALSE(sg::isPassive(c.b, 0));
  auto r = sg::buildCluster(c.b, {}, c.pad("D1", "A10"), sg::defaultSearch());
  ASSERT_TRUE(r.cluster) << r.error;
  const SignalCluster& k = *r.cluster;
  EXPECT_EQ(k.source, (PinRef{"D1", "A10"}));
  EXPECT_EQ(k.nets, (std::vector<std::string>{"MEM_MA[0]", "MEM$MA[0]"}));
  ASSERT_EQ(k.signalList.size(), 2u);
  EXPECT_EQ(k.signalList[0].name, "MEM_MA[0]_DD1");
  EXPECT_EQ(k.signalList[0].receiver, (PinRef{"DD1", "H8"}));
  EXPECT_EQ(k.signalList[1].name, "MEM_MA[0]_DD2");
  EXPECT_EQ(k.signalList[0].components, (std::vector<std::string>{"D1", "R1", "DD1"}));
  EXPECT_EQ(k.pinPairs, (std::vector<Pair>{{{"D1", "A10"}, {"R1", "1"}}, {{"R1", "2"}, {"DD1", "H8"}}, {{"R1", "2"}, {"DD2", "H8"}}}));
  EXPECT_EQ(sg::linksOfNet(c.b, k, "MEM$MA[0]").size(), 2u);
  EXPECT_FALSE(sg::linksHaveCycle(c.b, k, "MEM$MA[0]"));
  // Without the links set automatically: none.
  SignalSearch s = sg::defaultSearch();
  s.createPinPairs = false;
  EXPECT_TRUE(sg::buildCluster(c.b, {}, c.pad("D1", "A10"), s).cluster->pinPairs.empty());
}

// The power nets (excluded from the search) and the nets of other clusters stay out; a source on such a net
// makes no cluster.
TEST(Signals, ClusterLeavesOutPowerAndOtherClusters) {
  Circuit c = helpExample();
  c.comp("C1", {{"1", "MEM$MA[0]", 15, 0}, {"2", "GND", 15, 1}});  // a capacitor to the ground
  c.comp("C2", {{"1", "MEM_MA[1]", 16, 0}, {"2", "GND", 16, 1}});
  SignalSearch s = sg::defaultSearch();
  auto r = sg::buildCluster(c.b, {}, c.pad("D1", "A10"), s);
  EXPECT_TRUE(r::contains(r.cluster->nets, std::string("GND")));
  s.excludedNets = sg::autoExcludedNets(c.b, 5);  // GND has 5 pins, the others 4 at most
  EXPECT_EQ(s.excludedNets, std::vector<std::string>{"GND"});
  r = sg::buildCluster(c.b, {}, c.pad("D1", "A10"), s);
  EXPECT_EQ(r.cluster->nets.size(), 2u);
  EXPECT_FALSE(sg::buildCluster(c.b, {}, c.pad("D1", "A12"), s).cluster);  // on GND
  HiSpeed h;
  sg::addCluster(h, *r.cluster);
  auto again = sg::buildCluster(c.b, h, c.pad("R1", "2"), s);
  EXPECT_FALSE(again.cluster);
  EXPECT_NE(again.error.find("MEM_MA[0]_DD1"), std::string::npos) << again.error;
}

// Over the limit of nets the net just added and the one it came from go — not the source's.
TEST(Signals, ClusterNetLimitDropsTheLastTwo) {
  Circuit c;
  c.comp("U1", {{"1", "N0", 0, 0}, {"2", "Z", 0, 1}, {"3", "Z2", 0, 2}});
  c.comp("R1", {{"1", "N0", 1, 0}, {"2", "N1", 2, 0}});
  c.comp("R2", {{"1", "N1", 3, 0}, {"2", "N2", 4, 0}});
  c.comp("R3", {{"1", "N2", 5, 0}, {"2", "N3", 6, 0}});
  c.comp("U2", {{"1", "N3", 7, 0}, {"2", "N1", 7, 1}, {"3", "Z3", 7, 2}});
  SignalSearch s = sg::defaultSearch();
  s.maxNetsInCluster = 3;
  auto r = sg::buildCluster(c.b, {}, c.pad("U1", "1"), s);
  ASSERT_TRUE(r.cluster);
  EXPECT_EQ(r.cluster->nets, (std::vector<std::string>{"N0", "N1"}));  // N3 over the limit: N3 and N2 go
  s.maxNetsInCluster = 5;
  EXPECT_EQ(sg::buildCluster(c.b, {}, c.pad("U1", "1"), s).cluster->nets.size(), 4u);
}

// A component with several pins on the cluster gives one receiver: the nearest to the source.
TEST(Signals, ReceiverPerComponentIsTheNearest) {
  Circuit c;
  c.comp("U1", {{"1", "N", 0, 0}, {"2", "A", 0, 1}, {"3", "B", 0, 2}});
  c.comp("U2", {{"1", "N", 9, 0}, {"2", "N", 5, 0}, {"3", "C", 9, 2}});
  auto r = sg::buildCluster(c.b, {}, c.pad("U1", "1"), sg::defaultSearch());
  ASSERT_EQ(r.cluster->signalList.size(), 1u);
  EXPECT_EQ(r.cluster->signalList[0].receiver, (PinRef{"U2", "2"}));
  EXPECT_EQ(r.cluster->signalList[0].name, "N_U2");
}

// The nets of a cluster are edited: a net joined through any component is added, the source's and a net that
// alone links another are not removed.
TEST(Signals, ClusterNetsAreEdited) {
  Circuit c = helpExample();
  c.comp("U9", {{"1", "MEM$MA[0]", 40, 0}, {"2", "EXTRA", 41, 0}, {"3", "Q", 42, 0}});
  c.comp("U8", {{"1", "EXTRA", 50, 0}, {"2", "Q2", 51, 0}, {"3", "Q3", 52, 0}});
  const SignalSearch s = sg::defaultSearch();
  SignalCluster k = *sg::buildCluster(c.b, {}, c.pad("D1", "A10"), s).cluster;
  EXPECT_EQ(k.signalList.size(), 3u);  // DD1, DD2, U9
  c.comp("U7", {{"1", "LOOSE", 60, 0}, {"2", "LOOSE2", 61, 0}, {"3", "LOOSE3", 62, 0}});
  EXPECT_NE(sg::addNet(c.b, {}, k, "LOOSE", s), "");  // not joined
  EXPECT_EQ(sg::addNet(c.b, {}, k, "EXTRA", s), "");
  EXPECT_EQ(k.nets.size(), 3u);
  EXPECT_TRUE(r::contains(k.signalList, PinRef{"U8", "1"}, &Signal::receiver));  // a receiver on it
  EXPECT_NE(sg::removeNet(c.b, k, "MEM_MA[0]"), "");
  EXPECT_NE(sg::removeNet(c.b, k, "MEM$MA[0]"), "");  // the only link to EXTRA
  EXPECT_EQ(sg::removeNet(c.b, k, "EXTRA"), "");
  EXPECT_EQ(k.nets.size(), 2u);
}

// Buses: signals of the same components whose source nets differ by an index; TopoR names the groups
// «SignalNet», «SignalNet_1».
TEST(Signals, BusesAreFoundByIndex) {
  Circuit c;
  c.comp("U1", {{"1", "D[0]", 0, 0}, {"2", "D[1]", 0, 1}, {"3", "D[2]", 0, 2}, {"4", "CLK", 0, 3}, {"5", "A1", 0, 4}, {"6", "A2", 0, 5}});
  c.comp("U2", {{"1", "D[0]", 9, 0}, {"2", "D[1]", 9, 1}, {"3", "D[2]", 9, 2}, {"4", "CLK", 9, 3}, {"5", "A1", 9, 4}, {"6", "A2", 9, 5}});
  HiSpeed h;
  for (const char* p : {"1", "2", "3", "4", "5", "6"}) sg::addCluster(h, *sg::buildCluster(c.b, h, c.pad("U1", p), sg::defaultSearch()).cluster);
  auto buses = sg::findBuses(h);
  ASSERT_EQ(buses.size(), 2u);
  EXPECT_EQ(buses[0].name, "SignalNet");
  EXPECT_EQ(buses[0].signals, (std::vector<std::string>{"D[0]_U2", "D[1]_U2", "D[2]_U2"}));
  EXPECT_EQ(buses[1].name, "SignalNet_1");
  EXPECT_EQ(buses[1].signals.size(), 2u);
  EXPECT_EQ(sg::addBusGroup(h, buses[0]), "SignalNet");
  // The grouped ones are not looked at again.
  auto rest = sg::findBuses(h);
  ASSERT_EQ(rest.size(), 1u);
  EXPECT_EQ(rest[0].name, "SignalNet_1");
}

// The naming rules of a pair's nets: the two substrings at one place.
TEST(Signals, DiffPairsFollowTheNamingRules) {
  const DiffNamesRule pn{true, "p", "n"};
  EXPECT_TRUE(sg::diffNamesMatch("NetCLKp", "NetCLKn", pn));
  EXPECT_TRUE(sg::diffNamesMatch("Net_pCLK", "Net_nCLK", pn));
  EXPECT_FALSE(sg::diffNamesMatch("pNetCLK", "NetCLKn", pn));
  const DiffNamesRule hash{true, "", "#"};
  EXPECT_TRUE(sg::diffNamesMatch("MEM_CLK", "MEM_CLK#", hash));
  EXPECT_TRUE(sg::diffNamesMatch("SDCLK", "SDCLK_B", {true, "", "_B"}));
  bool swapped = false;
  EXPECT_EQ(sg::diffRuleOf("SDCLK_B", "SDCLK", sg::defaultDiffNames(), &swapped), 5);
  EXPECT_TRUE(swapped);
  auto rules = sg::defaultDiffNames();
  rules[5].enabled = false;
  EXPECT_FALSE(sg::diffRuleOf("SDCLK_B", "SDCLK", rules));
  // Found among the signals: the same components, the nets by the rules; named after the positive one.
  Circuit c;
  c.comp("U1", {{"1", "CLK", 0, 0}, {"2", "CLK#", 0, 1}, {"3", "DAT", 0, 2}});
  c.comp("U2", {{"1", "CLK", 9, 0}, {"2", "CLK#", 9, 1}, {"3", "DAT", 9, 2}});
  HiSpeed h;
  for (const char* p : {"2", "1", "3"}) sg::addCluster(h, *sg::buildCluster(c.b, h, c.pad("U1", p), sg::defaultSearch()).cluster);
  auto pairs = sg::findDiffPairs(c.b, h, sg::defaultSearch());
  ASSERT_EQ(pairs.size(), 1u);
  EXPECT_EQ(pairs[0].positive, "CLK_U2");
  EXPECT_EQ(pairs[0].negative, "CLK#_U2");
  EXPECT_EQ(pairs[0].name, "CLK_U2_1");  // the positive signal has the name already
}

// «Объединить в дифф. сигнал» and «Разделить»: the pair takes its signals' places in the groups, and gives them
// back.
TEST(Signals, JoinAndSplitDiff) {
  Circuit c;
  c.comp("U1", {{"1", "CLKp", 0, 0}, {"2", "CLKn", 0, 1}, {"3", "DAT", 0, 2}});
  c.comp("U2", {{"1", "CLKp", 9, 0}, {"2", "CLKn", 9, 1}, {"3", "DAT", 9, 2}});
  HiSpeed h;
  for (const char* p : {"1", "2", "3"}) sg::addCluster(h, *sg::buildCluster(c.b, h, c.pad("U1", p), sg::defaultSearch()).cluster);
  h.impedances.push_back({"Z", 50, false, {}});
  h.impedances.push_back({"ZD", 100, true, {}});
  h.groups.push_back({"G", {{ObjectSignal::Kind::Signal, "CLKn_U2"}, {ObjectSignal::Kind::Signal, "DAT_U2"}}});
  EXPECT_NE(sg::canJoinDiff(c.b, h, "CLKp_U2", "CLKp_U2"), "");
  const int d = sg::joinDiff(c.b, h, "CLKn_U2", "CLKp_U2");
  ASSERT_EQ(d, 0);
  EXPECT_EQ(h.diffSignals[0].signalA, "CLKp_U2");  // the positive one by the rules
  EXPECT_EQ(h.diffSignals[0].name, "CLKp_U2_1");
  EXPECT_EQ(h.diffSignals[0].impedance, "ZD");
  EXPECT_TRUE(r::contains(h.groups[0].members, ObjectSignal{ObjectSignal::Kind::DiffSignal, "CLKp_U2_1"}));
  EXPECT_FALSE(r::contains(h.groups[0].members, ObjectSignal{ObjectSignal::Kind::Signal, "CLKn_U2"}));
  EXPECT_NE(sg::canJoinDiff(c.b, h, "CLKp_U2", "DAT_U2"), "");  // in a pair already
  EXPECT_EQ(sg::listedObjects(h).size(), 2u);                  // DAT and the pair
  sg::splitDiff(h, nullptr, "CLKp_U2_1");
  EXPECT_TRUE(h.diffSignals.empty());
  EXPECT_TRUE(r::contains(h.groups[0].members, ObjectSignal{ObjectSignal::Kind::Signal, "CLKn_U2"}));
  EXPECT_TRUE(r::contains(h.groups[0].members, ObjectSignal{ObjectSignal::Kind::Signal, "CLKp_U2"}));
  EXPECT_EQ(sg::listedObjects(h).size(), 3u);
}

// «Удалить»: what referred to the objects goes too; a pair goes with its signals, a cluster with its last signal.
TEST(Signals, RemoveCleansReferences) {
  auto r = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  HiSpeed h = b.hispeed;
  DesignRules rules = *b.rules;
  rules.widths.push_back({true, {}, {RuleNets::Kind::DiffSignal, "SDCLK_U2"}, mmToNm(0.1), mmToNm(0.1)});
  const size_t clusters = h.clusters.size(), widths = rules.widths.size(), delays = h.delays.size();
  sg::removeObjects(h, &rules, {{ObjectSignal::Kind::DiffSignal, "SDCLK_U2"}});
  EXPECT_TRUE(h.diffSignals.empty());
  EXPECT_EQ(h.clusters.size(), clusters - 2);
  EXPECT_EQ(rules.widths.size(), widths - 1);
  EXPECT_LT(h.delays.size(), delays);  // the rules against the clock had nothing on their right
  sg::removeObjects(h, &rules, {{ObjectSignal::Kind::Signal, "A0"}});
  for (auto& g : h.groups) EXPECT_FALSE(r::contains(g.members, ObjectSignal{ObjectSignal::Kind::Signal, "A0"})) << g.name;
}

// A rename goes into the groups, the delays and the design's rules.
TEST(Signals, RenameFollowsIntoRules) {
  auto r = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  HiSpeed h = b.hispeed;
  DesignRules rules = *b.rules;
  rules.vias.push_back({true, {RuleNets::Kind::SignalGroup, "ADD_DDR"}, ""});
  EXPECT_NE(sg::renameObject(h, &rules, {ObjectSignal::Kind::Signal, "A0"}, "A1"), "");
  EXPECT_EQ(sg::renameObject(h, &rules, {ObjectSignal::Kind::Signal, "A0"}, "ADDR0"), "");
  EXPECT_TRUE(h.clusterOf("ADDR0"));
  EXPECT_TRUE(r::contains(h.groups[0].members, ObjectSignal{ObjectSignal::Kind::Signal, "ADDR0"}) ||
              r::any_of(h.groups, [](const SignalGroup& g) { return r::contains(g.members, ObjectSignal{ObjectSignal::Kind::Signal, "ADDR0"}); }));
  EXPECT_EQ(sg::renameObject(h, &rules, {ObjectSignal::Kind::SignalGroup, "ADD_DDR"}, "ADDRESS"), "");
  EXPECT_EQ(rules.vias.back().nets.name, "ADDRESS");
  EXPECT_TRUE(r::any_of(h.delays, [](const DelayRule& d) { return r::contains(d.objects, ObjectSignal{ObjectSignal::Kind::SignalGroup, "ADDRESS"}); }));
  EXPECT_EQ(sg::renameObject(h, &rules, {ObjectSignal::Kind::DiffSignal, "SDCLK_U2"}, "CLOCK"), "");
  EXPECT_TRUE(r::any_of(h.delays, [](const DelayRule& d) { return r::contains(d.right, ObjectSignal{ObjectSignal::Kind::DiffSignal, "CLOCK"}); }));
}

// TopoR's example: the pair SDCLK / SDCLK_B, split, is found again by the naming rules under the name it had;
// the buses of its signals, out of their groups, are the address, data... ones.
TEST(Signals, Example06) {
  auto r = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  HiSpeed h = b.hispeed;
  EXPECT_EQ(sg::listedObjects(h).size(), 40u);
  EXPECT_EQ(r::count_if(sg::listedObjects(h), [&](const ObjectSignal& o) { return !sg::grouped(h, o); }), 1);
  EXPECT_TRUE(sg::findDiffPairs(b, h, sg::searchOf(h)).empty());
  sg::splitDiff(h, nullptr, "SDCLK_U2");
  auto pairs = sg::findDiffPairs(b, h, sg::searchOf(h));
  ASSERT_EQ(pairs.size(), 1u);
  EXPECT_EQ(pairs[0].positive, "SDCLK");
  EXPECT_EQ(pairs[0].negative, "SDCLK_B");
  EXPECT_EQ(pairs[0].name, "SDCLK_U2");
  h.groups.clear();
  auto buses = sg::findBuses(h);
  std::vector<size_t> sizes;
  for (auto& bus : buses) sizes.push_back(bus.signals.size());
  r::sort(sizes);
  // A0..A12 but A10 (MA10), SD0..SD15, DQM0/1, DQS0/1, SDBA0/1.
  EXPECT_EQ(sizes, (std::vector<size_t>{2, 2, 2, 12, 16}));
}
