#pragma once
// ECO for P-CAD: what changed in the netlist of a design against a base design — pins and gates swapped, pins
// moved to other nets, nets added, taken out, named anew — as the lines of a P-CAD ECO file, so that the change
// can be carried back into the schematic.
#include <ctime>
#include <string>
#include <vector>

#include "core/Board.h"
#include "io/BoardIO.h"

namespace xr::io {

struct EcoChange {
  enum class Kind {
    RenameNet,  // a: the old name, b: the new one
    AddNet,     // a: the net
    PinSwap,    // a, b: the pins («D3-1»); netA, netB: the nets they had
    GateSwap,   // a, b: the pins of each gate, comma-separated; netA, netB: empty
    PinNet,     // a: the pin; netA: the net it had, netB: the one it has (either may be empty: none)
    RemoveNet,  // a: the net
    CompAttr,   // a: the component, b: the attribute («Value», «Type»...); netA: the value it had, netB: the one it has
  } kind = Kind::PinNet;
  std::string a, b, netA, netB;
  std::vector<std::string> lines;  // of the ECO file, UTF-8
};

// The netlist of `now` against `base`. The pins are matched by the component's designator and the pin's own
// (pins of components only one of the two has are left out: components are not compared). A net of the same pins
// under another name is the old one named anew; nets exchanged within a group of equivalent gates or pins are
// swaps (a permutation of pins as so many swaps of two); the rest are pins moved one by one. After the netlist, the
// attributes of the components both have: a value that is other, an attribute that is new (one taken away is not
// told: P-CAD's line for it is not known).
std::vector<EcoChange> netlistDiff(const Board& base, const Board& now);

// A swap is written as P-CAD itself writes one (its schematic, a gate moved to other pins: Untitled1.ECO of the
// user, 2026-11-22): the pins taken out of their nets by NetNodeDelete, then put into the others by NetNodeAdd.
// The text of a P-CAD ECO file with the lines of the changes: CP1251, CRLF, a comment line first as P-CAD writes
// it — «; program [file]--date».
std::string pcadEcoText(const std::vector<EcoChange>& changes, const std::string& program, const std::string& file, std::time_t when);
Result<void> writePcadEco(const std::string& path, const std::vector<EcoChange>& changes, const std::string& program, const std::string& file);

}  // namespace xr::io
