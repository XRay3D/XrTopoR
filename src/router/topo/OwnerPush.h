#pragma once
// What a moving owner of the model is too close to, and which way off it lies: the copper of other nets nearer than
// the rule (pads, vias, pours), a wire along a far side of its star, the outline, a keepout's wall. F7 steps its
// vias and branch points by it, Freestyle pushes what stands in the way of a dragged object by it.
#include <cmath>
#include <map>
#include <optional>
#include <set>
#include <vector>

#include "core/Board.h"
#include "topo/Topology.h"

namespace xr::topo {

// The pads and vias by 2 mm cells, for what is near a point. The cells are as the owners lay when it was
// built; `near` takes the slack the owners may have moved by since.
struct OwnerGrid {
  static constexpr double kCell = 2 * kNmPerMm;
  std::map<std::pair<long, long>, std::vector<int>> cells;
  double slack = 0;
  // `junctions`: the branch points and free ends too (Freestyle pushes them).
  void build(const Topology& t, bool junctions = false) {
    cells.clear();
    for (int oi = 0; oi < int(t.owners.size()); ++oi) {
      const Owner& o = t.owners[oi];
      if (o.layers == 0 || (o.kind != Owner::Kind::Pad && o.kind != Owner::Kind::Via && o.kind != Owner::Kind::Zone && !(junctions && o.kind == Owner::Kind::Junction))) continue;
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
Vec2 awayFrom(const Shape& s, Vec2 at, Vec2 centre);

// The copper an object is too close to: what it is short of the rule, summed, and the way off. Pads and
// vias of other nets around it; and what its capacity never sees — a wire running along a far side of its
// star (crossing none of its spokes), the outline, a keepout's wall.
struct CopperPush {
  Vec2 push;
  double shortfall = 0;
};
void segmentPush(const Board& b, const Topology& t, int oi, Vec2 at, CopperPush& out);
// A via against the keepouts that keep vias out: held off by its radius (touching allowed), pushed out
// from where it stands inside one.
void viaBarPush(const Topology& t, int oi, Vec2 at, CopperPush& out);
// The part of a mover standing at p that keeps off copper o, and its net: a clasp's end of the other net (its
// own net's end may sit on its copper: AMK310's clasp went onto the via of SCL, its SDA end 0.1 mm off that via),
// the whole of it against a third net; the rest their centre. Nothing: o is the mover's own.
struct KeepOff {
  Shape probe;
  int net;
};
std::optional<KeepOff> keepingOff(const Owner& mover, const Owner& o, Vec2 p);
CopperPush copperPush(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 at);
// What the nominal clearance adds to the rule between a moving object and other copper (0 where the design
// has no nominal above the minimum). TopoR's vias stop at the nominal clearance from the copper around them
// (its F7 of Arcs_standard_routing: 109 of 145 with the nearest copper at 0.43-0.47 mm, rule 0.3 / 0.45).
double nominalExcess(const Board& b, int netA, int netB, LayerMask layers);
// What a via keeps from a pad of its own net, a branch point (when held) from the pads and vias of its net: its
// own radius (they may touch); -1: no such rule for the two.
double ownPadRule(const Owner& mover, const Owner& other, bool holdBranchPoints);
// What stops the object at p: copper of other nets closer than the rule by more in sum than where it
// comes from (a step out of a conflict is no conflict). The worst such copper's centre.
std::optional<Vec2> blockerAt(const Board& b, const Topology& t, const OwnerGrid& grid, int oi, Vec2 p, bool holdBranchPoints);

}  // namespace xr::topo
