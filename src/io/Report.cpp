#include "io/Report.h"

#include <algorithm>
#include <format>
#include <numeric>
#include <map>
#include <ranges>
#include <vector>

#include "core/Connectivity.h"

namespace xr::io {

namespace {

// Natural order for reference designators: R2 before R10.
bool refLess(const std::string& a, const std::string& b) {
  auto split = [](const std::string& s) {
    size_t i = s.find_first_of("0123456789");
    std::string pre = s.substr(0, i);
    long num = i == std::string::npos ? -1 : std::atol(s.c_str() + i);
    return std::pair{pre, num};
  };
  auto [pa, na] = split(a);
  auto [pb, nb] = split(b);
  return pa != pb ? pa < pb : na != nb ? na < nb : a < b;
}

}  // namespace

std::string routingReport(const Board& b) {
  auto conn = Connectivity::compute(b);
  std::string out;
  BBox bb = b.bbox();
  double total = 0;
  for (auto& t : b.tracks) total += t.length();
  int arcs = int(r::count_if(b.tracks, &Track::isArc));
  out += std::format("Board: {}\n", b.name);
  out += std::format("Size: {:.2f} x {:.2f} mm, {} copper layer(s)\n", bb.width() / kNmPerMm, bb.height() / kNmPerMm,
                     b.copperCount());
  out += std::format("Components: {}, pads: {}, nets: {}\n", b.components.size(), b.pads.size(), b.nets.size());
  out += std::format("Tracks: {} ({} arcs), total length {:.1f} mm; vias: {}\n", b.tracks.size(), arcs, total / 1e6,
                     b.vias.size());
  out += std::format("Unrouted connections: {} in {} net(s)\n\n", conn.ratsnest.size(), conn.unroutedNets);

  out += "Layer                 Tracks   Length, mm\n";
  for (LayerId l : b.copperLayers()) {
    double len = 0;
    int n = 0;
    for (auto& t : b.tracks)
      if (t.layer == l) {
        len += t.length();
        ++n;
      }
    out += std::format("{:<20}{:>8}{:>13.1f}{}\n", b.layers[l].name, n, len / 1e6, b.layers[l].plane ? "  (plane)" : "");
  }

  struct NetStat {
    double length = 0;
    int vias = 0, pads = 0, unrouted = 0;
  };
  std::vector<NetStat> nets(b.nets.size());
  for (auto& t : b.tracks)
    if (t.net >= 0) nets[t.net].length += t.length();
  for (auto& v : b.vias)
    if (v.net >= 0) nets[v.net].vias++;
  for (auto& p : b.pads)
    if (p.net >= 0) nets[p.net].pads++;
  for (auto& r : conn.ratsnest) nets[r.net].unrouted++;
  std::vector<int> order(nets.size());
  r::iota(order, 0);
  r::sort(order, std::greater{}, [&](int i) { return nets[i].length; });
  out += "\nNet                             Pads   Length, mm   Vias   Unrouted\n";
  for (int i : order) {
    const NetStat& s = nets[i];
    if (s.pads < 2 && s.length == 0) continue;
    out += std::format("{:<32}{:>4}{:>13.1f}{:>7}{:>11}\n", b.nets[i].name, s.pads, s.length / 1e6, s.vias,
                       s.unrouted ? std::to_string(s.unrouted) : std::string("-"));
  }
  // The differential pairs: the lengths of the two nets' tracks, their difference against the allowed one.
  if (!b.hispeed.diffSignals.empty()) {
    out += "\nDifferential pair       Positive        Length, mm   Negative        Length, mm   Difference   Allowed\n";
    for (const DiffSignal& d : b.hispeed.diffSignals) {
      double len[2] = {0, 0};
      std::string names[2];
      for (int k = 0; k < 2; ++k)
        if (const SignalCluster* c = b.hispeed.clusterOf(k ? d.signalB : d.signalA))
          for (const std::string& n : c->nets) {
            names[k] += (names[k].empty() ? "" : ",") + n;
            if (int ni = b.findNet(n); ni >= 0) len[k] += nets[size_t(ni)].length;
          }
      const double diff = std::abs(len[0] - len[1]);
      out += std::format("{:<24}{:<16}{:>10.3f}   {:<16}{:>10.3f}{:>13.3f}{:>10.3f}{}\n", d.name, names[0], len[0] / 1e6, names[1], len[1] / 1e6,
                         diff / 1e6, double(d.mismatch) / 1e6, d.mismatch > 0 && diff > double(d.mismatch) ? "  exceeds" : "");
    }
  }
  return out;
}

std::string bomCsv(const Board& b) {
  std::map<std::pair<std::string, std::string>, std::vector<std::string>> groups;
  for (auto& c : b.components) groups[{c.value, c.footprint}].push_back(c.ref);
  std::vector<std::pair<std::pair<std::string, std::string>, std::vector<std::string>>> rows(groups.begin(), groups.end());
  for (auto& [k, refs] : rows) r::sort(refs, refLess);
  r::sort(rows, refLess, [](auto& row) -> auto& { return row.second.front(); });
  auto quote = [](const std::string& s) {
    std::string q = "\"";
    for (char ch : s) q += ch == '"' ? std::string("\"\"") : std::string(1, ch);
    return q + "\"";
  };
  std::string out = "Count;RefDes;Value;Footprint\n";
  for (auto& [k, refs] : rows) {
    std::string list;
    for (auto [i, r] : v::enumerate(refs)) list += (i ? ", " : "") + r;
    out += std::format("{};{};{};{}\n", refs.size(), quote(list), quote(k.first), quote(k.second));
  }
  return out;
}

}  // namespace xr::io
