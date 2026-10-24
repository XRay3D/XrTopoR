#pragma once
// Design rules as TopoR keeps them («Редактор параметров дизайна»): net groups, via types and ordered
// rule lists in which later rules take priority. The net classes and layer rules the router, DRC and
// pour work with are compiled from them.
#include <string>
#include <vector>

#include "geom/Geometry.h"

namespace xr {

struct Board;

// Nets a rule affects: all, one net or a net group.
struct RuleNets {
  enum class Kind { All, Net, Group } kind = Kind::All;
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

struct ViaType {
  std::string name;
  Coord diameter = 0, drill = 0;
};

struct ViaRule {
  bool enabled = true;
  RuleNets nets;
  std::string viaType;  // empty: all types
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
};

// Net classes, layer rules, plane nets and the edge clearance of the board from its rules.
void compileRules(Board& b);
// Rules equivalent to a design's net classes and layer rules (designs from other CADs).
DesignRules rulesFromBoard(const Board& b);

}  // namespace xr
