#pragma once
// A bounded parallel loop: `fn(i)` for i in [0, n) on as many threads as there are cores (env
// XR_THREADS caps it; 1 runs in place). Work items are pulled from a counter, so uneven ones balance.
//
// The threads are a pool that lives with the program: they wait for a loop and go back to waiting. (A loop
// started its own threads and joined them: a millisecond for sixteen, and the loops of a drawing — the layers of
// a round, the shapes of a check — are shorter than that. With all the cores F7 ran no faster than with one.)
// One loop at a time has the pool; a loop asked for while another runs — from inside it, or from another thread —
// runs in place.
#include <algorithm>
#include <atomic>
#include <condition_variable>
#include <cstdlib>
#include <functional>
#include <mutex>
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

// Whether this thread runs inside a parallelFor: a loop nested in one runs in place.
inline bool& inParallel() {
  thread_local bool v = false;
  return v;
}

namespace detail {

class ThreadPool {
 public:
  static ThreadPool& get() {
    static ThreadPool pool;
    return pool;
  }
  // Runs `run()` on up to `helpers` threads of the pool and on the caller's; false when the pool is taken.
  bool with(int helpers, const std::function<void()>& run) {
    bool free = false;
    if (!busy_.compare_exchange_strong(free, true)) return false;
    {
      std::lock_guard lock(m_);
      while (int(workers_.size()) < helpers && int(workers_.size()) < parallelThreads() - 1) workers_.emplace_back([this] { work(); });
      job_ = &run;
      slots_ = std::min(helpers, int(workers_.size()));
    }
    for (int i = 0; i < helpers; ++i) wake_.notify_one();
    run();
    {
      std::unique_lock lock(m_);
      job_ = nullptr;  // nobody else comes in
      slots_ = 0;
      idle_.wait(lock, [&] { return active_ == 0; });
    }
    busy_ = false;
    return true;
  }

 private:
  ThreadPool() = default;
  ~ThreadPool() {
    {
      std::lock_guard lock(m_);
      stop_ = true;
    }
    wake_.notify_all();
    for (std::thread& t : workers_) t.join();
  }
  void work() {
    inParallel() = true;
    std::unique_lock lock(m_);
    while (true) {
      wake_.wait(lock, [&] { return stop_ || (job_ && slots_ > 0); });
      if (stop_) return;
      --slots_;
      ++active_;
      const std::function<void()>* job = job_;
      lock.unlock();
      (*job)();
      lock.lock();
      if (--active_ == 0) idle_.notify_all();
    }
  }

  std::mutex m_;
  std::condition_variable wake_, idle_;
  std::vector<std::thread> workers_;
  const std::function<void()>* job_ = nullptr;
  int slots_ = 0, active_ = 0;
  bool stop_ = false;
  std::atomic<bool> busy_{false};
};

}  // namespace detail

template <class Fn>
void parallelFor(size_t n, Fn&& fn) {
  int threads = std::min<int>(parallelThreads(), int(n));
  if (threads <= 1 || inParallel()) {
    for (size_t i = 0; i < n; ++i) fn(i);
    return;
  }
  std::atomic<size_t> next{0};
  const std::function<void()> run = [&] {
    for (size_t i = next.fetch_add(1); i < n; i = next.fetch_add(1)) fn(i);
  };
  inParallel() = true;  // (the caller's share of it: a loop nested in `fn` runs in place)
  const bool ran = detail::ThreadPool::get().with(threads - 1, run);
  if (!ran) run();
  inParallel() = false;
}

}  // namespace xr
