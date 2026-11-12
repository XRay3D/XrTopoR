#include "router/topo/Drawn.h"
#include "router/topo/RealizerInput.h"
#include "topo/Narrowing.h"
#include "topo/PadExit.h"
#include "router/topo/Realizer.h"
#include "core/Parallel.h"

#include "core/DiffPairs.h"
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
#include <numbers>
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
// ... and what a bend at the nominal keeps from the end of a wire that ends beside its obstacle.
constexpr double kNominalEndRoom = 50000;
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


// Directed common tangent leaving circle a and arriving at circle b.
bool tangent(const Bend& a, const Bend& b, Vec2& pa, Vec2& pb) {
  Vec2 D = b.c - a.c;
  double dr = b.rho - a.rho;
  double D2 = D.len2();
  if (D2 < 1) return false;
  // Two circles that touch (a wire between two pads at the rule's minimum: the pitch is the two radii
  // exactly, MinVia_standard_routing U7-3 and U7-4) have their tangent at the point of touching, across
  // the line of centres; a nanometre short of touching is the same line.
  double L2 = D2 - dr * dr;
  if (L2 < -2.0 * std::abs(dr) - 1) return false;
  double L = std::sqrt(std::max(0.0, L2));
  Vec2 d{(L * D.x + dr * D.y) / D2, (-dr * D.x + L * D.y) / D2};
  Vec2 nL = d.perp();
  pa = a.c - nL * a.rho;
  pb = b.c - nL * b.rho;
  return true;
}

double sweepOf(const Bend& c, Vec2 in, Vec2 out) {
  double ai = std::atan2(in.y - c.c.y, in.x - c.c.x);
  double ao = std::atan2(out.y - c.c.y, out.x - c.c.x);
  if (c.rho > 0) return normalizeAngle(ao - ai);
  return -normalizeAngle(ai - ao);
}


}  // namespace

std::vector<RoundWall> roundWalls(const Board& b, LayerId layer) {
  std::vector<RoundWall> out;
  auto circle = [](const Graphic& g, Vec2& c, double& r) {
    if (g.kind != GraphicKind::Circle) return false;
    c = g.a;
    r = (g.b - g.a).len();
    return r > 0;
  };
  // A hole: a circle drawn on the edge layer that one of the outline's inner loops lies on.
  for (const Graphic& g : b.graphics) {
    Vec2 c;
    double r;
    if (!b.isEdge(g.layer) || !circle(g, c, r)) continue;
    for (size_t i = 1; i < b.outline.size(); ++i) {
      const double tol = std::max(2000.0, r * 0.01);
      if (r::all_of(b.outline[i], [&](Vec2 p) { return std::abs((p - c).len() - r) <= tol; })) {
        out.push_back({c, r, double(b.edgeClearance)});
        break;
      }
    }
  }
  // An arc side of a polygon wall whose whole circle lies within the polygon (a rounded corner, a bulge): the
  // circle is one obstacle, as a wire from outside never gets into the polygon anyway. An arc whose circle
  // sticks out of its polygon (a shallow bulge, a notch) stays a chain of points.
  auto arcsOf = [&](const Graphic& g, double clr) {
    if (g.kind != GraphicKind::Poly || g.pts.size() < 3 || !g.hasArcs()) return;
    const Polyline poly = g.path(100.0);  // the arcs in chords within 0.1 um: the circle is tested a micron inside
    for (size_t k = 0; k < g.pts.size(); ++k) {
      const double deg = g.arcOf(k);
      const Vec2 p = g.pts[k], q = g.pts[(k + 1) % g.pts.size()];
      if (deg == 0 || p == q) continue;
      const ArcGeom arc = ArcGeom::fromThreePoints(p, arcMiddle(p, q, deg), q);
      if (!arc.valid || arc.radius <= 0) continue;
      bool inside = true;
      for (int i = 0; i < 36 && inside; ++i) {
        const double a = i * (2 * std::numbers::pi / 36);
        inside = pointInPolygon(arc.center + Vec2{std::cos(a), std::sin(a)} * (arc.radius - 1000), poly);
      }
      if (inside) out.push_back({arc.center, arc.radius, clr});
    }
  };
  for (const Graphic& g : b.graphics)
    if (b.isEdge(g.layer)) {
      // (Of the outline's drawings only a cutout's: the outer contour is followed from inside.)
      const Polyline path = g.path();
      bool cutout = false;
      for (size_t i = 1; i < b.outline.size() && !cutout; ++i)
        cutout = !path.empty() && r::any_of(b.outline[i], [&](Vec2 p) { return (p - path.front()).len() < 10; });
      if (cutout) arcsOf(g, double(b.edgeClearance));
    }
  for (const Keepout& k : b.keepouts) {
    if (!k.onLayer(layer) || !k.wires) continue;
    for (const Graphic& g : k.shape) {
      Vec2 c;
      double r;
      if (circle(g, c, r)) out.push_back({c, r, 0.0});
      else arcsOf(g, 0.0);
    }
  }
  return out;
}

namespace {

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
      case Shape::Kind::Point: ob.pts[ob.add(s.a, s.r, clr, pad.net)].round = true; break;
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
    if (v.onLayer(layer) && inRegion(Shape::circle(v.pos.v(), v.diameter / 2.0).bbox())) {
      OPt& o = ob.pts[ob.add(v.pos.v(), v.diameter / 2.0, double(b.clearance(v.net, layer)), v.net)];
      o.via = int(vi);
      o.round = true;
    }
  }
  for (const RealVia& v : vias) ob.pts[ob.add(v.pos, v.diameter / 2.0, double(b.clearance(v.net, layer)), v.net)].round = true;
  for (const auto& a : opt.anchors)
    if (a.layer == layer) ob.add(a.pos, a.radius, double(b.clearance(a.net, layer)), a.net);
  for (auto& loop : b.outline) {
    int first = int(ob.pts.size());
    int n = int(loop.size());
    for (auto& p : loop) ob.add(p, 0, double(b.edgeClearance), kBoardEdge);
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
                     : closed                       ? s.outline(1000.0)
                                                    : Polyline{s.a, s.b};
      int prev = -1, first = -1;
      size_t n = pts.size(), segs = closed ? n : n - 1;
      for (size_t i = 0; i < segs; ++i) {
        Vec2 a = pts[i], c = pts[(i + 1) % n];
        int parts = std::max(1, int(std::ceil((c - a).len() / (0.5 * kNmPerMm))));
        for (int q = 0; q < parts; ++q) {
          int o = ob.add(a + (c - a) * (double(q) / parts), 0, 0, kBoardEdge);
          if (prev >= 0) ob.link(prev, o, 0);
          else first = o;
          prev = o;
        }
      }
      if (closed) ob.link(prev, first, 0);
      else ob.link(prev, ob.add(pts.back(), 0, 0, kBoardEdge), 0);
    }
  }
  // A round wall as one obstacle at its centre: the wire goes round it as one arc, and the bends round the
  // wall's own points, inside that circle, go.
  for (const RoundWall& rw : roundWalls(b, layer))
    if (BBox bb; (bb.add(rw.c - Vec2{rw.r, rw.r}), bb.add(rw.c + Vec2{rw.r, rw.r}), inRegion(bb))) ob.pts[ob.add(rw.c, rw.r, rw.clr, kBoardEdge)].round = true;
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
      ob.addTrack(t, double(b.clearance(t.net, layer)) + kTrackObstacleMargin);
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
      // The last resort (topo/Narrowing.h): short of the rule by more than the limit, and cured by it.
      if (room >= t.width / 2.0 - kNarrowDeficitLimit) continue;
      Coord w = Coord(std::floor(2 * room / 1000) * 1000);
      if (w < minW) continue;  // the minimum would not fit either: the wire stays whole, the DRC shows it
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
  // What the pattern replaced at each end: the drawn points it dropped (from the end on) and whether an exit
  // point went in their place — kept to give the drawn exit back where the pattern cannot be had.
  struct Lead {
    Polyline dropped;
    bool inserted = false;
  };
  std::vector<std::array<Lead, 2>> leads(NW);
  {
    const SpatialIndex& idx = oidx;
    for (int wi = 0; wi < NW; ++wi) {
      const RealWire& w = wires[wi];
      Polyline& sk = sketches[wi];
      sk = w.sketch;
      if (sk.size() < 2 || w.net == kNoNet || opt.mesh || !opt.padPattern) continue;
      double reach = double(w.clearance) + w.width / 2.0 + kMargin;  // the wire's envelope beyond the copper
      for (int end = 0; end < 2; ++end) {
        if (end) r::reverse(sk);
        Vec2 p = sk.front();
        std::optional<Shape> pad;
        int padIndex = -1;
        BBox q;
        q.add(p);
        idx.query(q.inflated(1000), LayerMask(1) << w.layer, [&](ItemRef r) {
          if (pad || r.type != ItemType::Pad || b.pads[r.index].net != w.net) return;
          Shape s = b.pads[r.index].shapeGeom();
          if (s.kind != Shape::Kind::Point && s.distance(p) <= kPadEdgeTol) {
            pad = s;
            padIndex = r.index;
          }
        });
        bool on = false;
        size_t k = 1;  // the first sketch point clear of the pad
        if (pad)
          while (k < sk.size() && pad->distance(sk[k]) <= kPadEdgeTol) ++k;
        if (pad && k < sk.size()) {
          // TopoR's pattern (topo/PadExit.h): from the pad's centre to the inner point half a width short of
          // the end, and out through that end — the end nearer to where the wire goes; an elongated pad is
          // left through an end only, never through its long side.
          PadFrame f = padFrame(b.pads[padIndex]);
          // A bridge to the pad beside it in the row: the whole wire lies between the two pads, a straight
          // run from centre to centre.
          bool bridge = false;
          {
            std::optional<int> other;
            BBox qb;
            qb.add(sk.back());
            idx.query(qb.inflated(1000), LayerMask(1) << w.layer, [&](ItemRef r) {
              if (other || r.type != ItemType::Pad || r.index == padIndex || b.pads[r.index].net != w.net) return;
              if (b.pads[r.index].shapeGeom().contains(sk.back())) other = r.index;
            });
            if (other) {
              PadFrame g = padFrame(b.pads[*other]);
              // Side by side: no further apart than a wire with its clearances would need to pass between,
              // and across the pads' axes if they are elongated.
              const Vec2 d = g.c - f.c;
              auto across = [&](const PadFrame& x) { return !x.elongated() || std::abs(d.dot(x.t)) >= std::abs(d.dot(x.n)); };
              bridge = d.len() - f.W - g.W <= double(w.width) + 2 * double(w.clearance) && across(f) && across(g);
              for (size_t i = 0; i < sk.size() && bridge; ++i) bridge = distPointSegment(sk[i], f.c, g.c) <= double(w.width);
              if (bridge) {
                if (end == 0) sk = {f.c, g.c};  // once, from the first end
              }
            }
          }
          if (!bridge && f.kind != PadFrame::Kind::Other) {
            // Where the drawn wire leaves the copper decides the end and the lateral offset of the exit.
            Vec2 pin = sk[k - 1], pout = sk[k];
            for (int it = 0; it < 30; ++it) {
              Vec2 m = (pin + pout) * 0.5;
              (pad->distance(m) <= 0 ? pin : pout) = m;
            }
            Vec2 l = f.local(pout);
            bool throughEnd = f.onEnd(pout);
            // A pad that is not elongated is left through the side the wire is drawn through: the frame turned.
            if (!throughEnd && !f.elongated()) {
              f = f.turned();
              l = f.local(pout);
              throughEnd = true;
            }
            // Where the wire goes: the drawn wire a few of the end's widths on from the copper.
            Vec2 goes = pout;
            {
              const double far = 4 * f.W + reach;
              double run = 0;
              for (size_t i = k; i < sk.size() && run < far; ++i) {
                const double step = (sk[i] - goes).len();
                goes = run + step > far ? goes + (sk[i] - goes) * ((far - run) / step) : sk[i];
                run += step;
              }
            }
            // The inner point of an earlier pass stays (RealWire::inner, or the wire's first vertex if that
            // lies in an end already): the wire that begins there crosses the edge a little aside, and both
            // the end and the offset would creep with every pass.
            const double depth = (f.innerPoint(1, double(w.width), 0) - f.c).dot(f.n);
            std::optional<Vec2> was;
            if (const auto& hint = w.inner[end]; hint && std::abs(f.local(*hint).x) >= depth - 1000) was = *hint;
            else if (std::abs(f.local(sk[0]).x) >= depth - 1000 && depth > 1000) was = sk[0];
            // Else the end the wire is drawn through; drawn through the long side of an elongated pad — the
            // end nearer to where the wire goes (straight aside: to where it ends).
            double along = was ? f.local(*was).x : throughEnd ? l.x : f.local(goes).x;
            if (!was && !throughEnd && std::abs(along) < 1000) along = f.local(sk.back()).x;
            const int sign = along >= 0 ? 1 : -1;
            const Vec2 n = f.n * double(sign);
            // The lateral offset (a rectangle's): the side the wire goes to; the wire is laid taut from the
            // inner point, and one that started on the other side would wrap its own pad's corner.
            const double v = was ? f.local(*was).y : f.local(goes).y;
            const Vec2 I = f.innerPoint(sign, double(w.width), v), X = f.edgePoint(sign, double(w.width), v);
            // A narrow end (no wider than the wire and its clearances): the wire goes on straight beyond it
            // by its envelope, so that the first tangent leaves the pads beside it their room; the stub's
            // points keep the other wires off it. Out of a wider end the wire is laid from the inner point
            // (its first bend begins there, inside the copper, as TopoR's does): the pad itself keeps the
            // others off, and the triangulation is the pads' alone.
            const bool narrow = 2 * f.W < w.width + 2.0 * double(w.clearance);
            Vec2 E = narrow ? X + n * reach : I;
            size_t drop = 1;
            while (drop + 1 < sk.size() && pad->distance(sk[drop]) < (narrow ? reach : 1.0)) ++drop;
            leads[wi][end].dropped.assign(sk.begin(), sk.begin() + drop);
            sk.erase(sk.begin(), sk.begin() + drop);
            // A via right in front of the end (a fanout site): the stub ends at it, no exit point beyond.
            Vec2 d = sk.front() - X;
            if (narrow && d.dot(n) < (E - X).dot(n) && std::abs(d.cross(n)) <= w.width / 2.0) E = sk.front();
            else {
              sk.insert(sk.begin(), E);
              leads[wi][end].inserted = true;
            }
            stubs[wi][end] = {f.c, I, E, true, (E - I).len(), narrow, padIndex};
            on = true;
          }
        }
        if (std::getenv("XR_DEBUG_STUB") && pad) {
          PadFrame f = padFrame(b.pads[padIndex]);
          const Stub& d = stubs[wi][end];
          std::println(stderr, "stub? net {} L{} end {} at ({:.4f},{:.4f}) pad ({:.4f},{:.4f}) {:.3f} x {:.3f} kind {} -> {}: ({:.4f},{:.4f}) ({:.4f},{:.4f}); sketch {}: ({:.4f},{:.4f}) ({:.4f},{:.4f}) .. ({:.4f},{:.4f})",
                       b.nets[w.net].name, int(w.layer), end, p.x / 1e6, -p.y / 1e6, f.c.x / 1e6, -f.c.y / 1e6, f.L / 1e6, f.W / 1e6,
                       int(f.kind), on, d.mid.x / 1e6, -d.mid.y / 1e6, d.to.x / 1e6, -d.to.y / 1e6, sk.size(), sk[0].x / 1e6, -sk[0].y / 1e6,
                       sk[1].x / 1e6, -sk[1].y / 1e6, sk.back().x / 1e6, -sk.back().y / 1e6);
        }
        if (end) r::reverse(sk);
      }
    }
  }
  // The pattern moves the exit (a wire drawn out of the long side leaves through the end now). The new lead
  // and the drawn one close a loop; a wire of another net that crosses it an odd number of times ends
  // inside, or the drawn wires cross already: the pattern would put this wire on the other side of it, and
  // the wire keeps its drawn exit (TopoR's F5 leaves such a dog-leg as drawn too: D1-30 of
  // Arcs_standard_routing). An even number is a sketch drawn loosely across the lead, and no hindrance —
  // unless it is the stub itself that the other wire passes through once: that is copper, and it does not
  // give way.
  auto crosses = [](Vec2 a, Vec2 c, Vec2 p, Vec2 q) {
    double o1 = orient(a, c, p), o2 = orient(a, c, q), o3 = orient(p, q, a), o4 = orient(p, q, c);
    return ((o1 > 0) != (o2 > 0)) && ((o3 > 0) != (o4 > 0)) && o1 != 0 && o2 != 0 && o3 != 0 && o4 != 0;
  };
  auto parted = [&](int wi, const Polyline& now, const Polyline& was) {
    BBox bb;
    for (Vec2 p : now) bb.add(p);
    for (Vec2 p : was) bb.add(p);
    for (int o = 0; o < NW; ++o) {
      if (o == wi || wires[o].layer != wires[wi].layer || wires[o].net == wires[wi].net) continue;
      const Polyline& s = sketches[o];
      int n = 0, stub = 0;  // crossings of the loop; of the stub itself (the lead's first two runs: copper)
      for (size_t i = 0; i + 1 < s.size(); ++i) {
        BBox sb;
        sb.add(s[i]);
        sb.add(s[i + 1]);
        if (!sb.intersects(bb)) continue;
        for (const Polyline* lead : {&now, &was})
          for (size_t j = 0; j + 1 < lead->size(); ++j)
            if (crosses((*lead)[j], (*lead)[j + 1], s[i], s[i + 1])) {
              ++n;
              if (lead == &now && j < 2) ++stub;
            }
      }
      if (n % 2 || stub % 2) return true;
    }
    return false;
  };
  // ... or runs through the copper of another net that the drawn one kept off.
  auto through = [&](int wi, const Polyline& lead) {
    int n = 0;
    const RealWire& w = wires[wi];
    BBox bb;
    for (Vec2 p : lead) bb.add(p);
    oidx.query(bb, LayerMask(1) << w.layer, [&](ItemRef r) {
      if ((r.type != ItemType::Pad && r.type != ItemType::Via) || itemNet(b, r) == w.net) return;
      for (auto& sh : itemShapes(b, r))
        for (size_t j = 0; j + 1 < lead.size(); ++j) n += sh.distanceToSegment(lead[j], lead[j + 1]) <= 0;
    });
    return n;
  };
  for (int wi = 0; wi < NW; ++wi)
    for (int end = 0; end < 2; ++end) {
      Stub& st = stubs[wi][end];
      const Lead& ld = leads[wi][end];
      if (!st.on || ld.dropped.empty()) continue;
      Polyline& sk = sketches[wi];
      if (end) r::reverse(sk);
      const size_t next = ld.inserted ? 1 : 0;  // the first drawn point the pattern kept
      Polyline now{st.from, st.mid, st.to}, was = ld.dropped;
      if (next < sk.size()) {
        now.push_back(sk[next]);
        was.push_back(sk[next]);
      }
      if (parted(wi, now, was) || through(wi, now) > through(wi, was)) {
        if (ld.inserted) sk.erase(sk.begin());
        sk.insert(sk.begin(), ld.dropped.begin(), ld.dropped.end());
        // From the centre all the same: the lead of an earlier pass is gone with the runs inside the pad.
        if ((sk.front() - st.from).len2() > 1) sk.insert(sk.begin(), st.from);
        st = {};
      }
      if (end) r::reverse(sk);
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
        if (st.on && st.guard) {
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
          if (!r::contains(st.crossingNets, std::pair{pr.first, pr.second})) st.crossingNets.push_back({pr.first, pr.second});
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

const LayerObstacles::Grid& LayerObstacles::grid() const {
  Grid& g = grid_;
  if (g.built != pts.size() || g.cells.empty()) {
    g = Grid{};
    g.built = pts.size();
    BBox all;
    for (const OPt& o : pts) all.add(o.p);
    if (!all.valid()) return g;
    // About two points a cell, no finer than 0.5 mm.
    const double w = std::max(all.maxX - all.minX, 1.0), h = std::max(all.maxY - all.minY, 1.0);
    g.cell = std::max(0.5 * kNmPerMm, std::sqrt(w * h * 2 / double(std::max<size_t>(pts.size(), 1))));
    g.x0 = all.minX;
    g.y0 = all.minY;
    g.nx = std::max(1, int(w / g.cell) + 1);
    g.ny = std::max(1, int(h / g.cell) + 1);
    g.cells.assign(size_t(g.nx) * size_t(g.ny), {});
    for (int i = 0; i < int(pts.size()); ++i) {
      const int cx = std::clamp(int((pts[size_t(i)].p.x - g.x0) / g.cell), 0, g.nx - 1);
      const int cy = std::clamp(int((pts[size_t(i)].p.y - g.y0) / g.cell), 0, g.ny - 1);
      g.cells[size_t(cy) * size_t(g.nx) + size_t(cx)].push_back(i);
      if (pts[size_t(i)].r >= kFarRadius) g.far.push_back(i);
    }
  }
  return g;
}

void LayerObstacles::around(const BBox& box, std::vector<int>& out) const {
  out.clear();
  const Grid& g = grid();
  if (!box.valid() || g.cells.empty()) return;
  const int x1 = std::clamp(int(std::floor((box.minX - g.x0) / g.cell)), 0, g.nx - 1), x2 = std::clamp(int(std::floor((box.maxX - g.x0) / g.cell)), 0, g.nx - 1);
  const int y1 = std::clamp(int(std::floor((box.minY - g.y0) / g.cell)), 0, g.ny - 1), y2 = std::clamp(int(std::floor((box.maxY - g.y0) / g.cell)), 0, g.ny - 1);
  for (int cy = y1; cy <= y2; ++cy)
    for (int cx = x1; cx <= x2; ++cx) {
      const auto& c = g.cells[size_t(cy) * size_t(g.nx) + size_t(cx)];
      out.insert(out.end(), c.begin(), c.end());
    }
  out.insert(out.end(), g.far.begin(), g.far.end());
  r::sort(out);
  out.erase(std::unique(out.begin(), out.end()), out.end());
}

// The wires' places on the edges they cross, their bends and tangents: the drawing before it is tracks. Left in
// `d` (Drawn.h); the board is read only.
namespace {
// What a room on an edge, a bend of a wire has to move by to count as changed when a drawing is brought up to a
// changed input (updateDrawn): what moved less stays as it was, and so do the wires that read it. Well under the
// realiser's margin (kRealizeMargin) and the grid the tracks are written on.
constexpr double kUpdateTol = 100;
constexpr int kUpdateRounds = 16;
bool roomsDiffer(const EdgeRoom& a, const EdgeRoom& c) {
  auto far = [](double x, double y) { return std::abs(x - y) > kUpdateTol; };
  return far(a.lo, c.lo) || far(a.hi, c.hi) || far(a.xu, c.xu) || far(a.xv, c.xv) || far(a.ru, c.ru) || far(a.rv, c.rv) || far(a.du, c.du) || far(a.dv, c.dv) ||
         (a.cu - c.cu).len2() > kUpdateTol * kUpdateTol || (a.cv - c.cv).len2() > kUpdateTol * kUpdateTol;
}
bool bendsDiffer(const Bend& a, Vec2 ai, Vec2 ao, const Bend& c, Vec2 ci, Vec2 co) {
  const double t2 = kUpdateTol * kUpdateTol;
  return a.obst != c.obst || a.width != c.width || std::abs(a.rho - c.rho) > kUpdateTol || (a.c - c.c).len2() > t2 || (ai - ci).len2() > t2 || (ao - co).len2() > t2;
}
// An earlier drawing and what it was made from.
struct DrawnBefore {
  const std::vector<RealWire>& wires;
  const RealizeInput& in;
  const DrawnWires& d;
};
// The drawing computed: whole (`was` null), or brought up from an earlier one (false: it cannot be, nothing of `d` holds).
bool drawWires(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in, DrawnWires& d, RealizeStats& st,
               const DrawnBefore* was) {
  const int NW = int(wires.size());
  std::flat_map<LayerId, std::vector<int>> byLayer;
  for (int wi = 0; wi < NW; ++wi) byLayer[wires[wi].layer].push_back(wi);
  std::vector<std::vector<EdgeHit>>& hits = in.hits;
  std::vector<std::vector<EdgeRoom>>& slots = d.rooms;
  slots.assign(size_t(NW), {});
  for (int wi = 0; wi < NW; ++wi) slots[wi].resize(hits[wi].size());
  std::vector<Polyline>& sketches = in.sketches;
  std::vector<BBox> sketchBox(NW);
  for (int wi = 0; wi < NW; ++wi)
    for (Vec2 q : sketches[wi]) sketchBox[wi].add(q);
  std::map<LayerId, LayerObstacles>& obstacles = in.obstacles;
  auto& edgeLists = in.edgeLists;
  auto& cdtEdges = in.cdtEdges;
  std::vector<std::array<Stub, 2>>& stubs = in.stubs;
  std::optional<ProfScope> phase;
  (void)opt;
  // Bend radius each wire actually uses around each obstacle (merged over the fan); the stacks of
  // outer wires must build on it, so slots and bends are iterated.
  // Per crossing, not per obstacle: a wire that passes one obstacle several times (out and back, at
  // radii from 1 to 5 mm) has one bend for each pass, and the wires stacked on an inner pass have
  // nothing to do with the radius of the outer one (a whole-board re-lay blew up on that).
  // bendR[wire][crossing]: radius around the edge's u and v.
  std::vector<std::vector<std::array<double, 2>>>& bendR = d.bendR;
  bendR.assign(size_t(NW), {});
  for (int wi = 0; wi < NW; ++wi) bendR[wi].assign(hits[wi].size(), {-1.0, -1.0});
  std::vector<std::vector<Bend>>& bendsOf = d.bends;
  bendsOf.assign(size_t(NW), {});
  // Per wire: the wires of its layer and of other nets whose sketches come within 5 mm of its own (made in the
  // first round; a layer's thread touches its own wires' lists alone).
  std::vector<std::vector<int>> nearSketches(static_cast<size_t>(NW));
  std::vector<char> nearMade(static_cast<size_t>(NW), 0);
  std::vector<std::vector<Vec2>>&tinOf = d.tin, &toutOf = d.tout;
  tinOf.assign(size_t(NW), {});
  toutOf.assign(size_t(NW), {});
  // Where each wire's realised path actually crosses each of its edges (distance from u), from the
  // previous round: outer wires stack on these rather than on the packed minimum.
  std::vector<std::vector<double>>& actual = d.actual;
  actual.assign(size_t(NW), {});
  for (int wi = 0; wi < NW; ++wi) actual[wi].assign(hits[wi].size(), -1.0);
  // The nominal clearance (RealizeOptions::nominal; TopoR: the nominal everywhere the wires can be moved apart,
  // the minimum in the tight spots). It is given to the gap between an obstacle and the wire next to it, by the
  // obstacle's share of it; the gaps between the wires stay at the minimum. So the whole stack round an
  // obstacle moves out by one amount — as if its copper were that much larger — and two neighbouring wires keep
  // one distance all the way along: their nesting between two obstacles rests on nothing else. (Giving it to the
  // gaps between the wires as well, by the obstacle, let a bus stacked wide round one obstacle and tight round
  // the next lose its nesting: arz_4L 42 violations with 21 shorts against 10.)
  // The share of an obstacle: the least over its crossed edges of what the edge can give and keep kNominalRoom
  // of slack — all of it when the edge has that with the nominal at both ends, none when it has not even at
  // the minimum, between the two by the slack; less where a wall (the outline, a keepout's side) or the end of
  // a wire is nearer than the stack at the nominal would reach. Found in the first round, from the packing
  // alone; an edge that the bends of a later round overfill takes its ends' shares back and the rounds begin
  // again.
  static const bool kNoNominal = std::getenv("XR_NO_NOMINAL") != nullptr;
  // The debugging switches, read once (a getenv per wire and round was 0.4 % of F5).
  static const bool kOvf = std::getenv("XR_OVF") != nullptr, kNoCorner = std::getenv("XR_NOCORNER") != nullptr,
                    kDebug2 = std::getenv("XR_DEBUG2") != nullptr, kDebug2Sk = std::getenv("XR_DEBUG2SK") != nullptr,
                    kDebug4 = std::getenv("XR_DEBUG4") != nullptr;
  static const std::optional<int> kDebug7 = std::getenv("XR_DEBUG7") ? std::optional(std::atoi(std::getenv("XR_DEBUG7"))) : std::nullopt;
  const bool nominal = opt.nominal && !kNoNominal && b.hasNominal();
  std::map<LayerId, std::vector<double>>& nominalShare = d.share;
  std::map<LayerId, std::vector<std::array<double, 2>>>& stackReach = d.reach;  // per obstacle: the outermost wire's far side, at the minimum and at the nominal
  nominalShare.clear();
  stackReach.clear();
  d.tookBack.clear();
  for (const auto& [layer, ob] : obstacles) d.tookBack[layer];  // (made here, not by the threads)
  d.made = {};
  if (nominal)
    for (auto&& [layer, ob] : obstacles) {
      nominalShare[layer].assign(ob.pts.size(), 1.0);
      stackReach[layer].assign(ob.pts.size(), {0.0, 0.0});
      // Round copper only: vias, round pads, branch points. The corners and ends of a pad at the nominal sent
      // the chords of the wires past them into bends that were not there before, and the realiser dropped the
      // bend next to them (arz_2L: three shorts, net 9 through the arc of +5B).
      for (size_t i = 0; i < ob.pts.size(); ++i) {
        if (!ob.pts[i].round) nominalShare[layer][i] = 0;
      }
    }
  // >= 0: every obstacle's share for now (the two trial packings of the first round); a thread's own (the
  // layers of a round run at the same time).
  thread_local double shareOfAll;
  shareOfAll = -1;
  // The clearance between a wire and an obstacle, between two wires: the pair's rule when the board has
  // such rules (clearances between net groups), else the larger of their own.
  auto clrTo = [&](const OPt& o, const RealWire& w) {
    if (o.net == kBoardEdge) return o.clr;  // a wall: its own clearance alone (none from a keepout)
    double c = std::max(o.clr, double(w.clearance));
    if (o.net >= 0 && w.net >= 0 && !b.pairRules.empty())
      if (Coord p = pairClearance(b.pairRules, o.net, w.net, w.layer); p > 0) c = double(p);
    if (!nominal || o.net < 0 || w.net < 0) return c;
    double share = shareOfAll;
    if (share < 0) {
      const std::vector<double>& of = nominalShare.at(w.layer);
      const size_t i = size_t(&o - obstacles.at(w.layer).pts.data());
      share = i < of.size() ? of[i] : 0.0;
    }
    return share <= 0 ? c : c + share * std::max(0.0, double(b.clearanceNom(o.net, w.net, w.layer)) - c);
  };
  auto clrBetween = [&](const RealWire& x, const RealWire& y) {
    if (x.net >= 0 && y.net >= 0 && !b.pairRules.empty())
      if (Coord c = pairClearance(b.pairRules, x.net, y.net, x.layer); c > 0) return double(c);
    return std::max(double(x.clearance), double(y.clearance));
  };
  // Width of every wire at every crossing: nominal, or the minimum where an edge cannot take the
  // nominal widths of the wires crossing it (TopoR's «подрезка»).
  std::vector<std::vector<double>>& hw = d.width;
  hw.assign(size_t(NW), {});
  for (int wi = 0; wi < NW; ++wi) hw[wi].assign(hits[wi].size(), double(wires[wi].width));
  phase.emplace("realize: rounds+tangents");
  // The layers of a round at the same time: a layer's edges, obstacles and wires are its own (the wires near a
  // wire are of its layer). The rounds go in step as before: an edge of any layer that took its ends' shares
  // back restarts them all, and they end when no wire of any layer changed its radii.
  for (const auto& [layer, ids] : byLayer) edgeLists[layer];  // (made here, not by the threads)
  std::vector<LayerId> layersDrawn;
  for (const auto& [layer, ids] : byLayer) layersDrawn.push_back(layer);
  const size_t NL = layersDrawn.size();
  std::vector<RealizeStats> per(NL);  // the counts of each layer (st's are summed from them)
  auto inLayers = [&](auto&& fn) { parallelFor(NL, [&](size_t i) { fn(layersDrawn[i], per[i]); }); };
  // The pieces of a round: the shares of the nominal clearance finished (the walls, one share a pad), an edge packed,
  // a wire laid.
  auto finishShares = [&](LayerId layer) {
    const auto found = nominalShare.find(layer);
    if (found == nominalShare.end()) return;
    std::vector<double>& of = found->second;
      const LayerObstacles& ob = obstacles.at(layer);
      // The walls (the outline, a keepout's side): the slots keep a stack off their end points, not off the
      // wall between them — the arc of a larger radius between two edges of a fan came 12-27 um too near the
      // board's edge (Arcs: 20 violations). The stack at the nominal keeps its room from every wall near it.
      const std::vector<std::array<double, 2>>& reach = stackReach[layer];
      std::vector<std::pair<int, int>> walls;  // the sides between two points of no net (the model's input has them as sides only)
      for (int p = 0; p < int(ob.adj.size()); ++p)
        if (ob.pts[size_t(p)].net < 0 && ob.pts[size_t(p)].net != kTransparent)
          for (const Side& sd : ob.adj[size_t(p)])
            if (sd.to > p && ob.pts[size_t(sd.to)].net < 0 && ob.pts[size_t(sd.to)].net != kTransparent) walls.push_back({p, sd.to});
      // The points with a stack to keep off a wall, in a grid: a wall looks at those near it only (every wall
      // against every point of the layer was an eighth of F7 on a board with a long outline).
      std::vector<int> stacked;
      BBox span;
      double maxReach = 0;
      for (size_t i = 0; i < of.size(); ++i) {
        if (of[i] <= 0 || reach[i][1] <= reach[i][0] + 1 || ob.pts[i].net < 0) continue;
        stacked.push_back(int(i));
        span.add(ob.pts[i].p);
        maxReach = std::max(maxReach, reach[i][1]);
      }
      const double cell = 2.0 * kNmPerMm;
      const int gx = stacked.empty() ? 1 : std::clamp(int(span.width() / cell) + 1, 1, 1024);
      const int gy = stacked.empty() ? 1 : std::clamp(int(span.height() / cell) + 1, 1, 1024);
      auto col = [&](double x) { return std::clamp(int((x - span.minX) / cell), 0, gx - 1); };
      auto row = [&](double y) { return std::clamp(int((y - span.minY) / cell), 0, gy - 1); };
      std::vector<std::vector<int>> cells(size_t(gx) * size_t(gy));
      for (int i : stacked) cells[size_t(row(ob.pts[size_t(i)].p.y)) * size_t(gx) + size_t(col(ob.pts[size_t(i)].p.x))].push_back(i);
      for (auto [p, q] : walls) {
        if (stacked.empty()) break;
        const OPt& P = ob.pts[size_t(p)];
        const OPt& Q = ob.pts[size_t(q)];
        const double keep = std::max(P.clr, Q.clr) + kNominalRoom;
        BBox box;
        box.add(P.p);
        box.add(Q.p);
        const double widest = maxReach + keep;
        if (box.maxX + widest < span.minX || box.minX - widest > span.maxX || box.maxY + widest < span.minY || box.minY - widest > span.maxY) continue;
        for (int y = row(box.minY - widest); y <= row(box.maxY + widest); ++y)
          for (int x = col(box.minX - widest); x <= col(box.maxX + widest); ++x)
            for (int ii : cells[size_t(y) * size_t(gx) + size_t(x)]) {
              const size_t i = size_t(ii);
              if (of[i] <= 0) continue;
              const Vec2 c = ob.pts[i].p;
              const double far = reach[i][1] + keep;
              if (c.x < box.minX - far || c.x > box.maxX + far || c.y < box.minY - far || c.y > box.maxY + far) continue;
              const double d = distPointSegment(c, P.p, Q.p);
              of[i] = std::min(of[i], std::clamp((d - keep - reach[i][0]) / (reach[i][1] - reach[i][0]), 0.0, 1.0));
            }
      }
      // One share for all the points of a pad (its centre, corners and ends).
      std::map<int, double> least;
      auto key = [&](const OPt& o) { return o.owner >= 0 ? o.owner : o.shape >= 0 ? -2 - o.shape : -1; };
      for (size_t i = 0; i < of.size(); ++i)
        if (int k = key(ob.pts[i]); k != -1) {
          auto [it, fresh] = least.try_emplace(k, of[i]);
          if (!fresh) it->second = std::min(it->second, of[i]);
        }
      for (size_t i = 0; i < of.size(); ++i)
        if (int k = key(ob.pts[i]); k != -1) of[i] = least[k];
  };
  // `changed` (a drawing brought up): a wire's room is written only where it moved, and the wire marked.
  auto packEdge = [&](LayerId layer, const std::pair<int, int>& uv, const std::vector<std::pair<int, int>>& list, int pass, int round, RealizeStats& st, bool& again,
                      std::vector<char>* changed) {
    const LayerObstacles& ob = obstacles.at(layer);
      const OPt& U = ob.pts[uv.first];
      const OPt& V = ob.pts[uv.second];
      double L = (V.p - U.p).len();
      int n = int(list.size());
      // Stack from u: a[k] = centre-line distance of wire k from u when all inner wires are packed.
      std::vector<double> a(n), bb(n);
      // Own-net obstacles (the wire's pad corners, its vias) are no constraint: the centre line may
      // pass through the point itself, so no radius there at all.
      // Own copper: the wire's net's, and a clasp's of its pair (all three points to the pair's wire, the
      // centre to the single wires of its nets).
      auto own = [&](const OPt& o, const RealWire& w) {
        return (o.net == w.net && w.net != kNoNet) || (o.pair >= 0 && o.pair == w.pair && (w.zip >= 0 || o.claspCentre));
      };
      auto wAt = [&](int k) { return hw[list[k].first][list[k].second]; };
      // The safety margin against tessellation is dropped where the wires fit exactly without it
      // (TopoR lays a wire between two pads at the bare rule distance).
      double margin = kMargin;
      Vec2 dir = L > 0 ? (V.p - U.p) / L : Vec2{};
      double xu = ob.reach(U, dir), xv = ob.reach(V, -dir);
      auto need = [&](const OPt& o, const RealWire& w, double width) {
        if (own(o, w) || o.net == kTransparent) return 0.0;
        double x = &o == &U ? xu : xv;
        return x + clrTo(o, w) + margin + width / 2.0;
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
            double spacing = wAt(k - 1) / 2.0 + clrBetween(wires[pw], w) + margin + wAt(k) / 2.0;
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
            double spacing = wAt(k + 1) / 2.0 + clrBetween(wires[nw], w) + margin + wAt(k) / 2.0;
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
      // The widths of this round: nominal, unless the edge is short of room at the bare rule by more than
      // the limit and narrowing cures it (topo/Capacity.h; the model's capacity decides the same way). The
      // decision comes from the wires' packing alone — not from the bends of the round before — so a wire
      // is as wide as it can be every round and widens back when the room returns.
      std::vector<double> wasW;  // the widths the wires had here (a drawing brought up)
      if (changed) {
        wasW.resize(size_t(n));
        for (int k = 0; k < n; ++k) wasW[size_t(k)] = wAt(k);
      }
      {
        std::vector<double> nominal(n), mins(n), chosen;
        for (int k = 0; k < n; ++k) {
          const RealWire& w = wires[list[k].first];
          nominal[k] = double(w.width);
          mins[k] = double(w.widthMin);
          hw[list[k].first][list[k].second] = nominal[k];
        }
        // What the edge needs at the bare rule: the stack from u up to the last wire, and that wire's own
        // distance from v (as pack() has it: a[n - 1] + bb[n - 1]).
        auto bare = [&](const OPt& o, const RealWire& w, double width) {
          double x = need(o, w, width);
          return x > 0 ? x - margin : 0.0;
        };
        double a0 = 0;
        for (int k = 0; k < n; ++k) {
          const RealWire& w = wires[list[k].first];
          double own = bare(U, w, nominal[k]);
          a0 = k == 0 ? own : std::max(a0 + nominal[k - 1] / 2.0 + clrBetween(wires[list[k - 1].first], w) + nominal[k] / 2.0, own);
        }
        const double deficit = a0 + bare(V, wires[list[n - 1].first], nominal[n - 1]) - L;
        if (deficit > kNarrowDeficitLimit && chooseNarrowing(nominal, mins, deficit, chosen))
          for (int k = 0; k < n; ++k) hw[list[k].first][list[k].second] = chosen[k];
      }
      if (pass == 0) {
        shareOfAll = 0;
        const double s0 = pack();
        const std::vector<double> a0 = a, b0 = bb;
        shareOfAll = 1;
        const double s1 = pack();
        shareOfAll = -1;
        const double share = s1 >= kNominalRoom ? 1.0 : s0 <= kNominalRoom ? 0.0 : (s0 - kNominalRoom) / (s0 - s1);
        std::vector<double>& of = nominalShare[layer];
        auto least = [&](int pt, double x) { of[size_t(pt)] = std::min(of[size_t(pt)], std::clamp(x, 0.0, 1.0)); };
        least(uv.first, share);
        least(uv.second, share);
        // How far the stacks at the two ends reach, at the minimum and at the nominal (for the walls below).
        std::vector<std::array<double, 2>>& reach = stackReach[layer];
        auto further = [&](int pt, double r0, double r1) {
          reach[size_t(pt)][0] = std::max(reach[size_t(pt)][0], r0);
          reach[size_t(pt)][1] = std::max(reach[size_t(pt)][1], r1);
        };
        further(uv.first, a0[n - 1] + wAt(n - 1) / 2.0, a[n - 1] + wAt(n - 1) / 2.0);
        further(uv.second, b0[0] + wAt(0) / 2.0, bb[0] + wAt(0) / 2.0);
        // A wire that ends next to the obstacle (its own pin beside the neighbouring one): the bend round the
        // obstacle may not grow up to the wire's end — the tangent from the end would have nowhere to go.
        for (int k = 0; k < n; ++k) {
          const auto [wi, hi] = list[k];
          const Polyline& sk = sketches[wi];
          if (sk.size() < 2) continue;
          for (int end = 0; end < 2; ++end) {
            if (hi != (end == 0 ? 0 : int(hits[wi].size()) - 1)) continue;
            const Vec2 at = end == 0 ? sk.front() : sk.back();
            auto limit = [&](int pt, double r0, double r1, Vec2 centre) {
              if (r1 <= r0 + 1) return;
              least(pt, ((at - centre).len() - kNominalEndRoom - r0) / (r1 - r0));
            };
            limit(uv.first, a0[k], a[k], U.p);
            limit(uv.second, b0[k], bb[k], V.p);
          }
        }
        return;
      }
      double slack = pack();
      if (slack < 0 && nominal) {
        std::vector<double>& of = nominalShare[layer];
        if (of[size_t(uv.first)] > 0 || of[size_t(uv.second)] > 0) {
          of[size_t(uv.first)] = of[size_t(uv.second)] = 0;
          d.tookBack[layer].insert(uv);
          again = true;
          slack = pack();
        }
      }
      if (slack < 0 && slack > -2.0 * kMargin * (n + 1)) {
        margin = 0;
        slack = pack();
      }
      if (slack < 0) {
        if (round == 0) ++st.overflowEdges;
        if (round == 0 && kOvf) {
          std::print(stderr, "ovf L{:.3f} need{:.3f} U({:.3f},{:.3f} r{:.2f} net{}) V({:.3f},{:.3f} r{:.2f} net{}) wires:", L / 1e6,
                     (a[n - 1] + bb[n - 1]) / 1e6, U.p.x / 1e6, -U.p.y / 1e6, U.r / 1e6, U.net, V.p.x / 1e6, -V.p.y / 1e6, V.r / 1e6, V.net);
          for (int k = 0; k < n; ++k) std::print(stderr, " {}/w{:.2f}", wires[list[k].first].net, wAt(k) / 1e6);
          std::println(stderr, "");
        }
      }
      for (int k = 0; k < n; ++k) {
        EdgeRoom sl;
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
          return wAt(j) / 2.0 + clrBetween(wires[list[j].first], w) + margin + wAt(k) / 2.0;
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
        EdgeRoom& kept = slots[list[k].first][list[k].second];
        if (!changed) {
          kept = sl;
        } else if (wasW[size_t(k)] != wAt(k) || roomsDiffer(kept, sl)) {
          kept = sl;
          (*changed)[size_t(list[k].first)] = 1;
        }
      }
  };
  // What a layer's wires share while they are laid: the boxes of their sketches (below).
  struct LayerCtx {
    const std::vector<int>* wires = nullptr;
    std::vector<float> x0, x1, y0, y1;
    std::vector<unsigned char> hit;
    Vec2 org;
  };
  // True: the wire's radii round its obstacles grew.
  auto layWire = [&](int wi, int round, RealizeStats& st, LayerCtx& lc) -> bool {
  // The boxes of the sketches of the layer's wires as flat arrays of floats (about the first box's corner, rounded
  // outwards): a wire finds the wires whose sketches come near by one pass of four comparisons a wire, and asks the
  // exact boxes of the few left (the exact boxes of all of them, for every wire of every round, were the hottest
  // lines of F7 under perf once the bends were sifted so).
  // (The sketches stand through the rounds of a drawing: a wire's list is made in the first of them, and the
  // arrays for it then.)
  const std::vector<int>& layerWires = *lc.wires;
  const size_t nLayer = layerWires.size();
  std::vector<float>&boxX0 = lc.x0, &boxX1 = lc.x1, &boxY0 = lc.y0, &boxY1 = lc.y1;
  std::vector<unsigned char>& boxHit = lc.hit;
  Vec2& boxOrg = lc.org;
  constexpr float kBoxSlack = 64;  // nm: more than a float's rounding at the size of a board
  auto boxesOfLayer = [&] {
    if (!boxHit.empty() || nLayer == 0) return;
    boxX0.resize(nLayer), boxX1.resize(nLayer), boxY0.resize(nLayer), boxY1.resize(nLayer), boxHit.resize(nLayer);
    for (int wj : layerWires)
      if (sketchBox[wj].valid()) {
        boxOrg = {sketchBox[wj].minX, sketchBox[wj].minY};
        break;
      }
    for (size_t i = 0; i < nLayer; ++i) {
      const BBox& sb = sketchBox[layerWires[i]];
      boxX0[i] = float(sb.minX - boxOrg.x) - kBoxSlack;
      boxX1[i] = float(sb.maxX - boxOrg.x) + kBoxSlack;
      boxY0[i] = float(sb.minY - boxOrg.y) - kBoxSlack;
      boxY1[i] = float(sb.maxY - boxOrg.y) + kBoxSlack;
    }
  };
  bool radiiChanged = false;
    const RealWire& w = wires[wi];
    const LayerObstacles& ob = obstacles.at(w.layer);
    const Polyline& sk = sketches[wi];
    bendsOf[wi].clear();
    if (sk.size() < 2) return false;
    std::vector<std::pair<Vec2, Vec2>> portals;
    portals.push_back({sk.front(), sk.front()});
    for (int k = 0; k < int(hits[wi].size()); ++k) {
      const EdgeHit& h = hits[wi][k];
      const EdgeRoom& sl = slots[wi][k];
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
    if (kDebug7 && *kDebug7 == wi) {
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
    // The ends are of the nominal width: a wire is narrowed between the bends at the tight edge only, its
    // run out of the pad and into it stays whole.
    std::vector<Bend> cs;
    cs.push_back({sk.front(), 0, -1, 0, double(w.width)});
    // The pad a wire is led out of by the pattern is its own copper all over: which side of the pad's
    // corner the sketch went is of no account, and the wire is not bent at that corner (a drawing that
    // left through the long side would hang on the corner for one pass).
    auto ownPad = [&](int o) {
      const OPt& op = ob.pts[o];
      if (op.net != w.net || w.net == kNoNet) return false;
      for (const Stub& s : stubs[wi])
        if (s.on && !s.guard && s.pad >= 0 && b.pads[s.pad].shapeGeom().distance(op.p) <= kPadEdgeTol) return true;
      return false;
    };
    for (const FunnelApex& ap : apexes) {
      const EdgeHit& h = hits[wi][ap.portal - 1];
      const EdgeRoom& sl = slots[wi][ap.portal - 1];
      bool atU = (ap.side > 0) == h.uLeft;  // the apex endpoint lies on u's side of the slot
      int o = atU ? h.u : h.v;
      if (ownPad(o)) continue;
      double R = atU ? sl.ru : sl.rv;
      Vec2 c = atU ? sl.cu : sl.cv;
      double width = hw[wi][ap.portal - 1];
      if (auto it = ob.cornersOf.find(o); it != ob.cornersOf.end() && (c - ob.pts[o].p).len2() < 1 && !kNoCorner) {
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
          double surplus = std::max(0.0, R - ((atU ? sl.xu : sl.xv) + clrTo(ob.pts[o], w) + kMargin + width / 2.0));
          o = best;
          c = cp.p;
          R = cp.r + clrTo(cp, w) + kMargin + width / 2.0 + surplus;
        }
      }
      if (!cs.empty() && cs.back().obst == o && (cs.back().c - c).len2() < 1 && (cs.back().rho > 0) == (ap.side > 0)) {
        cs.back().rho = ap.side * std::max(std::abs(cs.back().rho), R);
        cs.back().width = std::min(cs.back().width, width);
      } else {
        cs.push_back({c, ap.side * R, o, ap.portal, width});
      }
    }
    cs.push_back({sk.back(), 0, -1, int(portals.size()) - 1, double(w.width)});
    if (kDebug2) {
      std::print(stderr, "wire {} net {} sketch {} hits {} bends:", wi, b.nets[w.net].name, sk.size(), hits[wi].size());
      if (kDebug2Sk) {
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
      std::vector<int>& near = nearSketches[size_t(wi)];
      if (!nearMade[size_t(wi)]) {
        nearMade[size_t(wi)] = 1;
        boxesOfLayer();
        const float x0 = float(mine.minX - boxOrg.x) - kBoxSlack, x1 = float(mine.maxX - boxOrg.x) + kBoxSlack;
        const float y0 = float(mine.minY - boxOrg.y) - kBoxSlack, y1 = float(mine.maxY - boxOrg.y) + kBoxSlack;
        const float *bx0 = boxX0.data(), *bx1 = boxX1.data(), *by0 = boxY0.data(), *by1 = boxY1.data();
        unsigned char* hit = boxHit.data();
        for (size_t i = 0; i < nLayer; ++i) hit[i] = (bx1[i] >= x0) & (bx0[i] <= x1) & (by1[i] >= y0) & (by0[i] <= y1);
        for (size_t i = 0; i < nLayer; ++i) {
          if (!boxHit[i]) continue;
          const int wj = layerWires[i];
          if (wj != wi && wires[wj].net != w.net && mine.intersects(sketchBox[wj])) near.push_back(wj);
        }
      }
      for (int wj : near)
        if (!bendsOf[wj].empty()) nearWires.push_back(wj);
    }
    // Their bends, in the order they are tried in, each with the box its arc at the widest spacing from this wire
    // reaches — as four flat arrays of floats about the sketch's first point, rounded outwards. A chord sifts them
    // by its own box in one pass of four comparisons a bend (the compiler makes it a vector loop) and measures the
    // few left; every chord of every iteration measured its distance to every bend of every near wire before, a
    // fifth of F7's instructions. (The other wires' bends stand while this wire is laid.)
    struct NearArc {
      int wire, bend;
    };
    std::vector<NearArc> arcs;
    std::vector<float> arcX0, arcX1, arcY0, arcY1;
    std::vector<unsigned char> arcHit;
    const Vec2 arcOrg = sk.front();
    constexpr float kFloatSlack = 64;  // nm: more than a float's rounding at the size of a board
    double widest = double(w.width);     // (a chord is as wide as the narrower of its two bends)
    for (const Bend& c : cs) widest = std::max(widest, c.width);
    for (int wj : nearWires) {
      const auto& ocs = bendsOf[wj];
      const double between = clrBetween(w, wires[wj]);
      for (size_t m = 1; m + 1 < ocs.size(); ++m) {
        if (ocs[m].obst < 0) continue;
        const double far = std::abs(ocs[m].rho) + widest / 2.0 + between + kMargin + ocs[m].width / 2.0;
        arcs.push_back({wj, int(m)});
        arcX0.push_back(float(ocs[m].c.x - far - arcOrg.x) - kFloatSlack);
        arcX1.push_back(float(ocs[m].c.x + far - arcOrg.x) + kFloatSlack);
        arcY0.push_back(float(ocs[m].c.y - far - arcOrg.y) - kFloatSlack);
        arcY1.push_back(float(ocs[m].c.y + far - arcOrg.y) + kFloatSlack);
      }
    }
    arcHit.resize(arcs.size());
    for (int iter = 0; iter < 400; ++iter) {
      size_t n = cs.size();
      // A bend round a point of a wall whose circle lies within the bend round the wall as a whole (a hole, a
      // round keepout, a rounded corner: one obstacle at the centre) is no bend: one arc, not a chord for every
      // point of the rim. Walls only: a pad's bend radius is the stack's on one edge and says nothing of the
      // other side of the pad (so dropped, a bend of CPUCLK on MinVia let it through A1).
      {
        auto wallPoint = [&](const Bend& x) { return x.obst >= 0 && ob.pts[x.obst].net == kBoardEdge && ob.pts[x.obst].r <= 0; };
        auto roundWall = [&](const Bend& x) { return x.obst >= 0 && ob.pts[x.obst].net == kBoardEdge && ob.pts[x.obst].r > 0; };
        int inner = -1;
        for (size_t k = 1; k + 1 < n && inner < 0; ++k) {
          if (!wallPoint(cs[k])) continue;
          for (size_t j = 0; j < n && inner < 0; ++j)
            if (j != k && roundWall(cs[j]) && cs[j].rho * cs[k].rho > 0 && std::abs(cs[j].rho) > std::abs(cs[k].rho) &&
                (cs[j].c - cs[k].c).len() + std::abs(cs[k].rho) <= std::abs(cs[j].rho) + 2000)
              inner = int(k);
        }
        if (inner >= 0) {
          dropped.insert(cs[inner].obst);
          cs.erase(cs.begin() + inner);
          continue;
        }
      }
      ti.assign(n, {});
      to.assign(n, {});
      int bad = -1;
      for (size_t k = 0; k + 1 < n && bad < 0; ++k)
        if (!tangent(cs[k], cs[k + 1], to[k], ti[k + 1])) {
          if (k > 0 && k + 1 < n - 1 && cs[k].rho * cs[k + 1].rho < 0) {
            double D = (cs[k + 1].c - cs[k].c).len();
            double deficit = std::abs(cs[k].rho) + std::abs(cs[k + 1].rho) - D;
            // Two bends of opposite sense whose circles overlap: both shrink until they touch, the wire
            // passes between the two obstacles tightly. Any overlap, not hairlines only: a stack short of room
            // (the wires widened past what the layout has, 8 overflowed edges on MinVia_standard_routing at
            // 0.4 mm) is a clearance violation TopoR draws as such, and the bend dropped instead sent the
            // wire through the pad or round the next one (D6, 276 degrees round the pad of A3).
            if (deficit > 0 && shrinks < 16) {
              double f = (D - 1000) / (std::abs(cs[k].rho) + std::abs(cs[k + 1].rho));
              cs[k].rho *= f;
              cs[k + 1].rho *= f;
              ++shrinks;
              bad = -2;
              break;
            }
          }
          if (k == 0 || k + 1 == n - 1) {
            Bend& c = cs[k == 0 ? 1 : k];
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
        if (kDebug4) {
          auto joined = [&](int o1, int o2) {
            return o1 >= 0 && o2 >= 0 && cdtEdges[w.layer].contains({std::min(o1, o2), std::max(o1, o2)});
          };
          auto gap = [&](const Bend& x, const Bend& y) { return ((x.c - y.c).len() - std::abs(x.rho) - std::abs(y.rho)) / 1e6; };
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
      Bend ins;
      for (size_t k = 0; k + 1 < n; ++k) {
        Vec2 p = k == 0 ? cs[0].c : to[k];
        Vec2 q = k + 1 == n - 1 ? cs[n - 1].c : ti[k + 1];
        if ((q - p).len2() < 1) continue;
        for (int hi = cs[k].portal; hi < cs[k + 1].portal; ++hi) {
          if (hi < 1 || hi > int(hits[wi].size())) continue;
          const EdgeHit& h = hits[wi][hi - 1];
          const EdgeRoom& sl = slots[wi][hi - 1];
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
                r::any_of(cs, [&](const Bend& x) { return x.obst == o && (x.c - c).len2() < 1; }))
              continue;
            double t = (c - p).dot(q - p) / (q - p).len2();
            if (t <= 0 || t >= 1) continue;
            double pen = R - distPointSegment(c, p, q);
            // Sides incident to the obstacle point (pad edges, outline, stub wires) with their own radius.
            if ((c - ob.pts[o].p).len2() < 1) {
              double extra = R - x;  // clearance + half width + margin + nesting
              for (const Side& sd : ob.adj[o]) {
                const Vec2 far = ob.pts[sd.to].p;
                const double dd = distSegmentSegment(p, q, c, far);
                if (sd.r + extra - dd <= pen) continue;
                // The side is this point's only where the chord comes near its half: a chord that leaves
                // the bend round the side's other end (narrowed there, so nearer the side than this end's
                // rule) is that end's, and a bend round this end would be made from the wrong side (D0 of
                // MinVia_standard_routing at 0.4 mm, 277 degrees round the far corner of the pad of J4-1).
                if (!segmentsIntersect(p, q, c, far)) {
                  double best = std::numeric_limits<double>::max();
                  Vec2 on = c;
                  for (Vec2 e : {p, q})
                    if (const Vec2 f = closestPointOnSegment(e, c, far); (f - e).len2() < best) best = (f - e).len2(), on = f;
                  for (Vec2 e : {c, far})
                    if (const Vec2 f = closestPointOnSegment(e, p, q); (f - e).len2() < best) best = (f - e).len2(), on = e;
                  if ((on - far).len2() < (on - c).len2()) continue;
                }
                pen = sd.r + extra - dd;
              }
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
          {
            const float x0 = float(std::min(p.x, q.x) - arcOrg.x) - kFloatSlack, x1 = float(std::max(p.x, q.x) - arcOrg.x) + kFloatSlack;
            const float y0 = float(std::min(p.y, q.y) - arcOrg.y) - kFloatSlack, y1 = float(std::max(p.y, q.y) - arcOrg.y) + kFloatSlack;
            const size_t na = arcs.size();
            const float *ax0 = arcX0.data(), *ax1 = arcX1.data(), *ay0 = arcY0.data(), *ay1 = arcY1.data();
            unsigned char* hit = arcHit.data();
            for (size_t i = 0; i < na; ++i) hit[i] = (ax1[i] >= x0) & (ax0[i] <= x1) & (ay1[i] >= y0) & (ay0[i] <= y1);
          }
          for (size_t an = 0; an < arcs.size(); ++an) {
            if (!arcHit[an]) continue;
            const int wj = arcs[an].wire;
            const size_t m = size_t(arcs[an].bend);
            const RealWire& o = wires[wj];
            const auto& ocs = bendsOf[wj];
            {
              const Bend& oc = ocs[m];
              // The wire's own end (the other wire bends round this wire's pad, and the way into the pad
              // crosses that arc) is no obstacle to bend round: a bend about the point the wire ends at
              // is a loop, and the tangents past it come in from the wrong side (MinVia_standard_routing
              // with the wires widened to 0.4 mm: A3 went 286 degrees round the pad of A2).
              if ((oc.c - cs.front().c).len2() < 1 || (oc.c - cs.back().c).len2() < 1) continue;
              double R = std::abs(oc.rho);
              double spacing = width / 2.0 + clrBetween(w, o) + kMargin + oc.width / 2.0;
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
                if (radial >= 0 && radial < R) {
                  radius = R - spacing;
                  // ... and never nearer the obstacle than this wire's own rule: inside the other wire's arc
                  // there may be no room (D0 of MinVia_standard_routing at 0.4 mm, put 0.46 from the corner of
                  // the pad of J4-1, inside its copper, and 277 degrees round it). Then the chord stays as it
                  // is, a conflict the DRC reports.
                  const OPt& op = ob.pts[size_t(oc.obst)];
                  const double own = (op.net == w.net && w.net != kNoNet) || op.net == kTransparent
                                         ? 0.0
                                         : ob.reach(op, (X - op.p).normalized()) + clrTo(op, w) + kMargin + width / 2.0;
                  if (radius < own - 1000) continue;
                }
                if (radius <= 0) continue;
              } else if (!onArc(X, 0.05)) {
                continue;  // the closest point must face the arc itself, not the rest of the circle
              }
              if (dropped.contains(oc.obst) || r::contains(cs, oc.obst, &Bend::obst)) continue;
              at = int(k) + 1;
              ins = {oc.c, (orient(p, q, oc.c) > 0 ? 1 : -1) * radius, oc.obst, cs[k].portal, width};
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
          // The first of the points near, by their numbers, that the chord comes too near: the points are handed
          // over in no order, and the least number that passes is kept (they were listed, sorted and tried in turn
          // till the first passed: the listing and the sorting were a twentieth of F7).
          int first = std::numeric_limits<int>::max();
          ob.eachAround(bb, [&](int o) {
            if (o >= first) return;
            const OPt& op = ob.pts[o];
            if (op.net == kTransparent || (op.net == w.net && w.net != kNoNet)) return;
            // (A large round obstacle, a hole in the board, reaches the chord from far outside the box.)
            if (!bb.contains(op.p) && (op.r < 3 * kNmPerMm || distPointSegment(op.p, p, q) > op.r + 3 * kNmPerMm + w.width)) return;
            if (op.r <= 0 && op.shape < 0) return;  // a bare point (outline, keepout) has sides handled elsewhere
            if (dropped.contains(o) || r::contains(cs, o, &Bend::obst)) return;
            Vec2 on = closestPointOnSegment(op.p, p, q);
            double t = (on - p).dot(q - p) / (q - p).len2();
            if (t <= 0 || t >= 1) return;
            // At the rule's minimum: a guard bend knows no stack (two wires that run into one via's nominal
            // room would both be bent round it at one radius — arz_4L, nets 59 and 69, seven shorts).
            shareOfAll = 0;
            double R = ob.reach(op, (on - op.p).normalized()) + clrTo(op, w) + kMargin + width / 2.0;
            shareOfAll = -1;
            if ((on - op.p).len() < R - 1000) {
              first = o;
              ins = {op.p, (orient(p, q, op.p) > 0 ? 1 : -1) * R, o, cs[k].portal, width};
            }
          });
          if (first != std::numeric_limits<int>::max()) at = int(k) + 1;
        }
        if (at >= 0) ++st.guardBends;
      }
      if (at < 0) break;
      cs.insert(cs.begin() + at, ins);
    }
    if (kDebug2) {
      std::print(stderr, "  final {}:", wi);
      for (size_t k = 0; k < cs.size(); ++k)
        std::print(stderr, " [o{} rho{:+.3f} in({:.3f},{:.3f}) out({:.3f},{:.3f})]", cs[k].obst, cs[k].rho / 1e6,
                   ti[k].x / 1e6, ti[k].y / 1e6, to[k].x / 1e6, to[k].y / 1e6);
      std::println(stderr, "");
    }
    for (const Bend& c : cs) {
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
    return radiiChanged;
  };
  // A whole drawing: rounds over every edge and every wire.
  auto drawAll = [&] {
    int restarts = 0;
    for (int round = 0; round < 6; ++round) {
      std::vector<char> againOf(NL, 0), radiiOf(NL, 0);
      inLayers([&](LayerId L, RealizeStats& st) {
        shareOfAll = -1;
        bool again = false;  // an edge took its ends' shares of the nominal clearance back
        for (int pass = nominal && round == 0 ? 0 : 1; pass < 2; ++pass) {  // 0: the obstacles' shares of the nominal clearance
          if (pass == 1 && nominal && round == 0) finishShares(L);
          for (auto& [uv, list] : edgeLists[L]) packEdge(L, uv, list, pass, round, st, again, nullptr);
        }
        againOf[size_t(&st - per.data())] = again;
      });
      const bool again = r::any_of(againOf, [](char c) { return c != 0; });
      if (again && restarts < 4) {
        ++restarts;
        for (int wi = 0; wi < NW; ++wi) bendR[wi].assign(hits[wi].size(), {-1.0, -1.0});
        round = -1;
        continue;
      }
      // Taut path of every wire inside its slots: funnel over the slot segments, apexes become bends
      // around the edge end obstacles with the slot radius, consecutive bends around one obstacle merge.
      inLayers([&](LayerId L, RealizeStats& st) {
        shareOfAll = -1;
        LayerCtx lc{&byLayer.at(L), {}, {}, {}, {}, {}, {}};
        bool radiiChanged = false;
        for (int wi : byLayer.at(L)) radiiChanged |= layWire(wi, round, st, lc);
        radiiOf[size_t(&st - per.data())] = radiiChanged;
      });
      if (r::none_of(radiiOf, [](char c) { return c != 0; })) break;
      for (RealizeStats& ls : per) ls.droppedApexes = 0;
    }
  };

  // A drawing brought up from an earlier one of nearly the same input (a via moved, a few edges flipped): the edges
  // whose ends, wires or shares changed are packed again, the wires whose rooms moved are laid again, and what their
  // new bends change — the stacks on their edges, the chords of the wires near their arcs — goes round again, until
  // nothing moves by more than kUpdateTol. Everything else is the earlier drawing's. A wire laid again has the radii
  // of that laying alone (through the rounds of a whole drawing they only grow; here they may have to shrink, and a
  // stack of n wires that shrinks comes to rest wire by wire, in n rounds).
  // False: not this way — another set of wires or of obstacles, most of the board changed, an edge that takes its
  // ends' shares back (the whole drawing begins again on that), no rest within the rounds.
  auto drawChanged = [&](const DrawnBefore& was) -> bool {
    auto whole = [&](const char* why) {
      d.made.whole = why;
      return false;
    };
    if (int(was.wires.size()) != NW || int(was.in.hits.size()) != NW || int(was.d.bends.size()) != NW || int(was.in.sketches.size()) != NW)
      return whole("another set of wires");
    // What of the input changed: the obstacle points, the wires' own crossings.
    std::vector<std::vector<char>> ptChanged(NL), shareChanged(NL);
    for (size_t li = 0; li < NL; ++li) {
      const LayerId L = layersDrawn[li];
      const auto found = was.in.obstacles.find(L);
      if (found == was.in.obstacles.end()) return whole("another set of layers");
      const LayerObstacles& now = obstacles.at(L);
      const LayerObstacles& old = found->second;
      if (now.pts.size() != old.pts.size() || now.shapes.size() != old.shapes.size() || now.cornersOf != old.cornersOf) return whole("another set of obstacles");
      ptChanged[li].assign(now.pts.size(), 0);
      shareChanged[li].assign(now.pts.size(), 0);
      for (size_t i = 0; i < now.pts.size(); ++i) {
        const OPt& x = now.pts[i];
        const OPt& y = old.pts[i];
        bool same = x.p == y.p && x.r == y.r && x.clr == y.clr && x.net == y.net && x.shape == y.shape && x.owner == y.owner && x.pair == y.pair &&
                    x.claspCentre == y.claspCentre && x.round == y.round && now.adj[i].size() == old.adj[i].size();
        for (size_t k = 0; same && k < now.adj[i].size(); ++k) same = now.adj[i][k].to == old.adj[i][k].to && now.adj[i][k].r == old.adj[i][k].r;
        ptChanged[li][i] = !same;
      }
    }
    std::vector<char> fresh(size_t(NW), 0);  // a wire of other crossings or ends: nothing of its earlier drawing holds
    int nFresh = 0;
    for (int wi = 0; wi < NW; ++wi) {
      const RealWire& x = wires[wi];
      const RealWire& y = was.wires[wi];
      const Polyline& sx = sketches[wi];
      const Polyline& sy = was.in.sketches[wi];
      bool same = x.net == y.net && x.layer == y.layer && x.width == y.width && x.widthMin == y.widthMin && x.clearance == y.clearance && x.zip == y.zip &&
                  x.pair == y.pair && x.condWidth == y.condWidth && x.netN == y.netN && x.pSide == y.pSide && hits[wi].size() == was.in.hits[wi].size() &&
                  (sx.size() < 2) == (sy.size() < 2) && (sx.empty() || (sx.front() == sy.front() && sx.back() == sy.back())) &&
                  was.d.rooms[wi].size() == hits[wi].size();
      for (size_t k = 0; same && k < hits[wi].size(); ++k) {
        const EdgeHit& h = hits[wi][k];
        const EdgeHit& g = was.in.hits[wi][k];
        same = h.u == g.u && h.v == g.v && h.uLeft == g.uLeft && h.pin == g.pin;
      }
      for (int end = 0; same && end < 2; ++end) {
        const Stub& s = stubs[wi][end];
        const Stub& o = was.in.stubs[wi][end];
        same = s.on == o.on && (!s.on || (s.from == o.from && s.mid == o.mid && s.to == o.to && s.free == o.free && s.guard == o.guard && s.pad == o.pad));
      }
      fresh[wi] = !same;
      nFresh += !same;
    }
    if (nFresh * 3 > NW) return whole("most wires changed");
    auto clean = [&](size_t li, const std::pair<int, int>& uv, const std::vector<std::pair<int, int>>& list) {  // an edge as it was
      if (ptChanged[li][size_t(uv.first)] || ptChanged[li][size_t(uv.second)]) return false;
      const auto layer = was.in.edgeLists.find(layersDrawn[li]);
      if (layer == was.in.edgeLists.end()) return false;
      const auto it = layer->second.find(uv);
      if (it == layer->second.end() || it->second != list) return false;
      return r::none_of(list, [&](const std::pair<int, int>& wh) { return fresh[size_t(wh.first)] != 0; });
    };
    // The shares of the nominal clearance: of the input alone (the first round's packing, no bend yet), so found
    // for the whole board as a whole drawing finds them; then the shares the edges standing as they were had taken
    // back, and the packing once more, as the rounds begin again after one.
    if (nominal) {
      auto shares = [&] {
        inLayers([&](LayerId L, RealizeStats& st) {
          shareOfAll = -1;
          bool again = false;
          for (auto& [uv, list] : edgeLists[L]) packEdge(L, uv, list, 0, 0, st, again, nullptr);
          finishShares(L);
        });
      };
      shares();
      bool carried = false;
      for (size_t li = 0; li < NL; ++li) {
        const LayerId L = layersDrawn[li];
        const auto took = was.d.tookBack.find(L);
        if (took == was.d.tookBack.end()) continue;
        for (const std::pair<int, int>& uv : took->second) {
          const auto it = edgeLists[L].find(uv);
          if (it == edgeLists[L].end() || !clean(li, uv, it->second)) continue;
          nominalShare[L][size_t(uv.first)] = nominalShare[L][size_t(uv.second)] = 0;
          d.tookBack[L].insert(uv);
          carried = true;
        }
      }
      if (carried) shares();
      for (size_t li = 0; li < NL; ++li) {
        const LayerId L = layersDrawn[li];
        const auto old = was.d.share.find(L);
        const std::vector<double>& now = nominalShare[L];
        if (old == was.d.share.end() || old->second.size() != now.size()) return whole("no shares kept");
        for (size_t i = 0; i < now.size(); ++i) shareChanged[li][i] = std::abs(now[i] - old->second[i]) > 1e-9;
      }
    }
    // The earlier drawing of every wire that stands.
    for (int wi = 0; wi < NW; ++wi) {
      if (fresh[wi]) {
        hw[wi].assign(hits[wi].size(), double(wires[wi].width));
        continue;
      }
      slots[wi] = was.d.rooms[wi];
      hw[wi] = was.d.width[wi];
      actual[wi] = was.d.actual[wi];
      bendR[wi] = was.d.bendR[wi];
      bendsOf[wi] = was.d.bends[wi];
      tinOf[wi] = was.d.tin[wi];
      toutOf[wi] = was.d.tout[wi];
    }
    // Where to begin.
    std::vector<std::set<std::pair<int, int>>> dirtyE(NL);
    std::vector<char> dirtyW(size_t(NW), 0);
    int seeds = 0;
    for (size_t li = 0; li < NL; ++li) {
      const LayerId L = layersDrawn[li];
      const LayerObstacles& ob = obstacles.at(L);
      const LayerObstacles& old = was.in.obstacles.at(L);
      for (const auto& [uv, list] : edgeLists[L]) {
        const bool moved = ptChanged[li][size_t(uv.first)] || ptChanged[li][size_t(uv.second)];
        if (moved || shareChanged[li][size_t(uv.first)] || shareChanged[li][size_t(uv.second)] || !clean(li, uv, list)) dirtyE[li].insert(uv);
        if (moved)
          for (const auto& [wi, hi] : list) dirtyW[size_t(wi)] = 1;  // (the same room along an edge that lies elsewhere)
      }
      std::vector<int> movedPts;
      for (size_t i = 0; i < ob.pts.size(); ++i)
        if (ptChanged[li][i]) movedPts.push_back(int(i));
      for (int wi : byLayer.at(L)) {
        if (fresh[wi]) dirtyW[size_t(wi)] = 1;
        if (dirtyW[size_t(wi)] || movedPts.empty()) continue;
        // A bend round a point that changed (round one that is the end of none of the wire's edges too: a guard
        // bend), a chord that passes a changed point within its rule (where a guard bend would be made).
        const std::vector<Bend>& cs = bendsOf[wi];
        const size_t n = cs.size();
        if (n < 2) continue;
        const RealWire& w = wires[wi];
        bool hit = r::any_of(cs, [&](const Bend& c) { return c.obst >= 0 && ptChanged[li][size_t(c.obst)]; });
        BBox path;
        for (size_t k = 0; k < n && !hit; ++k) {
          path.add(cs[k].c);
          path.add(tinOf[wi][k]);
          path.add(toutOf[wi][k]);
        }
        for (size_t m = 0; m < movedPts.size() && !hit; ++m)
          for (const OPt* op : {&ob.pts[size_t(movedPts[m])], &old.pts[size_t(movedPts[m])]}) {
            if (op->net == kTransparent || (op->net == w.net && w.net != kNoNet) || (op->r <= 0 && op->shape < 0)) continue;
            shareOfAll = 0;
            const double R = (op->shape < 0 ? op->r : 3 * kNmPerMm) + clrTo(*op, w) + kMargin + double(w.width) / 2.0;
            shareOfAll = -1;
            if (!path.inflated(R).contains(op->p)) continue;
            for (size_t k = 0; k + 1 < n && !hit; ++k) {
              const Vec2 p = k == 0 ? cs[0].c : toutOf[wi][k], q = k + 1 == n - 1 ? cs[n - 1].c : tinOf[wi][k + 1];
              hit = distPointSegment(op->p, p, q) < R;
            }
          }
        if (hit) dirtyW[size_t(wi)] = 1;
      }
      for (int wi : byLayer.at(L)) seeds += dirtyW[size_t(wi)];
    }
    if (seeds * 2 > NW) return whole("most wires changed");
    // The rounds.
    std::vector<char> laid(size_t(NW), 0);  // laid again in this update (its radii begun anew)
    std::vector<char> failed(NL, 0), active(NL, 0);
    std::vector<int> packedOf(NL, 0), laidOf(NL, 0);
    bool rest = false;
    for (int round = 0; round < kUpdateRounds && !rest; ++round) {
      inLayers([&](LayerId L, RealizeStats& st) {
        const size_t li = size_t(&st - per.data());
        active[li] = 0;
        if (failed[li]) return;
        shareOfAll = -1;
        bool again = false;
        const LayerObstacles& ob = obstacles.at(L);
        std::set<std::pair<int, int>> edges;
        edges.swap(dirtyE[li]);
        for (const std::pair<int, int>& uv : edges)
          if (const auto it = edgeLists[L].find(uv); it != edgeLists[L].end()) {
            packEdge(L, uv, it->second, 1, 1, st, again, &dirtyW);
            ++packedOf[li];
          }
        if (again) {
          failed[li] = 1;
          return;
        }
        LayerCtx lc{&byLayer.at(L), {}, {}, {}, {}, {}, {}};
        for (int wi : byLayer.at(L)) {
          if (!dirtyW[size_t(wi)]) continue;
          dirtyW[size_t(wi)] = 0;
          ++laidOf[li];
          const RealWire& w = wires[wi];
          // What it was: against the earlier drawing for a wire begun anew, against what stands for the rest.
          const bool anew = fresh[wi] && !laid[size_t(wi)];
          const std::vector<Bend> wasBends = anew ? was.d.bends[wi] : bendsOf[wi];
          const std::vector<Vec2> wasIn = anew ? was.d.tin[wi] : tinOf[wi], wasOut = anew ? was.d.tout[wi] : toutOf[wi];
          const std::vector<std::array<double, 2>> wasR = bendR[wi];
          // Its radii anew every time: laid before the stack under it came to rest, it would keep that round's.
          laid[size_t(wi)] = 1;
          bendR[wi].assign(hits[wi].size(), {-1.0, -1.0});
          layWire(wi, 1, st, lc);
          // The radii: one that moved sends its edge round again; one that did not stays the number it was.
          for (size_t k = 0; k < hits[wi].size(); ++k)
            for (size_t end = 0; end < 2; ++end) {
              if (std::abs(bendR[wi][k][end] - wasR[k][end]) > kUpdateTol) dirtyE[li].insert({hits[wi][k].u, hits[wi][k].v});
              else bendR[wi][k][end] = wasR[k][end];
            }
          // The bends: the same within the tolerance, they stay the numbers they were (a wire not fresh); else the
          // wires near whose chords pass a bend that changed, or that bend round the same obstacle, are laid again.
          const std::vector<Bend>& cs = bendsOf[wi];
          auto among = [](const Bend& c, Vec2 ci, Vec2 co, const std::vector<Bend>& of, const std::vector<Vec2>& in, const std::vector<Vec2>& out) {
            for (size_t k = 0; k < of.size(); ++k)
              if (!bendsDiffer(c, ci, co, of[k], in[k], out[k])) return true;
            return false;
          };
          std::vector<std::pair<Bend, bool>> moved;  // (a bend, of the new drawing)
          for (size_t k = 1; k + 1 < wasBends.size(); ++k)
            if (wasBends[k].obst >= 0 && !among(wasBends[k], wasIn[k], wasOut[k], cs, tinOf[wi], toutOf[wi])) moved.push_back({wasBends[k], false});
          for (size_t k = 1; k + 1 < cs.size(); ++k)
            if (cs[k].obst >= 0 && !among(cs[k], tinOf[wi][k], toutOf[wi][k], wasBends, wasIn, wasOut)) moved.push_back({cs[k], true});
          bool same = moved.empty() && cs.size() == wasBends.size();
          for (size_t k = 0; same && k < cs.size(); ++k) same = !bendsDiffer(cs[k], tinOf[wi][k], toutOf[wi][k], wasBends[k], wasIn[k], wasOut[k]);
          if (same) {
            if (!anew) {
              bendsOf[wi] = wasBends;
              tinOf[wi] = wasIn;
              toutOf[wi] = wasOut;
            }
            continue;
          }
          for (int wj : nearSketches[size_t(wi)]) {
            if (dirtyW[size_t(wj)]) continue;
            const std::vector<Bend>& ocs = bendsOf[wj];
            const size_t n = ocs.size();
            if (n < 2) continue;
            const double between = clrBetween(w, wires[wj]);
            bool hit = false;
            for (size_t m = 0; m < moved.size() && !hit; ++m) {
              const Bend& c = moved[m].first;
              if (r::contains(ocs, c.obst, &Bend::obst)) hit = true;
              const double far = std::abs(c.rho) + c.width / 2.0 + between + kMargin + double(wires[wj].width) / 2.0 + kUpdateTol;
              for (size_t k = 0; k + 1 < n && !hit; ++k) {
                const Vec2 p = k == 0 ? ocs[0].c : toutOf[wj][k], q = k + 1 == n - 1 ? ocs[n - 1].c : tinOf[wj][k + 1];
                hit = distPointSegment(c.c, p, q) < far;
              }
            }
            if (hit) dirtyW[size_t(wj)] = 1;
          }
        }
        (void)ob;
        active[li] = !dirtyE[li].empty() || r::any_of(byLayer.at(L), [&](int wi) { return dirtyW[size_t(wi)] != 0; });
      });
      if (r::any_of(failed, [](char c) { return c != 0; })) return whole("an edge took its shares back");
      d.made.rounds = round + 1;
      rest = r::none_of(active, [](char c) { return c != 0; });
    }
    if (!rest) return whole("no rest within the rounds");
    for (size_t li = 0; li < NL; ++li) {
      d.made.edges += packedOf[li];
      d.made.wires += laidOf[li];
    }
    d.made.updated = true;
    return true;
  };

  if (was) {
    if (!drawChanged(*was)) return false;
    // (The counts are the whole drawing's it came from.)
    st.overflowEdges += was->d.overflowEdges;
    st.arcBends += was->d.arcBends;
    st.guardBends += was->d.guardBends;
    st.droppedApexes += was->d.droppedApexes;
    d.overflowEdges = was->d.overflowEdges, d.arcBends = was->d.arcBends, d.guardBends = was->d.guardBends, d.droppedApexes = was->d.droppedApexes;
    return true;
  }
  drawAll();
  for (const RealizeStats& ls : per) {
    st.overflowEdges += ls.overflowEdges;
    st.arcBends += ls.arcBends;
    st.guardBends += ls.guardBends;
    st.droppedApexes += ls.droppedApexes;
  }
  for (const RealizeStats& ls : per) d.overflowEdges += ls.overflowEdges, d.arcBends += ls.arcBends, d.guardBends += ls.guardBends, d.droppedApexes += ls.droppedApexes;
  return true;
}
}  // namespace

void computeDrawn(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in, DrawnWires& d, RealizeStats& st) {
  drawWires(b, wires, opt, in, d, st, nullptr);
}

bool updateDrawn(const Board& b, const std::vector<RealWire>& wires, const RealizeOptions& opt, RealizeInput& in, DrawnWires& d, RealizeStats& st,
                 const std::vector<RealWire>& wiresWas, const RealizeInput& inWas, const DrawnWires& was) {
  static const bool kOff = std::getenv("XR_NO_UPDATE") != nullptr;
  const RealizeStats before = st;
  const DrawnBefore from{wiresWas, inWas, was};
  if (!kOff && drawWires(b, wires, opt, in, d, st, &from)) return true;
  const char* why = kOff ? "switched off" : d.made.whole;
  st = before;
  d = DrawnWires{};
  drawWires(b, wires, opt, in, d, st, nullptr);
  d.made.whole = why;
  return false;
}

// The tracks of a drawing, appended to the board (and the vias given), with the forces the wires as drawn put on
// what they hang on and bend round.
RealizeStats emitDrawn(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias, const RealizeOptions& opt, RealizeInput& in,
                       const DrawnWires& d, RealizeStats st, bool dry) {
  const int NW = int(wires.size());
  const std::vector<std::vector<EdgeHit>>& hits = in.hits;
  const std::vector<Polyline>& sketches = in.sketches;
  const std::map<LayerId, LayerObstacles>& obstacles = in.obstacles;
  const std::vector<std::array<Stub, 2>>& stubs = in.stubs;
  const SpatialIndex& oidx = in.oidx;
  const std::vector<std::vector<Bend>>& bendsOf = d.bends;
  const std::vector<std::vector<Vec2>>&tinOf = d.tin, &toutOf = d.tout;
  const std::vector<std::vector<double>>& hw = d.width;
  std::optional<ProfScope> phase;
  phase.emplace("realize: emission");
  st.endDir.assign(size_t(NW), {});
  st.ownerPush.clear();
  st.ownerForce.clear();
  for (int wi = 0; wi < NW; ++wi) {
    const RealWire& w = wires[wi];
    bool narrowedWire = false;
    for (double x : hw[wi])
      if (x < double(w.width)) {
        ++st.narrowed;
        narrowedWire = true;
      }
    st.narrowedWires += narrowedWire;
    // A pair's wire is drawn as its axis, kept aside: the conductors are made from it after, and they are
    // the wire's tracks.
    std::vector<Track> axisOut;
    const bool pairWire = w.zip >= 0 && w.zip < int(b.zips.size());
    auto pushTrack = [&](Track t) {
      if (pairWire) {
        t.net = kNoNet;
        axisOut.push_back(std::move(t));
        return;
      }
      st.length += t.length();
      if (dry) return;
      b.tracks.push_back(std::move(t));
      st.trackWire.push_back(wi);
    };
    // A tangent between two bends is as narrow as the narrower bend (the step sits where there is room).
    auto emitRaw = [&](Vec2 p, Vec2 q, double width) {
      Track t;
      t.a = Point(p);
      t.b = Point(q);
      t.width = Coord(std::llround(width));
      t.layer = w.layer;
      t.net = w.net;
      if (t.a == t.b) return;
      pushTrack(std::move(t));
    };
    // A wire laid from the centre of a rectangular pad with no stub (the model's wires: their first crossing
    // is the pad's own side) gets the pattern's vertices on its way out: the inner point half a width short
    // of the edge and the point of the edge, straight beyond it (TopoR: centre, (L - w/2, v), (L, v)). The
    // wire outside the copper is as it was.
    struct RectLead {
      Vec2 c;
      PadFrame f;
    };
    std::optional<RectLead> rectLead[2];
    if (opt.padPattern && sketches[wi].size() >= 2)
      for (int end = 0; end < 2; ++end) {
        if (stubs[wi][end].on) continue;
        const Vec2 c = end ? sketches[wi].back() : sketches[wi].front();
        BBox q;
        q.add(c);
        oidx.query(q.inflated(1000), LayerMask(1) << w.layer, [&](ItemRef r) {
          if (rectLead[end] || r.type != ItemType::Pad || b.pads[r.index].net != w.net) return;
          PadFrame f = padFrame(b.pads[r.index]);
          if (f.kind == PadFrame::Kind::Rect && (f.c - c).len() < 1000) rectLead[end] = RectLead{c, f};
        });
      }
    // The lead's points between the centre and `out`, if the run centre -> out leaves the pad through an
    // end (any side of a pad that is not elongated).
    auto leadPoints = [&](const RectLead& l, Vec2 out, double width, Vec2& I, Vec2& X) {
      // Signed distance to the rectangle's edge (a polygon's own distance is nought all over its inside).
      auto beyond = [&](Vec2 q) {
        const Vec2 lq = l.f.local(q);
        return std::max(std::abs(lq.x) - l.f.L, std::abs(lq.y) - l.f.W);
      };
      const double d = beyond(out);
      if (d < -kPadEdgeTol) return false;  // the run stays inside
      Vec2 pin = l.c, pout = out;
      if (d > kPadEdgeTol)  // else it ends on the edge: the exit the model pinned the wire at
        for (int it = 0; it < 40; ++it) {
          Vec2 m = (pin + pout) * 0.5;
          (beyond(m) <= 0 ? pin : pout) = m;
        }
      PadFrame f = l.f;
      if (!f.onEnd(pout)) {
        if (f.elongated()) return false;  // drawn out of the long side, and kept so
        f = f.turned();
      }
      const Vec2 lx = f.local(pout);
      // Out at the very corner (a wire that runs on along the pad's side, another pad of its net it only
      // passes): the inner point would lie on the side, half out of the copper — straight to the corner.
      if (std::abs(lx.y) > f.W - width / 2.0 + 1000) return false;
      const int sign = lx.x >= 0 ? 1 : -1;
      X = pout;
      I = X - f.n * (sign * width / 2.0);
      return (I - l.c).len() > 1000;
    };
    auto emitSeg = [&](Vec2 p, Vec2 q, double width) {
      Vec2 I, X;
      if (rectLead[0] && (p - rectLead[0]->c).len2() < 1 && leadPoints(*rectLead[0], q, width, I, X)) {
        emitRaw(p, I, width);
        emitRaw(I, X, width);
        emitRaw(X, q, width);
      } else if (rectLead[1] && (q - rectLead[1]->c).len2() < 1 && leadPoints(*rectLead[1], p, width, I, X)) {
        emitRaw(p, X, width);
        emitRaw(X, I, width);
        emitRaw(I, q, width);
      } else {
        emitRaw(p, q, width);
      }
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
      pushTrack(std::move(t));
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
        const double reachOut = width / 2.0 + double(b.clearanceUpper(w.net, w.layer));
        auto pts = g.tessellate(20000);
        oidx.query(bb.inflated(reachOut + 1000), LayerMask(1) << w.layer, [&](ItemRef r) {
          if (!ok || itemNet(b, r) == w.net) return;
          const double need = width / 2.0 + double(b.clearance(w.net, itemNet(b, r), w.layer));
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
    {
      // The forces of this wire: the pull at its ends, the push at its bends (RealizeStats::endDir, ownerPush).
      auto dir = [](Vec2 a, Vec2 c) {
        Vec2 d = c - a;
        double l = d.len();
        return l > 1 ? d / l : Vec2{};
      };
      auto leaves = [&](size_t k) { return k == 0 ? cs[0].c : to[k]; };          // the tangent k -> k + 1 starts here
      auto arrives = [&](size_t k) { return k == n - 1 ? cs[n - 1].c : ti[k]; };  // the tangent k - 1 -> k ends here
      st.endDir[wi][0] = dir(leaves(0), arrives(1));
      st.endDir[wi][1] = dir(arrives(n - 1), leaves(n - 2));
      const LayerObstacles& obF = obstacles.at(w.layer);
      for (size_t k = 1; k + 1 < n; ++k) {
        if (cs[k].obst < 0) continue;
        const int owner = obF.pts[cs[k].obst].owner;
        if (owner < 0) continue;
        st.ownerPush[owner] = st.ownerPush[owner] + dir(leaves(k), arrives(k + 1)) - dir(leaves(k - 1), arrives(k));
      }
    }
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
      // The tangent is of the nominal width but where a narrowed crossing or bend needs it narrow: within
      // the reach of the copper at that edge's ends, where the whole width would be short of the rule (the
      // crossing lies at d from an end; the whole width needs d + (W - w) / 2). The step sits where there
      // is room, and a straight wire through one tight gap is narrow at the gap only.
      emitSeg(cur, p, cs[k].width);
      {
        const double nominal = double(w.width);
        const LayerObstacles& obE = obstacles.at(w.layer);
        const Vec2 d = q - p;
        const double len = d.len();
        double lo = 2, hi = -1, width = nominal;  // the narrow stretch along p -> q, in [0, 1]
        auto within = [&](Vec2 centre, double R) {  // the part of the tangent nearer the centre than R
          if (len <= 0) return;
          const double tc = std::clamp((centre - p).dot(d) / (len * len), 0.0, 1.0);
          const double dist = (p + d * tc - centre).len();
          if (dist >= R) return;
          const double half = std::sqrt(R * R - dist * dist) / len;
          lo = std::min(lo, std::max(0.0, tc - half));
          hi = std::max(hi, std::min(1.0, tc + half));
        };
        for (int h = cs[k].portal + 1; h < cs[k + 1].portal; ++h) {
          if (h < 1 || h > int(hits[wi].size()) || hw[wi][h - 1] >= nominal) continue;
          const EdgeHit& eh = hits[wi][h - 1];
          const Vec2 U = obE.pts[eh.u].p, V = obE.pts[eh.v].p;
          // Where the tangent crosses the edge.
          const double den = d.cross(V - U);
          Vec2 X = (p + q) * 0.5;
          if (std::abs(den) > 1e-9) X = p + d * std::clamp((U - p).cross(V - U) / den, 0.0, 1.0);
          const double more = (nominal - hw[wi][h - 1]) / 2.0 + kMargin;
          within(U, (X - U).len() + more);
          within(V, (X - V).len() + more);
          width = std::min(width, hw[wi][h - 1]);
        }
        for (size_t e : {k, k + 1}) {
          const Bend& C = cs[e];
          if (C.obst < 0 || C.width >= nominal) continue;  // an end, or a bend of the whole width
          within(C.c, std::abs(C.rho) + (nominal - C.width) / 2.0 + kMargin);
          width = std::min(width, C.width);
        }
        if (hi < lo) {
          emitSeg(p, q, nominal);
        } else {
          emitSeg(p, p + d * lo, nominal);
          emitSeg(p + d * lo, p + d * hi, width);
          emitSeg(p + d * hi, q, nominal);
        }
      }
      cur = q;
      if (k + 1 < n - 1) {
        const Bend& C = cs[k + 1];
        double sw = sweepOf(C, ti[k + 1], to[k + 1]);
        double sagitta = std::abs(C.rho) * (1 - std::cos(sw / 2));
        // (A pair's axis keeps every arc, however slight: a dropped one leaves a join that is not tangent,
        // and the conductors offset from the two pieces miss each other there by the offset times the turn.)
        if (sagitta > 1000 || (pairWire && (to[k + 1] - ti[k + 1]).len2() > 1)) {
          auto g = ArcGeom::fromCenter(C.c, ti[k + 1], sw);
          Track t;
          t.a = Point(ti[k + 1]);
          t.mid = Point(g.mid());
          t.b = Point(to[k + 1]);
          t.width = Coord(std::llround(C.width));
          t.layer = w.layer;
          t.net = w.net;
          pushTrack(std::move(t));
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
    if (pairWire) {
      // The axis to the board, and the two conductors offset from every piece of it along its normal (an arc
      // keeps its centre, its radius grows or shrinks by the offset): the positive net's on pSide's side of
      // the travel. The clasps turn to the drawn ends after (drawModel).
      ZippedWire& z = b.zips[size_t(w.zip)];
      if (!dry) {
        z.axis = axisOut;
        for (Track& t : z.axis) t.width = Coord(std::llround(double(w.width)));
      }
      const double off = (double(w.condWidth) + double(z.gap)) / 2.0;
      for (int side = 0; side < 2; ++side) {
        const double sg = (side ? 1.0 : -1.0) * double(w.pSide);  // [1] the positive conductor
        for (Track t : offsetRun(axisOut, sg * off, 4 * double(w.width))) {
          t.width = w.condWidth;
          t.layer = w.layer;
          t.net = side ? w.net : w.netN;
          t.zip = w.zip;
          st.length += t.length();
          if (dry) continue;
          b.tracks.push_back(t);
          st.trackWire.push_back(wi);
        }
      }
    }
    ++st.wires;
  }

  for (const RealVia& v : vias) {
    if (dry) break;
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

RealizeStats drawRealized(Board& b, const std::vector<RealWire>& wires, const std::vector<RealVia>& vias,
                          const RealizeOptions& opt, RealizeInput& in, RealizeStats st) {
  DrawnWires d;
  computeDrawn(b, wires, opt, in, d, st);
  return emitDrawn(b, wires, vias, opt, in, d, std::move(st), false);
}

}  // namespace xr::topo
