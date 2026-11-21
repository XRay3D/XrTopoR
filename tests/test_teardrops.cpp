// «Капельки»: the teardrops as TopoR makes them (core/Teardrops.h), measured against the ones its own files
// carry, and what takes them for copper.
#include <gtest/gtest.h>

#include <algorithm>
#include <fstream>
#include <print>
#include <sstream>

#include "core/Teardrops.h"
#include "drc/Drc.h"
#include "core/ZoneFill.h"
#include "io/BoardIO.h"
#include "io/gerber/GerberWriter.h"
#include "io/xml/Xml.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

struct FileDrop {
  std::string layer, net;
  std::array<Vec2, 4> quad;  // in the board's frame
};

// The teardrops a .fst carries (Connectivity/Wires/Wire/Subwire/Teardrops).
std::vector<FileDrop> dropsOfFile(const std::string& path) {
  std::ifstream in(path);
  std::stringstream ss;
  ss << in.rdbuf();
  auto root = xml::parse(ss.str());
  std::vector<FileDrop> out;
  if (!root) return out;
  const xml::Element* wires = root->path({"Connectivity", "Wires"});
  if (!wires) return out;
  for (const xml::Element* w : wires->findAll("Wire")) {
    FileDrop d;
    if (auto* l = w->find("LayerRef")) d.layer = l->attr("name");
    if (auto* n = w->find("NetRef")) d.net = n->attr("name");
    for (const xml::Element* sw : w->findAll("Subwire"))
      if (auto* ts = sw->find("Teardrops"))
        for (const xml::Element* t : ts->findAll("Teardrop")) {
          auto dots = t->findAll("Dot");
          if (dots.size() != 4) continue;
          for (size_t k = 0; k < 4; ++k) d.quad[k] = {dots[k]->num("x") * kNmPerMm, -dots[k]->num("y") * kNmPerMm};
          out.push_back(d);
        }
  }
  return out;
}

// How many of the file's teardrops ours repeat point for point (within `tol`), and how many of ours the file
// has not.
struct Match {
  int file = 0, same = 0, extra = 0;
};
Match compare(const Board& b, const std::vector<FileDrop>& file, bool tight = true, double tol = 1000) {
  Match m;
  m.file = int(file.size());
  const std::vector<Teardrop> ours = teardrops(b, tight);
  std::vector<char> used(ours.size(), 0);
  for (const FileDrop& f : file)
    for (size_t i = 0; i < ours.size(); ++i) {
      const Teardrop& d = ours[i];
      if (used[i] || b.layers[size_t(d.layer)].name != f.layer || b.nets[size_t(d.net)].name != f.net) continue;
      bool same = true;
      for (size_t k = 0; k < 4; ++k) same = same && (d.quad[k] - f.quad[k]).len() <= tol;
      if (!same) continue;
      used[i] = 1;
      ++m.same;
      break;
    }
  m.extra = int(r::count(used, 0));
  if (std::getenv("XR_TD_DEBUG")) {
    for (size_t i = 0; i < ours.size(); ++i)
      if (!used[i]) {
        const Track& t = b.tracks[size_t(ours[i].track)];
        std::println("  extra: {} {} w {} at {:.4f},{:.4f} piece {:.4f} long, tip {:.4f}", b.layers[size_t(ours[i].layer)].name, b.nets[size_t(ours[i].net)].name, t.width / 1e6,
                     ours[i].quad[0].x / 1e6, -ours[i].quad[0].y / 1e6, t.length() / 1e6, (ours[i].quad[2] - ours[i].quad[0]).len() / 1e6);
      }
    for (const FileDrop& f : file) {
      bool found = false;
      for (const Teardrop& d : ours) found = found || ((d.quad[0] - f.quad[0]).len() <= tol && (d.quad[2] - f.quad[2]).len() <= tol && (d.quad[1] - f.quad[1]).len() <= tol);
      if (!found) {
        std::println("  missing: {} {} at {:.4f},{:.4f} r {:.4f} L {:.4f}", f.layer, f.net, f.quad[0].x / 1e6, -f.quad[0].y / 1e6, (f.quad[1] - f.quad[0]).len() / 1e6, (f.quad[2] - f.quad[0]).len() / 1e6);
        for (const Track& t : b.tracks)
          for (Point e : {t.a, t.b})
            if ((e.v() - f.quad[0]).len() < 50000) std::println("      track end {:.4f},{:.4f} w {} net {} layer {} arc {} len {:.4f}", e.x / 1e6, -e.y / 1e6, t.width / 1e6, b.nets[size_t(t.net)].name, b.layers[size_t(t.layer)].name, t.isArc(), t.length() / 1e6);
      }
    }
  }
  return m;
}

// A board of one layer: a via 1.0 across of net A at (10, 10) with a wire 0.3 wide going right from it; the
// clearance 0.2.
struct Small {
  Board b;
  LayerId top = 0;
  int netA = 0, netB = 0;
  Small() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[size_t(top)].copperIndex = 0;
    b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
    b.netClasses[0].clearance = mmToNm(0.2);
    netA = b.addNet("A");
    netB = b.addNet("B");
    via(netA, 10, 10, 1.0);
    track(netA, 10, 10, 20, 10, 0.3);
    b.settings.route.teardrops = true;
  }
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }
  void via(int net, double x, double y, double d) {
    Via v;
    v.pos = Point(at(x, y));
    v.diameter = mmToNm(d);
    v.drill = mmToNm(d / 2);
    v.layers = LayerMask(1) << top;
    v.net = net;
    b.vias.push_back(v);
  }
  void track(int net, double x0, double y0, double x1, double y1, double w) {
    Track t;
    t.a = Point(at(x0, y0));
    t.b = Point(at(x1, y1));
    t.width = mmToNm(w);
    t.layer = top;
    t.net = net;
    b.tracks.push_back(t);
  }
  // The point on the teardrop's flank half way from the pad to the tip, moved `off` mm out of its copper.
  Vec2 besideFlank(double off) const {
    const Teardrop d = teardrops(b, true).at(0);
    const Vec2 m = (d.quad[1] + d.quad[2]) * 0.5, out = (d.quad[2] - d.quad[1]).normalized().perp();
    const Vec2 side = (m + out * 1000 - d.quad[0]).len() > (m - out * 1000 - d.quad[0]).len() ? out : out * -1.0;
    return m + side * (double(d.width) / 2 + off * kNmPerMm);
  }
};

}  // namespace

// The sizes of one: a via of radius R = 0.5 and a wire w = 0.3 wide: the circle touched r = R - w/2 = 0.35, the tip
// at min(2.4 r, R + 1.2 w) = 0.84; its copper reaches the via's edge and no further.
TEST(Teardrops, SizesOfOne) {
  Small s;
  const auto ds = teardrops(s.b);
  ASSERT_EQ(ds.size(), 1u);
  const Teardrop& d = ds[0];
  EXPECT_EQ(d.net, s.netA);
  EXPECT_EQ(d.track, 0);
  EXPECT_EQ(d.end, 0);
  EXPECT_EQ(d.width, mmToNm(0.3));
  EXPECT_NEAR((d.quad[0] - Small::at(10, 10)).len(), 0, 1);
  EXPECT_NEAR((d.quad[2] - Small::at(10.84, 10)).len(), 0, 10);
  EXPECT_NEAR((d.quad[1] - d.quad[0]).len(), 0.35 * kNmPerMm, 10);
  EXPECT_NEAR((d.quad[3] - d.quad[0]).len(), 0.35 * kNmPerMm, 10);
  EXPECT_NEAR(d.quad[1].y + d.quad[3].y, 2 * Small::at(0, 10).y, 10) << "either side of the wire";
  EXPECT_GT(d.quad[1].y, d.quad[3].y) << "TopoR's order: counter-clockwise with Y up (the board's Y is down)";
  const Shape copper = d.shape();
  for (double a = 0; a < 6.28; a += 0.1) {
    const Vec2 edge = Small::at(10, 10) + Vec2{std::cos(a), std::sin(a)} * (0.5 * kNmPerMm);
    if (std::cos(a) < 0.3) EXPECT_GE(copper.distance(edge), -1000) << "nothing behind the via or beside it: " << a;
  }
  // Off: none at a via. The wire run into a wider one: one all the same.
  s.b.settings.route.teardrops = false;
  EXPECT_TRUE(teardrops(s.b).empty());
  s.track(s.netA, 20, 10, 30, 10, 1.0);
  const auto wide = teardrops(s.b);
  ASSERT_EQ(wide.size(), 1u);
  EXPECT_EQ(wide[0].end, 1);
  EXPECT_NEAR((wide[0].quad[0] - Small::at(20, 10)).len(), 0, 1);
  EXPECT_NEAR((wide[0].quad[2] - Small::at(20 - 0.84, 10)).len(), 0, 10) << "R = 0.5 again";
}

// What it is not made at: a pad that is not round, a wire as wide as the pad nearly, a piece that begins with an
// arc, a piece that ends under the pad where the wire turns.
TEST(Teardrops, WhereNone) {
  {
    Small s;
    s.b.tracks[0].width = mmToNm(0.9);  // 2.4 (R - w/2) = 0.12: not past the via's edge
    EXPECT_TRUE(teardrops(s.b).empty());
  }
  {
    Small s;
    s.b.tracks[0].mid = Point(Small::at(15, 10.5));
    EXPECT_TRUE(teardrops(s.b).empty()) << "an arc from the via";
  }
  {
    Small s;  // the first piece 0.4 long (under the via), then a turn of 45 degrees
    s.b.tracks.clear();
    s.track(s.netA, 10, 10, 10.4, 10, 0.3);
    s.track(s.netA, 10.4, 10, 15, 14.6, 0.3);
    EXPECT_TRUE(teardrops(s.b).empty());
    s.b.tracks[1].b = Point(Small::at(20, 10));  // straight on: the tip at the joint
    const auto ds = teardrops(s.b);
    ASSERT_EQ(ds.size(), 1u);
    EXPECT_NEAR((ds[0].quad[2] - Small::at(10.4, 10)).len(), 0, 10);
    EXPECT_NEAR((ds[0].quad[1] - ds[0].quad[0]).len(), 0.7 * 0.4 * kNmPerMm, 10) << "the circle touched: 0.7 of the length";
  }
  {
    Small s;  // a square pad in the via's place
    s.b.vias.clear();
    Component c;
    c.ref = "U1";
    s.b.components.push_back(c);
    Pad p;
    p.number = "1";
    p.component = 0;
    p.net = s.netA;
    p.pos = Point(Small::at(10, 10));
    p.shape.kind = PadShapeKind::Rect;
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = LayerMask(1) << s.top;
    s.b.pads.push_back(p);
    EXPECT_TRUE(teardrops(s.b).empty());
    s.b.pads[0].shape.kind = PadShapeKind::Circle;
    EXPECT_EQ(teardrops(s.b).size(), 1u);
  }
}

// A teardrop that would come nearer another net's copper than the clearance is not made (TopoR makes it); beside
// copper that is far enough it stays.
TEST(Teardrops, NotMadeTooNearOtherCopper) {
  Small s;
  const Vec2 near = s.besideFlank(0.1 + 0.13), far = s.besideFlank(0.1 + 0.25);  // (a via 0.2 across: its edge 0.13 / 0.25 off)
  s.via(s.netB, near.x / kNmPerMm, near.y / kNmPerMm, 0.2);
  DrcOptions o;
  o.unconnected = false;
  ASSERT_EQ(runDrc(s.b, o).size(), 0u) << "clear of the via and of the wire";
  EXPECT_EQ(teardrops(s.b, true).size(), 1u);
  EXPECT_TRUE(teardrops(s.b).empty());
  s.b.vias.back().pos = Point(far);
  EXPECT_EQ(teardrops(s.b).size(), 1u);
}

// The check takes the teardrops for copper of their wires (when asked): a pour of another net lying 0.1 from one
// is a violation of its wire.
TEST(Teardrops, CountAsCopperInDrc) {
  Small s;
  const Vec2 c = s.besideFlank(0.19);  // (a square 0.1 across: its nearest corner some 0.12 off)
  Zone z;
  z.net = s.netB;
  z.layer = s.top;
  const double h = 0.05 * kNmPerMm;
  z.outline = {c + Vec2{-h, -h}, c + Vec2{h, -h}, c + Vec2{h, h}, c + Vec2{-h, h}};
  z.filled = {z.outline};
  s.b.zones.push_back(z);
  DrcOptions o;
  o.unconnected = false;
  EXPECT_EQ(runDrc(s.b, o).size(), 0u);
  o.teardrops = true;
  const auto v = runDrc(s.b, o);
  ASSERT_EQ(v.size(), 1u);
  EXPECT_EQ(v[0].type, DrcViolation::Type::Clearance);
  EXPECT_NEAR(v[0].actual, 0.124 * kNmPerMm, 0.02 * kNmPerMm);
  s.b.settings.route.teardrops = false;
  EXPECT_EQ(runDrc(s.b, o).size(), 0u);
}

// A pour of another net keeps its clearance from the teardrops.
TEST(Teardrops, AreCutOutOfAPour) {
  auto gapToDrop = [](bool on) {
    Small s;
    const Shape drop = teardrops(s.b, true).at(0).shape();
    s.b.settings.route.teardrops = on;
    Zone z;
    z.net = s.netB;
    z.layer = s.top;
    z.outline = {Small::at(1, 1), Small::at(39, 1), Small::at(39, 19), Small::at(1, 19)};
    z.removeIslands = false;
    s.b.zones.push_back(z);
    fillZones(s.b);
    double d = 1e300;
    for (const Polyline& f : s.b.zones[0].filled) d = std::min(d, Shape::polygon(f).distance(drop));
    return d;
  };
  EXPECT_GE(gapToDrop(true), 0.2 * kNmPerMm - 6000) << "the clearance (less the chords of the pour's arcs)";
  EXPECT_LT(gapToDrop(false), 0.15 * kNmPerMm) << "without the teardrop the pour comes into its place";
}

// The Gerber of a copper layer has the teardrop: a region, and its contour drawn with the wire's pen.
TEST(Teardrops, AreDrawnInGerber) {
  Small s;
  auto regions = [&] {
    size_t n = 0;
    for (auto& f : io::makeGerbers(s.b))
      if (f.name.find("Top") != std::string::npos)
        for (size_t at = f.content.find("G36*"); at != std::string::npos; at = f.content.find("G36*", at + 1)) ++n;
    return n;
  };
  EXPECT_EQ(regions(), 1u);
  s.b.settings.route.teardrops = false;
  EXPECT_EQ(regions(), 0u);
}

// The design keeps «Капельки» (Settings/Autoroute teardrops) with the rest of that tag as read, and the
// teardrops are written with their wires.
TEST(Teardrops, GoThroughTheFst) {
  const std::string path = data("topor/AMK310/AMK310_MCU_V2.fst");
  auto r = io::loadBoard(path);
  ASSERT_TRUE(r) << r.error();
  Board& b = **r;
  ASSERT_TRUE(b.settings.route.teardrops);
  ASSERT_EQ(b.settings.route.other.size(), 1u);
  EXPECT_EQ(b.settings.route.other[0], (std::pair<std::string, std::string>{"wireShape", "Arcs"}));
  auto count = [](const std::string& text, std::string_view what) {
    size_t n = 0;
    for (size_t at = text.find(what); at != std::string::npos; at = text.find(what, at + 1)) ++n;
    return n;
  };
  std::string text = io::writeFst(b);
  EXPECT_NE(text.find("<Autoroute wireShape=\"Arcs\" teardrops=\"on\"/>"), std::string::npos);
  EXPECT_EQ(count(text, "<Teardrop>"), teardrops(b).size());
  auto again = io::readFst(text, "amk.fst");
  ASSERT_TRUE(again) << again.error();
  EXPECT_EQ((*again)->settings.route, b.settings.route);
  EXPECT_EQ(teardrops(**again).size(), teardrops(b).size());
  b.settings.route.teardrops = false;
  text = io::writeFst(b);
  EXPECT_NE(text.find("<Autoroute wireShape=\"Arcs\"/>"), std::string::npos);
  EXPECT_LT(count(text, "<Teardrop>"), 110u) << "those at the wider wires only";
  // A design without the tag's attributes: TopoR's empty tag.
  Small s;
  s.b.settings.route.teardrops = false;
  EXPECT_NE(io::writeFst(s.b).find("<Autoroute/>"), std::string::npos);
}

// AMK310_MCU_V2.fst was saved by TopoR with «Капельки» on: its 528 teardrops are at the vias, the round pads and
// where a wire runs into a wider one. Ours are the same ones, point for point, but two: at (38.093, 37.951) and
// (57.143, 37.949) a wire 0.8 wide ends 0.065 and 0.038 mm from the end of a wire 3.0 wide — on the last vertex
// of a third — and TopoR widens it as if it ran into the wide one.
TEST(Teardrops, MatchTopoROnAMK310) {
  const std::string path = data("topor/AMK310/AMK310_MCU_V2.fst");
  auto r = io::loadBoard(path);
  ASSERT_TRUE(r) << r.error();
  const Board& b = **r;
  EXPECT_TRUE(b.settings.route.teardrops);
  const auto file = dropsOfFile(path);
  ASSERT_EQ(file.size(), 528u);
  const Match m = compare(b, file);
  std::println("AMK310: {} of TopoR's {} repeated, {} of ours it has not", m.same, m.file, m.extra);
  EXPECT_EQ(m.same, 526);
  EXPECT_EQ(m.extra, 0);
  // TopoR does not look at the clearance: some of its teardrops are 0.01–0.04 mm short of the design's 0.3 from the
  // copper of another net. Those we do not make, and the check finds nothing the teardrops add.
  const Match kept = compare(b, file, false);
  std::println("AMK310: {} of them clear of other nets' copper", kept.same);
  EXPECT_EQ(kept.extra, 0);
  EXPECT_LT(kept.same, m.same);
  EXPECT_GE(kept.same, 495);
  DrcOptions o;
  o.unconnected = false;
  const size_t without = runDrc(b, o).size();
  o.teardrops = true;
  EXPECT_EQ(runDrc(b, o).size(), without);
}

// With «Капельки» off TopoR still widens a wire where it runs into a wider one of its net, and nothing at the
// pads and the vias: so its examples have them.
TEST(Teardrops, OnlyAtWiderWiresWhenOff) {
  for (const char* name : {"topor/Example_04/Arcs_master_f5f7.fst", "topor/Example_04/Arcs_standard_routing.fst",
                           "topor/Example_02/Placement_standard_routing.fst"}) {
    const std::string path = data(name);
    auto r = io::loadBoard(path);
    ASSERT_TRUE(r) << r.error();
    Board& b = **r;
    EXPECT_FALSE(b.settings.route.teardrops) << name;
    const auto file = dropsOfFile(path);
    ASSERT_FALSE(file.empty()) << name;
    const Match m = compare(b, file);
    std::println("{}: {} of TopoR's {} repeated, {} of ours it has not", name, m.same, m.file, m.extra);
    EXPECT_EQ(m.same, m.file) << name;
    EXPECT_EQ(m.extra, 0) << name;
    // On: the vias and the round pads get theirs too.
    const size_t off = teardrops(b).size();
    b.settings.route.teardrops = true;
    EXPECT_GT(teardrops(b).size(), off + 100) << name;
  }
}
