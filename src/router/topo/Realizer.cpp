#include "router/topo/RealizerInput.h"
#include "router/topo/Realizer.h"

#include "core/Prof.h"
#include "core/SpatialIndex.h"
#include "drc/Drc.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <algorithm>
#include <array>
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
constexpr double kExitRadius = 1.0 * kNmPerMm;  // the largest exit arc out of a pad end
// Extra clearance to a fixed track laid against (nm). 20 um took the 5–17 um deficits out of a wire
// re-laid alone next to fixed ones (one net of Arcs: 38 → 33 violations) but squeezed the channels of
// the router's kept wires (tt: 0 → 3 violations at a pad), so none.
constexpr double kTrackObstacleMargin = 0;


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

// Where a sketch crosses the edges of a triangulation (cancelled back-and-forth crossings removed).
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
      if (f == nullptr || cdt.is_infinite(f)) {
        if (std::getenv("XR_DEBUG6")) std::println(stderr, "walk left the triangulation after {} hits", out.size());
        return out;
      }
      Vec2 a0 = P(f->vertex(0)), a1 = P(f->vertex(1)), a2 = P(f->vertex(2));
      if (orient(a0, a1, q) >= 0 && orient(a1, a2, q) >= 0 && orient(a2, a0, q) >= 0) break;
      int exit = -1;
      for (int i = 0; i < 3 && exit < 0; ++i) {
        if (i == entry) continue;
        Vec2 a = P(f->vertex((i + 1) % 3)), b = P(f->vertex((i + 2) % 3));
        double oa = orient(p, q, a), ob = orient(p, q, b);
        if (orient(a, b, q) < 0 && ((oa >= 0 && ob <= 0) || (oa <= 0 && ob >= 0))) exit = i;
      }
      if (exit < 0) {
        if (std::getenv("XR_DEBUG6"))
          std::println(stderr, "walk stuck at segment {} ({:.3f},{:.3f})->({:.3f},{:.3f}) after {} hits", s, p.x / 1e6,
                       p.y / 1e6, q.x / 1e6, q.y / 1e6, out.size());
        return out;
      }
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
      auto n = f->neighbor(exit);
      int wBack = cdt.is_infinite(f) ? -1 : f->vertex(exit)->info();
      int wFwd = cdt.is_infinite(n) ? -1 : n->vertex(n->index(f))->info();
      bool atEnd = distPointSegment(sk.front(), a, b) < 1 || distPointSegment(sk.back(), a, b) < 1;
      if (!out.empty() && out.back().u == u && out.back().v == v) out.pop_back();  // went back
      else out.push_back({u, v, std::clamp(t, 0.0, 1.0), uLeft, wBack, wFwd, atEnd});
      entry = n->index(f);
      f = n;
    }
  }
  // A sketch that ends on an edge (the centre of an oval pad between its caps) or just past it: the
  // hits touching an end point are no crossings — but only at the ends of the walk. A wire that
  // wraps around its own via crosses the via's fan edges on the way, and those crossings order it
  // against the other wires (they were dropped before, and the wire was laid across them).
  while (!out.empty() && out.front().atEnd) out.erase(out.begin());
  while (!out.empty() && out.back().atEnd) out.pop_back();
  return out;
}

struct Circle {
  Vec2 c;
  double rho = 0;   // signed radius: + counter-clockwise (obstacle on the left)
  int obst = -1;    // obstacle id, -1 for the end points
  int portal = 0;   // index in the portal list
  double width = 0; // wire width at this bend (narrowed where the slot needed it)
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


LayerObstacles collect(const Board& b, LayerId layer, const std::vector<RealVia>& vias, const RealizeOptions& opt,
                       const SpatialIndex& idx) {
  LayerObstacles ob;
  auto inRegion = [&](const BBox& bb) { return !opt.region || opt.region->intersects(bb); };
  // The pads, vias and tracks to look at: those near the region (from the index) or all of them.
  std::vector<int> padIds, viaIds, trackIds;
  if (opt.region) {
    for (ItemRef r : idx.query(*opt.region, ~LayerMask(0))) {
      if (r.type == ItemType::Pad) padIds.push_back(r.index);
      else if (r.type == ItemType::Via) viaIds.push_back(r.index);
      else if (r.type == ItemType::Track) trackIds.push_back(r.index);
    }
  } else {
    for (size_t i = 0; i < b.pads.size(); ++i) padIds.push_back(int(i));
    for (size_t i = 0; i < b.vias.size(); ++i) viaIds.push_back(int(i));
    for (size_t i = 0; i < b.tracks.size(); ++i) trackIds.push_back(int(i));
  }
  for (int pi : padIds) {
    const Pad& pad = b.pads[pi];
    double clr = double(b.clearance(pad.net, layer));
    if (opt.region && !inRegion(pad.shapeGeom().bbox())) continue;
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
  for (int vi : viaIds) {
    const Via& v = b.vias[vi];
    if (v.onLayer(layer) && inRegion(Shape::circle(v.pos.v(), v.diameter / 2.0).bbox()))
      ob.pts[ob.add(v.pos.v(), v.diameter / 2.0, double(b.clearance(v.net, layer)), v.net)].via = int(vi);
  }
  for (const RealVia& v : vias) ob.add(v.pos, v.diameter / 2.0, double(b.clearance(v.net, layer)), v.net);
  for (const auto& a : opt.anchors)
    if (a.layer == layer) ob.add(a.pos, a.radius, double(b.clearance(a.net, layer)), a.net);
  for (auto& loop : b.outline) {
    int first = int(ob.pts.size());
    int n = int(loop.size());
    for (auto& p : loop) ob.add(p, 0, double(b.edgeClearance), -2);  // -2: belongs to no net, blocks all
    for (int k = 0; k < n; ++k) ob.link(first + k, first + (k + 1) % n, 0);
  }
  // Routing keepouts of the layer: their boundaries, kept by every net (no clearance).
  // Points every half millimetre, so that no bend between two of them can reach over the boundary.
  for (const Keepout& k : b.keepouts) {
    if (!k.onLayer(layer) || !k.wires) continue;
    for (const Shape& s : k.shapes()) {
      if (!inRegion(s.bbox())) continue;
      bool closed = s.kind != Shape::Kind::Segment;
      Polyline pts = s.kind == Shape::Kind::Polygon ? s.poly
                     : closed                       ? s.outline(std::max(2000.0, s.r * 0.02))
                                                    : Polyline{s.a, s.b};
      int prev = -1, first = -1;
      size_t n = pts.size(), segs = closed ? n : n - 1;
      for (size_t i = 0; i < segs; ++i) {
        Vec2 a = pts[i], c = pts[(i + 1) % n];
        int parts = std::max(1, int(std::ceil((c - a).len() / (0.5 * kNmPerMm))));
        for (int q = 0; q < parts; ++q) {
          int o = ob.add(a + (c - a) * (double(q) / parts), 0, 0, -2);
          if (prev >= 0) ob.link(prev, o, 0);
          else first = o;
          prev = o;
        }
      }
      if (closed) ob.link(prev, first, 0);
      else ob.link(prev, ob.add(pts.back(), 0, 0, -2), 0);
    }
  }
  if (opt.tracksAsObstacles)
    for (int ti : trackIds) {
      const Track& t = b.tracks[ti];
      if (t.layer != layer) continue;
      if (opt.region) {
        BBox tb;
        tb.add(t.a.v());
        tb.add(t.b.v());
        if (t.mid) tb.add(t.mid->v());
        if (!inRegion(tb.inflated(t.width))) continue;
      }
      double r = t.width / 2.0, clr = double(b.clearance(t.net, layer)) + kTrackObstacleMargin;
      int prev = -1;
      // Arcs coarsely (0.2 mm chords, sagitta under the margin): a point every 20 um made bend
      // circles that overlapped one another, tangents failed and apexes were dropped — the wire
      // then cut straight through the fixed one (a subset of six nets re-laid alone: 155 violations).
      for (Vec2 p : t.path(200000)) {
        int o = ob.add(p, r, clr, t.net);
        if (prev >= 0) ob.link(prev, o, r);
        prev = o;
      }
    }
  return ob;
}


// The router's mesh as this layer's obstacles: every mesh vertex in order (so that the triangulation
// comes out the same), transparent where it constrains nothing on this layer.
LayerObstacles collectFromMesh(const Board& b, LayerId layer, const TopoMesh& m, const std::vector<RealVia>& vias) {
  LayerObstacles ob;
  std::map<std::pair<Coord, Coord>, const RealVia*> viaAt;
  for (const RealVia& v : vias) viaAt[{Coord(std::llround(v.pos.x)), Coord(std::llround(v.pos.y))}] = &v;
  std::vector<int> padShape(b.pads.size(), -1);
  for (const MVertex& v : m.verts) {
    switch (v.kind) {
      case VKind::PadCenter:
      case VKind::PadCorner: {
        const Pad& pad = b.pads[v.pad];
        double clr = double(b.clearance(pad.net, layer));
        if (pad.onLayer(layer)) {
          if (padShape[v.pad] < 0) {
            padShape[v.pad] = int(ob.shapes.size());
            ob.shapes.push_back(pad.shapeGeom());
          }
          const Shape& s = ob.shapes[size_t(padShape[v.pad])];
          ob.add(v.p, v.kind == VKind::PadCorner ? s.r : 0.0, clr, pad.net, padShape[v.pad]);
        } else if (pad.drill > 0 && !pad.copper) {
          ob.add(v.p, pad.drill / 2.0, clr, kNoNet);
        } else {
          ob.add(v.p, 0, 0, kTransparent);
        }
        break;
      }
      case VKind::FixedVia: {
        const Via& via = b.vias[v.fixedVia];
        if (via.onLayer(layer)) ob.add(v.p, via.diameter / 2.0, double(b.clearance(via.net, layer)), via.net);
        else ob.add(v.p, 0, 0, kTransparent);
        break;
      }
      case VKind::ViaSite: {
        auto it = viaAt.find({Coord(std::llround(v.p.x)), Coord(std::llround(v.p.y))});
        if (it != viaAt.end()) ob.add(v.p, it->second->diameter / 2.0, double(b.clearance(it->second->net, layer)), it->second->net);
        else ob.add(v.p, 0, 0, kTransparent);
        break;
      }
      case VKind::Outline: ob.add(v.p, 0, double(b.edgeClearance), kBoardEdge); break;
      case VKind::Keepout: {
        const Keepout& k = b.keepouts[v.keepout];
        if (k.onLayer(layer) && k.wires) ob.add(v.p, 0, 0, kBoardEdge);
        else ob.add(v.p, 0, 0, kTransparent);
        break;
      }
    }
  }
  // Pad sides (for the intrusion check) from the pads' vertex lists: centre first, then the corners.
  for (size_t pi = 0; pi < b.pads.size(); ++pi) {
    if (padShape[pi] < 0 || m.padVerts[pi].size() < 3) continue;
    const Shape& s = ob.shapes[size_t(padShape[pi])];
    const auto& pv = m.padVerts[pi];
    int n = int(pv.size()) - 1;
    for (int k = 1; k <= n; ++k)
      if (pv[size_t(k)] != pv[0]) ob.cornersOf[pv[0]].push_back(pv[size_t(k)]);
    for (int k = 0; k < n; ++k) {
      int a = pv[size_t(k) + 1], c = pv[size_t((k + 1) % n) + 1];
      if (s.kind == Shape::Kind::Segment && k > 0) break;
      if (a != c) ob.side(a, c, s.r);
    }
  }
  // The same constraints as the mesh (outline, keepout boundaries of every layer); those that block
  // this layer are sides a wire must keep its clearance from, like a pad's.
  for (const MEdge& e : m.edges) {
    if (!(e.constrained || e.blocked) || e.v[0] == e.v[1]) continue;
    ob.constraints.push_back({e.v[0], e.v[1]});
    if (ob.pts[e.v[0]].net == kBoardEdge && ob.pts[e.v[1]].net == kBoardEdge) ob.side(e.v[0], e.v[1], 0);
  }
  return ob;
}

// Slot of one wire on one crossed edge: the interval of centre-line positions along u -> v that keeps
// the required spacing to the end obstacles and to the other wires crossing the same edge.
struct Slot {
  double lo = 0, hi = 0;  // distances from u
  double xu = 0, xv = 0;  // reach of the end obstacles' copper along the edge
  // Bend circles implied by the slot bounds: around the obstacle itself (packed stack) or around
  // the inner wire's actual crossing point when that is what pushes the bound out.
  Vec2 cu, cv;
  double ru = 0, rv = 0;
  // What a chord crossing the edge inside the slot has to keep from the end obstacles: their own
  // rule, and the inner wires that really bend around them (from the previous round).
  double du = 0, dv = 0;
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

int narrowToFit(Board& b, size_t firstTrack) {
  int n = 0;
  // Two rounds: a track narrowed in the first gives its neighbours room in the second.
  for (int round = 0; round < 2; ++round) {
    SpatialIndex idx;
    idx.build(b);
    double maxClr = double(b.maxClearance());
    bool any = false;
    for (size_t ti = firstTrack; ti < b.tracks.size(); ++ti) {
      Track& t = b.tracks[ti];
      Coord minW = std::min(t.width, b.minTrackWidth(t.net, t.layer));
      if (minW >= t.width) continue;
      // Room: the smallest (distance to other copper − required clearance) along the centre line.
      double room = std::numeric_limits<double>::max();
      auto centre = itemShapes(b, {ItemType::Track, int(ti)});
      for (auto& s : centre) s.r = 0;
      BBox bb;
      for (auto& s : centre) bb.add(s.bbox());
      LayerMask lm = LayerMask(1) << t.layer;
      idx.query(bb.inflated(maxClr + t.width), lm, [&](ItemRef r) {
        if (r == ItemRef{ItemType::Track, int(ti)} || r.type == ItemType::Zone) return;
        int on = itemNet(b, r);
        if (on == t.net && t.net != kNoNet) return;
        double req = requiredClearance(b, t.net, on, lm);
        for (auto& s1 : centre)
          for (auto& s2 : itemShapes(b, r)) room = std::min(room, s1.distance(s2) - req);
      });
      if (room >= t.width / 2.0) continue;
      Coord w = std::max(minW, Coord(std::llround(2 * room)));
      if (w < t.width) {
        t.width = w;
        ++n;
        any = true;
      }
    }
    if (!any) break;
  }
  return n;
}

void prepareStubs(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in) {
  const int NW = int(wires.size());
  std::vector<std::array<Stub, 2>>& stubs = in.stubs;
  stubs.assign(NW, {});
  std::vector<Polyline>& sketches = in.sketches;
  sketches.resize(NW);
  SpatialIndex& oidx = in.oidx;
  if (opt.region) oidx.build(b, *opt.region);
  else oidx.build(b);
  {
    const SpatialIndex& idx = oidx;
    for (int wi = 0; wi < NW; ++wi) {
      const RealWire& w = wires[wi];
      Polyline& sk = sketches[wi];
      sk = w.sketch;
      if (sk.size() < 2 || w.net == kNoNet || opt.mesh) continue;
      double reach = double(w.clearance) + w.width / 2.0 + kMargin;  // the wire's envelope beyond the copper
      for (int end = 0; end < 2; ++end) {
        if (end) std::ranges::reverse(sk);
        Vec2 p = sk.front();
        std::optional<Shape> pad;
        BBox q;
        q.add(p);
        idx.query(q.inflated(1000), LayerMask(1) << w.layer, [&](ItemRef r) {
          if (pad || r.type != ItemType::Pad || b.pads[r.index].net != w.net) return;
          Shape s = b.pads[r.index].shapeGeom();
          if (s.kind != Shape::Kind::Point && s.contains(p)) pad = s;
        });
        bool on = false;
        if (pad) {
          size_t k = 1;  // the first sketch point clear of the pad
          while (k < sk.size() && pad->distance(sk[k]) <= 0) ++k;
          Vec2 M, n;
          double len = -1;  // width of the end the wire leaves through, copper included
          if (k < sk.size()) {
            // Where the sketch leaves the copper: the end it crosses is the side nearest to that point.
            Vec2 in = sk[k - 1], out = sk[k];
            Vec2 X = in;
            if (pad->distance(in) < -1000)
              for (int it = 0; it < 30; ++it) {
                Vec2 mid = (in + out) * 0.5;
                (pad->distance(mid) <= 0 ? in : out) = mid;
                X = out;
              }
            if (pad->kind == Shape::Kind::Polygon) {
              const Polyline& pl = pad->poly;
              size_t m = pl.size();
              double bd = std::numeric_limits<double>::max();
              for (size_t i = 0; i < m; ++i) {
                Vec2 a = pl[i], c = pl[(i + 1) % m];
                if ((c - a).len2() < 1) continue;
                double d = distPointSegment(X, a, c);
                if (d < bd) {
                  bd = d;
                  M = (a + c) * 0.5;
                  n = (c - a).perp().normalized();
                  if (n.dot(M - pad->center()) < 0) n = -n;
                  len = (c - a).len() + 2 * pad->r;
                }
              }
            } else if (pad->kind == Shape::Kind::Segment && (pad->b - pad->a).len2() > 1) {
              // Through a cap of the oval only; a wire that leaves through the long side (a QFP pad
              // entered from the side, as P-CAD and TopoR lay them) keeps its side exit.
              Vec2 ab = pad->b - pad->a;
              double t = (X - pad->a).dot(ab) / ab.len2();
              if (t <= 0 || t >= 1) {
                Vec2 e = t <= 0 ? pad->a : pad->b;
                M = e;
                n = (e - (pad->a + pad->b - e)).normalized();
                len = 2 * pad->r;
              }
            }
          }
          if (len >= 0 && len < w.width + 2.0 * double(w.clearance)) {
            // The exit point lies a clearance and half a width beyond the end: the first tangent then
            // leaves the pad's neighbours room. (XR_EXITEDGE puts it on the copper boundary, as TopoR's
            // wires end: measured no better — el4134 loses 3 µm at a USB-C pad, arz F5 unchanged.)
            static const bool kBeyond = std::getenv("XR_EXITEDGE") == nullptr;
            Vec2 E = M + n * (pad->r + (kBeyond ? reach : 0.0));
            size_t drop = 1;
            while (drop + 1 < sk.size() && pad->distance(sk[drop]) < (kBeyond ? reach : 1.0)) ++drop;
            sk.erase(sk.begin(), sk.begin() + drop);
            // A via right in front of the end (a fanout site): the stub ends at it, no exit point beyond.
            Vec2 q = sk.front() - M;
            if (q.dot(n) < (E - M).dot(n) && std::abs(q.cross(n)) <= w.width / 2.0) E = sk.front();
            else sk.insert(sk.begin(), E);
            double free = std::max(0.0, (E - M).len() - pad->r);
            // The chain already ends on the way out (a stub of the previous F5, cut at the copper): the
            // stub starts there. Back to the middle of the end and out again would add a spur every F5.
            if ((p - M).dot(n) > 0 && std::abs((p - M).cross(n)) < 1000) M = p;
            stubs[wi][end] = {p, M, E, true, free};
            on = true;
          }
        }
        if (std::getenv("XR_DEBUG_STUB") && pad)
          std::println(stderr, "stub? net {} L{} end {} at ({:.3f},{:.3f}) kind {} -> {}; sketch {}", b.nets[w.net].name, int(w.layer), end,
                       p.x / 1e6, -p.y / 1e6, int(pad->kind), on, sk.size());
        if (end) std::ranges::reverse(sk);
      }
    }
  }
}

RealizeStats realize(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                     const RealizeOptions& opt) {
  RealizeStats st;
  const int NW = int(wires.size());
  std::flat_map<LayerId, std::vector<int>> byLayer;
  for (int wi = 0; wi < NW; ++wi) byLayer[wires[wi].layer].push_back(wi);

  // Each wire's crossings of the common triangulation of all obstacles of its layer, then the
  // slot of every crossing from the ordered crossings of that edge.
  RealizeInput in;
  prepareStubs(b, wires, opt, in);
  std::vector<Polyline>& sketches = in.sketches;
  SpatialIndex& oidx = in.oidx;
  std::vector<std::array<Stub, 2>>& stubs = in.stubs;
  std::map<LayerId, LayerObstacles>& obstacles = in.obstacles;
  auto& edgeLists = in.edgeLists;
  auto& cdtEdges = in.cdtEdges;
  std::vector<std::vector<EdgeHit>>& hits = in.hits;
  hits.assign(NW, {});
  std::vector<BBox> sketchBox(NW);
  for (int wi = 0; wi < NW; ++wi)
    for (Vec2 q : sketches[wi]) sketchBox[wi].add(q);
  std::optional<ProfScope> phase;
  phase.emplace("realize: collect+cdt+crossings");
  for (auto&& [layer, ids] : byLayer) {
    LayerObstacles& ob = obstacles.emplace(layer, opt.mesh ? collectFromMesh(b, layer, *opt.mesh, vias)
                                                            : collect(b, layer, vias, opt, oidx)).first->second;
    for (int wi : ids)
      for (const Stub& st : stubs[wi])
        if (st.on) {
          double r = wires[wi].width / 2.0, clr = double(wires[wi].clearance);
          int i = ob.add(st.mid, r, clr, wires[wi].net), j = ob.add(st.to, r, clr, wires[wi].net);
          ob.link(i, j, r);
        }
    auto cdt = triangulate(ob, kNoNet);
    if (std::getenv("XR_DEBUG4"))
      for (auto e = cdt->finite_edges_begin(); e != cdt->finite_edges_end(); ++e) {
        int a = e->first->vertex(CDT::cw(e->second))->info(), c = e->first->vertex(CDT::ccw(e->second))->info();
        cdtEdges[layer].insert({std::min(a, c), std::max(a, c)});
      }
    auto& onEdge = edgeLists[layer];  // edge -> (wire, hit index)
    for (int wi : ids) {
      if (cdt->number_of_vertices() >= 3) hits[wi] = crossings(*cdt, sketches[wi]);
      for (int k = 0; k < int(hits[wi].size()); ++k) onEdge[{hits[wi][k].u, hits[wi][k].v}].push_back({wi, k});
    }
  }
  // The order of the wires on every edge comes from the topology first: two wires that share an
  // edge are ordered by where their paths part — the one that leaves the triangle through the edge
  // at u (or ends at u) is nearer u. The positions of the sketch crossings decide only where the
  // topology does not (both wires end inside the triangle), so a sketch drawn a little across its
  // neighbour (an even number of crossings) is laid where it belongs. Forward and backward verdicts
  // that disagree mean the sketches cross each other (an odd number of times): a topological
  // crossing, laid as drawn and counted (TopoR refuses F5 with such a crossing, error 5032).
  for (auto&& [layer, ids] : byLayer) {
    const LayerObstacles& ob = obstacles.at(layer);
    auto edgeOf = [&](const EdgeHit& h) { return std::pair{h.u, h.v}; };
    auto hasVertex = [](std::pair<int, int> e, int x) { return e.first == x || e.second == x; };
    auto crossPt = [&](const EdgeHit& h) { return ob.pts[h.u].p + (ob.pts[h.v].p - ob.pts[h.u].p) * h.t; };
    // +1: A nearer u of the edge shared by hits (A,i) and (B,j), -1: B nearer u, 0: unknown.
    auto side = [&](this auto&& self, int A, int i, int dA, int B, int j, int dB, int depth) -> int {
      if (depth > 64) return 0;
      const EdgeHit& hA = hits[A][i];
      const EdgeHit& hB = hits[B][j];
      int u = hA.u, v = hA.v;
      int w = dA > 0 ? hA.wFwd : hA.wBack;
      if (w < 0 || w != (dB > 0 ? hB.wFwd : hB.wBack)) return 0;
      int nA = i + dA, nB = j + dB;
      bool endA = nA < 0 || nA >= int(hits[A].size()), endB = nB < 0 || nB >= int(hits[B].size());
      if (!endA && !endB) {
        auto eA = edgeOf(hits[A][nA]), eB = edgeOf(hits[B][nB]);
        if (eA == eB) {
          int sv = hasVertex(eA, u) ? u : v;  // the vertex the run keeps
          int r = self(A, nA, dA, B, nB, dB, depth + 1);
          if (r == 0) return 0;
          bool aNearS = (r > 0) == (eA.first == sv);  // r: A nearer eA.first
          return aNearS == (sv == u) ? +1 : -1;
        }
        if (hasVertex(eA, u) && hasVertex(eB, v)) return +1;
        if (hasVertex(eA, v) && hasVertex(eB, u)) return -1;
        return 0;
      }
      auto endSide = [&](int X, int dX, int Y, int cY, int nY) -> int {  // X ends in the triangle, Y goes on: +1 X nearer u
        Vec2 P = dX > 0 ? sketches[X].back() : sketches[X].front();
        if ((P - ob.pts[u].p).len2() < 1) return +1;
        if ((P - ob.pts[v].p).len2() < 1) return -1;
        auto eY = edgeOf(hits[Y][nY]);
        if ((P - ob.pts[w].p).len2() < 1) return hasVertex(eY, u) ? -1 : +1;
        Vec2 a = crossPt(hits[Y][cY]), b = crossPt(hits[Y][nY]);
        double o = orient(a, b, P), ou = orient(a, b, ob.pts[u].p);
        if (o == 0 || ou == 0) return 0;
        return (o > 0) == (ou > 0) ? +1 : -1;
      };
      if (endA && !endB) return endSide(A, dA, B, j, nB);
      if (endB && !endA) return -endSide(B, dB, A, i, nA);
      return hA.t < hB.t ? +1 : hA.t > hB.t ? -1 : 0;
    };
    for (auto& [uv, list] : edgeLists[layer]) {
      auto before = [&](std::pair<int, int> a, std::pair<int, int> b) {
        const EdgeHit& hA = hits[a.first][a.second];
        const EdgeHit& hB = hits[b.first][b.second];
        int dB = hA.uLeft == hB.uLeft ? +1 : -1;
        int f = side(a.first, a.second, +1, b.first, b.second, dB, 0);
        int bk = side(a.first, a.second, -1, b.first, b.second, -dB, 0);
        if (f != 0 && bk != 0 && f != bk) {
          ++st.sketchCrossings;
          auto pr = std::minmax(wires[a.first].net, wires[b.first].net);
          if (!std::ranges::contains(st.crossingNets, std::pair{pr.first, pr.second})) st.crossingNets.push_back({pr.first, pr.second});
          return hA.t < hB.t;
        }
        int r = f != 0 ? f : bk;
        return r != 0 ? r > 0 : hA.t < hB.t;
      };
      for (size_t k = 1; k < list.size(); ++k)  // insertion sort: the order is pairwise, not a key
        for (size_t m = k; m > 0 && before(list[m], list[m - 1]); --m) std::swap(list[m], list[m - 1]);
    }
  }
  return drawRealized(b, wires, vias, opt, in, st);
}

RealizeStats drawRealized(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                          const RealizeOptions& opt, RealizeInput& in, RealizeStats st) {
  const int NW = int(wires.size());
  std::flat_map<LayerId, std::vector<int>> byLayer;
  for (int wi = 0; wi < NW; ++wi) byLayer[wires[wi].layer].push_back(wi);
  std::vector<std::vector<EdgeHit>>& hits = in.hits;
  std::vector<std::vector<Slot>> slots(NW);
  for (int wi = 0; wi < NW; ++wi) slots[wi].resize(hits[wi].size());
  std::vector<Polyline>& sketches = in.sketches;
  std::vector<BBox> sketchBox(NW);
  for (int wi = 0; wi < NW; ++wi)
    for (Vec2 q : sketches[wi]) sketchBox[wi].add(q);
  std::map<LayerId, LayerObstacles>& obstacles = in.obstacles;
  auto& edgeLists = in.edgeLists;
  auto& cdtEdges = in.cdtEdges;
  std::vector<std::array<Stub, 2>>& stubs = in.stubs;
  SpatialIndex& oidx = in.oidx;
  std::optional<ProfScope> phase;
  (void)opt;
  // Bend radius each wire actually uses around each obstacle (merged over the fan); the stacks of
  // outer wires must build on it, so slots and bends are iterated.
  // Per crossing, not per obstacle: a wire that passes one obstacle several times (out and back, at
  // radii from 1 to 5 mm) has one bend for each pass, and the wires stacked on an inner pass have
  // nothing to do with the radius of the outer one (a whole-board re-lay blew up on that).
  // bendR[wire][crossing]: radius around the edge's u and v.
  std::vector<std::vector<std::array<double, 2>>> bendR(NW);
  for (int wi = 0; wi < NW; ++wi) bendR[wi].assign(hits[wi].size(), {-1.0, -1.0});
  std::vector<std::vector<Circle>> bendsOf(NW);
  std::vector<std::vector<Vec2>> tinOf(NW), toutOf(NW);
  // Where each wire's realised path actually crosses each of its edges (distance from u), from the
  // previous round: outer wires stack on these rather than on the packed minimum.
  std::vector<std::vector<double>> actual(NW);
  for (int wi = 0; wi < NW; ++wi) actual[wi].assign(hits[wi].size(), -1.0);
  // Width of every wire at every crossing: nominal, or the minimum where an edge cannot take the
  // nominal widths of the wires crossing it (TopoR's «подрезка»).
  std::vector<std::vector<double>> hw(NW);
  for (int wi = 0; wi < NW; ++wi) hw[wi].assign(hits[wi].size(), double(wires[wi].width));
  phase.emplace("realize: rounds+tangents");
  for (int round = 0; round < 6; ++round) {
  st.viaPush.clear();
  for (auto&& [layer, ids] : byLayer) {
    const LayerObstacles& ob = obstacles.at(layer);
    for (auto& [uv, list] : edgeLists[layer]) {
      const OPt& U = ob.pts[uv.first];
      const OPt& V = ob.pts[uv.second];
      double L = (V.p - U.p).len();
      int n = int(list.size());
      // Stack from u: a[k] = centre-line distance of wire k from u when all inner wires are packed.
      std::vector<double> a(n), bb(n);
      // Own-net obstacles (the wire's pad corners, its vias) are no constraint: the centre line may
      // pass through the point itself, so no radius there at all.
      auto own = [&](const OPt& o, const RealWire& w) { return o.net == w.net && w.net != kNoNet; };
      auto wAt = [&](int k) { return hw[list[k].first][list[k].second]; };
      // The safety margin against tessellation is dropped where the wires fit exactly without it
      // (TopoR lays a wire between two pads at the bare rule distance).
      double margin = kMargin;
      Vec2 dir = L > 0 ? (V.p - U.p) / L : Vec2{};
      double xu = ob.reach(U, dir), xv = ob.reach(V, -dir);
      auto need = [&](const OPt& o, const RealWire& w, double width) {
        if (own(o, w) || o.net == kTransparent) return 0.0;
        double x = &o == &U ? xu : xv;
        return x + std::max(o.clr, double(w.clearance)) + margin + width / 2.0;
      };
      auto usedR = [&](int k, int end, double packed) { return std::max(packed, bendR[list[k].first][list[k].second][end]); };
      auto actualFromU = [&](int k) { return actual[list[k].first][list[k].second]; };
      std::vector<double> aCenter(n, 0), bCenter(n, 0);  // distance from u/v of the bend centre
      std::vector<double> aR(n, 0), bR(n, 0);
      auto pack = [&] {
        for (int k = 0; k < n; ++k) {
          const RealWire& w = wires[list[k].first];
          if (k == 0) {
            a[k] = need(U, w, wAt(k));
            aR[k] = a[k];
          } else {
            int pw = list[k - 1].first;
            // Stack on the inner wire (packed radius, or its actual crossing from the previous round),
            // but never closer to the obstacle than the wire's own rule allows.
            double spacing = wAt(k - 1) / 2.0 + std::max(double(wires[pw].clearance), double(w.clearance)) + margin +
                             wAt(k) / 2.0;
            double packed = usedR(k - 1, 0, a[k - 1]) + spacing;
            double act = actualFromU(k - 1) >= 0 ? actualFromU(k - 1) + spacing : -1;
            a[k] = std::max({packed, act, need(U, w, wAt(k))});
            if (act > packed && act > need(U, w, wAt(k))) {
              aCenter[k] = actualFromU(k - 1);  // bend around the inner wire's crossing point
              aR[k] = spacing;
            } else {
              aR[k] = a[k];
            }
          }
        }
        for (int k = n - 1; k >= 0; --k) {
          const RealWire& w = wires[list[k].first];
          if (k == n - 1) {
            bb[k] = need(V, w, wAt(k));
            bR[k] = bb[k];
          } else {
            int nw = list[k + 1].first;
            double spacing = wAt(k + 1) / 2.0 + std::max(double(wires[nw].clearance), double(w.clearance)) + margin +
                             wAt(k) / 2.0;
            // Only outer wires adapt to inner ones (monotone: paths move outward only); the v side
            // stays packed — neither the actual crossings nor the bend radii of the inner wires feed
            // it — so that the two directions cannot push each other back and forth. (Bend radii did
            // feed it once: a wire crossing an edge twice around one via made the stacks from both ends
            // grow every round until the slot overflowed and the path left its corridor — arz F5
            // reference routing 102 violations, 38 without.)
            double packed = bb[k + 1] + spacing;
            double act = -1;
            bb[k] = std::max({packed, act, need(V, w, wAt(k))});
            if (act > packed && act > need(V, w, wAt(k))) {
              bCenter[k] = L - actualFromU(k + 1);
              bR[k] = spacing;
            } else {
              bR[k] = bb[k];
            }
          }
        }
        return L - a[n - 1] - bb[n - 1];
      };
      double slack = pack();
      if (slack <= 0) {        // No room for the nominal widths: the wires that may be narrowed are, on this edge.
        bool any = false;
        for (int k = 0; k < n; ++k) {
          const RealWire& w = wires[list[k].first];
          if (w.widthMin > 0 && w.widthMin < w.width && wAt(k) > double(w.widthMin)) {
            hw[list[k].first][list[k].second] = double(w.widthMin);
            any = true;
          }
        }
        if (any) slack = pack();
      }
      if (slack < 0 && slack > -2.0 * kMargin * (n + 1)) {
        margin = 0;
        slack = pack();
      }
      // The squeeze on the vias at the ends of a tight edge: TopoR's F6/F7 push a via away from the
      // neighbours whose edges carry more than fits (the sum of the unit vectors of the tight edges,
      // weighted by the deficit).
      if (slack < kMargin && L > 0)
        for (auto [o, other] : {std::pair{&U, &V}, std::pair{&V, &U}})
          if (o->via >= 0) st.viaPush[o->via] = st.viaPush[o->via] + (other->p - o->p) / L * (kMargin - slack);
      if (slack < 0) {
        if (round == 0) ++st.overflowEdges;
        if (round == 0 && std::getenv("XR_OVF")) {
          std::print(stderr, "ovf L{:.3f} need{:.3f} U({:.3f},{:.3f} r{:.2f} net{}) V({:.3f},{:.3f} r{:.2f} net{}) wires:", L / 1e6,
                     (a[n - 1] + bb[n - 1]) / 1e6, U.p.x / 1e6, -U.p.y / 1e6, U.r / 1e6, U.net, V.p.x / 1e6, -V.p.y / 1e6, V.r / 1e6, V.net);
          for (int k = 0; k < n; ++k) std::print(stderr, " {}/w{:.2f}", wires[list[k].first].net, wAt(k) / 1e6);
          std::println(stderr, "");
        }
      }
      for (int k = 0; k < n; ++k) {
        Slot& sl = slots[list[k].first][list[k].second];
        if (slack < 0) {
          // Overflow: keep the order, share the deficit (a violation the DRC will report).
          double scale = (L > 0) ? L / (a[n - 1] + bb[n - 1]) : 1.0;
          sl.lo = sl.hi = a[k] * scale;
        } else {
          // Packed bounds: the whole feasible interval. Taut non-crossing paths keep their order on
          // every edge, and bends around the end obstacles get the packed (minimal) radius.
          sl.lo = a[k];
          sl.hi = L - bb[k];
        }
        sl.xu = xu;
        sl.xv = xv;
        // Bend circles through the slot bounds.
        sl.cu = U.p + dir * aCenter[k];
        sl.ru = slack < 0 ? sl.lo - aCenter[k] : aR[k];
        sl.cv = V.p - dir * bCenter[k];
        sl.rv = slack < 0 ? (L - sl.hi) - bCenter[k] : bR[k];
        // A pinned crossing (the model's: where a wire enters its own pad, as drawn) is that point: the
        // path goes through it, a corner there, no bend round the end obstacles.
        if (double pin = hits[list[k].first][list[k].second].pin; pin >= 0) {
          sl.lo = sl.hi = pin * L;
          sl.cu = sl.cv = U.p + dir * sl.lo;
          sl.ru = sl.rv = 0;
        }
        const RealWire& w = wires[list[k].first];
        auto spacingTo = [&](int j) {
          return wAt(j) / 2.0 + std::max(double(wires[list[j].first].clearance), double(w.clearance)) + margin + wAt(k) / 2.0;
        };
        auto bentAround = [&](int j, int end) {
          if (wires[list[j].first].net == w.net) return -1.0;
          double r = bendR[list[j].first][list[j].second][end];
          return r < 0 ? -1.0 : r + spacingTo(j);
        };
        sl.du = need(U, w, wAt(k));
        for (int j = 0; j < k; ++j) sl.du = std::max(sl.du, bentAround(j, 0));
        sl.dv = need(V, w, wAt(k));
        for (int j = k + 1; j < n; ++j) sl.dv = std::max(sl.dv, bentAround(j, 1));
      }
    }
  }

  // Taut path of every wire inside its slots: funnel over the slot segments, apexes become bends
  // around the edge end obstacles with the slot radius, consecutive bends around one obstacle merge.
  bool radiiChanged = false;
  for (int wi = 0; wi < NW; ++wi) {
    const RealWire& w = wires[wi];
    const LayerObstacles& ob = obstacles.at(w.layer);
    const Polyline& sk = sketches[wi];
    bendsOf[wi].clear();
    if (sk.size() < 2) continue;
    std::vector<std::pair<Vec2, Vec2>> portals;
    portals.push_back({sk.front(), sk.front()});
    for (int k = 0; k < int(hits[wi].size()); ++k) {
      const EdgeHit& h = hits[wi][k];
      const Slot& sl = slots[wi][k];
      Vec2 U = ob.pts[h.u].p, V = ob.pts[h.v].p;
      double L = (V - U).len();
      Vec2 d = L > 0 ? (V - U) / L : Vec2{};
      Vec2 nearU = U + d * sl.lo, nearV = U + d * sl.hi;
      portals.push_back(h.uLeft ? std::pair{nearU, nearV} : std::pair{nearV, nearU});
    }
    portals.push_back({sk.back(), sk.back()});
    auto apexes = funnel(portals);
    // A point portal (a slot without slack: the wire fits between the two end obstacles exactly, as
    // TopoR lays a wire between two vias at the bare rule distance) gives the funnel no wall to hug,
    // and it reports the right endpoint whatever the path does. Which end obstacle the path bends
    // around there is the turn it makes: left turn, left endpoint.
    for (size_t i = 0; i < apexes.size(); ++i) {
      const auto& [l, r] = portals[apexes[i].portal];
      if ((l - r).len2() >= 1) continue;
      auto at = [&](size_t j) {
        const FunnelApex& a = apexes[j];
        return a.side > 0 ? portals[a.portal].first : portals[a.portal].second;
      };
      Vec2 prev = i == 0 ? sk.front() : at(i - 1), next = i + 1 == apexes.size() ? sk.back() : at(i + 1);
      if (double o = orient(prev, l, next); o != 0) apexes[i].side = o > 0 ? +1 : -1;
    }
    if (const char* d = std::getenv("XR_DEBUG7"); d && std::atoi(d) == wi) {
      std::println(stderr, "wire {} portals:", wi);
      for (size_t k = 0; k < portals.size(); ++k) {
        const auto& [l, r] = portals[k];
        std::print(stderr, "  {}: L({:.3f},{:.3f}) R({:.3f},{:.3f})", k, l.x / 1e6, -l.y / 1e6, r.x / 1e6, -r.y / 1e6);
        if (k >= 1 && k + 1 < portals.size()) {
          const EdgeHit& h = hits[wi][k - 1];
          std::print(stderr, " edge {}-{} uLeft {} lo {:.3f} hi {:.3f}", h.u, h.v, h.uLeft, slots[wi][k - 1].lo / 1e6, slots[wi][k - 1].hi / 1e6);
        }
        std::println(stderr, "");
      }
      std::print(stderr, "  apexes:");
      for (auto& a : apexes) std::print(stderr, " [{} side {}]", a.portal, a.side);
      std::println(stderr, "");
    }

    auto L_of = [&](const EdgeHit& h) { return (ob.pts[h.v].p - ob.pts[h.u].p).len(); };
    // The ends take the width of the first and last crossing: a wire leaving a fine-pitch pad from
    // its end is narrowed from the pad on.
    std::vector<Circle> cs;
    cs.push_back({sk.front(), 0, -1, 0, hw[wi].empty() ? double(w.width) : hw[wi].front()});
    for (const FunnelApex& ap : apexes) {
      const EdgeHit& h = hits[wi][ap.portal - 1];
      const Slot& sl = slots[wi][ap.portal - 1];
      bool atU = (ap.side > 0) == h.uLeft;  // the apex endpoint lies on u's side of the slot
      int o = atU ? h.u : h.v;
      double R = atU ? sl.ru : sl.rv;
      Vec2 c = atU ? sl.cu : sl.cv;
      double width = hw[wi][ap.portal - 1];
      if (auto it = ob.cornersOf.find(o); it != ob.cornersOf.end() && (c - ob.pts[o].p).len2() < 1 && !std::getenv("XR_NOCORNER")) {
        // The bend goes around the corner nearest to where the taut path meets the slot.
        Vec2 at = h.uLeft == atU ? ob.pts[h.u].p + (ob.pts[h.v].p - ob.pts[h.u].p).normalized() * sl.lo
                                 : ob.pts[h.v].p + (ob.pts[h.u].p - ob.pts[h.v].p).normalized() * (L_of(h) - sl.hi);
        int best = -1;
        double bd = std::numeric_limits<double>::max();
        for (int q : it->second)
          if (double d = (ob.pts[q].p - at).len2(); d < bd) { bd = d; best = q; }
        if (best >= 0) {
          const OPt& cp = ob.pts[best];
          // The stack this wire sits on round the centre goes with it round the corner (the model's meshes
          // have the pads' centres; the slots there stack the wires from the centre's reach).
          double surplus = std::max(0.0, R - ((atU ? sl.xu : sl.xv) + std::max(ob.pts[o].clr, double(w.clearance)) + kMargin + width / 2.0));
          o = best;
          c = cp.p;
          R = cp.r + std::max(cp.clr, double(w.clearance)) + kMargin + width / 2.0 + surplus;
        }
      }
      if (!cs.empty() && cs.back().obst == o && (cs.back().c - c).len2() < 1 && (cs.back().rho > 0) == (ap.side > 0)) {
        cs.back().rho = ap.side * std::max(std::abs(cs.back().rho), R);
        cs.back().width = std::min(cs.back().width, width);
      } else {
        cs.push_back({c, ap.side * R, o, ap.portal, width});
      }
    }
    cs.push_back({sk.back(), 0, -1, int(portals.size()) - 1, hw[wi].empty() ? double(w.width) : hw[wi].back()});
    if (std::getenv("XR_DEBUG2")) {
      std::print(stderr, "wire {} net {} sketch {} hits {} bends:", wi, b.nets[w.net].name, sk.size(), hits[wi].size());
      if (std::getenv("XR_DEBUG2SK")) {
        std::print(stderr, "\n  sketch:");
        for (Vec2 q : sk) std::print(stderr, " ({:.2f},{:.2f})", q.x / 1e6, -q.y / 1e6);
        std::print(stderr, "\n  obstacles within 3 mm of the end:");
        for (int o = 0; o < int(ob.pts.size()); ++o)
          if ((ob.pts[o].p - sk.back()).len() < 3 * kNmPerMm)
            std::print(stderr, " o{}({:.2f},{:.2f} r{:.2f} net{})", o, ob.pts[o].p.x / 1e6, -ob.pts[o].p.y / 1e6, ob.pts[o].r / 1e6, ob.pts[o].net);
      }
      for (auto& c : cs) std::print(stderr, " [o{} rho{:+.3f} ({:.3f},{:.3f})]", c.obst, c.rho / 1e6, c.c.x / 1e6, c.c.y / 1e6);
      std::print(stderr, "\n  hits:");
      for (int k = 0; k < int(hits[wi].size()); ++k) {
        const EdgeHit& h = hits[wi][k];
        std::print(stderr, " [{}-{} t{:.2f} lo{:.3f} hi{:.3f} U({:.2f},{:.2f}) V({:.2f},{:.2f}) uL{}]", h.u, h.v, h.t,
                   slots[wi][k].lo / 1e6, slots[wi][k].hi / 1e6, ob.pts[h.u].p.x / 1e6, ob.pts[h.u].p.y / 1e6,
                   ob.pts[h.v].p.x / 1e6, ob.pts[h.v].p.y / 1e6, int(h.uLeft));
      }
      std::println(stderr, "");
    }

    // Tangents between consecutive circles; degenerate configurations drop the weaker bend. A
    // straight segment between two bends is a chord that may cut inside the slot radius of an
    // obstacle whose fan edges it crosses (the inner wire's arc bulges there): such an obstacle
    // becomes a bend too.
    std::vector<Vec2> ti, to;
    int shrinks = 0;
    std::flat_set<int> dropped;
    // Other nets' wires of this layer whose sketches come near: their arcs are checked below.
    std::vector<int> nearWires;
    {
      BBox mine;
      for (Vec2 q : sk) mine.add(q);
      mine = mine.inflated(5 * kNmPerMm);
      for (int wj : byLayer.at(w.layer))
        if (wj != wi && wires[wj].net != w.net && !bendsOf[wj].empty() && mine.intersects(sketchBox[wj])) nearWires.push_back(wj);
    }
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
        if (std::getenv("XR_DEBUG4")) {
          auto joined = [&](int o1, int o2) {
            return o1 >= 0 && o2 >= 0 && cdtEdges[w.layer].contains({std::min(o1, o2), std::max(o1, o2)});
          };
          auto gap = [&](const Circle& x, const Circle& y) { return ((x.c - y.c).len() - std::abs(x.rho) - std::abs(y.rho)) / 1e6; };
          std::println(stderr, "drop wire {} net {} bend {} of {}: o{} rho {:+.3f} at ({:.3f},{:.3f}); prev o{} rho {:+.3f} gap {:.3f} edge {}; next o{} rho {:+.3f} gap {:.3f} edge {}",
                       wi, b.nets[w.net].name, bad, n, cs[bad].obst, cs[bad].rho / 1e6, cs[bad].c.x / 1e6, -cs[bad].c.y / 1e6,
                       cs[bad - 1].obst, cs[bad - 1].rho / 1e6, gap(cs[bad - 1], cs[bad]), joined(cs[bad - 1].obst, cs[bad].obst),
                       cs[bad + 1].obst, cs[bad + 1].rho / 1e6, gap(cs[bad], cs[bad + 1]), joined(cs[bad].obst, cs[bad + 1].obst));
        }
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
          // R is the stack along the edge. A chord that crosses the edge inside its slot keeps the
          // stack whatever its angle to the edge (on a long edge crossed at a slant its distance to
          // the end obstacle is well under the stack, and it would be bent around that obstacle for
          // nothing: radii of 4-6 mm, alternating, across a whole bus).
          bool inSlot = false;
          {
            Vec2 eU = ob.pts[h.u].p, eV = ob.pts[h.v].p;
            double den = (eV - eU).cross(q - p);
            if (std::abs(den) > 1e-9) {
              double se = (p - eU).cross(q - p) / den, rq = (p - eU).cross(eV - eU) / den;
              double along = se * (eV - eU).len();
              inSlot = rq >= 0 && rq <= 1 && along >= sl.lo - 1000 && along <= sl.hi + 1000;
            }
          }
          for (auto [o, R0, c, x, d] : {std::tuple{h.u, sl.ru, sl.cu, sl.xu, sl.du}, std::tuple{h.v, sl.rv, sl.cv, sl.xv, sl.dv}}) {
            double R = inSlot ? std::min(R0, d) : R0;
            if (R <= 0 || dropped.contains(o) ||
                std::ranges::any_of(cs, [&](const Circle& x) { return x.obst == o && (x.c - c).len2() < 1; }))
              continue;
            double t = (c - p).dot(q - p) / (q - p).len2();
            if (t <= 0 || t >= 1) continue;
            double pen = R - distPointSegment(c, p, q);
            // Sides incident to the obstacle point (pad edges, outline, stub wires) with their own radius.
            if ((c - ob.pts[o].p).len2() < 1) {
              double extra = R - x;  // clearance + half width + margin + nesting
              for (const Side& sd : ob.adj[o])
                pen = std::max(pen, sd.r + extra - distSegmentSegment(p, q, c, ob.pts[sd.to].p));
            }
            if (pen > worst) {
              worst = pen;
              at = int(k) + 1;
              ins = {c, (orient(p, q, c) > 0 ? 1 : -1) * R, o, hi, hw[wi][hi - 1]};
            }
          }
        }
      }
      if (at < 0) {
        // Arcs of other nets' wires a straight segment runs into: the other wire bends around an
        // obstacle this wire crosses no edge of (it passes the triangle as a chord), so no slot orders
        // the two, and the chord cuts through the arc. The chord bends around that arc, outside it.
        // (A chord inside the circle is the inner wire's; the slots keep it.)
        static const bool kNoArc = std::getenv("XR_NOARC") != nullptr;
        for (size_t k = 0; k + 1 < n && at < 0 && !kNoArc; ++k) {
          Vec2 p = k == 0 ? cs[0].c : to[k];
          Vec2 q = k + 1 == n - 1 ? cs[n - 1].c : ti[k + 1];
          if ((q - p).len2() < 1) continue;
          double width = std::min(cs[k].width, cs[k + 1].width);
          for (int wj : nearWires) {
            const RealWire& o = wires[wj];
            const auto& ocs = bendsOf[wj];
            for (size_t m = 1; m + 1 < ocs.size(); ++m) {
              const Circle& oc = ocs[m];
              if (oc.obst < 0) continue;
              double R = std::abs(oc.rho);
              double spacing = width / 2.0 + std::max(double(w.clearance), double(o.clearance)) + kMargin + oc.width / 2.0;
              Vec2 X = closestPointOnSegment(oc.c, p, q);
              double dc = (X - oc.c).len();
              if (dc >= R + spacing) continue;
              double sweep = sweepOf(oc, tinOf[wj][m], toutOf[wj][m]);
              double ai = std::atan2(tinOf[wj][m].y - oc.c.y, tinOf[wj][m].x - oc.c.x);
              auto onArc = [&](Vec2 a, double slop) {
                double ax = std::atan2(a.y - oc.c.y, a.x - oc.c.x);
                double rel = sweep >= 0 ? normalizeAngle(ax - ai) : normalizeAngle(ai - ax);
                return rel <= std::abs(sweep) + slop;
              };
              double radius = R + spacing;
              if (dc < R) {
                // Inside the circle: the inner wire's chord, unless it runs through the arc itself
                // (no shared edge orders the two: the other wire comes from a free end, or lies along
                // an edge). The sketch says on which side of the arc this wire belongs.
                Vec2 foot = oc.c + (X - oc.c);
                Vec2 along = (q - p).normalized();
                double half = std::sqrt(std::max(0.0, R * R - dc * dc));
                bool through = false;
                for (double sgn : {-1.0, 1.0}) {
                  Vec2 Y = foot + along * (sgn * half);
                  double u = (Y - p).dot(along);
                  if (u > 0 && u < (q - p).len() && onArc(Y, 0.0)) through = true;
                }
                if (!through) continue;
                double bestD = std::numeric_limits<double>::max(), radial = -1;
                for (Vec2 v : sk) {
                  double r = (v - oc.c).len();
                  if (!onArc(v, 0.0) || std::abs(r - R) >= bestD) continue;
                  bestD = std::abs(r - R);
                  radial = r;
                }
                if (radial >= 0 && radial < R) radius = R - spacing;
                if (radius <= 0) continue;
              } else if (!onArc(X, 0.05)) {
                continue;  // the closest point must face the arc itself, not the rest of the circle
              }
              if (dropped.contains(oc.obst) || std::ranges::any_of(cs, [&](const Circle& x) { return x.obst == oc.obst; })) continue;
              at = int(k) + 1;
              ins = {oc.c, (orient(p, q, oc.c) > 0 ? 1 : -1) * radius, oc.obst, cs[k].portal, width};
              break;
            }
            if (at >= 0) break;
          }
        }
        if (at >= 0) ++st.arcBends;
      }
      if (at < 0) {
        // Guard by geometry: copper of other nets the straight segments run into although it is no end
        // of a crossed edge (a sketch waypoint that skipped a fan, a dropped apex): bend around it.
        for (size_t k = 0; k + 1 < n && at < 0; ++k) {
          Vec2 p = k == 0 ? cs[0].c : to[k];
          Vec2 q = k + 1 == n - 1 ? cs[n - 1].c : ti[k + 1];
          if ((q - p).len2() < 1) continue;
          BBox bb;
          bb.add(p);
          bb.add(q);
          bb = bb.inflated(3 * kNmPerMm + w.width);
          double width = std::min(cs[k].width, cs[k + 1].width);
          for (int o = 0; o < int(ob.pts.size()); ++o) {
            const OPt& op = ob.pts[o];
            if (op.net == kTransparent || (op.net == w.net && w.net != kNoNet) || !bb.contains(op.p)) continue;
            if (op.r <= 0 && op.shape < 0) continue;  // a bare point (outline, keepout) has sides handled elsewhere
            if (dropped.contains(o) || std::ranges::any_of(cs, [&](const Circle& x) { return x.obst == o; })) continue;
            Vec2 on = closestPointOnSegment(op.p, p, q);
            double t = (on - p).dot(q - p) / (q - p).len2();
            if (t <= 0 || t >= 1) continue;
            double R = ob.reach(op, (on - op.p).normalized()) + std::max(op.clr, double(w.clearance)) + kMargin + width / 2.0;
            if ((on - op.p).len() < R - 1000) {
              at = int(k) + 1;
              ins = {op.p, (orient(p, q, op.p) > 0 ? 1 : -1) * R, o, cs[k].portal, width};
              break;
            }
          }
        }
        if (at >= 0) ++st.guardBends;
      }
      if (at < 0) break;
      cs.insert(cs.begin() + at, ins);
    }
    if (std::getenv("XR_DEBUG2")) {
      std::print(stderr, "  final {}:", wi);
      for (size_t k = 0; k < cs.size(); ++k)
        std::print(stderr, " [o{} rho{:+.3f} in({:.3f},{:.3f}) out({:.3f},{:.3f})]", cs[k].obst, cs[k].rho / 1e6,
                   ti[k].x / 1e6, ti[k].y / 1e6, to[k].x / 1e6, to[k].y / 1e6);
      std::println(stderr, "");
    }
    for (const Circle& c : cs) {
      if (c.obst < 0) continue;
      double r = std::abs(c.rho);
      // The crossings of this pass: the run of the wire's edges at the obstacle around the bend's portal.
      auto mark = [&](int hi) {
        if (hi < 0 || hi >= int(hits[wi].size())) return false;
        const EdgeHit& h = hits[wi][hi];
        if (h.u != c.obst && h.v != c.obst) return false;
        double& rr = bendR[wi][hi][h.u == c.obst ? 0 : 1];
        if (r > rr + 1) {
          rr = r;
          radiiChanged = true;
        }
        return true;
      };
      for (int hi = c.portal - 1; mark(hi); --hi) {}
      for (int hi = c.portal; mark(hi); ++hi) {}
    }
    bendsOf[wi] = cs;
    tinOf[wi] = ti;
    toutOf[wi] = to;
    // Realised centre line as a polyline (arcs tessellated) and its crossings of the wire's edges.
    Polyline path;
    {
      size_t n = cs.size();
      path.push_back(cs[0].c);
      for (size_t k = 0; k + 1 < n; ++k) {
        Vec2 p = (k == 0) ? cs[0].c : to[k];
        Vec2 q = (k + 1 == n - 1) ? cs[n - 1].c : ti[k + 1];
        path.push_back(p);
        path.push_back(q);
        if (k + 1 < n - 1) {
          double sw = sweepOf(cs[k + 1], ti[k + 1], to[k + 1]);
          auto g = ArcGeom::fromCenter(cs[k + 1].c, ti[k + 1], sw);
          if (g.valid)
            for (auto& v : g.tessellate(20000)) path.push_back(v);
        }
      }
      path.push_back(cs[n - 1].c);
    }
    for (int k = 0; k < int(hits[wi].size()); ++k) {
      const EdgeHit& h = hits[wi][k];
      Vec2 U = ob.pts[h.u].p, V = ob.pts[h.v].p;
      double L = (V - U).len();
      double best = -1;
      for (size_t i = 1; i < path.size(); ++i) {
        Vec2 p = path[i - 1], q = path[i];
        double den = (V - U).cross(q - p);
        if (std::abs(den) < 1e-9) continue;
        double s = (p - U).cross(q - p) / den;  // along U->V
        double r = (p - U).cross(V - U) / den;  // along p->q
        if (s < 0 || s > 1 || r < 0 || r > 1) continue;
        double d = s * L;
        double prev = actual[wi][k];
        // Keep the crossing nearest to the previous estimate (or the slot) when there are several.
        double ref = prev >= 0 ? prev : (slots[wi][k].lo + slots[wi][k].hi) / 2;
        if (best < 0 || std::abs(d - ref) < std::abs(best - ref)) best = d;
      }
      // Experimental (XR_ACTUAL=<rounds>): outer wires stack on the inner wires' actual crossings.
      static const int kActualRounds = std::getenv("XR_ACTUAL") ? std::atoi(std::getenv("XR_ACTUAL")) : 0;
      if (round < kActualRounds && best >= 0) {
        if (std::abs(best - actual[wi][k]) > 1000) radiiChanged = true;
        actual[wi][k] = best;
      }
    }
  }
  if (!radiiChanged) break;
  st.droppedApexes = 0;
  }  // rounds

  phase.emplace("realize: emission");
  for (int wi = 0; wi < NW; ++wi) {
    const RealWire& w = wires[wi];
    for (double x : hw[wi])
      if (x < double(w.width)) ++st.narrowed;
    // A tangent between two bends is as narrow as the narrower bend (the step sits where there is room).
    auto emitSeg = [&](Vec2 p, Vec2 q, double width) {
      Track t;
      t.a = Point(p);
      t.b = Point(q);
      t.width = Coord(std::llround(width));
      t.layer = w.layer;
      t.net = w.net;
      if (t.a == t.b) return;
      b.tracks.push_back(t);
      st.trackWire.push_back(wi);
    };
    auto emitArc = [&](Vec2 c, Vec2 from, double sweep, double width) {
      auto g = ArcGeom::fromCenter(c, from, sweep);
      if (!g.valid) return;
      Track t;
      t.a = Point(from);
      t.mid = Point(g.mid());
      t.b = Point(g.end());
      t.width = Coord(std::llround(width));
      t.layer = w.layer;
      t.net = w.net;
      b.tracks.push_back(t);
      st.trackWire.push_back(wi);
      ++st.arcs;
    };
    // The exit arc: the straight stub out of a pad end turns onto its first tangent with an arc, as
    // TopoR's wires leave their pins — a fillet tangent to both, as large as the stub's free length,
    // the tangent and the copper around allow (it cuts the corner, towards the neighbouring pad).
    // `dA`/`dB`: how far back along A->E and E->B the arc may start and end.
    auto fillet = [&](Vec2 A, Vec2 E, Vec2 B, double dA, double dB, double width, Vec2& T1, Vec2& T2, Vec2& C,
                      double& sweep) {
      Vec2 u = A - E, v = B - E;
      double lu = u.len(), lv = v.len();
      if (lu < 1 || lv < 1) return false;
      u = u / lu;
      v = v / lv;
      double phi = std::acos(std::clamp(u.dot(v), -1.0, 1.0));  // interior angle at E
      double alpha = kPi - phi;                                  // the turn
      if (alpha < 0.03 || phi < 0.2) return false;
      // Tangent length d: radius R = d * tan(phi/2), centre on the bisector at d / cos(phi/2).
      double d = std::min({dA, dB, kExitRadius / std::tan(phi / 2)});
      for (int it = 0; it < 4 && d > 1000; ++it, d *= 0.5) {
        T1 = E + u * d;
        T2 = E + v * d;
        C = E + (u + v).normalized() * (d / std::cos(phi / 2));
        sweep = (orient(A, E, B) > 0 ? 1 : -1) * alpha;
        auto g = ArcGeom::fromCenter(C, T1, sweep);
        if (g.valid && (g.end() - T2).len() > 1000) {  // the other way round
          sweep = -sweep;
          g = ArcGeom::fromCenter(C, T1, sweep);
        }
        if (!g.valid || (g.end() - T2).len() > 1000) return false;
        bool ok = true;
        BBox bb;
        bb.add(T1);
        bb.add(T2);
        bb.add(E);
        double need = width / 2.0 + double(w.clearance);
        auto pts = g.tessellate(20000);
        oidx.query(bb.inflated(need + 1000), LayerMask(1) << w.layer, [&](ItemRef r) {
          if (!ok || itemNet(b, r) == w.net) return;
          for (auto& sh : itemShapes(b, r))
            for (Vec2 q : pts)
              if (sh.distance(q) < need) {
                ok = false;
                return;
              }
        });
        if (ok) return true;
      }
      return false;
    };
    const auto& cs = bendsOf[wi];
    const auto& ti = tinOf[wi];
    const auto& to = toutOf[wi];
    for (int end = 0; end < 2; ++end)  // a wire that is nothing but its stubs (pad to the via in front of it)
      if (cs.size() < 2 && stubs[wi][end].on) {
        emitSeg(stubs[wi][end].from, stubs[wi][end].mid, double(w.width));
        emitSeg(stubs[wi][end].mid, stubs[wi][end].to, double(w.width));
      }
    if (cs.size() < 2) continue;
    size_t n = cs.size();
    Vec2 startAt = cs[0].c, endAt = cs[n - 1].c;
    if (stubs[wi][0].on) {
      const Stub& s0 = stubs[wi][0];
      Vec2 q = (n == 2) ? cs[1].c : ti[1];
      Vec2 T1, T2, C;
      double sw;
      emitSeg(s0.from, s0.mid, cs[0].width);
      if (fillet(s0.mid, s0.to, q, s0.free, 0.5 * (q - s0.to).len(), cs[0].width, T1, T2, C, sw)) {
        emitSeg(s0.mid, T1, cs[0].width);
        emitArc(C, T1, sw, cs[0].width);
        startAt = T2;
      } else {
        emitSeg(s0.mid, s0.to, cs[0].width);
      }
    }
    Vec2 endT2, endC;
    double endSweep = 0;
    bool endArc = false;
    if (stubs[wi][1].on) {
      const Stub& s1 = stubs[wi][1];
      Vec2 pl = (n == 2) ? startAt : to[n - 2];
      Vec2 T1;
      if (fillet(pl, s1.to, s1.mid, 0.5 * (pl - s1.to).len(), s1.free, cs[n - 1].width, T1, endT2, endC, endSweep)) {
        endAt = T1;
        endArc = true;
      }
    }
    Vec2 cur = startAt;
    for (size_t k = 0; k + 1 < n; ++k) {
      Vec2 p = (k == 0) ? startAt : to[k];
      Vec2 q = (k + 1 == n - 1) ? endAt : ti[k + 1];
      // The tangent runs through every portal between its bends: as narrow as the narrowest of them.
      double width = std::min(cs[k].width, cs[k + 1].width);
      for (int hi = cs[k].portal + 1; hi < cs[k + 1].portal; ++hi)
        if (hi >= 1 && hi <= int(hits[wi].size())) width = std::min(width, hw[wi][hi - 1]);
      emitSeg(cur, p, cs[k].width);
      emitSeg(p, q, width);
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
          t.width = Coord(std::llround(C.width));
          t.layer = w.layer;
          t.net = w.net;
          b.tracks.push_back(t);
          st.trackWire.push_back(wi);
          ++st.arcs;
          cur = to[k + 1];
        }
      }
    }
    if (stubs[wi][1].on) {
      const Stub& s1 = stubs[wi][1];
      if (endArc) {
        emitArc(endC, endAt, endSweep, cs[n - 1].width);
        emitSeg(endT2, s1.mid, cs[n - 1].width);
      } else {
        emitSeg(s1.to, s1.mid, cs[n - 1].width);
      }
      emitSeg(s1.mid, s1.from, cs[n - 1].width);
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
