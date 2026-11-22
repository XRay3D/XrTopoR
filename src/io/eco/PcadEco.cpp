#include "io/eco/PcadEco.h"

#include <fstream>
#include <map>
#include <set>

#include "core/Swap.h"
#include "geom/Ranges.h"
#include "io/Encoding.h"

namespace xr::io {

namespace {

std::string quoted(const std::string& s) { return "\"" + s + "\""; }
std::string line(const char* cmd, const std::string& a) { return std::string(cmd) + " " + quoted(a); }
std::string line(const char* cmd, const std::string& a, const std::string& b) { return std::string(cmd) + " " + quoted(a) + " " + quoted(b); }

// «D3-1»: as P-CAD names a node in an ECO file.
std::string pinName(const Board& b, const Pad& p) { return b.components[size_t(p.component)].ref + "-" + p.designator(); }

}  // namespace

std::vector<EcoChange> netlistDiff(const Board& base, const Board& now) {
  using Kind = EcoChange::Kind;
  auto netOf = [](const Board& b, const Pad& p) { return p.net >= 0 ? b.nets[size_t(p.net)].name : std::string(); };
  // The pins of the base by name, and its nets' pins.
  std::map<std::string, std::string> was;  // pin -> net
  std::map<std::string, std::set<std::string>> basePins, nowPins;  // net -> pins
  for (const Pad& p : base.pads) {
    if (p.component < 0) continue;
    const std::string pin = pinName(base, p), net = netOf(base, p);
    was[pin] = net;
    if (!net.empty()) basePins[net].insert(pin);
  }
  // The pads of `now` that the base has too, by pin name.
  std::map<std::string, int> padOf;
  for (int pi = 0; pi < int(now.pads.size()); ++pi) {
    const Pad& p = now.pads[size_t(pi)];
    if (p.component < 0) continue;
    const std::string pin = pinName(now, p);
    if (!was.contains(pin)) continue;
    padOf[pin] = pi;
    if (const std::string net = netOf(now, p); !net.empty()) nowPins[net].insert(pin);
  }
  std::vector<EcoChange> out;
  // Nets named anew: gone by name, the very pins under a name the base has not.
  std::map<std::string, std::string> renamed;  // old -> new
  std::set<std::string> newNames;
  for (const Net& n : now.nets)
    if (base.findNet(n.name) < 0) newNames.insert(n.name);
  for (const Net& n : base.nets) {
    if (now.findNet(n.name) >= 0) continue;
    const auto pins = basePins.find(n.name);
    if (pins == basePins.end()) continue;
    for (const std::string& name : newNames) {
      const auto np = nowPins.find(name);
      if (np == nowPins.end() || np->second != pins->second) continue;
      renamed[n.name] = name;
      newNames.erase(name);
      out.push_back({Kind::RenameNet, n.name, name, {}, {}, {line("NetRename", n.name, name)}});
      break;
    }
  }
  // The net each pin had, under the name it has now.
  auto had = [&](const std::string& pin) {
    const std::string& net = was.at(pin);
    const auto r = renamed.find(net);
    return r == renamed.end() ? net : r->second;
  };
  auto has = [&](const std::string& pin) { return netOf(now, now.pads[size_t(padOf.at(pin))]); };
  // Nets added (before the pins that go to them).
  for (const std::string& name : newNames) out.push_back({Kind::AddNet, name, {}, {}, {}, {line("NetAdd", name)}});
  // The lines of a pin going from one net to another (the old net by the name the schematic knows it under now).
  auto move = [&](std::vector<std::string>& lines, const std::string& pin, const std::string& from, const std::string& to) {
    if (!from.empty()) lines.push_back(line("NetNodeDelete", from, pin));
    if (!to.empty()) lines.push_back(line("NetNodeAdd", to, pin));
  };
  std::set<std::string> done;  // pins accounted for
  auto known = [&](int pad) { return now.pads[size_t(pad)].component >= 0 && padOf.contains(pinName(now, now.pads[size_t(pad)])); };
  auto name = [&](int pad) { return pinName(now, now.pads[size_t(pad)]); };
  // Gates exchanged whole.
  for (const SwapGroup& g : gateGroups(now))
    for (size_t i = 0; i < g.members.size(); ++i)
      for (size_t j = i + 1; j < g.members.size(); ++j) {
        const SwappedPads pairs = gatePinPairs(now, g.members[i], g.members[j]);
        bool all = !pairs.empty(), any = false;
        for (auto [pa, pb] : pairs) {
          if (!known(pa) || !known(pb) || done.contains(name(pa)) || done.contains(name(pb))) {
            all = false;
            break;
          }
          const std::string a = name(pa), c = name(pb);
          all = all && had(a) == has(c) && had(c) == has(a);
          any = any || had(a) != has(a) || had(c) != has(c);
        }
        if (!all || !any) continue;
        // As P-CAD's schematic writes a gate moved: the pins taken out of their nets first, then put into the new.
        EcoChange ch{Kind::GateSwap, {}, {}, {}, {}, {}};
        std::vector<std::string> added;
        for (auto [pa, pb] : pairs) {
          const std::string a = name(pa), c = name(pb);
          ch.a += (ch.a.empty() ? "" : ", ") + a;
          ch.b += (ch.b.empty() ? "" : ", ") + c;
          done.insert(a);
          done.insert(c);
          if (had(a) == has(a)) continue;  // (the two pins are of one net)
          move(ch.lines, a, had(a), {});
          move(ch.lines, c, had(c), {});
          move(added, a, {}, has(a));
          move(added, c, {}, has(c));
        }
        ch.lines.insert(ch.lines.end(), added.begin(), added.end());
        out.push_back(std::move(ch));
      }
  // Pins exchanged within their group: the permutation as swaps of two.
  for (const SwapGroup& g : pinGroups(now)) {
    std::vector<std::string> pins;
    for (const auto& m : g.members)
      if (known(m[0]) && !done.contains(name(m[0]))) pins.push_back(name(m[0]));
    std::map<std::string, std::string> cur;  // the nets as the swaps so far leave them
    for (const std::string& p : pins) cur[p] = had(p);
    for (const std::string& p : pins) {
      if (cur[p] == has(p)) continue;
      // The pin that holds the net this one is to have.
      const auto q = r::find_if(pins, [&](const std::string& x) { return x != p && cur[x] == has(p) && cur[x] != has(x); });
      if (q == pins.end()) continue;  // (not a permutation within the group: left to the pins one by one)
      EcoChange ch{Kind::PinSwap, p, *q, cur[p], cur[*q], {}};
      move(ch.lines, p, cur[p], {});
      move(ch.lines, *q, cur[*q], {});
      move(ch.lines, p, {}, cur[*q]);
      move(ch.lines, *q, {}, cur[p]);
      std::swap(cur[p], cur[*q]);
      out.push_back(std::move(ch));
    }
    for (const std::string& p : pins)
      if (cur[p] == has(p)) {
        if (had(p) != has(p)) done.insert(p);
      } else {  // a swap began what the pins one by one end: from the net the swaps left
        was[p] = cur[p];
      }
  }
  // The rest of the pins, one by one; a pin of a net that is gone is left to that net's change.
  std::set<std::string> gone;
  for (const Net& n : base.nets)
    if (now.findNet(n.name) < 0 && !renamed.contains(n.name)) gone.insert(n.name);
  std::map<std::string, std::vector<std::string>> leaving;  // gone net -> the pins leaving it for no net
  for (auto& [pin, pad] : padOf) {
    if (done.contains(pin) || had(pin) == has(pin)) continue;
    if (gone.contains(had(pin)) && has(pin).empty()) {
      leaving[had(pin)].push_back(pin);
      continue;
    }
    EcoChange ch{Kind::PinNet, pin, {}, had(pin), has(pin), {}};
    move(ch.lines, pin, had(pin), has(pin));
    out.push_back(std::move(ch));
  }
  for (const std::string& net : gone) {
    EcoChange ch{Kind::RemoveNet, net, {}, {}, {}, {}};
    for (const std::string& pin : leaving[net]) ch.lines.push_back(line("NetNodeDelete", net, pin));
    ch.lines.push_back(line("NetDelete", net));
    out.push_back(std::move(ch));
  }
  // The components' attributes (the value among them), for the components both designs have.
  for (int ci = 0; ci < int(now.components.size()); ++ci) {
    const std::string& ref = now.components[size_t(ci)].ref;
    const int bi = base.findComponent(ref);
    if (bi < 0) continue;
    const std::vector<Attribute> before = base.attributesOf(bi);
    for (const Attribute& a : now.attributesOf(ci)) {
      if (a.name == "RefDes") continue;
      const auto old = r::find(before, a.name, &Attribute::name);
      if (old != before.end() && old->value == a.value) continue;
      // As P-CAD writes them: the value with its (empty) units, type and constraint, the others by name and value.
      std::string l = std::string(old == before.end() ? "CompAttrAdd" : "CompAttrModify") + " " + quoted(ref) + " " + quoted(a.name) + " " + quoted(a.value);
      if (a.name == "Value") l += " \"\" \"string\" \"\"";
      out.push_back({Kind::CompAttr, ref, a.name, old == before.end() ? std::string() : old->value, a.value, {std::move(l)}});
    }
  }
  return out;
}

std::string pcadEcoText(const std::vector<EcoChange>& changes, const std::string& program, const std::string& file, std::time_t when) {
  char date[64] = "";
  if (const std::tm* tm = std::localtime(&when)) std::strftime(date, sizeof date, "%a %b %d %H:%M:%S %Y", tm);
  std::string out = "; " + program + " [" + file + "]--" + date + "\r\n";
  for (const EcoChange& c : changes)
    for (const std::string& l : c.lines) out += l + "\r\n";
  return utf8ToCp1251(out);
}

Result<void> writePcadEco(const std::string& path, const std::vector<EcoChange>& changes, const std::string& program, const std::string& file) {
  std::ofstream f(path, std::ios::binary);
  if (!f) return std::unexpected("cannot write " + path);
  f << pcadEcoText(changes, program, file, std::time(nullptr));
  if (!f) return std::unexpected("cannot write " + path);
  return {};
}

}  // namespace xr::io
