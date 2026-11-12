#include "geom/PolyIndex.h"

#include <algorithm>
#include <cmath>

namespace xr {

PolyIndex::PolyIndex(Polyline poly) : poly_(std::move(poly)) {
  for (Vec2 p : poly_) box_.add(p);
  const size_t n = poly_.size();
  if (n == 0) return;
  // About one side to a cell.
  const double w = std::max(box_.width(), 1.0), h = std::max(box_.height(), 1.0);
  cell_ = std::max(std::sqrt(w * h / double(n)), 1.0);
  nx_ = std::clamp(int(std::ceil(w / cell_)), 1, 4096);
  ny_ = std::clamp(int(std::ceil(h / cell_)), 1, 4096);
  cell_ = std::max(w / nx_, h / ny_);
  auto col = [&](double x) { return std::clamp(int(std::floor((x - box_.minX) / cell_)), 0, nx_ - 1); };
  auto row = [&](double y) { return std::clamp(int(std::floor((y - box_.minY) / cell_)), 0, ny_ - 1); };
  // Two passes: the counts, then the lists.
  cellStart_.assign(size_t(nx_) * size_t(ny_) + 1, 0);
  rowStart_.assign(size_t(ny_) + 1, 0);
  auto each = [&](auto&& cellFn, auto&& rowFn) {
    for (size_t i = 0, j = n - 1; i < n; j = i++) {
      const Vec2 a = poly_[j], b = poly_[i];
      const int x0 = col(std::min(a.x, b.x)), x1 = col(std::max(a.x, b.x));
      const int y0 = row(std::min(a.y, b.y)), y1 = row(std::max(a.y, b.y));
      for (int y = y0; y <= y1; ++y) {
        rowFn(y, int(i));
        for (int x = x0; x <= x1; ++x) cellFn(size_t(y) * size_t(nx_) + size_t(x), int(i));
      }
    }
  };
  each([&](size_t c, int) { ++cellStart_[c + 1]; }, [&](int y, int) { ++rowStart_[size_t(y) + 1]; });
  for (size_t c = 1; c < cellStart_.size(); ++c) cellStart_[c] += cellStart_[c - 1];
  for (size_t y = 1; y < rowStart_.size(); ++y) rowStart_[y] += rowStart_[y - 1];
  cellSides_.resize(size_t(cellStart_.back()));
  rowSides_.resize(size_t(rowStart_.back()));
  std::vector<int> cellAt(cellStart_.begin(), cellStart_.end() - 1), rowAt(rowStart_.begin(), rowStart_.end() - 1);
  each([&](size_t c, int i) { cellSides_[size_t(cellAt[c]++)] = i; }, [&](int y, int i) { rowSides_[size_t(rowAt[size_t(y)]++)] = i; });
}

bool PolyIndex::contains(Vec2 p) const {
  const size_t n = poly_.size();
  if (n < 3 || p.y < box_.minY || p.y > box_.maxY || p.x > box_.maxX) return false;
  // The sides the ray along +x from p can cross lie in p's row; the rule is pointInPolygon's.
  const int y = std::clamp(int(std::floor((p.y - box_.minY) / cell_)), 0, ny_ - 1);
  bool in = false;
  for (int k = rowStart_[size_t(y)]; k < rowStart_[size_t(y) + 1]; ++k) {
    const size_t i = size_t(rowSides_[size_t(k)]), j = i ? i - 1 : n - 1;
    const Vec2& a = poly_[i];
    const Vec2& b = poly_[j];
    if ((a.y > p.y) != (b.y > p.y)) {
      double x = (b.x - a.x) * (p.y - a.y) / (b.y - a.y) + a.x;
      if (p.x < x) in = !in;
    }
  }
  return in;
}

// The least of toSide(i) over the sides. The cells touching the query's box grown by R are looked at; a side
// nearer than R to the query touches that block, so once the least found is within R it is the least of all.
// R grows to the least found (or doubles while nothing is found) until then, or to the cutoff, or to the whole grid.
template <class F>
double PolyIndex::nearest(const BBox& q, double cutoff, F&& toSide) const {
  double best = std::numeric_limits<double>::max();
  if (poly_.empty()) return best;
  double R = std::min(cutoff, cell_);
  int px0 = 0, py0 = 0, px1 = -1, py1 = -1;  // the block looked at so far (none)
  while (true) {
    const int x0 = std::clamp(int(std::floor((q.minX - R - box_.minX) / cell_)), 0, nx_ - 1);
    const int x1 = std::clamp(int(std::floor((q.maxX + R - box_.minX) / cell_)), 0, nx_ - 1);
    const int y0 = std::clamp(int(std::floor((q.minY - R - box_.minY) / cell_)), 0, ny_ - 1);
    const int y1 = std::clamp(int(std::floor((q.maxY + R - box_.minY) / cell_)), 0, ny_ - 1);
    for (int y = y0; y <= y1; ++y)
      for (int x = x0; x <= x1; ++x) {
        if (x >= px0 && x <= px1 && y >= py0 && y <= py1) continue;
        const size_t c = size_t(y) * size_t(nx_) + size_t(x);
        for (int k = cellStart_[c]; k < cellStart_[c + 1]; ++k) best = std::min(best, toSide(size_t(cellSides_[size_t(k)])));
      }
    px0 = x0, px1 = x1, py0 = y0, py1 = y1;
    if (best <= R || R >= cutoff) break;
    if (x0 == 0 && y0 == 0 && x1 == nx_ - 1 && y1 == ny_ - 1) break;
    R = std::min(cutoff, std::max(2 * R, best < std::numeric_limits<double>::max() ? best : 0.0));
  }
  return best;
}

double PolyIndex::distPoint(Vec2 p, double cutoff) const {
  BBox q;
  q.add(p);
  const size_t n = poly_.size();
  return nearest(q, cutoff, [&](size_t i) { return distPointSegment(p, poly_[i ? i - 1 : n - 1], poly_[i]); });
}

double PolyIndex::distSegment(Vec2 a, Vec2 b, double cutoff) const {
  BBox q;
  q.add(a);
  q.add(b);
  const size_t n = poly_.size();
  return nearest(q, cutoff, [&](size_t i) { return distSegmentSegment(a, b, poly_[i ? i - 1 : n - 1], poly_[i]); });
}

}  // namespace xr
