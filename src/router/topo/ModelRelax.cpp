#include "router/topo/ModelRelax.h"

#include <algorithm>
#include <cmath>
#include <cstdlib>
#include <format>
#include <map>
#include <numeric>
#include <optional>
#include <print>
#include <set>

#include "core/Connectivity.h"
#include "core/Prof.h"
#include "drc/Drc.h"
#include "geom/Geometry.h"
#include "router/topo/ModelTools.h"
#include "topo/Capacity.h"
#include "topo/Move.h"
#include "topo/Narrowing.h"

namespace xr::topo {

namespace {

constexpr double kDepthCost = 100;             // a mm of shortfall is worth 100 mm of wire
constexpr double kCountCost = 1 * kNmPerMm;    // ... and a violation, however shallow, 1 mm
constexpr double kWalkSlack = 2 * kNmPerMm;    // the walk may stand this much above the best drawing seen
constexpr double kBalanced = 0.05;             // a force below this is none: the object is where it should be
constexpr double kTightStep = 0.5 * kNmPerMm;  // the step limit of an object with an edge short of room (TopoR)
constexpr double kCrowd = 4;                   // the push of an edge without room against a wire's pull of 1 (TopoR: 64 to 16)
constexpr double kCrowdFull = 50000;           // ... in full when this much is missing
constexpr double kContact = 20000;             // two objects this near their rule press on each other
constexpr double kMinStep = 500;               // nm; shorter steps are not taken

// The pads and vias by 2 mm cells, for what is near a point. The cells are as the owners lay when it was
// built; `near` takes the slack the owners may have moved by since.
struct OwnerGrid {
  static constexpr double kCell = 2 * kNmPerMm;
  std::map<std::pair<long, long>, std::vector<int>> cells;
  double slack = 0;
  void build(const Topology& t) {
    cells.clear();
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& o = t.owners[oi];
      if (o.layers == 0 || (o.kind != Owner::Kind::Pad && o.kind != Owner::Kind::Via)) continue;
      BBox bb = o.shape.bbox();
      for (long cx = long(std::floor(bb.minX / kCell)); cx <= long(std::floor(bb.maxX / kCell)); ++cx)
        for (long cy = long(std::floor(bb.minY / kCell)); cy <= long(std::floor(bb.maxY / kCell)); ++cy) cells[{cx, cy}].push_back(oi);
    }
  }
  template <class F>
  void near(Vec2 p, double r, F&& f) const {
    r += slack;
    std::set<int> seen;
    for (long cx = long(std::floor((p.x - r) / kCell)); cx <= long(std::floor((p.x + r) / kCell)); ++cx)
      for (long cy = long(std::floor((p.y - r) / kCell)); cy <= long(std::floor((p.y + r) / kCell)); ++cy) {
        auto it = cells.find({cx, cy});
        if (it == cells.end()) continue;
        for (int oi : it->second)
          if (seen.insert(oi).second) f(oi);
      }
  }
};

// The way off a shape at a point: the gradient of the distance to it.
Vec2 awayFrom(const Shape& s, Vec2 at, Vec2 centre) {
  constexpr double e = 2000;
  Vec2 n{s.distance(at + Vec2{e, 0}) - s.distance(at - Vec2{e, 0}), s.distance(at + Vec2{0, e}) - s.distance(at - Vec2{0, e})};
  if (n.len() < 1) n = at - centre;
  return n.len() < 1 ? Vec2{} : n.normalized();
}

// The copper an object is too close to: what it is short of the rule, summed, and the way off. Pads and
// vias of other nets around it; and what its capacity never sees — a wire running along a far side of its
// star (crossing none of its spokes), the outline, a keepout's wall.
struct CopperPush {
  Vec2 push;
  double shortfall = 0;
};
void segmentPush(const Board& b, const Topology& t, int oi, Vec2 at, CopperPush& out) {
  const Owner& ob = t.owners[oi];
  for (const LayerMesh& m : t.layers) {
    if (oi >= int(m.ownerVerts.size())) continue;
    for (int v : m.ownerVerts[oi])
      for (int ti : m.verts[v].tris) {
        const Tri& T = m.tris[ti];
        const Edge& F = m.edges[T.e[m.localVertex(ti, v)]];
        if (F.v[0] < 0) continue;
        double req = -1;
        const Owner& fa = t.owners[m.verts[F.v[0]].owner];
        if (F.constrained) {
          req = ob.halfWidth + (fa.kind == Owner::Kind::Outline ? double(b.edgeClearance) : 0.0);
        } else if (F.along >= 0 && t.wires[F.along].net != ob.net) {
          const Wire& w = t.wires[F.along];
          req = ob.halfWidth + t.clearance(ob.net, w.net, m.layer) + w.width / 2.0;
        }
        if (req < 0) continue;
        Vec2 A = m.verts[F.v[0]].p, B = m.verts[F.v[1]].p;
        double d = distPointSegment(at, A, B);
        if (d >= req - 1000) continue;
        Vec2 ab = B - A;
        double s = ab.len2() > 0 ? std::clamp((at - A).dot(ab) / ab.len2(), 0.0, 1.0) : 0.0;
        Vec2 n = at - (A + ab * s);
        if (n.len() < 1) n = Vec2{-ab.y, ab.x};
        if (n.len() < 1) continue;
        out.shortfall += req - 1000 - d;
        out.push = out.push + n.normalized() * (req - d + 2000);
      }
  }
}
CopperPush copperPush(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 at) {
  const Owner& ob = t.owners[oi];
  CopperPush out;
  segmentPush(b, t, oi, at, out);
  const double maxClr = double(b.maxClearance());
  grid.near(at, ob.halfWidth + maxClr + 1000, [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (o.net == ob.net || !(o.layers & ob.layers)) return;
    double req = ob.halfWidth + requiredClearance(b, ob.net, o.net, ob.layers & o.layers);
    double d = o.shape.distance(at);
    if (d >= req - 1000) return;
    Vec2 n = awayFrom(o.shape, at, o.c);
    if (n.len2() == 0) return;
    out.shortfall += req - 1000 - d;
    out.push = out.push + n * ((req - d + 2000) * (o.kind == Owner::Kind::Via ? 0.5 : 1.0));
  });
  return out;
}

// What stops the object at p: copper of other nets closer than the rule by more in sum than where it
// comes from (a step out of a conflict is no conflict). The worst such copper's centre.
std::optional<Vec2> blockerAt(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 p) {
  const Owner& ob = t.owners[oi];
  const double maxClr = double(b.maxClearance());
  double shortThere = 0, shortHere = 0, worstShort = 0;
  std::optional<Vec2> worst;
  {
    CopperPush there, here;
    segmentPush(b, t, oi, p, there);
    segmentPush(b, t, oi, ob.c, here);
    shortThere += there.shortfall;
    shortHere += here.shortfall;
    if (there.shortfall > 0) {
      worstShort = there.shortfall;
      worst = p - there.push;
    }
  }
  grid.near(p, ob.halfWidth + maxClr + 1000 + (p - ob.c).len(), [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (o.net == ob.net || !(o.layers & ob.layers)) return;
    double req = ob.halfWidth + requiredClearance(b, ob.net, o.net, ob.layers & o.layers);
    double there = std::max(0.0, req - 1000 - o.shape.distance(p)), here = std::max(0.0, req - 1000 - o.shape.distance(ob.c));
    shortThere += there;
    shortHere += here;
    if (there > worstShort) {
      worstShort = there;
      worst = o.c;
    }
  });
  if (shortThere > 0 && shortThere >= shortHere) return worst;
  return std::nullopt;
}

// The violations on `now` with none of the same nets close by on `was`: what a change added.
std::vector<DrcViolation> addedViolations(const Board& was, const std::vector<DrcViolation>& wasV, const Board& now, const std::vector<DrcViolation>& nowV) {
  auto netsOf = [](const Board& x, const DrcViolation& v) { return std::minmax(itemNet(x, v.a), v.hasB ? itemNet(x, v.b) : kNoNet); };
  std::vector<char> used(wasV.size(), 0);
  std::vector<DrcViolation> added;
  for (const DrcViolation& v : nowV) {
    bool old = false;
    for (size_t k = 0; k < wasV.size() && !old; ++k)
      if (!used[k] && netsOf(was, wasV[k]) == netsOf(now, v) && (wasV[k].pos - v.pos).len() < 1 * kNmPerMm) {
        old = true;
        used[k] = 1;
      }
    if (!old) added.push_back(v);
  }
  return added;
}

struct Obj {
  int owner = -1;
  Vec2 last;         // the force of the last iteration (Rprop)
  double scale = 1;  // of the step limit: x 1.5 while the force keeps its way, x 0.6 when it turns, at most 1
  int ends = 0;      // wires ending at it
  Vec2 start;
};

// The model drawn on a copy of the board, and what the drawing is worth.
struct Drawn {
  Topology model;   // the model as drawn: its wires own the tracks of the board it came with
  Topology owning;  // the same model, its wires owning the drawing's tracks
  Board board;
  std::vector<DrcViolation> violations;
  std::vector<Vec2> pos;  // the objects' centres
  RealizeStats stats;
  int wires = 0;
  int conflicts = 0, deep = 0, shorts = 0;
  double depth = 0, length = 0;
  size_t unrouted = 0;
  double score() const { return length + depth * kDepthCost + conflicts * kCountCost; }
};

}  // namespace

OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o) {
  ProfScope pAll("F7 model total");
  OptimizeModelResult r;
  int nFlips = 0;
  if (!prepareModel(t, o.flips, false, nFlips, r.violations)) return r;
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;

  // The objects: unlocked vias, and the branch points of unlocked wires. One with fewer than two wires (a
  // dangling end, a via onto a pour) has nothing to balance: it only steps off copper it is too close to.
  std::vector<Obj> objs;
  {
    std::set<int> lockedAt;
    std::map<int, int> ends;
    for (const Wire& w : t.wires)
      for (int e : w.end) {
        if (w.locked) lockedAt.insert(e);
        ++ends[e];
      }
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& ow = t.owners[oi];
      if (ow.layers == 0 || ow.locked || lockedAt.contains(oi)) continue;
      if ((ow.kind == Owner::Kind::Via && o.vias) || (ow.kind == Owner::Kind::Junction && o.junctions)) objs.push_back({oi, {}, 1.0, ends[oi], ow.c});
    }
  }
  std::map<int, size_t> objOf;
  for (size_t k = 0; k < objs.size(); ++k) objOf[objs[k].owner] = k;

  auto draw = [&] {
    ProfScope p("F7 model: drawing");
    Drawn c{t, t, b, {}, {}, {}};
    for (const Obj& ob : objs) c.pos.push_back(t.owners[ob.owner].c);
    // The vias on the 0.1 um grid the board's files keep (a position between two of its points would be
    // written either way, and the model next to the board would not hash the same).
    for (const Owner& ow : t.owners)
      if (ow.kind == Owner::Kind::Via && ow.via >= 0 && ow.via < int(c.board.vias.size()))
        c.board.vias[ow.via].pos = Point(Vec2{std::round(ow.c.x / 100) * 100, std::round(ow.c.y / 100) * 100});
    drawModel(c.board, c.owning, true, c.stats, c.wires);
    {
      ProfScope pj("F7 model: judging");
      DrcOptions d;
      d.unconnected = false;
      c.violations = runDrc(c.board, d);
      for (const DrcViolation& v : c.violations) {
        ++c.conflicts;
        const double depth = std::max(0.0, v.required - v.actual);
        c.depth += depth;
        if (v.type == DrcViolation::Type::Short) ++c.shorts;
        else if (depth > kNarrowDeficitLimit) ++c.deep;
      }
      c.length = c.board.tracksLength();
      c.unrouted = Connectivity::compute(c.board).ratsnest.size();
    }
    ++r.drawings;
    return c;
  };
  // The wires' forces on the objects as that drawing has them: nothing on an object with one wire.
  auto forcesOf = [&](const Drawn& c) {
    std::vector<Vec2> f(objs.size());
    for (size_t k = 0; k < objs.size(); ++k)
      if (objs[k].ends >= 2)
        if (auto it = c.stats.ownerForce.find(objs[k].owner); it != c.stats.ownerForce.end()) f[k] = it->second;
    return f;
  };
  auto sumOf = [](const std::vector<Vec2>& f) {
    double s = 0;
    for (Vec2 x : f) s += x.len();
    return s;
  };
  // Nothing lost, shorted or deeper than the limit of a violation added — no length buys those — and the
  // weighted sum no more than `slack` above the other's.
  auto notWorse = [](const Drawn& c, const Drawn& than, double slack) {
    return c.unrouted <= than.unrouted && c.shorts <= than.shorts && c.deep <= than.deep && c.score() <= than.score() + slack;
  };

  OwnerGrid grid;
  // What the object is short of around it in the model: the edges of its stars whose wires do not fit, and
  // the copper it is too close to.
  auto localShort = [&](int oi) {
    double s = copperPush(b, t, grid, oi, t.owners[oi].c).shortfall;
    for (const LayerMesh& m : t.layers) {
      if (oi >= int(m.ownerVerts.size())) continue;
      for (int v : m.ownerVerts[oi])
        for (int e : starEdges(m, v))
          if (m.edges[e].v[0] >= 0 && !m.edges[e].cross.empty()) s += edgeCapacity(t, m, e).deficit;
    }
    return s;
  };

  Drawn prev = draw();  // where the walk stands
  Drawn best = prev;    // the best drawing seen: the result
  r.conflictsBefore = best.conflicts;
  r.lengthBefore = best.length;
  r.depthBefore = best.depth;
  r.forceBefore = sumOf(forcesOf(best));
  r.log.push_back(std::format("start: {} conflict(s) ({} deep, {} short), {:.3f} mm short, {:.1f} mm, forces {:.1f}", best.conflicts, best.deep, best.shorts,
                              best.depth / 1e6, best.length / 1e6, r.forceBefore));

  int clearRounds = o.clearRounds;
  int held = 0;
  double tol = o.tol;
  for (; tol >= o.floor && r.iterations < 200; ++r.iterations) {
    grid.build(t);
    grid.slack = tol;
    // Forces. An object too close to copper steps off it and nothing else; while any such is left (and the
    // rounds last) the others wait: a step that clears a conflict is not to fall with a neighbour's mistake.
    std::vector<Vec2> force = forcesOf(prev);
    std::vector<Vec2> clear(objs.size());
    std::vector<char> tight(objs.size(), 0);
    bool anyClear = false;
    for (size_t k = 0; k < objs.size(); ++k) {
      const int oi = objs[k].owner;
      CopperPush cp = copperPush(b, t, grid, oi, t.owners[oi].c);
      if (cp.push.len() > 0) {
        clear[k] = cp.push;
        anyClear = true;
        continue;
      }
      if (objs[k].ends < 2) continue;
      // The crowding (the paper's fig. 3b): an edge at the object whose wires have no room pushes its two
      // ends apart.
      for (const LayerMesh& m : t.layers) {
        if (oi >= int(m.ownerVerts.size())) continue;
        for (int v : m.ownerVerts[oi])
          for (int e : starEdges(m, v)) {
            const Edge& E = m.edges[e];
            if ((E.v[0] != v && E.v[1] != v) || E.cross.empty()) continue;
            EdgeCapacity c = edgeCapacity(t, m, e);
            if (c.deficit > 0) tight[k] = 1;
            if (c.slack >= kCapacityMargin || c.L <= 0) continue;
            Vec2 other = m.verts[E.v[0] == v ? E.v[1] : E.v[0]].p;
            force[k] = force[k] - (other - m.verts[v].p) / c.L * (kCrowd * std::clamp((kCapacityMargin - c.slack) / kCrowdFull, 0.0, 1.0));
          }
      }
    }
    const bool clearing = clearRounds > 0 && anyClear;
    if (!clearing) clearRounds = 0;
    // Contacts: an object standing at its rule from copper it is pulled into does not go there. Against a
    // fixed thing that part of its force is lost (it slides); two movable ones share theirs along the line
    // between them and go as one (TopoR's blocker joins the moving group under the sum of the forces).
    if (o.contacts && !clearing) {
      const double maxClr = double(b.maxClearance());
      std::vector<Vec2> shared = force;
      for (size_t k = 0; k < objs.size(); ++k) {
        const int oi = objs[k].owner;
        const Owner& ob = t.owners[oi];
        if (clear[k].len2() > 0 || force[k].len() < kBalanced) continue;
        grid.near(ob.c, ob.halfWidth + maxClr + kContact, [&](int oj) {
          if (oj == oi) return;
          const Owner& x = t.owners[oj];
          if (x.net == ob.net || !(x.layers & ob.layers)) return;
          const double req = ob.halfWidth + requiredClearance(b, ob.net, x.net, ob.layers & x.layers);
          if (x.shape.distance(ob.c) > req + kContact) return;
          Vec2 n = awayFrom(x.shape, ob.c, x.c) * -1.0;  // towards the other
          if (n.len2() == 0) return;
          const double mine = force[k].dot(n);
          auto it = objOf.find(oj);
          const bool movable = it != objOf.end() && clear[it->second].len2() == 0;
          const double theirs = movable ? force[it->second].dot(n) : 0.0;
          if (mine <= theirs) return;  // not pressing
          const double both = movable ? (mine + theirs) / 2 : 0.0;
          shared[k] = shared[k] + n * (both - mine);
          if (movable && it->second > k) shared[it->second] = shared[it->second] + n * (both - theirs);
          else if (movable && it->second < k) {}  // the pair was shared from the other side
        });
      }
      force = std::move(shared);
    }
    // Steps, the strongest force first, each object on its own: the limit by Rprop, the step along the force
    // and as long as the force is strong, checked against the copper where it lands (shortened, or slid along
    // what blocks it) and against the room in the model around it — the step goes back if that got shorter.
    std::vector<size_t> order(objs.size());
    std::iota(order.begin(), order.end(), size_t(0));
    auto strength = [&](size_t k) { return clear[k].len2() > 0 ? 1e9 : force[k].len(); };
    std::ranges::sort(order, [&](size_t x, size_t y) { return strength(x) > strength(y); });
    int stepped = 0, blocked = 0;
    for (size_t k : order) {
      Obj& ob = objs[k];
      const bool off = clear[k].len2() > 0;
      Vec2 F = off ? clear[k] : force[k];
      if (clearing && !off) continue;
      if (!off && F.len() < kBalanced) {
        ob.last = F;
        continue;
      }
      if (ob.last.len2() > 0) ob.scale = std::clamp(ob.scale * (F.dot(ob.last) > 0 ? 1.5 : 0.6), 0.1, 1.0);
      ob.last = F;
      double limit = tol * ob.scale;
      if (tight[k]) limit = std::min(limit, kTightStep);
      Vec2 delta = off ? (F.len() > limit ? F.normalized() * limit : F) : F.normalized() * (limit * std::min(1.0, F.len()));
      if (delta.len() < kMinStep) continue;
      const Vec2 at = t.owners[ob.owner].c;
      const double shortBefore = localShort(ob.owner);
      bool went = false;
      auto attempt = [&](Vec2 d) {
        if (d.len() < kMinStep || blockerAt(b, t, grid, ob.owner, at + d)) return false;
        if (moveOwner(t, ob.owner, d) <= 0) return false;
        if (localShort(ob.owner) <= shortBefore + 1) return true;
        moveOwner(t, ob.owner, at - t.owners[ob.owner].c);
        return false;
      };
      for (double f : {1.0, 0.5, 0.25, 0.125}) {
        if ((went = attempt(delta * f))) break;
        if (f == 1.0) {
          if (auto blk = blockerAt(b, t, grid, ob.owner, at + delta)) {
            Vec2 n = at + delta - *blk;
            if (n.len() > 1) {
              n = n.normalized();
              Vec2 tg{-n.y, n.x};
              if ((went = attempt(tg * delta.dot(tg) * 0.9))) break;
            }
          }
        }
      }
      if (went) ++stepped;
      else {
        ++blocked;
        ob.scale = std::max(0.1, ob.scale * 0.6);
      }
    }
    auto schedule = [&] {
      if (clearing) --clearRounds;
      else if (++held > o.hold) tol *= o.decay;
    };
    if (stepped == 0) {
      r.log.push_back(std::format("relax {}: tol {:.3f} mm, nothing moved ({} blocked)", r.iterations + 1, tol / kNmPerMm, blocked));
      if (!clearing && held >= o.hold && blocked == 0) break;  // balanced
      schedule();
      continue;
    }
    // The drawing judges. Worse: the objects that stepped and stand near a violation it added go back (the
    // nearest if none does), three times wider each time; what is still worse goes back whole.
    Drawn cur = draw();
    const double kBlame = 0.5 * kNmPerMm;
    int tries = 0;
    for (; !notWorse(cur, best, kWalkSlack) && tries < 3; ++tries) {
      auto added = addedViolations(prev.board, prev.violations, cur.board, cur.violations);
      std::vector<char> blamed(objs.size(), 0);
      bool any = false;
      const double blame = kBlame * (tries + 1);
      for (const DrcViolation& v : added) {
        std::array<int, 2> nets{itemNet(cur.board, v.a), v.hasB ? itemNet(cur.board, v.b) : kNoNet};
        size_t nearest = objs.size();
        double nd = std::numeric_limits<double>::max();
        bool hit = false;
        for (size_t k = 0; k < objs.size(); ++k) {
          const Owner& ow = t.owners[objs[k].owner];
          if ((ow.c - prev.pos[k]).len() < 1 || blamed[k]) continue;
          double dist = (ow.c - v.pos).len();
          if (dist < nd) { nd = dist; nearest = k; }
          if (dist < blame || (dist < 3 * blame && std::ranges::contains(nets, ow.net))) { blamed[k] = 1; hit = any = true; }
        }
        if (!hit && nearest < objs.size()) { blamed[nearest] = 1; any = true; }
      }
      if (!any) break;
      for (size_t k = 0; k < objs.size(); ++k)
        if (blamed[k]) {
          moveOwner(t, objs[k].owner, prev.pos[k] - t.owners[objs[k].owner].c);
          objs[k].scale = std::max(0.1, objs[k].scale * 0.6);
        }
      cur = draw();
    }
    const bool kept = notWorse(cur, best, kWalkSlack);
    r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} step(s) ({} blocked){}; {} conflict(s) ({} deep, {} short), {:.3f} mm short, {:.1f} mm, forces {:.1f}, {} blame round(s): {}",
                                r.iterations + 1, tol / kNmPerMm, stepped, blocked, clearing ? ", clearing" : "", cur.conflicts, cur.deep, cur.shorts,
                                cur.depth / 1e6, cur.length / 1e6, sumOf(forcesOf(cur)), tries, kept ? "kept" : "rolled back"));
    if (kept) {
      if (notWorse(cur, best, 0)) best = cur;
      prev = std::move(cur);
    } else {
      t = prev.model;
      ++r.rollbacks;
      for (Obj& ob : objs) ob.scale = std::max(0.1, ob.scale * 0.6);
    }
    schedule();
  }
  if (debug) std::println(stderr, "F7 model: {} iterations, {} drawings, {} rollbacks", r.iterations, r.drawings, r.rollbacks);
  for (size_t k = 0; k < objs.size(); ++k)
    if ((best.pos[k] - objs[k].start).len() > 1000) ++(t.owners[objs[k].owner].kind == Owner::Kind::Via ? r.viaMoves : r.junctionMoves);
  r.conflictsAfter = best.conflicts;
  r.lengthAfter = best.length;
  r.depthAfter = best.depth;
  r.forceAfter = sumOf(forcesOf(best));
  r.stats = best.stats;
  r.wires = best.wires;
  t = std::move(best.owning);
  b = std::move(best.board);
  r.drawn = true;
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow || v.kind == Violation::Kind::OutsideBoard) r.violations.push_back(v);
  return r;
}

}  // namespace xr::topo
