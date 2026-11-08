#include "core/BoardGen.h"

#include <format>
#include <random>

#include "core/Rules.h"

namespace xr {

namespace {

constexpr double kPitch = 2.54;

struct Gen {
  Board b;
  LayerId top = 0, bottom = 0;

  Gen(std::string name, double w, double h) {
    b.name = std::move(name);
    top = b.addLayer("Top", LayerKind::Copper, Side::Top);
    bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
    b.layers[top].copperIndex = 0;
    b.layers[bottom].copperIndex = 1;
    NetClass& nc = b.netClasses[0];
    nc.trackWidth = mmToNm(0.25);
    nc.clearance = mmToNm(0.2);
    nc.viaDiameter = mmToNm(0.6);
    nc.viaDrill = mmToNm(0.3);
    b.edgeClearance = mmToNm(0.25);
    b.outline.push_back({at(0, 0), at(w, 0), at(w, h), at(0, h)});
  }
  static Vec2 at(double x, double y) { return {x * kNmPerMm, y * kNmPerMm}; }

  int component(const std::string& ref, double x, double y) {
    Component c;
    c.ref = ref;
    c.footprint = ref;
    c.pos = Point(at(x, y));
    b.components.push_back(std::move(c));
    return int(b.components.size()) - 1;
  }
  // A pad of component `comp` at (x, y) on the board; net by name (empty: none).
  void pad(int comp, const std::string& number, double x, double y, const std::string& net, bool smd = false, double w = 0,
           double h = 0) {
    Pad p;
    p.number = number;
    p.component = comp;
    p.net = net.empty() ? kNoNet : b.addNet(net);
    p.pos = Point(at(x, y));
    p.localPos = Point(at(x, y) - b.components[size_t(comp)].pos.v());
    if (smd) {
      p.shape.kind = PadShapeKind::Rect;
      p.shape.w = mmToNm(w);
      p.shape.h = mmToNm(h);
      p.copper = LayerMask(1) << top;
    } else {
      p.shape.kind = PadShapeKind::Circle;
      p.shape.w = p.shape.h = mmToNm(1.6);
      p.drill = mmToNm(0.9);
      p.copper = (LayerMask(1) << top) | (LayerMask(1) << bottom);
    }
    b.components[size_t(comp)].pads.push_back(int(b.pads.size()));
    b.pads.push_back(std::move(p));
  }
  // A connector of n through-hole pins in a column (vertical) or a row from (x, y); pin k on net names[k].
  void connector(const std::string& ref, double x, double y, bool vertical, const std::vector<std::string>& nets) {
    int c = component(ref, x, y);
    for (size_t k = 0; k < nets.size(); ++k) {
      double d = double(k) * kPitch;
      pad(c, std::to_string(k + 1), vertical ? x : x + d, vertical ? y + d : y, nets[k]);
    }
  }
  // A two-pin resistor between (x, y) and 7.62 mm to the right (or down).
  void resistor(const std::string& ref, double x, double y, bool vertical, const std::string& a, const std::string& bnet) {
    int c = component(ref, x, y);
    pad(c, "1", x, y, a);
    pad(c, "2", vertical ? x : x + 3 * kPitch, vertical ? y + 3 * kPitch : y, bnet);
  }
  Board done() {
    b.rules = rulesFromBoard(b);
    compileRules(b);
    return std::move(b);
  }
};

std::vector<std::string> busNets(const std::string& prefix, int n) {
  std::vector<std::string> v;
  for (int k = 0; k < n; ++k) v.push_back(std::format("{}{}", prefix, k));
  return v;
}

}  // namespace

std::vector<std::string> busBoardKinds() { return {"bus_straight", "bus_twisted", "bus_offset", "bus_cross", "bus_mixed", "smd_bus"}; }

std::optional<Board> makeBusBoard(std::string_view kind, int n) {
  const double len = double(n - 1) * kPitch;
  auto nets = busNets("D", n);
  if (kind == "bus_straight" || kind == "bus_twisted") {
    Gen g(std::string(kind), 70, len + 20);
    g.connector("J1", 10, 10, true, nets);
    auto other = nets;
    if (kind == "bus_twisted") r::reverse(other);
    g.connector("J2", 60, 10, true, other);
    return g.done();
  }
  if (kind == "bus_offset") {
    Gen g(std::string(kind), 90, 2 * len + 25);
    g.connector("J1", 10, 10, true, nets);
    g.connector("J2", 80, 15 + len, true, nets);
    // Two columns of resistors on nets of their own, standing in the bus's way.
    int r = 1;
    for (double x : {30.0, 55.0})
      for (double y = 12; y + 3 * kPitch < 2 * len + 20; y += 4 * kPitch, ++r)
        g.resistor(std::format("R{}", r), x, y, true, std::format("N{}A", r), std::format("N{}B", r));
    return g.done();
  }
  if (kind == "bus_cross") {
    Gen g(std::string(kind), len + 60, len + 60);
    g.connector("J1", 10, 30, true, nets);                      // A: left ...
    g.connector("J2", len + 50, 30, true, nets);                // ... to right
    auto b = busNets("E", n);
    g.connector("J3", 30, len + 50, false, b);                  // B: bottom ...
    g.connector("J4", 30, 10, false, b);                        // ... to top
    return g.done();
  }
  if (kind == "bus_mixed") {
    // Resistors in rows above and below the bus, a net from one above to one below (shuffled): every such net
    // crosses the bus.
    const int m = 2 * n, cols = 5, rows = (m + cols - 1) / cols;
    const double busY = 8 + rows * 3.0;
    Gen g(std::string(kind), 90, busY + len + 12 + rows * 3.0);
    g.connector("J1", 10, busY, true, nets);
    g.connector("J2", 80, busY, true, nets);
    std::vector<int> perm = v::iota(0, m) | r::to<std::vector<int>>();
    std::shuffle(perm.begin(), perm.end(), std::mt19937(7));
    for (int k = 0; k < m; ++k) {
      std::string net = std::format("S{}", k);
      int ka = k, kb = perm[size_t(k)];
      g.resistor(std::format("RA{}", k), 18 + 11.0 * (ka % cols), 4 + 3.0 * double(ka / cols), false, std::format("SA{}", k), net);
      g.resistor(std::format("RB{}", k), 18 + 11.0 * (kb % cols), busY + len + 8 + 3.0 * double(kb / cols), false, net,
                 std::format("SB{}", k));
    }
    return g.done();
  }
  if (kind == "smd_bus") {
    Gen g(std::string(kind), 70, len + 30);
    int u = g.component("U1", 15, 15);
    for (int k = 0; k < n; ++k) g.pad(u, std::to_string(k + 1), 15, 15 + k * 0.65, nets[size_t(k)], true, 1.5, 0.35);
    g.connector("J1", 55, 15, true, nets);
    return g.done();
  }
  return std::nullopt;
}

}  // namespace xr
