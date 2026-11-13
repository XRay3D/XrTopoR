#include "router/topo/OwnerPush.h"

#include <algorithm>

#include "drc/Drc.h"
#include "geom/Geometry.h"

namespace xr::topo {

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

}  // namespace xr::topo
