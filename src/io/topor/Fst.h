#pragma once
// TopoR PCB file format 1.2.0 (.fst): UTF-8 XML, coordinates in mm (or mil), Y axis up.
#include <string>

#include "io/BoardIO.h"

namespace xr::io {

Result<BoardPtr> readFst(const std::string& text, const std::string& path);
std::string writeFst(const Board& b);

}  // namespace xr::io
