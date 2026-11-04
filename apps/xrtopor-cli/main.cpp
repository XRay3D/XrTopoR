// xrtopor-cli: headless access to XrTopoR (conversion, DRC, autorouting, Gerber/SVG output).
#include <flat_map>
#include <print>
#include <ranges>
#include <span>
#include <string>
#include <string_view>
#include <vector>

#include "core/Connectivity.h"
#include "core/ZoneFill.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "io/Report.h"
#include "io/gerber/GerberWriter.h"
#include "io/svg/SvgWriter.h"
#include "core/Prof.h"
#include "router/topo/ModelTools.h"
#include "router/topo/Optimizer.h"
#include "router/topo/Refine.h"
#include "router/topo/Wires.h"
#include "router/topo/TopoRouter.h"

using namespace xr;

namespace {

void usage() {
  std::println(
      "usage: xrtopor-cli <command> <board> [args]\n"
      "  info       <board>                        summary of a board\n"
      "  convert    <board> <out.kicad_pcb|.dsn|.ses>\n"
      "  drc        <board> [--max N]               design rule check\n"
      "  route      <board> [-o out] [--passes N] [--via-cost MM] [--no-vias] [--layers 0,1] [--nets a,b] [--keep] [--soft] [--no-optimize] [--no-refine] [--no-fill] [--svg out.svg]\n"
      "  import-ses <board> <routes.ses> -o <out>\n"
      "  gerber     <board> <outdir>\n"
      "  svg        <board> <out.svg>\n"
      "  reshape    <board> -o <out> [--nets a,b] [--around MM] [--no-settle]  recompute track shapes (TopoR F5); --nets: those chains only\n"
      "                     [--model [--no-flips]]  F5 on the topological model\n"
      "  optimize   <board> -o <out> [--iterations N] [--step MM] [--components] [--relax]   move vias/parts (F7)\n"
      "                     [--model [--no-flips] [--verbose]]  F7 on the topological model\n"
      "  refine     <board> -o <out> [--same-layer]   shorter wire paths around the copper as it lies (F6)\n"
      "  fill       <board> -o <out> [--no-thermals]  pour copper zones\n"
      "  report     <board> [--bom out.csv]          routing statistics per layer and net, BOM\n"
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
  // How deep they are: most of a dense board's count may be rounding noise.
  double shortfall = 0;
  int deep = 0;
  for (auto& x : v)
    if (x.type != DrcViolation::Type::Unconnected && x.required > x.actual) {
      shortfall += x.required - x.actual;
      deep += x.required - x.actual > 0.05 * kNmPerMm;
    }
  std::println("shortfall {:.3f} mm, {} deeper than 0.05 mm", shortfall / kNmPerMm, deep);
  return v.empty() ? 0 : 2;
}

int cmdRoute(Board& b, const Args& a) {
  topo::RouterOptions ro;
  if (auto p = a.opt("--passes"); !p.empty()) ro.maxPasses = std::stoi(std::string(p));
  if (auto p = a.opt("--via-cost"); !p.empty()) ro.viaCost = std::stod(std::string(p));
  ro.useVias = !a.flag("--no-vias");
  if (auto p = a.opt("--layers"); !p.empty())  // copper indices, 0 = top
    for (auto part : std::views::split(p, ',')) ro.copperIndices.push_back(std::stoi(std::string(part.begin(), part.end())));
  ro.ripupExisting = !a.flag("--keep");
  ro.softPlanarity = a.flag("--soft");
  if (a.flag("--no-optimize")) ro.optimizeIterations = 0;
  ro.refine = !a.flag("--no-refine");
  ro.fillZones = !a.flag("--no-fill");
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
  if (cmd == "report") {
    std::print("{}", io::routingReport(b));
    if (auto p = a.opt("--bom"); !p.empty()) {
      if (auto r = io::writeFile(std::string(p), io::bomCsv(b)); !r) return fail(r.error());
      std::println("BOM written to {}", p);
    }
    return 0;
  }
  if (cmd == "fill" && !a.opt("-o").empty()) {
    ZoneFillOptions zo;
    zo.thermals = !a.flag("--no-thermals");
    auto st = fillZones(b, zo);
    std::println("filled {} zone(s): {} polygon(s), {} island(s) removed", st.zones, st.polygons, st.islandsRemoved);
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "optimize" && !a.opt("-o").empty() && a.flag("--model")) {
    // F7 on the topological model: the vias and branch points relax under the model's forces, the
    // realiser draws once at the end.
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    topo::OptimizeModelOptions mo;
    mo.flips = !a.flag("--no-flips");
    auto res = topo::optimizeModel(b, t, mo);
    if (a.flag("--verbose"))
      for (auto& l : res.log) std::println("{}", l);
    for (const topo::Violation& v : res.violations) {
      using K = topo::Violation::Kind;
      const char* what = v.kind == K::Crossing ? "wires crossing" : v.kind == K::ThroughPad ? "wire through another net's copper"
                         : v.kind == K::OutsideBoard ? "wire the mesh does not hold" : "edge overflowing";
      std::println("  {} at ({:.3f}, {:.3f}) on layer {}: {}{}{}", what, v.pos.x / 1e6, v.pos.y / 1e6, b.layers[v.layer].name,
                   v.wireA >= 0 ? b.nets[t.wires[v.wireA].net].name : "", v.wireB >= 0 ? " / " + b.nets[t.wires[v.wireB].net].name : "",
                   v.deficit > 0 ? std::format(" by {:.3f} mm", v.deficit / 1e6) : "");
    }
    if (!res.drawn) return fail("stopped by the violations above, nothing drawn");
    std::println("model: {} iterations ({} undone), {} via move(s), {} junction move(s); model length {:.1f} -> {:.1f} mm, shortfall {:.3f} -> {:.3f} mm; "
                 "{} checkpoints ({} rolled back), conflicts {} -> {}",
                 res.iterations, res.undoneIterations, res.viaMoves, res.junctionMoves, res.lengthBefore / 1e6, res.lengthAfter / 1e6,
                 res.deficitBefore / 1e6, res.deficitAfter / 1e6, res.checkpoints, res.rollbacks, res.conflictsBefore, res.conflictsAfter);
    xr::Prof::get().report("optimize --model");
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "optimize" && !a.opt("-o").empty()) {
    topo::OptimizeOptions oo;
    if (auto p = a.opt("--iterations"); !p.empty()) oo.iterations = std::stoi(std::string(p));
    if (auto p = a.opt("--step"); !p.empty()) oo.step = std::stod(std::string(p)) * kNmPerMm;
    oo.components = a.flag("--components");
    oo.relax = a.flag("--relax");
    auto res = topo::optimize(b, oo);
    for (auto& l : res.log) std::println("{}", l);
    if (res.relaxIterations) std::println("relaxed in {} iteration(s)", res.relaxIterations);
    std::println("moved {} via(s), {} junction(s), {} component(s); conflicts {} -> {}; length {:.1f} -> {:.1f} mm; {:.2f} s",
                 res.viaMoves, res.junctionMoves, res.componentMoves, res.conflictsBefore, res.conflictsAfter,
                 res.lengthBefore / 1e6, res.lengthAfter / 1e6, res.seconds);
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "refine" && !a.opt("-o").empty()) {
    topo::RefineOptions ro;
    ro.changeLayers = !a.flag("--same-layer");
    auto res = topo::refine(b, ro);
    std::println("refined {} of {} wires ({} repaired, {} to another layer), {} via(s) removed; length {:.1f} -> {:.1f} mm; {:.2f} s",
                 res.improved, res.wires, res.repaired, res.layerChanges, res.viasRemoved, res.lengthBefore / 1e6,
                 res.lengthAfter / 1e6, res.seconds);
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "reshape" && !a.opt("-o").empty() && a.flag("--model")) {
    // F5 on the topological model: the tracks become wires on the meshes, the meshes relax, the realiser
    // draws the wires from their slots.
    topo::Topology::assignIds(b);
    topo::Topology t;
    t.build(b);
    topo::F5ModelOptions fo;
    fo.flips = !a.flag("--no-flips");
    fo.direct = !a.flag("--sketch");
    fo.weighted = a.flag("--weighted");
    auto res = topo::runF5Model(b, t, fo);
    for (const topo::Violation& v : res.violations) {
      using K = topo::Violation::Kind;
      const char* what = v.kind == K::Crossing ? "wires crossing" : v.kind == K::ThroughPad ? "wire through another net's copper"
                         : v.kind == K::OutsideBoard ? "wire the mesh does not hold" : "edge overflowing";
      std::println("  {} at ({:.3f}, {:.3f}) on layer {}: {}{}{}", what, v.pos.x / 1e6, v.pos.y / 1e6, b.layers[v.layer].name,
                   v.wireA >= 0 ? b.nets[t.wires[v.wireA].net].name : "", v.wireB >= 0 ? " / " + b.nets[t.wires[v.wireB].net].name : "",
                   v.deficit > 0 ? std::format(" by {:.3f} mm", v.deficit / 1e6) : "");
    }
    if (!res.drawn) return fail("stopped by the violations above, nothing drawn");
    std::println("model: {} wires, {} flips; realised {} wires, {} arcs, {} apexes dropped, {} overflowed edges, {} sketch crossings",
                 t.wires.size(), res.flips, res.stats.wires, res.stats.arcs, res.stats.droppedApexes, res.stats.overflowEdges,
                 res.stats.sketchCrossings);
    if (!a.flag("--no-settle")) std::println("junctions settled: {}", topo::settleJunctions(b, {}));
    xr::Prof::get().report("reshape --model");
    if (auto r = io::saveBoard(b, std::string(a.opt("-o"))); !r) return fail(r.error());
    return 0;
  }
  if (cmd == "reshape" && !a.opt("-o").empty()) {
    // --nets a,b: only the tracks of those nets, the rest of the copper as it lies (the editor's F5
    // on the edited chains).
    std::vector<char> all(b.tracks.size(), 1);
    bool local = false;
    if (auto p = a.opt("--nets"); !p.empty()) {
      auto names = p | std::views::split(',') | std::ranges::to<std::vector<std::string>>();
      for (size_t i = 0; i < b.tracks.size(); ++i)
        all[i] = b.tracks[i].net != kNoNet && std::ranges::contains(names, b.nets[b.tracks[i].net].name);
      local = true;
    }
    double around = a.opt("--around").empty() ? 0.0 : std::stod(std::string(a.opt("--around"))) * kNmPerMm;
    auto st = topo::reshapeTracks(b, all, {.local = local, .around = around});
    std::println("reshaped {} wires, {} arcs, {} apexes dropped, {} arc bends, {} sketch crossings", st.wires, st.arcs,
                 st.droppedApexes, st.arcBends, st.sketchCrossings);
    for (auto [n1, n2] : st.crossingNets)
      std::println("  topological crossing of {} and {} (laid as drawn)", b.nets[n1].name, b.nets[n2].name);
    if (!a.flag("--no-settle")) {
      std::vector<int> nets;
      if (local)
        for (size_t i = 0; i < b.nets.size(); ++i)
          if (std::ranges::contains(a.opt("--nets") | std::views::split(',') | std::ranges::to<std::vector<std::string>>(), b.nets[i].name)) nets.push_back(int(i));
      std::println("junctions settled: {}", topo::settleJunctions(b, nets));
    }
    xr::Prof::get().report("reshape");
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
