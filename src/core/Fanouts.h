#pragma once
// «Расставить фанауты»: a via beside a planar pad, joined to it by a short straight track, so that the pad can be
// come to on every layer. By the papers of TopoR's authors — Изв. СПбГЭТУ «ЛЭТИ» 2014 № 5 (the cells of a BGA and
// the matching of pads and cells) and 2017 № 4 (the places free of pads on both sides, the assignment, pads of
// one net sharing a via) — and TopoR's help (a regular BGA from its centre by quadrants; a via at the end of a
// pad of a row).
//
// A BGA is a component with a lattice of planar pads that has inner ones. Its pads get vias, each its own, but
// those of the two outer rows (their wires go out on the pads' own layer) — unless the pad's net is a plane
// layer's. The places for vias are the lattice's cells (the middles between four neighbouring nodes) and its
// empty nodes, where a through via keeps its clearances from the copper of every layer — the pads of the other
// side among it —, moved within the cell when its middle does not; a pad takes a place by a straight track that
// is clear, the nearer the better, of equal ones the one away from the component's centre; the pads and the places
// are matched so that the most pads get one. A pad left without a place is joined to a neighbour of its net that
// has a via; else it is reported. The planar pads of other components under the BGA take what places are left.
// Elsewhere only the pads of the plane layers' nets get vias: at the end of the pad, on its long axis.
#include <vector>

#include "core/Board.h"

namespace xr {

struct FanoutResult {
  int vias = 0;        // vias placed
  int pads = 0;        // pads joined (some share a via)
  int components = 0;  // BGAs that got any
  std::vector<int> blocked;  // pads that were to get a via and found no place
};
FanoutResult placeFanouts(Board& b);

// Whether a component is a BGA by the above.
bool isBga(const Board& b, int component);
// The via of a pad's fanout: a track of the pad's net runs from the planar pad, on its layer, to the via. -1: none.
int fanoutViaOf(const Board& b, int pad);
// The planar pad a via is the fanout of: the via stands off the pad and all its tracks come from that pad.
// -1: not a fanout (no tracks, tracks elsewhere, a via on a pad).
int fanoutPadOf(const Board& b, int via);

}  // namespace xr
