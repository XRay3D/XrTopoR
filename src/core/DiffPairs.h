#pragma once
// The editing of the differential pairs' zipped sections (HiSpeed.h, ZippedWire): a run of track pieces
// offset to either side (the conductors from an axis, an axis from a conductor), zipping two conductors of
// a pair into a section, unzipping one, swapping its nets.
#include <expected>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr {

// A run of pieces (each starting where the one before ends) offset by d to the left of its travel (d < 0:
// to the right): a line moves along its normal, an arc keeps its centre and its radius grows or shrinks by
// d. An arc that would turn inside out (a bend tighter than d on its inner side) is dropped and its
// neighbours meet where their lines cross, or are joined straight; ends a micron or two apart are one point.
// The pieces keep the run's width, layer, net and zip; `maxJoin` bounds how far a corner may reach.
std::vector<Track> offsetRun(const std::vector<Track>& run, double d, double maxJoin);

// The selected tracks of the two nets of a differential pair on one layer, a chain each, as TopoR zips them:
// each as wide as the pair's rule, each run longer than three widths of the pair; the longer one's run,
// offset half a conductor and half the gap towards the other, is the axis, the conductors are made from it
// and the shorter run goes, straight pieces joining the conductors' ends to where the runs began and ended.
// The new section's index, or why not.
std::expected<int, std::string> zipTracks(Board& b, const std::vector<int>& tracks);
// The section goes, its conductors stay as tracks of their nets.
void unzip(Board& b, int zip);

// The conductors' free ends at the two ends of a section's axis: [side][end], side 0 the negative net's, 1 the
// positive's; end 0 at the axis's start. Taken before the axis is edited, for rebuildZip.
struct ZipEnds {
  Vec2 p[2][2];
  bool ok = false;
};
ZipEnds zipEnds(const Board& b, int zip);
// The section's conductors made again from its axis (offsetRun, the pair's rule on its layer), written over the
// old ones in place (the tracks keep their indices and ids; pieces more are appended, pieces fewer erased), and
// the single tracks that ended at the old conductors' ends (`was`) taken to the new ones (a locked one gets a
// connecting piece). False for a section without an axis.
bool rebuildZip(Board& b, int zip, const ZipEnds& was);
// The pair edited by its axis (TopoR: the zipped pair is laid and edited as one wire), each followed by
// rebuildZip; false for a fixed section. Vertex k: 0 the start clasp, n the end clasp, between them the joint of
// pieces k - 1 and k; the pieces either side stretch (an arc keeps its shape). bendAxis: an arc's middle to `to`
// (on the chord: a line), a line split at its middle with the new vertex at `to`. moveAxisPiece: piece k by d.
bool moveAxisVertex(Board& b, int zip, int k, Vec2 to);
bool bendAxis(Board& b, int zip, int k, Vec2 to);
bool moveAxisPiece(Board& b, int zip, int k, Vec2 d);
// The two nets change sides: each conductor takes the other's net, and the single tracks at the section's
// ends move over to the conductor of their net (TopoR's «Поменять цепи местами», against wires crossing at
// a clasp).
void swapZipNets(Board& b, int zip);

}  // namespace xr
