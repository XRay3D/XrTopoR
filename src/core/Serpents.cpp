#include "core/Serpents.h"

#include <cmath>
#include <map>
#include <numbers>

#include "geom/Ranges.h"

namespace xr {

namespace {

constexpr double kJoin = 2.0;  // nm: pieces that meet

// The bends of a serpent on a chord of length C: how many, on which side each stands, how high it may be.
struct Layout {
  double C = 0, p = 0, u = 0;
  int n = 0;
  std::vector<int> side;      // +1: side A, -1: side B
  std::vector<double> bound;  // the trapezoid's height where the bend stands
  double top = 0;             // the highest of the bounds

  Layout(double chord, const Serpent& s, Coord width) : C(chord), p(s.gap + double(width)), u(p / 4) {
    if (C <= 0 || p <= 0) return;
    n = std::max(0, int(std::floor(C / p + 1e-6)) - 1);
    auto height = [&](int sd, double x) {
      const double h = sd > 0 ? s.h1 + (s.h4 - s.h1) * x / C : s.h2 + (s.h3 - s.h2) * x / C;
      return std::max(0.0, h);
    };
    auto at = [&](int i, int sd) { return std::min(height(sd, (3 + 4 * i) * u), height(sd, (5 + 4 * i) * u)); };
    if (n < 1) return;
    // The bends alternate; the first goes to side A unless beginning on B gives the bends more height in all (an
    // odd number of them: one more stands on the roomier side).
    auto room = [&](int first) {
      double sum = 0;
      for (int i = 0; i < n; ++i) sum += at(i, i % 2 ? -first : first);
      return sum;
    };
    const int first = room(-1) > room(+1) + 1.0 ? -1 : +1;
    for (int i = 0; i < n; ++i) {
      side.push_back(i % 2 ? -first : first);
      bound.push_back(at(i, side.back()));
      top = std::max(top, bound.back());
    }
  }
  double amp(int i, double A) const { return std::min(A, bound[size_t(i)]); }
  // A step of height d over p/2 along the chord: two chamfers and a piece across, or one slanted piece.
  double step(double d) const { return d >= 2 * u ? 2 * u * std::numbers::sqrt2 + (d - 2 * u) : std::hypot(2 * u, d); }
  double length(double A) const {
    if (n < 1) return C;
    double len = C - (4 * n + 2) * u + n * 2 * u + step(amp(0, A)) + step(amp(n - 1, A));
    for (int i = 0; i + 1 < n; ++i) len += step(amp(i, A) + amp(i + 1, A));
    return len;
  }
};

}  // namespace

double serpentDefaultHeight(Coord width, double gap) { return 2 * (gap + double(width)); }
double serpentMinHeight(Coord width) { return 0.75 * double(width); }

SerpentShape serpentShape(Vec2 a, Vec2 b, const Serpent& s, Coord width) {
  SerpentShape out;
  const double C = (b - a).len();
  out.path = {a, b};
  out.length = out.minLength = out.maxLength = C;
  const Layout l(C, s, width);
  if (l.n < 1) return out;
  out.maxLength = l.length(l.top);
  const double target = std::clamp(s.length, C, out.maxLength);
  if (target <= C + 0.5) return out;  // (no bends: the chord itself)
  double lo = 0, hi = l.top;
  for (int it = 0; it < 80 && hi - lo > 1e-4; ++it) {
    const double mid = (lo + hi) / 2;
    (l.length(mid) < target ? lo : hi) = mid;
  }
  const double A = hi;
  out.narrow = A < l.u;
  const Vec2 dir = (b - a) / C, nA{dir.y, -dir.x};
  const double u = l.u;
  std::vector<Vec2> local{{0, 0}, {u, 0}};
  auto put = [&](double x, double y) {
    if ((local.back() - Vec2{x, y}).len() > 1.0) local.push_back({x, y});
  };
  // From (x, y0) to (x + 2u, y1): the step.
  auto step = [&](double x, double y0, double y1) {
    if (std::abs(y1 - y0) >= 2 * u) {
      const double sg = y1 > y0 ? 1.0 : -1.0;
      put(x + u, y0 + sg * u);
      put(x + u, y1 - sg * u);
    }
    put(x + 2 * u, y1);
  };
  double y = 0;
  for (int i = 0; i < l.n; ++i) {
    const double next = l.side[size_t(i)] * l.amp(i, A);
    step((1 + 4 * i) * u, y, next);
    y = next;
    put((5 + 4 * i) * u, y);
  }
  step((1 + 4 * l.n) * u, y, 0);
  put(C, 0);
  out.path.clear();
  for (Vec2 q : local) out.path.push_back(a + dir * q.x + nA * q.y);
  out.path.front() = a;
  out.path.back() = b;
  out.length = 0;
  for (size_t i = 0; i + 1 < out.path.size(); ++i) out.length += (out.path[i + 1] - out.path[i]).len();
  return out;
}

std::array<Vec2, 4> serpentCorners(Vec2 a, Vec2 b, const Serpent& s) {
  const double C = (b - a).len();
  const Vec2 dir = C > 0 ? (b - a) / C : Vec2{1, 0}, nA{dir.y, -dir.x};
  return {a + nA * s.h1, a - nA * s.h2, b - nA * s.h3, b + nA * s.h4};
}

namespace {
std::optional<SerpentRun> runOf(const Board& b, std::vector<int> tracks);
}

std::optional<SerpentRun> serpentRun(const Board& b, int serp) {
  std::vector<int> tracks;
  for (int ti = 0; ti < int(b.tracks.size()); ++ti)
    if (b.tracks[size_t(ti)].serp == serp && b.tracks[size_t(ti)].zip < 0) tracks.push_back(ti);
  if (serp < 0) return std::nullopt;
  return runOf(b, std::move(tracks));
}

std::vector<std::optional<SerpentRun>> serpentRuns(const Board& b) {
  std::vector<std::vector<int>> of(b.serpents.size());
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    const Track& t = b.tracks[size_t(ti)];
    if (t.serp >= 0 && t.serp < int(of.size()) && t.zip < 0) of[size_t(t.serp)].push_back(ti);
  }
  std::vector<std::optional<SerpentRun>> out;
  for (auto& tracks : of) out.push_back(runOf(b, std::move(tracks)));
  return out;
}

namespace {

std::optional<SerpentRun> runOf(const Board& b, std::vector<int> tracks) {
  SerpentRun run;
  run.tracks = std::move(tracks);
  if (run.tracks.empty()) return std::nullopt;
  // The pieces are kept in order, each from its a to its b; pieces that are not are put in order by their ends.
  auto chained = [&] {
    for (size_t i = 0; i + 1 < run.tracks.size(); ++i)
      if ((b.tracks[size_t(run.tracks[i])].b.v() - b.tracks[size_t(run.tracks[i + 1])].a.v()).len() > kJoin) return false;
    return true;
  };
  if (!chained()) {
    std::vector<int> rest(run.tracks.begin() + 1, run.tracks.end()), order{run.tracks.front()};
    Vec2 head = b.tracks[size_t(order.front())].a.v(), tail = b.tracks[size_t(order.front())].b.v();
    for (bool grown = true; grown && !rest.empty();) {
      grown = false;
      for (size_t i = 0; i < rest.size(); ++i) {
        const Track& t = b.tracks[size_t(rest[i])];
        if ((t.a.v() - tail).len() <= kJoin) {
          order.push_back(rest[i]);
          tail = t.b.v();
        } else if ((t.b.v() - head).len() <= kJoin) {
          order.insert(order.begin(), rest[i]);
          head = t.a.v();
        } else {
          continue;
        }
        rest.erase(rest.begin() + long(i));
        grown = true;
        break;
      }
    }
    if (!rest.empty()) return std::nullopt;
    run.tracks = order;
  }
  const Track& first = b.tracks[size_t(run.tracks.front())];
  run.a = first.a.v();
  run.b = b.tracks[size_t(run.tracks.back())].b.v();
  run.layer = first.layer;
  run.net = first.net;
  run.width = first.width;
  for (int ti : run.tracks) run.drawn += b.tracks[size_t(ti)].length();
  return run;
}

}  // namespace

int makeSerpent(Board& b, std::vector<int> tracks, std::string* why) {
  auto no = [&](const char* reason) {
    if (why) *why = reason;
    return -1;
  };
  r::sort(tracks);
  tracks.erase(r::unique(tracks).begin(), tracks.end());
  if (tracks.empty() || tracks.front() < 0 || tracks.back() >= int(b.tracks.size())) return no("no tracks");
  const Track first = b.tracks[size_t(tracks.front())];
  for (int ti : tracks) {
    const Track& t = b.tracks[size_t(ti)];
    if (t.isArc()) return no("an arc");
    if (t.zip >= 0) return no("a conductor of a zipped pair");
    if (t.serp >= 0) return no("a serpent already");
    if (t.locked) return no("fixed");
    if (t.net != first.net || t.layer != first.layer || t.width != first.width) return no("not one wire");
  }
  // One after another: a chain, and on one line.
  std::vector<int> rest(tracks.begin() + 1, tracks.end());
  Vec2 head = first.a.v(), tail = first.b.v();
  for (bool grown = true; grown && !rest.empty();) {
    grown = false;
    for (size_t i = 0; i < rest.size(); ++i) {
      const Track& t = b.tracks[size_t(rest[i])];
      if ((t.a.v() - tail).len() <= kJoin) tail = t.b.v();
      else if ((t.b.v() - tail).len() <= kJoin) tail = t.a.v();
      else if ((t.b.v() - head).len() <= kJoin) head = t.a.v();
      else if ((t.a.v() - head).len() <= kJoin) head = t.b.v();
      else continue;
      rest.erase(rest.begin() + long(i));
      grown = true;
      break;
    }
  }
  if (!rest.empty()) return no("not one after another");
  const double C = (tail - head).len();
  if (C <= 0) return no("too short");
  const Vec2 dir = (tail - head) / C;
  for (int ti : tracks)
    for (Vec2 q : {b.tracks[size_t(ti)].a.v(), b.tracks[size_t(ti)].b.v()})
      if (std::abs((q - head).cross(dir)) > 100.0) return no("not a straight fragment");
  Serpent s;
  s.gap = 2.0 * double(first.width);
  if (C < 2 * (s.gap + double(first.width)) - 1.0) return no("too short for a bend");
  s.length = C;
  s.h1 = s.h2 = s.h3 = s.h4 = serpentDefaultHeight(first.width, s.gap);
  const int serp = int(b.serpents.size());
  b.serpents.push_back(s);
  // One piece for the whole fragment, in the place of the first; the others go.
  Track& keep = b.tracks[size_t(tracks.front())];
  keep.a = Point(head);
  keep.b = Point(tail);
  keep.serp = serp;
  keep.locked = true;  // (a serpent's pieces are fixed tracks: F5–F7 and the tools on wires keep them as drawn)
  for (size_t i = tracks.size(); i-- > 1;) b.tracks.erase(b.tracks.begin() + tracks[i]);
  return serp;
}

void unmakeSerpent(Board& b, int serp) {
  for (Track& t : b.tracks)
    if (t.serp == serp && t.zip < 0) t.locked = false;  // (plain pieces of the wire again)
  b.removeSerpent(serp);
}

namespace {

// An end of a serpent moved along its line from `was` to `now` (`inward`: the unit vector from that end into the
// serpent). The plain piece of the wire that continues the line there is made longer or shorter (to nothing: it
// goes, by `dead`); with no such piece the end can only move inward, and a plain piece is laid behind it. False:
// the end would go past the straight piece, or the piece is fixed.
bool moveEnd(Board& b, const SerpentRun& run, const Track& model, Vec2 was, Vec2 now, Vec2 inward, std::vector<int>& dead) {
  const double t = (now - was).dot(inward);
  if (std::abs(t) < 0.5) return true;
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    Track& n = b.tracks[size_t(ti)];
    if (n.serp >= 0 || n.zip >= 0 || n.isArc() || n.net != run.net || n.layer != run.layer) continue;
    for (int e : {0, 1}) {
      const Vec2 here = e ? n.b.v() : n.a.v(), far = e ? n.a.v() : n.b.v();
      if ((here - was).len() > kJoin) continue;
      const Vec2 out = far - was;
      if (out.dot(inward) >= 0 || std::abs(out.cross(inward)) > 100.0) continue;  // (not the line's continuation)
      if (n.locked) return false;
      if (t < 0 && -t > out.len() + kJoin) return false;
      (e ? n.b : n.a) = Point(now);
      if ((far - now).len() < 1.0) dead.push_back(ti);
      return true;
    }
  }
  if (t < 0) return false;
  Track n = model;
  n.id = 0;
  n.serp = -1;
  n.locked = false;
  n.mid.reset();
  n.a = Point(was);
  n.b = Point(now);
  if (inward.dot(run.b - run.a) < 0) std::swap(n.a, n.b);  // (the serpent's last end: the piece runs on from it)
  b.tracks.push_back(n);
  return true;
}

}  // namespace

bool setSerpent(Board& b, int serp, const Serpent& s, const Vec2* a, const Vec2* b2) {
  if (serp < 0 || serp >= int(b.serpents.size())) return false;
  auto run = serpentRun(b, serp);
  if (!run) return false;
  const Vec2 na = a ? *a : run->a, nb = b2 ? *b2 : run->b;
  const double C = (run->b - run->a).len();
  if (C < 1.0 || (nb - na).len() < 1.0 || (nb - na).dot(run->b - run->a) <= 0) return false;
  const Vec2 dir = (run->b - run->a) / C;
  const Track model = b.tracks[size_t(run->tracks.front())];
  std::vector<int> dead;
  {
    Board trial = b;  // (an end that cannot move leaves the board as it was)
    std::vector<int> gone;
    if (!moveEnd(trial, *run, model, run->a, na, dir, gone) || !moveEnd(trial, *run, model, run->b, nb, dir * -1.0, gone)) return false;
    b = std::move(trial);
    dead = std::move(gone);
  }
  const SerpentShape shape = serpentShape(na, nb, s, run->width);
  const size_t pieces = shape.path.size() - 1;
  // The pieces in the places of the old ones, in order; more are added after the last track, fewer leave theirs.
  std::vector<int> at = run->tracks;
  r::sort(at);
  for (size_t i = 0; i < pieces; ++i) {
    if (i >= at.size()) {
      Track t = model;
      t.id = 0;
      at.push_back(int(b.tracks.size()));
      b.tracks.push_back(t);
    }
    Track& t = b.tracks[size_t(at[i])];
    t.a = Point(shape.path[i]);
    t.b = Point(shape.path[i + 1]);
    t.mid.reset();
    t.serp = serp;
    t.locked = true;
  }
  for (size_t i = pieces; i < at.size(); ++i) dead.push_back(at[i]);
  r::sort(dead, std::greater{});
  dead.erase(r::unique(dead).begin(), dead.end());
  for (int ti : dead) b.tracks.erase(b.tracks.begin() + ti);
  const std::string id = b.serpents[size_t(serp)].id;
  b.serpents[size_t(serp)] = s;
  b.serpents[size_t(serp)].id = id;
  return true;
}

}  // namespace xr
