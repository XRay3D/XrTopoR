#pragma once
// Design rules as TopoR keeps them («Редактор параметров дизайна»): net groups, via types and ordered
// rule lists in which later rules take priority. The net classes and layer rules the router, DRC and
// pour work with are compiled from them.
#include <string>
#include <vector>

#include "geom/Geometry.h"

namespace xr {

struct Board;

// Nets a rule affects: all, one net, a net group, or a signal, a differential signal or a signal group
// (their nets, HiSpeed).
struct RuleNets {
  enum class Kind { All, Net, Group, Signal, DiffSignal, SignalGroup } kind = Kind::All;
  std::string name;
  bool operator==(const RuleNets&) const = default;
};

struct WidthRule {
  bool enabled = true;
  std::vector<std::string> layers;  // empty: all layers
  RuleNets nets;
  Coord min = 0, nom = 0;
};

struct ClearanceRule {
  bool enabled = true;
  std::vector<std::string> layers;
  RuleNets a, b;
  Coord min = 0, nom = 0;
};

// The pad of a via type on a class of layers («Signal», «Plane», «Mask»...) or on one layer by name.
struct ViaPadSize {
  std::string layerClass, layer;
  Coord diameter = 0;
  bool operator==(const ViaPadSize&) const = default;
};

struct ViaType {
  std::string name;
  Coord diameter = 0, drill = 0;  // diameter: of the pad on the copper layers (the largest)
  std::string from, to;           // «Начальный / Конечный слой» (LayerRange); empty: all layers
  bool viaOnPin = false;          // «ПО на контакте»
  std::vector<ViaPadSize> pads;   // the pads by class or layer (TopoR's ViaPads); empty: `diameter` on copper
};

struct ViaRule {
  bool enabled = true;
  RuleNets nets;
  std::vector<std::string> viaTypes;  // the types the nets may use (TopoR: a through and a blind one, say); empty: all
};

struct PlaneRule {
  bool enabled = true;
  std::string layer, net;
};

// «Назначение цепей на слои»: nets meant to be routed on a layer (a net may have several); routing
// elsewhere is TopoR's warning 5047, the autorouter avoids it.
struct LayerNetsRule {
  bool enabled = true;
  std::string layer;
  std::vector<RuleNets> nets;
};

struct NetGroup {
  std::string name;
  std::vector<std::string> nets;
};

struct DesignRules {
  std::vector<NetGroup> netGroups;
  std::vector<ViaType> viaTypes;
  std::vector<WidthRule> widths;
  std::vector<ClearanceRule> clearances;
  std::vector<ViaRule> vias;
  std::vector<PlaneRule> planes;
  std::vector<LayerNetsRule> layerNets;
  Coord edgeWires = 0, edgeComps = 0;  // «Зазор до края платы»
  // «Зазор между компонентами» (TopoR's file has one rule, all components against all): for placement.
  bool compClearanceEnabled = true;
  Coord compClearance = 0;
  // PadConnectSettings: AutoConnect (TopoR's default: a wire to a pad's anchor, its corners only when rounded
  // enough) or AllPads.
  bool padConnectAll = false;
};

// The diameter of a via type's pad on a layer of a class (`layerClass`) and name (`layer`): the layer's own
// size, else its class's; 0: none there. The copper classes fall back on `diameter`.
Coord viaPadDiameter(const ViaType& t, const std::string& layerClass, const std::string& layer);

// Net classes, layer rules, plane nets and the edge clearance of the board from its rules.
void compileRules(Board& b);
// Rules equivalent to a design's net classes and layer rules (designs from other CADs).
DesignRules rulesFromBoard(const Board& b);

}  // namespace xr
