#pragma once
// «Змейки»: a straight fragment of a wire bent to and fro within a trapezoid so that the wire has the length
// asked of it. The shape is TopoR's, as its own file has it (Example_06/Signals.fst, 59 of its 60 serpents on
// single wires repeated): with p = gap + width the bends stand p apart; a bend is a flat of p/2 parallel to the
// chord between two steps p/2 wide — a step of a height of p/2 and more is two 45° chamfers of p/4 with a piece
// across the chord between them, a lower one a single slanted piece (the «narrow» zigzag) —; the run begins and
// ends with p/4 along the chord, what the chord has over a whole number of p goes to its end. The length is made
// by the bends' height, the same for all, each held by the trapezoid's height where it stands.
#include <optional>
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr {

struct SerpentShape {
  std::vector<Vec2> path;  // from the chord's start to its end
  double length = 0;       // of the path
  double minLength = 0;    // the chord: no bends
  double maxLength = 0;    // every bend as high as the trapezoid lets it
  bool narrow = false;     // the bends are lower than p/4: a zigzag of slanted pieces
};
// The serpent on the chord a → b of a wire `width` wide: `s.length` when the trapezoid has room for it, else the
// longest (or the chord). Side A of the chord — the one `h1` (at a) and `h4` (at b) are the heights of — is to
// the left of a → b in TopoR's frame (Y up), that is (dy, −dx) on the board; `h2`, `h3` are of the other.
SerpentShape serpentShape(Vec2 a, Vec2 b, const Serpent& s, Coord width);

// The pieces of a serpent on a single wire, from its start to its end. None: no pieces (a serpent of a zipped
// pair's axis), or pieces that are not one chain.
struct SerpentRun {
  std::vector<int> tracks;  // in order, each from its `a` to its `b`
  Vec2 a, b;                // the chord
  LayerId layer = 0;
  int net = kNoNet;
  Coord width = 0;
  double drawn = 0;  // the length of the pieces
};
std::optional<SerpentRun> serpentRun(const Board& b, int serp);

// «Преобразовать в змейку»: the tracks — straight pieces of one wire lying on one line, one after another —
// become a serpent of the fragment's own length (straight yet) in a rectangle; the gap is two widths of the wire.
// The serpent's pieces are fixed tracks (as those read from TopoR's file are): what works on wires — F5, F6,
// F7, the drags — keeps them as drawn; «Преобразовать в проводник» frees them.
// Returns the serpent, -1 with `why` when it cannot be (not a straight fragment of a wire, too short for a bend,
// a zipped pair's conductor, a piece of a serpent already).
int makeSerpent(Board& b, std::vector<int> tracks, std::string* why = nullptr);
// «Преобразовать в проводник»: the serpent is no more, its pieces stay as plain tracks.
void unmakeSerpent(Board& b, int serp);
// The serpent with other parameters (length, gap, heights), or between other points of the line it stands on
// (`a`, `b2`): its pieces laid anew. An end moved along the line makes the plain piece of the wire that continues
// the line there longer or shorter; moved inward with no such piece, it leaves a plain piece behind. False: no
// such serpent on a single wire, or an end moved past the straight piece (the board is left as it was).
bool setSerpent(Board& b, int serp, const Serpent& s, const Vec2* a = nullptr, const Vec2* b2 = nullptr);
// The heights a rectangle gets when a serpent is made, and the smallest height of a side (1.5 widths of the wire
// for the whole area: 0.75 a side).
double serpentDefaultHeight(Coord width, double gap);
double serpentMinHeight(Coord width);

}  // namespace xr
