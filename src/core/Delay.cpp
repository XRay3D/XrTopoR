#include "core/Delay.h"

#include <cmath>
#include <map>
#include <queue>
#include <set>
#include <tuple>

namespace xr {

double delayPsPerMm(const Board& b, LayerId layer) {
  const LayerId top = b.topCopper(), bottom = b.bottomCopper();
  return layer == top || layer == bottom ? kDelayOuterPsPerMm : kDelayInnerPsPerMm;
}

namespace {

int padOf(const Board& b, const PinRef& p) {
  const int c = b.findComponent(p.comp);
  if (c < 0) return -1;
  for (int pi : b.components[size_t(c)].pads)
    if (b.pads[size_t(pi)].number == p.pin) return pi;
  return -1;
}

// The tracks, vias and pads of a cluster's nets as a graph: a node per pad and via, and per place where track
// ends meet clear of both.
struct Graph {
  struct Edge {
    int to;
    double length, ps;
    int track;  // the track the edge is; -1: a joint at no length
  };
  std::vector<std::vector<Edge>> adj;
  std::map<int, int> padNode;  // pad → node
  int node() {
    adj.emplace_back();
    return int(adj.size()) - 1;
  }
  void join(int a, int b, double length, double ps, int track = -1) {
    adj[size_t(a)].push_back({b, length, ps, track});
    adj[size_t(b)].push_back({a, length, ps, track});
  }
};

Graph graphOf(const Board& b, const std::set<int>& nets, const std::vector<std::vector<int>>& tracksOf,
              const std::vector<std::vector<int>>& viasOf, const std::vector<std::vector<int>>& padsOf,
              const std::map<std::pair<int, int>, double>& serpentDrawn, const std::map<std::pair<int, int>, double>& zipScale) {
  Graph g;
  // The track ends: those at one point of a layer are one node (a micrometre's grid takes the rounding of files
  // in other units).
  struct End {
    LayerId layer;
    Vec2 p;
    int node, tracks = 0;
  };
  std::vector<End> ends;
  std::map<std::tuple<LayerId, Coord, Coord>, int> endAt;
  auto endOf = [&](Point p, LayerId layer) {
    auto [it, fresh] = endAt.try_emplace({layer, Coord(std::llround(p.x / 1000.0)), Coord(std::llround(p.y / 1000.0))}, -1);
    if (fresh) {
      it->second = int(ends.size());
      ends.push_back({layer, p.v(), g.node()});
    }
    ++ends[size_t(it->second)].tracks;
    return ends[size_t(it->second)].node;
  };
  for (int n : nets)
    for (int ti : tracksOf[size_t(n)]) {
      const Track& t = b.tracks[size_t(ti)];
      double len = t.length();
      // A piece of a serpent on a single wire counts as it is drawn (the length asked of the serpent may be more
      // than its trapezoid has room for). A zipped pair's conductor that carries a serpent: the serpent's length
      // is what the design says it is — the pieces are the straight line the bends are to be on.
      if (t.serp >= 0 && t.zip >= 0 && size_t(t.serp) < b.serpents.size())
        if (auto it = serpentDrawn.find({t.serp, t.net}); it != serpentDrawn.end() && it->second > 0 && b.serpents[size_t(t.serp)].length > 0)
          len *= b.serpents[size_t(t.serp)].length / it->second;
      // A conductor of a zipped pair: with what the pair's serpents add.
      if (auto it = zipScale.find({t.zip, t.net}); t.zip >= 0 && it != zipScale.end()) len *= it->second;
      const int a = endOf(t.a, t.layer), c = endOf(t.b, t.layer);
      g.join(a, c, len, len / kNmPerMm * delayPsPerMm(b, t.layer), ti);
    }
  // A pad or a via takes the wires that end on it, at no length: those that end at its centre; with none there,
  // the loose ends within it (a wire's bends inside the copper are of the wire — no way is cut short through it);
  // with none of those either, the nearest end.
  auto attach = [&](int node, Vec2 centre, auto&& within) {
    std::vector<const End*> in;
    for (const End& e : ends)
      if (within(e)) in.push_back(&e);
    if (in.empty()) return;
    std::vector<const End*> take;
    for (const End* e : in)
      if ((e->p - centre).len() <= 2000) take.push_back(e);
    if (take.empty())
      for (const End* e : in)
        if (e->tracks == 1) take.push_back(e);
    if (take.empty()) take.push_back(*r::min_element(in, {}, [&](const End* e) { return (e->p - centre).len(); }));
    for (const End* e : take) g.join(node, e->node, 0, 0);
  };
  std::vector<std::pair<int, int>> pads, vias;  // (index, node)
  for (int n : nets) {
    for (int pi : padsOf[size_t(n)]) pads.emplace_back(pi, g.padNode[pi] = g.node());
    for (int vi : viasOf[size_t(n)]) vias.emplace_back(vi, g.node());
  }
  for (auto [vi, node] : vias) {
    const Via& v = b.vias[size_t(vi)];
    // (layer by layer: the wires of each layer that end on the via)
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (v.onLayer(l)) attach(node, v.pos.v(), [&](const End& e) { return e.layer == l && (e.p - v.pos.v()).len() <= v.diameter / 2.0; });
  }
  for (auto [pi, node] : pads) {
    const Pad& pad = b.pads[size_t(pi)];
    const Shape shape = pad.shapeGeom();
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (pad.onLayer(l)) attach(node, pad.pos.v(), [&](const End& e) { return e.layer == l && shape.distance(e.p) <= 0; });
  }
  // A via standing on a pad (a via on a pin) is the pad's.
  for (auto [vi, vn] : vias)
    for (auto [pi, pn] : pads) {
      const Via& v = b.vias[size_t(vi)];
      const Pad& pad = b.pads[size_t(pi)];
      if ((v.layers & pad.copper) && pad.shapeGeom().distance(v.pos.v()) <= 0) g.join(vn, pn, 0, 0);
    }
  return g;
}

}  // namespace

std::vector<SignalDelay> signalDelays(const Board& b) {
  std::vector<SignalDelay> out;
  if (b.hispeed.clusters.empty()) return out;
  std::vector<std::vector<int>> tracksOf(b.nets.size()), viasOf(b.nets.size()), padsOf(b.nets.size());
  auto known = [&](int n) { return n >= 0 && size_t(n) < b.nets.size(); };
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (known(b.tracks[i].net)) tracksOf[size_t(b.tracks[i].net)].push_back(int(i));
  for (size_t i = 0; i < b.vias.size(); ++i)
    if (known(b.vias[i].net)) viasOf[size_t(b.vias[i].net)].push_back(int(i));
  for (size_t i = 0; i < b.pads.size(); ++i)
    if (known(b.pads[i].net)) padsOf[size_t(b.pads[i].net)].push_back(int(i));

  // The drawn length of each serpent's pieces, per net (a zipped pair's serpent is on both its conductors).
  std::map<std::pair<int, int>, double> serpentDrawn;
  for (const Track& t : b.tracks)
    if (t.serp >= 0) serpentDrawn[{t.serp, t.net}] += t.length();

  // A zipped pair's serpents are on its axis, drawn as the straight line the bends are to be on; its conductors
  // are drawn straight beside it. Each is longer than drawn by what the serpents add to the axis; its zipped pieces
  // share that by their lengths.
  std::map<std::pair<int, int>, double> zipScale;  // (zip, net) → the conductor's length over its drawn one
  for (const Track& t : b.tracks)
    if (t.zip >= 0 && size_t(t.zip) < b.zips.size()) zipScale[{t.zip, t.net}] += t.length();
  for (auto& [key, drawn] : zipScale) {
    std::map<int, double> serpents;  // the drawn length of each on the axis
    for (const Track& t : b.zips[size_t(key.first)].axis)
      if (t.serp >= 0 && size_t(t.serp) < b.serpents.size()) serpents[t.serp] += t.length();
    double extra = 0;
    for (auto& [sp, len] : serpents) extra += std::max(0.0, b.serpents[size_t(sp)].length - len);
    drawn = drawn > 0 ? (drawn + extra) / drawn : 1.0;
  }

  for (const SignalCluster& c : b.hispeed.clusters) {
    std::set<int> nets;
    int first = kNoNet;
    for (const std::string& name : c.nets)
      if (int n = b.findNet(name); n >= 0) {
        if (first == kNoNet) first = n;
        nets.insert(n);
      }
    Graph g = graphOf(b, nets, tracksOf, viasOf, padsOf, serpentDrawn, zipScale);
    const int source = padOf(b, c.source);
    const int from = source >= 0 && g.padNode.contains(source) ? g.padNode[source] : -1;
    // The shortest ways from the source, by the delay; a signal's passive components join their pins on the
    // cluster's nets at no length, so the ways are found per signal when it names any.
    struct Ways {
      std::vector<std::pair<double, double>> best;  // (ps, length); -1: not reached
      std::vector<std::pair<int, int>> came;        // the node it was reached from and the track taken (-1: none)
      // The tracks of the way to a node, from the source.
      std::vector<int> tracksTo(int n) const {
        std::vector<int> out;
        for (; n >= 0 && came[size_t(n)].first >= 0; n = came[size_t(n)].first)
          if (came[size_t(n)].second >= 0) out.push_back(came[size_t(n)].second);
        r::reverse(out);
        return out;
      }
    };
    auto ways = [&](const Graph& gr) {
      Ways w{std::vector<std::pair<double, double>>(gr.adj.size(), {-1.0, 0.0}), std::vector<std::pair<int, int>>(gr.adj.size(), {-1, -1})};
      if (from < 0) return w;
      using Item = std::tuple<double, double, int, int, int>;  // ps, length, node, from, track
      std::priority_queue<Item, std::vector<Item>, std::greater<>> open;
      open.emplace(0.0, 0.0, from, -1, -1);
      while (!open.empty()) {
        auto [ps, len, n, prev, track] = open.top();
        open.pop();
        if (w.best[size_t(n)].first >= 0) continue;
        w.best[size_t(n)] = {ps, len};
        w.came[size_t(n)] = {prev, track};
        for (const Graph::Edge& e : gr.adj[size_t(n)])
          if (w.best[size_t(e.to)].first < 0) open.emplace(ps + e.ps, len + e.length, e.to, n, e.track);
      }
      return w;
    };
    const auto plain = ways(g);
    for (const Signal& s : c.signalList) {
      SignalDelay d;
      d.signal = s.name;
      d.net = first;
      const int receiver = padOf(b, s.receiver);
      if (receiver >= 0) d.at = b.pads[size_t(receiver)].pos.v();
      const int to = receiver >= 0 && g.padNode.contains(receiver) ? g.padNode[receiver] : -1;
      // The passive components on the way: not those of the source and of the receiver.
      std::vector<int> passive;
      for (const std::string& ref : s.components)
        if (ref != c.source.comp && ref != s.receiver.comp)
          if (int ci = b.findComponent(ref); ci >= 0) passive.push_back(ci);
      std::pair<double, double> way{-1.0, 0.0};
      if (to >= 0) {
        if (passive.empty()) {
          way = plain.best[size_t(to)];
          d.tracks = plain.tracksTo(to);
        } else {
          Graph through = g;
          for (int ci : passive) {
            int one = -1;
            for (int pi : b.components[size_t(ci)].pads)
              if (auto it = through.padNode.find(pi); it != through.padNode.end()) {
                if (one >= 0) through.join(one, it->second, 0, 0);
                one = it->second;
              }
          }
          const Ways via = ways(through);
          way = via.best[size_t(to)];
          d.tracks = via.tracksTo(to);
        }
      }
      d.routed = way.first >= 0;
      if (d.routed) {
        d.ps = way.first;
        d.length = way.second;
      }
      out.push_back(std::move(d));
    }
  }
  return out;
}

std::vector<DelayViolation> checkDelays(const Board& b) { return checkDelays(b, signalDelays(b)); }

std::vector<DelayViolation> checkDelays(const Board& b, const std::vector<SignalDelay>& delays) {
  std::vector<DelayViolation> out;
  const HiSpeed& h = b.hispeed;
  std::map<std::string, const SignalDelay*, std::less<>> byName;
  for (const SignalDelay& d : delays) byName.emplace(d.signal, &d);
  auto netName = [&](const SignalDelay* d) { return d && d->net >= 0 ? b.nets[size_t(d->net)].name : std::string(); };

  // What a rule compares: a signal, or a differential signal as the mean of its two.
  struct Value {
    std::string name, net;
    double v = 0;
    Vec2 at;
  };
  // The values of a rule's objects; false: one of the signals is not routed (or not there).
  auto values = [&](const std::vector<ObjectSignal>& objects, bool time, std::vector<Value>& vals) {
    std::set<std::string> busy;
    auto add = [&](this auto& self, const ObjectSignal& o) -> bool {
      auto one = [&](std::string_view name) -> const SignalDelay* {
        auto it = byName.find(name);
        return it != byName.end() && it->second->routed ? it->second : nullptr;
      };
      switch (o.kind) {
        case ObjectSignal::Kind::Signal: {
          const SignalDelay* d = one(o.name);
          if (!d) return false;
          vals.push_back({o.name, netName(d), time ? d->ps : d->length, d->at});
          return true;
        }
        case ObjectSignal::Kind::DiffSignal: {
          const int i = h.diffSignal(o.name);
          if (i < 0) return false;
          const SignalDelay *p = one(h.diffSignals[size_t(i)].signalA), *n = one(h.diffSignals[size_t(i)].signalB);
          if (!p || !n) return false;
          vals.push_back({o.name, netName(p), ((time ? p->ps : p->length) + (time ? n->ps : n->length)) / 2, p->at});
          return true;
        }
        case ObjectSignal::Kind::SignalGroup: {
          if (!busy.insert(o.name).second) return true;
          for (const SignalGroup& g : h.groups)
            if (g.name == o.name)
              for (const ObjectSignal& m : g.members)
                if (!self(m)) return false;
          return true;
        }
      }
      return false;
    };
    for (const ObjectSignal& o : objects)
      if (!add(o)) return false;
    return !vals.empty();
  };
  constexpr double kEps = 1e-6;
  for (size_t ri = 0; ri < h.delays.size(); ++ri) {
    const DelayRule& rule = h.delays[ri];
    if (!rule.enabled) continue;
    DelayViolation v;
    v.rule = int(ri);
    v.time = rule.time;
    switch (rule.kind) {
      case DelayRule::Kind::Equal: {
        std::vector<Value> vals;
        if (!values(rule.objects, rule.time, vals) || vals.size() < 2) break;
        const auto [lo, hi] = r::minmax_element(vals, {}, &Value::v);
        if (hi->v - lo->v <= rule.tolerance + kEps) break;
        v.kind = DelayViolation::Kind::Equal;
        v.shorter = lo->name, v.netShorter = lo->net, v.longer = hi->name, v.netLonger = hi->net;
        v.value = hi->v - lo->v;
        v.high = rule.tolerance;
        v.at = lo->at;
        out.push_back(std::move(v));
        break;
      }
      case DelayRule::Kind::Constant: {
        std::vector<Value> vals;
        if (!values(rule.objects, rule.time, vals)) break;
        const Value* worst = nullptr;
        double excess = kEps;
        for (const Value& x : vals) {
          const double dev = x.v - rule.constant;
          const double e = std::max(dev - rule.toleranceOver, -rule.toleranceUnder - dev);
          if (e > excess) excess = e, worst = &x;
        }
        if (!worst) break;
        v.kind = DelayViolation::Kind::Constant;
        v.shorter = worst->name, v.netShorter = worst->net;
        v.value = worst->v;
        v.low = rule.constant - rule.toleranceUnder, v.high = rule.constant + rule.toleranceOver;
        v.at = worst->at;
        out.push_back(std::move(v));
        break;
      }
      case DelayRule::Kind::Relation: {
        std::vector<Value> left, right;
        if (!values(rule.left, rule.time, left) || !values(rule.right, rule.time, right)) break;
        const Value *wl = nullptr, *wr = nullptr;
        double excess = kEps;
        for (const Value& l : left)
          for (const Value& rt : right) {
            const double dev = l.v - rt.v - rule.constant;
            const double e = std::max(dev - rule.toleranceOver, -rule.toleranceUnder - dev);
            if (e > excess) excess = e, wl = &l, wr = &rt;
          }
        if (!wl) break;
        v.kind = DelayViolation::Kind::Relation;
        const bool leftShorter = wl->v <= wr->v;
        const Value &s = leftShorter ? *wl : *wr, &l = leftShorter ? *wr : *wl;
        v.shorter = s.name, v.netShorter = s.net, v.longer = l.name, v.netLonger = l.net;
        v.left = wl->name, v.right = wr->name;
        v.value = wl->v - wr->v;
        v.low = rule.constant - rule.toleranceUnder, v.high = rule.constant + rule.toleranceOver;
        v.at = s.at;
        out.push_back(std::move(v));
        break;
      }
    }
  }
  // The two conductors of a differential signal: their lengths within the allowed difference.
  for (size_t di = 0; di < h.diffSignals.size(); ++di) {
    const DiffSignal& ds = h.diffSignals[di];
    if (ds.mismatch <= 0) continue;
    auto pa = byName.find(ds.signalA), pb = byName.find(ds.signalB);
    if (pa == byName.end() || pb == byName.end() || !pa->second->routed || !pb->second->routed) continue;
    const SignalDelay *s = pa->second, *l = pb->second;
    if (s->length > l->length) std::swap(s, l);
    if (l->length - s->length <= double(ds.mismatch) + 1.0) continue;
    DelayViolation v;
    v.kind = DelayViolation::Kind::Mismatch;
    v.rule = int(di);
    v.time = false;
    v.shorter = s->signal, v.netShorter = netName(s), v.longer = l->signal, v.netLonger = netName(l);
    v.value = l->length - s->length;
    v.high = double(ds.mismatch);
    v.at = s->at;
    out.push_back(std::move(v));
  }
  return out;
}

}  // namespace xr
