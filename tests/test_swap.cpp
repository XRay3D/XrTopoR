#include <gtest/gtest.h>

#include <map>
#include <set>

#include "core/Connectivity.h"
#include "core/Swap.h"
#include "geom/Ranges.h"
#include "io/BoardIO.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// The pad of a component by its number.
int padOf(const Board& b, const char* ref, const char* number) {
  const int ci = b.findComponent(ref);
  if (ci < 0) return -1;
  for (int pi : b.components[size_t(ci)].pads)
    if (b.pads[size_t(pi)].number == number) return pi;
  return -1;
}

std::set<std::string> numbers(const Board& b, const std::vector<int>& pads) {
  std::set<std::string> out;
  for (int pi : pads) out.insert(b.pads[size_t(pi)].number);
  return out;
}

// Whether a wire of the pad's net ends on the pad.
bool wired(const Board& b, int pad) {
  const Pad& p = b.pads[size_t(pad)];
  const Shape s = p.shapeGeom();
  return r::any_of(b.tracks, [&](const Track& t) {
    return t.net == p.net && p.onLayer(t.layer) && (s.contains(t.a.v()) || s.contains(t.b.v()));
  });
}

// Two pins of one group with different nets, both wired: the first such pair of the board.
std::pair<int, int> wiredPair(const Board& b) {
  for (const SwapGroup& g : pinGroups(b))
    for (size_t i = 0; i < g.members.size(); ++i)
      for (size_t j = i + 1; j < g.members.size(); ++j) {
        const int pa = g.members[i][0], pb = g.members[j][0];
        const Pad& a = b.pads[size_t(pa)];
        const Pad& c = b.pads[size_t(pb)];
        if (a.net != c.net && a.net != kNoNet && c.net != kNoNet && wired(b, pa) && wired(b, pb)) return {pa, pb};
      }
  return {-1, -1};
}

}  // namespace

// The groups of TopoR's example 2: 561ЛА7 (D3) has four gates of two equivalent inputs and an output — four groups
// of two pins, one group of four gates; a resistor's two pins are a group; the power pins are of none.
TEST(Swap, Groups) {
  auto r = io::loadBoard(data("topor/Example_02/Placement.fst"));
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  const int d3 = b.findComponent("D3");
  ASSERT_GE(d3, 0);
  const auto pins = pinGroups(b);
  std::set<std::set<std::string>> ofD3;
  for (const SwapGroup& g : pins) {
    ASSERT_GE(g.members.size(), 2u);
    for (const auto& m : g.members) {
      ASSERT_EQ(m.size(), 1u);
      EXPECT_EQ(b.pads[size_t(m[0])].component, g.component);
    }
    if (g.component != d3) continue;
    std::vector<int> pads;
    for (const auto& m : g.members) pads.push_back(m[0]);
    ofD3.insert(numbers(b, pads));
  }
  EXPECT_EQ(ofD3, (std::set<std::set<std::string>>{{"1", "2"}, {"5", "6"}, {"8", "9"}, {"12", "13"}}));
  const auto gates = gateGroups(b);
  std::vector<std::set<std::string>> gatesOfD3;
  for (const SwapGroup& g : gates)
    if (g.component == d3)
      for (const auto& m : g.members) gatesOfD3.push_back(numbers(b, m));
  EXPECT_EQ(gatesOfD3, (std::vector<std::set<std::string>>{{"1", "2", "3"}, {"4", "5", "6"}, {"8", "9", "10"}, {"11", "12", "13"}}));
  // Every pad knows its place; the power pin has none.
  const auto place = swapPlaces(b, gates);
  EXPECT_EQ(place[size_t(padOf(b, "D3", "14"))].group, -1);
  EXPECT_EQ(place[size_t(padOf(b, "D3", "1"))].group, place[size_t(padOf(b, "D3", "11"))].group);
  EXPECT_NE(place[size_t(padOf(b, "D3", "1"))].member, place[size_t(padOf(b, "D3", "11"))].member);
  EXPECT_EQ(place[size_t(padOf(b, "D3", "1"))].member, place[size_t(padOf(b, "D3", "3"))].member);
  // A design without equivalence has no groups.
  auto none = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(none);
  EXPECT_TRUE(pinGroups(**none).empty());
  EXPECT_TRUE(gateGroups(**none).empty());
}

// Two equivalent pins exchange their nets and the wires that came to them: each pin is wired as before, every net
// is connected as it was; done twice, the nets are back.
TEST(Swap, PinsExchangeNetsAndWireEnds) {
  auto r = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  const auto [p1, p2] = wiredPair(b);
  ASSERT_GE(p1, 0);
  const int n1 = b.pads[size_t(p1)].net, n2 = b.pads[size_t(p2)].net;
  ASSERT_NE(n1, n2);
  ASSERT_TRUE(wired(b, p1) && wired(b, p2));
  const size_t lines = Connectivity::compute(b).ratsnest.size();
  SwappedPads done;
  ASSERT_EQ(swapPins(b, p1, p2, &done), SwapRefusal::None);
  EXPECT_EQ(done, (SwappedPads{{p1, p2}}));
  EXPECT_EQ(b.pads[size_t(p1)].net, n2);
  EXPECT_EQ(b.pads[size_t(p2)].net, n1);
  EXPECT_TRUE(wired(b, p1) && wired(b, p2));
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), lines) << "the nets are connected as they were";
  ASSERT_EQ(swapPins(b, p2, p1), SwapRefusal::None);
  EXPECT_EQ(b.pads[size_t(p1)].net, n1);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), lines);
}

// Two equivalent gates exchange all their pins at once, pin for pin by the names in the symbol.
TEST(Swap, GatesGoWhole) {
  auto r = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  auto net = [&](const char* number) { return b.pads[size_t(padOf(b, "D3", number))].net; };
  const int i1 = net("1"), i2 = net("2"), o = net("3"), j1 = net("5"), j2 = net("6"), q = net("4");
  const size_t lines = Connectivity::compute(b).ratsnest.size();
  SwappedPads done;
  ASSERT_EQ(swapGates(b, padOf(b, "D3", "2"), padOf(b, "D3", "4"), &done), SwapRefusal::None);
  EXPECT_EQ(done.size(), 3u);
  EXPECT_EQ(net("1"), j1);
  EXPECT_EQ(net("2"), j2);
  EXPECT_EQ(net("3"), q);
  EXPECT_EQ(net("5"), i1);
  EXPECT_EQ(net("6"), i2);
  EXPECT_EQ(net("4"), o);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), lines);
  for (const char* n : {"1", "2", "3", "4", "5", "6"}) EXPECT_TRUE(net(n) == kNoNet || wired(b, padOf(b, "D3", n))) << n;
}

// Not of one group: refused, nothing changed. A fixed wire on a pin: refused too.
TEST(Swap, RefusesOtherGroupAndFixed) {
  auto r = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  const int p1 = padOf(b, "D3", "1"), p2 = padOf(b, "D3", "2"), p3 = padOf(b, "D3", "3"), p5 = padOf(b, "D3", "5"), p14 = padOf(b, "D3", "14");
  const auto [w1, w2] = wiredPair(b);
  ASSERT_GE(w1, 0);
  const std::vector<Pad> pads = b.pads;
  auto same = [&] { return r::equal(b.pads, pads, {}, &Pad::net, &Pad::net); };
  EXPECT_EQ(swapPins(b, p1, p5), SwapRefusal::NotEquivalent) << "inputs of different gates";
  EXPECT_EQ(swapPins(b, p1, p3), SwapRefusal::NotEquivalent) << "an input and the output";
  EXPECT_EQ(swapPins(b, p1, p1), SwapRefusal::NotEquivalent);
  EXPECT_EQ(swapGates(b, p1, p2), SwapRefusal::NotEquivalent) << "one gate";
  EXPECT_EQ(swapGates(b, p1, p14), SwapRefusal::NotEquivalent) << "a pin of no gate";
  EXPECT_TRUE(same());
  // A pin of another component.
  int other = -1;
  for (int pi = 0; pi < int(b.pads.size()) && other < 0; ++pi)
    if (b.pads[size_t(pi)].component != b.pads[size_t(p1)].component && b.pads[size_t(pi)].pinEqual) other = pi;
  ASSERT_GE(other, 0);
  EXPECT_EQ(swapPins(b, p1, other), SwapRefusal::NotEquivalent);
  // The wire on a pin fixed.
  const Pad& a = b.pads[size_t(w1)];
  const Shape s = a.shapeGeom();
  const std::vector<Track> tracks = b.tracks;
  for (Track& t : b.tracks)
    if (t.net == a.net && a.onLayer(t.layer) && (s.contains(t.a.v()) || s.contains(t.b.v()))) t.locked = true;
  EXPECT_TRUE(swapPins(b, w1, w2) == SwapRefusal::Locked);
  EXPECT_TRUE(swapPins(b, w2, w1) == SwapRefusal::Locked);
  EXPECT_TRUE(same());
  for (size_t i = 0; i < tracks.size(); ++i) EXPECT_TRUE(b.tracks[i].a == tracks[i].a && b.tracks[i].b == tracks[i].b) << i;
}

// A signal that begins at a pin goes with its net to the other pin; planar pins on different sides exchange
// their nets, the wires stay where they are.
TEST(Swap, SignalsFollowTheNetAndSidesKeepTheirWires) {
  auto r = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  const auto [p1, p2] = wiredPair(b);
  ASSERT_GE(p1, 0);
  auto ref = [&](int pad) { return PinRef{b.components[size_t(b.pads[size_t(pad)].component)].ref, b.pads[size_t(pad)].number}; };
  const PinRef one = ref(p1), two = ref(p2), far{"NOWHERE", "1"};
  SignalCluster cl;
  cl.source = one;
  Signal s;
  s.name = "S";
  s.receiver = two;
  cl.signalList.push_back(s);
  cl.pinPairs.push_back({one, far});
  b.hispeed.clusters.push_back(cl);
  ASSERT_EQ(swapPins(b, p1, p2), SwapRefusal::None);
  const SignalCluster& now = b.hispeed.clusters.back();
  EXPECT_TRUE(now.source == two);
  EXPECT_TRUE(now.signalList[0].receiver == one);
  EXPECT_TRUE(now.pinPairs[0].first == two);
  EXPECT_TRUE(now.pinPairs[0].second == far);

  // Two planar pads of one component, one on each side, a wire to each.
  Board t;
  const LayerId top = t.addLayer("Top", LayerKind::Copper, Side::Top), bot = t.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  t.layers[top].copperIndex = 0;
  t.layers[bot].copperIndex = 1;
  const int na = t.addNet("A"), nb = t.addNet("B");
  Component c;
  c.ref = "X1";
  t.components.push_back(c);
  auto pad = [&](const char* number, double x, LayerId layer, int net) {
    Pad p;
    p.number = number;
    p.component = 0;
    p.net = net;
    p.pos = Point(Vec2{x * kNmPerMm, 0});
    p.shape.kind = PadShapeKind::Rect;
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = LayerMask(1) << layer;
    p.pinEqual = 1;
    t.components[0].pads.push_back(int(t.pads.size()));
    t.pads.push_back(p);
  };
  pad("1", 0, top, na);
  pad("2", 5, bot, nb);
  auto wire = [&](double x, LayerId layer, int net) {
    Track w;
    w.a = Point(Vec2{x * kNmPerMm, 0});
    w.b = Point(Vec2{x * kNmPerMm, 5.0 * kNmPerMm});
    w.width = mmToNm(0.2);
    w.layer = layer;
    w.net = net;
    t.tracks.push_back(w);
  };
  wire(0, top, na);
  wire(5, bot, nb);
  const std::vector<Track> before = t.tracks;
  ASSERT_EQ(swapPins(t, 0, 1), SwapRefusal::None);
  EXPECT_EQ(t.pads[0].net, nb);
  EXPECT_EQ(t.pads[1].net, na);
  for (size_t i = 0; i < before.size(); ++i) EXPECT_TRUE(t.tracks[i].a == before[i].a && t.tracks[i].b == before[i].b) << i;
}
