#pragma once
#include <string>
#include <vector>

#include "core/Board.h"

namespace xr::io {

struct GerberOptions {
  Coord maskExpansion = mmToNm(0.05);
  bool silk = true;
  bool mask = true;
  bool paste = true;
};

struct GerberFile {
  std::string name;  // file name relative to output dir
  std::string content;
};

// Generates copper, mask, paste, silk, outline Gerbers and PTH/NPTH Excellon drill files.
std::vector<GerberFile> makeGerbers(const Board& b, const GerberOptions& opt = {});
// Writes all files into dir (created if needed). Returns false on error.
bool writeGerbers(const Board& b, const std::string& dir, const GerberOptions& opt = {}, std::string* err = nullptr);

}  // namespace xr::io
