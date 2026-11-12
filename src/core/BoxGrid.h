#pragma once
// Boxes in a grid of cells, for «which of them meet this box»: the answer by ascending number, so that what is
// done with it does not depend on how the grid lies. Built once from boxes that are at hand (the DRC has every
// item's shapes and their boxes before it asks) — no tree to balance, no box made again from an item's shapes;
// a query reads the cells its box covers and a short list of the boxes too large for the cells.
#include <algorithm>
#include <cmath>
#include <vector>

#include "geom/Geometry.h"

namespace xr {

class BoxGrid {
 public:
  void build(std::vector<BBox> boxes) {
    boxes_ = std::move(boxes);
    BBox all;
    size_t n = 0;
    for (const BBox& bx : boxes_)
      if (bx.valid()) all.add(bx), ++n;
    start_.clear();
    items_.clear();
    large_.clear();
    nx_ = ny_ = 0;
    if (n == 0) return;
    x0_ = all.minX;
    y0_ = all.minY;
    const double w = std::max(all.width(), 1.0), h = std::max(all.height(), 1.0);
    cell_ = std::max(std::sqrt(w * h * 2 / double(n)), 100000.0);  // about two boxes a cell, no finer than 0.1 mm
    nx_ = std::clamp(int(w / cell_) + 1, 1, 2048);
    ny_ = std::clamp(int(h / cell_) + 1, 1, 2048);
    cell_ = std::max(w / nx_, h / ny_) * (1 + 1e-9);
    start_.assign(size_t(nx_) * size_t(ny_) + 1, 0);
    auto each = [&](auto&& fn) {
      for (int i = 0; i < int(boxes_.size()); ++i) {
        const BBox& bx = boxes_[size_t(i)];
        if (!bx.valid()) continue;
        const int cx0 = col(bx.minX), cx1 = col(bx.maxX), cy0 = row(bx.minY), cy1 = row(bx.maxY);
        if ((cx1 - cx0 + 1) * (cy1 - cy0 + 1) > kLarge) {
          fn(size_t(-1), i);
          continue;
        }
        for (int y = cy0; y <= cy1; ++y)
          for (int x = cx0; x <= cx1; ++x) fn(size_t(y) * size_t(nx_) + size_t(x), i);
      }
    };
    each([&](size_t c, int i) {
      if (c == size_t(-1)) large_.push_back(i);
      else ++start_[c + 1];
    });
    for (size_t c = 1; c < start_.size(); ++c) start_[c] += start_[c - 1];
    items_.resize(size_t(start_.back()));
    std::vector<int> at(start_.begin(), start_.end() - 1);
    each([&](size_t c, int i) {
      if (c != size_t(-1)) items_[size_t(at[c]++)] = i;
    });
  }

  // The boxes meeting `q`, by ascending number, into `out` (cleared first).
  void query(const BBox& q, std::vector<int>& out) const {
    out.clear();
    if (nx_ == 0 || !q.valid()) return;
    auto take = [&](int i) {
      const BBox& bx = boxes_[size_t(i)];
      if (bx.minX <= q.maxX && q.minX <= bx.maxX && bx.minY <= q.maxY && q.minY <= bx.maxY) out.push_back(i);
    };
    const int cx0 = col(q.minX), cx1 = col(q.maxX), cy0 = row(q.minY), cy1 = row(q.maxY);
    for (int y = cy0; y <= cy1; ++y)
      for (int x = cx0; x <= cx1; ++x) {
        const size_t c = size_t(y) * size_t(nx_) + size_t(x);
        for (int k = start_[c]; k < start_[c + 1]; ++k) take(items_[size_t(k)]);
      }
    for (int i : large_) take(i);
    std::sort(out.begin(), out.end());
    out.erase(std::unique(out.begin(), out.end()), out.end());
  }

 private:
  static constexpr int kLarge = 256;  // a box over more cells than this is kept in the list of the large
  int col(double x) const { return std::clamp(int(std::floor((x - x0_) / cell_)), 0, nx_ - 1); }
  int row(double y) const { return std::clamp(int(std::floor((y - y0_) / cell_)), 0, ny_ - 1); }
  std::vector<BBox> boxes_;
  double x0_ = 0, y0_ = 0, cell_ = 1;
  int nx_ = 0, ny_ = 0;
  std::vector<int> start_, items_, large_;
};

}  // namespace xr
