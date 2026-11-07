#pragma once
// The topological model of the wiring, as TopoR keeps it: the board's copper objects are owners
// (pads, vias, branch points, outline and keepout points), every copper layer has a triangulation of
// the owners on it, and a wire is an ordered chain of the triangulation edges it crosses. F5 and F7
// work here with widths and clearances alone (no arcs); the realiser draws the result.
//
// A triangle's corner is a position along its owner's axis (an elongated pad's long axis, TopoR's
// chainPos): the owner's centre at t = 0, its ends at t = ±1. Round owners have one vertex.
#include <array>
#include <cstdint>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::topo {

constexpr int kBoardEdge = -2;  // the "net" of the outline: belongs to nobody, blocks everybody

struct Owner {
  // Zone: a poured copper area, from outside a pad of its net (its boundary ring is its vertices, no centre;
  // the wires of its net may end anywhere on the ring, other nets keep the zone's clearance); what lies
  // inside is locked (TopoR touches nothing in a pour). An unpoured zone is nothing to the model.
  // Clasp («замок»): the end of a zipped section of a differential pair, three vertices in a line across the
  // pair: the two conductors' ends (t = -1 the negative net's, +1 the positive's) where the single wires to
  // the pads start, and the centre (t = 0) where the pair's one wire ends. Moves with F7 as a junction.
  enum class Kind { Pad, Via, Junction, Outline, Keepout, Zone, Clasp };
  Kind kind = Kind::Pad;
  Vec2 c;             // centre
  Vec2 axis;          // half-vector along the long axis; 0 for round owners
  double halfWidth = 0;  // copper half-width across the axis (via: diameter / 2; junction: widest track / 2)
  Shape shape;        // the exact copper, for distances and reach
  int net = kNoNet;   // kBoardEdge: outline; kNoNet: keepouts and holes without copper
  LayerMask layers = 0;  // where it is copper (outline, keepout: where it blocks)
  int pad = -1;       // board indices, refreshed by sync()
  int via = -1;
  uint32_t viaId = 0;
  int junction = -1;
  int zone = -1;
  int net2 = kNoNet;   // a clasp: the negative net (net is the positive)
  int pair = -1;       // a clasp: the differential signal (Board::hispeed.diffSignals)
  int zip = -1;        // a clasp: the zipped section (Board::zips) it ends
  int claspEnd = -1;   // ... at the section's start (0) or end (1)
  bool locked = false;
};

// A free end or branch point of a net's wires on a layer: a vertex of the mesh that moves with F7.
struct Junction {
  Vec2 pos;
  int net = kNoNet;
  LayerId layer = 0;
  int owner = -1;
  int degree = 0;  // wires meeting there (1: a dangling end)
};

struct Vertex {
  int owner = -1;
  double t = 0;    // position along the owner's axis, in [-1, 1]
  Vec2 off;        // fixed offset from the axis (a custom pad's corner)
  Vec2 p;          // cached: owner.c + owner.axis * t + off
  std::vector<int> tris;  // incident inside triangles
};

struct Edge {
  int v[2] = {-1, -1};  // v[0] < v[1]
  int t[2] = {-1, -1};  // triangles (-1: hull)
  bool constrained = false;  // outline, keepout boundary: never flipped, never crossed
  bool rigid = false;        // inside one owner (a pad's centre to its end): never flipped
  int along = -1;            // the wire that runs along the edge between its two end owners, if one does
  std::vector<int> cross;    // crossing ids, in order from v[0] to v[1]
  // Capacity (Capacity.h), recomputed when the end owners move or `cross` changes.
  double freeLen = 0;
  double need = 0;
  uint8_t cls = 0;  // 0: fits with the margin, 1: fits at the bare rule, 2: overflow, 3: closed (no room at all)
};

struct Tri {
  int v[3] = {-1, -1, -1};   // counter-clockwise
  int e[3] = {-1, -1, -1};   // e[i] opposite v[i]
  int nb[3] = {-1, -1, -1};  // across e[i] (-1: outside or a constrained edge)
  bool inside = false;
  bool blocked = false;      // inside a keepout area of this layer
  int zone = -1;             // the zone owner whose ring holds the triangle (a pour: only its net's wires go there)
};

struct LayerMesh {
  LayerId layer = 0;
  std::vector<Vertex> verts;
  std::vector<Tri> tris;
  std::vector<Edge> edges;
  std::vector<std::vector<int>> ownerVerts;  // per owner: its vertices on this layer
  std::vector<double> ownerClr;              // per owner: the clearance its net keeps on this layer

  int localEdge(int t, int e) const {
    for (int i = 0; i < 3; ++i)
      if (tris[t].e[i] == e) return i;
    return -1;
  }
  int localVertex(int t, int v) const {
    for (int i = 0; i < 3; ++i)
      if (tris[t].v[i] == v) return i;
    return -1;
  }
  bool dead(int t) const { return !tris[t].inside && tris[t].e[0] == -1; }
  int locate(Vec2 p) const;  // the inside triangle holding p, or -1
};

struct Crossing {
  int wire = -1;
  int edge = -1;
  int idx = -1;      // its index in Wire::cross
  double width = 0;  // nominal, or widthMin where the nominal does not fit
};

struct Wire {
  int net = kNoNet;
  LayerId layer = 0;
  Coord width = 0, widthMin = 0, clr = 0;
  int end[2] = {-1, -1};    // owners
  int endVertex[2] = {-1, -1};  // their vertices the wire starts and ends at (on its layer's mesh)
  // Where the wire leaves the end owner's copper, on its boundary (the realiser decides from that point
  // whether the wire needs a stub out of a narrow pad; kept from the tracks as drawn, flips do not move it).
  Vec2 exit[2];
  bool hasExit[2] = {false, false};
  std::vector<int> cross;   // crossing ids from end[0] to end[1]; consecutive ones share a triangle
  std::vector<uint32_t> tracks;  // the board tracks it is drawn as (empty: not drawn yet)
  bool locked = false;
  bool dirty = true;        // converted from hand-drawn tracks since it was last drawn
  // Its way is not its tracks' (the model took it apart from a double crossing): drawn with the edited wires.
  bool rerouted = false;
  int zone = -1;            // the zone owner that locked it: its tracks lie in a pour (any net), or cross into one (another net)
  int pair = -1;            // a pair's wire: the differential signal; net is the positive net, width the pair's (2w + gap), tracks the conductors
  int zip = -1;             // ... and the zipped section it is
};

struct Violation {
  // Blocked: a wire drawn through a keepout or across a cutout that found no way round (locked where it is).
  enum class Kind { Crossing, ThroughPad, OutsideBoard, Overflow, Blocked };
  Kind kind = Kind::Crossing;
  int wireA = -1, wireB = -1;
  int owner = -1;
  LayerId layer = 0;
  Vec2 pos;
  int tri = -1, edge = -1;
  double deficit = 0;
};

struct BuildScratch;  // what buildOwners hands to buildMeshes (Topology.cpp)

struct Topology {
  std::vector<Owner> owners;
  std::vector<Junction> junctions;
  std::vector<LayerMesh> layers;  // one per copper layer, in Board::copperLayers() order
  std::vector<Wire> wires;
  std::vector<Crossing> crossings;
  std::vector<Violation> violations;
  uint64_t boardHash = 0;
  int untangled = 0;  // double crossings of wires taken apart when the tracks were converted (Chains.h untangleChains)
  std::vector<int> padOwner, viaOwner;  // board index -> owner (-1: none)
  // The keepouts that keep vias out (areas, circles, lines as capsules): no mesh of their own, a via is
  // held off them where it is placed (insertVertex) and moved (F7's push).
  struct ViaBar {
    LayerMask layers;
    Shape shape;
  };
  std::vector<ViaBar> viaBars;
  void takeViaBars(const Board& b);
  // How far a via of radius r at p on these layers reaches into a via keepout (0: clear; touching is
  // allowed, as the DRC takes it); inside an area, its radius plus the way to the boundary. `way` (may be
  // null): the shortest way out of the worst one, a unit vector.
  double viaBarIntrusion(Vec2 p, double r, LayerMask layers, Vec2* way = nullptr) const;
  // The tracks lying wholly inside an owner's copper (a hand-drawn track's run from the pad's centre to its
  // edge): that copper, not wires. F5 draws a wire to the pad's connection point and drops them.
  std::vector<std::pair<int, uint32_t>> ownerTracks;  // (owner, track id)
  // The board's clearance rules (a copy: the capacity answers for a pair of nets without the board).
  std::vector<Coord> classClr;  // per net
  std::vector<LayerRule> layerRules;
  std::vector<ClearancePair> pairRules;
  std::vector<int> netPair;  // per net: its differential signal, -1 none
  void takeRules(const Board& b);
  // The net of a vertex (a clasp's negative end has the pair's other net).
  int netAt(const LayerMesh& m, int v) const;
  // Whether the vertex's copper is the wire's own: of its net, or of its pair (the clasp's three vertices to
  // the pair's wire and to the two single wires that start there).
  bool own(const LayerMesh& m, int v, const Wire& w) const;
  // The clearance two nets keep on a layer: the pair's rule, else the larger of their own.
  double clearance(int netA, int netB, LayerId layer) const { return double(clearanceBetween(classClr, layerRules, pairRules, netA, netB, layer)); }

  // The model from the board: the owners (pads, vias, the outline's and the keepouts' points, the
  // branch points and free ends of the tracks), the meshes, and the tracks as wires on them.
  void build(const Board& b);
  // Gives every track and via without an id one.
  static void assignIds(Board& b);

  const LayerMesh* mesh(LayerId layer) const;
  LayerMesh* mesh(LayerId layer);
  Vec2 vertexPos(const LayerMesh& m, int v) const { return m.verts[v].p; }
  void placeVertex(LayerMesh& m, int v) const;  // refreshes the cached position from the owner
  // The vertex of the owner on the layer nearest p.
  int nearestVertex(const LayerMesh& m, int owner, Vec2 p) const;
  // The edges a polyline from vertex v0 to vertex v1 crosses on the layer's mesh, in order (the walk the
  // conversion uses); `ok` false when the walk loses the mesh.
  std::vector<int> walkEdges(const LayerMesh& m, int v0, int v1, const Polyline& sk, bool& ok) const;
  // The wires of different nets that cross each other on a layer: chords interleaving on a triangle, a
  // wire across the edge another runs along.
  std::vector<Violation> findCrossings(const LayerMesh& m) const;
  // The live model (gui/Document keeps it through the edits): the wires of the tracks of `changed` ids (changed,
  // added or gone on the board) laid again from the board as it now is — the chains of their nets that hold one
  // of them, and every wire sharing a chain with one, taken out and laid in (Convert.cpp: the same chains, ends,
  // walks and edge order as the build; branch points made and taken out as the ends need them). False when the
  // model cannot be kept (a zipped pair among them, a branch point the mesh refuses): build it anew.
  bool relayTracks(const Board& b, const std::vector<uint32_t>& changed);
  // Everything moved by d (the board moved whole): the owners, their copper, the meshes' points, the wires' exits.
  void translate(Vec2 d);
  // Checks the invariants: the meshes (orientation, neighbours, edges, vertex lists) and the wires (every
  // consecutive pair of crossings on one triangle, the ends at their owners, the edge lists and the wires'
  // lists agreeing). Returns what is wrong.
  std::vector<std::string> check() const;

 private:
  void buildOwners(const Board& b, BuildScratch& s);
  void buildMeshes(const Board& b, BuildScratch& s);
  void convertWires(const Board& b, BuildScratch& s);
  void relayDisplaced(const Board& b, BuildScratch& s);
};

}  // namespace xr::topo
