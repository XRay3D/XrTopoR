#include <gtest/gtest.h>

#include <cmath>
#include <map>

#include "core/Delay.h"
#include "core/Serpents.h"
#include "drc/Drc.h"
#include "geom/Ranges.h"
#include "io/BoardIO.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

// The points of a serpent's pieces as they lie on the board.
std::vector<Vec2> drawn(const Board& b, const SerpentRun& run) {
  std::vector<Vec2> out{run.a};
  for (int ti : run.tracks) out.push_back(b.tracks[size_t(ti)].b.v());
  return out;
}

// The largest distance between the points of two paths; huge when they differ in number.
double apart(const std::vector<Vec2>& x, const std::vector<Vec2>& y) {
  if (x.size() != y.size()) return 1e18;
  double worst = 0;
  for (size_t i = 0; i < x.size(); ++i) worst = std::max(worst, (x[i] - y[i]).len());
  return worst;
}

}  // namespace

// The serpents of TopoR's own design, built anew from what the file says of them — the chord, the gap, the
// heights, the length — are the ones TopoR drew: 59 of the 60 on single wires, to the file's rounding (its
// coordinates have four decimals of a millimetre: on a chord that is askew the points come out some µm off, on
// most to less than one). The one that is
// not stands in a trapezoid whose heights differ along it: TopoR's bends grow along it by a rule the one sample
// does not give; ours are of one height, held by the trapezoid where they stand (the length is the same).
TEST(Serpent, MatchTopoROnSignals) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  const Board& b = **lb;
  ASSERT_EQ(b.serpents.size(), 61u);
  int runs = 0, same = 0, exact = 0;
  for (int s = 0; s < int(b.serpents.size()); ++s) {
    const auto run = serpentRun(b, s);
    if (!run) continue;  // (the zipped pair's: on its axis)
    ++runs;
    const Serpent& sp = b.serpents[size_t(s)];
    EXPECT_NEAR(run->drawn, sp.length, 100.0) << "serp_" << s << ": the length the file gives is that of the pieces";
    const SerpentShape shape = serpentShape(run->a, run->b, sp, run->width);
    EXPECT_NEAR(shape.length, sp.length, 50.0) << "serp_" << s;
    EXPECT_LE(shape.minLength, shape.length + 1);
    EXPECT_GE(shape.maxLength, shape.length - 1);
    const double d = apart(shape.path, drawn(b, *run));
    if (d <= 5000.0) ++same;
    exact += d <= 1000.0;
    if (d > 5000.0) std::printf("serp_%d: %zu pieces of ours, %zu of TopoR's, apart %.1f um\n", s, shape.path.size() - 1, run->tracks.size(), d > 1e17 ? -1.0 : d / 1000);
  }
  EXPECT_EQ(runs, 60);
  EXPECT_EQ(same, 59);
  EXPECT_GE(exact, 54);
}

namespace {

Serpent rect(double lengthMm, double hMm, double gapMm = 0.3) {
  Serpent s;
  s.length = lengthMm * kNmPerMm;
  s.gap = gapMm * kNmPerMm;
  s.h1 = s.h2 = s.h3 = s.h4 = hMm * kNmPerMm;
  return s;
}

// A wire of net N on one layer from (0,0): 3 mm up to the corner, then along x in pieces to 10 mm, then 3 mm down.
struct WireBoard {
  Board b;
  LayerId top;
  int net;
  std::vector<int> straight;  // the pieces along x
  WireBoard() {
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    b.layers[top].copperIndex = 0;
    net = b.addNet("N");
    auto wire = [&](double x0, double y0, double x1, double y1) {
      Track t;
      t.a = Point(Vec2{x0 * kNmPerMm, y0 * kNmPerMm});
      t.b = Point(Vec2{x1 * kNmPerMm, y1 * kNmPerMm});
      t.width = mmToNm(0.15);
      t.layer = top;
      t.net = net;
      b.tracks.push_back(t);
      return int(b.tracks.size()) - 1;
    };
    wire(0, -3, 0, 0);
    straight = {wire(0, 0, 3, 0), wire(3, 0, 6, 0), wire(6, 0, 10, 0)};
    wire(10, 0, 10, 3);
  }
  double length() const { return b.tracksLength(); }
};

}  // namespace

// The length asked for is the length made, to 50 nm, while the trapezoid has room; more than that gives the
// longest, less than the chord the chord. The bends keep within the trapezoid and stand a gap apart.
TEST(Serpent, ShapeLengths) {
  const Vec2 a{0, 0}, b{10.0 * kNmPerMm, 0};
  const Coord w = mmToNm(0.15);
  const SerpentShape full = serpentShape(a, b, rect(1000, 0.5), w);
  EXPECT_NEAR(full.minLength, 10.0 * kNmPerMm, 1);
  EXPECT_NEAR(full.length, full.maxLength, 1);
  EXPECT_GT(full.maxLength, 25.0 * kNmPerMm);
  for (double mm : {10.2, 10.5, 12.0, 15.0, 20.0, full.maxLength / kNmPerMm - 0.001}) {
    const SerpentShape s = serpentShape(a, b, rect(mm, 0.5), w);
    EXPECT_NEAR(s.length, mm * kNmPerMm, 50.0) << mm;
    EXPECT_NEAR(s.maxLength, full.maxLength, 1);
    double top = 0;
    for (Vec2 q : s.path) top = std::max(top, std::abs(q.y));
    EXPECT_LE(top, 0.5 * kNmPerMm + 1) << mm;
    // The pieces across the chord stand a gap and a width apart (centre to centre).
    std::vector<double> legs;
    for (size_t i = 0; i + 1 < s.path.size(); ++i)
      if (std::abs(s.path[i].x - s.path[i + 1].x) < 1 && std::abs(s.path[i].y - s.path[i + 1].y) > 1) legs.push_back(s.path[i].x);
    for (size_t i = 0; i + 1 < legs.size(); ++i) EXPECT_NEAR(legs[i + 1] - legs[i], 0.45 * kNmPerMm, 2) << mm;
    EXPECT_EQ(s.narrow, legs.empty()) << mm;
  }
  // Low bends are a zigzag of slanted pieces: nothing across the chord, nothing at 45°.
  const SerpentShape low = serpentShape(a, b, rect(10.2, 0.5), w);
  EXPECT_TRUE(low.narrow);
  EXPECT_FALSE(serpentShape(a, b, rect(15, 0.5), w).narrow);
  // No room (the heights nought), a length under the chord's, a chord too short for a bend: the chord itself.
  EXPECT_EQ(serpentShape(a, b, rect(15, 0), w).path.size(), 2u);
  EXPECT_EQ(serpentShape(a, b, rect(9, 0.5), w).path.size(), 2u);
  EXPECT_EQ(serpentShape(a, Vec2{0.8 * kNmPerMm, 0}, rect(5, 0.5), w).path.size(), 2u);
  // One side lower than the other: its bends stop at it, the others make the length.
  Serpent lop = rect(18, 0.5);
  lop.h2 = lop.h3 = 0.2 * kNmPerMm;
  const SerpentShape s = serpentShape(a, b, lop, w);
  EXPECT_NEAR(s.length, 18.0 * kNmPerMm, 50.0);
  double up = 0, down = 0;
  for (Vec2 q : s.path) up = std::max(up, -q.y), down = std::max(down, q.y);  // (side A is (dy, −dx): −y here)
  EXPECT_NEAR(std::min(up, down), 0.2 * kNmPerMm, 1);
  EXPECT_GT(std::max(up, down), 0.3 * kNmPerMm);
  EXPECT_GT(up, down) << "side A is the roomier one";
}

// «Преобразовать в змейку» and back: a straight fragment of several pieces becomes one serpent of the same length,
// its pieces fixed; given a length it is longer by that much and the wire is whole; «Преобразовать в проводник»
// leaves plain pieces. What is not a straight fragment of one wire is refused.
TEST(Serpent, MakeSetUnmake) {
  WireBoard w;
  Board& b = w.b;
  const double before = w.length();
  std::string why;
  EXPECT_EQ(makeSerpent(b, {0, w.straight[0]}, &why), -1) << "round the corner";
  EXPECT_FALSE(why.empty());
  EXPECT_EQ(makeSerpent(b, {w.straight[0], w.straight[2]}, &why), -1) << "not one after another";
  EXPECT_EQ(b.serpents.size(), 0u);
  const int s = makeSerpent(b, w.straight, &why);
  ASSERT_EQ(s, 0) << why;
  ASSERT_EQ(b.tracks.size(), 3u);
  EXPECT_NEAR(w.length(), before, 1);
  auto run = serpentRun(b, s);
  ASSERT_TRUE(run);
  EXPECT_EQ(run->tracks.size(), 1u);
  EXPECT_NEAR((run->b - run->a).len(), 10.0 * kNmPerMm, 1);
  EXPECT_TRUE(b.tracks[size_t(run->tracks[0])].locked);
  EXPECT_NEAR(b.serpents[0].gap, 0.3 * kNmPerMm, 1) << "two widths of the wire";
  EXPECT_EQ(makeSerpent(b, run->tracks, &why), -1) << "a serpent already";
  // Longer by 4 mm.
  Serpent want = b.serpents[0];
  want.length = 14.0 * kNmPerMm;
  ASSERT_TRUE(setSerpent(b, s, want));
  run = serpentRun(b, s);
  ASSERT_TRUE(run);
  EXPECT_GT(run->tracks.size(), 20u);
  EXPECT_NEAR(run->drawn, 14.0 * kNmPerMm, 50.0 + double(run->tracks.size()));  // (the points are whole nm)
  EXPECT_NEAR(w.length(), before + 4.0 * kNmPerMm, 50.0 + double(run->tracks.size()));
  for (int ti : run->tracks) EXPECT_TRUE(b.tracks[size_t(ti)].locked && b.tracks[size_t(ti)].net == w.net);
  // The wire is whole: every end meets another or is the wire's own.
  auto loose = [&] {
    int n = 0;
    for (const Track& t : b.tracks)
      for (Vec2 q : {t.a.v(), t.b.v()}) {
        int met = 0;
        for (const Track& o : b.tracks) met += (o.a.v() - q).len() <= 2 || (o.b.v() - q).len() <= 2;
        n += met < 2;
      }
    return n;
  };
  EXPECT_EQ(loose(), 2) << "the two ends of the wire";
  // Back to the chord, then to a plain wire.
  want.length = 0;
  ASSERT_TRUE(setSerpent(b, s, want));
  EXPECT_EQ(b.tracks.size(), 3u);
  EXPECT_NEAR(w.length(), before, 1);
  want.length = 12.0 * kNmPerMm;
  ASSERT_TRUE(setSerpent(b, s, want));
  const size_t pieces = b.tracks.size();
  unmakeSerpent(b, s);
  EXPECT_TRUE(b.serpents.empty());
  EXPECT_EQ(b.tracks.size(), pieces);
  for (const Track& t : b.tracks) EXPECT_TRUE(t.serp < 0 && !t.locked);
  EXPECT_EQ(loose(), 2);
}

// A serpent's end moved along its line: inward it leaves a plain piece behind, outward it takes the plain piece
// back; past the corner it does not go. A serpent taken away renumbers the others.
TEST(Serpent, EndsMoveAlongTheLine) {
  WireBoard w;
  Board& b = w.b;
  const int s = makeSerpent(b, w.straight);
  ASSERT_EQ(s, 0);
  Serpent want = b.serpents[0];
  want.length = 9.0 * kNmPerMm;
  const Vec2 a2{2.0 * kNmPerMm, 0}, b2{8.0 * kNmPerMm, 0};
  ASSERT_TRUE(setSerpent(b, s, want, &a2, &b2));
  auto run = serpentRun(b, s);
  ASSERT_TRUE(run);
  EXPECT_NEAR((run->a - a2).len(), 0, 1);
  EXPECT_NEAR((run->b - b2).len(), 0, 1);
  EXPECT_NEAR(run->drawn, 9.0 * kNmPerMm, 100);
  int plain = 0;
  for (const Track& t : b.tracks) plain += t.serp < 0 && std::abs(t.a.v().y) < 1 && std::abs(t.b.v().y) < 1 && !t.locked;
  EXPECT_EQ(plain, 2) << "a plain piece either side";
  EXPECT_NEAR(w.length(), 6.0 * kNmPerMm + 9.0 * kNmPerMm + 2.0 * kNmPerMm + 2.0 * kNmPerMm, 200);
  // Outward again, to the corners: the plain pieces are gone.
  const Vec2 a0{0, 0}, b0{10.0 * kNmPerMm, 0};
  ASSERT_TRUE(setSerpent(b, s, want, &a0, &b0));
  for (const Track& t : b.tracks) EXPECT_TRUE(t.serp >= 0 || std::abs(t.a.v().x - t.b.v().x) < 1) << "only the serpent and the two legs";
  // Past the corner: refused, nothing changed.
  const std::vector<Track> tracks = b.tracks;
  const Vec2 beyond{-1.0 * kNmPerMm, 0};
  EXPECT_FALSE(setSerpent(b, s, want, &beyond, nullptr));
  ASSERT_EQ(b.tracks.size(), tracks.size());
  for (size_t i = 0; i < tracks.size(); ++i) EXPECT_TRUE(b.tracks[i].a == tracks[i].a && b.tracks[i].b == tracks[i].b);
  // A second serpent on the first leg; the first taken away: the second is serpent 0 now.
  const int leg = int(r::find_if(b.tracks, [](const Track& t) { return t.serp < 0 && t.a.v().y < -1; }) - b.tracks.begin());
  ASSERT_LT(leg, int(b.tracks.size()));
  const int s2 = makeSerpent(b, {leg});
  ASSERT_EQ(s2, 1);
  unmakeSerpent(b, s);
  ASSERT_EQ(b.serpents.size(), 1u);
  ASSERT_TRUE(serpentRun(b, 0));
  EXPECT_NEAR(serpentRun(b, 0)->a.x, 0, 1);
}

// TopoR's serpents written and read again are the same serpents: the file's parameters still give the pieces
// drawn (a wire written from its other end has the heights told from that end).
TEST(Serpent, GoesThroughTheFst) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  Board& b = **lb;
  // One of ours among them: the first long plain straight piece.
  int piece = -1;
  for (int ti = 0; ti < int(b.tracks.size()) && piece < 0; ++ti) {
    const Track& t = b.tracks[size_t(ti)];
    if (!t.isArc() && t.serp < 0 && t.zip < 0 && !t.locked && t.length() > 3.0 * kNmPerMm) piece = ti;
  }
  ASSERT_GE(piece, 0);
  const int ours = makeSerpent(b, {piece});
  ASSERT_EQ(ours, 61);
  Serpent want = b.serpents[size_t(ours)];
  want.length *= 1.3;
  want.h2 = want.h3 = want.h1 * 0.5;  // (lopsided: the sides must come back as they are)
  ASSERT_TRUE(setSerpent(b, ours, want));
  const std::string path = testing::TempDir() + "/serpents.fst";
  ASSERT_TRUE(io::saveBoard(b, path));
  auto back = io::loadBoard(path);
  ASSERT_TRUE(back) << back.error();
  const Board& c = **back;
  ASSERT_EQ(c.serpents.size(), 62u);
  int same = 0, runs = 0;
  for (int s = 0; s < int(c.serpents.size()); ++s) {
    const auto run = serpentRun(c, s);
    if (!run) continue;
    ++runs;
    same += apart(serpentShape(run->a, run->b, c.serpents[size_t(s)], run->width).path, drawn(c, *run)) <= 5000.0;
  }
  EXPECT_EQ(runs, 61);
  EXPECT_EQ(same, 60) << "TopoR's 59 and ours";
}

// What the copper of a serpent's bends meets is told by TopoR's numbers: a wire of another net (5042), a fixed
// one (5049), a pad (5043), a via (5045), a routing keepout (5050), a copper area (5051), the board's outline
// (5052), another serpent (5053). TopoR's own design has none of them; a serpent that is still straight, or whose
// bends keep clear, meets nothing though its trapezoid lies over the things.
TEST(Serpent, ConflictsOfTheBends) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  EXPECT_TRUE(serpentConflicts(**lb).empty());

  WireBoard w;
  Board& b = w.b;
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(-5, -5), at(15, -5), at(15, 5), at(-5, 5)});
  const int s = makeSerpent(b, w.straight);
  ASSERT_EQ(s, 0);
  auto codes = [&] {
    std::vector<int> out;
    for (const SerpentConflict& c : serpentConflicts(b)) out.push_back(c.code);
    r::sort(out);
    return out;
  };
  const int other = b.addNet("O");
  auto wire = [&](double x0, double y0, double x1, double y1, bool fixed) {
    Track t;
    t.a = Point(at(x0, y0));
    t.b = Point(at(x1, y1));
    t.width = mmToNm(0.15);
    t.layer = w.top;
    t.net = other;
    t.locked = fixed;
    b.tracks.push_back(t);
  };
  // Things half a millimetre off the chord, within the trapezoid (0.9 mm either side): the straight serpent is
  // clear of them.
  wire(2, 0.5, 4, 0.5, false);
  wire(5, -0.5, 6, -0.5, true);
  wire(2, 2, 4, 2, false);  // (outside the trapezoid)
  Via v;
  v.pos = Point(at(7, 0.6));
  v.diameter = mmToNm(0.6);
  v.drill = mmToNm(0.3);
  v.layers = LayerMask(1) << w.top;
  v.net = other;
  b.vias.push_back(v);
  Component c;
  c.ref = "U1";
  b.components.push_back(c);
  Pad p;
  p.number = "1";
  p.component = 0;
  p.net = other;
  p.pos = Point(at(8.5, -0.7));
  p.shape.kind = PadShapeKind::Rect;
  p.shape.w = p.shape.h = mmToNm(0.5);
  p.copper = LayerMask(1) << w.top;
  b.components[0].pads.push_back(0);
  b.pads.push_back(p);
  EXPECT_TRUE(codes().empty());
  // Bends of 0.3 mm keep clear of them still; as high as the trapezoid lets them, they meet all four.
  Serpent sp = b.serpents[0];
  const double full = serpentShape(at(0, 0), at(10, 0), sp, mmToNm(0.15)).maxLength;
  sp.h1 = sp.h2 = sp.h3 = sp.h4 = 0.2 * kNmPerMm;
  sp.length = full;
  ASSERT_TRUE(setSerpent(b, s, sp));
  EXPECT_TRUE(codes().empty());
  sp.h1 = sp.h2 = sp.h3 = sp.h4 = 0.9 * kNmPerMm;
  ASSERT_TRUE(setSerpent(b, s, sp));
  EXPECT_EQ(codes(), (std::vector<int>{5042, 5043, 5045, 5049}));
  for (const SerpentConflict& x : serpentConflicts(b)) {
    EXPECT_EQ(x.serp, 0);
    EXPECT_EQ(x.net, w.net);
    EXPECT_EQ(x.otherNet, other);
    EXPECT_GE(x.other.index, 0);
  }
  // The outline drawn closer than the bends reach.
  b.outline[0] = {at(-5, -0.5), at(15, -0.5), at(15, 5), at(-5, 5)};
  EXPECT_EQ(r::count(codes(), 5052), 1);
  b.outline[0] = {at(-5, -5), at(15, -5), at(15, 5), at(-5, 5)};
  // Another serpent whose bends cross this one's.
  Track t;
  t.a = Point(at(1, 1.2));
  t.b = Point(at(9, 1.2));
  t.width = mmToNm(0.15);
  t.layer = w.top;
  t.net = other;
  b.tracks.push_back(t);
  const int s2 = makeSerpent(b, {int(b.tracks.size()) - 1});
  ASSERT_EQ(s2, 1);
  EXPECT_EQ(r::count(codes(), 5053), 0) << "straight yet";
  Serpent sp2 = b.serpents[1];
  sp2.length = 1e12;
  ASSERT_TRUE(setSerpent(b, s2, sp2));
  const auto all = serpentConflicts(b);
  EXPECT_EQ(r::count(all, 5053, &SerpentConflict::code), 1) << "once for the two";
}

// «Создать змейки» on TopoR's own design with its serpents taken out: the delay rules, broken by that, are kept
// again by serpents of ours; nothing of them meets other copper, the board has no more violations than it had.
TEST(Serpent, AutoEqualisesSignals) {
  auto lb = io::loadBoard(data("topor/Example_06/Signals.fst"));
  ASSERT_TRUE(lb) << lb.error();
  Board& b = **lb;
  ASSERT_TRUE(checkDelays(b).empty()) << "as TopoR matched it";
  const size_t violations = runDrc(b, {}).size();
  const double length = b.tracksLength();
  // Every serpent of a single wire straightened and made a plain piece (the zipped pair's stays).
  for (int s = int(b.serpents.size()) - 1; s >= 0; --s) {
    if (!serpentRun(b, s)) continue;
    Serpent flat = b.serpents[size_t(s)];
    flat.length = 0;
    ASSERT_TRUE(setSerpent(b, s, flat));
    unmakeSerpent(b, s);
  }
  ASSERT_EQ(b.serpents.size(), 1u);
  const size_t broken = checkDelays(b).size();
  EXPECT_GT(broken, 0u);
  const double straight = b.tracksLength();
  EXPECT_LT(straight, length - 100.0 * kNmPerMm);
  const AutoSerpents made = autoSerpents(b);
  EXPECT_GT(made.made, 10);
  EXPECT_EQ(made.left, int(checkDelays(b).size()));
  EXPECT_EQ(made.left, 0);
  EXPECT_TRUE(serpentConflicts(b).empty());
  EXPECT_LE(runDrc(b, {}).size(), violations);
  // Done again: nothing to do.
  const AutoSerpents again = autoSerpents(b);
  EXPECT_EQ(again.made + again.raised, 0);
}
