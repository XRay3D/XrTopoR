#pragma once
#include <expected>
#include <memory>
#include <string>

#include "core/Board.h"

namespace xr::io {

enum class Format { Unknown, Kicad, Dsn, Ses, Pcad, Fst };

template <class T>
using Result = std::expected<T, std::string>;  // error = human readable message
using BoardPtr = std::unique_ptr<Board>;

Format detectFormat(const std::string& path);
Result<std::string> readFile(const std::string& path);
Result<void> writeFile(const std::string& path, const std::string& data);

// Loads .kicad_pcb, .dsn, P-CAD ASCII .pcb or TopoR .fst.
Result<BoardPtr> loadBoard(const std::string& path);
// Saves by extension: .kicad_pcb, .dsn, .ses, .fst.
Result<void> saveBoard(const Board& b, const std::string& path);

// Format-specific entry points
Result<BoardPtr> readKicad(const std::string& text, const std::string& path);
std::string writeKicad(const Board& b);
// JSON project file (net classes) matching a generated .kicad_pcb.
std::string writeKicadProject(const Board& b);
Result<BoardPtr> readDsn(const std::string& text, const std::string& path);
std::string writeDsn(const Board& b);
std::string writeSes(const Board& b);
// Applies routing (wires, vias) from a session file to the board. Replaces existing routing.
Result<void> applySes(Board& b, const std::string& text);
Result<BoardPtr> readPcad(const std::string& text, const std::string& path);
// Patches the P-CAD ASCII source of the board (placement, routing, vias).
Result<std::string> writePcad(const Board& b);
// TopoR PCB 1.2.0 XML (.fst); see io/topor/Fst.h.
Result<BoardPtr> readFst(const std::string& text, const std::string& path);
std::string writeFst(const Board& b);

// Builds closed outline contours from Edge-layer graphics.
void buildOutline(Board& b, LayerId edgeLayer);

}  // namespace xr::io
