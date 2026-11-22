#include <gtest/gtest.h>

#include <map>
#include <regex>
#include <set>
#include <sstream>

#include "core/Edit.h"
#include "core/Swap.h"
#include "geom/Ranges.h"
#include "io/BoardIO.h"
#include "io/eco/PcadEco.h"

using namespace xr;
using io::EcoChange;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

using Netlist = std::map<std::string, std::set<std::string>>;  // net -> its pins («D3-1»)

Netlist netlistOf(const Board& b) {
  Netlist out;
  for (const Net& n : b.nets) out[n.name];
  for (const Pad& p : b.pads)
    if (p.component >= 0 && p.net >= 0) out[b.nets[size_t(p.net)].name].insert(b.components[size_t(p.component)].ref + "-" + p.designator());
  return out;
}

// The lines of an ECO carried out on a netlist, as the schematic's side would: every line must make sense — a
// node added to a net that is there and has it not, taken from the net that has it, a net deleted when empty.
::testing::AssertionResult apply(Netlist& nl, const std::vector<EcoChange>& changes) {
  static const std::regex one(R"re(^(\w+) "([^"]*)"$)re"), two(R"re(^(\w+) "([^"]*)" "([^"]*)"$)re");
  for (const EcoChange& c : changes)
    for (const std::string& l : c.lines) {
      std::smatch m;
      if (std::regex_match(l, m, two)) {
        const std::string cmd = m[1], a = m[2], b = m[3];
        if (cmd == "NetRename") {
          if (!nl.contains(a) || nl.contains(b)) return ::testing::AssertionFailure() << l;
          nl[b] = nl[a];
          nl.erase(a);
        } else if (cmd == "NetNodeAdd") {
          if (!nl.contains(a) || !nl[a].insert(b).second) return ::testing::AssertionFailure() << l;
        } else if (cmd == "NetNodeDelete") {
          if (!nl.contains(a) || !nl[a].erase(b)) return ::testing::AssertionFailure() << l;
        } else {
          return ::testing::AssertionFailure() << "unknown: " << l;
        }
      } else if (std::regex_match(l, m, one)) {
        const std::string cmd = m[1], a = m[2];
        if (cmd == "NetAdd") {
          if (!nl.emplace(a, std::set<std::string>{}).second) return ::testing::AssertionFailure() << l;
        } else if (cmd == "NetDelete") {
          if (!nl.contains(a) || !nl[a].empty()) return ::testing::AssertionFailure() << l;
          nl.erase(a);
        } else {
          return ::testing::AssertionFailure() << "unknown: " << l;
        }
      } else {
        return ::testing::AssertionFailure() << "not a line of the grammar: " << l;
      }
    }
  return ::testing::AssertionSuccess();
}

// The changes turn the base's netlist into the design's.
void expectLeadsTo(const Board& base, const Board& now, const std::vector<EcoChange>& changes) {
  Netlist nl = netlistOf(base);
  ASSERT_TRUE(apply(nl, changes));
  EXPECT_TRUE(nl == netlistOf(now));
}

int padOf(const Board& b, const char* ref, const char* number) {
  for (int pi : b.components[size_t(b.findComponent(ref))].pads)
    if (b.pads[size_t(pi)].number == number) return pi;
  return -1;
}

size_t count(const std::vector<EcoChange>& c, EcoChange::Kind k) { return size_t(r::count(c, k, &EcoChange::kind)); }

}  // namespace

// A design against itself: nothing. Two pins swapped: one change of four lines; two gates: one change.
TEST(Eco, SwapsAreSingleChanges) {
  auto lb = io::loadBoard(data("topor/Example_02/Placement_standard_routing.fst"));
  ASSERT_TRUE(lb) << lb.error();
  const Board base = **lb;
  Board now = base;
  EXPECT_TRUE(io::netlistDiff(base, now).empty());
  // The first two pins of a group with different nets.
  int pa = -1, pb = -1;
  for (const SwapGroup& g : pinGroups(now))
    if (pa < 0 && now.pads[size_t(g.members[0][0])].net != now.pads[size_t(g.members[1][0])].net && now.pads[size_t(g.members[0][0])].net >= 0 &&
        now.pads[size_t(g.members[1][0])].net >= 0)
      pa = g.members[0][0], pb = g.members[1][0];
  ASSERT_GE(pa, 0);
  ASSERT_TRUE(swapPins(now, pa, pb) == SwapRefusal::None);
  auto changes = io::netlistDiff(base, now);
  ASSERT_EQ(changes.size(), 1u);
  EXPECT_EQ(changes[0].kind, EcoChange::Kind::PinSwap);
  EXPECT_EQ(changes[0].lines.size(), 4u);
  EXPECT_EQ(changes[0].netA, base.nets[size_t(base.pads[size_t(pa)].net)].name);
  EXPECT_EQ(changes[0].netB, base.nets[size_t(base.pads[size_t(pb)].net)].name);
  expectLeadsTo(base, now, changes);
  // Two gates of D3 besides.
  ASSERT_TRUE(swapGates(now, padOf(now, "D3", "1"), padOf(now, "D3", "5")) == SwapRefusal::None);
  changes = io::netlistDiff(base, now);
  EXPECT_EQ(count(changes, EcoChange::Kind::GateSwap), 1u);
  EXPECT_EQ(count(changes, EcoChange::Kind::PinSwap), 1u);
  EXPECT_EQ(changes.size(), 2u);
  for (const EcoChange& c : changes)
    if (c.kind == EcoChange::Kind::GateSwap) {
      EXPECT_EQ(c.a, "D3-1, D3-2, D3-3");
      EXPECT_EQ(c.b, "D3-5, D3-6, D3-4");
    }
  expectLeadsTo(base, now, changes);
  // Swapped back: nothing again.
  ASSERT_TRUE(swapGates(now, padOf(now, "D3", "1"), padOf(now, "D3", "5")) == SwapRefusal::None);
  ASSERT_TRUE(swapPins(now, pa, pb) == SwapRefusal::None);
  EXPECT_TRUE(io::netlistDiff(base, now).empty());
}

// Three equivalent pins turned round are two swaps; a pin given another net by hand is a change of its own; both
// lead from the base's netlist to the design's.
TEST(Eco, PermutationsAndSinglePins) {
  Board base;
  const LayerId top = base.addLayer("Top", LayerKind::Copper, Side::Top);
  base.layers[top].copperIndex = 0;
  for (const char* n : {"A", "B", "C", "D"}) base.addNet(n);
  Component c;
  c.ref = "U1";
  base.components.push_back(c);
  for (int i = 0; i < 4; ++i) {
    Pad p;
    p.number = std::to_string(i + 1);
    p.component = 0;
    p.net = i;
    p.pos = Point(Vec2{i * 2.0 * kNmPerMm, 0});
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = LayerMask(1) << top;
    p.pinEqual = i < 3 ? 1 : 0;
    base.components[0].pads.push_back(i);
    base.pads.push_back(p);
  }
  Board now = base;
  now.pads[0].net = 1;  // 1: A -> B, 2: B -> C, 3: C -> A
  now.pads[1].net = 2;
  now.pads[2].net = 0;
  auto changes = io::netlistDiff(base, now);
  EXPECT_EQ(changes.size(), 2u);
  EXPECT_EQ(count(changes, EcoChange::Kind::PinSwap), 2u);
  expectLeadsTo(base, now, changes);
  // The pin that is not equivalent given net A, pin 1 given no net: not swaps.
  now = base;
  now.pads[3].net = 0;
  now.pads[0].net = kNoNet;
  changes = io::netlistDiff(base, now);
  EXPECT_EQ(changes.size(), 2u);
  EXPECT_EQ(count(changes, EcoChange::Kind::PinNet), 2u);
  expectLeadsTo(base, now, changes);
  // Two of the three exchanged and the third moved to a net that is new.
  now = base;
  std::swap(now.pads[0].net, now.pads[1].net);
  now.pads[2].net = now.addNet("E");
  changes = io::netlistDiff(base, now);
  EXPECT_EQ(count(changes, EcoChange::Kind::PinSwap), 1u);
  EXPECT_EQ(count(changes, EcoChange::Kind::AddNet), 1u);
  EXPECT_EQ(count(changes, EcoChange::Kind::PinNet), 1u);
  expectLeadsTo(base, now, changes);
}

// The nets of one pin taken out: every one is a change of its own — the pin leaves the net, the net is deleted. A
// net named anew is one line.
TEST(Eco, RemovedAndRenamedNets) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  const Board base = **lb;
  Board now = base;
  ASSERT_EQ(edit::removeSinglePinNets(now).removed, 39);
  auto changes = io::netlistDiff(base, now);
  EXPECT_EQ(changes.size(), 39u);
  EXPECT_EQ(count(changes, EcoChange::Kind::RemoveNet), 39u);
  for (const EcoChange& c : changes) {
    ASSERT_EQ(c.lines.size(), 2u) << c.a;
    EXPECT_EQ(c.lines[0].rfind("NetNodeDelete \"" + c.a + "\" ", 0), 0u) << c.lines[0];
    EXPECT_EQ(c.lines[1], "NetDelete \"" + c.a + "\"");
  }
  expectLeadsTo(base, now, changes);
  int renamed = -1;  // (a net with pins: one of none, named anew, is a net gone and a net added)
  for (int n = 0; n < int(now.nets.size()) && renamed < 0; ++n)
    if (r::count(now.pads, n, &Pad::net) >= 2 && edit::renameNet(now, n, "NAMED_ANEW").empty()) renamed = n;
  ASSERT_GE(renamed, 0);
  changes = io::netlistDiff(base, now);
  ASSERT_EQ(count(changes, EcoChange::Kind::RenameNet), 1u);
  EXPECT_EQ(changes.size(), 40u);
  EXPECT_EQ(changes[0].kind, EcoChange::Kind::RenameNet) << "named anew first";
  EXPECT_EQ(changes[0].b, "NAMED_ANEW");
  expectLeadsTo(base, now, changes);
}

// A component's value or another attribute of it that is other is a line of its own, as P-CAD's schematic writes
// them; an attribute the base has not is added.
TEST(Eco, ComponentAttributes) {
  auto lb = io::loadBoard(data("topor/Example_02/Placement_master.pcb"));
  ASSERT_TRUE(lb) << lb.error();
  const Board base = **lb;
  Board now = base;
  const int r1 = now.findComponent("R1");
  ASSERT_GE(r1, 0);
  now.components[size_t(r1)].value = "4,7 кОм";
  now.components[size_t(r1)].attrs.push_back({"Tolerance", "5%"});
  const auto changes = io::netlistDiff(base, now);
  ASSERT_EQ(changes.size(), 2u);
  EXPECT_EQ(count(changes, EcoChange::Kind::CompAttr), 2u);
  std::set<std::string> lines;
  for (const EcoChange& c : changes) {
    EXPECT_EQ(c.a, "R1");
    ASSERT_EQ(c.lines.size(), 1u);
    lines.insert(c.lines[0]);
  }
  const bool hadValue = !base.attributeValue(base.findComponent("R1"), "Value").empty();
  EXPECT_TRUE(lines.contains(std::string(hadValue ? "CompAttrModify" : "CompAttrAdd") + " \"R1\" \"Value\" \"4,7 кОм\" \"\" \"string\" \"\"")) << *lines.begin();
  EXPECT_TRUE(lines.contains("CompAttrAdd \"R1\" \"Tolerance\" \"5%\"")) << *lines.rbegin();
}

// The file as P-CAD writes its own: a comment line with the program, the file and the date, then a command a
// line with quoted names, CRLF, the text in CP1251.
TEST(Eco, FileIsOfPcadGrammar) {
  // (P-CAD's own, from a file of P-CAD 2002: the grammar the lines are held to.)
  const std::string pcads = "; P-CAD 2002 PCB Version 17.01.22 [D:\\WORK\\BOARD.pcb]--Mon May 22 10:18:41 2017";
  const std::regex head(R"re(^; .+ \[.*\]--[A-Z][a-z]{2} [A-Z][a-z]{2} \d{2} \d{2}:\d{2}:\d{2} \d{4}$)re");
  const std::regex cmd(R"re(^(NetRename|NetNodeAdd|NetNodeDelete) "[^"]+" "[^"]+"$|^(NetAdd|NetDelete) "[^"]+"$)re");
  ASSERT_TRUE(std::regex_match(pcads, head));
  ASSERT_TRUE(std::regex_match(std::string("NetNodeAdd \"NET00000\" \"DD1-3\""), cmd));
  std::vector<EcoChange> changes;
  changes.push_back({EcoChange::Kind::PinNet, "DD1-3", {}, "Цепь1", "NET2", {"NetNodeDelete \"Цепь1\" \"DD1-3\"", "NetNodeAdd \"NET2\" \"DD1-3\""}});
  changes.push_back({EcoChange::Kind::RemoveNet, "NET3", {}, {}, {}, {"NetDelete \"NET3\""}});
  const std::string text = io::pcadEcoText(changes, "XrTopoR 0.2", "C:\\board.fst", std::time_t(1495448321));
  EXPECT_EQ(text.find("Цепь1"), std::string::npos) << "CP1251, not UTF-8";
  EXPECT_NE(text.find("\"\xD6\xE5\xEF\xFC" "1\""), std::string::npos);
  std::vector<std::string> lines;
  size_t from = 0;
  for (size_t at; (at = text.find("\r\n", from)) != std::string::npos; from = at + 2) lines.push_back(text.substr(from, at - from));
  EXPECT_EQ(from, text.size()) << "every line ends with CRLF";
  ASSERT_EQ(lines.size(), 4u);
  EXPECT_TRUE(std::regex_match(lines[0], head)) << lines[0];
  EXPECT_EQ(lines[0].rfind("; XrTopoR 0.2 [C:\\board.fst]--", 0), 0u);
  for (size_t i = 2; i < lines.size(); ++i) EXPECT_TRUE(std::regex_match(lines[i], cmd)) << lines[i];
  // Written and read back as bytes.
  const std::string path = testing::TempDir() + "/xr_test.eco";
  ASSERT_TRUE(io::writePcadEco(path, changes, "XrTopoR 0.2", "C:\\board.fst"));
  auto read = io::readFile(path);
  ASSERT_TRUE(read);
  EXPECT_NE(read->find("NetDelete \"NET3\"\r\n"), std::string::npos);
}
