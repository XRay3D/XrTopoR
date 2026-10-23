#pragma once
#include <memory>
#include <string>

#include "core/Board.h"

namespace xr::io {

enum class Format { Unknown, Kicad, Dsn, Ses, Pcad };

Format detectFormat(const std::string& path);
std::string readFile(const std::string& path, std::string* err = nullptr);
bool writeFile(const std::string& path, const std::string& data, std::string* err = nullptr);

// Loads .kicad_pcb, .dsn or P-CAD ASCII .pcb.
std::unique_ptr<Board> loadBoard(const std::string& path, std::string* err = nullptr);
// Saves by extension: .kicad_pcb, .dsn, .ses.
bool saveBoard(const Board& b, const std::string& path, std::string* err = nullptr);

// Format-specific entry points
std::unique_ptr<Board> readKicad(const std::string& text, const std::string& path, std::string* err);
std::string writeKicad(const Board& b);
std::unique_ptr<Board> readDsn(const std::string& text, const std::string& path, std::string* err);
std::string writeDsn(const Board& b);
std::string writeSes(const Board& b);
// Applies routing (wires, vias) from a session file to the board. Replaces existing routing.
bool applySes(Board& b, const std::string& text, std::string* err);
std::unique_ptr<Board> readPcad(const std::string& text, const std::string& path, std::string* err);

// Builds closed outline contours from Edge-layer graphics.
void buildOutline(Board& b, LayerId edgeLayer);

}  // namespace xr::io
