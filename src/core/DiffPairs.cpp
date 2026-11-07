#include "core/DiffPairs.h"

#include <algorithm>
#include <cmath>
#include <set>

#include "core/Edit.h"

namespace xr {

namespace {

// The direction of travel of a piece at p (on it).
Vec2 tangentAt(const Track& t, Vec2 p) {
  if (t.mid) {
    const ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
    if (g.valid) {
      const Vec2 rad = (p - g.center).normalized();
      return g.sweep > 0 ? rad.perp() : rad.perp() * -1.0;
    }
  }
  return (t.b.v() - t.a.v()).normalized();
}

}  // namespace

std::vector<Track> offsetRun(const std::vector<Track>& in, double d, double maxJoin) {
  std::vector<Track> run;
  std::vector<char> gapBefore;
  bool gap = false;
  for (const Track& a : in) {
    Track t = a;
    t.a = Point(a.a.v() + tangentAt(a, a.a.v()).perp() * d);
    t.b = Point(a.b.v() + tangentAt(a, a.b.v()).perp() * d);
    t.mid.reset();
    if (a.mid) {
      const ArcGeom g = ArcGeom::fromThreePoints(a.a.v(), a.mid->v(), a.b.v());
      const Vec2 m = a.mid->v() + tangentAt(a, a.mid->v()).perp() * d;
      const bool flipped = !g.valid || (m - g.center).dot(a.mid->v() - g.center) <= 0 || (m - g.center).len() < 1000;
      if (flipped) {
        gap = true;
        continue;
      }
      if ((t.b.v() - t.a.v()).len() > 2000) t.mid = Point(m);  // (a chord of a micron or two: a line)
    }
    if (t.a == t.b) continue;
    run.push_back(t);
    gapBefore.push_back(gap);
    gap = false;
  }
  for (size_t k = 1; k < run.size(); ++k) {
    if (!gapBefore[k] && run[k - 1].b == run[k].a) continue;
    Track& p0 = run[k - 1];
    Track& p1 = run[k];
    if ((p0.b.v() - p1.a.v()).len() < 2000) {  // one point, on the line's side
      if (!p1.mid) p1.a = p0.b;
      else p0.b = p1.a;
      continue;
    }
    if (!p0.mid && !p1.mid) {  // two lines: to where they cross, near the corner
      const Vec2 A = p0.a.v(), B = p0.b.v(), C = p1.a.v(), D = p1.b.v();
      const double den = (B - A).cross(D - C);
      if (std::abs(den) > 1e-9) {
        const double u = (C - A).cross(D - C) / den;
        const Vec2 X = A + (B - A) * u;
        if (u > 0 && (X - B).len() < maxJoin && (X - C).len() < maxJoin) {
          p0.b = Point(X);
          p1.a = Point(X);
          continue;
        }
      }
    }
    Track j = p0;  // else joined by a straight piece
    j.mid.reset();
    j.a = p0.b;
    j.b = p1.a;
    run.insert(run.begin() + long(k), j);
    gapBefore.insert(gapBefore.begin() + long(k), 0);
    ++k;
  }
  std::erase_if(run, [](const Track& t) { return t.a == t.b; });
  return run;
}

void unzip(Board& b, int zip) { b.removeZip(zip); }

void swapZipNets(Board& b, int zip) {
  if (zip < 0 || zip >= int(b.zips.size())) return;
  ZippedWire& z = b.zips[size_t(zip)];
  if (z.axis.empty()) return;
  // The conductors' ends at each end of the section, per net, before the swap.
  const Vec2 ends[2] = {z.axis.front().a.v(), z.axis.back().b.v()};
  auto endOf = [&](int net, Vec2 at) {
    Vec2 best = at;
    double bd = 1e300;
    for (const Track& t : b.tracks)
      if (t.zip == zip && t.net == net)
        for (Vec2 q : {t.a.v(), t.b.v()})
          if (double dd = (q - at).len(); dd < bd) bd = dd, best = q;
    return best;
  };
  Vec2 pEnd[2], nEnd[2];
  for (int e = 0; e < 2; ++e) {
    pEnd[e] = endOf(z.netP, ends[e]);
    nEnd[e] = endOf(z.netN, ends[e]);
  }
  for (Track& t : b.tracks) {
    if (t.zip == zip) {
      t.net = t.net == z.netP ? z.netN : t.net == z.netN ? z.netP : t.net;
      continue;
    }
    if (t.layer != z.layer) continue;
    for (int e = 0; e < 2; ++e) {  // a single track at the section's end goes over to its net's conductor
      for (Point* q : {&t.a, &t.b}) {
        if (t.net == z.netP && (q->v() - pEnd[e]).len() <= edit::kJoinTol) *q = Point(nEnd[e]), t.edited = true;
        else if (t.net == z.netN && (q->v() - nEnd[e]).len() <= edit::kJoinTol) *q = Point(pEnd[e]), t.edited = true;
      }
    }
  }
  z.pSide = -z.pSide;
}

std::expected<int, std::string> zipTracks(Board& b, const std::vector<int>& sel) {
  if (sel.empty()) return std::unexpected(std::string("не выделены проводники"));
  const LayerId layer = b.tracks[size_t(sel.front())].layer;
  std::vector<int> nets;
  for (int i : sel) {
    const Track& t = b.tracks[size_t(i)];
    if (t.layer != layer) return std::unexpected(std::string("проводники должны быть на одном слое"));
    if (t.zip >= 0) return std::unexpected(std::string("проводник уже застёгнут"));
    if (!r::contains(nets, t.net)) nets.push_back(t.net);
  }
  if (nets.size() != 2) return std::unexpected(std::string("нужны проводники двух цепей"));
  const int pair = b.pairOfNet(nets[0]);
  if (pair < 0 || b.pairOfNet(nets[1]) != pair) return std::unexpected(std::string("цепи не входят в один дифференциальный сигнал"));
  Coord w = 0, gap = 0;
  if (!b.pairRule(pair, layer, w, gap)) return std::unexpected(std::string("нет правила волнового сопротивления пары на этом слое"));
  // The positive net: the one of the pair's first signal's cluster.
  int netP = nets[0];
  if (const SignalCluster* c = b.hispeed.clusterOf(b.hispeed.diffSignals[size_t(pair)].signalA))
    for (const std::string& n : c->nets)
      if (int ni = b.findNet(n); ni == nets[1]) netP = nets[1];
  const int netN = netP == nets[0] ? nets[1] : nets[0];
  // Each net's selected tracks as one ordered run.
  auto chain = [&](int net) -> std::expected<std::vector<Track>, std::string> {
    std::vector<Track> left;
    for (int i : sel)
      if (b.tracks[size_t(i)].net == net) left.push_back(b.tracks[size_t(i)]);
    for (const Track& t : left)
      if (std::llabs(t.width - w) > 1000) return std::unexpected(std::string("ширина проводника не по правилу волнового сопротивления"));
    std::vector<Track> run{left.front()};
    left.erase(left.begin());
    auto near = [](Vec2 p, Vec2 q) { return (p - q).len() <= edit::kJoinTol; };
    auto reversed = [](Track t) {
      std::swap(t.a, t.b);
      return t;
    };
    while (!left.empty()) {
      bool grown = false;
      for (size_t k = 0; k < left.size() && !grown; ++k) {
        const Track& t = left[k];
        if (near(t.a.v(), run.back().b.v())) run.push_back(t);
        else if (near(t.b.v(), run.back().b.v())) run.push_back(reversed(t));
        else if (near(t.b.v(), run.front().a.v())) run.insert(run.begin(), t);
        else if (near(t.a.v(), run.front().a.v())) run.insert(run.begin(), reversed(t));
        else continue;
        left.erase(left.begin() + long(k));
        grown = true;
      }
      if (!grown) return std::unexpected(std::string("выделенные проводники цепи не образуют одну цепочку"));
    }
    return run;
  };
  auto runP = chain(netP), runN = chain(netN);
  if (!runP) return std::unexpected(runP.error());
  if (!runN) return std::unexpected(runN.error());
  const double pairWidth = double(2 * w + gap);
  auto air = [](const std::vector<Track>& r) { return (r.back().b.v() - r.front().a.v()).len(); };
  if (air(*runP) < 3 * pairWidth || air(*runN) < 3 * pairWidth)
    return std::unexpected(std::string("проводник короче трёх ширин застёгнутой пары"));
  auto length = [](const std::vector<Track>& r) {
    double l = 0;
    for (const Track& t : r) l += t.length();
    return l;
  };
  // Both runs the same way: the N run starts nearer the P run's start.
  if ((runN->front().a.v() - runP->front().a.v()).len() > (runN->back().b.v() - runP->front().a.v()).len()) {
    r::reverse(*runN);
    for (Track& t : *runN) std::swap(t.a, t.b);
  }
  const bool fromP = length(*runP) >= length(*runN);
  const std::vector<Track>& base = fromP ? *runP : *runN;
  const std::vector<Track>& other = fromP ? *runN : *runP;
  // Which side the other run lies on, by its middle.
  const Vec2 om = other[other.size() / 2].a.v();
  size_t ki = 0;
  double kd = 1e300;
  for (size_t k = 0; k < base.size(); ++k)
    if (double dd = distPointSegment(om, base[k].a.v(), base[k].b.v()); dd < kd) kd = dd, ki = k;
  const double otherSide = (base[ki].b.v() - base[ki].a.v()).cross(om - base[ki].a.v()) > 0 ? 1.0 : -1.0;
  const double off = double(w + gap) / 2.0;
  std::vector<Track> axis = offsetRun(base, otherSide * off, 4 * pairWidth);
  if (axis.empty()) return std::unexpected(std::string("не удалось построить осевую линию"));
  ZippedWire z;
  z.layer = layer;
  z.pair = pair;
  z.netP = netP;
  z.netN = netN;
  z.condWidth = w;
  z.gap = gap;
  z.pSide = fromP ? -int(otherSide) : int(otherSide);  // the positive conductor's side of the axis
  for (Track& t : axis) {
    t.width = z.width();
    t.net = kNoNet;
    t.zip = -1;
    t.edited = false;
  }
  z.axis = axis;
  const int zi = int(b.zips.size());
  // The runs' ends as they were (where they met the rest), per net: [start, end].
  const Vec2 wasP[2] = {runP->front().a.v(), runP->back().b.v()}, wasN[2] = {runN->front().a.v(), runN->back().b.v()};
  std::set<int> gone(sel.begin(), sel.end());
  std::vector<Track> keep;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (!gone.contains(int(i))) keep.push_back(b.tracks[i]);
  b.tracks = std::move(keep);
  b.zips.push_back(z);
  for (int side = 0; side < 2; ++side) {
    const int net = side ? netP : netN;
    const double sg = (side ? 1.0 : -1.0) * z.pSide;
    std::vector<Track> cond = offsetRun(axis, sg * off, 4 * pairWidth);
    if (cond.empty()) continue;
    for (Track& t : cond) {
      t.width = w;
      t.net = net;
      t.zip = zi;
      t.edited = true;
      b.tracks.push_back(t);
    }
    // Straight pieces from the conductor's ends back to where its run began and ended.
    const Vec2* was = side ? wasP : wasN;
    for (int e = 0; e < 2; ++e) {
      const Vec2 at = e ? cond.back().b.v() : cond.front().a.v();
      if ((at - was[e]).len() <= edit::kJoinTol) continue;
      Track s;
      s.a = Point(at);
      s.b = Point(was[e]);
      s.width = w;
      s.layer = layer;
      s.net = net;
      s.edited = true;
      b.tracks.push_back(s);
    }
  }
  return zi;
}

}  // namespace xr
