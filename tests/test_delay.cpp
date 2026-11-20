#include <gtest/gtest.h>

#include <algorithm>
#include <cmath>

#include "core/Delay.h"
#include "io/BoardIO.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// A board of two copper layers to put pins and wires on, by millimetres.
struct Bench {
  Board b;
  LayerId top, bottom;
  Bench() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  }
  // A one-pin component (or one more pin of it) of the net at the point.
  void pin(const char* ref, const char* number, const char* net, double x, double y) {
    int c = b.findComponent(ref);
    if (c < 0) {
      Component comp;
      comp.ref = ref;
      comp.pos = {mmToNm(x), mmToNm(y)};
      c = int(b.components.size());
      b.components.push_back(std::move(comp));
    }
    Pad p;
    p.number = number;
    p.component = c;
    p.pos = {mmToNm(x), mmToNm(y)};
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(0.6);
    p.copper = LayerMask(1) << top;
    p.net = b.addNet(net);
    b.components[size_t(c)].pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
  }
  void wire(const char* net, LayerId layer, std::initializer_list<std::pair<double, double>> pts) {
    const std::pair<double, double>* was = nullptr;
    for (auto& p : pts) {
      if (was) {
        Track t;
        t.a = {mmToNm(was->first), mmToNm(was->second)};
        t.b = {mmToNm(p.first), mmToNm(p.second)};
        t.width = mmToNm(0.2);
        t.layer = layer;
        t.net = b.addNet(net);
        b.tracks.push_back(t);
      }
      was = &p;
    }
  }
  // A signal of its own cluster: from the source pin to the receiver over the nets.
  void signal(const char* name, PinRef source, PinRef receiver, std::vector<std::string> nets, std::vector<std::string> components = {}) {
    SignalCluster c;
    c.source = source;
    c.nets = std::move(nets);
    c.signalList.push_back({name, receiver, std::move(components)});
    b.hispeed.clusters.push_back(std::move(c));
  }
  SignalDelay delay(const char* name) const {
    for (auto& d : signalDelays(b))
      if (d.signal == name) return d;
    return {};
  }
};

// Two signals from U1: S1 of 10 mm, S2 of 12 mm, on the top layer.
Bench twoSignals() {
  Bench x;
  x.pin("U1", "1", "A", 0, 0);
  x.pin("U2", "1", "A", 10, 0);
  x.wire("A", x.top, {{0, 0}, {10, 0}});
  x.pin("U1", "2", "B", 0, 5);
  x.pin("U2", "2", "B", 12, 5);
  x.wire("B", x.top, {{0, 5}, {12, 5}});
  x.signal("S1", {"U1", "1"}, {"U2", "1"}, {"A"});
  x.signal("S2", {"U1", "2"}, {"U2", "2"}, {"B"});
  return x;
}

}  // namespace

// A signal's length is the way from its source to its receiver: a branch aside is not of it; on another layer the
// delay per length is another.
TEST(Delay, SignalLengthIsThePathFromSourceToReceiver) {
  Bench x;
  x.pin("U1", "1", "A", 0, 0);
  x.pin("U2", "1", "A", 10, 0);
  x.pin("U3", "1", "A", 5, 8);
  x.wire("A", x.top, {{0, 0}, {5, 3}, {10, 0}});
  x.wire("A", x.top, {{5, 3}, {5, 8}});  // the branch to U3
  x.signal("S", {"U1", "1"}, {"U2", "1"}, {"A"});
  x.signal("T", {"U1", "1"}, {"U3", "1"}, {"A"});
  const double leg = std::hypot(5.0, 3.0);
  SignalDelay s = x.delay("S"), t = x.delay("T");
  ASSERT_TRUE(s.routed);
  EXPECT_NEAR(s.length, mmToNm(2 * leg), 10);
  EXPECT_NEAR(s.ps, 2 * leg * kDelayOuterPsPerMm, 1e-6);
  EXPECT_EQ(s.net, x.b.findNet("A"));
  EXPECT_EQ(s.at, x.b.pads[1].pos.v());
  ASSERT_TRUE(t.routed);
  EXPECT_NEAR(t.length, mmToNm(leg + 5), 10);
  // Not connected: no way, no value.
  x.b.tracks.pop_back();
  EXPECT_FALSE(x.delay("T").routed);
  EXPECT_TRUE(x.delay("S").routed);
}

// Through a via to an inner... to the other layer and back: the lengths add up, the via adds none.
TEST(Delay, PathGoesThroughViasAndLayers) {
  Bench x;
  // (a layer between the two: the copper layers are top to bottom in their order)
  Board& b = x.b;
  b.layers.clear();
  x.top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  const LayerId inner = b.addLayer("Inner", LayerKind::Copper, Side::None);
  x.bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  x.pin("U1", "1", "A", 0, 0);
  x.pin("U2", "1", "A", 10, 0);
  x.wire("A", x.top, {{0, 0}, {3, 0}});
  x.wire("A", inner, {{3, 0}, {7, 0}});
  x.wire("A", x.top, {{7, 0}, {10, 0}});
  for (double at : {3.0, 7.0}) {
    Via v;
    v.pos = {mmToNm(at), 0};
    v.diameter = mmToNm(0.6);
    v.drill = mmToNm(0.3);
    v.layers = x.b.allCopperMask();
    v.net = x.b.findNet("A");
    x.b.vias.push_back(v);
  }
  x.signal("S", {"U1", "1"}, {"U2", "1"}, {"A"});
  SignalDelay s = x.delay("S");
  ASSERT_TRUE(s.routed);
  EXPECT_NEAR(s.length, mmToNm(10.0), 10);
  const double innerRate = delayPsPerMm(x.b, inner);
  EXPECT_NE(innerRate, kDelayOuterPsPerMm);
  EXPECT_NEAR(s.ps, 6 * kDelayOuterPsPerMm + 4 * innerRate, 1e-6);
}

// A wire that bends inside the copper of a pad or a via before its centre is counted whole: no way is cut short
// through the copper.
TEST(Delay, BendsInsideAPadAreOfTheWire) {
  Bench x;
  x.pin("U1", "1", "A", 0, 0);
  x.pin("U2", "1", "A", 10, 0);
  x.wire("A", x.top, {{0, 0}, {9.8, 0.2}, {10, 0}});  // the last bend 0.28 mm from the centre of a 0.6 mm pad
  x.signal("S", {"U1", "1"}, {"U2", "1"}, {"A"});
  SignalDelay s = x.delay("S");
  ASSERT_TRUE(s.routed);
  EXPECT_NEAR(s.length, mmToNm(std::hypot(9.8, 0.2) + std::hypot(0.2, 0.2)), 10);
  // A wire that stops short of the centre is on the pad all the same.
  x.b.tracks.pop_back();
  s = x.delay("S");
  ASSERT_TRUE(s.routed);
  EXPECT_NEAR(s.length, mmToNm(std::hypot(9.8, 0.2)), 10);
}

// A signal through a series resistor: two nets, the resistor named by the signal joins them at no length.
TEST(Delay, PathGoesThroughThePassiveComponent) {
  Bench x;
  x.pin("U1", "1", "A", 0, 0);
  x.pin("R1", "1", "A", 4, 0);
  x.pin("R1", "2", "B", 6, 0);
  x.pin("U2", "1", "B", 10, 0);
  x.wire("A", x.top, {{0, 0}, {4, 0}});
  x.wire("B", x.top, {{6, 0}, {10, 0}});
  x.signal("S", {"U1", "1"}, {"U2", "1"}, {"A", "B"}, {"U1", "R1", "U2"});
  x.signal("Bare", {"U1", "1"}, {"U2", "1"}, {"A", "B"});
  SignalDelay s = x.delay("S");
  ASSERT_TRUE(s.routed);
  EXPECT_NEAR(s.length, mmToNm(8.0), 10);
  EXPECT_FALSE(x.delay("Bare").routed);  // the resistor is not of this signal
}

// «Выравнивание в группе»: the signals of the group within the tolerance of each other; the message names the
// two furthest apart, the shorter first.
TEST(Delay, EqualRuleNamesTheShortestAndLongest) {
  Bench x = twoSignals();
  x.b.hispeed.groups.push_back({"Bus", {{ObjectSignal::Kind::Signal, "S2"}, {ObjectSignal::Kind::Signal, "S1"}}});
  DelayRule rule;
  rule.kind = DelayRule::Kind::Equal;
  rule.time = true;
  rule.tolerance = 5;  // ps; the two differ by 2 mm: about 13 ps
  rule.objects = {{ObjectSignal::Kind::SignalGroup, "Bus"}};
  x.b.hispeed.delays = {rule};
  auto v = checkDelays(x.b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].kind, DelayViolation::Kind::Equal);
  EXPECT_EQ(v[0].rule, 0);
  EXPECT_EQ(v[0].shorter, "S1");
  EXPECT_EQ(v[0].longer, "S2");
  EXPECT_EQ(v[0].netShorter, "A");
  EXPECT_EQ(v[0].netLonger, "B");
  EXPECT_TRUE(v[0].time);
  EXPECT_NEAR(v[0].value, 2 * kDelayOuterPsPerMm, 1e-6);
  EXPECT_EQ(v[0].high, 5);
  x.b.hispeed.delays[0].tolerance = 2 * kDelayOuterPsPerMm;
  EXPECT_TRUE(checkDelays(x.b).empty());
  // By length: 2 mm against 1.5 mm allowed.
  x.b.hispeed.delays[0].time = false;
  x.b.hispeed.delays[0].tolerance = double(mmToNm(1.5));
  v = checkDelays(x.b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_FALSE(v[0].time);
  EXPECT_NEAR(v[0].value, mmToNm(2.0), 10);
  // Switched off; and a rule over a signal that is not routed says nothing.
  x.b.hispeed.delays[0].enabled = false;
  EXPECT_TRUE(checkDelays(x.b).empty());
  x.b.hispeed.delays[0].enabled = true;
  x.b.tracks.pop_back();
  EXPECT_TRUE(checkDelays(x.b).empty());
}

// «Взаимное выравнивание»: −under ≤ delay(left) − delay(right) − constant ≤ over.
TEST(Delay, RelationRuleUsesBothTolerances) {
  Bench x = twoSignals();
  DelayRule rule;
  rule.kind = DelayRule::Kind::Relation;
  rule.time = true;
  rule.left = {{ObjectSignal::Kind::Signal, "S1"}};
  rule.right = {{ObjectSignal::Kind::Signal, "S2"}};
  // S1 − S2 = −2 mm: `d` ps; the constants below are by it.
  const double d = -2 * kDelayOuterPsPerMm;
  auto check = [&](double constant, double under, double over) {
    rule.constant = d + constant, rule.toleranceUnder = under, rule.toleranceOver = over;
    x.b.hispeed.delays = {rule};
    return checkDelays(x.b);
  };
  EXPECT_TRUE(check(0, 0, 0).empty());
  EXPECT_TRUE(check(2, 2, 0).empty());   // 2 under the constant, allowed
  EXPECT_EQ(check(2, 1, 5).size(), 1u);  // 2 under, 1 allowed
  EXPECT_TRUE(check(-2, 0, 2).empty());  // 2 over the constant
  auto v = check(-2, 5, 1);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].kind, DelayViolation::Kind::Relation);
  EXPECT_EQ(v[0].shorter, "S1");
  EXPECT_EQ(v[0].longer, "S2");
  EXPECT_NEAR(v[0].value, d, 1e-6);
  EXPECT_NEAR(v[0].low, d - 7, 1e-9);
  EXPECT_NEAR(v[0].high, d - 1, 1e-9);
}

// «Абсолютное значение»: the delay itself within the tolerances of the constant.
TEST(Delay, ConstantRule) {
  Bench x = twoSignals();
  x.b.hispeed.groups.push_back({"Bus", {{ObjectSignal::Kind::Signal, "S1"}, {ObjectSignal::Kind::Signal, "S2"}}});
  DelayRule rule;
  rule.kind = DelayRule::Kind::Constant;
  rule.time = true;
  const double s1 = 10 * kDelayOuterPsPerMm, s2 = 12 * kDelayOuterPsPerMm;  // about 65 and 78 ps
  rule.constant = s1;
  rule.toleranceUnder = 1;
  rule.toleranceOver = 15;
  rule.objects = {{ObjectSignal::Kind::SignalGroup, "Bus"}};
  x.b.hispeed.delays = {rule};
  EXPECT_TRUE(checkDelays(x.b).empty());
  x.b.hispeed.delays[0].toleranceOver = 10;
  auto v = checkDelays(x.b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].kind, DelayViolation::Kind::Constant);
  EXPECT_EQ(v[0].shorter, "S2");
  EXPECT_TRUE(v[0].longer.empty());
  EXPECT_NEAR(v[0].value, s2, 1e-6);
  EXPECT_NEAR(v[0].low, s1 - 1, 1e-9);
  EXPECT_NEAR(v[0].high, s1 + 10, 1e-9);
}

// The two conductors of a differential signal: the difference of their lengths against the allowed one; a rule
// takes the pair as one value, the mean of the two.
TEST(Delay, DiffSignalMismatchAndMean) {
  Bench x = twoSignals();
  x.b.hispeed.diffSignals.push_back({"CLK", mmToNm(2.5), "", "S1", "S2"});
  EXPECT_TRUE(checkDelays(x.b).empty());
  x.b.hispeed.diffSignals[0].mismatch = mmToNm(1.0);
  auto v = checkDelays(x.b);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].kind, DelayViolation::Kind::Mismatch);
  EXPECT_EQ(v[0].shorter, "S1");
  EXPECT_NEAR(v[0].value, mmToNm(2.0), 10);
  x.b.hispeed.diffSignals[0].mismatch = 0;  // none given
  DelayRule rule;
  rule.kind = DelayRule::Kind::Constant;
  rule.time = true;
  rule.constant = 11 * kDelayOuterPsPerMm;  // the mean of the two: 11 mm
  rule.objects = {{ObjectSignal::Kind::DiffSignal, "CLK"}};
  x.b.hispeed.delays = {rule};
  EXPECT_TRUE(checkDelays(x.b).empty());
  x.b.hispeed.delays[0].constant = 10 * kDelayOuterPsPerMm;
  EXPECT_EQ(checkDelays(x.b).size(), 1u);
}

// TopoR's example of signals: every signal that is routed has its delay, the rules are checked.
TEST(Delay, Example06Evaluates) {
  auto r = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  auto d = signalDelays(b);
  size_t signals = 0;
  for (auto& c : b.hispeed.clusters) signals += c.signalList.size();
  ASSERT_EQ(d.size(), signals);
  size_t routed = 0;
  for (auto& s : d) {
    routed += s.routed;
    if (s.routed) {
      EXPECT_GT(s.length, 0) << s.signal;
      EXPECT_GT(s.ps, 0) << s.signal;
    }
  }
  EXPECT_EQ(routed, signals);  // the example is routed whole
  // TopoR matched these signals, and by our count they are matched: within a group to the rule's 1 ps, the
  // clock pair 6.5 ps behind the groups as its rules ask, its two conductors equal to 10 um. Of the 39 signals
  // of the three groups 35 fit one delay to a hundredth of a picosecond.
  auto ps = [&](const char* name) {
    for (auto& s : d)
      if (s.signal == name) return s.ps;
    return -1.0;
  };
  std::vector<double> all;
  for (auto& g : b.hispeed.groups)
    for (auto& m : g.members) all.push_back(ps(m.name.c_str()));
  ASSERT_EQ(all.size(), 39u);
  r::sort(all);
  const double usual = all[all.size() / 2];
  EXPECT_GE(r::count_if(all, [&](double v) { return std::abs(v - usual) < 0.01; }), 35);
  EXPECT_NEAR((ps("SDCLK") + ps("SDCLK_B")) / 2 - usual, 6.5, 0.01);
  auto v = checkDelays(b, d);
  for (auto& x : v) {
    ADD_FAILURE() << "rule " << x.rule << ": " << x.shorter << " / " << x.longer << " " << x.value << " (" << x.low << ".." << x.high << ")";
  }
}
