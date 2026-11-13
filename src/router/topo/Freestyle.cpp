#include "router/topo/Freestyle.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <format>
#include <map>
#include <print>
#include <set>

#include "core/Edit.h"
#include "drc/Drc.h"
#include "router/topo/ModelRelax.h"
#include "router/topo/ModelTools.h"
#include "router/topo/OwnerPush.h"
#include "topo/Capacity.h"
#include "topo/Move.h"

namespace xr::topo {

struct FreestyleState {
  std::shared_ptr<ModelDrawing> drawing;
  std::optional<std::vector<Place>> places;
};

namespace {

constexpr int kPushRounds = 12;
constexpr double kTurnStep = 5;     // degrees per step
constexpr double kSlack = 1000;     // nm: a shortfall below this is none
constexpr double kPushOver = 2000;  // nm: what is pushed goes this much past the rule
constexpr double kOwnPoint = 5000;  // nm: a branch point is kept this far out of the copper of its net that moves at it

// Steps short enough that a moved object never jumps over a wire it should push or bend.
double stepLength(const Board& b) {
  double c = std::numeric_limits<double>::max();
  for (auto& nc : b.netClasses) c = std::min(c, double(nc.clearance));
  return std::clamp(0.5 * c, 0.05 * kNmPerMm, 0.25 * kNmPerMm);
}

// The board's turn that takes v0 to v1, degrees (rotateBoard's sign).
double boardTurn(Vec2 v0, Vec2 v1) { return -radToDeg(std::atan2(v0.x * v1.y - v0.y * v1.x, v0.dot(v1))); }

// One call's work: the bodies that move — the target, and what it pushes —, the steps, the way back.
struct Drag {
  Board& b;
  Topology& t;
  FreestyleTarget& tg;
  Push push;
  double maxClr;
  OwnerGrid grid;
  std::vector<std::vector<int>> bodies;  // owners that go as one; 0: the target
  std::vector<int> bodyOf;               // per owner: its body; -1: not asked yet; -2: it stands (cannot give way)
  std::vector<int> ownerVia, ownerPad;   // owner -> the board's via, pad
  std::vector<char> lockedAt;            // per owner: a fixed wire ends there
  std::vector<char> movedBody;           // per body: moved in this call
  std::map<std::pair<int, int>, double> allowed;  // (owner, the other or -1 for a wall): how short they stood before the step

  struct Need {
    int other;       // the owner that is too near; negative: a wall, a wire along an edge (-1 - the edge)
    Vec2 push;       // what would take it off
    double deficit;  // how much is missing
  };
  struct Did {
    int body;
    Vec2 shift;
    double turn;
    Vec2 pivot;
  };

  Drag(Board& board, Topology& model, FreestyleTarget& target, Push p) : b(board), t(model), tg(target), push(p), maxClr(double(board.maxClearance())) {
    bodyOf.assign(t.owners.size(), -1);
    ownerVia.assign(t.owners.size(), -1);
    ownerPad.assign(t.owners.size(), -1);
    lockedAt.assign(t.owners.size(), 0);
    for (int vi = 0; vi < int(t.viaOwner.size()) && vi < int(b.vias.size()); ++vi)
      if (t.viaOwner[size_t(vi)] >= 0) ownerVia[size_t(t.viaOwner[size_t(vi)])] = vi;
    for (int pi = 0; pi < int(t.padOwner.size()) && pi < int(b.pads.size()); ++pi)
      if (t.padOwner[size_t(pi)] >= 0) ownerPad[size_t(t.padOwner[size_t(pi)])] = pi;
    for (const Wire& w : t.wires)
      if (w.locked)
        for (int e : w.end)
          if (e >= 0) lockedAt[size_t(e)] = 1;
  }

  std::vector<int> padsOf(int ci) const {
    std::vector<int> out;
    for (int pi : b.components[size_t(ci)].pads)
      if (pi >= 0 && pi < int(t.padOwner.size()) && t.padOwner[size_t(pi)] >= 0) out.push_back(t.padOwner[size_t(pi)]);
    return out;
  }
  int addBody(std::vector<int> owners) {
    const int id = int(bodies.size());
    for (int o : owners) bodyOf[size_t(o)] = id;
    bodies.push_back(std::move(owners));
    movedBody.push_back(0);
    return id;
  }
  // The body an owner would move with when pushed; -2: it does not give way.
  int bodyFor(int o) {
    if (bodyOf[size_t(o)] != -1) return bodyOf[size_t(o)];
    const Owner& O = t.owners[size_t(o)];
    std::vector<int> owners{o};
    // (Without pushing only the branch points give way, to the copper of their own net: needsOf.)
    bool gives = (push != Push::None || O.kind == Owner::Kind::Junction) && !O.locked;
    if (O.kind == Owner::Kind::Via) {
      gives = gives && !b.flexFixed(O.net);  // a flexibly fixed net keeps its vias
    } else if (O.kind == Owner::Kind::Pad && ownerPad[size_t(o)] >= 0 && b.pads[size_t(ownerPad[size_t(o)])].component >= 0) {
      const int ci = b.pads[size_t(ownerPad[size_t(o)])].component;
      owners = padsOf(ci);
      gives = gives && push == Push::ViasAndComponents && !b.components[size_t(ci)].locked;
    } else if (O.kind != Owner::Kind::Junction) {
      gives = false;
    }
    // (A fixed wire is not drawn again: its end would stay behind the object.)
    gives = gives && r::none_of(owners, [&](int x) { return lockedAt[size_t(x)] || bodyOf[size_t(x)] >= 0; });
    if (!gives) {
      if (static const bool debug = std::getenv("XR_FS_DEBUG") != nullptr; debug)
        std::println(stderr, "  freestyle: owner {} kind {} net {} at ({:.3f}, {:.3f}) does not give way: locked {}, a fixed wire {}, pad {}", o, int(O.kind), O.net, O.c.x / 1e6, O.c.y / 1e6,
                     O.locked, r::any_of(owners, [&](int x) { return lockedAt[size_t(x)] != 0; }), ownerPad[size_t(o)]);
      for (int x : owners)
        if (bodyOf[size_t(x)] == -1) bodyOf[size_t(x)] = -2;
      return bodyOf[size_t(o)];
    }
    return addBody(std::move(owners));
  }
  bool together(int a, int o) const { return bodyOf[size_t(a)] >= 0 && bodyOf[size_t(a)] == bodyOf[size_t(o)]; }

  // What owner `a` is too close to as it stands: copper of other nets nearer than the rule, an owner across an
  // edge whose wires are short of room, the outline.
  // `ahead`: as it would stand shifted by that — its copper alone (the room of the edges is known when it is there).
  void needsOf(int a, std::vector<Need>& out, Vec2 ahead = {}) const {
    const Owner& A = t.owners[size_t(a)];
    if (A.layers == 0) return;
    Shape shape = A.shape;
    if (ahead.len2() > 0) {
      shape.a = shape.a + ahead;
      shape.b = shape.b + ahead;
      for (Vec2& p : shape.poly) p = p + ahead;
    }
    const BBox box = shape.bbox();
    const Vec2 centre = shape.center();
    grid.near(centre, 0.5 * std::hypot(box.maxX - box.minX, box.maxY - box.minY) + maxClr + kSlack, [&](int o) {
      if (o == a || together(a, o)) return;
      const Owner& O = t.owners[size_t(o)];
      if (O.kind == Owner::Kind::Zone || !(O.layers & A.layers)) return;  // (a pour is poured again)
      // (Copper of its own net keeps no clearance, but two objects do not stand in one another: a pad dragged at
      // the via its own wire goes to pushes it on. A branch point lies on its net's copper where it likes.)
      // ... its point alone is kept out of the copper that moves at it: the mesh has no place for a vertex inside
      // a pad, and a pad dragged at a branch point of its own net stopped there in every mode.
      const bool own = O.net == A.net && A.net != kNoNet;
      if (own && A.kind == Owner::Kind::Junction) return;
      const bool point = own && O.kind == Owner::Kind::Junction;
      if (push == Push::None && !point) return;  // (the clearances are not looked at)
      const double req = point ? kOwnPoint : own ? 0.0 : requiredClearance(b, A.net, O.net, A.layers & O.layers);
      if (point && ahead.len2() > 0 && shape.contains(O.c)) {
        // (Inside the copper as it would stand: out of it the way the copper goes, by what there is of it ahead.)
        const Vec2 dir = ahead.normalized();
        const double depth = shape.rayExit(O.c, dir);
        out.push_back({o, dir * (depth + req + kPushOver), depth + req});
        return;
      }
      const double gap = point ? shape.distance(O.c) : shape.distance(O.shape);
      if (!point && ahead.len2() > 0 && gap <= 0) {
        // (Two coppers one in the other have no distance to tell how deep: it would be in by what of the shift there
        // is beyond the gap they have now, and goes ahead of the shift by that.)
        const double depth = std::max(0.0, ahead.len() - std::max(0.0, A.shape.distance(O.shape)));
        out.push_back({o, ahead.normalized() * (depth + req + kPushOver), depth + req});
        return;
      }
      if (gap >= req - kSlack) return;
      Vec2 n = awayFrom(shape, O.shape.center(), centre);
      if (n.len2() == 0) n = {1, 0};
      out.push_back({o, n * (req - gap + kPushOver), req - gap});
    });
    if (ahead.len2() > 0 || push == Push::None) return;
    for (const LayerMesh& m : t.layers) {
      if (a >= int(m.ownerVerts.size())) continue;
      for (int v : m.ownerVerts[size_t(a)])
        for (int ti : m.verts[size_t(v)].tris)
          for (int e : m.tris[size_t(ti)].e) {
            const Edge& E = m.edges[size_t(e)];
            if (E.v[0] != v && E.v[1] != v) {
              // The far side: a wall — the outline keeps the board edge's clearance, a keepout's wall none —, or a
              // wire of another net running along it (it crosses no spoke: the room of none shows it).
              double req = -1;
              if (E.constrained) {
                const Owner& W = t.owners[size_t(m.verts[size_t(E.v[0])].owner)];
                req = W.kind == Owner::Kind::Outline ? double(b.edgeClearance) : 0.0;
              } else if (E.along >= 0 && t.wires[size_t(E.along)].net != A.net) {
                const Wire& w = t.wires[size_t(E.along)];
                req = t.clearance(A.net, w.net, m.layer) + w.width / 2.0;
              }
              if (req < 0) continue;
              const double d = A.shape.distanceToSegment(m.verts[size_t(E.v[0])].p, m.verts[size_t(E.v[1])].p);
              if (d < req - kSlack) out.push_back({-1 - e, {}, req - d});
              continue;
            }
            if (E.cross.empty() || E.cls < 2) continue;
            const int u = E.v[0] == v ? E.v[1] : E.v[0];
            const int o = m.verts[size_t(u)].owner;
            if (o == a) continue;
            const EdgeCapacity c = edgeCapacity(t, m, e);
            if (c.deficit <= kSlack) continue;
            // (Between two owners of one body — a wire the body was dragged over, now between two of its pads —
            // nobody gives way.)
            if (together(a, o)) {
              out.push_back({-1 - e, {}, c.deficit});
              continue;
            }
            const Vec2 n = (m.verts[size_t(u)].p - m.verts[size_t(v)].p).normalized();
            out.push_back({o, n * (c.deficit + kPushOver), c.deficit});
          }
    }
  }
  // How short the body's owners stand of what is round them, before it moves: a step that makes none of it worse
  // is no conflict (the board may have its own).
  void remember(int body) {
    std::vector<Need> needs;
    for (int a : bodies[size_t(body)]) {
      needs.clear();
      needsOf(a, needs);
      for (const Need& n : needs) {
        double& was = allowed[{a, n.other}];
        was = std::max(was, n.deficit);
      }
    }
  }
  // The component a body is, kept for the board to be set by (FreestyleTarget::Carried).
  void carry(int body) {
    if (movedBody[size_t(body)]) return;
    movedBody[size_t(body)] = 1;
    std::set<int> comps;
    for (int o : bodies[size_t(body)])
      if (ownerPad[size_t(o)] >= 0 && b.pads[size_t(ownerPad[size_t(o)])].component >= 0) comps.insert(b.pads[size_t(ownerPad[size_t(o)])].component);
    for (int ci : comps) {
      if (r::contains(tg.carried, ci, &FreestyleTarget::Carried::component)) continue;
      const std::vector<int> pads = padsOf(ci);
      if (pads.empty()) continue;
      FreestyleTarget::Carried c;
      c.component = ci;
      c.pos = b.components[size_t(ci)].pos;
      c.angle = b.components[size_t(ci)].angle;
      c.ownerA = pads.front();
      c.atA = t.owners[size_t(c.ownerA)].c;
      // (The pad farthest from the first: the turn is read off the line between the two.)
      for (int o : pads)
        if (c.ownerB < 0 || (t.owners[size_t(o)].c - c.atA).len2() > (c.atB - c.atA).len2()) c.ownerB = o, c.atB = t.owners[size_t(o)].c;
      if ((c.atB - c.atA).len() < 1000) c.ownerB = -1;
      tg.carried.push_back(c);
    }
  }
  void undo(const std::vector<Did>& log) {
    for (const Did& d : log | v::reverse) {
      if (d.turn != 0) turnOwners(t, bodies[size_t(d.body)], d.pivot, -d.turn);
      else moveOwners(t, bodies[size_t(d.body)], d.shift * -1.0);
    }
  }
  // One step of the target: shifted by d, or turned by deg about pivot, and what it came too close to pushed off.
  // False, and the model as it was: it does not go. `whole` false: only a part of it went (the mesh).
  // (XR_FS_DEBUG) What holds a body: the triangle at it that the rest of its step would turn over first.
  void heldBy(int body, Vec2 rest, double f) const {
    static const bool debug = std::getenv("XR_FS_DEBUG") != nullptr;
    if (!debug) return;
    double least = std::numeric_limits<double>::max();
    std::string what;
    for (const LayerMesh& m : t.layers)
      for (int a : bodies[size_t(body)]) {
        if (a >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[size_t(a)])
          for (int ti : m.verts[size_t(v)].tris) {
            const Tri& T = m.tris[size_t(ti)];
            Vec2 p[3], q[3];
            int mine = 0;
            for (int i = 0; i < 3; ++i) {
              const Vertex& x = m.verts[size_t(T.v[i])];
              const bool goes = bodyOf[size_t(x.owner)] == body;
              mine += goes;
              p[i] = x.p;
              q[i] = goes ? x.p + rest : x.p;
            }
            if (mine == 3) continue;
            const double f0 = orient(p[0], p[1], p[2]), f1 = orient(q[0], q[1], q[2]) - f0;
            if (f1 >= 0) continue;
            const double lam = f0 / -f1;
            if (lam >= least) continue;
            least = lam;
            what.clear();
            for (int i = 0; i < 3; ++i) {
              const Vertex& x = m.verts[size_t(T.v[i])];
              const Owner& O = t.owners[size_t(x.owner)];
              what += std::format(" [owner {} kind {} net {} body {} at ({:.3f}, {:.3f})]", x.owner, int(O.kind), O.net, bodyOf[size_t(x.owner)], x.p.x / 1e6, x.p.y / 1e6);
            }
            what += std::format(" on L{}, edges", int(m.layer));
            for (int e : T.e) what += std::format(" {}{}{}", m.edges[size_t(e)].constrained ? "C" : "", m.edges[size_t(e)].rigid ? "R" : "", m.edges[size_t(e)].cross.size());
          }
      }
    std::println(stderr, "  freestyle: body {} went {:.3f} of its step ({:.1f} um left), held by{}", body, f, rest.len() / 1e3, what);
  }
  std::vector<Did> done;   // the steps of this call that stand, in order
  std::vector<int> inStep;  // the bodies moved in the step being made; the target first

  // What stands where the body is about to be goes first: the copper its owners would be too close to, shifted by
  // `vec`, is shoved on by what it would be short of. (Pushed only after the body had moved, a thing in its way
  // gave the body the micron the mesh leaves between two vertices, and its own shove the next few: a component
  // against its neighbour crept.)
  void clearWay(int body, Vec2 vec, int depth, std::vector<Did>& log) {
    if (depth >= 4) return;
    std::vector<Need> needs;
    std::map<int, Vec2> pushes;
    for (int a : bodies[size_t(body)]) {
      needs.clear();
      needsOf(a, needs, vec);
      for (const Need& n : needs) {
        if (n.other < 0) continue;
        const auto was = allowed.find({a, n.other});
        if (n.deficit <= (was == allowed.end() ? 0.0 : was->second) + kSlack) continue;
        const int ob = bodyFor(n.other);
        if (ob <= 0 || ob == body) continue;
        Vec2& p = pushes[ob];
        if (n.push.len2() > p.len2()) p = n.push;
      }
    }
    // ... and the vertex a side of the body would run over: a triangle of two of the body's vertices and one of
    // another owner that the shift turns over (a branch point before the gap between two pads of its net: no pad's
    // copper comes at it, the mesh has it between their corners). It goes ahead of the side, by the shift and a
    // fifth (the mesh leaves a tenth of what there is between them).
    for (const LayerMesh& m : t.layers)
      for (int a : bodies[size_t(body)]) {
        if (a >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[size_t(a)])
          for (int ti : m.verts[size_t(v)].tris) {
            const Tri& T = m.tris[size_t(ti)];
            Vec2 p[3], q[3];
            int mine = 0, other = -1;
            for (int i = 0; i < 3; ++i) {
              const Vertex& x = m.verts[size_t(T.v[i])];
              const bool goes = bodyOf[size_t(x.owner)] == body;
              mine += goes;
              if (!goes) other = x.owner;
              p[i] = x.p;
              q[i] = goes ? x.p + vec : x.p;
            }
            if (mine != 2) continue;
            const double f0 = orient(p[0], p[1], p[2]), f1 = orient(q[0], q[1], q[2]) - f0;
            if (f1 >= 0 || f0 >= -1.2 * f1) continue;
            const int ob = bodyFor(other);
            if (ob <= 0 || ob == body) continue;
            const Vec2 push = vec * (1.2 - std::clamp(f0 / -f1, 0.0, 1.0));
            Vec2& best = pushes[ob];
            if (push.len2() > best.len2()) best = push;
          }
      }
    for (const auto& [ob, v] : pushes) shove(ob, v, depth + 1, log);
  }
  bool shove(int ob, Vec2 vec, int depth, std::vector<Did>& log) {
    if (!r::contains(inStep, ob)) {
      remember(ob);
      inStep.push_back(ob);
    }
    carry(ob);
    clearWay(ob, vec, depth, log);
    const double g = moveOwners(t, bodies[size_t(ob)], vec);
    if (g > 1e-9) log.push_back({ob, vec * g, 0, {}});
    bool went = g > 1e-9;
    if (g < 1 - 1e-6) heldBy(ob, vec * (1 - g), g);
    // A via or a branch point shoved straight at what does not give way — caught between the copper that moves at it
    // and the copper behind it — goes aside by what was left: the way that goes farther of the two.
    if (g < 1 - 1e-6 && bodies[size_t(ob)].size() == 1) {
      const Vec2 left = vec * (1 - g);
      const Vec2 aside{-left.y, left.x};
      Topology trial = t;
      const double g1 = moveOwners(trial, bodies[size_t(ob)], aside);
      trial = t;
      const double g2 = moveOwners(trial, bodies[size_t(ob)], aside * -1.0);
      if (std::max(g1, g2) > 1e-9) {
        const Vec2 way = g1 >= g2 ? aside : aside * -1.0;
        const double gs = moveOwners(t, bodies[size_t(ob)], way);
        if (gs > 1e-9) {
          log.push_back({ob, way * gs, 0, {}});
          went = true;
        }
      }
    }
    return went;
  }
  // One step of the target: shifted by d, or turned by deg about pivot, and what it came too close to pushed off.
  // False, and the model as it was: it does not go. `whole` false: only a part of it went (the mesh).
  bool step(Vec2 d, double deg, Vec2 pivot, Vec2& went, double& turned, bool& whole) {
    std::vector<Did> log;
    inStep.assign(1, 0);
    grid.build(t, true);
    allowed.clear();
    remember(0);
    if (deg == 0) clearWay(0, d, 0, log);
    const Vec2 at0 = t.owners[size_t(bodies[0].front())].c;
    const double f = deg != 0 ? turnOwners(t, bodies[0], pivot, deg) : moveOwners(t, bodies[0], d);
    if (f < 1 - 1e-9 && deg == 0) heldBy(0, d * (1 - f), f);
    if (f <= 1e-9) {
      undo(log);
      return false;
    }
    log.push_back({0, deg != 0 ? Vec2{} : d * f, deg * f, pivot});
    if (push != Push::None) {
      std::vector<Need> needs;
      bool settled = false;
      for (int round = 0; round < kPushRounds && !settled; ++round) {
        std::map<int, Vec2> pushes;
        bool stuck = false;
        for (size_t k = 0; k < inStep.size() && !stuck; ++k)
          for (int a : bodies[size_t(inStep[k])]) {
            needs.clear();
            needsOf(a, needs);
            for (const Need& n : needs) {
              const auto was = allowed.find({a, n.other});
              if (n.deficit <= (was == allowed.end() ? 0.0 : was->second) + kSlack) continue;  // no worse than it stood
              const int ob = n.other >= 0 ? bodyFor(n.other) : -2;
              if (ob <= 0) {  // it stands, or it is the target itself
                if (static const bool debug = std::getenv("XR_FS_DEBUG") != nullptr; debug)
                  std::println(stderr, "  freestyle: owner {} (kind {}, net {}, body {}) at ({:.3f}, {:.3f}) is {:.1f} um short of {} {} (body {}), which stands", a, int(t.owners[size_t(a)].kind),
                               t.owners[size_t(a)].net, bodyOf[size_t(a)], t.owners[size_t(a)].c.x / 1e6, t.owners[size_t(a)].c.y / 1e6, n.deficit / 1e3, n.other >= 0 ? "owner" : "the edge",
                               n.other >= 0 ? n.other : -1 - n.other, ob);
                stuck = true;
                break;
              }
              Vec2& p = pushes[ob];
              if (n.push.len2() > p.len2()) p = n.push;
            }
            if (stuck) break;
          }
        if (stuck) break;
        if (pushes.empty()) {
          settled = true;
          break;
        }
        bool any = false;
        for (const auto& [ob, vec] : pushes) any |= shove(ob, vec, 0, log);
        if (!any) break;
      }
      if (!settled) {
        undo(log);
        return false;
      }
    }
    went = t.owners[size_t(bodies[0].front())].c - at0;
    if (deg != 0) went = {};
    turned = deg * f;
    whole = f >= 1 - 1e-9;
    done.insert(done.end(), log.begin(), log.end());
    return true;
  }
  // The board after the model: the vias where their owners are, the components by their pads' owners.
  void boardFromModel() {
    for (size_t bi = 0; bi < bodies.size(); ++bi) {
      if (!movedBody[bi]) continue;
      for (int o : bodies[bi])
        if (const int vi = ownerVia[size_t(o)]; vi >= 0) b.vias[size_t(vi)].pos = Point(t.owners[size_t(o)].c);
    }
    for (const FreestyleTarget::Carried& c : tg.carried) {
      if (c.component < 0 || c.component >= int(b.components.size())) continue;
      const Vec2 a = t.owners[size_t(c.ownerA)].c;
      double turn = tg.turned;
      if (c.ownerB >= 0) turn = boardTurn(c.atB - c.atA, t.owners[size_t(c.ownerB)].c - a);
      else if (bodyOf[size_t(c.ownerA)] != 0) turn = 0;  // (only the target is turned)
      turn = std::round(turn * 1e6) / 1e6;
      const double angle = std::fmod(c.angle + turn + 720.0, 360.0);
      if (double da = angle - b.components[size_t(c.component)].angle; std::abs(da) > 1e-9) b.rotateComponent(c.component, da);
      b.moveComponent(c.component, Point(a + rotateBoard(c.pos.v() - c.atA, turn)));
    }
  }
};

}  // namespace

FreestyleResult freestyle(Board& b, Topology& t, FreestyleTarget& tg, Vec2 shift, double rotate, Vec2 pivot, Push push) {
  FreestyleResult r;
  tg.fragment.tracks.clear();
  tg.fragment.zones.clear();
  if (tg.vertex) rotate = 0;
  Drag drag(b, t, tg, push);
  // The target: the vias, the components' pads, the branch point at the vertex — one body.
  std::vector<int> owners;
  for (int vi : tg.fragment.vias)
    if (vi >= 0 && vi < int(t.viaOwner.size()) && t.viaOwner[size_t(vi)] >= 0) owners.push_back(t.viaOwner[size_t(vi)]);
  for (int ci : tg.fragment.components)
    for (int o : drag.padsOf(ci)) owners.push_back(o);
  if (tg.vertex) {
    int junction = -1;
    for (int oi = 0; oi < int(t.owners.size()) && junction < 0; ++oi) {
      const Owner& o = t.owners[size_t(oi)];
      if (o.kind == Owner::Kind::Junction && o.net == tg.vertexNet && ((o.layers >> tg.vertexLayer) & 1) && (o.c - *tg.vertex).len() <= 2 * edit::kJoinTol)
        junction = oi;
    }
    if (junction < 0) {
      r.blocked = true;
      return r;
    }
    owners.push_back(junction);
  }
  if (owners.empty()) return r;
  if (r::any_of(owners, [&](int oi) { return t.owners[size_t(oi)].locked; })) {
    r.blocked = true;
    return r;
  }
  if (r::any_of(owners, [&](int oi) { return drag.lockedAt[size_t(oi)] != 0; })) {
    r.blocked = r.lockedWire = true;
    return r;
  }
  drag.addBody(owners);
  drag.carry(0);
  // A wire's way through the mesh: the edges it crosses, in order.
  auto edgesOf = [&](const Wire& w) {
    std::vector<int> out;
    for (int cid : w.cross) out.push_back(t.crossings[size_t(cid)].edge);
    return out;
  };
  std::vector<std::vector<int>> wayBefore;
  for (const Wire& w : t.wires) wayBefore.push_back(edgesOf(w));

  // The steps of a move: what goes of `shift` and `rotate`.
  auto advance = [&](Vec2 shift, double rotate) {
    FreestyleResult r;
    const int n = std::min(200, std::max({1, int(std::ceil(shift.len() / stepLength(b))), int(std::ceil(std::abs(rotate) / kTurnStep))}));
    const Vec2 d = shift / n;
    const double turn = rotate / n;
    for (int i = 0; i < n && !r.blocked; ++i) {
      // The turn first, then the shift: each a step of its own, what does not go leaves the other to go.
      if (turn != 0) {
        Vec2 went;
        double turned = 0;
        bool whole = true;
        if (drag.step({}, turn, pivot + r.moved, went, turned, whole)) r.turned += turned;
        r.blocked |= turned == 0 || !whole;
      }
      if (d.len2() > 0) {
        Vec2 went;
        double turned = 0;
        bool whole = true;
        bool gone = drag.step(d, 0, {}, went, turned, whole);
        if (gone) r.moved += went;
        if (!gone || !whole) {
          // It does not go that way: along either axis, what there is left of the step (the body slides along what
          // stopped it instead of standing where it first touched).
          const Vec2 left = gone ? d - went : d;
          bool slid = false;
          for (Vec2 part : {Vec2{left.x, 0}, Vec2{0, left.y}}) {
            if (part.len() < 100 || slid) continue;
            Vec2 w2;
            bool whole2 = true;
            if (drag.step(part, 0, {}, w2, turned, whole2)) {
              r.moved += w2;
              slid = true;
            }
          }
          r.blocked |= !slid;
        }
      }
    }
    return r;
  };
  if (static const bool debug = std::getenv("XR_FS_DEBUG") != nullptr; debug) {
    // What stands next to the target in the meshes: the owners across its spokes, nearer than 0.6 mm.
    std::set<std::pair<int, int>> seen;
    for (const LayerMesh& m : t.layers)
      for (int a : owners) {
        if (a >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[size_t(a)])
          for (int ti : m.verts[size_t(v)].tris)
            for (int u : m.tris[size_t(ti)].v) {
              const int o = m.verts[size_t(u)].owner;
              if (o == a || drag.together(a, o) || !seen.insert({a, o}).second) continue;
              const double gap = t.owners[size_t(a)].shape.distance(t.owners[size_t(o)].shape);
              if (gap < 0.6 * kNmPerMm)
                std::println(stderr, "  freestyle: beside owner {} (net {}) stands owner {} kind {} net {} at ({:.3f}, {:.3f}), {:.1f} um off, vertex {:.1f} um", a, t.owners[size_t(a)].net, o,
                             int(t.owners[size_t(o)].kind), t.owners[size_t(o)].net, t.owners[size_t(o)].c.x / 1e6, t.owners[size_t(o)].c.y / 1e6, gap / 1e3,
                             (m.verts[size_t(u)].p - m.verts[size_t(v)].p).len() / 1e3);
            }
      }
  }
  if (!tg.state) tg.state = std::make_shared<FreestyleState>();
  FreestyleState& state = *tg.state;
  const bool stands = r::none_of(t.violations, [](const Violation& v) { return v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad; });
  // Drawn again, all the wires: the drawing of the board is kept through the drag and brought up from the one before
  // (updateDrawn: what the moved owners touched and what that moved in turn — a fifteenth of a whole drawing), so
  // the first move of a drag computes the board's shapes whole, as F5 does. (Only the wires round the moved owners
  // were drawn, the rest left as they lay: on a board drawn by another hand the new shapes ran into the old ones of
  // the wires next to them — sixty conflicts after one via pushed.)
  auto draw = [&] {
    drag.boardFromModel();
    if (tg.vertex) tg.vertex = t.owners[size_t(owners.back())].c;
    RealizeStats st;
    int nWires = 0;
    if (stands) {
      auto kept = std::make_shared<ModelDrawing>();
      drawModel(b, t, true, st, nWires, false, nullptr, kept.get(), state.drawing.get());
      state.drawing = std::move(kept);
      return;
    }
    // A model whose wires cross is not drawn whole (F5 stops on it): the wires at the moved owners, those across
    // the edges round them, and every wire whose way the flips changed.
    std::set<int> mine;
    for (size_t bi = 0; bi < drag.bodies.size(); ++bi)
      if (drag.movedBody[bi]) mine.insert(drag.bodies[bi].begin(), drag.bodies[bi].end());
    std::vector<int> some;
    for (int wi = 0; wi < int(t.wires.size()); ++wi)
      if (mine.contains(t.wires[size_t(wi)].end[0]) || mine.contains(t.wires[size_t(wi)].end[1]) || edgesOf(t.wires[size_t(wi)]) != wayBefore[size_t(wi)])
        some.push_back(wi);
    for (LayerMesh& m : t.layers)
      for (int oi : mine) {
        if (oi >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[size_t(oi)])
          for (int e : starEdges(m, v))
            for (int cid : m.edges[size_t(e)].cross)
              if (const int wi = t.crossings[size_t(cid)].wire; wi >= 0 && !r::contains(some, wi)) some.push_back(wi);
      }
    drawModel(b, t, true, st, nWires, false, &some);
  };
  auto places = [&] {
    DrcOptions o;
    o.unconnected = false;
    o.widths = false;
    return placesOf(b, runDrc(b, o));
  };
  if (push == Push::None || !stands) {
    r = advance(shift, rotate);
    tg.turned += r.turned;
    draw();
  } else {
    // With pushing the drawing is the judge of the move, as it is of F7's steps: what the room of the model's edges
    // does not show — a wire leaving a pad beside one that passes it — the board's check finds. A move that adds a
    // conflict is taken back and tried at half its length.
    if (!state.places) {
      draw();  // (the board's shapes as they are computed, before anything moved: what the moves are held to)
      state.places = places();
    }
    bool went = false;
    for (int attempt = 0; attempt < 3 && !went; ++attempt, shift = shift * 0.5, rotate *= 0.5) {
      drag.done.clear();
      FreestyleResult got = advance(shift, rotate);
      if (drag.done.empty()) {
        r.blocked = true;
        break;
      }
      tg.turned += got.turned;
      draw();
      std::vector<Place> now = places();
      if (addedPlaces(*state.places, now).empty()) {
        state.places = std::move(now);
        got.blocked |= attempt > 0;
        r = got;
        went = true;
        break;
      }
      if (static const bool debug = std::getenv("XR_FS_DEBUG") != nullptr; debug)
        for (const Place& p : addedPlaces(*state.places, now))
          std::println(stderr, "  freestyle: the move ({:.3f}, {:.3f}) adds a conflict of nets {} and {} at ({:.3f}, {:.3f}), {:.1f} um deep{}", got.moved.x / 1e6, got.moved.y / 1e6, p.nets.first, p.nets.second,
                       p.pos.x / 1e6, p.pos.y / 1e6, p.depth / 1e3, p.shorted ? ", a short" : "");
      drag.undo(drag.done);
      tg.turned -= got.turned;
      r.blocked = true;
    }
    if (!went) draw();
  }
  return r;
}

std::optional<FreestyleTarget> branchPointAt(const Board& b, Vec2 p, double tol) {
  std::optional<FreestyleTarget> best;
  double bd = tol;
  for (const Track& t : b.tracks)
    for (Vec2 e : {t.a.v(), t.b.v()}) {
      double d = (e - p).len();
      if (d > bd || edit::anchoredAt(b, e, t.layer, t.net)) continue;
      if (edit::endsAt(b, e, t.layer, t.net).size() < 3) continue;
      bd = d;
      best.emplace();
      best->vertex = e;
      best->vertexLayer = t.layer;
      best->vertexNet = t.net;
    }
  return best;
}

}  // namespace xr::topo
