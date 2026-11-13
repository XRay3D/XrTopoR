#pragma once
// Interactive edits of the topology as TopoR's editor makes them: moving, rotating and flipping
// fragments (components, vias, wire segments, copper areas) with the wires attached to them kept
// connected, and the operations on wires (vertex and segment drags, «Спрямить», «Изменить слой»,
// «Отсоединить», «Изменить цепь»). Objects are addressed by index; new tracks are appended, so the
// indices taken before an edit stay valid until removeDegenerate() compacts the track list.
#include <functional>
#include <optional>
#include <string>
#include <vector>

#include "core/Board.h"
#include "core/SpatialIndex.h"

namespace xr::edit {

constexpr double kJoinTol = 1000;  // 1 µm: track ends closer than this meet in one vertex

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
// A poured copper area among the fragment: it is not moved (TopoR: only an unpoured outline is edited).
bool hasPoured(const Board& b, const Fragment& f);

// Track ends lying at `p` on `layer` (one vertex of a wire): (track, end) with end 0 = a, 1 = b.
std::vector<std::pair<int, int>> endsAt(const Board& b, Vec2 p, LayerId layer, int net);
// A pad or via of the net that a track end at `p` on `layer` is attached to.
bool anchoredAt(const Board& b, Vec2 p, LayerId layer, int net);
// The unlocked tracks of `net` on the given layers with an end inside `shape`, as a mask over the tracks.
std::vector<char> attachedTo(const Board& b, const Shape& shape, LayerMask layers, int net);

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
// A track's ends to a2 and b2, an arc keeping its shape (the similarity taking the old ends to the new).
void stretchEnds(Track& t, Vec2 a2, Vec2 b2);
// Parallel transfer of one segment by d (neighbours stretch, as in move()).
bool moveSegment(Board& b, int track, Vec2 d);
// Splits a track at the point nearest to `at`; returns the index of the second part (appended).
int splitTrack(Board& b, int track, Vec2 at);
// The middle of an arc moves to `to` (a straight segment becomes an arc through it).
bool bendTrack(Board& b, int track, Vec2 to);

// Drawings (board outline, details, keepouts' figures, a copper area's shape) are edited by the same handles as
// wires: vertices (ends of a line or an arc, corners of a rectangle or a polygon, a circle's centre and its rim
// point) and middles (of a line, an arc, a rectangle's or a polygon's sides). The ends of the list's drawings of
// one layer that meet at a vertex move with it, as the ends of one wire's tracks do. A rectangle stays one, a
// circle stays one: a corner, a side, the rim keep their kind.
std::vector<Vec2> figureVertices(const Graphic& g);
std::vector<Vec2> figureMiddles(const Graphic& g);
// Vertex k of drawing i goes to `to` with whatever of `list` meets it there.
void moveFigureVertex(std::vector<Graphic>& list, int i, int k, Vec2 to);
// Middle k of drawing i goes to `to`: an arc (an arc side of a polygon) bends through it, straight again on the
// chord; a line breaks there into two (the second appended to `list`); a polygon's straight side gets a vertex; a
// rectangle's side moves across itself.
void bendFigure(std::vector<Graphic>& list, int i, int k, Vec2 to);
// Parallel transfer of a line or an arc by d, the ends meeting its ends stretched.
void moveFigureSide(std::vector<Graphic>& list, int i, Vec2 d);
// A polygon loses vertices dragged onto their neighbours.
void tidyFigure(Graphic& g);
// The figure of an object: a board drawing, figure `part` of a keepout, a copper area's shape (its outline as a
// polygon when it has none); nullopt for anything else.
std::optional<Graphic> figureOf(const Board& b, ItemRef r, int part = 0);
// fn(list, index) on the list that figure lives in; a copper area takes the figure as its shape.
void editFigure(Board& b, ItemRef r, int part, const std::function<void(std::vector<Graphic>&, int)>& fn);

// «Спрямить» (C): every chain of the given tracks (one net and layer, joined end to end, no branches)
// becomes one straight segment between its ends. Returns the number of segments made.
int straighten(Board& b, const std::vector<int>& tracks);
// «Изменить слой» (L): the tracks go to `layer`; where the wire goes on on other copper (tracks of
// another layer, an SMD pad of another layer) a through via of the net's type is added. A via one of these
// tracks ends on goes when all it joins is left on one layer (not a locked one, nor one of a flexibly fixed net).
struct LayerChange {
  int added = 0, removed = 0;  // vias
};
LayerChange changeLayer(Board& b, const std::vector<int>& tracks, LayerId layer);
// «Отсоединить» (U): the unlocked tracks attached to the fragment's pads and vias from outside it are
// removed, so the connections show as net lines and later moves do not drag wires. Returns the count.
int unlink(Board& b, const Fragment& f);
// «Изменить цепь» (Shift+N) of tracks, vias, pads and copper areas.
void changeNet(Board& b, const Fragment& f, const std::vector<int>& pads, int net);
// A net taken out of the design: what was of it — pads, wires, vias, areas — is of no net, the nets after it are
// numbered one less everywhere, the rules are compiled again. Empty: done; else why not (a plane's net; a design
// whose rules name nets by number and cannot be compiled again).
std::string removeNet(Board& b, int net);
// A net named anew. Empty: done; else why not (the name is taken; the net's rules name it — width, clearance, pair
// or layers would be other with the new name).
std::string renameNet(Board& b, int net, const std::string& name);
// «Удалить избыточные переходы»: unlocked vias connecting nothing or one layer only. Returns the count.
int removeExcessVias(Board& b);
// The copper layers a via is needed on by what is not a track: a pad of its net it stands on, a copper area or
// a plane of its net.
LayerMask viaHeldBy(const Board& b, const Via& v);
// ... and the layers of the tracks of its net that end on it.
LayerMask viaTrackLayers(const Board& b, const Via& v);

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

// The junk a design comes with: a track lying exactly on another of its net and layer (the widest of them stays),
// and a crumb with a loose end — a straight track no longer than kCrumb from one of whose ends no other track of
// its net goes on (a spur of such crumbs goes whole; a piece that short inside a wire, with tracks at both its
// ends, stays: TopoR's own files have them). Two wires on one path are pushed apart by F5; a crumb under a via
// stays where the via stood when F7 moves it, an island of its net that the drawing counts as a connection lost.
// The crumbs go when a board is loaded (io::loadBoard), the twins when it is opened with no model of its own that
// still fits (the main window, the CLI's loadModel); the counts are kept in Board::junkRemoved.
constexpr double kCrumb = 5000;  // nm
// `twins` false: the crumbs alone. A board saved with its model (.xrtopo) keeps its twins: two wires that leave
// a pad by the same lead have its pieces each, and are two wires of that model; they are junk where the model is
// to be built from the tracks (a design from another system, a file with its routing written twice).
JunkRemoved removeJunkTracks(Board& b, bool twins = true);
// Which tracks that takes out (per track of the board), with crumbs of `crumbLength` and shorter; nothing is changed.
// An end at the centre of a pad or a via of the net is held as by a track: a wire's last piece into its pad stays.
std::vector<char> junkTracks(const Board& b, bool twins, double crumbLength = kCrumb, JunkRemoved* counts = nullptr);

}  // namespace xr::edit
