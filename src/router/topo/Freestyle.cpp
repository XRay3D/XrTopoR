#include "router/topo/Freestyle.h"

#include <algorithm>
#include <cmath>

#include "core/Edit.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"
#include "router/topo/Wires.h"

namespace xr::topo {

namespace {

constexpr int kPushRounds = 4;
constexpr double kTurnStep = 10;  // degrees per step

// Steps short enough that a moved object never jumps over a wire it should push or bend.
double stepLength(const Board& b) {
  double c = std::numeric_limits<double>::max();
  for (auto& nc : b.netClasses) c = std::min(c, double(nc.clearance));
  return std::clamp(0.5 * c, 0.05 * kNmPerMm, 0.25 * kNmPerMm);
}

// A copper object that moved in this step and pushes others.
struct Mover {
  Shape shape;
  LayerMask layers = 0;
  int net = kNoNet;
};

void markAttached(const Board& b, const Shape& s, LayerMask layers, int net, std::vector<char>& chosen) {
  chosen.resize(b.tracks.size(), 0);
  auto m = edit::attachedTo(b, s, layers, net);
  for (size_t i = 0; i < m.size(); ++i) chosen[i] |= m[i];
}

std::vector<Mover> moversOf(const Board& b, const std::vector<int>& comps, const std::vector<int>& vias) {
  std::vector<Mover> out;
  for (int ci : comps)
    for (int pi : b.components[ci].pads) {
      const Pad& p = b.pads[pi];
      if (p.copper) out.push_back({p.shapeGeom(), p.copper, p.net});
    }
  for (int vi : vias) {
    const Via& v = b.vias[vi];
    out.push_back({Shape::circle(v.pos.v(), v.diameter / 2.0), v.layers, v.net});
  }
  return out;
}

// Pushes the vias (and components) of other nets out of the movers' way; what was pushed pushes in
// turn. Pushed objects' wires and the other nets' wires the movers touch join the re-shaped set.
void pushAround(Board& b, std::vector<Mover> movers, const edit::Fragment& fixed, Push push, std::vector<char>& chosen,
                BBox& region) {
  std::vector<char> movedComp(b.components.size(), 0), movedVia(b.vias.size(), 0);
  for (int ci : fixed.components) movedComp[ci] = 1;
  for (int vi : fixed.vias) movedVia[vi] = 1;
  double maxClr = double(b.maxClearance());
  for (int round = 0; round < kPushRounds && !movers.empty(); ++round) {
    SpatialIndex idx;
    idx.build(b);
    std::vector<Vec2> viaPush(b.vias.size()), compPush(b.components.size());
    chosen.resize(b.tracks.size(), 0);
    for (const Mover& m : movers) {
      BBox bb = m.shape.bbox().inflated(maxClr);
      idx.query(bb, m.layers, [&](ItemRef r) {
        int net = itemNet(b, r);
        if (net == m.net && net != kNoNet) return;
        double req = requiredClearance(b, m.net, net, m.layers & itemLayers(b, r));
        double gap = std::numeric_limits<double>::max();
        Vec2 centre;
        for (auto& s : itemShapes(b, r)) {
          gap = std::min(gap, m.shape.distance(s));
          centre = s.center();
        }
        if (gap >= req) return;
        Vec2 dir = (centre - m.shape.center()).normalized();
        if (dir.len2() == 0) dir = {1, 0};
        Vec2 need = dir * (req - gap + 1000);
        auto keepLonger = [](Vec2& acc, Vec2 v) {
          if (v.len2() > acc.len2()) acc = v;
        };
        switch (r.type) {
          case ItemType::Via:
            if (!movedVia[r.index] && !b.vias[r.index].locked) keepLonger(viaPush[r.index], need);
            break;
          case ItemType::Pad:
            if (int ci = b.pads[r.index].component;
                push == Push::ViasAndComponents && ci >= 0 && !movedComp[ci] && !b.components[ci].locked)
              keepLonger(compPush[ci], need);
            break;
          case ItemType::Track:
            if (!b.tracks[r.index].locked) chosen[r.index] = 1;  // bends around the mover
            break;
          case ItemType::Zone: break;
        }
      });
    }
    std::vector<int> pushedVias, pushedComps;
    for (int vi = 0; vi < int(b.vias.size()); ++vi)
      if (viaPush[vi].len2() > 0) {
        edit::Fragment f;
        f.vias = {vi};
        edit::Motion mo;
        mo.shift = viaPush[vi];
        region.add(Shape::circle(b.vias[vi].pos.v(), b.vias[vi].diameter / 2.0).bbox());
        edit::move(b, f, mo);
        region.add(Shape::circle(b.vias[vi].pos.v(), b.vias[vi].diameter / 2.0).bbox());
        pushedVias.push_back(vi);
      }
    for (int ci = 0; ci < int(b.components.size()); ++ci)
      if (compPush[ci].len2() > 0) {
        edit::Fragment f;
        f.components = {ci};
        edit::Motion mo;
        mo.shift = compPush[ci];
        region.add(edit::bboxOf(b, f));
        edit::move(b, f, mo);
        region.add(edit::bboxOf(b, f));
        pushedComps.push_back(ci);
      }
    movers = moversOf(b, pushedComps, pushedVias);
    for (const Mover& m : movers) markAttached(b, m.shape, m.layers, m.net, chosen);
    for (int vi : pushedVias) movedVia[vi] = 1;
    for (int ci : pushedComps) movedComp[ci] = 1;
  }
}

BBox chosenBox(const Board& b, const std::vector<char>& chosen) {
  BBox bb;
  for (size_t i = 0; i < b.tracks.size() && i < chosen.size(); ++i)
    if (chosen[i])
      for (auto& s : itemShapes(b, {ItemType::Track, int(i)})) bb.add(s.bbox());
  return bb;
}

// One step; false (and the board unchanged) when blocked.
bool step(Board& b, FreestyleTarget& t, const edit::Motion& m, Push push) {
  std::optional<Board> before;
  if (push != Push::None) before = b;
  std::optional<Vec2> vertex0 = t.vertex;
  BBox region = edit::bboxOf(b, t.fragment);
  std::vector<char> chosen(b.tracks.size(), 0);
  std::vector<Mover> movers;
  if (t.vertex) {
    auto ends = edit::endsAt(b, *t.vertex, t.vertexLayer, t.vertexNet);
    if (ends.empty() || std::ranges::any_of(ends, [&](auto e) { return b.tracks[e.first].locked; })) return false;
    Vec2 to = m.apply(*t.vertex);
    region.add(*t.vertex);
    region.add(to);
    edit::moveVertex(b, ends[0].first, ends[0].second, to);
    t.vertex = to;
    chosen.resize(b.tracks.size(), 0);
    for (auto [ti, e] : edit::endsAt(b, to, t.vertexLayer, t.vertexNet)) chosen[ti] = 1;
  } else {
    if (!edit::move(b, t.fragment, m)) return false;
    region.add(edit::bboxOf(b, t.fragment));
    movers = moversOf(b, t.fragment.components, t.fragment.vias);
    for (const Mover& mv : movers) markAttached(b, mv.shape, mv.layers, mv.net, chosen);
  }
  if (push != Push::None) pushAround(b, movers, t.fragment, push, chosen, region);
  region.add(chosenBox(b, chosen));
  auto st = reshapeTracks(b, chosen, {.local = true});
  for (size_t i = b.tracks.size() - st.trackWire.size(); i < b.tracks.size(); ++i)
    for (auto& s : itemShapes(b, {ItemType::Track, int(i)})) region.add(s.bbox());
  if (before) {
    // Nothing may get worse around the step: what could not give way blocks it.
    region = region.inflated(double(b.maxClearance()) + 0.5 * kNmPerMm);
    SpatialIndex i0, i1;
    i0.build(*before);
    i1.build(b);
    if (regionConflicts(b, i1, region).count > regionConflicts(*before, i0, region).count) {
      b = std::move(*before);
      t.vertex = vertex0;
      return false;
    }
  }
  return true;
}

}  // namespace

FreestyleResult freestyle(Board& b, FreestyleTarget& t, Vec2 shift, double rotate, Vec2 pivot, Push push) {
  FreestyleResult r;
  t.fragment.tracks.clear();
  t.fragment.zones.clear();
  if (t.vertex) rotate = 0;
  int n = std::max({1, int(std::ceil(shift.len() / stepLength(b))), int(std::ceil(std::abs(rotate) / kTurnStep))});
  n = std::min(n, 200);
  for (int i = 0; i < n; ++i) {
    edit::Motion m;
    m.pivot = pivot + r.moved;
    m.rotate = rotate / n;
    m.shift = shift / n;
    if (!step(b, t, m, push)) {
      r.blocked = true;
      break;
    }
    r.moved += m.shift;
    r.turned += m.rotate;
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
      best = FreestyleTarget{{}, e, t.layer, t.net};
    }
  return best;
}

}  // namespace xr::topo
