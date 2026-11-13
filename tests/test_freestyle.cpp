#include <gtest/gtest.h>

#include <chrono>
#include <cstdlib>
#include <print>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "router/topo/Freestyle.h"
#include "router/topo/ModelTools.h"
#include "topo/Topology.h"

using namespace xr;

namespace {

std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

int conflicts(const Board& b) {
  DrcOptions o;
  o.unconnected = false;
  o.widths = false;
  return int(runDrc(b, o).size());
}

// A component of the board with wires on its pads, not locked.
int routedComponent(const Board& b, int skip = 0) {
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    if (b.components[ci].locked || b.components[ci].pads.size() < 2) continue;
    for (int pi : b.components[ci].pads)
      for (auto& t : b.tracks)
        if (t.net == b.pads[pi].net && b.pads[pi].shapeGeom().contains(t.a.v()) && skip-- == 0) return ci;
  }
  return -1;
}

// The board's model, and whether it is still the board's after a Freestyle move: the invariants hold, every pad's
// and via's owner stands where the board has it.
// ... the board's shapes computed first (F5): Freestyle computes them with its first move, and what the moves do to
// the board's conflicts is counted against that.
topo::Topology modelOf(Board& b) {
  topo::Topology::assignIds(b);
  topo::Topology m;
  m.build(b);
  topo::runF5Model(b, m, {});
  return m;
}
void expectModelOfBoard(const Board& b, const topo::Topology& m) {
  EXPECT_EQ(m.check(), std::vector<std::string>{});
  for (size_t pi = 0; pi < b.pads.size() && pi < m.padOwner.size(); ++pi) {
    if (m.padOwner[pi] < 0 || !b.pads[pi].copper) continue;
    const topo::Owner& o = m.owners[size_t(m.padOwner[pi])];
    if (o.layers == 0) continue;
    EXPECT_LT((o.shape.center() - b.pads[pi].shapeGeom().center()).len(), 3.0) << "pad " << pi << " of " << b.components[size_t(b.pads[pi].component)].ref;
  }
  for (size_t vi = 0; vi < b.vias.size() && vi < m.viaOwner.size(); ++vi)
    if (m.viaOwner[vi] >= 0) {
      EXPECT_LT((m.owners[size_t(m.viaOwner[vi])].c - b.vias[vi].pos.v()).len(), 1.0) << "via " << vi;
    }
}
// The lines of the connections not made, by their nets (a wire torn off a pad adds one).
std::vector<int> unroutedNets(const Board& b) {
  std::vector<int> out;
  for (const RatsLine& l : Connectivity::compute(b).ratsnest) out.push_back(l.net);
  r::sort(out);
  return out;
}

}  // namespace

// Moved in Freestyle, a component keeps all its connections and its wires get their shape again.
TEST(Freestyle, MoveKeepsRoutingWhole) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb);
  Board& b = **lb;
  topo::Topology m = modelOf(b);
  const auto unrouted = unroutedNets(b);
  int ci = routedComponent(b);
  ASSERT_GE(ci, 0);
  topo::FreestyleTarget t;
  t.fragment.components = {ci};
  Vec2 pos = b.components[ci].pos.v();
  const double angle = b.components[ci].angle;
  auto r = topo::freestyle(b, m, t, {1.0 * kNmPerMm, 0.5 * kNmPerMm}, 0, pos, topo::Push::None);
  EXPECT_FALSE(r.blocked);
  EXPECT_NEAR(r.moved.x, 1.0 * kNmPerMm, 1);
  EXPECT_NEAR(b.components[ci].pos.x, pos.x + 1.0 * kNmPerMm, 1);
  EXPECT_NEAR(b.components[ci].pos.y, pos.y + 0.5 * kNmPerMm, 1);
  EXPECT_EQ(unroutedNets(b), unrouted);
  expectModelOfBoard(b, m);
  // ... and turned: as far as the mesh lets it, the board's component by as much.
  r = topo::freestyle(b, m, t, {}, 90, b.components[ci].pos.v(), topo::Push::None);
  EXPECT_GT(r.turned, 0);
  EXPECT_NEAR(std::fmod(b.components[ci].angle - angle + 720, 360), r.turned, 1e-5);
  if (!r.blocked) {
    EXPECT_NEAR(r.turned, 90, 1e-9);
  }
  EXPECT_EQ(unroutedNets(b), unrouted);
  expectModelOfBoard(b, m);
}

// A component dragged far, into whatever stands in its way, stops whole: its pads go together, so no wire is torn
// off a pad (each pad an owner moved by itself, the first one the mesh stopped left the others ahead of it).
TEST(Freestyle, AStoppedComponentKeepsItsWires) {
  for (topo::Push push : {topo::Push::None, topo::Push::Vias, topo::Push::ViasAndComponents}) {
    auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
    ASSERT_TRUE(lb);
    Board& b = **lb;
    topo::Topology m = modelOf(b);
    const auto unrouted = unroutedNets(b);
    const int c0 = conflicts(b);
    int stopped = 0, went = 0;
    for (int k = 0; k < 6; ++k) {
      const int ci = routedComponent(b, 7 * k);
      if (ci < 0) break;
      topo::FreestyleTarget t;
      t.fragment.components = {ci};
      const Vec2 pos = b.components[ci].pos.v();
      // Dragged as the mouse drags: many short moves, 12 mm in all.
      const Vec2 dir = Vec2{k % 2 ? 1.0 : -1.0, k % 3 ? 0.4 : -0.7}.normalized();
      Vec2 moved;
      bool blocked = false;
      for (int i = 0; i < 40; ++i) {
        const auto r = topo::freestyle(b, m, t, dir * (0.3 * kNmPerMm), 0, pos, push);
        moved += r.moved;
        blocked |= r.blocked;
      }
      stopped += blocked;
      went += moved.len() > 0.5 * kNmPerMm;
      EXPECT_LT((b.components[ci].pos.v() - (pos + moved)).len(), 2.0) << "component " << b.components[ci].ref;
      EXPECT_EQ(unroutedNets(b), unrouted) << "component " << b.components[ci].ref << ", push " << int(push);
      expectModelOfBoard(b, m);
      if (std::getenv("XR_FS_DEBUG")) {
        DrcOptions o;
        o.unconnected = false;
        o.widths = false;
        std::println("  {} moved ({:.3f}, {:.3f}) from ({:.3f}, {:.3f}), blocked {}: conflicts {}", b.components[ci].ref, moved.x / 1e6, moved.y / 1e6, pos.x / 1e6, pos.y / 1e6, blocked, conflicts(b));
        if (push != topo::Push::None)
          for (const DrcViolation& v : runDrc(b, o))
            if (v.required - v.actual > 10000)
            {
              std::println("    {} at ({:.3f}, {:.3f}) L{}: {:.1f} of {:.1f} um, {} {} - {} {}", int(v.type), v.pos.x / 1e6, v.pos.y / 1e6, int(v.layer), v.actual / 1e3, v.required / 1e3, int(v.a.type),
                           v.a.index, int(v.b.type), v.b.index);
              for (ItemRef ref : {v.a, v.b}) {
                if (ref.type != ItemType::Track) continue;
                const Track& tr = b.tracks[size_t(ref.index)];
                for (size_t wi = 0; wi < m.wires.size(); ++wi)
                  if (r::contains(m.wires[wi].tracks, tr.id)) {
                    const topo::Wire& w = m.wires[wi];
                    const topo::Owner& A = m.owners[size_t(w.end[0])];
                    const topo::Owner& B = m.owners[size_t(w.end[1])];
                    std::println("      track {} net {} ({:.3f}, {:.3f})-({:.3f}, {:.3f}): wire {} of {} crossings, ends kind {} at ({:.3f}, {:.3f}) and kind {} at ({:.3f}, {:.3f})", ref.index, tr.net,
                                 tr.a.x / 1e6, tr.a.y / 1e6, tr.b.x / 1e6, tr.b.y / 1e6, wi, w.cross.size(), int(A.kind), A.c.x / 1e6, A.c.y / 1e6, int(B.kind), B.c.x / 1e6, B.c.y / 1e6);
                  }
              }
            }
      }
    }
    std::println("push {}: {} components dragged 12 mm went on, {} were stopped; conflicts {} -> {}", int(push), went, stopped, c0, conflicts(b));
    EXPECT_GT(went, 0);
    if (push != topo::Push::None) {
      EXPECT_LE(conflicts(b), c0);
    }
  }
}

// With pushing, a via dragged into another via moves it out of the way; no new conflicts appear.
TEST(Freestyle, PushedViaGivesWay) {
  auto lb = io::loadBoard(data("topor/Example_05/MinVia_standard_routing.fst"));
  ASSERT_TRUE(lb);
  Board& b = **lb;
  ASSERT_GE(b.vias.size(), 2u);
  // Two unlocked vias of different nets close to each other.
  int va = -1, vb = -1;
  double best = 1e18;
  for (int i = 0; i < int(b.vias.size()); ++i)
    for (int j = 0; j < int(b.vias.size()); ++j)
      if (i != j && b.vias[i].net != b.vias[j].net && !b.vias[i].locked && !b.vias[j].locked) {
        double d = (b.vias[i].pos.v() - b.vias[j].pos.v()).len();
        if (d < best) {
          best = d;
          va = i;
          vb = j;
        }
      }
  ASSERT_GE(va, 0);
  topo::Topology m = modelOf(b);
  const auto unrouted = unroutedNets(b);
  int c0 = conflicts(b);
  Vec2 a0 = b.vias[va].pos.v(), b0 = b.vias[vb].pos.v();
  Vec2 dir = (b0 - a0).normalized();
  topo::FreestyleTarget t;
  t.fragment.vias = {va};
  auto r = topo::freestyle(b, m, t, dir * (best * 0.7), 0, a0, topo::Push::Vias);
  EXPECT_GT(r.moved.len(), 0);
  EXPECT_LE(conflicts(b), c0);
  if (std::getenv("XR_FS_DEBUG")) {
    std::println("via {} at ({:.3f}, {:.3f}) -> ({:.3f}, {:.3f}), other ({:.3f}, {:.3f}) -> ({:.3f}, {:.3f}), blocked {}", va, a0.x / 1e6, a0.y / 1e6, b.vias[va].pos.x / 1e6, b.vias[va].pos.y / 1e6,
                 b0.x / 1e6, b0.y / 1e6, b.vias[vb].pos.x / 1e6, b.vias[vb].pos.y / 1e6, r.blocked);
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    for (const DrcViolation& v : runDrc(b, o))
      std::println("  {} at ({:.3f}, {:.3f}) L{}: {:.1f} of {:.1f} um, {} {} - {} {}", int(v.type), v.pos.x / 1e6, v.pos.y / 1e6, int(v.layer), v.actual / 1e3, v.required / 1e3, int(v.a.type), v.a.index,
                   int(v.b.type), v.b.index);
  }
  EXPECT_EQ(unroutedNets(b), unrouted);
  expectModelOfBoard(b, m);
  if (!r.blocked) {
    EXPECT_GT((b.vias[vb].pos.v() - b0).len(), 0);  // the other via was pushed
  }
}

// Two vias with wires to pads: the via dragged into the other pushes it ahead.
TEST(Freestyle, ViaPushesVia) {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  LayerId bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  b.layers[top].copperIndex = 0;
  b.layers[bot].copperIndex = 1;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(40, 0), mm(40, 30), mm(0, 30)});
  int na = b.addNet("A"), nb = b.addNet("B");
  auto pad = [&](Vec2 at, int net) {
    Component c;
    c.ref = "P" + std::to_string(b.components.size());
    c.pos = Point(at);
    Pad p;
    p.component = int(b.components.size());
    p.net = net;
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = b.allCopperMask();
    p.drill = mmToNm(0.5);
    c.pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
    b.components.push_back(c);
    b.updatePadPositions(int(b.components.size()) - 1);
  };
  auto via = [&](Vec2 at, int net) {
    Via v;
    v.pos = Point(at);
    v.net = net;
    v.diameter = mmToNm(0.6);
    v.drill = mmToNm(0.3);
    v.layers = b.allCopperMask();
    b.vias.push_back(v);
  };
  auto track = [&](Vec2 a, Vec2 c, int net) {
    Track t;
    t.a = Point(a);
    t.b = Point(c);
    t.width = mmToNm(0.25);
    t.net = net;
    t.layer = top;
    b.tracks.push_back(t);
  };
  pad(mm(5, 15), na);
  pad(mm(35, 15), nb);
  via(mm(18, 15), na);
  via(mm(19.2, 15), nb);
  track(mm(5, 15), mm(18, 15), na);
  track(mm(19.2, 15), mm(35, 15), nb);
  ASSERT_EQ(conflicts(b), 0);
  topo::Topology m = modelOf(b);
  topo::FreestyleTarget t;
  t.fragment.vias = {0};
  auto r = topo::freestyle(b, m, t, mm(1.0, 0), 0, mm(18, 15), topo::Push::Vias);
  EXPECT_FALSE(r.blocked);
  EXPECT_NEAR(b.vias[0].pos.x, 19 * kNmPerMm, 1);
  EXPECT_GE(b.vias[1].pos.x, 19.8 * kNmPerMm);  // pushed to the clearance (0.2 mm) ahead
  EXPECT_EQ(conflicts(b), 0);
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  expectModelOfBoard(b, m);
  // Without pushing the other via stands, and the dragged one does not pass through it: it stops before it, the
  // clearance not kept (TopoR: «без соблюдения зазоров»), both wires whole.
  topo::FreestyleTarget t2;
  t2.fragment.vias = {0};
  Vec2 other = b.vias[1].pos.v();
  r = topo::freestyle(b, m, t2, mm(3.0, 0), 0, b.vias[0].pos.v(), topo::Push::None);
  EXPECT_TRUE(r.blocked);
  EXPECT_EQ(b.vias[1].pos.v(), other);
  EXPECT_LT(b.vias[0].pos.x, other.x);
  EXPECT_GT(b.vias[0].pos.x, other.x - 0.6 * kNmPerMm);  // (inside the rule: nearer than diameter + clearance)
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), 0u);
  expectModelOfBoard(b, m);
}

// By hand, on a board of one's own: XR_FS_BOARD=file XR_FS_REF=DD3 [XR_FS_DX=3 XR_FS_DY=0] — the component dragged
// by 0.2 mm moves in each of the three modes; what moved, the connections, the conflicts, the time of a move.
TEST(Freestyle, OnABoardOfOnesOwn) {
  const char* file = std::getenv("XR_FS_BOARD");
  if (!file) GTEST_SKIP() << "XR_FS_BOARD is not set";
  const std::string ref = std::getenv("XR_FS_REF") ? std::getenv("XR_FS_REF") : "";
  const double dx = std::getenv("XR_FS_DX") ? std::atof(std::getenv("XR_FS_DX")) : 3, dy = std::getenv("XR_FS_DY") ? std::atof(std::getenv("XR_FS_DY")) : 0;
  for (topo::Push push : {topo::Push::None, topo::Push::Vias, topo::Push::ViasAndComponents}) {
    if (const char* only = std::getenv("XR_FS_PUSH"); only && std::atoi(only) != int(push)) continue;
    auto lb = io::loadBoard(file);
    ASSERT_TRUE(lb);
    Board& b = **lb;
    topo::Topology m = modelOf(b);
    int ci = -1;
    for (int c = 0; c < int(b.components.size()); ++c)
      if (b.components[size_t(c)].ref == ref) ci = c;
    ASSERT_GE(ci, 0) << "no component " << ref;
    const auto unrouted = unroutedNets(b);
    const int c0 = conflicts(b);
    topo::FreestyleTarget t;
    t.fragment.components = {ci};
    const Vec2 pos = b.components[size_t(ci)].pos.v(), whole{dx * kNmPerMm, dy * kNmPerMm};
    const int moves = std::max(1, int(whole.len() / (0.2 * kNmPerMm)));
    Vec2 moved;
    int blocked = 0;
    const auto t0 = std::chrono::steady_clock::now();
    for (int i = 0; i < moves; ++i) {
      const auto r = topo::freestyle(b, m, t, pos + whole * (double(i + 1) / moves) - (pos + moved), 0, pos, push);
      moved += r.moved;
      blocked += r.blocked;
    }
    const double ms = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - t0).count() / moves;
    const auto after = unroutedNets(b);
    std::println("push {}: {} moved ({:.3f}, {:.3f}) of ({:.3f}, {:.3f}) mm, {} of {} moves stopped, {:.1f} ms a move; unrouted {} -> {}, conflicts {} -> {}", int(push), ref, moved.x / 1e6,
                 moved.y / 1e6, dx, dy, blocked, moves, ms, unrouted.size(), after.size(), c0, conflicts(b));
    EXPECT_EQ(after, unrouted);
    expectModelOfBoard(b, m);
    if (const char* out = std::getenv("XR_FS_OUT")) {
      EXPECT_TRUE(io::saveBoard(b, std::string(out) + "_push" + std::to_string(int(push)) + ".fst"));
    }
  }
}
