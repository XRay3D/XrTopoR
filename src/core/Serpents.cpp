#include "core/Serpents.h"

#include "core/Delay.h"

#include <cmath>
#include <map>
#include <numbers>
#include <set>
#include <tuple>

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

std::vector<SerpentConflict> serpentConflicts(const Board& b) {
  std::vector<SerpentConflict> out;
  if (b.serpents.empty()) return out;
  const auto runs = serpentRuns(b);
  SpatialIndex idx;
  idx.build(b, true, true);
  const double touch = 1.0;  // nm: nearer than this is met
  for (int s = 0; s < int(runs.size()); ++s) {
    if (!runs[size_t(s)]) continue;
    const SerpentRun& run = *runs[size_t(s)];
    const Vec2 at = (run.a + run.b) * 0.5;
    // Once for each thing met, whichever piece meets it.
    auto add = [&](int code, ItemRef other, int otherNet, int otherSerp = -1) {
      for (const SerpentConflict& c : out)
        if (c.serp == s && c.code == code && c.other == other && c.otherSerp == otherSerp) return;
      out.push_back({code, s, run.layer, run.net, other, otherNet, otherSerp, at});
    };
    bool outside = false;
    for (int ti : run.tracks) {
      const Track& piece = b.tracks[size_t(ti)];
      const Shape mine = Shape::capsule(piece.a.v(), piece.b.v(), double(piece.width) / 2);
      idx.query(mine.bbox(), LayerMask(1) << run.layer, [&](ItemRef r) {
        const int net = itemNet(b, r);
        if (net == run.net && net != kNoNet) return;  // (copper of its own net)
        if (r.type != ItemType::Track && r.type != ItemType::Pad && r.type != ItemType::Via && r.type != ItemType::Zone) return;
        if (r::none_of(itemShapes(b, r, 0, run.layer), [&](const Shape& o) { return mine.distance(o, touch) < touch; })) return;
        switch (r.type) {
          case ItemType::Track: {
            const Track& t = b.tracks[size_t(r.index)];
            if (t.serp >= 0 && t.zip < 0) {
              if (t.serp > s) add(5053, {ItemType::Track, -1}, net, t.serp);  // (once for the two)
            } else {
              add(t.locked ? 5049 : 5042, r, net);
            }
            break;
          }
          case ItemType::Pad: add(5043, r, net); break;
          case ItemType::Via: add(5045, r, net); break;
          default: add(5051, r, net); break;
        }
      });
      for (int ki = 0; ki < int(b.keepouts.size()); ++ki) {
        const Keepout& k = b.keepouts[size_t(ki)];
        if (!k.onLayer(run.layer) || !k.wires) continue;
        if (r::any_of(k.shapes(), [&](const Shape& o) { return mine.distance(o, touch) < touch; })) add(5050, {ItemType::Keepout, ki}, kNoNet);
      }
      outside = outside || (!b.outline.empty() && (!b.onBoard(piece.a.v()) || !b.onBoard(piece.b.v())));
    }
    if (outside) add(5052, {ItemType::Track, -1}, kNoNet);
  }
  return out;
}

namespace {

// How high a serpent's rectangle may stand beside the piece a → c of a wire, between x0 and x1 along it, on one
// side (`n`: the unit normal of that side): up to `most`, as far as nothing is nearer to it than half the wire's
// width and the clearance — the wires, pads and vias of other nets, the net's own other ones (by a gap of two
// widths), routing keepouts, the board's edge.
// The room a serpent holds for its bends: its trapezoid with half its wire's width round it. A serpent made later
// keeps clear of it though the bends are low yet (they grow into it when the serpent is made longer).
struct Reserved {
  Shape area;
  LayerId layer;
  int net;
};
std::vector<Reserved> reservedAreas(const Board& b, int but = -1) {
  std::vector<Reserved> out;
  const auto runs = serpentRuns(b);
  for (size_t s = 0; s < runs.size(); ++s) {
    if (!runs[s] || int(s) == but) continue;
    const auto c = serpentCorners(runs[s]->a, runs[s]->b, b.serpents[s]);
    out.push_back({Shape::polygon(Polyline{c[0], c[3], c[2], c[1]}, double(runs[s]->width) / 2), runs[s]->layer, runs[s]->net});
  }
  return out;
}

double roomBeside(const Board& b, const SpatialIndex& idx, const std::vector<Reserved>& held, Vec2 a, Vec2 c, double x0, double x1, Vec2 n, int self, double most) {
  const Track& wire = b.tracks[size_t(self)];
  const double half = double(wire.width) / 2;
  const double own = half + 2.0 * double(wire.width);  // from the net's own other copper
  const double C = (c - a).len();
  const Vec2 along = (c - a) / std::max(1.0, C);
  const Vec2 sa = a + along * x0, sc = a + along * x1;
  // The net's own copper is looked at beside the piece only, not past its ends: the wire goes on there, with its
  // corners and short pieces, and comes no nearer to the bends than the ends themselves.
  const double i0 = std::max(x0, own), i1 = std::min(x1, C - own);
  auto free = [&](double h) {
    const Shape rect = Shape::polygon(Polyline{sa, sc, sc + n * h, sa + n * h});
    std::optional<Shape> inner;
    if (i1 - i0 > 1.0) inner = Shape::polygon(Polyline{a + along * i0, a + along * i1, a + along * i1 + n * h, a + along * i0 + n * h});
    const double reach = half + double(std::max(b.maxClearance(), 2 * wire.width));
    bool blocked = false;
    idx.query(rect.bbox().inflated(reach), LayerMask(1) << wire.layer, [&](ItemRef r) {
      if (blocked || (r.type == ItemType::Track && r.index == self)) return;
      if (r.type == ItemType::Track && wire.serp >= 0 && b.tracks[size_t(r.index)].serp == wire.serp) return;  // (the serpent's own pieces)
      // (A copper area is no obstacle: its pour gives way to wires, and is poured anew after.)
      if (r.type != ItemType::Track && r.type != ItemType::Pad && r.type != ItemType::Via) return;
      const int net = itemNet(b, r);
      const std::vector<Shape> shapes = itemShapes(b, r, 0, wire.layer);
      if (net == wire.net) {
        if (!inner) return;
        // What the piece itself ends on or runs into — its neighbours along the wire, the pad or via it comes
        // to — is no obstacle.
        if (r.type == ItemType::Track) {
          const Track& t = b.tracks[size_t(r.index)];
          for (Vec2 q : {t.a.v(), t.b.v()})
            if ((q - a).len() <= kJoin || (q - c).len() <= kJoin) return;
        } else if (r::any_of(shapes, [&](const Shape& o) { return o.distance(a) <= 0 || o.distance(c) <= 0; })) {
          return;
        }
        for (const Shape& o : shapes) blocked = blocked || inner->distance(o, own) < own;
        return;
      }
      const double need = half + double(b.clearance(wire.net, net, wire.layer));
      for (const Shape& o : shapes) blocked = blocked || rect.distance(o, need) < need;
    });
    if (blocked) return false;
    for (const Reserved& o : held) {
      if (o.layer != wire.layer) continue;
      const double need = o.net == wire.net ? own : half + double(b.clearance(wire.net, o.net, wire.layer));
      if (rect.distance(o.area, need) < need) return false;
    }
    for (const Keepout& k : b.keepouts) {
      if (!k.onLayer(wire.layer) || !k.wires) continue;
      for (const Shape& o : k.shapes())
        if (rect.distance(o, half) < half) return false;
    }
    if (!b.outline.empty()) {
      const double edge = h + half + double(b.edgeClearance);
      if (!b.onBoard(sa + n * edge) || !b.onBoard(sc + n * edge)) return false;
    }
    return true;
  };
  if (free(most)) return most;
  double lo = 0, hi = most;
  for (int it = 0; it < 12; ++it) {
    const double mid = (lo + hi) / 2;
    (free(mid) ? lo : hi) = mid;
  }
  return lo;
}

// The room beside the chord a → c in steps of p along it, on side A and on side B.
std::pair<std::vector<double>, std::vector<double>> stepRooms(const Board& b, const SpatialIndex& idx, const std::vector<Reserved>& held, Vec2 a, Vec2 c, int self,
                                                              double p, double most) {
  const double C = (c - a).len();
  const int steps = std::max(1, int(std::floor(C / p + 1e-6)));
  const Vec2 dir = (c - a) / C, nA{dir.y, -dir.x};
  std::vector<double> ra(static_cast<size_t>(steps), 0.0), rb(static_cast<size_t>(steps), 0.0);
  for (int i = 0; i < steps; ++i) {
    const double x0 = i * p, x1 = i + 1 == steps ? C : (i + 1) * p;
    ra[size_t(i)] = roomBeside(b, idx, held, a, c, x0, x1, nA, self, most);
    rb[size_t(i)] = roomBeside(b, idx, held, a, c, x0, x1, nA * -1.0, self, most);
  }
  return {std::move(ra), std::move(rb)};
}

// Where on the piece a → c a serpent has the most room: the piece is looked at in steps of p, the room beside
// each on either side found, and the run of steps taken that holds the most — the number of bends by the height
// both sides give them (the least over the run). None: no run with room for a bend worth making.
struct SerpentPlace {
  double x0 = 0, x1 = 0;  // along the piece
  double hA = 0, hB = 0;
};
std::optional<SerpentPlace> bestPlace(const Board& b, const SpatialIndex& idx, const std::vector<Reserved>& held, Vec2 a, Vec2 c, int self, double p) {
  const double C = (c - a).len();
  const int steps = int(std::floor(C / p + 1e-6));
  if (steps < 3) return std::nullopt;
  const double most = 6 * p;
  const auto [ra, rb] = stepRooms(b, idx, held, a, c, self, p, most);
  std::optional<SerpentPlace> best;
  double bestGain = 0;
  for (int i = 0; i < steps; ++i) {
    double ha = most, hb = most;
    for (int j = i; j < steps; ++j) {
      ha = std::min(ha, ra[size_t(j)]);
      hb = std::min(hb, rb[size_t(j)]);
      const int bends = j - i;  // (a chord of k steps holds k − 1 bends)
      if (bends < 2 || std::max(ha, hb) < p / 2) continue;
      const double gain = bends * (ha + hb);
      if (gain > bestGain) bestGain = gain, best = SerpentPlace{i * p, j + 1 == steps ? C : (j + 1) * p, ha, hb};
    }
  }
  return best;
}

}  // namespace

namespace {

// The first rule not kept that names a signal which can be made longer: the signal, by how much (in the rule's
// units, `time`: ps, else nm) — into the allowed span by a quarter of it, not onto its edge. None: all the rules
// are kept, or what is not kept cannot be mended by making a signal of `delays` longer.
struct Shortage {
  int signal = -1;  // into `delays`
  double amount = 0;
  bool time = false;
};
Shortage firstShortage(const std::vector<DelayViolation>& violations, const std::vector<SignalDelay>& delays, const std::set<std::string>& stuck) {
  for (const DelayViolation& v : violations) {
    std::string name;
    double need = 0, window = 0;
    switch (v.kind) {
      case DelayViolation::Kind::Equal:
      case DelayViolation::Kind::Mismatch: name = v.shorter, need = v.value - v.high, window = v.high; break;
      case DelayViolation::Kind::Relation:
        window = v.high - v.low;
        if (v.value > v.high) name = v.right, need = v.value - v.high;
        else name = v.left, need = v.low - v.value;
        break;
      case DelayViolation::Kind::Constant:
        window = v.high - v.low;
        if (v.value < v.low) name = v.shorter, need = v.low - v.value;
        break;
    }
    if (name.empty() || need <= 0 || stuck.contains(name)) continue;
    const auto it = r::find(delays, name, &SignalDelay::signal);
    if (it == delays.end() || !it->routed) continue;  // (a differential signal as a whole: its pair is not bent)
    return {int(it - delays.begin()), need + window / 4, v.time};
  }
  return {};
}

}  // namespace

AutoSerpents autoSerpents(Board& b) {
  AutoSerpents out;
  if (b.hispeed.delays.empty() && b.hispeed.diffSignals.empty()) return out;
  std::set<std::tuple<Coord, Coord, Coord, Coord>> tried;  // pieces no serpent fits on
  auto keyOf = [](const Track& t) { return std::tuple{t.a.x, t.a.y, t.b.x, t.b.y}; };
  std::set<int> counted;  // serpents counted as made or made longer
  std::set<int> widened;  // serpents whose trapezoid was looked at for more room

  // One thing done to make a signal longer by `amount` (ps when `time`, else nm): a serpent of its own made
  // longer within its trapezoid; or its trapezoid made higher, where there is room for that now; or a serpent
  // made on the longest straight piece of the signal's way that takes one. False: nothing can be done.
  auto lengthen = [&](const SignalDelay& signal, double amount, bool time) {
    auto nm = [&](LayerId layer) { return time ? amount / delayPsPerMm(b, layer) * double(kNmPerMm) : amount; };
    std::vector<int> own;
    for (int ti : signal.tracks) {
      const Track& t = b.tracks[size_t(ti)];
      if (t.serp >= 0 && t.zip < 0 && !r::contains(own, t.serp)) own.push_back(t.serp);
    }
    for (int sp : own) {
      const auto run = serpentRun(b, sp);
      if (!run) continue;
      Serpent want = b.serpents[size_t(sp)];
      const SerpentShape now = serpentShape(run->a, run->b, want, run->width);
      if (now.maxLength - run->drawn < 1000.0) continue;
      want.length = std::min(run->drawn + nm(run->layer), now.maxLength);
      if (!setSerpent(b, sp, want)) continue;
      if (counted.insert(sp).second) ++out.raised;
      return true;
    }
    for (int sp : own) {
      const auto run = serpentRun(b, sp);
      if (!run || !widened.insert(sp).second) continue;
      SpatialIndex idx;
      idx.build(b, true, true);
      const std::vector<Reserved> held = reservedAreas(b, sp);
      const double p = b.serpents[size_t(sp)].gap + double(run->width);
      const auto [ra, rb] = stepRooms(b, idx, held, run->a, run->b, run->tracks.front(), p, 6 * p);
      Serpent want = b.serpents[size_t(sp)];
      want.h1 = want.h4 = std::max(r::min(ra), std::max(want.h1, want.h4));
      want.h2 = want.h3 = std::max(r::min(rb), std::max(want.h2, want.h3));
      const double most = serpentShape(run->a, run->b, want, run->width).maxLength;
      if (most - run->drawn < 1000.0) continue;
      want.length = std::min(run->drawn + nm(run->layer), most);
      const double before = run->drawn;
      if (!setSerpent(b, sp, want) || serpentRun(b, sp)->drawn - before < 1000.0) continue;
      if (counted.insert(sp).second) ++out.raised;
      return true;
    }
    std::vector<int> pieces;
    for (int ti : signal.tracks) {
      const Track& t = b.tracks[size_t(ti)];
      const double p = 3.0 * double(t.width);
      if (!t.isArc() && !t.locked && t.zip < 0 && t.serp < 0 && t.length() >= 3 * p && !tried.contains(keyOf(t))) pieces.push_back(ti);
    }
    if (pieces.empty()) return false;
    r::sort(pieces, std::greater{}, [&](int ti) { return b.tracks[size_t(ti)].length(); });
    SpatialIndex idx;
    idx.build(b, true, true);
    const std::vector<Reserved> held = reservedAreas(b);
    for (int ti : pieces) {
      const Track piece = b.tracks[size_t(ti)];
      const Vec2 a = piece.a.v(), c = piece.b.v();
      const double C = (c - a).len(), p = 3.0 * double(piece.width);
      const Vec2 dir = (c - a) / C, nA{dir.y, -dir.x};
      tried.insert(keyOf(piece));
      const auto place = bestPlace(b, idx, held, a, c, ti, p);
      if (!place) continue;
      const int sp = makeSerpent(b, {ti});
      if (sp < 0) continue;
      Serpent want = b.serpents[size_t(sp)];
      want.h1 = want.h4 = std::max(place->hA, 1.0);
      want.h2 = want.h3 = std::max(place->hB, 1.0);
      const double chord = place->x1 - place->x0;
      want.length = chord + nm(piece.layer);
      const Vec2 from = a + dir * place->x0, to = a + dir * place->x1;
      const bool laid = setSerpent(b, sp, want, place->x0 > 1.0 ? &from : nullptr, place->x1 < C - 1.0 ? &to : nullptr);
      if (!laid || serpentRun(b, sp)->drawn - chord < 1000.0) {
        // (Back to the plain piece: the serpent straight between the piece's ends, then no serpent.)
        if (laid) {
          want.length = 0;
          setSerpent(b, sp, want, &a, &c);
        }
        unmakeSerpent(b, sp);
        continue;
      }
      // The trapezoid is left no higher than the bends stand: the room they do not take is the neighbours'.
      const auto run = serpentRun(b, sp);
      double up = 0, down = 0;
      for (int k : run->tracks)
        for (Vec2 q : {b.tracks[size_t(k)].a.v(), b.tracks[size_t(k)].b.v()}) {
          const double y = (q - run->a).dot(nA);
          up = std::max(up, y), down = std::max(down, -y);
        }
      Serpent tight = b.serpents[size_t(sp)];
      tight.h1 = tight.h4 = std::min(want.h1, up + 100.0);
      tight.h2 = tight.h3 = std::min(want.h2, down + 100.0);
      tight.length = run->drawn;
      const std::vector<Track> asLaid = b.tracks;
      if (!setSerpent(b, sp, tight) || std::abs(serpentRun(b, sp)->drawn - tight.length) > 100.0) {
        b.tracks = asLaid;  // (it would not be the same serpent: the trapezoid as it was)
        b.serpents[size_t(sp)] = want;
      }
      ++out.made;
      counted.insert(sp);
      return true;
    }
    return false;
  };

  // What every signal is to have for all the rules to be kept, found on the numbers alone: the rules are looked
  // at again and again, the signal each finds short given what it lacks, until none is found. (A signal's length
  // and delay go together, by its own delay per length.)
  const std::vector<SignalDelay> base = signalDelays(b);
  std::vector<SignalDelay> want = base;
  {
    std::set<std::string> none;
    for (int guard = 0; guard < 20000; ++guard) {
      const Shortage lack = firstShortage(checkDelays(b, want), want, none);
      if (lack.signal < 0) break;
      SignalDelay& d = want[size_t(lack.signal)];
      if (d.length <= 0 || d.ps <= 0) {
        none.insert(d.signal);
        continue;
      }
      const double perNm = d.ps / d.length;
      d.ps += lack.time ? lack.amount : lack.amount * perNm;
      d.length += lack.time ? lack.amount / perNm : lack.amount;
    }
  }
  // The signals are made longer by what they lack, the one that lacks the most first: it takes its room before
  // those that need little of it.
  std::vector<int> order;
  for (int i = 0; i < int(base.size()); ++i)
    if (want[size_t(i)].ps - base[size_t(i)].ps > 1e-6) order.push_back(i);
  r::sort(order, std::greater{}, [&](int i) { return want[size_t(i)].ps - base[size_t(i)].ps; });
  for (int i : order)
    for (int guard = 0; guard < 50; ++guard) {
      const std::vector<SignalDelay> now = signalDelays(b);
      const auto it = r::find(now, base[size_t(i)].signal, &SignalDelay::signal);
      if (it == now.end() || !it->routed) break;
      const double lack = want[size_t(i)].ps - it->ps;
      if (lack <= 1e-4 || !lengthen(*it, lack, true)) break;
    }
  // What is still not kept (the delay per length differs by the layer; a signal that found no room): the rules
  // looked at on the board itself, as long as something can be done.
  std::set<std::string> stuck;
  for (int guard = 0; guard < 2000; ++guard) {
    const std::vector<SignalDelay> delays = signalDelays(b);
    const Shortage lack = firstShortage(checkDelays(b, delays), delays, stuck);
    if (lack.signal < 0) break;
    if (!lengthen(delays[size_t(lack.signal)], lack.amount, lack.time)) stuck.insert(delays[size_t(lack.signal)].signal);
  }
  out.left = int(checkDelays(b).size());
  return out;
}

}  // namespace xr
