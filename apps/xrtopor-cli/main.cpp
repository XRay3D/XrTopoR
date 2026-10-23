// xrtopor-cli: headless access to XrTopoR (conversion, DRC, autorouting, Gerber/SVG output).
#include <flat_map>
#include <print>
#include <ranges>
#include <span>
#include <string>
#include <string_view>
#include <vector>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "io/gerber/GerberWriter.h"
#include "io/svg/SvgWriter.h"
#include "router/topo/Realizer.h"
#include "router/topo/TopoRouter.h"

using namespace xr;

namespace {

void usage() {
  std::println(
      "usage: xrtopor-cli <command> <board> [args]\n"
      "  info       <board>                        summary of a board\n"
      "  convert    <board> <out.kicad_pcb|.dsn|.ses>\n"
      "  drc        <board> [--max N]               design rule check\n"
      "  route      <board> [-o out] [--passes N] [--via-cost MM] [--no-vias] [--nets a,b] [--keep] [--soft] [--svg out.svg]\n"
      "  import-ses <board> <routes.ses> -o <out>\n"
      "  gerber     <board> <outdir>\n"
      "  svg        <board> <out.svg>\n"
      "  reshape    <board> -o <out>              recompute track shapes (TopoR F5) for all tracks\n"
      "boards: .kicad_pcb, .dsn, P-CAD ASCII .pcb");
}

struct Args {
  std::vector<std::string_view> v;
  std::string_view opt(std::string_view name) const {
    for (auto [a, b] : v | std::views::adjacent<2>)
      if (a == name) return b;
    return {};
  }
  bool flag(std::string_view name) const { return std::ranges::contains(v, name); }
};

int fail(const std::string& msg) {
  std::println(stderr, "error: {}", msg);
  return 1;
}

int cmdInfo(const Board& b) {
  int smd = 0, tht = 0, connected = 0;
  for (auto& p : b.pads) {
    (p.drill > 0 ? tht : smd)++;
    if (p.net >= 0) ++connected;
  }
  BBox bb = b.bbox();
  std::println("board      {}", b.name);
  std::println("size       {:.2f} x {:.2f} mm", bb.width() / kNmPerMm, bb.height() / kNmPerMm);
  std::print("copper     {} layers:", b.copperCount());
  for (LayerId l : b.copperLayers()) std::print(" {}", b.layers[l].name);
  std::println("\ncomponents {}\npads       {} (smd {}, tht {}, on nets {})", b.components.size(), b.pads.size(), smd,
               tht, connected);
  std::println("nets       {}\ntracks     {}\nvias       {}\nzones      {}\noutline    {} contour(s)", b.nets.size(),
               b.tracks.size(), b.vias.size(), b.zones.size(), b.outline.size());
  for (auto& nc : b.netClasses)
    std::println("class      {:<12} width {:.3f} clearance {:.3f} via {:.3f}/{:.3f} mm", nc.name, nc.trackWidth / 1e6,
                 nc.clearance / 1e6, nc.viaDiameter / 1e6, nc.viaDrill / 1e6);
  auto conn = Connectivity::compute(b);
  std::println("unrouted   {} connection(s) in {} net(s)", conn.ratsnest.size(), conn.unroutedNets);
  return 0;
}

int cmdDrc(const Board& b, size_t maxShow) {
  auto v = runDrc(b);
  std::flat_map<DrcViolation::Type, int> counts;
  for (auto& x : v) counts[x.type]++;
  for (auto& x : v | std::views::take(maxShow))
    std::println("[{}] ({:.3f}, {:.3f}) {}", drcTypeName(x.type), x.pos.x / 1e6, x.pos.y / 1e6, x.message);
  std::print("DRC: {} violation(s):", v.size());
  for (auto&& [t, n] : counts) std::print(" {}={}", drcTypeName(t), n);
  std::println("");
  return v.empty() ? 0 : 2;
}

int cmdRoute(Board& b, const Args& a) {
  topo::RouterOptions ro;
  if (auto p = a.opt("--passes"); !p.empty()) ro.maxPasses = std::stoi(std::string(p));
  if (auto p = a.opt("--via-cost"); !p.empty()) ro.viaCost = std::stod(std::string(p));
  ro.useVias = !a.flag("--no-vias");
  ro.ripupExisting = !a.flag("--keep");
  ro.softPlanarity = a.flag("--soft");
  if (auto p = a.opt("--nets"); !p.empty())
    ro.nets = p | std::views::split(',') | std::ranges::to<std::vector<std::string>>();
  int lastDecile = -1;
  ro.progress = [&](int done, int total, const std::string& stage) {
    int decile = total ? done * 10 / total : 0;
    if (decile != lastDecile) std::println(stderr, "  {} {}%", stage, decile * 10);
    lastDecile = decile;
  };
  auto res = topo::routeBoard(b, ro);
  for (auto& l : res.log) std::println("{}", l);
  std::println("routed {}/{} connections, {} vias, length {:.1f} mm, {:.2f} s", res.routed, res.connections, res.vias,
               res.length / 1e6, res.seconds);
  if (auto out = a.opt("-o"); !out.empty()) {
    if (auto r = io::saveBoard(b, std::string(out)); !r) return fail(r.error());
    std::println("written {}", out);
  }
  if (auto svg = a.opt("--svg"); !svg.empty()) {
    if (auto r = io::writeFile(std::string(svg), io::writeSvg(b)); !r) return fail(r.error());
    std::println("written {}", svg);
  }
  return res.failed == 0 ? 0 : 3;
}

}  // namespace

int main(int argc, char** argv) {
  if (argc < 3) {
    usage();
    return 1;
  }
  std::string_view cmd = argv[1];
  Args a{std::vector<std::string_view>(argv + 2, argv + argc)};
  auto loaded = io::loadBoard(std::string(a.v[0]));
  if (!loaded) return fail(loaded.error());
  Board& b = **loaded;
  auto second = [&]() -> std::string { return a.v.size() > 1 ? std::string(a.v[1]) : std::string(); };

  if (cmd == "info") return cmdInfo(b);
  if (cmd == "drc") {
    auto m = a.opt("--max");
    return cmdDrc(b, m.empty() ? 50 : std::stoul(std::string(m)));
  }
  if (cmd == "route") return cmdRoute(b, a);
  if (cmd == "reshape" && !a.opt("-o").empty()) {
    std::vector<char> all(b.tracks.size(), 1);
    auto st = topo::reshapeTracks(b, all);
    std::println("reshaped {} wires, {} arcs, {} apexes dropped", st.wires, st.arcs, st.droppedApexes);
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "convert" && !second().empty()) {
    if (auto r = io::saveBoard(b, second()); !r) return fail(r.error());
    std::println("written {}", second());
    return 0;
  }
  if (cmd == "gerber" && !second().empty()) {
    if (auto r = io::writeGerbers(b, second()); !r) return fail(r.error());
    std::println("gerbers written to {}", second());
    return 0;
  }
  if (cmd == "svg" && !second().empty()) {
    if (auto r = io::writeFile(second(), io::writeSvg(b)); !r) return fail(r.error());
    std::println("written {}", second());
    return 0;
  }
  if (cmd == "import-ses" && !second().empty() && !a.opt("-o").empty()) {
    auto text = io::readFile(second());
    if (!text) return fail(text.error());
    if (auto r = io::applySes(b, *text); !r) return fail(r.error());
    std::string out(a.opt("-o"));
    if (auto r = io::saveBoard(b, out); !r) return fail(r.error());
    std::println("written {} ({} tracks, {} vias)", out, b.tracks.size(), b.vias.size());
    return 0;
  }
  usage();
  return 1;
}
