#include "topo/Chains.h"

#include <algorithm>
#include <cstdlib>
#include <map>
#include <print>
#include <set>
#include <tuple>

#include "core/Edit.h"
#include "core/Prof.h"

namespace xr::topo {

void effectiveWidths(const Board& b, WireGraph& g, const OwnCopper& copper) {
  const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr;
  // What a vertex is: a node (own copper, a branch, a free end) or a point in series.
  std::vector<int> degree(size_t(g.count), 0);
  std::vector<char> node(size_t(g.count), 0), inCopper(size_t(g.count), 0);
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!g.relevant[i] || g.tiny[i]) continue;
    const Track& t = b.tracks[i];
    for (int e = 0; e < 2; ++e) {
      int v = g.vid[i][e];
      ++degree[size_t(v)];
      if (copper.touches(e ? t.b : t.a, t.net, t.layer)) node[size_t(v)] = inCopper[size_t(v)] = 1;
      if (t.locked) node[size_t(v)] = 1;
    }
  }
  for (int v = 0; v < g.count; ++v)
    if (degree[size_t(v)] != 2) node[size_t(v)] = 1;
  auto otherAt = [&](int v, int ti) {
    for (int j : g.ends[size_t(v)])
      if (j != ti && !g.tiny[j]) return j;
    return -1;
  };
  for (int pass = 0; pass < 4; ++pass) {
    bool changed = false;
    std::vector<char> seen(b.tracks.size(), 0);
    for (size_t i0 = 0; i0 < b.tracks.size(); ++i0) {
      if (!g.relevant[i0] || g.tiny[i0] || seen[i0] || b.tracks[i0].locked) continue;
      // The run of this width through the points in series.
      const Coord w = g.width[i0];
      std::vector<int> run{int(i0)};
      seen[i0] = 1;
      int endV[2], beyond[2];  // the run's end vertices and the tracks beyond them (-1 at a node)
      for (int dir = 0; dir < 2; ++dir) {
        int ti = int(i0), v = g.vid[i0][dir];
        while (true) {
          endV[dir] = v;
          beyond[dir] = -1;
          if (node[size_t(v)]) break;
          int o = otherAt(v, ti);
          if (o < 0) break;
          if (g.width[size_t(o)] != w || b.tracks[size_t(o)].locked || seen[size_t(o)]) {
            beyond[dir] = o;
            break;
          }
          seen[size_t(o)] = 1;
          run.push_back(o);
          v = g.vid[size_t(o)][0] == v ? g.vid[size_t(o)][1] : g.vid[size_t(o)][0];
          ti = o;
        }
      }
      if (endV[0] == endV[1]) continue;  // a loop
      double len = 0;
      for (int ti : run) len += b.tracks[size_t(ti)].length();
      const Coord w0 = beyond[0] >= 0 ? g.width[size_t(beyond[0])] : 0, w1 = beyond[1] >= 0 ? g.width[size_t(beyond[1])] : 0;
      Coord to = w;
      if (w0 > w && w1 == w0) {
        to = w0;  // a neck of the wider wire
      } else if (len <= kStubAbsorb * double(w)) {
        const bool thin0 = w0 > 0 && w0 < w, thin1 = w1 > 0 && w1 < w;
        // A stub at a node (a pad, a via, a branch: not a free end), or a bulge between two thinner runs.
        auto real = [&](int v) { return degree[size_t(v)] != 1 || inCopper[size_t(v)]; };
        if (thin0 && thin1) to = std::min(w0, w1);
        else if (thin0 && beyond[1] < 0 && real(endV[1])) to = w0;
        else if (thin1 && beyond[0] < 0 && real(endV[0])) to = w1;
      }
      if (debug && (w0 > 0 || w1 > 0)) {
        const Track& t = b.tracks[run.front()];
        std::println(stderr, "run net {} L{} w{:.3f} len {:.3f} mm near ({:.3f},{:.3f}): beyond {:.3f} / {:.3f}, ends {} / {} -> {:.3f}", b.nets[t.net].name,
                     int(t.layer), w / 1e6, len / 1e6, t.a.x / 1e6, t.a.y / 1e6, w0 / 1e6, w1 / 1e6, degree[size_t(endV[0])], degree[size_t(endV[1])], to / 1e6);
      }
      if (to != w) {
        for (int ti : run) g.width[size_t(ti)] = to;
        changed = true;
      }
    }
    if (!changed) break;
  }
}

namespace {

// Track j goes on the chain of track i. A width change ends the chain too: a 0.8 mm bus and its 0.3 mm
// branch to a pad are two wires (one wire took the bus width all the way to the pad: 0.1 mm from the
// neighbouring pads).
bool sameChain(const Board& b, const WireGraph& g, int i, int j) {
  return b.tracks[i].net == b.tracks[j].net && b.tracks[i].layer == b.tracks[j].layer && !b.tracks[j].locked && g.width[i] == g.width[j];
}

}  // namespace

void growChains(const Board& b, std::vector<char>& chosen, const WireGraph& g) {
  std::vector<int> stack;
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (chosen[i] && !g.relevant[i]) chosen[i] = 0;  // a pair's conductor: no chain of its own
    if (chosen[i]) stack.push_back(int(i));
  }
  while (!stack.empty()) {
    int i = stack.back();
    stack.pop_back();
    for (int v : g.vid[i])
      for (int j : g.ends[v])
        if (!chosen[j] && sameChain(b, g, i, j)) {
          chosen[j] = 1;
          stack.push_back(j);
        }
  }
}

std::vector<char> growChains(const Board& b, std::vector<char> chosen, double glue) {
  chosen.resize(b.tracks.size(), 0);
  growChains(b, chosen, wireGraph(b, chosen, glue));
  return chosen;
}

std::vector<WireChain> wireChains(const Board& b, const WireGraph& g, const std::vector<char>& chosen,
                                  const OwnCopper& copper) {
  std::vector<WireChain> out;
  auto onCopper = [&](Point p, int ti) { return copper.touches(p, b.tracks[size_t(ti)].net, b.tracks[size_t(ti)].layer); };
  for (const Chain& c : walkChains(b, g, chosen, onCopper, [&](int i, int j) { return sameChain(b, g, i, j); })) {
    WireChain w;
    const Track& t0 = b.tracks[size_t(c.steps.front().track)];
    w.net = t0.net;
    w.layer = t0.layer;
    w.width = g.width[size_t(c.steps.front().track)];
    w.closed = c.closed;
    w.vertex[0] = c.vertex[0];
    w.vertex[1] = c.vertex[1];
    w.path.push_back((c.steps.front().reversed ? t0.b : t0.a).v());
    for (const ChainStep& s : c.steps) {
      w.tracks.push_back(s.track);
      if (s.inner) continue;
      const Track& t = b.tracks[size_t(s.track)];
      // The glued ends may differ by a few um: the sketch continues from the next track's own end.
      const Point from = s.reversed ? t.b : t.a;
      if (&s != &c.steps.front() && w.path.back() != from.v()) w.path.push_back(from.v());
      if (t.isArc()) {
        auto pts = t.path(20000);
        if (s.reversed) r::reverse(pts);
        for (size_t k = 1; k + 1 < pts.size(); ++k) w.path.push_back(pts[k]);
      }
      const Point next = s.reversed ? t.a : t.b;
      if (w.path.back() != next.v()) w.path.push_back(next.v());
    }
    out.push_back(std::move(w));
  }
  return out;
}

namespace {

// A proper crossing of two paths: at segment ia of the first and ib of the second, the parameters along each.
struct PathCross {
  double ta, tb;  // segment index + fraction along it
  Vec2 p;
};

std::vector<PathCross> crossingsOf(const Polyline& A, const Polyline& B, const std::vector<BBox>& segA, const std::vector<BBox>& segB) {
  std::vector<PathCross> out;
  constexpr double kEnd = 1e-9;
  for (size_t i = 0; i + 1 < A.size(); ++i)
    for (size_t j = 0; j + 1 < B.size(); ++j) {
      if (!segA[i].intersects(segB[j])) continue;
      const Vec2 a0 = A[i], a1 = A[i + 1], b0 = B[j], b1 = B[j + 1];
      const double den = (a1 - a0).cross(b1 - b0);
      if (std::abs(den) < 1e-6) continue;  // parallel: no crossing to speak of
      const double s = (b0 - a0).cross(b1 - b0) / den, u = (b0 - a0).cross(a1 - a0) / den;
      // Half open at the far ends: a crossing at a joint of segments counted once.
      if (s < -kEnd || s >= 1 - kEnd || u < -kEnd || u >= 1 - kEnd) continue;
      // At the paths' own ends (a pad's centre, a branch point both reach) it is no crossing; nor at a vertex both
      // have (where two wires taken apart touch: counted, they were swapped back and forth).
      if ((i == 0 && s <= kEnd) || (j == 0 && u <= kEnd) || (s <= kEnd && u <= kEnd)) continue;
      out.push_back({double(i) + std::max(0.0, s), double(j) + std::max(0.0, u), a0 + (a1 - a0) * std::max(0.0, s)});
    }
  r::sort(out, {}, &PathCross::ta);
  return out;
}

std::vector<BBox> segmentBoxes(const Polyline& p) {
  std::vector<BBox> out;
  for (size_t i = 0; i + 1 < p.size(); ++i) {
    BBox b;
    b.add(p[i]);
    b.add(p[i + 1]);
    out.push_back(b);
  }
  return out;
}

// The points of `p` strictly between the parameters t0 < t1 (segment index + fraction), in order.
std::vector<Vec2> between(const Polyline& p, double t0, double t1) {
  std::vector<Vec2> out;
  for (size_t k = size_t(std::floor(t0)) + 1; double(k) <= t1 && k < p.size(); ++k)
    if (double(k) > t0 && double(k) < t1) out.push_back(p[k]);
  return out;
}

}  // namespace

int untangleChains(std::vector<WireChain>& chains, const std::vector<char>& eligible) {
  int swaps = 0;
  for (int step = 0; step < 256; ++step) {
    std::vector<BBox> box(chains.size());
    for (size_t i = 0; i < chains.size(); ++i)
      for (Vec2 q : chains[i].path) box[i].add(q);
    bool swapped = false;
    for (size_t i = 0; i < chains.size() && !swapped; ++i) {
      if (!eligible[i]) continue;
      for (size_t j = i + 1; j < chains.size() && !swapped; ++j) {
        WireChain& A = chains[i];
        WireChain& B = chains[j];
        if (!eligible[j] || A.layer != B.layer || A.net == B.net || !box[i].intersects(box[j])) continue;
        const auto xs = crossingsOf(A.path, B.path, segmentBoxes(A.path), segmentBoxes(B.path));
        if (xs.size() < 2) continue;
        // Two crossings next to each other along both paths: the pieces between them make a lens.
        for (size_t k = 0; k + 1 < xs.size() && !swapped; ++k) {
          const PathCross& p1 = xs[k];
          const PathCross& p2 = xs[k + 1];
          const double lo = std::min(p1.tb, p2.tb), hi = std::max(p1.tb, p2.tb);
          if (r::any_of(xs, [&](const PathCross& x) { return x.tb > lo && x.tb < hi; })) continue;
          // A's piece P1 -> P2; B's between the two, in B's order.
          const std::vector<Vec2> aMid = between(A.path, p1.ta, p2.ta);
          std::vector<Vec2> bMid = between(B.path, lo, hi);
          const bool bForward = p1.tb < p2.tb;  // B meets P1 first
          if (!bForward) r::reverse(bMid);       // now P1 -> P2 as well
          Polyline na(A.path.begin(), A.path.begin() + long(std::floor(p1.ta)) + 1);
          na.push_back(p1.p);
          na.insert(na.end(), bMid.begin(), bMid.end());
          na.push_back(p2.p);
          na.insert(na.end(), A.path.begin() + long(std::floor(p2.ta)) + 1, A.path.end());
          Polyline nb(B.path.begin(), B.path.begin() + long(std::floor(lo)) + 1);
          std::vector<Vec2> aIn = aMid;  // A's piece in B's order
          if (bForward) {
            nb.push_back(p1.p);
            nb.insert(nb.end(), aIn.begin(), aIn.end());
            nb.push_back(p2.p);
          } else {
            r::reverse(aIn);
            nb.push_back(p2.p);
            nb.insert(nb.end(), aIn.begin(), aIn.end());
            nb.push_back(p1.p);
          }
          nb.insert(nb.end(), B.path.begin() + long(std::floor(hi)) + 1, B.path.end());
          auto tidy = [](Polyline& p) { p.erase(std::unique(p.begin(), p.end(), [](Vec2 x, Vec2 y) { return (x - y).len2() < 1; }), p.end()); };
          tidy(na);
          tidy(nb);
          A.path = std::move(na);
          B.path = std::move(nb);
          A.rerouted = B.rerouted = true;
          ++swaps;
          swapped = true;
        }
      }
    }
    if (!swapped) break;
  }
  return swaps;
}

}  // namespace xr::topo
