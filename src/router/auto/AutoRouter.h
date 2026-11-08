#pragma once
// The autorouter after TopoR's scheme (Polubasov, «Трассировка в САПР TopoR — взгляд изнутри», Электроника НТБ
// 6/2010; docs/autoroute.md):
//   1. the combined topology: every connection laid on ONE plane (topo::Topology::buildPlane), the wide ones first
//      and the short among them, by the cheapest path over the triangulation (topo::findRelay on the plane: wires of
//      other nets may be crossed at a price, an edge holds as many rows as there are layers);
//   2. layering (Layering.h): the layer of every wire at each of its crossings, crossing wires on different layers,
//      the fewest vias (a via: the piece of a wire between two neighbouring crossings where its layer changes);
//   3. the wires as tracks along their sketches, a via where the layer changes; the model built from them and the
//      metric stage — F5, F6 and F7 on the model — gives the shapes, the vias' places and the nominal clearances.
#include <atomic>
#include <functional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::autoroute {

struct Options {
  std::vector<std::string> nets;  // empty: every net to be routed («Трассировать» on, not flexibly fixed)
  double crossing = 3.0;          // what crossing a wire of another net costs on the plane, mm (it may cost a via)
  int passes = 3;                 // re-laying passes on the plane (every wire taken out and laid again)
  int layeredPasses = 4;          // re-laying passes with the layers known (crossings on other layers only, vias at a price)
  double via = 3.0;               // the price of a via in those passes, mm (one variant: these two prices)
  // The vias made vertices of the plane before the variant is measured and drawn (an experiment, off: MinVia 743 places
  // against 23 with the vias as discs round the crossings; the conversion finds same-layer crossings after the pushes).
  bool viaVertices = false;
  int relayerings = 4;            // rounds of re-layering the whole board and laying again, while the vias fall
  int variants = 1;               // > 1: as many variants over a grid of prices (crossing 1/3/8/20, via 3/8/20/50 mm) and seeds, in parallel
  double viaWeight = 10.0;        // a via against length when the best variant is chosen, mm (TopoR's rule of thumb: 25)
  bool metric = true;             // F5, F6 and F7 on the model after the tracks are laid
  std::function<void(int done, int total, const std::string& stage)> progress;
  const std::atomic<bool>* cancel = nullptr;
  // The state for the display, now and then: the wires' sketches (one colour on the plane; a layer each once
  // layered), as polylines in board coordinates.
  struct Sketch {
    std::vector<std::vector<Vec2>> lines;
    std::vector<LayerId> layer;  // per line; -1: not layered yet
    std::vector<Vec2> vias;
  };
  std::function<void(const Sketch&)> sketch;
};

struct VariantInfo {
  double crossing = 0, via = 0;  // the prices, mm
  unsigned seed = 0;
  double length = 0;             // taut, on the plane, nm
  int vias = 0, over = 0, failed = 0;
  bool pareto = false;           // on the front of (failures, overflow, length, vias)
};

struct Result {
  int connections = 0, routed = 0, failed = 0;
  int crossings = 0;        // of wires of different nets on the plane
  int conflicts = 0;        // crossings the layering could not put on different layers
  int vias = 0;
  double planeLength = 0;   // the wires' taut length on the plane, nm
  double length = 0;        // of the tracks at the end, nm
  double seconds = 0;
  bool cancelled = false;
  std::vector<VariantInfo> variants;
  int chosen = -1;
  std::vector<std::string> log;
};

Result route(Board& b, const Options& o = {});

}  // namespace xr::autoroute
