#pragma once
// The model saved next to the board (<board>.xrtopo): the owners, the meshes with their crossing lists,
// the wires with the tracks they are drawn as (by content, the board's files carry no ids), under a hash
// of the board's copper. A board that does not hash the same has been edited elsewhere: the file is
// stale and the model is built from the tracks again.
#include <cstdint>
#include <expected>
#include <string>

#include "topo/Topology.h"

namespace xr::topo {

// FNV-1a over what the model depends on: the nets, the pads, the vias, the tracks, the outline, the
// keepouts, the rules.
// places false: without the pads' positions, the vias and the tracks (what the live model follows an edit of).
uint64_t boardHashOf(const Board& b, bool places = true);

std::string sidecarPath(const std::string& boardPath);

// Writes the model (its boardHash is set from the board here).
std::expected<void, std::string> saveTopology(Topology& t, const Board& b, const std::string& path);
// Reads the model for this board (whose tracks and vias have their ids): an error when the file is
// missing, unreadable, of another version, or stale.
std::expected<Topology, std::string> loadTopology(const Board& b, const std::string& path);

}  // namespace xr::topo
