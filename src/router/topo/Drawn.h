#pragma once
// A drawing of the wires before it is tracks: where every wire crosses every edge of its path, how wide it is
// there, the circles it bends round and the tangent points between them. The realiser computes it (computeDrawn)
// and makes the tracks from it (emitDrawn); it is the state that is to live with the model between drawings —
// what a wire's length, its pull on a via and its clearance from a neighbour are asked of with no track made.
#include <array>
#include <map>
#include <set>
#include <utility>
#include <vector>

#include "core/Board.h"
#include "geom/Geometry.h"

namespace xr::topo {

struct Bend {
  Vec2 c;
  double rho = 0;   // signed radius: + counter-clockwise (obstacle on the left)
  int obst = -1;    // obstacle id, -1 for the end points
  int portal = 0;   // index in the portal list
  double width = 0; // wire width at this bend (narrowed where the slot needed it)
};

// The room of one wire on one crossed edge: the interval of centre-line positions along u -> v that keeps
// the required spacing to the end obstacles and to the other wires crossing the same edge.
struct EdgeRoom {
  double lo = 0, hi = 0;  // distances from u
  double xu = 0, xv = 0;  // reach of the end obstacles' copper along the edge
  // Bend circles implied by the slot bounds: around the obstacle itself (packed stack) or around
  // the inner wire's actual crossing point when that is what pushes the bound out.
  Vec2 cu, cv;
  double ru = 0, rv = 0;
  // What a chord crossing the edge inside the slot has to keep from the end obstacles: their own
  // rule, and the inner wires that really bend around them (from the previous round).
  double du = 0, dv = 0;
};

struct DrawnWires {
  // Per wire, per crossing of its path (RealizeInput::hits):
  std::vector<std::vector<EdgeRoom>> rooms;                   // the room it has on the edge
  std::vector<std::vector<double>> width;                 // its width there (the minimum where the edge is short of room)
  std::vector<std::vector<double>> actual;                // where its path crosses the edge, from u (-1: not yet known)
  std::vector<std::vector<std::array<double, 2>>> bendR;  // the radius it uses round the edge's u and v (-1: none)
  // Per wire, per bend of its path (the first and the last are its ends, of no radius):
  std::vector<std::vector<Bend>> bends;
  std::vector<std::vector<Vec2>> tin, tout;               // where the wire comes on to the bend's circle and leaves it
  // Per layer, per obstacle point: its share of the nominal clearance (0: the minimum, 1: the nominal), and how far
  // the stack of wires round it reaches at the minimum and at the nominal.
  std::map<LayerId, std::vector<double>> share;
  std::map<LayerId, std::vector<std::array<double, 2>>> reach;
  // ... the edges that were overfull at their ends' shares and took them back.
  std::map<LayerId, std::set<std::pair<int, int>>> tookBack;
  // The counts of the computation (RealizeStats).
  int overflowEdges = 0, arcBends = 0, guardBends = 0, droppedApexes = 0;
  // How it was last computed: whole, or brought up from an earlier drawing (updateDrawn) — the edges packed again and
  // the wires laid again for it, the rounds it took; why it was computed whole when it was asked to be brought up.
  struct Made {
    bool updated = false;
    int edges = 0, wires = 0, rounds = 0;
    const char* whole = "";
  } made;
};

}  // namespace xr::topo
