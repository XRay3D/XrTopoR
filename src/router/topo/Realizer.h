#pragma once
// Geometric realisation of topological routes: each wire's planar "sketch" polyline is pulled
// taut around the obstacles of other nets (funnel algorithm in a constrained Delaunay
// triangulation of obstacle points), then thickened into tangent segments + arcs whose
// radii nest wires that wrap the same obstacle.
#include <array>
#include <optional>
#include <map>
#include <vector>

#include "core/Board.h"
#include "router/topo/TopoMesh.h"

namespace xr::topo {

// Safety margin (nm) the realiser adds to every wire's clearance so that arc tessellation and
// integer rounding never eat into the rule; the router reserves the same amount per wire.
constexpr double kRealizeMargin = 2000;

struct RealWire {
  int net = kNoNet;
  LayerId layer = 0;
  Coord width = 0;     // nominal
  Coord widthMin = 0;  // TopoR's «подрезка»: the width used where the nominal one does not fit (0: none)
  Coord clearance = 0;
  Polyline sketch;  // start vertex, edge crossing points..., end vertex
  // The inner point of the pad's pattern this wire was led to at its front and back by an earlier pass
  // (topo/PadExit.h): the pattern is drawn there again. The chains are cut at every vertex inside the
  // copper, so the sketch itself begins a little further on.
  std::optional<Vec2> inner[2];
};

struct RealVia {
  Vec2 pos;
  int net = kNoNet;
  Coord diameter = 0;
  Coord drill = 0;
};

struct RealizeStats {
  int wires = 0;
  int arcs = 0;
  int narrowed = 0;  // edge crossings realised narrower than the wire
  int narrowedWires = 0;  // wires with such a crossing
  int overflowEdges = 0;  // edges of the realiser's triangulation whose wires did not fit (violations)
  int droppedApexes = 0;
  int guardBends = 0;  // bends added by geometry around copper the taut path ran into
  int arcBends = 0;    // bends added around other wires' arcs a chord ran into
  int sketchCrossings = 0;  // pairs of sketches that cross each other topologically (laid as drawn)
  std::vector<std::pair<int, int>> crossingNets;  // the nets of those pairs, each pair once
  std::vector<int> trackWire;  // wire index of every track appended, in order
  // What the wires as drawn do to the things they hang on and bend round (TopoR's forces: Bessonov, Luzin,
  // Lyachek, Popov, 2014): a wire pulls the element each of its ends is fixed to along itself, and presses on
  // an element it bends round with the sum of the unit vectors from the bend towards its neighbours on the
  // wire — the gain in the wire's length per unit of the element's shift that way. `endDir`: per wire, the
  // unit vector from its front end and from its back end along the wire (zero for a wire not drawn).
  // `ownerPush`: per owner of the model (the realiser's input from the model only), the sum over the bends
  // round its points. `ownerForce`: the two summed per owner, filled by realizeFromModel — minus the gradient
  // of the drawn length by the owner's position.
  std::vector<std::array<Vec2, 2>> endDir;
  std::map<int, Vec2> ownerPush;
  std::map<int, Vec2> ownerForce;
};

struct RealizeOptions {
  // The router's mesh: the realiser then triangulates the very same points with the same constraints
  // (via sites and other layers' pads as transparent points), so that a wire crosses exactly the edges
  // the topology put it on and the slots on those edges hold what the capacity said they hold.
  const TopoMesh* mesh = nullptr;
  // Existing board tracks of other nets act as obstacles.
  bool tracksAsObstacles = false;
  // Only obstacles intersecting this box are considered (local re-shaping); outline always is.
  std::optional<BBox> region;
  // Wire ends that lie on no pad or via (branch points of a manual routing): obstacles of their net
  // for everybody else, or the taut paths of other nets run straight through the junction.
  struct Anchor {
    Vec2 pos;
    LayerId layer;
    int net;
    double radius;
  };
  std::vector<Anchor> anchors;
  // The wires leave their pads by TopoR's pattern (topo/PadExit.h). Off: every wire is laid taut from the
  // very point its sketch begins at (a drawing to compare two sketches of one wire by).
  bool padPattern = true;
  // The wires keep the nominal clearance from what they bend round, and from each other in the stacks there,
  // wherever the edges at that obstacle have room for it (Board::clearanceNom; TopoR: the nominal clearance
  // everywhere the wires can be moved apart, the minimum in the tight spots). Off: the minimum everywhere.
  // Experimental (see Realizer.cpp): the stacks of a bus lose their nesting between an obstacle that has the
  // room and one that has not.
  bool nominal = false;
};

// TopoR's «подрезка» by the copper as it lies: every track from `firstTrack` on that comes closer to
// other nets' copper than its clearance is narrowed to what fits, down to the minimum width of its
// net on its layer. Returns the number of tracks narrowed.
int narrowToFit(Board& b, size_t firstTrack);

// Appends tracks for the wires and vias to the board.
RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                     const RealizeOptions& opt = {});

}  // namespace xr::topo
