#include "core/Swap.h"

#include <map>
#include <tuple>

#include "core/Edit.h"
#include "geom/Ranges.h"

namespace xr {

namespace {

// The pads of a component that have a gate and a gate's equivalence, per gate, in the component's order.
std::map<int, std::vector<int>> gatesOf(const Board& b, const Component& c) {
  std::map<int, std::vector<int>> gates;
  for (int pi : c.pads) {
    const Pad& p = b.pads[size_t(pi)];
    if (p.gate != 0 && p.gateEqual != 0) gates[p.gate].push_back(pi);
  }
  return gates;
}

// The pins of two gates, pin for pin: by the names in the symbol when each gate's names are distinct and the two
// have the same ones, else in order. Empty: the gates do not match.
SwappedPads gatePairs(const Board& b, const std::vector<int>& ga, const std::vector<int>& gb) {
  SwappedPads out;
  if (ga.size() != gb.size() || ga.empty()) return out;
  auto names = [&](const std::vector<int>& g) {
    std::map<std::string, int> m;
    for (int pi : g) m.emplace(b.pads[size_t(pi)].symbolName(), pi);
    return m;
  };
  const auto na = names(ga), nb = names(gb);
  const bool byName = na.size() == ga.size() && nb.size() == gb.size() && r::equal(na | v::keys, nb | v::keys);
  if (byName)
    for (auto& [name, pa] : na) out.push_back({pa, nb.at(name)});
  else
    for (size_t i = 0; i < ga.size(); ++i) out.push_back({ga[i], gb[i]});
  return out;
}

struct EndMove {
  int track, end;
  Vec2 by;
};
struct ViaMove {
  int via;
  Vec2 by;
};

// What stands on pad `from` of its net and goes to `to` with it: the wire ends on the layers both pads have
// copper on, the vias on the pad and the wire ends on those. False: something of it is fixed.
bool collect(const Board& b, const Pad& from, const Pad& to, std::vector<EndMove>& ends, std::vector<ViaMove>& vias) {
  if (from.net == kNoNet) return true;
  const Shape shape = from.shapeGeom();
  const Vec2 by = to.pos.v() - from.pos.v();
  auto has = [&](int track, int end) { return r::any_of(ends, [&](const EndMove& m) { return m.track == track && m.end == end; }); };
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    const Track& t = b.tracks[size_t(ti)];
    if (t.net != from.net || !from.onLayer(t.layer)) continue;
    for (int e : {0, 1}) {
      if (!shape.contains(e ? t.b.v() : t.a.v())) continue;
      if (t.locked) return false;
      if (to.onLayer(t.layer)) ends.push_back({ti, e, by});
    }
  }
  for (int vi = 0; vi < int(b.vias.size()); ++vi) {
    const Via& via = b.vias[size_t(vi)];
    if (via.net != from.net || !(via.layers & from.copper) || !shape.contains(via.pos.v())) continue;
    if (via.locked) return false;
    if (!(via.layers & to.copper)) continue;
    vias.push_back({vi, by});
    for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
      const Track& t = b.tracks[size_t(ti)];
      if (t.net != via.net || !via.onLayer(t.layer)) continue;
      for (int e : {0, 1}) {
        if (((e ? t.b.v() : t.a.v()) - via.pos.v()).len() > 1.0 || has(ti, e)) continue;
        if (t.locked) return false;
        ends.push_back({ti, e, by});
      }
    }
  }
  return true;
}

SwapRefusal exchange(Board& b, const SwappedPads& pairs) {
  std::vector<EndMove> ends;
  std::vector<ViaMove> vias;
  for (auto [pa, pb] : pairs) {
    const Pad& a = b.pads[size_t(pa)];
    const Pad& c = b.pads[size_t(pb)];
    if (a.net == c.net) continue;  // (nothing to exchange: the wires of both are of one net)
    if (!collect(b, a, c, ends, vias) || !collect(b, c, a, ends, vias)) return SwapRefusal::Locked;
  }
  // The ends of one track move together: an arc keeps its shape.
  std::map<int, std::pair<Vec2, Vec2>> moved;
  for (const EndMove& m : ends) {
    const Track& t = b.tracks[size_t(m.track)];
    auto [it, fresh] = moved.try_emplace(m.track, t.a.v(), t.b.v());
    (m.end ? it->second.second : it->second.first) += m.by;
  }
  for (auto& [ti, ab] : moved) edit::stretchEnds(b.tracks[size_t(ti)], ab.first, ab.second);
  for (const ViaMove& m : vias) b.vias[size_t(m.via)].pos = Point(b.vias[size_t(m.via)].pos.v() + m.by);
  for (auto [pa, pb] : pairs) {
    Pad& a = b.pads[size_t(pa)];
    Pad& c = b.pads[size_t(pb)];
    if (a.net == c.net) continue;
    std::swap(a.net, c.net);
    // A signal that begins or ends at one of the pins goes with its net to the other.
    const PinRef ra{b.components[size_t(a.component)].ref, a.number}, rb{b.components[size_t(c.component)].ref, c.number};
    auto turn = [&](PinRef& p) {
      if (p == ra) p = rb;
      else if (p == rb) p = ra;
    };
    for (SignalCluster& cl : b.hispeed.clusters) {
      turn(cl.source);
      for (auto& [from, to] : cl.pinPairs) {
        turn(from);
        turn(to);
      }
      for (Signal& s : cl.signalList) turn(s.receiver);
    }
  }
  return SwapRefusal::None;
}

}  // namespace

std::vector<SwapGroup> pinGroups(const Board& b) {
  std::vector<SwapGroup> out;
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    std::map<std::pair<int, int>, std::vector<int>> of;  // (gate, pinEqual) -> the pads
    for (int pi : b.components[size_t(ci)].pads) {
      const Pad& p = b.pads[size_t(pi)];
      if (p.pinEqual != 0) of[{p.gate, p.pinEqual}].push_back(pi);
    }
    for (auto& [key, pads] : of) {
      if (pads.size() < 2) continue;
      SwapGroup g{ci, {}};
      for (int pi : pads) g.members.push_back({pi});
      out.push_back(std::move(g));
    }
  }
  return out;
}

std::vector<SwapGroup> gateGroups(const Board& b) {
  std::vector<SwapGroup> out;
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    std::map<int, SwapGroup> of;  // gateEqual -> the gates
    for (auto& [gate, pads] : gatesOf(b, b.components[size_t(ci)])) {
      SwapGroup& g = of[b.pads[size_t(pads.front())].gateEqual];
      g.component = ci;
      // A gate that does not match the first of its group, pin for pin, is not of the group.
      if (g.members.empty() || !gatePairs(b, g.members.front(), pads).empty()) g.members.push_back(pads);
    }
    for (auto& [eq, g] : of)
      if (g.members.size() >= 2) out.push_back(std::move(g));
  }
  return out;
}

std::vector<SwapPlace> swapPlaces(const Board& b, const std::vector<SwapGroup>& groups) {
  std::vector<SwapPlace> out(b.pads.size());
  for (int g = 0; g < int(groups.size()); ++g)
    for (int m = 0; m < int(groups[size_t(g)].members.size()); ++m)
      for (int pi : groups[size_t(g)].members[size_t(m)]) out[size_t(pi)] = {g, m};
  return out;
}

SwapRefusal swapPins(Board& b, int padA, int padB, SwappedPads* done) {
  if (padA < 0 || padB < 0 || padA >= int(b.pads.size()) || padB >= int(b.pads.size()) || padA == padB) return SwapRefusal::NotEquivalent;
  const Pad& a = b.pads[size_t(padA)];
  const Pad& c = b.pads[size_t(padB)];
  if (a.component < 0 || a.component != c.component || a.pinEqual == 0 || a.pinEqual != c.pinEqual || a.gate != c.gate)
    return SwapRefusal::NotEquivalent;
  const SwappedPads pairs{{padA, padB}};
  const SwapRefusal why = exchange(b, pairs);
  if (why == SwapRefusal::None && done) *done = pairs;
  return why;
}

SwapRefusal swapGates(Board& b, int padA, int padB, SwappedPads* done) {
  if (padA < 0 || padB < 0 || padA >= int(b.pads.size()) || padB >= int(b.pads.size())) return SwapRefusal::NotEquivalent;
  const Pad& a = b.pads[size_t(padA)];
  const Pad& c = b.pads[size_t(padB)];
  if (a.component < 0 || a.component != c.component || a.gate == c.gate || a.gate == 0 || c.gate == 0 || a.gateEqual == 0 ||
      a.gateEqual != c.gateEqual)
    return SwapRefusal::NotEquivalent;
  const auto gates = gatesOf(b, b.components[size_t(a.component)]);
  const auto ga = gates.find(a.gate), gb = gates.find(c.gate);
  if (ga == gates.end() || gb == gates.end()) return SwapRefusal::NotEquivalent;
  const SwappedPads pairs = gatePairs(b, ga->second, gb->second);
  if (pairs.empty()) return SwapRefusal::NotEquivalent;
  const SwapRefusal why = exchange(b, pairs);
  if (why == SwapRefusal::None && done) *done = pairs;
  return why;
}

}  // namespace xr
