#include "router/topo/Realizer.h"

#include "core/SpatialIndex.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <algorithm>
#include <flat_map>
#include <flat_set>
#include <cstdlib>
#include <map>
#include <memory>
#include <numeric>
#include <optional>
#include <set>
#include <print>

namespace xr::topo {

namespace {

using K = CGAL::Exact_predicates_inexact_constructions_kernel;
using Vb = CGAL::Triangulation_vertex_base_with_info_2<int, K>;
using Fb = CGAL::Constrained_triangulation_face_base_2<K>;
using Tds = CGAL::Triangulation_data_structure_2<Vb, Fb>;
using CDT = CGAL::Constrained_Delaunay_triangulation_2<K, Tds, CGAL::Exact_predicates_tag>;
using CPoint = CDT::Point;

constexpr double kMargin = kRealizeMargin;

// An obstacle point: pads contribute their centre (circles), segment ends (ovals) or core polygon
// corners; vias their centre; the outline its vertices.
struct OPt {
  Vec2 p;
  double r = 0;
  double clr = 0;
  int net = kNoNet;
};

struct Side {
  int to;      // neighbouring obstacle point
  double r;    // half width of the side (pad edge: corner radius, stub wire: width / 2)
};

struct LayerObstacles {
  std::vector<OPt> pts;
  std::vector<std::pair<int, int>> constraints;
  std::vector<std::vector<Side>> adj;  // sides incident to each obstacle point (pads, outline, stubs)

  int add(Vec2 p, double r, double clr, int net) {
    pts.push_back({p, r, clr, net});
    adj.emplace_back();
    return int(pts.size() - 1);
  }
  void link(int a, int c, double r) {
    constraints.push_back({a, c});
    adj[a].push_back({c, r});
    adj[c].push_back({a, r});
  }
  int nearest(Vec2 p, double tol) const {
    int best = -1;
    double bd = tol * tol;
    for (int i = 0; i < int(pts.size()); ++i)
      if ((pts[i].p - p).len2() <= bd) { bd = (pts[i].p - p).len2(); best = i; }
    return best;
  }
};

// Constrained Delaunay triangulation of the obstacle points of one layer, optionally without
// the points of one net. Vertex info = obstacle id.
std::unique_ptr<CDT> triangulate(const LayerObstacles& ob, int skipNet) {
  auto cdt = std::make_unique<CDT>();
  std::vector<CDT::Vertex_handle> vh(ob.pts.size());
  CDT::Face_handle hint;
  for (int i = 0; i < int(ob.pts.size()); ++i) {
    const OPt& o = ob.pts[i];
    if (skipNet != kNoNet && o.net == skipNet) continue;
    size_t before = cdt->number_of_vertices();
    auto h = cdt->insert(CPoint(o.p.x, o.p.y), hint);
    hint = h->face();
    if (cdt->number_of_vertices() > before) h->info() = i;
    vh[i] = h;
  }
  for (auto& [a, c] : ob.constraints)
    if (vh[a] != nullptr && vh[c] != nullptr && vh[a] != vh[c]) cdt->insert_constraint(vh[a], vh[c]);
  for (auto v = cdt->finite_vertices_begin(); v != cdt->finite_vertices_end(); ++v) {
    int id = v->info();
    if (id >= 0 && id < int(ob.pts.size()) && vh[id] == CDT::Vertex_handle(v)) continue;
    // Vertex created by intersecting constraints: map it to the nearest inserted obstacle.
    Vec2 p{v->point().x(), v->point().y()};
    int best = 0;
    double bd = std::numeric_limits<double>::max();
    for (int i = 0; i < int(ob.pts.size()); ++i)
      if (vh[i] != nullptr && (ob.pts[i].p - p).len2() < bd) { bd = (ob.pts[i].p - p).len2(); best = i; }
    v->info() = best;
  }
  return cdt;
}

struct Portal {
  int l, r;  // obstacle ids (or kStart/kEnd)
};

struct Apex {
  int id;      // obstacle id
  int side;    // +1 obstacle on the left (path turns counter-clockwise), -1 on the right
  int portal;  // index in the full portal list (start = 0)
};

// Where a sketch crosses the edges of a triangulation (cancelled back-and-forth crossings removed).
struct EdgeHit {
  int u, v;     // obstacle ids, u < v
  double t;     // position along u -> v
  bool uLeft;   // u lies to the left of the direction of travel
};

std::vector<EdgeHit> crossings(const CDT& cdt, const Polyline& sk) {
  std::vector<EdgeHit> out;
  if (sk.size() < 2) return out;
  CDT::Face_handle f = cdt.locate(CPoint(sk[0].x, sk[0].y));
  auto P = [](const CDT::Vertex_handle& v) { return Vec2{v->point().x(), v->point().y()}; };
  for (size_t s = 1; s < sk.size(); ++s) {
    Vec2 p = sk[s - 1], q = sk[s];
    if ((q - p).len2() < 1) continue;
    int entry = -1;
    for (int guard = 0; guard < 100000; ++guard) {
      if (f == nullptr || cdt.is_infinite(f)) return out;
      Vec2 a0 = P(f->vertex(0)), a1 = P(f->vertex(1)), a2 = P(f->vertex(2));
      if (orient(a0, a1, q) >= 0 && orient(a1, a2, q) >= 0 && orient(a2, a0, q) >= 0) break;
      int exit = -1;
      for (int i = 0; i < 3 && exit < 0; ++i) {
        if (i == entry) continue;
        Vec2 a = P(f->vertex((i + 1) % 3)), b = P(f->vertex((i + 2) % 3));
        double oa = orient(p, q, a), ob = orient(p, q, b);
        if (orient(a, b, q) < 0 && ((oa >= 0 && ob <= 0) || (oa <= 0 && ob >= 0))) exit = i;
      }
      if (exit < 0) return out;
      auto va = f->vertex((exit + 1) % 3), vb = f->vertex((exit + 2) % 3);
      Vec2 a = P(va), b = P(vb);
      double den = (b - a).cross(q - p);
      double t = std::abs(den) > 0 ? (p - a).cross(q - p) / den : 0.5;
      int u = va->info(), v = vb->info();
      bool uLeft = orient(p, q, a) > 0;
      if (u > v) {
        std::swap(u, v);
        t = 1 - t;
        uLeft = !uLeft;
      }
      bool touchesEnd = distPointSegment(sk.front(), a, b) < 1 || distPointSegment(sk.back(), a, b) < 1;
      if (touchesEnd) {
      } else if (!out.empty() && out.back().u == u && out.back().v == v) out.pop_back();  // went back
      else out.push_back({u, v, std::clamp(t, 0.0, 1.0), uLeft});
      auto n = f->neighbor(exit);
      entry = n->index(f);
      f = n;
    }
  }
  return out;
}

struct Circle {
  Vec2 c;
  double rho = 0;   // signed radius: + counter-clockwise (obstacle on the left)
  int obst = -1;    // obstacle id, -1 for the end points
  int portal = 0;   // index in the portal list
};

// Directed common tangent leaving circle a and arriving at circle b.
bool tangent(const Circle& a, const Circle& b, Vec2& pa, Vec2& pb) {
  Vec2 D = b.c - a.c;
  double dr = b.rho - a.rho;
  double D2 = D.len2();
  if (D2 <= dr * dr + 1e-6) return false;
  double L = std::sqrt(D2 - dr * dr);
  Vec2 d{(L * D.x + dr * D.y) / D2, (-dr * D.x + L * D.y) / D2};
  Vec2 nL = d.perp();
  pa = a.c - nL * a.rho;
  pb = b.c - nL * b.rho;
  return true;
}

double sweepOf(const Circle& c, Vec2 in, Vec2 out) {
  double ai = std::atan2(in.y - c.c.y, in.x - c.c.x);
  double ao = std::atan2(out.y - c.c.y, out.x - c.c.x);
  if (c.rho > 0) return normalizeAngle(ao - ai);
  return -normalizeAngle(ai - ao);
}


LayerObstacles collect(const Board& b, LayerId layer, const std::vector<RealVia>& vias, const RealizeOptions& opt) {
  LayerObstacles ob;
  for (const Pad& pad : b.pads) {
    double clr = double(b.classOf(pad.net).clearance);
    if (!pad.onLayer(layer)) {
      if (pad.drill > 0 && !pad.copper) ob.add(pad.pos.v(), pad.drill / 2.0, clr, kNoNet);
      continue;
    }
    Shape s = pad.shapeGeom();
    switch (s.kind) {
      case Shape::Kind::Point: ob.add(s.a, s.r, clr, pad.net); break;
      case Shape::Kind::Segment: {
        int i = ob.add(s.a, s.r, clr, pad.net), j = ob.add(s.b, s.r, clr, pad.net);
        ob.link(i, j, s.r);
        break;
      }
      case Shape::Kind::Polygon: {
        int first = int(ob.pts.size());
        for (auto& c : s.poly) ob.add(c, s.r, clr, pad.net);
        int n = int(s.poly.size());
        for (int k = 0; k < n; ++k) ob.link(first + k, first + (k + 1) % n, s.r);
        break;
      }
    }
  }
  for (const Via& v : b.vias)
    if (v.onLayer(layer)) ob.add(v.pos.v(), v.diameter / 2.0, double(b.classOf(v.net).clearance), v.net);
  for (const RealVia& v : vias) ob.add(v.pos, v.diameter / 2.0, double(b.classOf(v.net).clearance), v.net);
  for (auto& loop : b.outline) {
    int first = int(ob.pts.size());
    int n = int(loop.size());
    for (auto& p : loop) ob.add(p, 0, double(b.edgeClearance), -2);  // -2: belongs to no net, blocks all
    for (int k = 0; k < n; ++k) ob.link(first + k, first + (k + 1) % n, 0);
  }
  if (opt.tracksAsObstacles)
    for (const Track& t : b.tracks) {
      if (t.layer != layer) continue;
      double r = t.width / 2.0, clr = double(b.classOf(t.net).clearance);
      int prev = -1;
      for (Vec2 p : t.path(20000)) {
        int o = ob.add(p, r, clr, t.net);
        if (prev >= 0) ob.link(prev, o, r);
        prev = o;
      }
    }
  return ob;
}


// Slot of one wire on one crossed edge: the interval of centre-line positions along u -> v that keeps
// the required spacing to the end obstacles and to the other wires crossing the same edge.
struct Slot {
  double lo = 0, hi = 0;  // distances from u
  double ru = 0, rv = 0;  // bend radii around u and v implied by the slot bounds
};

struct FunnelApex {
  int portal;  // index into the portal list (0 = start, last = end)
  int side;    // +1 left endpoint, -1 right endpoint
};

// Simple stupid funnel over segment portals; returns the apexes between start and end.
std::vector<FunnelApex> funnel(const std::vector<std::pair<Vec2, Vec2>>& portals) {
  std::vector<FunnelApex> path;
  auto L = [&](int i) { return portals[i].first; };
  auto R = [&](int i) { return portals[i].second; };
  int apex = 0, left = 0, right = 0;
  Vec2 A = L(0), lp = L(0), rp = R(0);
  for (int i = 1; i < int(portals.size()); ++i) {
    Vec2 li = L(i), ri = R(i);
    if (orient(A, rp, ri) >= 0) {
      if ((rp - A).len2() < 1 || orient(A, lp, ri) < 0) {
        rp = ri;
        right = i;
      } else {
        path.push_back({left, +1});
        A = lp;
        apex = left;
        lp = rp = A;
        left = right = apex;
        i = apex;
        continue;
      }
    }
    if (orient(A, lp, li) <= 0) {
      if ((lp - A).len2() < 1 || orient(A, rp, li) > 0) {
        lp = li;
        left = i;
      } else {
        path.push_back({right, -1});
        A = rp;
        apex = right;
        lp = rp = A;
        left = right = apex;
        i = apex;
        continue;
      }
    }
  }
  std::erase_if(path, [&](const FunnelApex& a) { return a.portal <= 0 || a.portal + 1 >= int(portals.size()); });
  return path;
}

}  // namespace

RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                     const RealizeOptions& opt) {
  RealizeStats st;
  const int NW = int(wires.size());
  std::flat_map<LayerId, std::vector<int>> byLayer;
  for (int wi = 0; wi < NW; ++wi) byLayer[wires[wi].layer].push_back(wi);

  // Each wire's crossings of the common triangulation of all obstacles of its layer, then the
  // slot of every crossing from the ordered crossings of that edge.
  std::vector<std::vector<EdgeHit>> hits(NW);
  std::vector<std::vector<Slot>> slots(NW);
  std::map<LayerId, LayerObstacles> obstacles;
  for (auto&& [layer, ids] : byLayer) {
    LayerObstacles& ob = obstacles.emplace(layer, collect(b, layer, vias, opt)).first->second;
    auto cdt = triangulate(ob, kNoNet);
    std::map<std::pair<int, int>, std::vector<std::pair<int, int>>> onEdge;  // edge -> (wire, hit index)
    for (int wi : ids) {
      if (cdt->number_of_vertices() >= 3) hits[wi] = crossings(*cdt, wires[wi].sketch);
      slots[wi].resize(hits[wi].size());
      for (int k = 0; k < int(hits[wi].size()); ++k) onEdge[{hits[wi][k].u, hits[wi][k].v}].push_back({wi, k});
    }
    for (auto& [uv, list] : onEdge) {
      const OPt& U = ob.pts[uv.first];
      const OPt& V = ob.pts[uv.second];
      double L = (V.p - U.p).len();
      std::ranges::sort(list, {}, [&](auto wk) { return hits[wk.first][wk.second].t; });
      int n = int(list.size());
      // Stack from u: a[k] = centre-line distance of wire k from u when all inner wires are packed.
      std::vector<double> a(n), bb(n);
      // Own-net obstacles (the wire's pad corners, its vias) are no constraint: the centre line may
      // pass through the point itself, so no radius there at all.
      auto own = [&](const OPt& o, const RealWire& w) { return o.net == w.net && w.net != kNoNet; };
      auto need = [&](const OPt& o, const RealWire& w) {
        return own(o, w) ? 0.0 : o.r + std::max(o.clr, double(w.clearance)) + kMargin + w.width / 2.0;
      };
      for (int k = 0; k < n; ++k) {
        const RealWire& w = wires[list[k].first];
        a[k] = k == 0 ? need(U, w)
                      : a[k - 1] + wires[list[k - 1].first].width / 2.0 +
                            std::max(double(wires[list[k - 1].first].clearance), double(w.clearance)) + kMargin +
                            w.width / 2.0;
      }
      for (int k = n - 1; k >= 0; --k) {
        const RealWire& w = wires[list[k].first];
        bb[k] = k == n - 1 ? need(V, w)
                           : bb[k + 1] + wires[list[k + 1].first].width / 2.0 +
                                 std::max(double(wires[list[k + 1].first].clearance), double(w.clearance)) + kMargin +
                                 w.width / 2.0;
      }
      double slack = L - a[n - 1] - bb[n - 1];
      for (int k = 0; k < n; ++k) {
        Slot& sl = slots[list[k].first][list[k].second];
        if (slack <= 0) {
          // Overflow: keep the order, share the deficit (a violation the DRC will report).
          double scale = (L > 0) ? L / (a[n - 1] + bb[n - 1]) : 1.0;
          sl.lo = sl.hi = a[k] * scale;
        } else {
          // Packed bounds: the whole feasible interval. Taut non-crossing paths keep their order on
          // every edge, and bends around the end obstacles get the packed (minimal) radius.
          sl.lo = a[k];
          sl.hi = L - bb[k];
        }
        sl.ru = sl.lo;
        sl.rv = L - sl.hi;
      }
    }
  }

  // Taut path of every wire inside its slots: funnel over the slot segments, apexes become bends
  // around the edge end obstacles with the slot radius, consecutive bends around one obstacle merge.
  for (int wi = 0; wi < NW; ++wi) {
    const RealWire& w = wires[wi];
    const LayerObstacles& ob = obstacles.at(w.layer);
    auto emitSeg = [&](Vec2 p, Vec2 q) {
      Track t;
      t.a = Point(p);
      t.b = Point(q);
      t.width = w.width;
      t.layer = w.layer;
      t.net = w.net;
      if (t.a == t.b) return;
      b.tracks.push_back(t);
      st.trackWire.push_back(wi);
    };
    if (w.sketch.size() < 2) continue;
    std::vector<std::pair<Vec2, Vec2>> portals;
    portals.push_back({w.sketch.front(), w.sketch.front()});
    for (int k = 0; k < int(hits[wi].size()); ++k) {
      const EdgeHit& h = hits[wi][k];
      const Slot& sl = slots[wi][k];
      Vec2 U = ob.pts[h.u].p, V = ob.pts[h.v].p;
      double L = (V - U).len();
      Vec2 d = L > 0 ? (V - U) / L : Vec2{};
      Vec2 nearU = U + d * sl.lo, nearV = U + d * sl.hi;
      portals.push_back(h.uLeft ? std::pair{nearU, nearV} : std::pair{nearV, nearU});
    }
    portals.push_back({w.sketch.back(), w.sketch.back()});
    auto apexes = funnel(portals);

    std::vector<Circle> cs;
    cs.push_back({w.sketch.front(), 0, -1, 0});
    for (const FunnelApex& ap : apexes) {
      const EdgeHit& h = hits[wi][ap.portal - 1];
      const Slot& sl = slots[wi][ap.portal - 1];
      bool atU = (ap.side > 0) == h.uLeft;  // the apex endpoint lies on u's side of the slot
      int o = atU ? h.u : h.v;
      double R = atU ? sl.ru : sl.rv;
      if (!cs.empty() && cs.back().obst == o && (cs.back().rho > 0) == (ap.side > 0)) {
        cs.back().rho = ap.side * std::max(std::abs(cs.back().rho), R);
      } else {
        cs.push_back({ob.pts[o].p, ap.side * R, o, ap.portal});
      }
    }
    cs.push_back({w.sketch.back(), 0, -1, int(portals.size()) - 1});
    if (std::getenv("XR_DEBUG2")) {
      std::print(stderr, "wire {} net {} sketch {} hits {} bends:", wi, b.nets[w.net].name, w.sketch.size(), hits[wi].size());
      for (auto& c : cs) std::print(stderr, " [o{} rho{:+.3f} ({:.3f},{:.3f})]", c.obst, c.rho / 1e6, c.c.x / 1e6, c.c.y / 1e6);
      std::println(stderr, "");
    }

    // Tangents between consecutive circles; degenerate configurations drop the weaker bend. A
    // straight segment between two bends is a chord that may cut inside the slot radius of an
    // obstacle whose fan edges it crosses (the inner wire's arc bulges there): such an obstacle
    // becomes a bend too.
    std::vector<Vec2> ti, to;
    int shrinks = 0;
    std::flat_set<int> dropped;
    for (int iter = 0; iter < 400; ++iter) {
      size_t n = cs.size();
      ti.assign(n, {});
      to.assign(n, {});
      int bad = -1;
      for (size_t k = 0; k + 1 < n && bad < 0; ++k)
        if (!tangent(cs[k], cs[k + 1], to[k], ti[k + 1])) {
          if (k > 0 && k + 1 < n - 1 && cs[k].rho * cs[k + 1].rho < 0) {
            double D = (cs[k + 1].c - cs[k].c).len();
            double deficit = std::abs(cs[k].rho) + std::abs(cs[k + 1].rho) - D;
            if (deficit > 0 && deficit < 30000 && shrinks < 8) {
              double f = (D - 1000) / (std::abs(cs[k].rho) + std::abs(cs[k + 1].rho));
              cs[k].rho *= f;
              cs[k + 1].rho *= f;
              ++shrinks;
              bad = -2;
              break;
            }
          }
          if (k == 0 || k + 1 == n - 1) {
            Circle& c = cs[k == 0 ? 1 : k];
            double d = (c.c - cs[k == 0 ? 0 : n - 1].c).len();
            if (n > 2 && d > 2000 && std::abs(c.rho) > d - 1000) {
              c.rho = (c.rho > 0 ? 1 : -1) * (d - 1000);
              bad = -2;
              break;
            }
          }
          if (k == 0) bad = 1;
          else if (k + 1 == n - 1) bad = int(k);
          else bad = std::abs(cs[k].rho) < std::abs(cs[k + 1].rho) ? int(k) : int(k + 1);
        }
      if (bad == -2) continue;
      for (size_t k = 1; k + 1 < n && bad < 0; ++k)
        if (std::abs(sweepOf(cs[k], ti[k], to[k])) > 1.6 * kPi) bad = int(k);
      if (bad > 0 && bad < int(n) - 1) {
        dropped.insert(cs[bad].obst);
        if (std::getenv("XR_DEBUG4"))
          std::println(stderr, "drop wire {} net {} bend {} of {}: o{} rho {:+.3f} at ({:.3f},{:.3f}); prev o{} rho {:+.3f} next o{} rho {:+.3f}",
                       wi, b.nets[w.net].name, bad, n, cs[bad].obst, cs[bad].rho / 1e6, cs[bad].c.x / 1e6, cs[bad].c.y / 1e6,
                       cs[bad - 1].obst, cs[bad - 1].rho / 1e6, cs[bad + 1].obst, cs[bad + 1].rho / 1e6);
        cs.erase(cs.begin() + bad);
        ++st.droppedApexes;
        continue;
      }
      // Worst slot-radius intrusion of a straight segment.
      double worst = 1000;
      int at = -1;
      Circle ins;
      for (size_t k = 0; k + 1 < n; ++k) {
        Vec2 p = k == 0 ? cs[0].c : to[k];
        Vec2 q = k + 1 == n - 1 ? cs[n - 1].c : ti[k + 1];
        if ((q - p).len2() < 1) continue;
        for (int hi = cs[k].portal; hi < cs[k + 1].portal; ++hi) {
          if (hi < 1 || hi > int(hits[wi].size())) continue;
          const EdgeHit& h = hits[wi][hi - 1];
          const Slot& sl = slots[wi][hi - 1];
          for (auto [o, R] : {std::pair{h.u, sl.ru}, std::pair{h.v, sl.rv}}) {
            if (R <= 0 || dropped.contains(o) || std::ranges::any_of(cs, [&](const Circle& x) { return x.obst == o; }))
              continue;
            Vec2 c = ob.pts[o].p;
            double t = (c - p).dot(q - p) / (q - p).len2();
            if (t <= 0 || t >= 1) continue;
            double pen = R - distPointSegment(c, p, q);
            if (pen > worst) {
              worst = pen;
              at = int(k) + 1;
              ins = {c, (orient(p, q, c) > 0 ? 1 : -1) * R, o, hi};
            }
          }
        }
      }
      if (at < 0) break;
      cs.insert(cs.begin() + at, ins);
    }
    size_t n = cs.size();
    Vec2 cur = cs[0].c;
    for (size_t k = 0; k + 1 < n; ++k) {
      Vec2 p = (k == 0) ? cs[0].c : to[k];
      Vec2 q = (k + 1 == n - 1) ? cs[n - 1].c : ti[k + 1];
      emitSeg(cur, p);
      emitSeg(p, q);
      cur = q;
      if (k + 1 < n - 1) {
        const Circle& C = cs[k + 1];
        double sw = sweepOf(C, ti[k + 1], to[k + 1]);
        double sagitta = std::abs(C.rho) * (1 - std::cos(sw / 2));
        if (sagitta > 1000) {
          auto g = ArcGeom::fromCenter(C.c, ti[k + 1], sw);
          Track t;
          t.a = Point(ti[k + 1]);
          t.mid = Point(g.mid());
          t.b = Point(to[k + 1]);
          t.width = w.width;
          t.layer = w.layer;
          t.net = w.net;
          b.tracks.push_back(t);
          st.trackWire.push_back(wi);
          ++st.arcs;
          cur = to[k + 1];
        }
      }
    }
    ++st.wires;
  }

  for (const RealVia& v : vias) {
    Via bv;
    bv.pos = Point(v.pos);
    bv.diameter = v.diameter;
    bv.drill = v.drill;
    bv.layers = b.allCopperMask();
    bv.net = v.net;
    b.vias.push_back(bv);
  }
  return st;
}

RealizeStats reshapeTracks(Board& b, std::vector<char> chosen, std::vector<RealWire>* wiresOut) {
  chosen.resize(b.tracks.size(), 0);
  // Grow the choice to whole chains of the same net and layer.
  auto key = [](Point p) { return std::pair{p.x / 1000, p.y / 1000}; };  // 1 um buckets
  std::map<std::pair<Coord, Coord>, std::vector<int>> ends;
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    ends[key(b.tracks[i].a)].push_back(int(i));
    ends[key(b.tracks[i].b)].push_back(int(i));
  }
  auto sameChain = [&](int i, int j) {
    return b.tracks[i].net == b.tracks[j].net && b.tracks[i].layer == b.tracks[j].layer && !b.tracks[j].locked;
  };
  std::vector<int> stack;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i]) stack.push_back(int(i));
  while (!stack.empty()) {
    int i = stack.back();
    stack.pop_back();
    for (Point p : {b.tracks[i].a, b.tracks[i].b})
      for (int j : ends[key(p)])
        if (!chosen[j] && sameChain(i, j)) {
          chosen[j] = 1;
          stack.push_back(j);
        }
  }
  // Degree of each end point among chosen tracks of the same net/layer; vias and pads also end chains.
  std::map<std::pair<Coord, Coord>, int> degree;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i]) {
      degree[key(b.tracks[i].a)]++;
      degree[key(b.tracks[i].b)]++;
    }
  // Chains end at branch points and wherever a vertex touches a pad or via of its net: manual
  // routes often enter a pad off-centre, and the taut path must still pass through that copper.
  SpatialIndex idx;
  idx.build(b);
  auto onAnchor = [&](Point p, int net, LayerId layer) {
    bool hit = false;
    BBox q;
    q.add(p.v());
    idx.query(q.inflated(1000), LayerMask(1) << layer, [&](ItemRef r) {
      if (hit || (r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) != net) return;
      for (auto& s : itemShapes(b, r))
        if (s.distance(p.v()) <= 0) hit = true;
    });
    return hit;
  };
  auto isEnd = [&](Point p, const Track& t) { return degree[key(p)] != 2 || onAnchor(p, t.net, t.layer); };
  std::vector<char> used(b.tracks.size(), 0);
  std::vector<RealWire> wires;
  auto walkFrom = [&](int start, Point from) {
    RealWire w;
    const Track& t0 = b.tracks[start];
    w.net = t0.net;
    w.layer = t0.layer;
    w.width = t0.width;
    w.clearance = b.classOf(t0.net).clearance;
    Point cur = from;
    int ti = start;
    w.sketch.push_back(cur.v());
    while (true) {
      used[ti] = 1;
      const Track& t = b.tracks[ti];
      Point next = (key(t.a) == key(cur)) ? t.b : t.a;
      if (t.isArc()) {
        auto pts = t.path(20000);
        if (key(Point(pts.front())) != key(cur)) std::ranges::reverse(pts);
        for (size_t k = 1; k + 1 < pts.size(); ++k) w.sketch.push_back(pts[k]);
      }
      w.sketch.push_back(next.v());
      cur = next;
      if (isEnd(cur, t)) break;
      int cont = -1;
      for (int j : ends[key(cur)])
        if (chosen[j] && !used[j] && j != ti && sameChain(ti, j)) cont = j;
      if (cont < 0) break;
      ti = cont;
    }
    wires.push_back(std::move(w));
  };
  for (size_t i = 0; i < b.tracks.size(); ++i) {
    if (!chosen[i] || used[i]) continue;
    if (isEnd(b.tracks[i].a, b.tracks[i])) walkFrom(int(i), b.tracks[i].a);
    else if (isEnd(b.tracks[i].b, b.tracks[i])) walkFrom(int(i), b.tracks[i].b);
  }
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (chosen[i] && !used[i]) walkFrom(int(i), b.tracks[i].a);  // closed loops
  // A segment running through a pad or via of its own net (not at a vertex) connects it; the taut
  // path would leave it, so the chain is split at the point nearest to that anchor.
  std::vector<RealWire> split;
  for (auto& w : wires) {
    RealWire cur = w;
    cur.sketch.clear();
    cur.sketch.push_back(w.sketch.front());
    for (size_t k = 1; k < w.sketch.size(); ++k) {
      Vec2 p = w.sketch[k - 1], q = w.sketch[k];
      std::vector<std::pair<double, Vec2>> cuts;  // (parameter along p->q, point)
      BBox bb;
      bb.add(p);
      bb.add(q);
      idx.query(bb.inflated(w.width), LayerMask(1) << w.layer, [&](ItemRef r) {
        if ((r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) != w.net) return;
        Vec2 c = r.type == ItemType::Pad ? b.pads[r.index].pos.v() : b.vias[r.index].pos.v();
        Vec2 on = closestPointOnSegment(c, p, q);
        if ((on - p).len() < 1000 || (on - q).len() < 1000) return;  // already an end point
        for (auto& s : itemShapes(b, r))
          if (s.distance(on) <= 0) {
            cuts.push_back({(on - p).len(), on});
            return;
          }
      });
      std::ranges::sort(cuts, {}, [](auto& c) { return c.first; });
      for (auto& [d, pt] : cuts) {
        cur.sketch.push_back(pt);
        split.push_back(cur);
        cur.sketch.clear();
        cur.sketch.push_back(pt);
      }
      cur.sketch.push_back(q);
    }
    split.push_back(cur);
  }
  wires = std::move(split);
  if (wiresOut) *wiresOut = wires;
  if (wires.empty()) return {};
  std::vector<Track> keep;
  for (size_t i = 0; i < b.tracks.size(); ++i)
    if (!chosen[i]) keep.push_back(b.tracks[i]);
  b.tracks = std::move(keep);
  // Zone fills on the touched layers no longer match the copper: drop them (refill in the CAD).
  for (auto& z : b.zones)
    for (auto& w : wires)
      if (z.layer == w.layer) { z.filled.clear(); break; }
  RealizeOptions opt;
  opt.tracksAsObstacles = true;
  // All wires at once: nesting around shared obstacles keeps them apart. (Sequential realisation
  // with earlier wires as obstacles was tried and loses: a later sketch may cross an earlier taut
  // path and end up on the wrong side of it.)
  return realize(b, wires, {}, opt);
}

}  // namespace xr::topo
