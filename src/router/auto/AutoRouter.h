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

struct Result {
  int connections = 0, routed = 0, failed = 0;
  int crossings = 0;        // of wires of different nets on the plane
  int conflicts = 0;        // crossings the layering could not put on different layers
  int vias = 0;
  double planeLength = 0;   // the wires' taut length on the plane, nm
  double length = 0;        // of the tracks at the end, nm
  double seconds = 0;
  bool cancelled = false;
  std::vector<std::string> log;
};

Result route(Board& b, const Options& o = {});

}  // namespace xr::autoroute
