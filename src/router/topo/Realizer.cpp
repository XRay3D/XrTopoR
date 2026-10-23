#include "router/topo/Realizer.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <algorithm>
#include <flat_map>
#include <flat_set>
#include <cstdlib>
#include <map>
#include <memory>
#include <print>

namespace xr::topo {

namespace {

using K = CGAL::Exact_predicates_inexact_constructions_kernel;
using Vb = CGAL::Triangulation_vertex_base_with_info_2<int, K>;
using Fb = CGAL::Constrained_triangulation_face_base_2<K>;
using Tds = CGAL::Triangulation_data_structure_2<Vb, Fb>;
using CDT = CGAL::Constrained_Delaunay_triangulation_2<K, Tds, CGAL::Exact_predicates_tag>;
using CPoint = CDT::Point;

constexpr int kStart = -1;
constexpr double kMargin = 5000;  // 5 um safety margin over the clearance (nm rounding of arcs)
constexpr int kEnd = -2;

// An obstacle point: pads contribute their centre (circles), segment ends (ovals) or core polygon
// corners; vias their centre; the outline its vertices.
struct OPt {
  Vec2 p;
  double r = 0;
  double clr = 0;
  int net = kNoNet;
};

struct LayerObstacles {
  std::vector<OPt> pts;
  std::vector<std::pair<int, int>> constraints;
};

struct Portal {
  int l, r;  // obstacle ids (or kStart/kEnd)
};

struct Apex {
  int id;      // obstacle id
  int side;    // +1 obstacle on the left (path turns counter-clockwise), -1 on the right
  int portal;  // index in the full portal list (start = 0)
};

Vec2 posOf(const LayerObstacles& ob, int id, Vec2 s, Vec2 e) {
  if (id == kStart) return s;
  if (id == kEnd) return e;
  return ob.pts[id].p;
}

// Walks the sketch through the triangulation and returns the sequence of crossed edges as portals
// (left/right endpoints relative to the direction of travel), with back-and-forth crossings cancelled.
bool walk(const CDT& cdt, const Polyline& sk, std::vector<Portal>& out) {
  out.clear();
  if (sk.size() < 2) return false;
  CDT::Face_handle f = cdt.locate(CPoint(sk[0].x, sk[0].y));
  if (f == nullptr) return false;
  auto P = [](const CDT::Vertex_handle& v) { return Vec2{v->point().x(), v->point().y()}; };
  for (size_t s = 1; s < sk.size(); ++s) {
    Vec2 p = sk[s - 1], q = sk[s];
    if ((q - p).len2() < 1) continue;
    int entry = -1;
    for (int guard = 0; guard < 100000; ++guard) {
      if (cdt.is_infinite(f)) return false;
      // Is q inside the current face?
      Vec2 a0 = P(f->vertex(0)), a1 = P(f->vertex(1)), a2 = P(f->vertex(2));
      if (orient(a0, a1, q) >= 0 && orient(a1, a2, q) >= 0 && orient(a2, a0, q) >= 0) break;
      int exit = -1;
      for (int i = 0; i < 3; ++i) {
        if (i == entry) continue;
        Vec2 a = P(f->vertex((i + 1) % 3)), b = P(f->vertex((i + 2) % 3));
        double oa = orient(p, q, a), ob = orient(p, q, b);
        if (orient(a, b, q) < 0 && ((oa >= 0 && ob <= 0) || (oa <= 0 && ob >= 0))) { exit = i; break; }
      }
      if (exit < 0) return false;
      auto va = f->vertex((exit + 1) % 3), vb = f->vertex((exit + 2) % 3);
      Vec2 a = P(va);
      Portal pt = orient(p, q, a) > 0 ? Portal{va->info(), vb->info()} : Portal{vb->info(), va->info()};
      // An edge through the start or end point is no constraint (pads in a column share x/y).
      bool touchesEnd = distPointSegment(sk.front(), a, P(vb)) < 1 || distPointSegment(sk.back(), a, P(vb)) < 1;
      if (touchesEnd) {
      } else if (!out.empty() && out.back().l == pt.r && out.back().r == pt.l) out.pop_back();  // went back
      else out.push_back(pt);
      auto n = f->neighbor(exit);
      entry = n->index(f);
      f = n;
    }
  }
  return true;
}

// Where a sketch crosses the edges of a triangulation (cancelled back-and-forth crossings removed).
struct EdgeHit {
  int u, v;  // obstacle ids, u < v
  double t;  // position along u -> v
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
      if (u > v) { std::swap(u, v); t = 1 - t; }
      bool touchesEnd = distPointSegment(sk.front(), a, b) < 1 || distPointSegment(sk.back(), a, b) < 1;
      if (touchesEnd) {
      } else if (!out.empty() && out.back().u == u && out.back().v == v) out.pop_back();  // went back
      else out.push_back({u, v, std::clamp(t, 0.0, 1.0)});
      auto n = f->neighbor(exit);
      entry = n->index(f);
      f = n;
    }
  }
  return out;
}

// Simple stupid funnel algorithm over point portals (first = start, last = end).
// Apex sides: +1 = left, -1 = right.
std::vector<Apex> funnel(const LayerObstacles& ob, Vec2 s, Vec2 e, const std::vector<Portal>& portals) {
  std::vector<Apex> path;
  auto pos = [&](int id) { return posOf(ob, id, s, e); };
  int apex = kStart, left = kStart, right = kStart;
  size_t apexIdx = 0, leftIdx = 0, rightIdx = 0;
  for (size_t i = 1; i < portals.size(); ++i) {
    int L = portals[i].l, R = portals[i].r;
    Vec2 A = pos(apex);
    // Right side.
    if (orient(A, pos(right), pos(R)) >= 0) {
      if (apex == right || orient(A, pos(left), pos(R)) < 0) {
        right = R;
        rightIdx = i;
      } else {
        path.push_back({left, +1, int(leftIdx)});
        apex = left;
        apexIdx = leftIdx;
        right = left = apex;
        rightIdx = leftIdx = apexIdx;
        i = apexIdx;
        continue;
      }
    }
    // Left side.
    if (orient(A, pos(left), pos(L)) <= 0) {
      if (apex == left || orient(A, pos(right), pos(L)) > 0) {
        left = L;
        leftIdx = i;
      } else {
        path.push_back({right, -1, int(rightIdx)});
        apex = right;
        apexIdx = rightIdx;
        right = left = apex;
        rightIdx = leftIdx = apexIdx;
        i = apexIdx;
        continue;
      }
    }
  }
  std::erase_if(path, [](const Apex& a) { return a.id < 0; });
  return path;
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


LayerObstacles collect(const Board& b, LayerId layer, const std::vector<RealVia>& vias) {
  LayerObstacles ob;
  auto add = [&](Vec2 p, double r, double clr, int net) {
    ob.pts.push_back({p, r, clr, net});
    return int(ob.pts.size() - 1);
  };
  for (const Pad& pad : b.pads) {
    double clr = double(b.classOf(pad.net).clearance);
    if (!pad.onLayer(layer)) {
      if (pad.drill > 0 && !pad.copper) add(pad.pos.v(), pad.drill / 2.0, clr, kNoNet);
      continue;
    }
    Shape s = pad.shapeGeom();
    switch (s.kind) {
      case Shape::Kind::Point: add(s.a, s.r, clr, pad.net); break;
      case Shape::Kind::Segment: {
        int i = add(s.a, s.r, clr, pad.net), j = add(s.b, s.r, clr, pad.net);
        ob.constraints.push_back({i, j});
        break;
      }
      case Shape::Kind::Polygon: {
        int first = int(ob.pts.size());
        for (auto& c : s.poly) add(c, s.r, clr, pad.net);
        int n = int(s.poly.size());
        for (int k = 0; k < n; ++k) ob.constraints.push_back({first + k, first + (k + 1) % n});
        break;
      }
    }
  }
  for (const Via& v : b.vias)
    if (v.onLayer(layer)) add(v.pos.v(), v.diameter / 2.0, double(b.classOf(v.net).clearance), v.net);
  for (const RealVia& v : vias) add(v.pos, v.diameter / 2.0, double(b.classOf(v.net).clearance), v.net);
  for (auto& loop : b.outline) {
    int first = int(ob.pts.size());
    int n = int(loop.size());
    for (auto& p : loop) add(p, 0, double(b.edgeClearance), -2);  // -2: belongs to no net, blocks all
    for (int k = 0; k < n; ++k) ob.constraints.push_back({first + k, first + (k + 1) % n});
  }
  return ob;
}

}  // namespace

RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias) {
  RealizeStats st;
  // Group wires per (layer, net) to share one triangulation.
  std::map<std::pair<LayerId, int>, std::vector<int>> groups;
  for (int i = 0; i < int(wires.size()); ++i) groups[{wires[i].layer, wires[i].net}].push_back(i);

  std::map<LayerId, LayerObstacles> obstacles;
  std::vector<std::vector<Portal>> portals(wires.size());
  std::vector<std::vector<Circle>> bends(wires.size());
  std::vector<char> walked(wires.size(), 0);

  for (auto& [key, ids] : groups) {
    auto [layer, net] = key;
    auto it = obstacles.find(layer);
    if (it == obstacles.end()) it = obstacles.emplace(layer, collect(b, layer, vias)).first;
    const LayerObstacles& ob = it->second;
    CDT cdt;
    std::vector<CDT::Vertex_handle> vh(ob.pts.size());
    CDT::Face_handle hint;
    for (int i = 0; i < int(ob.pts.size()); ++i) {
      const OPt& o = ob.pts[i];
      if (o.net == net && net != kNoNet) continue;
      size_t before = cdt.number_of_vertices();
      auto h = cdt.insert(CPoint(o.p.x, o.p.y), hint);
      hint = h->face();
      if (cdt.number_of_vertices() > before) h->info() = i;
      vh[i] = h;
    }
    for (auto& [a, c] : ob.constraints)
      if (vh[a] != nullptr && vh[c] != nullptr && vh[a] != vh[c]) cdt.insert_constraint(vh[a], vh[c]);
    for (auto v = cdt.finite_vertices_begin(); v != cdt.finite_vertices_end(); ++v) {
      int id = v->info();
      if (id < 0 || id >= int(ob.pts.size()) || vh[id] != CDT::Vertex_handle(v)) {
        // Vertex created by intersecting constraints: map it to the nearest obstacle.
        Vec2 p{v->point().x(), v->point().y()};
        int best = 0;
        double bd = std::numeric_limits<double>::max();
        for (int i = 0; i < int(ob.pts.size()); ++i)
          if (vh[i] != nullptr && (ob.pts[i].p - p).len2() < bd) { bd = (ob.pts[i].p - p).len2(); best = i; }
        v->info() = best;
      }
    }
    for (int wi : ids) {
      const RealWire& w = wires[wi];
      std::vector<Portal> mid;
      if (cdt.number_of_vertices() < 3 || !walk(cdt, w.sketch, mid)) continue;
      auto& pl = portals[wi];
      pl.push_back({kStart, kStart});
      pl.insert(pl.end(), mid.begin(), mid.end());
      pl.push_back({kEnd, kEnd});
      auto& bs = bends[wi];
      bs.push_back({w.sketch.front(), 0, -1, 0});
      for (const Apex& a : funnel(ob, w.sketch.front(), w.sketch.back(), pl))
        bs.push_back({ob.pts[a.id].p, double(a.side), a.id, a.portal});
      bs.push_back({w.sketch.back(), 0, -1, int(pl.size()) - 1});
      walked[wi] = 1;
      if (std::getenv("XR_DEBUG2")) {
        std::print(stderr, "wire {} net {} sketch:", wi, b.nets[w.net].name);
        for (auto& p : w.sketch) std::print(stderr, " ({:.3f},{:.3f})", p.x / 1e6, p.y / 1e6);
        std::print(stderr, "\n portals:");
        for (auto& p : pl) {
          auto P = [&](int id) { return id >= 0 ? ob.pts[id].p : Vec2{}; };
          std::print(stderr, " [L{}({:.2f},{:.2f}) R{}({:.2f},{:.2f})]", p.l, P(p.l).x / 1e6, P(p.l).y / 1e6, p.r,
                     P(p.r).x / 1e6, P(p.r).y / 1e6);
        }
        std::print(stderr, "\n funnel:");
        for (auto& c : bs) std::print(stderr, " [o{} s{:+.0f} p{} ({:.2f},{:.2f})]", c.obst, c.rho, c.portal, c.c.x / 1e6, c.c.y / 1e6);
        std::println(stderr, "");
      }
    }
  }

  // Taut thick path: tangent segments + arcs. Obstacles of the corridor that the path would
  // violate become new bends; bends whose tangents degenerate are dropped.
  std::vector<std::vector<Vec2>> tin(wires.size()), tout(wires.size());
  auto thicken = [&](int wi, const std::flat_map<int, double>& extra) {
    const RealWire& w = wires[wi];
    const LayerObstacles& ob = obstacles[w.layer];
    auto& cs = bends[wi];
    auto& pl = portals[wi];
    auto radius = [&](int o) {
      const OPt& op = ob.pts[o];
      auto e = extra.find(o);
      return op.r + std::max(op.clr, double(w.clearance)) + w.width / 2.0 + kMargin +
             (e != extra.end() ? e->second : 0.0);
    };
    for (auto& c : cs)
      if (c.obst >= 0) c.rho = (c.rho > 0 ? 1 : -1) * radius(c.obst);
    auto& ti = tin[wi];
    auto& to = tout[wi];
    std::flat_set<int> dropped;  // obstacles removed once are not re-inserted (prevents oscillation)
    for (int iter = 0; iter < 400; ++iter) {
      size_t n = cs.size();
      ti.assign(n, {});
      to.assign(n, {});
      int bad = -1;
      for (size_t k = 0; k + 1 < n && bad < 0; ++k)
        if (!tangent(cs[k], cs[k + 1], to[k], ti[k + 1])) {
          if (k == 0) bad = 1;
          else if (k + 1 == n - 1) bad = int(k);
          else bad = std::abs(cs[k].rho) < std::abs(cs[k + 1].rho) ? int(k) : int(k + 1);
        }
      for (size_t k = 1; k + 1 < n && bad < 0; ++k)
        if (std::abs(sweepOf(cs[k], ti[k], to[k])) > 1.6 * kPi) bad = int(k);
      if (bad > 0 && bad < int(n) - 1) {
        dropped.insert(cs[bad].obst);
        cs.erase(cs.begin() + bad);
        ++st.droppedApexes;
        continue;
      }
      if (bad >= 0) break;
      // Worst corridor obstacle intruding into a straight segment.
      double worst = 1000;  // 1 um tolerance
      int at = -1;
      Circle ins;
      for (size_t k = 0; k + 1 < n; ++k) {
        Vec2 a = k == 0 ? cs[0].c : to[k];
        Vec2 c = k + 1 == n - 1 ? cs[n - 1].c : ti[k + 1];
        if ((c - a).len2() < 1) continue;
        for (int p = cs[k].portal + 1; p < cs[k + 1].portal; ++p)
          for (auto [o, side] : {std::pair{pl[p].l, +1}, std::pair{pl[p].r, -1}}) {
            if (o < 0 || dropped.contains(o) || std::ranges::any_of(cs, [&](const Circle& x) { return x.obst == o; }))
              continue;
            Vec2 q = ob.pts[o].p;
            double d = distPointSegment(q, a, c);
            // Crossing over the obstacle only counts where it projects onto the segment itself.
            double t = (q - a).dot(c - a) / (c - a).len2();
            bool wrongSide = t > 0 && t < 1 && orient(a, c, q) * side < 0;
            double pen = radius(o) + (wrongSide ? d : -d);
            if (pen > worst) {
              worst = pen;
              at = int(k) + 1;
              ins = {q, side * radius(o), o, p};
            }
          }
      }
      if (at < 0) break;
      cs.insert(cs.begin() + at, ins);
    }
  };

  for (int wi = 0; wi < int(wires.size()); ++wi)
    if (walked[wi]) thicken(wi, {});

  // Nesting: in a triangulation of all obstacles of the layer, other-net wires crossing an edge at
  // obstacle o between o and this wire must stay inside this wire's bend around o.
  std::flat_map<LayerId, std::unique_ptr<CDT>> common;
  std::vector<std::vector<EdgeHit>> hits(wires.size());
  std::map<std::pair<int, int>, std::vector<std::pair<double, int>>> edgeHits;  // per layer below
  std::vector<std::flat_map<int, double>> offset(wires.size());
  std::flat_map<LayerId, std::vector<int>> byLayer;
  for (int wi = 0; wi < int(wires.size()); ++wi)
    if (walked[wi]) byLayer[wires[wi].layer].push_back(wi);
  for (auto&& [layer, ids] : byLayer) {
    const LayerObstacles& ob = obstacles[layer];
    CDT cdt;
    std::vector<CDT::Vertex_handle> vh(ob.pts.size());
    CDT::Face_handle hint;
    for (int i = 0; i < int(ob.pts.size()); ++i) {
      size_t before = cdt.number_of_vertices();
      auto h = cdt.insert(CPoint(ob.pts[i].p.x, ob.pts[i].p.y), hint);
      hint = h->face();
      if (cdt.number_of_vertices() > before) h->info() = i;
      vh[i] = h;
    }
    for (auto v = cdt.finite_vertices_begin(); v != cdt.finite_vertices_end(); ++v)
      if (v->info() < 0 || v->info() >= int(ob.pts.size()) || vh[v->info()] != CDT::Vertex_handle(v)) v->info() = 0;
    edgeHits.clear();
    for (int wi : ids) {
      hits[wi] = crossings(cdt, wires[wi].sketch);
      for (auto& h : hits[wi]) edgeHits[{h.u, h.v}].push_back({h.t, wi});
    }
    for (int wi : ids) {
      const RealWire& w = wires[wi];
      // Every obstacle at the end of a crossed edge may become a bend when the path is pulled taut,
      // so the inner wires at each of them are accounted for, not only at the funnel apexes.
      for (auto& h : hits[wi]) {
        double sumU = 0, sumV = 0;
        for (auto [t, other] : edgeHits[{h.u, h.v}]) {
          const RealWire& ow = wires[other];
          if (other == wi || ow.net == w.net) continue;
          double space = double(ow.width) + double(std::max(ow.clearance, w.clearance)) + kMargin;
          (t < h.t ? sumU : sumV) += space;
        }
        auto bump = [&](int o, double v) {
          if (v > 0) offset[wi][o] = std::max(offset[wi][o], v);
        };
        bump(h.u, sumU);
        bump(h.v, sumV);
      }
    }
  }

  for (int wi = 0; wi < int(wires.size()); ++wi) {
    const RealWire& w = wires[wi];
    auto emitSeg = [&](Vec2 a, Vec2 c) {
      Track t;
      t.a = Point(a);
      t.b = Point(c);
      t.width = w.width;
      t.layer = w.layer;
      t.net = w.net;
      if (t.a != t.b) b.tracks.push_back(t);
    };
    if (!walked[wi]) {
      // Realisation failed: fall back to the sketch polyline.
      for (size_t i = 1; i < w.sketch.size(); ++i) emitSeg(w.sketch[i - 1], w.sketch[i]);
      continue;
    }
    thicken(wi, offset[wi]);
    const auto& cs = bends[wi];
    if (std::getenv("XR_DEBUG2")) {
      std::print(stderr, "wire {} final:", wi);
      for (auto [k, c] : std::views::enumerate(cs))
        std::print(stderr, " [o{} rho{:+.3f} p{} c({:.3f},{:.3f}) in({:.3f},{:.3f}) out({:.3f},{:.3f})]", c.obst, c.rho / 1e6,
                   c.portal, c.c.x / 1e6, c.c.y / 1e6, tin[wi][k].x / 1e6, tin[wi][k].y / 1e6, tout[wi][k].x / 1e6,
                   tout[wi][k].y / 1e6);
      std::println(stderr, "");
    }
    if (std::getenv("XR_DEBUG"))
      std::println(stderr, "wire {} net {} layer {} sketch {} portals {} bends {} ({:.2f},{:.2f})->({:.2f},{:.2f})", wi,
                   b.nets[w.net].name, b.layers[w.layer].name, w.sketch.size(), portals[wi].size(), cs.size(),
                   w.sketch.front().x / 1e6, w.sketch.front().y / 1e6, w.sketch.back().x / 1e6, w.sketch.back().y / 1e6);
    const auto& ti = tin[wi];
    const auto& to = tout[wi];
    size_t n = cs.size();
    Vec2 cur = cs[0].c;
    for (size_t k = 0; k + 1 < n; ++k) {
      Vec2 a = (k == 0) ? cs[0].c : to[k];
      Vec2 c = (k + 1 == n - 1) ? cs[n - 1].c : ti[k + 1];
      emitSeg(cur, a);  // zero length except after a skipped tiny arc
      emitSeg(a, c);
      cur = c;
      if (k + 1 < n - 1) {
        const Circle& C = cs[k + 1];
        double sw = sweepOf(C, ti[k + 1], to[k + 1]);
        double sagitta = std::abs(C.rho) * (1 - std::cos(sw / 2));
        if (sagitta > 1000) {  // flatter arcs would not survive rounding to whole nanometres
          auto g = ArcGeom::fromCenter(C.c, ti[k + 1], sw);
          Track t;
          t.a = Point(ti[k + 1]);
          t.mid = Point(g.mid());
          t.b = Point(to[k + 1]);
          t.width = w.width;
          t.layer = w.layer;
          t.net = w.net;
          b.tracks.push_back(t);
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

}  // namespace xr::topo
