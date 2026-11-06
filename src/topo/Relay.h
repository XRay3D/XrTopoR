#pragma once
// A wire laid anew inside the model (TopoR's re-laying, Polubasov 2010: a wire is taken out and led by a
// cheaper path over the triangulation, with the clearances kept; the wires around it move over when the
// shapes are computed). The wire's crossings go, a path is searched from one of its ends to the other over
// the triangles — an A* over (edge, gap between the wires already crossing it), a chord inside a triangle
// never across a chord of another net, an edge passable while the wires with the new one among them still
// fit — and the path's crossings are put in. The crossings of the end pad's own sides stay where they are
// (the wire leaves its pad as it did).
#include <optional>
#include <vector>

#include "topo/Topology.h"

namespace xr::topo {

// The length of the wire pulled taut through the slots of its crossings (a polyline: no arcs), nm.
double tautLength(const Topology& t, int wire);

struct RelayPath {
  struct Step {
    int edge = -1;
    int gap = 0;  // the place among the edge's crossings, from its v[0]: before crossing `gap`
  };
  int first = 0, last = 0;  // the wire's crossings [first, last) are replaced; the rest are its pads' own sides
  std::vector<Step> steps;
  bool along = false;       // no crossings: the wire runs along the edge between its end vertices
  int alongEdge = -1;
  double length = 0;        // through the slots' midpoints, nm (what the search minimised)
};

// The cheapest path for the wire with its present crossings [first, last) out of the way (they are not
// touched: the search looks past them). Nothing when there is none, or when it would cross an edge twice.
// `avoid` (per owner, may be null): the path crosses no edge at these owners. `absent` (may be null): wires
// that are not there for the search — taken out to be laid anew after this one (a clinch: Luzin, Popov, Popov,
// NTV ITMO 2012 no. 4); the path's gaps are counted without their crossings, so they are to be taken out
// (takeOut) before the path is applied.
std::optional<RelayPath> findRelay(const Topology& t, int wire, const std::vector<char>* avoid = nullptr, const std::vector<int>* absent = nullptr);
// Takes the wire's old crossings out and puts the path's in; the edges' capacities are refreshed.
void applyRelay(Topology& t, int wire, const RelayPath& path);
// Takes the wire's crossings out (all but those of its own pads' sides) and puts none in: the wire is to be
// laid anew by findRelay and applyRelay; till then the model is not whole.
void takeOut(Topology& t, int wire);

}  // namespace xr::topo
