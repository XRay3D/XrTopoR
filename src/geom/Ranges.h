#pragma once
// Short names for the standard ranges, used throughout the code: r::find, r::sort, r::to, v::reverse,
// v::enumerate. A variable named r or v does not hide them: the name before :: is looked up among namespaces
// and types only. The algorithms take projections where they fit: a member pointer, a function, of() for
// indices — r::sort(order, std::greater{}, strength), r::find(b.pads, round, &Pad::padstack),
// r::any_of(f.tracks, &Track::locked, of(b.tracks)).
#include <algorithm>
#include <cstddef>
#include <numeric>
#include <ranges>

namespace xr {

namespace r = std::ranges;
namespace v = std::views;

// A projection from an index into `c` to its element.
template <class C>
constexpr auto of(C& c) {
  return [&c](auto i) -> decltype(auto) { return c[static_cast<std::size_t>(i)]; };
}

}  // namespace xr
