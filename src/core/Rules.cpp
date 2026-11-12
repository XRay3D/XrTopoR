#include "core/Rules.h"

#include <algorithm>
#include <format>
#include <map>
#include <optional>
#include <tuple>

#include "core/Board.h"

namespace xr {

namespace {

// Nets of a rule object; nullopt = all nets.
std::optional<std::vector<int>> netsOf(const Board& b, const DesignRules& r, const RuleNets& o) {
  switch (o.kind) {
    case RuleNets::Kind::All: return std::nullopt;
    case RuleNets::Kind::Net: {
      int n = b.findNet(o.name);
      return n >= 0 ? std::vector<int>{n} : std::vector<int>{};
    }
    case RuleNets::Kind::Group: {
      std::vector<int> out;
      for (auto& g : r.netGroups)
        if (g.name == o.name)
          for (auto& name : g.nets)
            if (int n = b.findNet(name); n >= 0) out.push_back(n);
      return out;
    }
    case RuleNets::Kind::Signal:
    case RuleNets::Kind::DiffSignal:
    case RuleNets::Kind::SignalGroup: {
      std::vector<int> out;
      ObjectSignal os{o.kind == RuleNets::Kind::Signal       ? ObjectSignal::Kind::Signal
                      : o.kind == RuleNets::Kind::DiffSignal ? ObjectSignal::Kind::DiffSignal
                                                             : ObjectSignal::Kind::SignalGroup,
                      o.name};
      for (auto& name : b.hispeed.netsOf(os))
        if (int n = b.findNet(name); n >= 0) out.push_back(n);
      return out;
    }
  }
  return std::vector<int>{};
}

// Copper mask of a rule's layers; 0 = all layers.
LayerMask layersOf(const Board& b, const std::vector<std::string>& names) {
  LayerMask m = 0;
  for (auto& n : names)
    if (LayerId l = b.findLayer(n); l >= 0 && b.layers[l].kind == LayerKind::Copper) m |= LayerMask(1) << l;
  return m == b.allCopperMask() ? 0 : m;
}

std::string mmText(Coord c) { return std::format("{:g}", c / double(kNmPerMm)); }

}  // namespace

Coord Board::minTrackWidth(int net, LayerId layer) const {
  const Board& b = *this;
  if (Coord w = pairWidth(net, layer); w > 0) return w;  // a pair's conductor: the rule's width, no narrower
  if (!b.rules) return b.trackWidth(net, layer);
  if (b.minWidthsFor == std::pair(b.nets.size(), b.layers.size())) {
    Coord w = 0;
    for (const MinWidthRule& mr : b.minWidthRules) {
      if (mr.layers && !((mr.layers >> layer) & 1)) continue;
      if (!mr.every && !std::binary_search(mr.nets.begin(), mr.nets.end(), net)) continue;
      w = mr.width;
    }
    return w > 0 ? w : b.trackWidth(net, layer);
  }
  const DesignRules& r = *b.rules;
  Coord w = 0;
  for (auto& rule : r.widths) {
    if (!rule.enabled) continue;
    if (LayerMask lm = layersOf(b, rule.layers); lm && !((lm >> layer) & 1)) continue;
    auto nets = netsOf(b, r, rule.nets);
    if (nets && !r::contains(*nets, net)) continue;
    w = rule.min > 0 ? rule.min : rule.nom;
  }
  return w > 0 ? w : b.trackWidth(net, layer);
}

LayerMask Board::assignedLayers(int net) const {
  if (!rules || net < 0) return 0;
  LayerMask m = 0;
  for (auto& rule : rules->layerNets) {
    LayerId l = findLayer(rule.layer);
    if (!rule.enabled || l < 0 || layers[l].kind != LayerKind::Copper) continue;
    for (auto& o : rule.nets)
      if (auto nets = netsOf(*this, *rules, o); !nets || r::contains(*nets, net)) {
        m |= LayerMask(1) << l;
        break;
      }
  }
  return m;
}

Coord viaPadDiameter(const ViaType& t, const std::string& layerClass, const std::string& layer) {
  for (auto& p : t.pads)
    if (!p.layer.empty() && p.layer == layer) return p.diameter;
  for (auto& p : t.pads)
    if (p.layer.empty() && p.layerClass == layerClass) return p.diameter;
  if (layerClass == "Signal" || layerClass == "Plane") return t.diameter;
  return 0;
}

void compileRules(Board& b) {
  if (!b.rules) return;
  const DesignRules& r = *b.rules;
  NetClass d = b.netClasses[0];
  auto via = [&](NetClass& nc, const std::string& name) {
    for (auto& t : r.viaTypes)
      if (t.name == name) {
        if (t.diameter > 0) nc.viaDiameter = t.diameter;
        if (t.drill > 0) nc.viaDrill = t.drill;
      }
  };
  if (!r.viaTypes.empty()) via(d, r.viaTypes.front().name);

  struct PerNet {
    Coord width = 0, clearance = 0;
    std::string via;
  };
  std::vector<PerNet> per(b.nets.size());
  std::vector<LayerRule> layerRules;
  // Rules apply in order: an «all nets» rule resets what earlier rules gave single nets.
  auto apply = [&](const std::optional<std::vector<int>>& nets, auto&& setAll, auto&& setNet) {
    if (!nets) {
      setAll();
      for (auto& p : per) setNet(p, true);
      return;
    }
    for (int n : *nets) setNet(per[size_t(n)], false);
  };
  for (auto& w : r.widths) {
    Coord width = w.nom > 0 ? w.nom : w.min;
    if (!w.enabled || width <= 0) continue;
    auto nets = netsOf(b, r, w.nets);
    if (LayerMask lm = layersOf(b, w.layers)) {
      layerRules.push_back({nets.value_or(std::vector<int>{}), lm, width, 0});
      continue;
    }
    apply(nets, [&] { d.trackWidth = width; }, [&](PerNet& p, bool reset) { p.width = reset ? 0 : width; });
  }
  std::vector<ClearancePair> pairRules, nominalRules;
  for (auto& c : r.clearances) {
    // TopoR uses the nominal clearance where there is room and the minimum in tight spots; the
    // single value our rules carry is the one every spot must satisfy: the minimum.
    Coord clr = c.min > 0 ? c.min : c.nom;
    if (!c.enabled || clr <= 0) continue;
    // A rule between two specific sets is a pair rule (Board::clearance(netA, netB, layer) answers it);
    // one with a set against all nets is that set's own clearance.
    auto a = netsOf(b, r, c.a), bn = netsOf(b, r, c.b);
    if ((a && a->empty()) || (bn && bn->empty())) continue;  // a group without nets (empty in a pair rule means all)
    // The nominal of the rule, for the nets it names (Board::clearanceNom): kept once any rule has one above
    // its minimum, so that a later rule without one takes it back for its nets.
    if (const Coord nom = std::max(c.nom, clr); nom > clr || !nominalRules.empty())
      nominalRules.push_back({a.value_or(std::vector<int>{}), bn.value_or(std::vector<int>{}), layersOf(b, c.layers), nom});
    if (a && bn) {
      pairRules.push_back({*a, *bn, layersOf(b, c.layers), clr});
      continue;
    }
    // Later rules take priority: one for all nets or a set of them, after a pair rule, overrides it too.
    if (!pairRules.empty()) pairRules.push_back({a.value_or(std::vector<int>{}), bn.value_or(std::vector<int>{}), layersOf(b, c.layers), clr});
    std::optional<std::vector<int>> nets;
    if (a || bn) nets = a ? *a : *bn;
    if (LayerMask lm = layersOf(b, c.layers)) {
      layerRules.push_back({nets.value_or(std::vector<int>{}), lm, 0, clr});
      continue;
    }
    apply(nets, [&] { d.clearance = clr; }, [&](PerNet& p, bool reset) { p.clearance = reset ? 0 : clr; });
  }
  std::string defaultVia;
  for (auto& v : r.vias) {
    if (!v.enabled || v.viaType.empty()) continue;
    apply(netsOf(b, r, v.nets), [&] { defaultVia = v.viaType; },
          [&](PerNet& p, bool reset) { p.via = reset ? std::string() : v.viaType; });
  }
  if (!defaultVia.empty()) via(d, defaultVia);

  // One net class per distinct (width, clearance, via) combination.
  d.name = b.netClasses[0].name;
  b.netClasses.assign(1, d);
  for (auto& n : b.nets) n.netClass = 0;
  std::map<std::tuple<Coord, Coord, Coord, Coord>, int> classes;
  for (size_t n = 0; n < per.size(); ++n) {
    const PerNet& p = per[n];
    if (!p.width && !p.clearance && p.via.empty()) continue;
    NetClass nc = d;
    if (p.width) nc.trackWidth = p.width;
    if (p.clearance) nc.clearance = p.clearance;
    if (!p.via.empty()) via(nc, p.via);
    auto key = std::tuple{nc.trackWidth, nc.clearance, nc.viaDiameter, nc.viaDrill};
    if (key == std::tuple{d.trackWidth, d.clearance, d.viaDiameter, d.viaDrill}) continue;
    auto [it, added] = classes.try_emplace(key, int(b.netClasses.size()));
    if (added) {
      nc.name = std::format("W{}_C{}", mmText(nc.trackWidth), mmText(nc.clearance));
      if (nc.viaDiameter != d.viaDiameter || nc.viaDrill != d.viaDrill) nc.name += "_V" + p.via;
      b.netClasses.push_back(nc);
    }
    b.nets[n].netClass = it->second;
  }
  // The differential pairs: each net knows its pair, and the gap of the pair's rule is the clearance between
  // the two nets on the layer where it is below the rule for them (the last pair rule wins in pairClearance):
  // the DRC, the capacity and the realiser follow without knowing of pairs.
  b.netPair.assign(b.nets.size(), -1);
  for (size_t d = 0; d < b.hispeed.diffSignals.size(); ++d) {
    const DiffSignal& ds = b.hispeed.diffSignals[d];
    std::vector<int> pNets, nNets;
    for (int side = 0; side < 2; ++side)
      if (const SignalCluster* c = b.hispeed.clusterOf(side ? ds.signalB : ds.signalA))
        for (const std::string& name : c->nets)
          if (int n = b.findNet(name); n >= 0) {
            (side ? nNets : pNets).push_back(n);
            b.netPair[size_t(n)] = int(d);
          }
    if (pNets.empty() || nNets.empty()) continue;
    if (const Impedance* z = b.hispeed.impedance(ds.impedance); z && z->diff)
      for (const ImpedanceLayerRule& lr : z->rules) {
        LayerId l = b.findLayer(lr.layer);
        if (l < 0 || b.layers[size_t(l)].kind != LayerKind::Copper || lr.gap <= 0) continue;
        const LayerMask lm = LayerMask(1) << l;
        // What the two nets keep on the layer so far: the last pair rule naming both (the local list, not yet
        // the board's), else the larger of their own.
        Coord have = 0;
        for (int p : pNets)
          for (int n : nNets) {
            Coord c = std::max(b.clearance(p, l), b.clearance(n, l));
            for (const ClearancePair& pr : pairRules)
              if ((!pr.layers || ((pr.layers >> l) & 1)) && ((r::contains(pr.netsA, p) && r::contains(pr.netsB, n)) || (r::contains(pr.netsA, n) && r::contains(pr.netsB, p))))
                c = pr.clearance;
            have = std::max(have, c);
          }
        if (lr.gap < have) {
          pairRules.push_back({pNets, nNets, lm, lr.gap});
          if (!nominalRules.empty()) nominalRules.push_back({pNets, nNets, lm, lr.gap});
        }
      }
  }
  // The width rules resolved once for minTrackWidth (it ran netsOf, names to nets, on every query).
  b.minWidthRules.clear();
  for (auto& rule : r.widths) {
    if (!rule.enabled) continue;
    Board::MinWidthRule mr;
    mr.layers = layersOf(b, rule.layers);
    auto nets = netsOf(b, r, rule.nets);
    mr.every = !nets;
    if (nets) {
      mr.nets = std::move(*nets);
      r::sort(mr.nets);
    }
    mr.width = rule.min > 0 ? rule.min : rule.nom;
    b.minWidthRules.push_back(std::move(mr));
  }
  b.minWidthsFor = {b.nets.size(), b.layers.size()};
  // The sorted copies of the lists the lookups bisect (Board::clearance and the rest).
  auto sorted = [](const std::vector<int>& v) {
    std::vector<int> s = v;
    r::sort(s);
    return s;
  };
  for (LayerRule& lr : layerRules) lr.sorted = sorted(lr.nets);
  for (auto* list : {&pairRules, &nominalRules})
    for (ClearancePair& p : *list) {
      p.sortedA = sorted(p.netsA);
      p.sortedB = sorted(p.netsB);
    }
  b.layerRules = std::move(layerRules);
  markPairRules(pairRules);
  b.pairRules = std::move(pairRules);
  b.nominalRules = std::move(nominalRules);

  for (auto& L : b.layers) L.planeNet = kNoNet;
  for (auto& p : r.planes)
    if (LayerId l = b.findLayer(p.layer); p.enabled && l >= 0)
      if (int n = b.findNet(p.net); n >= 0) b.layers[l].planeNet = n;
  if (r.edgeWires > 0) b.edgeClearance = r.edgeWires;
}

DesignRules rulesFromBoard(const Board& b) {
  DesignRules r;
  r.edgeWires = r.edgeComps = b.edgeClearance;
  // Via types: those of the classes and of the vias on the board.
  auto viaType = [&](Coord dia, Coord drill) {
    for (auto& t : r.viaTypes)
      if (t.diameter == dia && t.drill == drill) return t.name;
    std::string name = std::format("{}x{}", mmText(dia), mmText(drill));
    r.viaTypes.push_back({name, dia, drill});
    return name;
  };
  for (auto& nc : b.netClasses) viaType(nc.viaDiameter, nc.viaDrill);
  for (auto& v : b.vias) viaType(v.diameter, v.drill);

  const NetClass& d = b.netClasses[0];
  r.widths.push_back({true, {}, {}, d.trackWidth, d.trackWidth});
  r.clearances.push_back({true, {}, {}, {}, d.clearance, d.clearance});
  r.vias.push_back({true, {}, viaType(d.viaDiameter, d.viaDrill)});
  auto groupOf = [&](const std::string& name, std::vector<std::string> nets) {
    if (nets.size() == 1) return RuleNets{RuleNets::Kind::Net, nets[0]};
    std::string g = name;
    for (int k = 2; r::contains(r.netGroups, g, &NetGroup::name); ++k) g = std::format("{}_{}", name, k);
    r.netGroups.push_back({g, std::move(nets)});
    return RuleNets{RuleNets::Kind::Group, g};
  };
  for (size_t c = 1; c < b.netClasses.size(); ++c) {
    std::vector<std::string> nets;
    for (auto& n : b.nets)
      if (n.netClass == int(c)) nets.push_back(n.name);
    if (nets.empty()) continue;
    const NetClass& nc = b.netClasses[c];
    RuleNets obj = groupOf(nc.name.empty() ? std::format("Class{}", c) : nc.name, std::move(nets));
    if (nc.trackWidth != d.trackWidth) r.widths.push_back({true, {}, obj, nc.trackWidth, nc.trackWidth});
    if (nc.clearance != d.clearance) r.clearances.push_back({true, {}, obj, {}, nc.clearance, nc.clearance});
    if (nc.viaDiameter != d.viaDiameter || nc.viaDrill != d.viaDrill)
      r.vias.push_back({true, obj, viaType(nc.viaDiameter, nc.viaDrill)});
  }
  for (size_t i = 0; i < b.layerRules.size(); ++i) {
    const LayerRule& lr = b.layerRules[i];
    std::vector<std::string> layers;
    for (LayerId l : b.copperLayers())
      if (!lr.layers || ((lr.layers >> l) & 1)) layers.push_back(b.layers[l].name);
    RuleNets obj;
    if (!lr.nets.empty()) {
      std::vector<std::string> nets;
      for (int n : lr.nets) nets.push_back(b.nets[n].name);
      obj = groupOf(std::format("LayerRule{}", i + 1), std::move(nets));
    }
    if (lr.width > 0) r.widths.push_back({true, layers, obj, lr.width, lr.width});
    if (lr.clearance > 0) r.clearances.push_back({true, layers, obj, {}, lr.clearance, lr.clearance});
  }
  for (auto& L : b.layers)
    if (L.planeNet >= 0) r.planes.push_back({true, L.name, b.nets[L.planeNet].name});
  return r;
}

}  // namespace xr
