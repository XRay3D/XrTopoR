#pragma once
// The local minimisation of the number of vias on the model (Luzin, Popov, Popov, «Локальная минимизация числа
// межслойных переходов в топологии печатного монтажа», NTV ITMO 2013 no. 6; what TopoR's F6 does when it takes
// a via away: on Arcs_master the via of SD3 next to a through pin goes, and the wire of the pin's other layer
// runs from the pin). A via v and the wire that joins it to its neighbour u — another via or a through pad —
// shorter than `span`: the wire is «copied» onto the layers of v's other wires, so that they reach u, and v
// goes. TopoR has one superposed topology; we have a mesh per layer, so the copy is a new wire of the model
// laid on that layer's mesh between the two owners (findRelay), and the wires that cross it there are «led
// behind u» as a clinch is undone: taken out and laid anew after it (relayPast). The paper's test (a crossing
// wire on a layer both vias have wires on: impossible) needs no code: such a wire has no way round, and the
// search finds none. When u is a via left with wires of one layer, it goes too.
//
// The model has no way to take out an owner wires end at, so the via goes on the drawing: the model with the
// copies is drawn, the via and the wire that joined the two are taken off the board, and the model is built
// from the tracks anew, drawn and judged (a via is worth kViaCost of length to the judge).
#include <memory>
#include <string>
#include <vector>

#include "core/Board.h"
#include "router/topo/ModelRelax.h"
#include "topo/Topology.h"

namespace xr::topo {

struct ViaOptions {
  double span = 10.0 * kNmPerMm;  // the wire between the via and its neighbour is shorter than this (the paper's 10 mm)
  double worth = kViaCost;        // a copy may be this much longer than the wire it stands for, and the wires led behind in sum
  bool flips = true;
  // The drawing of the model as it stands (ModelTools.h), when there is one: the copies' drawing is brought up from it.
  std::shared_ptr<const ModelDrawing> drawing;
};

struct ViaResult {
  int candidates = 0;  // vias with a neighbour near enough (the first pass)
  int removed = 0;
  int drawings = 0;
  std::vector<std::string> log;
  std::shared_ptr<const ModelDrawing> drawing;  // of the model as it is left
};

// `b` is the model's drawing (the wires of `t` own its tracks); both are replaced when vias went. The vias of
// the flexibly fixed nets, locked ones, and those a pad, a copper area or a plane of the net holds stay.
ViaResult removeVias(Board& b, Topology& t, const ViaOptions& o = {});

}  // namespace xr::topo
