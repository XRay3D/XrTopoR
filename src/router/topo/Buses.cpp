#include "router/topo/Buses.h"

#include <cmath>
#include <limits>
#include <map>
#include <numbers>

#include "geom/Ranges.h"

namespace xr::topo {

namespace {

using Seg = std::pair<Vec2, Vec2>;

bool crosses(const Seg& a, const Seg& c) {
  auto side = [](Vec2 p, Vec2 q, Vec2 r) { return (q - p).cross(r - p); };
  double d1 = side(a.first, a.second, c.first), d2 = side(a.first, a.second, c.second);
  double d3 = side(c.first, c.second, a.first), d4 = side(c.first, c.second, a.second);
  return ((d1 > 0 && d2 < 0) || (d1 < 0 && d2 > 0)) && ((d3 > 0 && d4 < 0) || (d3 < 0 && d4 > 0));
}

// The straight lines of a net: its pads in turn, each joined to the nearest of those before it.
std::vector<Seg> linesOf(const Board& b, const std::vector<int>& pads) {
  std::vector<Seg> out;
  for (size_t i = 1; i < pads.size(); ++i) {
    Vec2 p = b.pads[size_t(pads[i])].pos.v();
    Vec2 best = b.pads[size_t(pads[0])].pos.v();
    for (size_t k = 0; k < i; ++k)
      if (Vec2 q = b.pads[size_t(pads[k])].pos.v(); (q - p).len2() < (best - p).len2()) best = q;
    out.push_back({best, p});
  }
  return out;
}

int crossings(const std::vector<Seg>& a, const std::vector<Seg>& c) {
  int n = 0;
  for (auto& s : a)
    for (auto& t : c) n += crosses(s, t);
  return n;
}

}  // namespace

std::vector<Bus> findBuses(const Board& b, const std::vector<LayerId>& layers, const std::vector<int>& only, int minNets) {
  std::vector<std::vector<int>> padsOf(b.nets.size());
  for (auto [i, p] : v::enumerate(b.pads))
    if (p.net != kNoNet) padsOf[size_t(p.net)].push_back(int(i));
  auto routable = [&](int n) {
    const Net& net = b.nets[size_t(n)];
    return net.route && !net.flexFixed && padsOf[size_t(n)].size() >= 2 && (only.empty() || r::contains(only, n));
  };

  // Nets by the components they join, one pad on each.
  std::map<std::vector<int>, std::vector<int>> byComponents;
  for (int n = 0; n < int(b.nets.size()); ++n) {
    if (!routable(n)) continue;
    std::vector<int> comps;
    for (int p : padsOf[size_t(n)]) comps.push_back(b.pads[size_t(p)].component);
    r::sort(comps);
    if (comps.front() < 0 || r::adjacent_find(comps) != comps.end()) continue;
    byComponents[comps].push_back(n);
  }

  std::vector<Bus> buses;
  for (auto& [comps, nets] : byComponents) {
    if (int(nets.size()) < minNets) continue;
    std::vector<int> members = nets;
    if (comps.size() == 2) {
      // Side by side: the directions from the first component's pad to the second's close to their middle.
      auto angleOf = [&](int n) {
        Vec2 a, c;
        for (int p : padsOf[size_t(n)]) (b.pads[size_t(p)].component == comps[0] ? a : c) = b.pads[size_t(p)].pos.v();
        return std::atan2(c.y - a.y, c.x - a.x);
      };
      std::vector<double> ang;
      for (int n : nets) ang.push_back(angleOf(n));
      // The middle direction: the mean of the unit vectors.
      Vec2 sum;
      for (double a : ang) sum = sum + Vec2{std::cos(a), std::sin(a)};
      double mid = std::atan2(sum.y, sum.x);
      members.clear();
      for (auto [k, n] : v::enumerate(nets)) {
        double d = std::remainder(ang[k] - mid, 2 * std::numbers::pi);
        if (std::abs(d) <= std::numbers::pi / 6) members.push_back(n);
      }
      if (int(members.size()) < minNets) continue;
    }
    // A twisted bus: the nets whose lines cross the others' cannot lie beside them on one layer; the one crossing
    // the most goes, till none cross (they are routed as any other net).
    std::vector<std::vector<Seg>> ml;
    for (int n : members) ml.push_back(linesOf(b, padsOf[size_t(n)]));
    while (true) {
      std::vector<int> cnt(members.size(), 0);
      for (size_t i = 0; i < members.size(); ++i)
        for (size_t k = i + 1; k < members.size(); ++k)
          if (int c = crossings(ml[i], ml[k])) cnt[i] += c, cnt[k] += c;
      auto worst = r::max_element(cnt);
      if (*worst == 0) break;
      size_t at = size_t(worst - cnt.begin());
      members.erase(members.begin() + long(at));
      ml.erase(ml.begin() + long(at));
    }
    if (int(members.size()) < minNets) continue;
    buses.push_back({members, comps, -1});
  }

  // The layers, the larger buses first.
  r::stable_sort(buses, std::greater{}, [](const Bus& u) { return u.nets.size(); });
  std::vector<std::vector<Seg>> lines(buses.size());
  for (auto [i, u] : v::enumerate(buses))
    for (int n : u.nets) r::copy(linesOf(b, padsOf[size_t(n)]), std::back_inserter(lines[i]));
  std::vector<char> inBus(b.nets.size(), 0);
  for (auto& u : buses)
    for (int n : u.nets) inBus[size_t(n)] = 1;
  // The other nets, and the layers of their planar pads.
  struct Other {
    std::vector<Seg> lines;
    LayerMask smd = 0;
  };
  std::vector<Other> others;
  for (int n = 0; n < int(b.nets.size()); ++n) {
    if (inBus[size_t(n)] || !routable(n)) continue;
    Other o;
    for (int p : padsOf[size_t(n)])
      if (!b.pads[size_t(p)].isThrough()) o.smd |= b.pads[size_t(p)].copper;
    o.lines = linesOf(b, padsOf[size_t(n)]);
    others.push_back(std::move(o));
  }
  for (auto [i, u] : v::enumerate(buses)) {
    for (auto& o : others) u.crossedBy += crossings(lines[size_t(i)], o.lines) > 0;
    for (int n : u.nets)
      for (int p : padsOf[size_t(n)]) u.through &= b.pads[size_t(p)].isThrough();
  }
  for (auto [i, u] : v::enumerate(buses)) {
    double bestScore = std::numeric_limits<double>::max();
    for (LayerId l : layers) {
      bool fits = r::all_of(u.nets, [&](int n) {
        LayerMask assigned = b.assignedLayers(n);
        if (assigned && !((assigned >> l) & 1)) return false;
        return r::all_of(padsOf[size_t(n)], [&](int p) { return b.pads[size_t(p)].onLayer(l); });
      });
      if (!fits) continue;
      double score = 0;
      for (size_t k = 0; k < size_t(i); ++k)
        if (buses[k].layer == l) score += 1000.0 * crossings(lines[i], lines[k]);
      for (auto& o : others)
        if ((o.smd >> l) & 1) score += crossings(lines[size_t(i)], o.lines);
      if (score <= bestScore) {
        bestScore = score;
        u.layer = l;
      }
    }
  }
  return buses;
}

}  // namespace xr::topo
