#pragma once
// Board data model. Internal frame follows KiCad: Y axis points down, units are nanometres,
// angles are degrees counter-clockwise as seen on screen.
#include <array>
#include <cstdint>
#include <inplace_vector>
#include <map>
#include <memory>
#include <optional>
#include <string>
#include <vector>

#include "core/Display.h"
#include "core/Rules.h"
#include "geom/Shape.h"

namespace xr {

namespace sexpr { struct Node; }

using LayerId = int;
using LayerMask = std::uint64_t;
// Copper layer lists are bounded by the 64-bit layer mask: no heap allocation needed.
using LayerList = std::inplace_vector<LayerId, 64>;
constexpr int kNoNet = -1;

enum class LayerKind { Copper, Silk, Mask, Paste, Fab, Courtyard, Edge, Other };
enum class Side { Top, Bottom, None };

struct Layer {
  std::string name;
  LayerKind kind = LayerKind::Other;
  Side side = Side::None;
  int copperIndex = -1;  // 0 = top copper ... n-1 = bottom copper
  bool plane = false;    // plane (reference) layer: solid copper of planeNet, not routed on
  int planeNet = kNoNet;
};

struct NetClass {
  std::string name = "Default";
  Coord trackWidth = mmToNm(0.25);
  Coord clearance = mmToNm(0.2);
  Coord viaDiameter = mmToNm(0.6);
  Coord viaDrill = mmToNm(0.3);
};

struct Net {
  std::string name;
  int netClass = 0;
};

// Layer-specific override of width/clearance for some nets (empty = all), applied in order.
struct LayerRule {
  std::vector<int> nets;
  LayerMask layers = 0;  // 0 = all copper layers
  Coord width = 0;       // 0 = keep
  Coord clearance = 0;   // 0 = keep
};

enum class PadShapeKind { Circle, Rect, Oval, RoundRect, Polygon };

struct PadShape {
  PadShapeKind kind = PadShapeKind::Circle;
  Coord w = 0, h = 0;      // full size
  double rratio = 0;       // RoundRect corner radius = rratio * min(w, h)
  std::vector<Vec2> poly;  // Polygon: local outline (pad frame, unrotated)
};

struct Pad {
  std::string number;
  int component = -1;
  int net = kNoNet;
  Point pos;              // absolute position
  double angle = 0;       // absolute orientation (deg)
  Point localPos;         // relative to component origin, before component rotation
  double localAngle = 0;  // relative to component
  PadShape shape;
  Coord drill = 0;        // 0 = SMD
  Coord drillH = 0;       // slot height (0 = round)
  bool plated = true;
  LayerMask copper = 0;   // mask over board copper layer ids

  bool isThrough() const { return drill > 0; }
  bool onLayer(LayerId l) const { return (copper >> l) & 1; }
  Shape shapeGeom(double expand = 0) const;
};

enum class GraphicKind { Line, Arc, Circle, Rect, Poly };

struct Graphic {
  GraphicKind kind = GraphicKind::Line;
  LayerId layer = -1;
  Vec2 a, b, m;           // Line: a-b; Arc: a (start), m (mid), b (end); Circle: a centre, b on circle; Rect: a-b
  std::vector<Vec2> pts;  // Poly
  Coord width = 0;
  bool filled = false;
};

struct Component {
  std::string ref;
  std::string value;
  std::string footprint;
  Point pos;
  double angle = 0;
  Side side = Side::Top;
  bool locked = false;
  std::vector<int> pads;
  std::vector<Graphic> graphics;  // absolute coordinates
};

struct Track {
  Point a, b;
  std::optional<Point> mid;  // set for arcs (KiCad-style start/mid/end)
  Coord width = 0;
  LayerId layer = 0;
  int net = kNoNet;
  bool locked = false;
  bool edited = false;  // changed by hand since the last shape computation (F5 re-lays these first)
  uint32_t id = 0;      // stable identity across edits and undo (0: not assigned yet); see topo::Topology
  bool isArc() const { return mid.has_value(); }
  Polyline path(double tol = 2000) const;  // centreline points
  double length() const;                   // along the centreline, nm
};

struct Via {
  Point pos;
  Coord diameter = 0;
  Coord drill = 0;
  LayerMask layers = 0;  // copper layers spanned (through via = all copper)
  int net = kNoNet;
  bool locked = false;
  uint32_t id = 0;  // as Track::id
  bool onLayer(LayerId l) const { return (layers >> l) & 1; }
};

enum class PadConnection { Thermal, Solid, None };

struct Zone {
  int net = kNoNet;
  LayerId layer = 0;
  std::string name;
  std::vector<Vec2> outline;
  std::vector<std::vector<Vec2>> cutouts;  // «Вырезы в металлизации»: never poured
  std::vector<std::vector<Vec2>> filled;
  Coord clearance = 0;
  int priority = 0;              // higher priority zones are cut out of lower ones
  PadConnection padConnection = PadConnection::Thermal;
  Coord thermalGap = 0;          // 0 = fill default
  Coord spokeWidth = 0;          // 0 = fill default
  double spokeAngle = 0;         // degrees relative to the pad (TopoR default 45)
  Coord minWidth = 0;            // 0 = fill default
};

// «Запрет». A routing keepout keeps wires and/or vias off its copper layers, a placement keepout keeps
// components off a side. Its shape is a closed figure (an area) or open lines (a barrier wires may not cross).
struct Keepout {
  enum class Role { Route, Place } role = Role::Route;
  bool wires = true, vias = true;  // routing: what is kept out
  LayerMask layers = 0;            // routing: copper layers, 0 = all
  Side side = Side::None;          // placement: Top, Bottom, None = both sides
  std::vector<Graphic> shape;      // layer unused
  bool onLayer(LayerId l) const { return role == Role::Route && (!layers || ((layers >> l) & 1)); }
  // Areas as polygons and circles, lines as zero-width capsules (arcs in chords).
  std::vector<Shape> shapes() const;
};

// Text style («Редактор стилей надписей»): TopoR's vector fonts by name, character height and stroke.
struct TextStyle {
  std::string name = "(Default)";
  std::string font = "QUALITY";
  Coord height = mmToNm(1.5);
  Coord lineWidth = 0;  // 0: a tenth of the height
  bool bold = false, italic = false;
  Coord stroke() const { return lineWidth > 0 ? lineWidth : height / 10; }
};

// The point of a text that `pos` gives: Left/Centre/Right × Top/Middle/Bottom.
enum class TextAlign { LT, CT, RT, LM, CM, RM, LB, CB, RB };

struct Text {
  std::string text;
  Vec2 pos;
  double angle = 0;  // degrees, counter-clockwise on screen
  bool mirror = false;
  LayerId layer = -1;
  int style = 0;     // into Board::textStyles
  TextAlign align = TextAlign::LB;
};

struct SourceDoc;

struct Board {
  std::string name;
  std::vector<Layer> layers;
  std::vector<NetClass> netClasses{NetClass{}};
  std::vector<LayerRule> layerRules;
  std::vector<Net> nets;
  std::vector<Component> components;
  std::vector<Pad> pads;
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  std::vector<Graphic> graphics;           // board-level drawings (board outline, details)
  std::vector<Keepout> keepouts;
  std::vector<TextStyle> textStyles{TextStyle{}};
  std::vector<Text> texts;
  std::vector<std::vector<Vec2>> outline;  // closed board contours (first = outer)
  Coord edgeClearance = mmToNm(0.25);
  double designUnitNm = kNmPerMm;  // unit the design was drawn in (lengths are shown in it)
  std::shared_ptr<SourceDoc> source;       // original file tree for lossless round-trip
  std::optional<DisplayControl> display;   // display settings saved with the design (TopoR .fst)
  std::optional<DesignRules> rules;        // TopoR-style rules the classes are compiled from, if any

  // Layers
  double tracksLength() const;     // of all tracks, nm
  LayerList copperLayers() const;  // top to bottom
  int copperCount() const;
  LayerId findLayer(const std::string& name) const;
  LayerId addLayer(const std::string& name, LayerKind kind, Side side);
  LayerId copperByIndex(int idx) const;
  LayerId topCopper() const { return copperByIndex(0); }
  LayerId bottomCopper() const { return copperByIndex(copperCount() - 1); }
  LayerMask allCopperMask() const;

  // Nets
  int findNet(const std::string& name) const;
  int addNet(const std::string& name);  // returns existing index if present
  const NetClass& classOf(int net) const;
  // Effective rules of a net on a copper layer (net class + layer rules); layer < 0 = class only.
  Coord trackWidth(int net, LayerId layer) const;
  Coord clearance(int net, LayerId layer) const;
  Coord maxClearance() const;  // over all classes and layer rules
  // The narrowest a wire may be: «Мин.» of the last width rule that applies (Rules.cpp); the class
  // width for designs without rules.
  Coord minTrackWidth(int net, LayerId layer) const;
  // Copper layers a net is assigned to by «Назначение цепей на слои»; 0 = no assignment.
  LayerMask assignedLayers(int net) const;
  int findNetClass(const std::string& name) const;

  int findComponent(const std::string& ref) const;
  // Recompute absolute pad positions/angles from component placement and local data.
  void updatePadPositions(int comp);
  void moveComponent(int comp, Point newPos);
  void rotateComponent(int comp, double deltaDeg);

  BBox bbox() const;
  const TextStyle& styleOf(const Text& t) const;
  // Approximate extent of a text: characters 0.7 of the height wide (TopoR's vector fonts), as the
  // corners of its box in board coordinates.
  std::array<Vec2, 4> textBox(const Text& t) const;
  void rebuildNetIndex();  // fixes cached lookup after edits
  void clearRouting(bool keepLocked = true);

 private:
  std::map<std::string, int> netIndex_;
};

// Rotate a local vector by an angle in degrees using the board (Y-down, CCW on screen) convention.
Vec2 rotateBoard(Vec2 v, double deg);

// Holds the parsed source document so writers can preserve unknown content.
struct SourceDoc {
  enum class Format { None, Kicad, Dsn, Pcad } format = Format::None;
  std::string path;
  std::shared_ptr<sexpr::Node> tree;
  // KiCad: footprint node index (in tree children) for each component.
  std::vector<int> componentNodes;
  // KiCad: zone node index (in tree children) for each model zone (multi-layer zones map many-to-one).
  std::vector<int> zoneNodes;
  // P-CAD: layer number of each board layer (-1 = none) and the file's default unit.
  std::vector<int> layerNums;
  double unitNm = 0;
};

}  // namespace xr
