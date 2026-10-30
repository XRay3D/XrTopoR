#pragma once
// A bounded parallel loop: `fn(i)` for i in [0, n) on as many threads as there are cores (env
// XR_THREADS caps it; 1 runs in place). Work items are pulled from a counter, so uneven ones balance.
#include <algorithm>
#include <atomic>
#include <cstdlib>
#include <functional>
#include <thread>
#include <vector>

namespace xr {

inline int parallelThreads() {
  static const int v = [] {
    int n = int(std::thread::hardware_concurrency());
    if (const char* e = std::getenv("XR_THREADS")) n = std::atoi(e);
    return std::max(1, n);
  }();
  return v;
}

template <class Fn>
void parallelFor(size_t n, Fn&& fn) {
  int threads = std::min<int>(parallelThreads(), int(n));
  if (threads <= 1) {
    for (size_t i = 0; i < n; ++i) fn(i);
    return;
  }
  std::atomic<size_t> next{0};
  std::vector<std::thread> pool;
  for (int t = 0; t < threads; ++t)
    pool.emplace_back([&] {
      for (size_t i = next.fetch_add(1); i < n; i = next.fetch_add(1)) fn(i);
    });
  for (auto& th : pool) th.join();
}

}  // namespace xr
