#include "core/Signals.h"

#include <algorithm>
#include <cctype>
#include <format>
#include <map>
#include <set>

namespace xr::sig {

std::vector<DiffNamesRule> defaultDiffNames() {
  return {{true, "", "#"}, {true, "+", "-"}, {true, "P", "N"}, {true, "p", "n"}, {true, "H", "L"}, {true, "", "_B"}};
}

SignalSearch defaultSearch() {
  SignalSearch s;
  s.names = defaultDiffNames();
  return s;
}

SignalSearch searchOf(const HiSpeed& h) {
  if (!h.search.present) return defaultSearch();
  SignalSearch s = h.search;
  if (s.names.empty()) s.names = defaultDiffNames();
  return s;
}

bool isPassive(const Board& b, int comp) {
  if (comp < 0 || comp >= int(b.components.size())) return false;
  const Component& c = b.components[size_t(comp)];
  return c.pads.size() == 2 && r::all_of(c.pads, [&](int p) { return b.pads[size_t(p)].net >= 0; });
}

std::vector<std::string> autoExcludedNets(const Board& b, int minPins) {
  std::vector<int> pins(b.nets.size(), 0);
  for (const Pad& p : b.pads)
    if (p.net >= 0 && size_t(p.net) < pins.size()) ++pins[size_t(p.net)];
  std::vector<std::string> out;
  for (size_t n = 0; n < b.nets.size(); ++n) {
    const bool plane = r::any_of(b.layers, [&](const Layer& l) { return l.plane && l.planeNet == int(n); });
    if (pins[n] >= minPins || plane) out.push_back(b.nets[n].name);
  }
  return out;
}

bool diffNamesMatch(std::string_view pos, std::string_view neg, const DiffNamesRule& rule) {
  if (rule.pos.empty() && rule.neg.empty()) return false;
  if (pos.size() + rule.neg.size() != neg.size() + rule.pos.size()) return false;
  for (size_t i = 0; i + rule.pos.size() <= pos.size(); ++i) {
    if (pos.substr(i, rule.pos.size()) != rule.pos) continue;
    const std::string_view x = pos.substr(0, i), y = pos.substr(i + rule.pos.size());
    if (neg.size() == x.size() + rule.neg.size() + y.size() && neg.starts_with(x) && neg.substr(x.size(), rule.neg.size()) == rule.neg &&
        neg.substr(x.size() + rule.neg.size()) == y)
      return true;
  }
  return false;
}

std::optional<int> diffRuleOf(std::string_view a, std::string_view c, const std::vector<DiffNamesRule>& rules, bool* swapped) {
  for (size_t i = 0; i < rules.size(); ++i) {
    if (!rules[i].enabled) continue;
    if (diffNamesMatch(a, c, rules[i])) {
      if (swapped) *swapped = false;
      return int(i);
    }
    if (diffNamesMatch(c, a, rules[i])) {
      if (swapped) *swapped = true;
      return int(i);
    }
  }
  return std::nullopt;
}

std::optional<int> padOf(const Board& b, const PinRef& p) {
  const int c = b.findComponent(p.comp);
  if (c < 0) return std::nullopt;
  for (int pi : b.components[size_t(c)].pads)
    if (b.pads[size_t(pi)].number == p.pin) return pi;
  return std::nullopt;
}

PinRef pinOf(const Board& b, int pad) {
  const Pad& p = b.pads[size_t(pad)];
  return {p.component >= 0 ? b.components[size_t(p.component)].ref : std::string(), p.number};
}

namespace {

// The pads of each net, and of a component its other pads' nets.
struct Circuit {
  const Board& b;
  std::vector<std::vector<int>> padsOf;
  explicit Circuit(const Board& board) : b(board), padsOf(board.nets.size()) {
    for (size_t i = 0; i < b.pads.size(); ++i)
      if (b.pads[i].net >= 0 && size_t(b.pads[i].net) < padsOf.size()) padsOf[size_t(b.pads[i].net)].push_back(int(i));
  }
  int net(const std::string& name) const { return b.findNet(name); }
  // The nets one step from `n` through the components (only passive ones: `passive`): (net, pad on n, pad on it).
  struct Step {
    int net, from, to, comp;
  };
  std::vector<Step> steps(int n, bool passive) const {
    std::vector<Step> out;
    for (int p : padsOf[size_t(n)]) {
      const int c = b.pads[size_t(p)].component;
      if (c < 0 || (passive && !isPassive(b, c))) continue;
      for (int q : b.components[size_t(c)].pads) {
        const int m = b.pads[size_t(q)].net;
        if (q != p && m >= 0 && m != n) out.push_back({m, p, q, c});
      }
    }
    return out;
  }
};

bool excluded(const SignalSearch& s, const std::string& net) { return r::contains(s.excludedNets, net); }

// The cluster that has the net, other than `self`.
const SignalCluster* clusterWith(const HiSpeed& h, const std::string& net, const SignalCluster* self = nullptr) {
  for (const SignalCluster& c : h.clusters)
    if (&c != self && r::contains(c.nets, net)) return &c;
  return nullptr;
}

// The opposite net of a pair: one that follows a naming rule with `net`.
bool opposite(const std::string& net, const std::string& other, const SignalSearch& s) { return diffRuleOf(net, other, s.names).has_value(); }

// A digit run (the last one), with the brackets round it: what a bus's names differ by.
std::string withoutIndex(const std::string& name) {
  size_t end = name.size();
  while (end > 0 && !std::isdigit(static_cast<unsigned char>(name[end - 1]))) --end;
  if (end == 0) return name;
  size_t begin = end;
  while (begin > 0 && std::isdigit(static_cast<unsigned char>(name[begin - 1]))) --begin;
  size_t a = begin, z = end;
  if (a > 0 && z < name.size() && ((name[a - 1] == '[' && name[z] == ']') || (name[a - 1] == '(' && name[z] == ')'))) --a, ++z;
  return name.substr(0, a) + name.substr(z);
}

std::vector<std::string> allNames(const HiSpeed& h) {
  std::vector<std::string> out;
  for (const SignalCluster& c : h.clusters)
    for (const Signal& s : c.signalList) out.push_back(s.name);
  for (const DiffSignal& d : h.diffSignals) out.push_back(d.name);
  return out;
}

Signal* findSignal(HiSpeed& h, const std::string& name, SignalCluster** of = nullptr) {
  for (SignalCluster& c : h.clusters)
    for (Signal& s : c.signalList)
      if (s.name == name) {
        if (of) *of = &c;
        return &s;
      }
  return nullptr;
}

const Signal* findSignal(const HiSpeed& h, const std::string& name, const SignalCluster** of = nullptr) {
  return findSignal(const_cast<HiSpeed&>(h), name, const_cast<SignalCluster**>(of));
}

bool inDiff(const HiSpeed& h, const std::string& signal) {
  return r::any_of(h.diffSignals, [&](const DiffSignal& d) { return d.signalA == signal || d.signalB == signal; });
}

}  // namespace

std::vector<PinRef> pinsOfNet(const Board& b, const std::string& net) {
  std::vector<PinRef> out;
  const int n = b.findNet(net);
  if (n < 0) return out;
  for (size_t i = 0; i < b.pads.size(); ++i)
    if (b.pads[i].net == n && b.pads[i].component >= 0) out.push_back(pinOf(b, int(i)));
  return out;
}

std::vector<int> linksOfNet(const Board& b, const SignalCluster& c, const std::string& net) {
  std::vector<int> out;
  const int n = b.findNet(net);
  for (size_t i = 0; i < c.pinPairs.size(); ++i) {
    auto p = padOf(b, c.pinPairs[i].first);
    if (p && b.pads[size_t(*p)].net == n) out.push_back(int(i));
  }
  return out;
}

bool linksHaveCycle(const Board& b, const SignalCluster& c, const std::string& net) {
  std::map<std::string, std::string> parent;
  auto root = [&](std::string x) {
    while (parent.contains(x) && parent[x] != x) x = parent[x];
    return x;
  };
  for (int i : linksOfNet(b, c, net)) {
    const auto& [a, z] = c.pinPairs[size_t(i)];
    const std::string ka = a.comp + "-" + a.pin, kz = z.comp + "-" + z.pin;
    if (!parent.contains(ka)) parent[ka] = ka;
    if (!parent.contains(kz)) parent[kz] = kz;
    const std::string ra = root(ka), rz = root(kz);
    if (ra == rz) return true;
    parent[ra] = rz;
  }
  return false;
}

std::string uniqueName(const HiSpeed& h, const std::string& base, const std::vector<std::string>& taken) {
  const std::vector<std::string> names = allNames(h);
  auto free = [&](const std::string& n) { return !r::contains(names, n) && !r::contains(taken, n); };
  if (free(base)) return base;
  for (int k = 1;; ++k)
    if (std::string n = std::format("{}_{}", base, k); free(n)) return n;
}

std::string uniqueGroupName(const HiSpeed& h, const std::string& base) {
  auto free = [&](const std::string& n) { return !r::contains(h.groups, n, &SignalGroup::name); };
  if (free(base)) return base;
  for (int k = 1;; ++k)
    if (std::string n = std::format("{}_{}", base, k); free(n)) return n;
}

ClusterResult buildCluster(const Board& b, const HiSpeed& h, int sourcePad, const SignalSearch& s) {
  ClusterResult r;
  if (sourcePad < 0 || sourcePad >= int(b.pads.size()) || b.pads[size_t(sourcePad)].net < 0) {
    r.error = "у контакта нет цепи";
    return r;
  }
  const Circuit circuit(b);
  const int n0 = b.pads[size_t(sourcePad)].net;
  const std::string& name0 = b.nets[size_t(n0)].name;
  if (excluded(s, name0)) {
    r.error = std::format("цепь '{}' исключена из поиска сигналов", name0);
    return r;
  }
  if (const SignalCluster* other = clusterWith(h, name0)) {
    r.error = std::format("цепь '{}' уже входит в сигнал '{}'", name0, other->signalList.empty() ? std::string() : other->signalList[0].name);
    return r;
  }
  // The nets through the passive components, breadth first; over the limit the net added and the one it came
  // from go (not the source's), and nothing more is reached through them.
  std::vector<int> nets{n0};
  std::set<int> banned;
  for (size_t k = 0; k < nets.size(); ++k) {
    const int n = nets[k];
    if (banned.contains(n)) continue;
    for (const Circuit::Step& st : circuit.steps(n, true)) {
      const std::string& name = b.nets[size_t(st.net)].name;
      if (r::contains(nets, st.net) || banned.contains(st.net) || excluded(s, name) || clusterWith(h, name) || opposite(name0, name, s)) continue;
      nets.push_back(st.net);
      if (int(nets.size()) > std::max(1, s.maxNetsInCluster)) {
        nets.pop_back();
        banned.insert(st.net);
        if (n != n0) {
          banned.insert(n);
          std::erase(nets, n);
        }
        break;
      }
    }
  }
  SignalCluster c;
  c.source = pinOf(b, sourcePad);
  for (int n : nets) c.nets.push_back(b.nets[size_t(n)].name);
  for (const Impedance& z : h.impedances)
    if (!z.diff) {
      c.impedance = z.name;
      break;
    }
  refreshSignals(b, h, c, s);
  r.cluster = std::move(c);
  return r;
}

void refreshSignals(const Board& b, const HiSpeed& h, SignalCluster& c, const SignalSearch& s) {
  const Circuit circuit(b);
  const auto source = padOf(b, c.source);
  if (!source) return;
  const int sourceComp = b.pads[size_t(*source)].component;
  std::vector<int> nets;
  for (const std::string& n : c.nets)
    if (int i = b.findNet(n); i >= 0) nets.push_back(i);
  // The way to each net from the source's: through passive components where there is one, else any.
  struct Back {
    int net = -1, from = -1, to = -1, comp = -1;  // the net before, the pad left there, the pad come in by
  };
  std::map<int, Back> back;
  const int n0 = b.pads[size_t(*source)].net;
  back[n0] = {};
  for (bool passive : {true, false})
    for (size_t k = 0; k < nets.size(); ++k)
      for (int n : nets) {
        if (!back.contains(n)) continue;
        for (const Circuit::Step& st : circuit.steps(n, passive))
          if (r::contains(nets, st.net) && !back.contains(st.net) && st.comp != sourceComp) back[st.net] = {n, st.from, st.to, st.comp};
      }
  std::set<int> links;  // the components a way goes through
  for (auto& [n, bk] : back)
    if (bk.comp >= 0) links.insert(bk.comp);
  // Receivers: the pins of the active components on the nets (not the source's nor a link), one per component —
  // the nearest to the source.
  std::map<int, int> receiver;  // component → pad
  const Vec2 at = b.pads[size_t(*source)].pos.v();
  for (int n : nets)
    for (int p : circuit.padsOf[size_t(n)]) {
      const int comp = b.pads[size_t(p)].component;
      if (comp < 0 || comp == sourceComp || links.contains(comp) || isPassive(b, comp)) continue;
      auto it = receiver.find(comp);
      if (it == receiver.end() || (b.pads[size_t(p)].pos.v() - at).len() < (b.pads[size_t(it->second)].pos.v() - at).len()) receiver[comp] = p;
    }
  std::vector<int> pads;
  for (auto& [comp, p] : receiver) pads.push_back(p);
  r::sort(pads, {}, [&](int p) { return (b.pads[size_t(p)].pos.v() - at).len(); });
  // The signals: those whose receiver stays keep their names.
  std::vector<Signal> was = std::move(c.signalList);
  c.signalList.clear();
  std::vector<std::string> taken;
  for (int p : pads) {
    Signal sg;
    sg.receiver = pinOf(b, p);
    if (auto old = r::find(was, sg.receiver, &Signal::receiver); old != was.end()) sg.name = old->name;
    else {
      // (not a name of this cluster's signals as they were: the cluster is the one being made anew)
      std::vector<std::string> own = taken;
      for (const Signal& w : was) own.push_back(w.name);
      HiSpeed others = h;
      std::erase_if(others.clusters, [&](const SignalCluster& x) { return x.source == c.source; });
      sg.name = uniqueName(others, std::format("{}_{}", c.nets.empty() ? std::string() : c.nets[0], sg.receiver.comp), taken);
    }
    taken.push_back(sg.name);
    // The components it goes through: the source's, the links on its way, the receiver's.
    sg.components.push_back(c.source.comp);
    std::vector<std::string> way;
    for (int n = b.pads[size_t(p)].net; back.contains(n) && back[n].comp >= 0; n = back[n].net) way.push_back(b.components[size_t(back[n].comp)].ref);
    for (auto it = way.rbegin(); it != way.rend(); ++it) sg.components.push_back(*it);
    if (!r::contains(sg.components, sg.receiver.comp)) sg.components.push_back(sg.receiver.comp);
    c.signalList.push_back(std::move(sg));
  }
  if (!s.createPinPairs) return;
  // The links set automatically: on each net, from where the signal comes in to where it goes on (or ends).
  c.pinPairs.clear();
  auto link = [&](int from, int to) {
    std::pair<PinRef, PinRef> pp{pinOf(b, from), pinOf(b, to)};
    if (from != to && !r::contains(c.pinPairs, pp)) c.pinPairs.push_back(std::move(pp));
  };
  for (int p : pads) {
    std::vector<std::pair<int, int>> legs;  // (pad in, pad out) per net, from the receiver back
    int n = b.pads[size_t(p)].net, out = p;
    while (back.contains(n)) {
      const Back& bk = back[n];
      legs.push_back({bk.comp >= 0 ? bk.to : *source, out});
      if (bk.comp < 0) break;
      out = bk.from;
      n = bk.net;
    }
    for (auto it = legs.rbegin(); it != legs.rend(); ++it) link(it->first, it->second);
  }
}

std::string addNet(const Board& b, const HiSpeed& h, SignalCluster& c, const std::string& net, const SignalSearch& s) {
  const int n = b.findNet(net);
  if (n < 0) return std::format("нет цепи '{}'", net);
  if (r::contains(c.nets, net)) return std::format("цепь '{}' уже в кластере", net);
  if (excluded(s, net)) return std::format("цепь '{}' исключена из поиска сигналов", net);
  if (const SignalCluster* other = clusterWith(h, net, &c); other && other->source != c.source)
    return std::format("цепь '{}' входит в другой сигнальный кластер", net);
  const Circuit circuit(b);
  bool joined = false;
  for (const Circuit::Step& st : circuit.steps(n, false)) joined |= r::contains(c.nets, b.nets[size_t(st.net)].name);
  if (!joined) return std::format("цепь '{}' не подключена к цепям кластера", net);
  c.nets.push_back(net);
  refreshSignals(b, h, c, s);
  return {};
}

std::string removeNet(const Board& b, SignalCluster& c, const std::string& net) {
  if (!c.nets.empty() && c.nets[0] == net) return "нельзя удалить цепь источника";
  if (!r::contains(c.nets, net)) return {};
  // The others must stay joined to the source's without it.
  const Circuit circuit(b);
  std::vector<std::string> rest = c.nets;
  std::erase(rest, net);
  std::set<std::string> reached{rest.empty() ? std::string() : rest[0]};
  for (bool grew = true; grew;) {
    grew = false;
    for (const std::string& x : reached) {
      const int n = b.findNet(x);
      if (n < 0) continue;
      for (const Circuit::Step& st : circuit.steps(n, false)) {
        const std::string& y = b.nets[size_t(st.net)].name;
        if (r::contains(rest, y) && reached.insert(y).second) grew = true;
      }
      if (grew) break;
    }
  }
  if (reached.size() < rest.size()) return std::format("цепь '{}' — единственное звено между цепью источника и другой цепью кластера", net);
  c.nets = std::move(rest);
  std::erase_if(c.pinPairs, [&](const auto& pp) {
    auto p = padOf(b, pp.first);
    return p && b.pads[size_t(*p)].net == b.findNet(net);
  });
  return {};
}

void addCluster(HiSpeed& h, SignalCluster c) {
  std::vector<std::string> taken;
  for (Signal& s : c.signalList) {
    s.name = uniqueName(h, s.name, taken);
    taken.push_back(s.name);
  }
  h.clusters.push_back(std::move(c));
}

bool grouped(const HiSpeed& h, const ObjectSignal& o) {
  return r::any_of(h.groups, [&](const SignalGroup& g) { return r::contains(g.members, o); });
}

std::vector<ObjectSignal> listedObjects(const HiSpeed& h) {
  std::vector<ObjectSignal> out;
  for (const SignalCluster& c : h.clusters)
    for (const Signal& s : c.signalList)
      if (!inDiff(h, s.name)) out.push_back({ObjectSignal::Kind::Signal, s.name});
  for (const DiffSignal& d : h.diffSignals) out.push_back({ObjectSignal::Kind::DiffSignal, d.name});
  return out;
}

std::vector<Bus> findBuses(const HiSpeed& h, std::vector<std::string> signals) {
  if (signals.empty())
    for (const ObjectSignal& o : listedObjects(h))
      if (o.kind == ObjectSignal::Kind::Signal && !grouped(h, o)) signals.push_back(o.name);
  // By (source's component, receiver's component, the source net's name without its index).
  std::map<std::tuple<std::string, std::string, std::string>, std::vector<std::string>> by;
  std::vector<std::tuple<std::string, std::string, std::string>> order;
  for (const std::string& name : signals) {
    const SignalCluster* c = nullptr;
    const Signal* s = findSignal(h, name, &c);
    if (!s || c->nets.empty()) continue;
    const std::string stem = withoutIndex(c->nets[0]);
    if (stem == c->nets[0]) continue;  // no index
    auto key = std::tuple{c->source.comp, s->receiver.comp, stem};
    if (!by.contains(key)) order.push_back(key);
    by[key].push_back(name);
  }
  std::vector<Bus> out;
  HiSpeed named = h;
  for (auto& key : order) {
    if (by[key].size() < 2) continue;
    Bus bus{uniqueGroupName(named, "SignalNet"), by[key]};
    named.groups.push_back({bus.name, {}});
    out.push_back(std::move(bus));
  }
  return out;
}

std::string addBusGroup(HiSpeed& h, const Bus& bus) {
  SignalGroup g{uniqueGroupName(h, bus.name), {}};
  for (const std::string& s : bus.members) g.members.push_back({ObjectSignal::Kind::Signal, s});
  h.groups.push_back(std::move(g));
  return h.groups.back().name;
}

namespace {

// The name a pair is given: its positive source's net and receiver's component.
std::string pairName(const HiSpeed& h, const std::string& positive, const std::vector<std::string>& taken = {}) {
  const SignalCluster* c = nullptr;
  const Signal* s = findSignal(h, positive, &c);
  if (!s || c->nets.empty()) return uniqueName(h, positive, taken);
  return uniqueName(h, std::format("{}_{}", c->nets[0], s->receiver.comp), taken);
}

// The two signals' nets pair by a naming rule, net by net; `swapped`: the second is the positive one.
bool pairByNames(const HiSpeed& h, const std::string& a, const std::string& c, const SignalSearch& s, bool& swapped) {
  const SignalCluster *ca = nullptr, *cc = nullptr;
  if (!findSignal(h, a, &ca) || !findSignal(h, c, &cc) || ca == cc || ca->nets.size() != cc->nets.size() || ca->nets.empty()) return false;
  std::optional<bool> way;
  for (size_t i = 0; i < ca->nets.size(); ++i) {
    bool sw = false;
    if (!diffRuleOf(ca->nets[i], cc->nets[i], s.names, &sw)) return false;
    if (way && *way != sw) return false;
    way = sw;
  }
  swapped = *way;
  return true;
}

}  // namespace

std::vector<DiffCandidate> findDiffPairs(const Board& b, const HiSpeed& h, const SignalSearch& s, std::vector<std::string> signals) {
  if (signals.empty())
    for (const ObjectSignal& o : listedObjects(h))
      if (o.kind == ObjectSignal::Kind::Signal) signals.push_back(o.name);
  std::vector<DiffCandidate> out;
  std::set<std::string> used;
  std::vector<std::string> taken;
  for (size_t i = 0; i < signals.size(); ++i)
    for (size_t j = i + 1; j < signals.size(); ++j) {
      const std::string &a = signals[i], &c = signals[j];
      if (used.contains(a) || used.contains(c)) continue;
      const SignalCluster *ca = nullptr, *cc = nullptr;
      const Signal *sa = findSignal(h, a, &ca), *sc = findSignal(h, c, &cc);
      if (!sa || !sc || ca->source.comp != cc->source.comp || sa->receiver.comp != sc->receiver.comp) continue;
      bool swapped = false;
      if (!pairByNames(h, a, c, s, swapped) || !canJoinDiff(b, h, a, c).empty()) continue;
      DiffCandidate d;
      d.positive = swapped ? c : a;
      d.negative = swapped ? a : c;
      d.name = pairName(h, d.positive, taken);
      taken.push_back(d.name);
      used.insert(a);
      used.insert(c);
      out.push_back(std::move(d));
    }
  return out;
}

std::string canJoinDiff(const Board& b, const HiSpeed& h, const std::string& a, const std::string& c) {
  const SignalCluster *ca = nullptr, *cc = nullptr;
  if (!findSignal(h, a, &ca) || !findSignal(h, c, &cc)) return "выделите два простых сигнала";
  if (inDiff(h, a) || inDiff(h, c)) return "сигнал уже входит в дифференциальный сигнал";
  if (ca == cc) return "сигналы должны быть из разных кластеров";
  if (ca->nets.size() != cc->nets.size()) return "в сигналах должно быть одинаковое количество цепей";
  // Alike links: as many on each net, net by net.
  for (size_t i = 0; i < ca->nets.size(); ++i)
    if (linksOfNet(b, *ca, ca->nets[i]).size() != linksOfNet(b, *cc, cc->nets[i]).size()) return "заданные связи в цепях сигналов должны быть схожи";
  return {};
}

int joinDiff(const Board& b, HiSpeed& h, const std::string& a, const std::string& c, std::string name) {
  if (!canJoinDiff(b, h, a, c).empty()) return -1;
  bool swapped = false;
  const SignalSearch s = searchOf(h);
  if (!pairByNames(h, a, c, s, swapped)) swapped = false;
  DiffSignal d;
  d.signalA = swapped ? c : a;
  d.signalB = swapped ? a : c;
  d.name = name.empty() ? pairName(h, d.signalA) : uniqueName(h, name);
  for (const Impedance& z : h.impedances)
    if (z.diff) {
      d.impedance = z.name;
      break;
    }
  // Where the two signals stood alone, the pair stands now.
  for (SignalGroup& g : h.groups) {
    const bool had = r::contains(g.members, ObjectSignal{ObjectSignal::Kind::Signal, a}) || r::contains(g.members, ObjectSignal{ObjectSignal::Kind::Signal, c});
    std::erase_if(g.members, [&](const ObjectSignal& o) { return o.kind == ObjectSignal::Kind::Signal && (o.name == a || o.name == c); });
    if (had) g.members.push_back({ObjectSignal::Kind::DiffSignal, d.name});
  }
  h.diffSignals.push_back(std::move(d));
  return int(h.diffSignals.size()) - 1;
}

namespace {

// Every place an object is referred to by its kind and name: the groups' members, the rules of delays, the
// design's rules.
template <class F>
void eachReference(HiSpeed& h, DesignRules* rules, F&& f) {
  for (SignalGroup& g : h.groups)
    for (ObjectSignal& o : g.members) f(o);
  for (DelayRule& d : h.delays)
    for (auto* list : {&d.objects, &d.left, &d.right})
      for (ObjectSignal& o : *list) f(o);
  if (!rules) return;
  auto net = [&](RuleNets& n) {
    if (n.kind != RuleNets::Kind::Signal && n.kind != RuleNets::Kind::DiffSignal && n.kind != RuleNets::Kind::SignalGroup) return;
    ObjectSignal o{n.kind == RuleNets::Kind::Signal ? ObjectSignal::Kind::Signal
                   : n.kind == RuleNets::Kind::DiffSignal ? ObjectSignal::Kind::DiffSignal : ObjectSignal::Kind::SignalGroup,
                   n.name};
    f(o);
    n.name = o.name;
  };
  for (auto& w : rules->widths) net(w.nets);
  for (auto& c : rules->clearances) net(c.a), net(c.b);
  for (auto& v : rules->vias) net(v.nets);
  for (auto& l : rules->layerNets)
    for (auto& n : l.nets) net(n);
}

}  // namespace

void splitDiff(HiSpeed& h, DesignRules* rules, const std::string& name) {
  const int i = h.diffSignal(name);
  if (i < 0) return;
  const DiffSignal d = h.diffSignals[size_t(i)];
  h.diffSignals.erase(h.diffSignals.begin() + i);
  const ObjectSignal pair{ObjectSignal::Kind::DiffSignal, name};
  auto spread = [&](std::vector<ObjectSignal>& list) {
    auto it = r::find(list, pair);
    if (it == list.end()) return;
    it = list.erase(it);
    it = list.insert(it, {ObjectSignal::Kind::Signal, d.signalB});
    list.insert(it, {ObjectSignal::Kind::Signal, d.signalA});
  };
  for (SignalGroup& g : h.groups) spread(g.members);
  for (DelayRule& r : h.delays)
    for (auto* list : {&r.objects, &r.left, &r.right}) spread(*list);
  // A design rule names one object: it takes the positive signal.
  if (rules)
    eachReference(h, rules, [&](ObjectSignal& o) {
      if (o == pair) o = {ObjectSignal::Kind::Signal, d.signalA};
    });
}

void removeObjects(HiSpeed& h, DesignRules* rules, const std::vector<ObjectSignal>& objects) {
  std::vector<ObjectSignal> gone;
  for (const ObjectSignal& o : objects) {
    gone.push_back(o);
    if (o.kind == ObjectSignal::Kind::DiffSignal)
      if (int i = h.diffSignal(o.name); i >= 0) {
        gone.push_back({ObjectSignal::Kind::Signal, h.diffSignals[size_t(i)].signalA});
        gone.push_back({ObjectSignal::Kind::Signal, h.diffSignals[size_t(i)].signalB});
      }
  }
  // A signal of a pair goes with the pair.
  for (const DiffSignal& d : h.diffSignals)
    if (r::contains(gone, ObjectSignal{ObjectSignal::Kind::Signal, d.signalA}) || r::contains(gone, ObjectSignal{ObjectSignal::Kind::Signal, d.signalB}))
      if (!r::contains(gone, ObjectSignal{ObjectSignal::Kind::DiffSignal, d.name})) gone.push_back({ObjectSignal::Kind::DiffSignal, d.name});
  auto isGone = [&](const ObjectSignal& o) { return r::contains(gone, o); };
  for (SignalCluster& c : h.clusters)
    std::erase_if(c.signalList, [&](const Signal& s) { return isGone({ObjectSignal::Kind::Signal, s.name}); });
  std::erase_if(h.clusters, [](const SignalCluster& c) { return c.signalList.empty(); });
  std::erase_if(h.diffSignals, [&](const DiffSignal& d) { return isGone({ObjectSignal::Kind::DiffSignal, d.name}); });
  std::erase_if(h.groups, [&](const SignalGroup& g) { return isGone({ObjectSignal::Kind::SignalGroup, g.name}); });
  for (SignalGroup& g : h.groups) std::erase_if(g.members, isGone);
  for (DelayRule& d : h.delays)
    for (auto* list : {&d.objects, &d.left, &d.right}) std::erase_if(*list, isGone);
  std::erase_if(h.delays, [](const DelayRule& d) {
    return d.kind == DelayRule::Kind::Relation ? d.left.empty() || d.right.empty() : d.objects.empty();
  });
  if (!rules) return;
  auto named = [&](const RuleNets& n) {
    const ObjectSignal::Kind k = n.kind == RuleNets::Kind::Signal ? ObjectSignal::Kind::Signal
                                 : n.kind == RuleNets::Kind::DiffSignal ? ObjectSignal::Kind::DiffSignal : ObjectSignal::Kind::SignalGroup;
    const bool signalKind = n.kind == RuleNets::Kind::Signal || n.kind == RuleNets::Kind::DiffSignal || n.kind == RuleNets::Kind::SignalGroup;
    return signalKind && isGone({k, n.name});
  };
  std::erase_if(rules->widths, [&](const WidthRule& w) { return named(w.nets); });
  std::erase_if(rules->clearances, [&](const ClearanceRule& c) { return named(c.a) || named(c.b); });
  std::erase_if(rules->vias, [&](const ViaRule& v) { return named(v.nets); });
  for (auto& l : rules->layerNets) std::erase_if(l.nets, named);
}

std::string renameObject(HiSpeed& h, DesignRules* rules, const ObjectSignal& o, const std::string& name) {
  if (name.empty()) return "имя не может быть пустым";
  if (name == o.name) return {};
  if (o.kind == ObjectSignal::Kind::SignalGroup) {
    if (r::contains(h.groups, name, &SignalGroup::name)) return std::format("группа сигналов '{}' уже есть", name);
    for (SignalGroup& g : h.groups)
      if (g.name == o.name) g.name = name;
  } else {
    if (r::contains(allNames(h), name)) return std::format("сигнал '{}' уже есть", name);
    if (o.kind == ObjectSignal::Kind::Signal) {
      if (Signal* s = findSignal(h, o.name)) s->name = name;
      for (DiffSignal& d : h.diffSignals) {
        if (d.signalA == o.name) d.signalA = name;
        if (d.signalB == o.name) d.signalB = name;
      }
    } else if (int i = h.diffSignal(o.name); i >= 0)
      h.diffSignals[size_t(i)].name = name;
  }
  eachReference(h, rules, [&](ObjectSignal& x) {
    if (x == o) x.name = name;
  });
  return {};
}

std::string impedanceOf(const HiSpeed& h, const ObjectSignal& o) {
  if (o.kind == ObjectSignal::Kind::DiffSignal) {
    const int i = h.diffSignal(o.name);
    return i >= 0 ? h.diffSignals[size_t(i)].impedance : std::string();
  }
  const SignalCluster* c = h.clusterOf(o.name);
  return c ? c->impedance : std::string();
}

void setImpedance(HiSpeed& h, const ObjectSignal& o, const std::string& impedance) {
  if (o.kind == ObjectSignal::Kind::Signal) {
    SignalCluster* c = nullptr;
    if (findSignal(h, o.name, &c)) c->impedance = impedance;
    return;
  }
  if (o.kind != ObjectSignal::Kind::DiffSignal) return;
  const int i = h.diffSignal(o.name);
  if (i < 0) return;
  // The pairs from the same source pins (TopoR: one impedance for all the pairs of common sources).
  const SignalCluster* ca = h.clusterOf(h.diffSignals[size_t(i)].signalA);
  for (DiffSignal& d : h.diffSignals) {
    const SignalCluster* c = h.clusterOf(d.signalA);
    if (&d == &h.diffSignals[size_t(i)] || (ca && c && c->source == ca->source)) d.impedance = impedance;
  }
}

}  // namespace xr::sig
