#pragma once
// Interactive edits of the topology as TopoR's editor makes them: moving, rotating and flipping
// fragments (components, vias, wire segments, copper areas) with the wires attached to them kept
// connected, and the operations on wires (vertex and segment drags, «Спрямить», «Изменить слой»,
// «Отсоединить», «Изменить цепь»). Objects are addressed by index; new tracks are appended, so the
// indices taken before an edit stay valid until removeDegenerate() compacts the track list.
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::edit {

struct Fragment {
  std::vector<int> components, tracks, vias, zones;
  std::vector<int> keepouts, texts, details;  // details: board drawings (Board::graphics), the outline among them
  bool empty() const {
    return components.empty() && tracks.empty() && vias.empty() && zones.empty() && keepouts.empty() && texts.empty() &&
           details.empty();
  }
  // Whether the board outline must be built again from its drawings after an edit of the fragment.
  bool touchesOutline(const Board& b) const;
};

// Rigid motion p → pivot + R(rotate)·M·(p − pivot) + shift, where M mirrors x when `mirror` is set:
// a flip about the vertical axis through the pivot (a vertical flip is that and 180°).
struct Motion {
  Vec2 pivot;
  double rotate = 0;  // degrees, board convention (counter-clockwise on screen)
  bool mirror = false;
  Vec2 shift;
  Vec2 apply(Vec2 p) const;
  Point apply(Point p) const { return Point(apply(p.v())); }
};

// The layer on the other side: copper by its place in the stack, technical layers by kind and side.
LayerId mirrorLayer(const Board& b, LayerId l);
LayerMask mirrorMask(const Board& b, LayerMask m);

// The point TopoR turns a fragment about: a single component's origin, otherwise the centre of the
// fragment's bounding box.
Vec2 pivotOf(const Board& b, const Fragment& f);
BBox bboxOf(const Board& b, const Fragment& f);
bool hasLocked(const Board& b, const Fragment& f);

// Track ends lying at `p` on `layer` (one vertex of a wire): (track, end) with end 0 = a, 1 = b.
std::vector<std::pair<int, int>> endsAt(const Board& b, Vec2 p, LayerId layer, int net);
// A pad or via of the net that a track end at `p` on `layer` is attached to.
bool anchoredAt(const Board& b, Vec2 p, LayerId layer, int net);

// Moves the fragment; fragments with locked objects are not moved (false). Wires stay connected:
//  - an end of an unmoved track lying on a moved pad, via or track end goes along (the track
//    stretches, an arc keeps its shape); a locked track stays and gets a connecting segment;
//  - a moved track whose end lies on an unmoved pad, via or locked track gets a connecting segment.
// A flip takes the fragment to the other side, its tracks to the mirror layer; wires whose pad leaves
// their layer (SMD pads) stay where they are, unconnected, as in TopoR.
bool move(Board& b, const Fragment& f, const Motion& m);

// Drags the wire vertex at end `end` (0 = a, 1 = b) of a track to `to` with all track ends meeting
// there. A vertex on a pad or via stays: the grabbed track breaks off it with a new segment.
// False if a locked track ends there.
bool moveVertex(Board& b, int track, int end, Vec2 to);
// Parallel transfer of one segment by d (neighbours stretch, as in move()).
bool moveSegment(Board& b, int track, Vec2 d);
// Splits a track at the point nearest to `at`; returns the index of the second part (appended).
int splitTrack(Board& b, int track, Vec2 at);
// The middle of an arc moves to `to` (a straight segment becomes an arc through it).
bool bendTrack(Board& b, int track, Vec2 to);

// «Спрямить» (C): every chain of the given tracks (one net and layer, joined end to end, no branches)
// becomes one straight segment between its ends. Returns the number of segments made.
int straighten(Board& b, const std::vector<int>& tracks);
// «Изменить слой» (L): the tracks go to `layer`; where the wire goes on on other copper (tracks of
// another layer, an SMD pad of another layer) a through via of the net's type is added. Returns the
// number of vias added.
int changeLayer(Board& b, const std::vector<int>& tracks, LayerId layer);
// «Отсоединить» (U): the unlocked tracks attached to the fragment's pads and vias from outside it are
// removed, so the connections show as net lines and later moves do not drag wires. Returns the count.
int unlink(Board& b, const Fragment& f);
// «Изменить цепь» (Shift+N) of tracks, vias, pads and copper areas.
void changeNet(Board& b, const Fragment& f, const std::vector<int>& pads, int net);
// «Удалить избыточные переходы»: unlocked vias connecting nothing or one layer only. Returns the count.
int removeExcessVias(Board& b);

// Clipboard contents: wires, vias and copper areas with their nets and layers by name, so that they
// can be pasted into another design. Components come from the netlist and are not copied.
struct Clip {
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  std::vector<Keepout> keepouts;
  std::vector<Text> texts;
  std::vector<Graphic> details;
  std::vector<std::string> nets, layers;  // names in the source design, by index
  Vec2 origin;                            // centre of the copied objects
  bool empty() const {
    return tracks.empty() && vias.empty() && zones.empty() && keepouts.empty() && texts.empty() && details.empty();
  }
};
Clip copy(const Board& b, const Fragment& f);
// Appends the clip with its origin at `at` (nets and layers matched by name; objects on layers the
// design lacks are dropped) and returns what was added. Pasted objects are never locked.
Fragment paste(Board& b, const Clip& c, Vec2 at);
// Removes the fragment's objects but its components (they belong to the netlist).
void erase(Board& b, const Fragment& f);

// Removes zero-length tracks (drags leave them); returns old → new track index (-1 = removed).
std::vector<int> removeDegenerate(Board& b);

}  // namespace xr::edit
