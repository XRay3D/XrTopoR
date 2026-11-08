#include "router/auto/Layering.h"

#include <algorithm>
#include <numeric>

namespace xr::autoroute {

namespace {

constexpr long kHard = 1'000'000;  // a crossing on one layer, a layer the point may not use

struct Search {
  const LayerProblem& p;
  uint32_t all;
  std::vector<uint32_t> allowed;
  std::vector<std::vector<std::pair<int, bool>>> adj;  // per point: (other, hard)
  std::vector<std::vector<uint32_t>> endMasks;         // per point: the pads' layer masks at it

  explicit Search(const LayerProblem& pr) : p(pr) {
    all = p.layers >= 32 ? ~0u : (1u << p.layers) - 1;
    allowed.assign(size_t(p.vars), all);
    for (int v = 0; v < p.vars && v < int(p.allowed.size()); ++v)
      if (p.allowed[size_t(v)] & all) allowed[size_t(v)] = p.allowed[size_t(v)] & all;
    adj.assign(size_t(p.vars), {});
    for (auto [a, b] : p.differ) {
      adj[size_t(a)].push_back({b, true});
      adj[size_t(b)].push_back({a, true});
    }
    for (auto [a, b] : p.same) {
      adj[size_t(a)].push_back({b, false});
      adj[size_t(b)].push_back({a, false});
    }
    endMasks.assign(size_t(p.vars), {});
    for (const auto& e : p.ends) endMasks[size_t(e.var)].push_back(e.layers & all ? e.layers & all : all);
  }

  // The cost point v adds on layer l with the others as they are.
  long local(const std::vector<int>& x, int v, int l) const {
    long c = (allowed[size_t(v)] >> l) & 1 ? 0 : kHard;
    for (auto [o, hard] : adj[size_t(v)])
      if (hard ? x[size_t(o)] == l : x[size_t(o)] != l) c += hard ? kHard : 1;
    for (uint32_t m : endMasks[size_t(v)]) c += (m >> l) & 1 ? 0 : 1;
    return c;
  }

  Layering score(const std::vector<int>& x) const {
    Layering r;
    r.layer = x;
    for (auto [a, b] : p.differ) r.conflicts += x[size_t(a)] == x[size_t(b)];
    for (auto [a, b] : p.same) r.vias += x[size_t(a)] != x[size_t(b)];
    for (const auto& e : p.ends) r.vias += ((e.layers & all ? e.layers & all : all) >> x[size_t(e.var)]) & 1 ? 0 : 1;
    for (int v = 0; v < p.vars; ++v) r.conflicts += ((allowed[size_t(v)] >> x[size_t(v)]) & 1) ? 0 : 1;
    return r;
  }
  static long total(const Layering& r) { return long(r.conflicts) * kHard + r.vias; }

  // Points one by one to their best layer until nothing improves.
  void pointwise(std::vector<int>& x, std::mt19937& rng) const {
    std::vector<int> order(static_cast<size_t>(p.vars));
    std::iota(order.begin(), order.end(), 0);
    for (bool changed = true; changed;) {
      changed = false;
      std::shuffle(order.begin(), order.end(), rng);
      for (int v : order) {
        long best = local(x, v, x[size_t(v)]);
        int bl = x[size_t(v)];
        for (int l = 0; l < p.layers; ++l)
          if (long c = local(x, v, l); c < best) best = c, bl = l;
        if (bl != x[size_t(v)]) x[size_t(v)] = bl, changed = true;
      }
    }
  }

  // Two layers: the crossings bind points into components (each point's layer = the component's flip XOR its
  // parity); whole components flip until nothing improves.
  void components(std::vector<int>& x, std::mt19937& rng) const {
    const int n = p.vars;
    const size_t N = static_cast<size_t>(n);
    std::vector<int> parent(N), parity(N, 0);
    std::iota(parent.begin(), parent.end(), 0);
    auto find = [&](auto&& self, int v) -> std::pair<int, int> {  // (root, parity to it)
      if (parent[size_t(v)] == v) return {v, 0};
      auto [r, pr] = self(self, parent[size_t(v)]);
      parent[size_t(v)] = r;
      parity[size_t(v)] ^= pr;
      return {r, parity[size_t(v)]};
    };
    for (auto [a, b] : p.differ) {
      auto [ra, pa] = find(find, a);
      auto [rb, pb] = find(find, b);
      if (ra == rb) continue;  // an odd cycle stays a conflict
      parent[size_t(rb)] = ra;
      parity[size_t(rb)] = pa ^ pb ^ 1;
    }
    std::vector<int> root(N), par(N);
    for (int v = 0; v < n; ++v) std::tie(root[size_t(v)], par[size_t(v)]) = find(find, v);
    std::vector<std::vector<int>> members(N);
    for (int v = 0; v < n; ++v) members[size_t(root[size_t(v)])].push_back(v);
    std::vector<int> comps;
    for (int c = 0; c < n; ++c)
      if (!members[size_t(c)].empty()) comps.push_back(c);
    // Start from the points' present layers (one flip per component: its first point's).
    std::vector<int> flip(N, 0);
    for (int c : comps) flip[size_t(c)] = x[size_t(members[size_t(c)][0])] ^ par[size_t(members[size_t(c)][0])];
    auto apply = [&](int c) {
      for (int v : members[size_t(c)]) x[size_t(v)] = flip[size_t(c)] ^ par[size_t(v)];
    };
    for (int c : comps) apply(c);
    auto compCost = [&](int c) {
      long s = 0;
      for (int v : members[size_t(c)]) s += local(x, v, x[size_t(v)]);
      return s;
    };
    for (bool changed = true; changed;) {
      changed = false;
      std::shuffle(comps.begin(), comps.end(), rng);
      for (int c : comps) {
        const long before = compCost(c);
        flip[size_t(c)] ^= 1;
        apply(c);
        if (compCost(c) < before) {
          changed = true;
        } else {
          flip[size_t(c)] ^= 1;
          apply(c);
        }
      }
    }
  }
};

}  // namespace

Layering solveLayers(const LayerProblem& p, int restarts, unsigned seed) {
  Search s(p);
  std::mt19937 rng(seed);
  Layering best;
  best.conflicts = 1 << 30;
  for (int k = 0; k < std::max(1, restarts); ++k) {
    std::vector<int> x(static_cast<size_t>(p.vars));
    if (k == 0 && int(p.start.size()) == p.vars) x = p.start;
    else for (int v = 0; v < p.vars; ++v) {
      std::vector<int> ok;
      for (int l = 0; l < p.layers; ++l)
        if ((s.allowed[size_t(v)] >> l) & 1) ok.push_back(l);
      x[size_t(v)] = ok.empty() ? 0 : ok[rng() % ok.size()];
    }
    if (p.layers == 2) s.components(x, rng);
    s.pointwise(x, rng);
    Layering r = s.score(x);
    if (Search::total(r) < Search::total(best)) best = std::move(r);
  }
  if (p.vars == 0) best = Layering{};
  return best;
}

}  // namespace xr::autoroute
