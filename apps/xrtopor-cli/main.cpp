// xrtopor-cli: headless access to XrTopoR (conversion, DRC, autorouting, Gerber output).
#include <cstdio>
#include <cstring>
#include <map>
#include <string>
#include <vector>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "io/BoardIO.h"
#include "io/gerber/GerberWriter.h"
#include "router/topo/TopoRouter.h"

using namespace xr;

static void usage() {
  std::puts(
      "usage: xrtopor-cli <command> [args]\n"
      "  info    <board>                         summary of a board\n"
      "  convert <board> <out.kicad_pcb|.dsn|.ses>\n"
      "  drc     <board> [--max N]                design rule check\n"
      "  route   <board> -o <out> [--passes N] [--via-cost MM] [--no-vias] [--nets a,b] [--keep]\n"
      "  import-ses <board> <routes.ses> -o <out>\n"
      "  gerber  <board> <outdir>\n"
      "boards: .kicad_pcb, .dsn, P-CAD ASCII .pcb");
}

static std::unique_ptr<Board> load(const std::string& path) {
  std::string err;
  auto b = io::loadBoard(path, &err);
  if (!b) std::fprintf(stderr, "error: %s\n", err.c_str());
  return b;
}

static int cmdInfo(const Board& b) {
  int smd = 0, tht = 0, connected = 0;
  for (auto& p : b.pads) {
    (p.drill > 0 ? tht : smd)++;
    if (p.net >= 0) ++connected;
  }
  BBox bb = b.bbox();
  std::printf("board      %s\n", b.name.c_str());
  std::printf("size       %.2f x %.2f mm\n", bb.width() / kNmPerMm, bb.height() / kNmPerMm);
  std::printf("copper     %d layers:", b.copperCount());
  for (LayerId l : b.copperLayers()) std::printf(" %s", b.layers[l].name.c_str());
  std::printf("\ncomponents %zu\npads       %zu (smd %d, tht %d, on nets %d)\n", b.components.size(), b.pads.size(),
              smd, tht, connected);
  std::printf("nets       %zu\ntracks     %zu\nvias       %zu\nzones      %zu\noutline    %zu contour(s)\n",
              b.nets.size(), b.tracks.size(), b.vias.size(), b.zones.size(), b.outline.size());
  for (auto& nc : b.netClasses)
    std::printf("class      %-12s width %.3f clearance %.3f via %.3f/%.3f mm\n", nc.name.c_str(),
                nc.trackWidth / 1e6, nc.clearance / 1e6, nc.viaDiameter / 1e6, nc.viaDrill / 1e6);
  auto conn = Connectivity::compute(b);
  std::printf("unrouted   %zu connection(s) in %d net(s)\n", conn.ratsnest.size(), conn.unroutedNets);
  return 0;
}

static int cmdDrc(const Board& b, size_t maxShow) {
  auto v = runDrc(b);
  std::map<DrcViolation::Type, int> counts;
  for (auto& x : v) counts[x.type]++;
  size_t shown = 0;
  for (auto& x : v) {
    if (shown++ >= maxShow) break;
    std::printf("[%s] (%.3f, %.3f) %s\n", drcTypeName(x.type), x.pos.x / 1e6, x.pos.y / 1e6, x.message.c_str());
  }
  std::printf("DRC: %zu violation(s):", v.size());
  for (auto& [t, n] : counts) std::printf(" %s=%d", drcTypeName(t), n);
  std::printf("\n");
  return v.empty() ? 0 : 2;
}

int main(int argc, char** argv) {
  if (argc < 3) { usage(); return 1; }
  std::string cmd = argv[1];
  std::vector<std::string> args(argv + 2, argv + argc);
  auto opt = [&](const char* name) -> std::string {
    for (size_t i = 0; i + 1 < args.size(); ++i)
      if (args[i] == name) return args[i + 1];
    return {};
  };
  auto flag = [&](const char* name) {
    for (auto& a : args)
      if (a == name) return true;
    return false;
  };

  auto b = load(args[0]);
  if (!b) return 1;

  if (cmd == "info") return cmdInfo(*b);
  if (cmd == "drc") {
    std::string m = opt("--max");
    return cmdDrc(*b, m.empty() ? 50 : std::stoul(m));
  }
  if (cmd == "convert") {
    if (args.size() < 2) { usage(); return 1; }
    std::string err;
    if (!io::saveBoard(*b, args[1], &err)) { std::fprintf(stderr, "error: %s\n", err.c_str()); return 1; }
    std::printf("written %s\n", args[1].c_str());
    return 0;
  }
  if (cmd == "gerber") {
    if (args.size() < 2) { usage(); return 1; }
    std::string err;
    if (!io::writeGerbers(*b, args[1], {}, &err)) { std::fprintf(stderr, "error: %s\n", err.c_str()); return 1; }
    std::printf("gerbers written to %s\n", args[1].c_str());
    return 0;
  }
  if (cmd == "import-ses") {
    std::string out = opt("-o");
    if (args.size() < 2 || out.empty()) { usage(); return 1; }
    std::string err;
    if (!io::applySes(*b, io::readFile(args[1]), &err)) { std::fprintf(stderr, "error: %s\n", err.c_str()); return 1; }
    if (!io::saveBoard(*b, out, &err)) { std::fprintf(stderr, "error: %s\n", err.c_str()); return 1; }
    std::printf("written %s (%zu tracks, %zu vias)\n", out.c_str(), b->tracks.size(), b->vias.size());
    return 0;
  }
  if (cmd == "route") {
    std::string out = opt("-o");
    topo::RouterOptions ro;
    if (auto p = opt("--passes"); !p.empty()) ro.maxPasses = std::stoi(p);
    if (auto p = opt("--via-cost"); !p.empty()) ro.viaCost = std::stod(p);
    ro.useVias = !flag("--no-vias");
    ro.ripupExisting = !flag("--keep");
    if (auto p = opt("--nets"); !p.empty()) {
      size_t s = 0;
      while (s <= p.size()) {
        size_t e = p.find(',', s);
        if (e == std::string::npos) e = p.size();
        ro.nets.push_back(p.substr(s, e - s));
        s = e + 1;
      }
    }
    int lastPct = -1;
    ro.progress = [&](int done, int total, const std::string& stage) {
      int pct = total ? done * 100 / total : 0;
      if (pct / 10 != lastPct / 10) {
        std::fprintf(stderr, "  %s %d%%\n", stage.c_str(), pct);
        lastPct = pct;
      }
    };
    auto res = topo::routeBoard(*b, ro);
    for (auto& l : res.log) std::printf("%s\n", l.c_str());
    std::printf("routed %d/%d connections, %d vias, length %.1f mm, %.2f s\n", res.routed, res.connections, res.vias,
                res.length / 1e6, res.seconds);
    if (!out.empty()) {
      std::string err;
      if (!io::saveBoard(*b, out, &err)) { std::fprintf(stderr, "error: %s\n", err.c_str()); return 1; }
      std::printf("written %s\n", out.c_str());
    }
    return res.failed == 0 ? 0 : 3;
  }
  usage();
  return 1;
}
