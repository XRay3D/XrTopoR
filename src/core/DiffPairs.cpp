#include "core/DiffPairs.h"

#include <algorithm>
#include <cmath>
#include <numbers>
#include <array>
#include <optional>
#include <set>
#include <tuple>

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

ZipEnds zipEnds(const Board& b, int zip) {
  ZipEnds out;
  if (zip < 0 || zip >= int(b.zips.size()) || b.zips[size_t(zip)].axis.empty()) return out;
  const ZippedWire& z = b.zips[size_t(zip)];
  const Vec2 at[2] = {z.axis.front().a.v(), z.axis.back().b.v()};
  for (int side = 0; side < 2; ++side) {
    const int net = side ? z.netP : z.netN;
    // The free ends: an end no other conductor of the net shares.
    std::vector<Vec2> ends;
    for (const Track& t : b.tracks)
      if (t.zip == zip && t.net == net) {
        ends.push_back(t.a.v());
        ends.push_back(t.b.v());
      }
    std::vector<Vec2> free;
    for (size_t i = 0; i < ends.size(); ++i) {
      int same = 0;
      for (size_t j = 0; j < ends.size(); ++j) same += (ends[i] - ends[j]).len() <= edit::kJoinTol;
      if (same == 1) free.push_back(ends[i]);
    }
    if (free.empty()) return out;
    for (int e = 0; e < 2; ++e) {
      double bd = 1e300;
      for (Vec2 q : free)
        if (double d = (q - at[e]).len(); d < bd) bd = d, out.p[side][e] = q;
    }
  }
  out.ok = true;
  return out;
}

bool rebuildZip(Board& b, int zip, const ZipEnds& was) {
  if (zip < 0 || zip >= int(b.zips.size())) return false;
  ZippedWire& z = b.zips[size_t(zip)];
  if (z.axis.empty()) return false;
  Coord w = z.condWidth, gap = z.gap;
  if (b.pairRule(z.pair, z.layer, w, gap)) {
    z.condWidth = w;
    z.gap = gap;
  }
  const double off = double(z.condWidth + z.gap) / 2.0;
  const double pairWidth = double(z.width());
  std::vector<int> drop;
  for (int side = 0; side < 2; ++side) {
    const int net = side ? z.netP : z.netN;
    const double sg = (side ? 1.0 : -1.0) * (z.pSide ? z.pSide : 1);
    std::vector<Track> run = offsetRun(z.axis, sg * off, 4 * pairWidth);
    if (run.empty()) continue;
    // The single tracks at the old ends follow to the new ones.
    if (was.ok)
      for (int e = 0; e < 2; ++e) {
        const Vec2 from = was.p[side][e], to = e ? run.back().b.v() : run.front().a.v();
        if ((from - to).len() <= 1) continue;
        std::vector<Track> connectors;
        for (Track& t : b.tracks) {
          if (t.zip == zip || t.net != net || t.layer != z.layer) continue;
          const bool atA = (t.a.v() - from).len() <= edit::kJoinTol, atB = (t.b.v() - from).len() <= edit::kJoinTol;
          if (!atA && !atB) continue;
          if (t.locked) {  // stays, joined by a piece
            Track c = t;
            c.id = 0;  // a new track
            c.mid.reset();
            c.locked = false;
            c.a = Point(from);
            c.b = Point(to);
            c.edited = true;
            connectors.push_back(c);
            continue;
          }
          edit::stretchEnds(t, atA ? to : t.a.v(), atB ? to : t.b.v());
          t.edited = true;
        }
        for (Track& c : connectors) b.tracks.push_back(c);
      }
    // Over the old conductors of the net, in place.
    std::vector<int> slots;
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (b.tracks[size_t(i)].zip == zip && b.tracks[size_t(i)].net == net) slots.push_back(i);
    for (size_t k = 0; k < run.size(); ++k) {
      Track t = run[k];
      t.width = z.condWidth;
      t.layer = z.layer;
      t.net = net;
      t.zip = zip;
      t.edited = true;
      t.locked = z.fixed;
      if (k < slots.size()) {
        Track& o = b.tracks[size_t(slots[k])];
        t.id = o.id;
        t.serp = o.serp;
        o = t;
      } else {
        t.id = 0;
        b.tracks.push_back(t);
      }
    }
    for (size_t k = run.size(); k < slots.size(); ++k) drop.push_back(slots[k]);
  }
  r::sort(drop, std::greater{});
  for (int i : drop) b.tracks.erase(b.tracks.begin() + i);
  return true;
}

bool moveAxisVertex(Board& b, int zip, int k, Vec2 to) {
  if (zip < 0 || zip >= int(b.zips.size()) || b.zips[size_t(zip)].fixed) return false;
  std::vector<Track>& axis = b.zips[size_t(zip)].axis;
  const int n = int(axis.size());
  if (k < 0 || k > n || n == 0) return false;
  const ZipEnds was = zipEnds(b, zip);
  if (k > 0) edit::stretchEnds(axis[size_t(k - 1)], axis[size_t(k - 1)].a.v(), to);
  if (k < n) edit::stretchEnds(axis[size_t(k)], to, axis[size_t(k)].b.v());
  std::erase_if(axis, [](const Track& t) { return t.a == t.b; });
  return rebuildZip(b, zip, was);
}

bool bendAxis(Board& b, int zip, int k, Vec2 to) {
  if (zip < 0 || zip >= int(b.zips.size()) || b.zips[size_t(zip)].fixed) return false;
  std::vector<Track>& axis = b.zips[size_t(zip)].axis;
  if (k < 0 || k >= int(axis.size())) return false;
  const ZipEnds was = zipEnds(b, zip);
  Track& t = axis[size_t(k)];
  if (t.mid) {
    if (distPointSegment(to, t.a.v(), t.b.v()) < 1000) t.mid.reset();  // on the chord: a line
    else t.mid = Point(to);
  } else {
    Track second = t;
    t.b = Point(to);
    second.a = Point(to);
    axis.insert(axis.begin() + k + 1, second);
  }
  return rebuildZip(b, zip, was);
}

bool moveAxisPiece(Board& b, int zip, int k, Vec2 d) {
  if (zip < 0 || zip >= int(b.zips.size()) || b.zips[size_t(zip)].fixed) return false;
  std::vector<Track>& axis = b.zips[size_t(zip)].axis;
  const int n = int(axis.size());
  if (k < 0 || k >= n) return false;
  const ZipEnds was = zipEnds(b, zip);
  Track& t = axis[size_t(k)];
  t.a = Point(t.a.v() + d);
  t.b = Point(t.b.v() + d);
  if (t.mid) t.mid = Point(t.mid->v() + d);
  if (k > 0) edit::stretchEnds(axis[size_t(k - 1)], axis[size_t(k - 1)].a.v(), t.a.v());
  if (k + 1 < n) edit::stretchEnds(axis[size_t(k + 1)], t.b.v(), axis[size_t(k + 1)].b.v());
  return rebuildZip(b, zip, was);
}

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

namespace {

double lengthOf(const Track& t) {
  if (t.mid)
    if (const ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()); g.valid) return g.length();
  return (t.b.v() - t.a.v()).len();
}

// The part of t (lengths along it from its start) that u runs beside, their centrelines d apart; nullopt when it
// does not.
std::optional<std::pair<double, double>> facing(const Track& t, const Track& u, double d, double tol) {
  if (t.isArc() != u.isArc()) return std::nullopt;
  const double len = lengthOf(t);
  double sa = 0, sb = 0;
  if (!t.isArc()) {
    const Vec2 e = (t.b.v() - t.a.v()).normalized();
    const double oa = e.cross(u.a.v() - t.a.v()), ob = e.cross(u.b.v() - t.a.v());
    if ((oa > 0) != (ob > 0) || std::abs(std::abs(oa) - d) > tol || std::abs(std::abs(ob) - d) > tol) return std::nullopt;
    sa = e.dot(u.a.v() - t.a.v());
    sb = e.dot(u.b.v() - t.a.v());
  } else {
    const ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
    const ArcGeom h = ArcGeom::fromThreePoints(u.a.v(), u.mid->v(), u.b.v());
    if (!g.valid || !h.valid) return std::nullopt;
    if ((g.center - h.center).len() > tol || std::abs(std::abs(g.radius - h.radius) - d) > tol) return std::nullopt;
    const double sw = std::abs(g.sweep);
    auto along = [&](Vec2 q) {
      double a = (std::atan2(q.y - g.center.y, q.x - g.center.x) - g.startAngle) * (g.sweep > 0 ? 1.0 : -1.0);
      while (a > sw / 2 + std::numbers::pi) a -= 2 * std::numbers::pi;
      while (a <= sw / 2 - std::numbers::pi) a += 2 * std::numbers::pi;
      return a * g.radius;
    };
    sa = along(u.a.v());
    sb = along(u.b.v());
  }
  const double lo = std::max(0.0, std::min(sa, sb)), hi = std::min(len, std::max(sa, sb));
  if (hi - lo < 10 * tol) return std::nullopt;
  return std::pair{lo, hi};
}

// The piece of t between the lengths s0 and s1 along it.
Track pieceOf(const Track& t, double s0, double s1) {
  const double len = lengthOf(t);
  Track p = t;
  p.id = 0;
  if (t.mid) {
    const ArcGeom g = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v());
    if (s0 > 0) p.a = Point(g.pointAt(s0 / len));
    if (s1 < len) p.b = Point(g.pointAt(s1 / len));
    p.mid = Point(g.pointAt((s0 + s1) / 2 / len));
  } else {
    const Vec2 e = (t.b.v() - t.a.v()).normalized();
    if (s0 > 0) p.a = Point(t.a.v() + e * s0);
    if (s1 < len) p.b = Point(t.a.v() + e * s1);
  }
  return p;
}

double distToTrack(Vec2 p, const Track& t) {
  const Polyline pl = t.path(200);
  double d = 1e300;
  for (size_t i = 0; i + 1 < pl.size(); ++i) d = std::min(d, distPointSegment(p, pl[i], pl[i + 1]));
  return d;
}

// A conductor of a section to be: the pieces of one net in the order of travel (`rev`: a piece run from its end
// to its start), the first cut at `lo` and the last at `hi` (lengths along them from their starts). `beside`:
// the pieces that run beside the other net (the others are the short ones TopoR rounds an outer corner with).
struct SideRun {
  int net = kNoNet;
  std::vector<int> tracks;
  std::vector<char> rev, beside;
  double lo = 0, hi = 0;
};

struct Section {
  SideRun side[2];
};

std::vector<Section> sectionsBeside(const Board& b, int pair, LayerId layer, Coord w, Coord gap) {
  const double d = double(w + gap), tol = 2000, bridge = 2.0 * double(2 * w + gap);
  std::vector<int> cand;
  for (int i = 0; i < int(b.tracks.size()); ++i) {
    const Track& t = b.tracks[size_t(i)];
    if (t.layer == layer && t.zip < 0 && t.serp < 0 && !t.locked && b.pairOfNet(t.net) == pair && std::llabs(t.width - w) <= 1000)
      cand.push_back(i);
  }
  const size_t n = cand.size();
  auto tr = [&](size_t c) -> const Track& { return b.tracks[size_t(cand[c])]; };
  // What of each piece runs beside the other net, and beside which pieces.
  std::vector<std::optional<std::pair<double, double>>> part(n);
  std::vector<std::pair<size_t, size_t>> faces;
  for (size_t i = 0; i < n; ++i)
    for (size_t j = 0; j < n; ++j) {
      if (tr(i).net == tr(j).net) continue;
      auto f = facing(tr(i), tr(j), d, tol);
      if (!f) continue;
      part[i] = part[i] ? std::pair{std::min(part[i]->first, f->first), std::max(part[i]->second, f->second)} : *f;
      if (i < j) faces.push_back({i, j});
    }
  // The pieces of a net end to end: the one piece that shares an end (a branch is where a chain stops).
  std::vector<std::array<std::pair<int, int>, 2>> nb(n, {std::pair{-1, 0}, std::pair{-1, 0}});
  for (size_t i = 0; i < n; ++i)
    for (int e = 0; e < 2; ++e) {
      int count = 0;
      for (size_t j = 0; j < n; ++j) {
        if (j == i || tr(j).net != tr(i).net) continue;
        for (int g = 0; g < 2; ++g)
          if (((e ? tr(i).b : tr(i).a).v() - (g ? tr(j).b : tr(j).a).v()).len() <= edit::kJoinTol) {
            ++count;
            nb[i][size_t(e)] = {int(j), g};
          }
      }
      if (count != 1) nb[i][size_t(e)] = {-1, 0};
    }
  std::vector<SideRun> runs;
  std::vector<int> runOf(n, -1);
  std::vector<char> seen(n, 0);
  for (size_t i = 0; i < n; ++i) {
    if (seen[i] || !part[i]) continue;
    // The chain through i, in the order of travel.
    std::vector<std::pair<size_t, bool>> chain{{i, false}};
    seen[i] = 1;
    for (int way = 0; way < 2; ++way) {
      size_t c = i;
      int out = way ? 0 : 1;  // the end the walk leaves the piece by
      for (;;) {
        auto [j, g] = nb[c][size_t(out)];
        if (j < 0 || seen[size_t(j)] || nb[size_t(j)][size_t(g)].first != int(c)) break;
        seen[size_t(j)] = 1;
        // Forwards a piece entered by its end is run backwards; backwards it is one left by that end.
        if (way == 0) chain.push_back({size_t(j), g == 1});
        else chain.insert(chain.begin(), {size_t(j), g == 0});
        c = size_t(j);
        out = 1 - g;
      }
    }
    // Its runs beside the other net: from a piece beside it to the last one, over short pieces that are not.
    size_t k = 0;
    while (k < chain.size()) {
      if (!part[chain[k].first]) {
        ++k;
        continue;
      }
      size_t last = k;
      double loose = 0;
      for (size_t m = k + 1; m < chain.size(); ++m) {
        if (part[chain[m].first]) {
          last = m;
          loose = 0;
        } else if ((loose += lengthOf(tr(chain[m].first))) > bridge) {
          break;
        }
      }
      SideRun r;
      r.net = tr(chain[k].first).net;
      for (size_t m = k; m <= last; ++m) {
        r.tracks.push_back(cand[chain[m].first]);
        r.rev.push_back(chain[m].second);
        r.beside.push_back(part[chain[m].first].has_value());
        runOf[chain[m].first] = int(runs.size());
      }
      const auto& first = *part[chain[k].first];
      const auto& end = *part[chain[last].first];
      r.lo = chain[k].second ? lengthOf(tr(chain[k].first)) - first.second : first.first;
      r.hi = chain[last].second ? lengthOf(tr(chain[last].first)) - end.first : end.second;
      if (k == last && chain[k].second) r.lo = first.first, r.hi = first.second, r.rev[0] = 0;  // (one piece: as it lies)
      runs.push_back(std::move(r));
      k = last + 1;
    }
  }
  // A section: two runs, one of each net, beside each other and no third.
  std::vector<std::set<int>> mates(runs.size());
  for (auto [i, j] : faces) {
    if (runOf[i] < 0 || runOf[j] < 0) continue;
    mates[size_t(runOf[i])].insert(runOf[j]);
    mates[size_t(runOf[j])].insert(runOf[i]);
  }
  std::vector<Section> out;
  for (size_t a = 0; a < runs.size(); ++a) {
    if (mates[a].size() != 1) continue;
    const size_t c = size_t(*mates[a].begin());
    if (c < a || mates[c].size() != 1) continue;
    out.push_back({{runs[a], runs[c]}});
  }
  return out;
}

// A run's pieces as they are travelled, the first and the last cut to the run.
std::vector<Track> travelled(const Board& b, const SideRun& r, bool besideOnly) {
  std::vector<Track> out;
  for (size_t k = 0; k < r.tracks.size(); ++k) {
    Track t = b.tracks[size_t(r.tracks[k])];
    if (r.rev[k]) std::swap(t.a, t.b);
    const double len = lengthOf(t);
    const double lo = k == 0 ? r.lo : 0, hi = k + 1 == r.tracks.size() ? r.hi : len;
    if (lo > 0 || hi < len) t = pieceOf(t, lo, hi);
    if (!besideOnly || r.beside[k]) out.push_back(t);
  }
  return out;
}

}  // namespace

RestoreResult restoreDiffPairs(Board& b) {
  RestoreResult res;
  std::set<int> done;  // the differential signals with a section zipped
  for (int pair = 0; pair < int(b.hispeed.diffSignals.size()); ++pair)
    for (LayerId layer : b.copperLayers()) {
      Coord w = 0, gap = 0;
      if (!b.pairRule(pair, layer, w, gap)) continue;
      const double off = double(w + gap) / 2.0, pairWidth = double(2 * w + gap);
      for (const Section& sec : sectionsBeside(b, pair, layer, w, gap)) {
        // The axis: half way from the first run to the second, by the pieces that run beside it.
        const std::vector<Track> base = travelled(b, sec.side[0], true), other = travelled(b, sec.side[1], false);
        if (base.empty() || other.empty()) continue;
        auto air = [](const std::vector<Track>& r) { return (r.back().b.v() - r.front().a.v()).len(); };
        if (air(travelled(b, sec.side[0], false)) < 3 * pairWidth || air(other) < 3 * pairWidth) continue;
        const Track& b0 = base.front();
        Vec2 om = other.front().a.v();
        double od = 1e300;
        for (const Track& t : other)
          for (Vec2 q : {t.a.v(), t.b.v()})
            if (double dd = distToTrack(q, b0); dd < od) od = dd, om = q;
        const double side = tangentAt(b0, b0.a.v()).cross(om - b0.a.v()) > 0 ? 1.0 : -1.0;
        std::vector<Track> axis = offsetRun(base, side * off, 4 * pairWidth);
        if (axis.empty()) continue;
        // Both conductors lie half the pair's pitch from it where they run beside each other.
        bool fits = true;
        for (const SideRun& r : sec.side) {
          const std::vector<Track> ps = travelled(b, r, true);
          for (const Track& t : ps) {
            const Vec2 m = t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
            double dd = 1e300;
            for (const Track& a : axis) dd = std::min(dd, distToTrack(m, a));
            fits = fits && std::abs(dd - off) <= 3000;
          }
        }
        if (!fits) continue;
        ZippedWire z;
        z.layer = layer;
        z.pair = pair;
        z.netP = sec.side[0].net;
        z.netN = sec.side[1].net;
        bool baseIsP = true;  // the positive net: the one of the pair's first signal's cluster
        if (const SignalCluster* c = b.hispeed.clusterOf(b.hispeed.diffSignals[size_t(pair)].signalA))
          for (const std::string& name : c->nets)
            if (b.findNet(name) == sec.side[1].net) baseIsP = false;
        if (!baseIsP) std::swap(z.netP, z.netN);
        z.condWidth = w;
        z.gap = gap;
        z.pSide = baseIsP ? -int(side) : int(side);
        for (Track& t : axis) {
          t.width = z.width();
          t.net = kNoNet;
          t.zip = -1;
          t.serp = -1;
          t.id = 0;
          t.locked = t.edited = false;
        }
        z.axis = std::move(axis);
        const int zi = int(b.zips.size());
        b.zips.push_back(std::move(z));
        // The conductors are the pieces as they lie; what of the first and the last reaches past the run is cut off.
        for (const SideRun& r : sec.side)
          for (size_t k = 0; k < r.tracks.size(); ++k) {
            const Track t = b.tracks[size_t(r.tracks[k])];
            const double len = lengthOf(t), cut = 2 * edit::kJoinTol;
            // (the run's cuts are along its travel: a piece run backwards has them from its end)
            double lo = k == 0 ? r.lo : 0, hi = k + 1 == r.tracks.size() ? r.hi : len;
            if (r.rev[k]) std::tie(lo, hi) = std::pair{len - hi, len - lo};
            if (lo <= cut) lo = 0;
            if (hi >= len - cut) hi = len;
            if (lo > 0) b.tracks.push_back(pieceOf(t, 0, lo));
            if (hi < len) b.tracks.push_back(pieceOf(t, hi, len));
            Track& in = b.tracks[size_t(r.tracks[k])];
            if (lo > 0 || hi < len) {
              in = pieceOf(t, lo, hi);
              in.id = t.id;
            }
            in.zip = zi;
          }
        ++res.sections;
        done.insert(pair);
      }
    }
  res.pairs = int(done.size());
  return res;
}

}  // namespace xr
