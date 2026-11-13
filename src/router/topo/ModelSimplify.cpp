#include "router/topo/ModelSimplify.h"

#include <algorithm>
#include <cstdlib>
#include <format>
#include <map>
#include <numeric>
#include <print>
#include <set>

#include "core/Connectivity.h"
#include "core/Prof.h"
#include "router/topo/ModelRelax.h"
#include "topo/Relay.h"

namespace xr::topo {

namespace {

// A chain of wires from one node of the net to another through owners that only pass it on.
struct Link {
  int a = -1, b = -1;       // the owners it joins
  std::vector<int> wires;
  std::vector<int> inside;  // the vias and branch points it passes
  double weight = 0;
  bool kept = false;        // a fixed wire or a pair's among them: never taken out
  bool out = false;
};

// The links of one net that are not needed.
std::vector<Link> spareLinks(const Topology& t, const std::vector<int>& wires) {
  std::map<int, std::vector<int>> at;  // owner -> the net's wires ending there
  for (int wi : wires)
    for (int e : t.wires[size_t(wi)].end) at[e].push_back(wi);
  // An owner passes a link on: a via or a branch point of exactly two wires (not one wire with both its ends there).
  auto passes = [&](int o) {
    const Owner& O = t.owners[size_t(o)];
    if (O.kind != Owner::Kind::Via && O.kind != Owner::Kind::Junction) return false;
    const auto& ws = at.at(o);
    return ws.size() == 2 && ws[0] != ws[1];
  };
  std::vector<Link> links;
  std::set<int> taken;
  for (const auto& [node, ws] : at) {
    if (passes(node)) continue;
    for (int first : ws) {
      if (taken.contains(first)) continue;
      Link l;
      l.a = node;
      int wi = first, from = node;
      while (true) {
        taken.insert(wi);
        const Wire& w = t.wires[size_t(wi)];
        l.wires.push_back(wi);
        l.weight += tautLength(t, wi);
        l.kept |= w.locked || w.pair >= 0 || w.zone >= 0;
        const int to = w.end[0] == from ? w.end[1] : w.end[0];
        if (!passes(to)) {
          l.b = to;
          break;
        }
        l.inside.push_back(to);
        if (t.owners[size_t(to)].kind == Owner::Kind::Via) l.weight += kViaCost;
        l.kept |= t.owners[size_t(to)].locked;
        const auto& next = at.at(to);
        from = to;
        wi = next[0] == wi ? next[1] : next[0];
        if (taken.contains(wi)) break;  // (cannot be: a chain is walked from one of its ends once)
      }
      if (l.b >= 0) links.push_back(std::move(l));
    }
  }
  // The tree of the least weight (Kruskal), the links that must stay first.
  std::vector<size_t> order(links.size());
  std::iota(order.begin(), order.end(), size_t(0));
  r::stable_sort(order, [&](size_t x, size_t y) { return std::pair(!links[x].kept, links[x].weight) < std::pair(!links[y].kept, links[y].weight); });
  std::map<int, int> root;
  auto find = [&](int x) {
    while (true) {
      auto it = root.find(x);
      if (it == root.end() || it->second == x) return x;
      x = it->second;
    }
  };
  for (size_t k : order) {
    Link& l = links[k];
    const int ra = find(l.a), rb = find(l.b);
    if (ra == rb) {
      l.out = !l.kept;
      continue;
    }
    root[ra] = rb;
  }
  // A branch point or a via left with one wire by this is the end of a stub nobody drew: the stub goes too.
  bool again = true;
  while (again) {
    again = false;
    std::map<int, int> degree, before;
    for (const Link& l : links) {
      ++before[l.a], ++before[l.b];
      if (!l.out) ++degree[l.a], ++degree[l.b];
    }
    for (Link& l : links) {
      if (l.out || l.kept) continue;
      for (int end : {l.a, l.b}) {
        const Owner& O = t.owners[size_t(end)];
        if (O.kind != Owner::Kind::Junction || O.locked) continue;
        if (degree[end] == 1 && before[end] > 1) {
          l.out = true;
          again = true;
        }
      }
      if (again) break;
    }
  }
  std::erase_if(links, [](const Link& l) { return !l.out; });
  return links;
}

}  // namespace

SimplifyResult simplifyNets(Board& b, Topology& t) {
  ProfScope pf("nets simplified");
  SimplifyResult res;
  static const bool off = std::getenv("XR_NO_SIMPLIFY") != nullptr;
  if (off) return res;
  std::vector<std::vector<int>> byNet(b.nets.size());
  for (int wi = 0; wi < int(t.wires.size()); ++wi) {
    const Wire& w = t.wires[size_t(wi)];
    if (w.net < 0 || w.net >= int(b.nets.size()) || w.end[0] < 0 || w.end[1] < 0) continue;
    byNet[size_t(w.net)].push_back(wi);
  }
  std::vector<std::pair<int, std::vector<Link>>> plan;
  for (int n = 0; n < int(b.nets.size()); ++n) {
    if (byNet[size_t(n)].size() < 2 || b.flexFixed(n)) continue;  // a flexibly fixed net keeps its topology
    std::vector<Link> spare = spareLinks(t, byNet[size_t(n)]);
    if (!spare.empty()) plan.emplace_back(n, std::move(spare));
  }
  if (plan.empty()) return res;
  // Taken out of the board; a net that would lose a connection by it (a wire lying over a pad was that pad's
  // connection) is left as it is, and the rest done again without it.
  const Board before = b;
  for (int round = 0; round < 2 && !plan.empty(); ++round) {
    Board edited = before;
    std::set<uint32_t> tracks, vias;
    std::vector<uint32_t> touched;
    std::vector<char> nets(b.nets.size(), 0);
    for (const auto& [n, spare] : plan) {
      nets[size_t(n)] = 1;
      std::set<int> gone;
      for (const Link& l : spare) {
        gone.insert(l.wires.begin(), l.wires.end());
        for (int wi : l.wires) tracks.insert(t.wires[size_t(wi)].tracks.begin(), t.wires[size_t(wi)].tracks.end());
        for (int o : l.inside)
          if (t.owners[size_t(o)].kind == Owner::Kind::Via && t.owners[size_t(o)].viaId) vias.insert(t.owners[size_t(o)].viaId);
      }
      // The wires left at a branch point a link went from are laid again: two of them there are one wire now.
      for (const Link& l : spare)
        for (int end : {l.a, l.b}) {
          if (t.owners[size_t(end)].kind != Owner::Kind::Junction) continue;
          for (int wi : byNet[size_t(n)])
            if (!gone.contains(wi) && (t.wires[size_t(wi)].end[0] == end || t.wires[size_t(wi)].end[1] == end))
              touched.insert(touched.end(), t.wires[size_t(wi)].tracks.begin(), t.wires[size_t(wi)].tracks.end());
        }
    }
    std::erase_if(edited.tracks, [&](const Track& x) { return x.id && tracks.contains(x.id); });
    std::erase_if(edited.vias, [&](const Via& v) { return v.id && vias.contains(v.id); });
    const Connectivity was = Connectivity::compute(before, nets), now = Connectivity::compute(edited, nets);
    std::map<int, int> lines;
    for (const RatsLine& l : was.ratsnest) --lines[l.net];
    for (const RatsLine& l : now.ratsnest) ++lines[l.net];
    const size_t planned = plan.size();
    std::erase_if(plan, [&](const auto& p) { return lines[p.first] > 0; });
    if (plan.size() != planned) continue;  // (again without the nets that lost a connection)
    Topology followed;
    modelOfEdited(followed, edited, {&t, &before, touched});
    for (const auto& [n, spare] : plan)
      for (const Link& l : spare) {
        ++res.links;
        res.wires += int(l.wires.size());
        for (int o : l.inside) res.vias += t.owners[size_t(o)].kind == Owner::Kind::Via;
        res.log.push_back(std::format("{}: a {} of {} wire(s), {:.3f} mm, taken out between ({:.3f}, {:.3f}) and ({:.3f}, {:.3f})", b.nets[size_t(n)].name, l.a == l.b ? "loop" : "spare link",
                                      l.wires.size(), l.weight / kNmPerMm, t.owners[size_t(l.a)].c.x / kNmPerMm, t.owners[size_t(l.a)].c.y / kNmPerMm, t.owners[size_t(l.b)].c.x / kNmPerMm,
                                      t.owners[size_t(l.b)].c.y / kNmPerMm));
      }
    b = std::move(edited);
    t = std::move(followed);
    break;
  }
  if (static const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr; debug)
    for (const std::string& line : res.log) std::println(stderr, "simplify: {}", line);
  return res;
}

}  // namespace xr::topo
