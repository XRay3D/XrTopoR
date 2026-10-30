#pragma once
// Wall-clock buckets for finding where the time goes (env XR_PROF=1 prints them at the report call).
#include <chrono>
#include <cstdlib>
#include <map>
#include <mutex>
#include <print>
#include <string>

namespace xr {

struct Prof {
  struct Bucket { double ns = 0; long calls = 0; };
  static Prof& get() {
    static Prof p;
    return p;
  }
  static bool on() {
    static const bool v = std::getenv("XR_PROF") != nullptr;
    return v;
  }
  void add(const char* name, double ns) {
    std::lock_guard lk(m);
    auto& b = buckets[name];
    b.ns += ns;
    b.calls++;
  }
  void report(const char* title) {
    if (!on()) return;
    std::lock_guard lk(m);
    std::println(stderr, "-- {} --", title);
    for (auto& [n, b] : buckets) std::println(stderr, "  {:<28} {:9.3f} s  {:8} calls  {:8.3f} ms each", n, b.ns / 1e9, b.calls, b.ns / 1e6 / std::max(1L, b.calls));
    buckets.clear();
  }
  std::mutex m;
  std::map<std::string, Bucket> buckets;
};

struct ProfScope {
  const char* name;
  std::chrono::steady_clock::time_point t0;
  explicit ProfScope(const char* n) : name(n), t0(Prof::on() ? std::chrono::steady_clock::now() : std::chrono::steady_clock::time_point{}) {}
  ~ProfScope() {
    if (Prof::on()) Prof::get().add(name, double(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::steady_clock::now() - t0).count()));
  }
};

}  // namespace xr
