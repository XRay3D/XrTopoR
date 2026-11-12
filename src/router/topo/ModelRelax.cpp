#include "router/topo/ModelRelax.h"

#include <algorithm>
#include <future>
#include <cmath>
#include <cstdio>
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
constexpr int kWalkReal = 0;                   // ... but with no more real violations (2 let in: Arcs ended 63 mm longer, the best seven iterations back)
constexpr double kNoise = 5000;                // nm: a shallower violation is the drawing's noise at the rule's edge
constexpr int kFreeze = 3;                     // iterations an object stands still after its step was blamed
constexpr double kBalanced = 0.01;             // a force below this is none: the object is where it should be
constexpr double kFullForce = 0.2;             // ... and from this on the step is the whole limit (TopoR's forces always are)
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
      if (o.layers == 0 || (o.kind != Owner::Kind::Pad && o.kind != Owner::Kind::Via && o.kind != Owner::Kind::Zone)) continue;
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
// A via against the keepouts that keep vias out: held off by its radius (touching allowed), pushed out
// from where it stands inside one.
void viaBarPush(const Topology& t, int oi, Vec2 at, CopperPush& out) {
  const Owner& ob = t.owners[oi];
  if (ob.kind != Owner::Kind::Via || t.viaBars.empty()) return;
  Vec2 way;
  const double depth = t.viaBarIntrusion(at, ob.halfWidth, ob.layers, &way);
  if (depth <= 1000) return;
  out.shortfall += depth - 1000;
  out.push = out.push + way * (depth + 2000);
}
// The part of a mover standing at p that keeps off copper o, and its net: a clasp's end of the other net (its
// own net's end may sit on its copper: AMK310's clasp went onto the via of SCL, its SDA end 0.1 mm off that via),
// the whole of it against a third net; the rest their centre. Nothing: o is the mover's own.
struct KeepOff {
  Shape probe;
  int net;
};
std::optional<KeepOff> keepingOff(const Owner& mover, const Owner& o, Vec2 p) {
  if (mover.kind == Owner::Kind::Clasp && mover.axis.len2() > 0) {
    if (o.net == mover.net) return KeepOff{Shape::circle(p - mover.axis, 0), mover.net2};
    if (o.net == mover.net2) return KeepOff{Shape::circle(p + mover.axis, 0), mover.net};
    return KeepOff{Shape::capsule(p - mover.axis, p + mover.axis, 0), mover.net};
  }
  if (o.net == mover.net) return std::nullopt;
  return KeepOff{Shape::circle(p, 0), mover.net};
}

CopperPush copperPush(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 at) {
  const Owner& ob = t.owners[oi];
  CopperPush out;
  segmentPush(b, t, oi, at, out);
  viaBarPush(t, oi, at, out);
  const double maxClr = double(b.maxClearance());
  grid.near(at, ob.halfWidth + ob.axis.len() + maxClr + 1000, [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (!(o.layers & ob.layers)) return;
    const auto k = keepingOff(ob, o, at);
    if (!k) return;
    double req = ob.halfWidth + requiredClearance(b, k->net, o.net, ob.layers & o.layers);
    if (o.kind == Owner::Kind::Zone && b.zones[o.zone].useClearance) req = ob.halfWidth + double(b.zones[o.zone].clearance);  // a pour's own clearance
    double d = o.shape.distance(k->probe);
    if (d >= req - 1000) return;
    Vec2 n = awayFrom(o.shape, k->probe.kind == Shape::Kind::Point ? k->probe.a : at, o.c);  // (from the end that keeps off)
    if (n.len2() == 0) return;
    out.shortfall += req - 1000 - d;
    out.push = out.push + n * ((req - d + 2000) * (o.kind == Owner::Kind::Via ? 0.5 : 1.0));
  });
  return out;
}

// What the nominal clearance adds to the rule between a moving object and other copper (0 where the design
// has no nominal above the minimum). TopoR's vias stop at the nominal clearance from the copper around them
// (its F7 of Arcs_standard_routing: 109 of 145 with the nearest copper at 0.43-0.47 mm, rule 0.3 / 0.45).
double nominalExcess(const Board& b, int netA, int netB, LayerMask layers) {
  if (!b.hasNominal() || netA < 0) return 0;
  if (netB < 0) netB = netA;
  LayerId layer = -1;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if ((layers >> l) & 1) {
      layer = l;
      break;
    }
  return std::max(0.0, double(b.clearanceNom(netA, netB, layer)) - double(b.clearance(netA, netB, layer)));
}

// A via does not go into a pad of its own net: its wire to that pad pulls it there, and nothing of another
// net's rule holds it off (arz: vias 70 um from the centre of their pad's end after F7; TopoR's F7 of
// Arcs_standard_routing leaves no via nearer than 1.86 mm to the pad its wire goes to, its F5 had 1.43). What
// the via keeps from the pad's copper: its own radius (they may touch); -1: no such rule for the two.
// A branch point is held off the pads and vias of its net the same way when it is not to be merged with them
// (F6: TopoR's moves its branch points and merges none — 25 before and after on Arcs_standard_routing).
double ownPadRule(const Owner& mover, const Owner& other, bool holdBranchPoints) {
  if (other.net != mover.net || mover.net == kNoNet) return -1;
  if (mover.kind == Owner::Kind::Via && other.kind == Owner::Kind::Pad) return mover.halfWidth;
  if (holdBranchPoints && mover.kind == Owner::Kind::Junction && (other.kind == Owner::Kind::Pad || other.kind == Owner::Kind::Via)) return mover.halfWidth;
  return -1;
}

// What stops the object at p: copper of other nets closer than the rule by more in sum than where it
// comes from (a step out of a conflict is no conflict). The worst such copper's centre.
std::optional<Vec2> blockerAt(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 p, bool holdBranchPoints) {
  const Owner& ob = t.owners[oi];
  double maxClr = double(b.maxClearance());
  for (const ClearancePair& p : b.nominalRules) maxClr = std::max(maxClr, double(p.clearance));
  double shortThere = 0, shortHere = 0, worstShort = 0;
  std::optional<Vec2> worst;
  {
    CopperPush there, here;
    segmentPush(b, t, oi, p, there);
    segmentPush(b, t, oi, ob.c, here);
    viaBarPush(t, oi, p, there);
    viaBarPush(t, oi, ob.c, here);
    shortThere += there.shortfall;
    shortHere += here.shortfall;
    if (there.shortfall > 0) {
      worstShort = there.shortfall;
      worst = p - there.push;
    }
  }
  grid.near(p, ob.halfWidth + ob.axis.len() + maxClr + 1000 + (p - ob.c).len(), [&](int oj) {
    if (oj == oi) return;
    const Owner& o = t.owners[oj];
    if (!(o.layers & ob.layers)) return;
    double req = ownPadRule(ob, o, holdBranchPoints);
    const auto kThere = keepingOff(ob, o, p), kHere = keepingOff(ob, o, ob.c);
    if (req < 0) {
      if (!kThere) return;
      req = ob.halfWidth + requiredClearance(b, kThere->net, o.net, ob.layers & o.layers) + nominalExcess(b, kThere->net, o.net, ob.layers & o.layers);
      if (o.kind == Owner::Kind::Zone && b.zones[o.zone].useClearance) req = ob.halfWidth + double(b.zones[o.zone].clearance);
    }
    const double dThere = kThere ? o.shape.distance(kThere->probe) : o.shape.distance(p), dHere = kHere ? o.shape.distance(kHere->probe) : o.shape.distance(ob.c);
    double there = std::max(0.0, req - 1000 - dThere), here = std::max(0.0, req - 1000 - dHere);
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

// The DRC names a violation once per pair of pieces (an arc is many tracks): the places are what is judged —
// the violations of one pair of nets within a millimetre of each other, as deep as the deepest of them.
struct Place {
  std::pair<int, int> nets;
  Vec2 pos;
  double depth = 0;
  bool shorted = false;
};
std::vector<Place> placesOf(const Board& b, const std::vector<DrcViolation>& vs) {
  std::vector<Place> out;
  for (const DrcViolation& v : vs) {
    const std::pair<int, int> nets = std::minmax(itemNet(b, v.a), v.hasB ? itemNet(b, v.b) : kNoNet);
    const double depth = std::max(0.0, v.required - v.actual);
    Place* at = nullptr;
    for (Place& p : out)
      if (p.nets == nets && (p.pos - v.pos).len() < 1 * kNmPerMm) {
        at = &p;
        break;
      }
    if (!at) {
      out.push_back({nets, v.pos, depth, v.type == DrcViolation::Type::Short});
      continue;
    }
    if (depth > at->depth) {
      at->depth = depth;
      at->pos = v.pos;
    }
    at->shorted |= v.type == DrcViolation::Type::Short;
  }
  return out;
}
// The places of `now` that `was` has not, or has shallower by more than the drawing's noise: what a change added.
std::vector<Place> addedPlaces(const std::vector<Place>& was, const std::vector<Place>& now) {
  std::vector<Place> added;
  for (const Place& p : now) {
    const Place* old = nullptr;
    for (const Place& q : was)
      if (q.nets == p.nets && (q.pos - p.pos).len() < 1 * kNmPerMm && (!old || q.depth > old->depth)) old = &q;
    if (!old || p.depth > old->depth + kNoise || (p.shorted && !old->shorted)) added.push_back(p);
  }
  return added;
}

// The connections `now` has lost against `was`, as places to blame someone for: both ends of every line of a net
// that has more lines now, that no line of `was` matches. (A drawing with a connection lost is refused whole; with
// nobody to blame the walk stood still for good — every step of every iteration taken back.)
std::vector<Place> lostLinks(const std::vector<RatsLine>& was, const std::vector<RatsLine>& now) {
  std::map<int, int> more;
  for (const RatsLine& l : now) ++more[l.net];
  for (const RatsLine& l : was) --more[l.net];
  std::vector<Place> lost;
  for (const RatsLine& l : now) {
    if (more[l.net] <= 0) continue;
    auto same = [&](const RatsLine& q) {
      return q.net == l.net && (((q.a - l.a).len() < kNmPerMm && (q.b - l.b).len() < kNmPerMm) || ((q.a - l.b).len() < kNmPerMm && (q.b - l.a).len() < kNmPerMm));
    };
    if (r::any_of(was, same)) continue;
    lost.push_back({{l.net, l.net}, l.a, 0, true});
    lost.push_back({{l.net, l.net}, l.b, 0, true});
  }
  return lost;
}

struct Obj {
  int owner = -1;
  Vec2 last;         // the force of the last iteration (Rprop)
  double scale = 1;  // of the step limit: x 1.5 while the force keeps its way, x 0.6 when it turns, at most 1
  int ends = 0;      // wires ending at it
  Vec2 start;
  int frozen = 0;    // iterations it stands still for: its step broke the drawing
};

// The model drawn on a copy of the board, and what the drawing is worth.
struct Drawn {
  Topology model;   // the model as drawn: its wires own the tracks of the board it came with
  Topology owning;  // the same model, its wires owning the drawing's tracks
  Board board;
  std::vector<Place> places;
  std::vector<RatsLine> loose;  // the connections not made
  std::vector<Vec2> pos;  // the objects' centres
  RealizeStats stats;
  int wires = 0;
  int conflicts = 0;      // as the DRC counts them
  double shortfall = 0;   // ... and sums their depth
  int deep = 0, shorts = 0;  // places deeper than the limit of a violation; places where copper touches
  int real = 0;              // places deeper than the noise (those two among them)
  double depth = 0, length = 0;
  size_t unrouted = 0;
  double score() const { return length + depth * kDepthCost + double(places.size()) * kCountCost; }
};

}  // namespace

double DrawingScore::score() const { return length + depth * kDepthCost + double(places) * kCountCost + double(vias) * kViaCost; }

DrawingScore scoreDrawing(const Board& b) {
  DrawingScore s;
  DrcOptions d;
  d.unconnected = false;
  auto unrouted = std::async(std::launch::async, [&] { return Connectivity::compute(b).ratsnest.size(); });  // (with the DRC)
  const std::vector<DrcViolation> vs = runDrc(b, d);
  s.conflicts = int(vs.size());
  for (const DrcViolation& v : vs) s.shortfall += std::max(0.0, v.required - v.actual);
  const std::vector<Place> places = placesOf(b, vs);
  s.places = int(places.size());
  for (const Place& p : places) {
    s.depth += p.depth;
    if (p.shorted) ++s.shorts;
    else if (p.depth > kNarrowDeficitLimit) ++s.deep;
    if (p.shorted || p.depth > kNoise) ++s.real;
  }
  s.length = b.tracksLength();
  s.vias = int(b.vias.size());
  s.unrouted = unrouted.get();
  return s;
}

std::optional<Redrawn> redrawTracks(const Board& edited, bool flips, int& drawings) {
  ProfScope p("tracks edited: redrawing");
  Redrawn r{{}, edited, {}};
  Topology::assignIds(r.board);
  r.model.build(r.board);
  int nFlips = 0;
  std::vector<Violation> stop;
  if (!prepareModel(r.model, flips, false, nFlips, stop)) {
    if (std::getenv("XR_TOPO_DEBUG"))
      for (const Violation& v : stop)
        std::println(stderr, "tracks edited: the model does not stand: {} at ({:.3f}, {:.3f}), wires {} of {} and {} of {}",
                     v.kind == Violation::Kind::Crossing ? "crossing" : v.kind == Violation::Kind::ThroughPad ? "through a pad" : "other", v.pos.x / 1e6, -v.pos.y / 1e6,
                     v.wireA, v.wireA >= 0 ? r.board.nets[size_t(r.model.wires[size_t(v.wireA)].net)].name : "-", v.wireB,
                     v.wireB >= 0 ? r.board.nets[size_t(r.model.wires[size_t(v.wireB)].net)].name : "-");
    return std::nullopt;
  }
  RealizeStats st;
  int wires = 0;
  drawModel(r.board, r.model, true, st, wires);
  r.score = scoreDrawing(r.board);
  ++drawings;
  return r;
}

std::vector<char> viasTooClose(const Board& b, const Topology& t) {
  std::vector<char> out(t.owners.size(), 0);
  OwnerGrid grid;
  grid.build(t);
  for (int oi = 0; oi < int(t.owners.size()); ++oi) {
    const Owner& o = t.owners[oi];
    if (o.kind == Owner::Kind::Via && o.layers != 0 && copperPush(b, t, grid, oi, o.c).shortfall > 0) out[size_t(oi)] = 1;
  }
  return out;
}

bool betterDrawing(const DrawingScore& a, const DrawingScore& than) {
  const auto ka = std::tuple(a.unrouted, a.shorts, a.deep, a.real), kb = std::tuple(than.unrouted, than.shorts, than.deep, than.real);
  return ka < kb || (ka == kb && a.score() < than.score());
}

OptimizeModelResult optimizeModel(Board& b, Topology& t, const OptimizeModelOptions& o) {
  ProfScope pAll("F7 model total");
  OptimizeModelResult r;
  int nFlips = 0;
  r.untangled = resolveCrossings(b, t);
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
      // The vias of a flexibly fixed net stand (its topology is fixed, its vias' places with it); its branch
      // points move: where they are is the shape of its wires.
      if (ow.kind == Owner::Kind::Via && b.flexFixed(ow.net)) continue;
      // (A clasp moves as a branch point: the pair's wire and its two single wires pull it.)
      if (!o.owners.empty() && !r::contains(o.owners, oi)) continue;
      if ((ow.kind == Owner::Kind::Via && o.vias) || (ow.kind == Owner::Kind::Junction && o.junctions) || (ow.kind == Owner::Kind::Clasp && o.junctions && o.clasps))
        objs.push_back({oi, {}, 1.0, ends[oi], ow.c});
    }
  }
  std::map<int, size_t> objOf;
  for (size_t k = 0; k < objs.size(); ++k) objOf[objs[k].owner] = k;
  // With the owners named, the wires at them alone are drawn.
  std::vector<int> drawOnly;
  if (!o.owners.empty())
    for (int wi = 0; wi < int(t.wires.size()); ++wi)
      if (objOf.contains(t.wires[size_t(wi)].end[0]) || objOf.contains(t.wires[size_t(wi)].end[1])) drawOnly.push_back(wi);

  auto judge = [&](Drawn& c) {
    ProfScope pj("F7 model: judging");
    DrcOptions d;
    d.unconnected = false;
    // The connections at the same time as the DRC (both read the board).
    auto unrouted = std::async(std::launch::async, [&] { return Connectivity::compute(c.board).ratsnest; });
    const std::vector<DrcViolation> vs = runDrc(c.board, d);
    c.conflicts = int(vs.size());
    c.shortfall = c.depth = 0;
    c.deep = c.shorts = c.real = 0;
    for (const DrcViolation& v : vs) c.shortfall += std::max(0.0, v.required - v.actual);
    c.places = placesOf(c.board, vs);
    for (const Place& p : c.places) {
      c.depth += p.depth;
      if (p.shorted) ++c.shorts;
      else if (p.depth > kNarrowDeficitLimit) ++c.deep;
      if (p.shorted || p.depth > kNoise) ++c.real;
    }
    c.length = c.board.tracksLength();
    c.loose = unrouted.get();
    c.unrouted = c.loose.size();
  };
  auto draw = [&] {
    ProfScope p("F7 model: drawing");
    std::optional<ProfScope> pc(std::in_place, "F7 model: copies");
    Drawn c{t, t, b, {}, {}, {}, {}};
    pc.reset();
    for (const Obj& ob : objs) c.pos.push_back(t.owners[ob.owner].c);
    // The vias on the 0.1 um grid the board's files keep (a position between two of its points would be
    // written either way, and the model next to the board would not hash the same).
    for (const Owner& ow : t.owners)
      if (ow.kind == Owner::Kind::Via && ow.via >= 0 && ow.via < int(c.board.vias.size()))
        c.board.vias[ow.via].pos = Point(Vec2{std::round(ow.c.x / 100) * 100, std::round(ow.c.y / 100) * 100});
    drawModel(c.board, c.owning, true, c.stats, c.wires, false, o.owners.empty() ? nullptr : &drawOnly);
    judge(c);
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
  // The judge. A violation is not to be bought with length (Polubasov, 2010): one drawing is better than
  // another when it has less unrouted, then fewer places shorted, fewer deeper than the limit of a violation,
  // fewer real ones at all — and, those equal, a smaller sum of the length, 100 mm per mm of shortfall and 1 mm
  // per place (what is left to weigh is the noise at the rule's edge). The result is the best drawing; the
  // walk may stand a few mm above it, but never with more lost, shorted, deep or real.
  auto keys = [](const Drawn& c) { return std::tuple(c.unrouted, c.shorts, c.deep, c.real); };
  auto better = [&](const Drawn& c, const Drawn& than) { return keys(c) < keys(than) || (keys(c) == keys(than) && c.score() < than.score()); };
  auto walkable = [&](const Drawn& c, const Drawn& best) {
    if (better(c, best)) return true;
    return c.unrouted <= best.unrouted && c.shorts <= best.shorts && c.deep <= best.deep && c.real <= best.real + kWalkReal &&
           c.score() <= best.score() + kWalkSlack;
  };

  OwnerGrid grid;
  // What the object would be short of at `at`: the copper too close there, and the wires across its spokes
  // that the spokes, as long as they would be there, have no room for. Asked before the step is taken: a step
  // cannot be taken back (the way back may lie across an edge that does not flip, and the object stays short
  // of where it was — arz_4L: two branch points of +5B, 0.55 and 0.78 mm off after a step of 1 mm and back).
  // ... and at the nominal clearance: what the spokes that have it now would lack of the room the realiser asks
  // for to lay the wires at the nominal from the copper at their ends (round copper: vias, round pads, branch
  // points). A step may not take that room: the object stops where its wires would have to close in.
  auto takesNominal = [&](const Owner& o) {
    return o.net >= 0 && (o.kind == Owner::Kind::Via || o.kind == Owner::Kind::Junction || (o.kind == Owner::Kind::Pad && o.shape.kind == Shape::Kind::Point));
  };
  struct Short {
    double least = 0, nominal = 0;
  };
  auto shortAt = [&](int oi, Vec2 at) {
    const Vec2 d = at - t.owners[oi].c;
    Short s;
    s.least = copperPush(b, t, grid, oi, at).shortfall;
    const bool nominal = b.hasNominal();
    for (const LayerMesh& m : t.layers) {
      if (oi >= int(m.ownerVerts.size())) continue;
      for (int v : m.ownerVerts[oi])
        for (int e : starEdges(m, v)) {
          const Edge& E = m.edges[e];
          if ((E.v[0] != v && E.v[1] != v) || E.cross.empty()) continue;
          EdgeCapacity c = edgeCapacity(t, m, e);
          const Vec2 other = m.verts[E.v[0] == v ? E.v[1] : E.v[0]].p;
          const double grown = (m.verts[v].p + d - other).len() - c.L;
          // XR_F7_RESERVE=<um>: a step may not leave a spoke less room than that (it is refused before it is drawn,
          // not blamed after). Tried 2026-11-12 at 20 / 50 / 100 um: RMT19M_A8SWA_V5 109 drawings -> 88 / 88 / 76 and
          // 7.2 -> 5.5 s, the length 7485.9 -> 7483.6 / 7502.6 / 7500.7 mm, the violations left 0 -> 1 / 4 / 0;
          // arz_2L and AMK310 neither faster nor shorter, the violations a few more or fewer either way. Off.
          static const double kReserve = std::getenv("XR_F7_RESERVE") ? std::atof(std::getenv("XR_F7_RESERVE")) * 1000 : 0.0;
          s.least += std::max(0.0, kReserve - (c.slack + grown));  // `need` holds the ends' reach: the slack is of the whole length
          if (!nominal) continue;
          double excess = 0;
          for (int end = 0; end < 2; ++end) {
            const Owner& o = t.owners[m.verts[E.v[end]].owner];
            const Wire& w = t.wires[t.crossings[end == 0 ? E.cross.front() : E.cross.back()].wire];
            if (takesNominal(o) && o.net != w.net && w.net >= 0) excess += nominalExcess(b, o.net, w.net, LayerMask(1) << m.layer);
          }
          // Only a spoke that has the nominal's room now: one already tighter is the minimum's business (in a
          // dense place everything is, and nothing could move: arz_2L gained half a millimetre).
          if (const double room = c.slack - excess - kNominalRoom; excess > 0 && room >= 0) s.nominal += std::max(0.0, -(room + grown));
        }
    }
    return s;
  };

  Drawn prev = draw();  // where the walk stands
  Drawn best = prev;    // the best drawing seen: the result
  r.conflictsBefore = best.conflicts;
  r.lengthBefore = best.length;
  r.depthBefore = best.shortfall;
  r.forceBefore = sumOf(forcesOf(best));
  r.log.push_back(std::format("start: {} conflict(s) in {} place(s) ({} deep, {} shorted, {} real), {} unrouted, {:.3f} mm short, {:.1f} mm, forces {:.1f}", best.conflicts,
                              best.places.size(), best.deep, best.shorts, best.real, best.unrouted, best.shortfall / 1e6, best.length / 1e6, r.forceBefore));

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
      double maxClr = double(b.maxClearance());
      for (const ClearancePair& p : b.nominalRules) maxClr = std::max(maxClr, double(p.clearance));
      std::vector<Vec2> shared = force;
      for (size_t k = 0; k < objs.size(); ++k) {
        const int oi = objs[k].owner;
        const Owner& ob = t.owners[oi];
        if (clear[k].len2() > 0 || force[k].len() < kBalanced) continue;
        grid.near(ob.c, ob.halfWidth + maxClr + kContact, [&](int oj) {
          if (oj == oi) return;
          const Owner& x = t.owners[oj];
          if (!(x.layers & ob.layers)) return;
          double req = ownPadRule(ob, x, !o.merge);
          if (req < 0) {
            if (x.net == ob.net) return;
            req = ob.halfWidth + requiredClearance(b, ob.net, x.net, ob.layers & x.layers) + nominalExcess(b, ob.net, x.net, ob.layers & x.layers);
          }
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
    double freeForce = 0;  // what is left of the forces with the contacts taken off: what the steps go by
    for (size_t k = 0; k < objs.size(); ++k)
      if (clear[k].len2() == 0) freeForce += force[k].len();
    // Steps, the strongest force first, each object on its own: the limit by Rprop, the step along the force
    // and as long as the force is strong, checked against the copper where it lands (shortened, or slid along
    // what blocks it) and against the room in the model around it — the step goes back if that got shorter.
    std::vector<size_t> order(objs.size());
    r::iota(order, size_t(0));
    auto strength = [&](size_t k) { return clear[k].len2() > 0 ? 1e9 : force[k].len(); };
    r::sort(order, std::greater{}, strength);
    int stepped = 0, blocked = 0;
    int why[3] = {0, 0, 0};  // attempts refused by the copper, by the mesh, by the room in the model
    std::vector<std::pair<size_t, Vec2>> taken;  // the steps as they went, in order
    for (size_t k : order) {
      Obj& ob = objs[k];
      const bool off = clear[k].len2() > 0;
      Vec2 F = off ? clear[k] : force[k];
      if (clearing && !off) continue;
      if (ob.frozen > 0 && !off) {
        --ob.frozen;
        continue;
      }
      if (!off && F.len() < kBalanced) {
        ob.last = F;
        continue;
      }
      if (ob.last.len2() > 0) ob.scale = std::clamp(ob.scale * (F.dot(ob.last) > 0 ? 1.5 : 0.6), 0.1, 1.0);
      ob.last = F;
      double limit = tol * ob.scale;
      if (tight[k]) limit = std::min(limit, kTightStep);
      Vec2 delta = off ? (F.len() > limit ? F.normalized() * limit : F) : F.normalized() * (limit * std::min(1.0, F.len() / kFullForce));
      if (delta.len() < kMinStep) continue;
      const Vec2 at = t.owners[ob.owner].c;
      const Short shortBefore = shortAt(ob.owner, at);
      bool went = false;
      auto attempt = [&](Vec2 d) {
        if (d.len() < kMinStep) return false;
        if (blockerAt(b, t, grid, ob.owner, at + d, !o.merge)) return ++why[0], false;
        // (A step off copper too close is held to the minimum alone: it may take a spoke's nominal room.)
        if (const Short there = shortAt(ob.owner, at + d); there.least > shortBefore.least + 1 || (!off && there.nominal > 1)) return ++why[2], false;
        if (moveOwner(t, ob.owner, d) <= 0) return ++why[1], false;
        return true;
      };
      for (double f : {1.0, 0.5, 0.25, 0.125}) {
        if ((went = attempt(delta * f))) break;
        if (f == 1.0) {
          if (auto blk = blockerAt(b, t, grid, ob.owner, at + delta, !o.merge)) {
            Vec2 n = at + delta - *blk;
            if (n.len() > 1) {
              n = n.normalized();
              Vec2 tg{-n.y, n.x};
              if ((went = attempt(tg * delta.dot(tg) * 0.9))) break;
            }
          }
        }
      }
      if (went) {
        ++stepped;
        taken.push_back({k, t.owners[ob.owner].c - at});
      } else {
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
    // The drawing judges. Not to be walked on: the objects blamed for what it added go back and stand still a
    // few iterations; what is still no good after four tries goes back whole.
    Drawn cur = draw();
    // What a drawing added to the one the walk stands on: the places of violation and the connections lost.
    auto addedBy = [&](const Drawn& now) {
      std::vector<Place> added = addedPlaces(prev.places, now.places);
      if (now.unrouted > prev.unrouted) r::copy(lostLinks(prev.loose, now.loose), std::back_inserter(added));
      return added;
    };
    if (debug) {
      std::println(stderr, "relax {}: attempts refused by copper {}, by the mesh {}, by the room {}", r.iterations + 1, why[0], why[1], why[2]);
      for (const Place& v : addedBy(cur))
        std::println(stderr, "  added: {} / {} at ({:.3f}, {:.3f}) {:.3f} mm short{}", v.nets.first >= 0 ? b.nets[v.nets.first].name : "-",
                     v.nets.second >= 0 ? b.nets[v.nets.second].name : "-", v.pos.x / 1e6, -v.pos.y / 1e6, v.depth / 1e6, v.shorted ? ", shorted" : "");
    }
    // Who to blame for a place the drawing added: the objects that stepped near it, and those of its two nets
    // further off (a via's step re-lays its wires far from it) — wider with every try; the nearest if none.
    constexpr double kBlame[] = {0.5 * kNmPerMm, 1.5 * kNmPerMm, 4 * kNmPerMm, 10 * kNmPerMm};
    auto blameFor = [&](const std::vector<Place>& added, int wide) {
      std::vector<char> blamed(objs.size(), 0);
      for (const Place& v : added) {
        std::array<int, 2> nets{v.nets.first, v.nets.second};
        size_t nearest = objs.size();
        double nd = std::numeric_limits<double>::max();
        bool hit = false;
        for (size_t k = 0; k < objs.size(); ++k) {
          const Owner& ow = t.owners[objs[k].owner];
          if ((ow.c - prev.pos[k]).len() < 1) continue;
          double dist = (ow.c - v.pos).len();
          if (dist < nd) { nd = dist; nearest = k; }
          if (dist < kBlame[wide] || (dist < 8 * kBlame[wide] && r::contains(nets, ow.net))) blamed[k] = 1, hit = true;
        }
        if (!hit && nearest < objs.size()) blamed[nearest] = 1;
      }
      return blamed;
    };
    // The blamed steps are taken out by taking the others again from where the walk stood (not by stepping back:
    // see shortAt).
    std::vector<char> out(objs.size(), 0);
    int tries = 0;
    for (; !walkable(cur, best) && tries < 4; ++tries) {
      if (debug)
        for (const Place& v : addedBy(cur))
          std::println(stderr, "  try {}: {} {} / {} at ({:.3f}, {:.3f}), {:.3f} mm short", tries,
                       v.nets.first == v.nets.second && v.depth == 0 ? "a connection lost," : v.shorted ? "shorted" : "added",
                       v.nets.first >= 0 ? b.nets[size_t(v.nets.first)].name : "-", v.nets.second >= 0 ? b.nets[size_t(v.nets.second)].name : "-",
                       v.pos.x / 1e6, -v.pos.y / 1e6, v.depth / 1e6);
      auto blamed = blameFor(addedBy(cur), tries);
      bool any = false;
      for (size_t k = 0; k < objs.size(); ++k)
        if (blamed[k] && !out[k]) {
          out[k] = 1;
          objs[k].scale = std::max(0.1, objs[k].scale * 0.6);
          objs[k].frozen = kFreeze;
          any = true;
        }
      if (!any) break;
      t = prev.model;
      for (auto [k, d] : taken)
        if (!out[k]) moveOwner(t, objs[k].owner, d);
      cur = draw();
    }
    const bool kept = walkable(cur, best);
    if (cur.unrouted > prev.unrouted)
      for (const Place& v : lostLinks(prev.loose, cur.loose))
        r.log.push_back(std::format("relax {}: a connection of {} lost, an end at ({:.3f}, {:.3f})", r.iterations + 1,
                                    v.nets.first >= 0 ? b.nets[size_t(v.nets.first)].name : "-", v.pos.x / 1e6, -v.pos.y / 1e6));
    if (!kept) {
      // Still worse: all of it goes back, and whoever stepped anywhere near what it added stands still a while.
      auto blamed = blameFor(addedBy(cur), 3);
      for (size_t k = 0; k < objs.size(); ++k)
        if (blamed[k]) objs[k].frozen = 2 * kFreeze;
    }
    r.log.push_back(std::format("relax {}: tol {:.3f} mm, {} step(s) ({} blocked){}; {} conflict(s) in {} place(s) ({} deep, {} shorted, {} real), {} unrouted, {:.3f} mm short, {:.1f} mm, forces {:.1f} ({:.1f} free), {} blame round(s): {}",
                                r.iterations + 1, tol / kNmPerMm, stepped, blocked, clearing ? ", clearing" : "", cur.conflicts, cur.places.size(), cur.deep,
                                cur.shorts, cur.real, cur.unrouted, cur.shortfall / 1e6, cur.length / 1e6, sumOf(forcesOf(cur)), freeForce, tries, !kept ? "rolled back" : better(cur, best) ? "kept, the best" : "kept"));
    if (kept) {
      if (better(cur, best)) best = cur;
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
  r.forceAfter = sumOf(forcesOf(best));
  // A branch point that came to rest inside copper of its own net merges with the pad or via there (TopoR's
  // F7 of Arcs_standard_routing: 13 of its 25 branch points went so, ten into a pad and three into a via; ours
  // stood in the copper off its centre, with a wire's end there). On the drawing: the wire between the two
  // goes, the other wires' ends at the branch point move to the pad's connection point; the model is built
  // anew from those tracks and drawn (the leads by the pads' pattern), and the drawing is taken when the judge
  // finds it no worse. A branch point an arc ends at stays.
  if (o.merge) {
    struct Merge {
      int junction, into;
    };
    std::vector<Merge> merges;
    const Topology& bt = best.owning;
    grid.build(bt);
    grid.slack = 0;
    for (const Obj& ob : objs) {
      const Owner& ow = bt.owners[ob.owner];
      if (ow.kind != Owner::Kind::Junction || ob.ends < 3 || b.flexFixed(ow.net)) continue;  // a merge is a change of topology
      int into = -1;
      double nearest = 0;
      grid.near(ow.c, 1000, [&](int oj) {
        const Owner& x = bt.owners[oj];
        if (oj == ob.owner || x.net != ow.net || !(x.layers & ow.layers) || x.locked || x.shape.distance(ow.c) > 0) return;
        if (into < 0 || (x.c - ow.c).len() < nearest) {
          into = oj;
          nearest = (x.c - ow.c).len();
        }
      });
      if (into >= 0) merges.push_back({ob.owner, into});
    }
    r.junctionsInCopper = int(merges.size());
    if (!merges.empty()) {
      Drawn m{bt, bt, best.board, {}, {}, {}};
      Board& mb = m.board;
      constexpr double kAt = 3;  // nm: a track's end is the branch point's
      // One at a time: the wires' ends moved to the pad's centre may cross what lay between (the model of the
      // tracks then says so: wires crossing, a wire through another net's pad), and that branch point stays.
      auto stopping = [](const Board& x) {
        Board c = x;
        Topology::assignIds(c);
        Topology m;
        m.build(c);
        int n = 0;
        for (const Violation& v : m.violations) n += v.kind == Violation::Kind::Crossing || v.kind == Violation::Kind::ThroughPad;
        return n;
      };
      int done = 0;
      for (const Merge& g : merges) {
        const Owner& j = bt.owners[g.junction];
        const Point to(bt.owners[g.into].c);
        bool arc = false;
        std::vector<size_t> at;
        for (size_t i = 0; i < mb.tracks.size(); ++i) {
          const Track& tr = mb.tracks[i];
          if (tr.net != j.net || !((j.layers >> tr.layer) & 1)) continue;
          if ((tr.a.v() - j.c).len() > kAt && (tr.b.v() - j.c).len() > kAt) continue;
          arc |= tr.isArc();
          at.push_back(i);
        }
        if (debug && (arc || at.empty()))
          std::println(stderr, "merge: branch point of {} at ({:.3f}, {:.3f}) stays: {}", b.nets[j.net].name, j.c.x / 1e6, -j.c.y / 1e6, arc ? "an arc ends at it" : "no track ends at it");
        if (arc || at.empty()) continue;
        std::vector<Track> was = mb.tracks;
        std::set<uint32_t> gone;
        for (const Wire& w : bt.wires)
          if ((w.end[0] == g.junction && w.end[1] == g.into) || (w.end[0] == g.into && w.end[1] == g.junction)) gone.insert(w.tracks.begin(), w.tracks.end());
        for (size_t i : at) {
          Track& tr = mb.tracks[i];
          if ((tr.a.v() - j.c).len() <= kAt) tr.a = to;
          if ((tr.b.v() - j.c).len() <= kAt) tr.b = to;
        }
        std::erase_if(mb.tracks, [&](const Track& tr) { return (tr.id && gone.contains(tr.id)) || (!tr.isArc() && tr.a == tr.b); });
        if (stopping(mb) > 0) {
          if (debug) std::println(stderr, "merge: branch point of {} at ({:.3f}, {:.3f}) stays: its wires would cross what lies between", b.nets[j.net].name, j.c.x / 1e6, -j.c.y / 1e6);
          mb.tracks = std::move(was);
          continue;
        }
        ++done;
      }
      if (done > 0) {
        Topology::assignIds(mb);
        Topology mt;
        mt.build(mb);
        int flips = 0;
        std::vector<Violation> stop;
        if (!prepareModel(mt, o.flips, false, flips, stop)) {
          r.log.push_back(std::format("merge: {} branch point(s) into their pads and vias: the model of the merged tracks has {} violation(s), left as it was", done, stop.size()));
        } else {
          m.model = mt;
          m.owning = std::move(mt);
          drawModel(m.board, m.owning, true, m.stats, m.wires);
          judge(m);
          ++r.drawings;
          // Not by the length: the wires now go by the pad's pattern from its centre, where they cut across its
          // copper to a point off it.
          const bool taken = keys(m) <= keys(best);
          r.log.push_back(std::format("merge: {} branch point(s) into their pads and vias; {} conflict(s) in {} place(s) ({} deep, {} shorted), {:.3f} mm short, {:.1f} mm: {}", done,
                                      m.conflicts, m.places.size(), m.deep, m.shorts, m.shortfall / 1e6, m.length / 1e6, taken ? "taken" : "left as it was"));
          if (taken) {
            r.merged = done;
            best = std::move(m);
          }
        }
      }
    }
  }
  r.conflictsAfter = best.conflicts;
  r.lengthAfter = best.length;
  r.depthAfter = best.shortfall;
  r.stats = best.stats;
  r.wires = best.wires;
  t = std::move(best.owning);
  b = std::move(best.board);
  r.drawn = true;
  for (const Violation& v : t.violations)
    if (v.kind == Violation::Kind::Overflow || v.kind == Violation::Kind::OutsideBoard || v.kind == Violation::Kind::Blocked) r.violations.push_back(v);
  return r;
}

}  // namespace xr::topo
