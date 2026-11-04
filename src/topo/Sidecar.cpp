#include "topo/Sidecar.h"

#include <boost/json.hpp>

#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <map>
#include <sstream>

#include "topo/Capacity.h"

namespace xr::topo {

namespace json = boost::json;

namespace {

// The board's files carry 0.1 um (four decimals of a millimetre), reorder their items and number
// their nets and layers anew: what is hashed and what names a track is quantised to that, ordered by
// nothing, and nets and layers go by name.
constexpr double kQuantum = 100;  // nm
int64_t q(double nm) { return std::llround(nm / kQuantum); }

struct Fnv {
  uint64_t h = 1469598103934665603ull;
  void bytes(const void* p, size_t n) {
    const auto* c = static_cast<const unsigned char*>(p);
    for (size_t i = 0; i < n; ++i) {
      h ^= c[i];
      h *= 1099511628211ull;
    }
  }
  void i(int64_t x) { bytes(&x, sizeof x); }
  void s(const std::string& x) {
    bytes(x.data(), x.size());
    i(int64_t(x.size()));
  }
  void v(Vec2 p) {
    i(q(p.x));
    i(q(p.y));
  }
  void pt(Point p) {
    i(q(double(p.x)));
    i(q(double(p.y)));
  }
};

std::string netName(const Board& b, int net) { return net >= 0 && net < int(b.nets.size()) ? b.nets[net].name : std::string(); }
std::string layerName(const Board& b, LayerId l) { return l >= 0 && l < int(b.layers.size()) ? b.layers[l].name : std::string(); }
// A layer mask by the names of its layers.
std::vector<std::string> maskNames(const Board& b, LayerMask m) {
  std::vector<std::string> out;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if ((m >> l) & 1) out.push_back(b.layers[l].name);
  return out;
}

// A track by its content: the ends in a fixed order (a file may chain it the other way round), an arc's
// mid point to a micrometre (a file keeps the centre, the mid point comes back rounded).
using TrackKey = std::tuple<int64_t, int64_t, int64_t, int64_t, int64_t, int64_t, bool, int64_t, std::string, std::string>;
TrackKey keyOf(const Board& b, const Track& t) {
  int64_t ax = q(double(t.a.x)), ay = q(double(t.a.y)), cx = q(double(t.b.x)), cy = q(double(t.b.y));
  if (std::tie(cx, cy) < std::tie(ax, ay)) {  // on the quantised values: nanometres apart, the ends would sort either way
    std::swap(ax, cx);
    std::swap(ay, cy);
  }
  return {ax, ay, cx, cy, t.mid ? std::llround(double(t.mid->x) / 1000) : 0, t.mid ? std::llround(double(t.mid->y) / 1000) : 0, t.mid.has_value(),
          q(double(t.width)), layerName(b, t.layer), netName(b, t.net)};
}
json::array trackJson(const Board& b, const Track& t) {
  auto k = keyOf(b, t);
  return json::array{std::get<0>(k), std::get<1>(k), std::get<2>(k), std::get<3>(k), std::get<4>(k), std::get<5>(k), std::get<6>(k), std::get<7>(k),
                     std::get<8>(k), std::get<9>(k)};
}
TrackKey keyOf(const json::array& a) {
  return {a[0].to_number<int64_t>(), a[1].to_number<int64_t>(), a[2].to_number<int64_t>(), a[3].to_number<int64_t>(), a[4].to_number<int64_t>(),
          a[5].to_number<int64_t>(), a[6].as_bool(), a[7].to_number<int64_t>(), std::string(a[8].as_string()), std::string(a[9].as_string())};
}

json::array vec(Vec2 p) { return json::array{p.x, p.y}; }
Vec2 vec(const json::value& v) { return {v.as_array()[0].to_number<double>(), v.as_array()[1].to_number<double>()}; }

json::object shape(const Shape& s) {
  json::array poly;
  for (Vec2 p : s.poly) poly.push_back(vec(p));
  return json::object{{"k", int(s.kind)}, {"a", vec(s.a)}, {"b", vec(s.b)}, {"r", s.r}, {"poly", poly}};
}
Shape shape(const json::object& o) {
  Shape s;
  s.kind = Shape::Kind(o.at("k").to_number<int>());
  s.a = vec(o.at("a"));
  s.b = vec(o.at("b"));
  s.r = o.at("r").to_number<double>();
  for (const json::value& p : o.at("poly").as_array()) s.poly.push_back(vec(p));
  return s;
}

int64_t integer(const json::value& v) { return v.to_number<int64_t>(); }

std::string hex(uint64_t h) {
  char buf[20];
  std::snprintf(buf, sizeof buf, "%016llx", static_cast<unsigned long long>(h));
  return buf;
}

constexpr int kVersion = 1;

}  // namespace

uint64_t boardHashOf(const Board& b) {
  // Per item a hash, summed: the order of the items is the file's business.
  uint64_t sum = 0;
  const bool debug = std::getenv("XR_TOPO_HASHDEBUG");
  uint64_t section = 0;
  auto report = [&](const char* what) {
    if (debug) std::fprintf(stderr, "hash %s: %016llx\n", what, static_cast<unsigned long long>(sum - section));
    section = sum;
  };
  auto item = [&](auto&& fill) {
    Fnv f;
    fill(f);
    sum += f.h;
  };
  Fnv head;
  head.i(int64_t(b.copperLayers().size()));
  head.i(q(double(b.edgeClearance)));
  for (const NetClass& nc : b.netClasses) {
    head.s(nc.name);
    head.i(q(double(nc.trackWidth)));
    head.i(q(double(nc.clearance)));
    head.i(q(double(nc.viaDiameter)));
  }
  sum += head.h;
  report("head");
  for (const Net& n : b.nets)
    item([&](Fnv& f) {
      f.s(n.name);
      f.s(b.netClasses[size_t(std::clamp(n.netClass, 0, int(b.netClasses.size()) - 1))].name);
    });
  report("nets");
  for (const LayerRule& r : b.layerRules)
    item([&](Fnv& f) {
      for (int n : r.nets) f.s(netName(b, n));
      for (const std::string& l : maskNames(b, r.layers)) f.s(l);
      f.i(q(double(r.width)));
      f.i(q(double(r.clearance)));
    });
  report("rules");
  for (const Pad& p : b.pads)
    item([&](Fnv& f) {
      f.pt(p.pos);
      f.i(std::llround(p.angle * 100));
      f.s(netName(b, p.net));
      f.i(int(p.shape.kind));
      f.i(q(double(p.shape.w)));
      f.i(q(double(p.shape.h)));
      f.i(std::llround(p.shape.rratio * 1e4));
      for (Vec2 v : p.shape.poly) f.v(v);
      f.i(q(double(p.drill)));
      f.i(q(double(p.drillH)));
      for (const std::string& l : maskNames(b, p.copper)) f.s(l);
    });
  report("pads");
  for (const Via& v : b.vias)
    item([&](Fnv& f) {
      f.pt(v.pos);
      f.i(q(double(v.diameter)));
      for (const std::string& l : maskNames(b, v.layers)) f.s(l);
      f.s(netName(b, v.net));
      f.i(v.locked);
    });
  report("vias");
  // The tracks by their numbers per layer, net and width only: the realiser's nanometres round either
  // way at the file's four decimals, no grid is stable at its boundaries. A wire's tracks are matched
  // within a tolerance when the model is read.
  {
    std::map<std::tuple<std::string, std::string, int64_t, bool, bool>, int> counts;
    for (const Track& t : b.tracks) ++counts[{layerName(b, t.layer), netName(b, t.net), q(double(t.width)), t.mid.has_value(), t.locked}];
    for (const auto& [k, n] : counts)
      item([&](Fnv& f) {
        f.s(std::get<0>(k));
        f.s(std::get<1>(k));
        f.i(std::get<2>(k));
        f.i(std::get<3>(k));
        f.i(std::get<4>(k));
        f.i(n);
      });
  }
  report("tracks");
  for (const auto& loop : b.outline)
    item([&](Fnv& f) {
      for (Vec2 p : loop) f.v(p);
    });
  report("outline");
  for (const Keepout& k : b.keepouts)
    item([&](Fnv& f) {
      f.i(int(k.role));
      f.i(k.wires);
      f.i(k.vias);
      for (const std::string& l : maskNames(b, k.layers)) f.s(l);
      for (const Graphic& g : k.shape) {
        f.i(int(g.kind));
        f.v(g.a);
        f.v(g.b);
        f.v(g.m);
        for (Vec2 p : g.pts) f.v(p);
      }
    });
  report("keepouts");
  if (debug) std::fprintf(stderr, "hash: %zu pads %zu vias %zu tracks %zu nets %zu rules %zu classes\n", b.pads.size(), b.vias.size(), b.tracks.size(), b.nets.size(), b.layerRules.size(), b.netClasses.size());
  return sum;
}

std::string sidecarPath(const std::string& boardPath) { return boardPath + ".xrtopo"; }

std::expected<void, std::string> saveTopology(Topology& t, const Board& b, const std::string& path) {
  t.boardHash = boardHashOf(b);
  std::map<uint32_t, int> trackOfId;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[i].id) trackOfId[b.tracks[i].id] = i;
  json::object root{{"format", "xrtopo"}, {"version", kVersion}, {"hash", hex(t.boardHash)}};
  json::array nets, layerNames;
  for (const Net& n : b.nets) nets.push_back(json::string(n.name));
  for (const Layer& l : b.layers) layerNames.push_back(json::string(l.name));
  root["nets"] = std::move(nets);
  root["layerNames"] = std::move(layerNames);
  json::array owners;
  for (const Owner& o : t.owners) {
    json::object jo{{"kind", int(o.kind)}, {"c", vec(o.c)}, {"axis", vec(o.axis)}, {"hw", o.halfWidth}, {"shape", shape(o.shape)},
                    {"net", o.net}, {"layers", int64_t(o.layers)}, {"junction", o.junction}, {"locked", o.locked}};
    // The pads and vias by what names them in any order: the component and the pin, the place and the net.
    if (o.pad >= 0 && o.pad < int(b.pads.size())) {
      const Pad& p = b.pads[o.pad];
      jo["pad"] = json::array{p.component >= 0 ? b.components[p.component].ref : std::string(), p.number};
    }
    if (o.via >= 0 && o.via < int(b.vias.size())) {
      const Via& v = b.vias[o.via];
      jo["via"] = json::array{q(double(v.pos.x)), q(double(v.pos.y)), netName(b, v.net)};
    }
    owners.push_back(std::move(jo));
  }
  root["owners"] = std::move(owners);
  json::array junctions;
  for (const Junction& j : t.junctions)
    junctions.push_back(json::object{{"pos", vec(j.pos)}, {"net", j.net}, {"layer", int(j.layer)}, {"owner", j.owner}, {"degree", j.degree}});
  root["junctions"] = std::move(junctions);
  json::array layers;
  for (const LayerMesh& m : t.layers) {
    json::array verts, tris, edges, clr;
    for (const Vertex& x : m.verts) verts.push_back(json::array{x.owner, x.t, x.off.x, x.off.y});
    for (const Tri& T : m.tris)
      tris.push_back(json::array{T.v[0], T.v[1], T.v[2], T.e[0], T.e[1], T.e[2], T.nb[0], T.nb[1], T.nb[2], T.inside, T.blocked});
    for (const Edge& E : m.edges) {
      json::array cross;
      for (int c : E.cross) cross.push_back(c);
      edges.push_back(json::array{E.v[0], E.v[1], E.t[0], E.t[1], E.constrained, E.rigid, E.along, std::move(cross)});
    }
    for (double c : m.ownerClr) clr.push_back(c);
    layers.push_back(json::object{{"layer", int(m.layer)}, {"verts", std::move(verts)}, {"tris", std::move(tris)}, {"edges", std::move(edges)},
                                  {"ownerClr", std::move(clr)}});
  }
  root["layers"] = std::move(layers);
  json::array wires;
  for (const Wire& w : t.wires) {
    json::array cross, tracks;
    for (int c : w.cross) cross.push_back(c);
    for (uint32_t id : w.tracks)
      if (auto it = trackOfId.find(id); it != trackOfId.end()) tracks.push_back(trackJson(b, b.tracks[it->second]));
    wires.push_back(json::object{{"net", w.net}, {"layer", int(w.layer)}, {"width", w.width}, {"widthMin", w.widthMin}, {"clr", w.clr},
                                 {"end", json::array{w.end[0], w.end[1]}}, {"endVertex", json::array{w.endVertex[0], w.endVertex[1]}},
                                 {"exit", json::array{vec(w.exit[0]), vec(w.exit[1])}}, {"hasExit", json::array{w.hasExit[0], w.hasExit[1]}},
                                 {"cross", std::move(cross)}, {"tracks", std::move(tracks)}, {"locked", w.locked}, {"dirty", w.dirty}});
  }
  root["wires"] = std::move(wires);
  json::array crossings;
  for (const Crossing& c : t.crossings) crossings.push_back(json::array{c.wire, c.edge, c.idx, c.width});
  root["crossings"] = std::move(crossings);
  json::array ownerTracks;
  for (auto [owner, id] : t.ownerTracks)
    if (auto it = trackOfId.find(id); it != trackOfId.end()) ownerTracks.push_back(json::array{owner, trackJson(b, b.tracks[it->second])});
  root["ownerTracks"] = std::move(ownerTracks);
  root["pads"] = int64_t(b.pads.size());
  root["vias"] = int64_t(b.vias.size());
  // Every track of the board, by content: a board whose tracks do not all match within the tolerance (a
  // segment dragged elsewhere keeps the counts the hash sees) is another board.
  json::array allTracks;
  for (const Track& tr : b.tracks) allTracks.push_back(trackJson(b, tr));
  root["tracks"] = std::move(allTracks);
  std::ofstream out(path, std::ios::binary);
  if (!out) return std::unexpected("cannot write " + path);
  out << json::serialize(root) << '\n';
  if (!out) return std::unexpected("cannot write " + path);
  return {};
}

std::expected<Topology, std::string> loadTopology(const Board& b, const std::string& path) {
  std::ifstream in(path, std::ios::binary);
  if (!in) return std::unexpected("no model file " + path);
  std::stringstream ss;
  ss << in.rdbuf();
  boost::system::error_code ec;
  json::value jv = json::parse(ss.str(), ec);
  if (ec) return std::unexpected("model file " + path + ": " + ec.message());
  try {
    const json::object& root = jv.as_object();
    if (root.at("format").as_string() != "xrtopo" || root.at("version").to_number<int>() != kVersion) return std::unexpected("model file " + path + ": another version");
    const uint64_t hash = boardHashOf(b);
    if (std::string(root.at("hash").as_string()) != hex(hash)) return std::unexpected("model file " + path + " is stale (the board changed)");
    // The nets and layers by name: the board may number them anew.
    std::vector<int> netMap;
    for (const json::value& n : root.at("nets").as_array()) {
      int found = -1;
      for (int i = 0; i < int(b.nets.size()); ++i)
        if (b.nets[i].name == n.as_string()) found = i;
      netMap.push_back(found);
    }
    std::vector<LayerId> layerMap;
    for (const json::value& n : root.at("layerNames").as_array()) {
      LayerId found = -1;
      for (LayerId i = 0; i < LayerId(b.layers.size()); ++i)
        if (b.layers[i].name == n.as_string()) found = i;
      layerMap.push_back(found);
    }
    auto net = [&](int n) -> std::expected<int, std::string> {
      if (n < 0) return n;
      if (n >= int(netMap.size()) || netMap[n] < 0) return std::unexpected("model file " + path + " is stale (a net is gone)");
      return netMap[n];
    };
    auto layer = [&](int l) -> std::expected<LayerId, std::string> {
      if (l < 0 || l >= int(layerMap.size()) || layerMap[l] < 0) return std::unexpected("model file " + path + " is stale (a layer is gone)");
      return layerMap[l];
    };
    auto mask = [&](int64_t m) -> std::expected<LayerMask, std::string> {
      LayerMask out = 0;
      for (int l = 0; l < 64 && l < int(layerMap.size()); ++l)
        if ((m >> l) & 1) {
          auto ml = layer(l);
          if (!ml) return std::unexpected(ml.error());
          out |= LayerMask(1) << *ml;
        }
      return out;
    };
    // The tracks by content, within two quanta (the file rounds either way): among those of the key's
    // layer, net, width and kind, the first not yet taken whose ends and mid point lie that close.
    std::map<std::tuple<std::string, std::string, int64_t, bool>, std::vector<int>> groups;
    for (int i = 0; i < int(b.tracks.size()); ++i) {
      const Track& tr = b.tracks[i];
      if (tr.id) groups[{layerName(b, tr.layer), netName(b, tr.net), q(double(tr.width)), tr.mid.has_value()}].push_back(i);
    }
    std::vector<char> used(b.tracks.size(), 0);
    auto idOf = [&](const json::array& key) -> std::optional<uint32_t> {
      TrackKey k = keyOf(key);
      auto it = groups.find({std::get<8>(k), std::get<9>(k), std::get<7>(k), std::get<6>(k)});
      if (it == groups.end()) return std::nullopt;
      auto close = [](int64_t x, int64_t y, int64_t tol) { return std::llabs(x - y) <= tol; };
      for (int i : it->second) {
        if (used[i]) continue;
        TrackKey c = keyOf(b, b.tracks[i]);
        if (close(std::get<0>(k), std::get<0>(c), 2) && close(std::get<1>(k), std::get<1>(c), 2) && close(std::get<2>(k), std::get<2>(c), 2) &&
            close(std::get<3>(k), std::get<3>(c), 2) && close(std::get<4>(k), std::get<4>(c), 2) && close(std::get<5>(k), std::get<5>(c), 2)) {
          used[i] = 1;
          return b.tracks[i].id;
        }
      }
      if (std::getenv("XR_TOPO_HASHDEBUG")) {
        std::fprintf(stderr, "no track for key %lld %lld %lld %lld mid %lld %lld arc %d w %lld %s %s; nearest:", (long long)std::get<0>(k), (long long)std::get<1>(k),
                     (long long)std::get<2>(k), (long long)std::get<3>(k), (long long)std::get<4>(k), (long long)std::get<5>(k), int(std::get<6>(k)),
                     (long long)std::get<7>(k), std::get<8>(k).c_str(), std::get<9>(k).c_str());
        int64_t best = -1;
        TrackKey bc;
        for (int i : it->second) {
          TrackKey c = keyOf(b, b.tracks[i]);
          int64_t d = std::llabs(std::get<0>(k) - std::get<0>(c)) + std::llabs(std::get<1>(k) - std::get<1>(c)) + std::llabs(std::get<2>(k) - std::get<2>(c)) + std::llabs(std::get<3>(k) - std::get<3>(c));
          if (best < 0 || d < best) { best = d; bc = c; }
        }
        if (best >= 0)
          std::fprintf(stderr, " %lld %lld %lld %lld mid %lld %lld (used %d)\n", (long long)std::get<0>(bc), (long long)std::get<1>(bc), (long long)std::get<2>(bc),
                       (long long)std::get<3>(bc), (long long)std::get<4>(bc), (long long)std::get<5>(bc), 0);
        else std::fprintf(stderr, " none\n");
      }
      return std::nullopt;
    };
    if (integer(root.at("pads")) != int64_t(b.pads.size()) || integer(root.at("vias")) != int64_t(b.vias.size()))
      return std::unexpected("model file " + path + " is stale (other pads or vias)");
    std::map<std::pair<std::string, std::string>, int> padOf;
    for (int i = 0; i < int(b.pads.size()); ++i)
      padOf[{b.pads[i].component >= 0 ? b.components[b.pads[i].component].ref : std::string(), b.pads[i].number}] = i;
    std::map<std::tuple<int64_t, int64_t, std::string>, std::vector<int>> viasAt;
    for (int i = 0; i < int(b.vias.size()); ++i) viasAt[{q(double(b.vias[i].pos.x)), q(double(b.vias[i].pos.y)), netName(b, b.vias[i].net)}].push_back(i);
    std::map<std::tuple<int64_t, int64_t, std::string>, size_t> viaTaken;
    if (auto* all = root.if_contains("tracks")) {
      const json::array& keys = all->as_array();
      if (keys.size() != b.tracks.size()) return std::unexpected("model file " + path + " is stale (other tracks)");
      std::vector<char> usedAll(b.tracks.size(), 0);
      std::swap(used, usedAll);
      for (const json::value& k : keys)
        if (!idOf(k.as_array())) return std::unexpected("model file " + path + " is stale (a track moved)");
      std::swap(used, usedAll);
    }
    Topology t;
    t.boardHash = hash;
    t.padOwner.assign(b.pads.size(), -1);
    t.viaOwner.assign(b.vias.size(), -1);
    for (const json::value& v : root.at("owners").as_array()) {
      const json::object& o = v.as_object();
      Owner ow;
      ow.kind = Owner::Kind(o.at("kind").to_number<int>());
      ow.c = vec(o.at("c"));
      ow.axis = vec(o.at("axis"));
      ow.halfWidth = o.at("hw").to_number<double>();
      ow.shape = shape(o.at("shape").as_object());
      auto n = net(o.at("net").to_number<int>());
      if (!n) return std::unexpected(n.error());
      ow.net = *n;
      auto m = mask(integer(o.at("layers")));
      if (!m) return std::unexpected(m.error());
      ow.layers = *m;
      if (auto* pk = o.if_contains("pad")) {
        const json::array& a = pk->as_array();
        auto it = padOf.find({std::string(a[0].as_string()), std::string(a[1].as_string())});
        if (it == padOf.end()) return std::unexpected("model file " + path + " is stale (a pad is gone)");
        ow.pad = it->second;
        t.padOwner[ow.pad] = int(t.owners.size());
      }
      if (auto* vk = o.if_contains("via")) {
        const json::array& a = vk->as_array();
        std::tuple<int64_t, int64_t, std::string> key{a[0].to_number<int64_t>(), a[1].to_number<int64_t>(), std::string(a[2].as_string())};
        auto it = viasAt.find(key);
        if (it == viasAt.end() || viaTaken[key] >= it->second.size()) return std::unexpected("model file " + path + " is stale (a via is gone)");
        ow.via = it->second[viaTaken[key]++];
        ow.viaId = b.vias[ow.via].id;
        t.viaOwner[ow.via] = int(t.owners.size());
      }
      ow.junction = o.at("junction").to_number<int>();
      ow.locked = o.at("locked").as_bool();
      t.owners.push_back(std::move(ow));
    }
    for (const json::value& v : root.at("junctions").as_array()) {
      const json::object& o = v.as_object();
      auto n = net(o.at("net").to_number<int>());
      auto l = layer(o.at("layer").to_number<int>());
      if (!n) return std::unexpected(n.error());
      if (!l) return std::unexpected(l.error());
      t.junctions.push_back({vec(o.at("pos")), *n, *l, o.at("owner").to_number<int>(), o.at("degree").to_number<int>()});
    }
    for (const json::value& v : root.at("layers").as_array()) {
      const json::object& o = v.as_object();
      LayerMesh m;
      auto l = layer(o.at("layer").to_number<int>());
      if (!l) return std::unexpected(l.error());
      m.layer = *l;
      for (const json::value& x : o.at("verts").as_array()) {
        const json::array& a = x.as_array();
        Vertex vx;
        vx.owner = a[0].to_number<int>();
        vx.t = a[1].to_number<double>();
        vx.off = {a[2].to_number<double>(), a[3].to_number<double>()};
        m.verts.push_back(vx);
      }
      for (const json::value& x : o.at("tris").as_array()) {
        const json::array& a = x.as_array();
        Tri T;
        for (int i = 0; i < 3; ++i) {
          T.v[i] = a[i].to_number<int>();
          T.e[i] = a[3 + i].to_number<int>();
          T.nb[i] = a[6 + i].to_number<int>();
        }
        T.inside = a[9].as_bool();
        T.blocked = a[10].as_bool();
        m.tris.push_back(T);
      }
      for (const json::value& x : o.at("edges").as_array()) {
        const json::array& a = x.as_array();
        Edge E;
        E.v[0] = a[0].to_number<int>();
        E.v[1] = a[1].to_number<int>();
        E.t[0] = a[2].to_number<int>();
        E.t[1] = a[3].to_number<int>();
        E.constrained = a[4].as_bool();
        E.rigid = a[5].as_bool();
        E.along = a[6].to_number<int>();
        for (const json::value& c : a[7].as_array()) E.cross.push_back(c.to_number<int>());
        m.edges.push_back(std::move(E));
      }
      for (const json::value& c : o.at("ownerClr").as_array()) m.ownerClr.push_back(c.to_number<double>());
      m.ownerVerts.assign(t.owners.size(), {});
      for (int vi = 0; vi < int(m.verts.size()); ++vi) {
        Vertex& x = m.verts[vi];
        if (x.owner < 0 || x.owner >= int(t.owners.size())) continue;
        t.placeVertex(m, vi);
        m.ownerVerts[x.owner].push_back(vi);
      }
      for (int ti = 0; ti < int(m.tris.size()); ++ti)
        if (m.tris[ti].inside)
          for (int i = 0; i < 3; ++i) m.verts[m.tris[ti].v[i]].tris.push_back(ti);
      t.layers.push_back(std::move(m));
    }
    for (const json::value& v : root.at("wires").as_array()) {
      const json::object& o = v.as_object();
      Wire w;
      auto n = net(o.at("net").to_number<int>());
      auto l = layer(o.at("layer").to_number<int>());
      if (!n) return std::unexpected(n.error());
      if (!l) return std::unexpected(l.error());
      w.net = *n;
      w.layer = *l;
      w.width = Coord(integer(o.at("width")));
      w.widthMin = Coord(integer(o.at("widthMin")));
      w.clr = Coord(integer(o.at("clr")));
      for (int i = 0; i < 2; ++i) {
        w.end[i] = o.at("end").as_array()[i].to_number<int>();
        w.endVertex[i] = o.at("endVertex").as_array()[i].to_number<int>();
        w.exit[i] = vec(o.at("exit").as_array()[i]);
        w.hasExit[i] = o.at("hasExit").as_array()[i].as_bool();
      }
      for (const json::value& c : o.at("cross").as_array()) w.cross.push_back(c.to_number<int>());
      for (const json::value& k : o.at("tracks").as_array()) {
        auto id = idOf(k.as_array());
        if (!id) return std::unexpected("model file " + path + " is stale (a wire's track is gone)");
        w.tracks.push_back(*id);
      }
      w.locked = o.at("locked").as_bool();
      w.dirty = o.at("dirty").as_bool();
      t.wires.push_back(std::move(w));
    }
    for (const json::value& v : root.at("crossings").as_array()) {
      const json::array& a = v.as_array();
      t.crossings.push_back({a[0].to_number<int>(), a[1].to_number<int>(), a[2].to_number<int>(), a[3].to_number<double>()});
    }
    for (const json::value& v : root.at("ownerTracks").as_array()) {
      const json::array& a = v.as_array();
      auto id = idOf(a[1].as_array());
      if (!id) return std::unexpected("model file " + path + " is stale (a pad's track is gone)");
      t.ownerTracks.push_back({a[0].to_number<int>(), *id});
    }
    for (LayerMesh& m : t.layers)
      for (int e = 0; e < int(m.edges.size()); ++e)
        if (m.edges[e].v[0] >= 0 && !m.edges[e].cross.empty()) refreshEdge(t, m, e);
    return t;
  } catch (const std::exception& e) {
    return std::unexpected("model file " + path + ": " + e.what());
  }
}

}  // namespace xr::topo
