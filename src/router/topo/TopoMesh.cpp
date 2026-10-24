#include "router/topo/TopoMesh.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_face_base_with_info_2.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <list>
#include <set>
#include <map>

#include "core/SpatialIndex.h"

namespace xr::topo {

namespace {

using K = CGAL::Exact_predicates_inexact_constructions_kernel;
struct FaceInfo {
  int nesting = -1;
  int id = -1;
};
using Vb = CGAL::Triangulation_vertex_base_with_info_2<int, K>;
using Fbi = CGAL::Triangulation_face_base_with_info_2<FaceInfo, K>;
using Fb = CGAL::Constrained_triangulation_face_base_2<K, Fbi>;
using Tds = CGAL::Triangulation_data_structure_2<Vb, Fb>;
using Itag = CGAL::Exact_predicates_tag;
using CDT = CGAL::Constrained_Delaunay_triangulation_2<K, Tds, Itag>;
using CPoint = CDT::Point;

// Domains are separated by the board outline only (`border(e)`): keepout boundaries are constraints too.
template <class Border>
void markDomains(CDT& cdt, CDT::Face_handle start, int index, std::list<CDT::Edge>& border, const Border& isBorder) {
  if (start->info().nesting != -1) return;
  std::list<CDT::Face_handle> queue;
  queue.push_back(start);
  while (!queue.empty()) {
    auto fh = queue.front();
    queue.pop_front();
    if (fh->info().nesting == -1) {
      fh->info().nesting = index;
      for (int i = 0; i < 3; i++) {
        CDT::Edge e(fh, i);
        auto n = fh->neighbor(i);
        if (n->info().nesting == -1) {
          if (isBorder(e)) border.push_back(e);
          else queue.push_back(n);
        }
      }
    }
  }
}

template <class Border>
void markDomains(CDT& cdt, const Border& isBorder) {
  for (auto f = cdt.all_faces_begin(); f != cdt.all_faces_end(); ++f) f->info().nesting = -1;
  std::list<CDT::Edge> border;
  markDomains(cdt, cdt.infinite_face(), 0, border, isBorder);
  while (!border.empty()) {
    CDT::Edge e = border.front();
    border.pop_front();
    auto n = e.first->neighbor(e.second);
    if (n->info().nesting == -1) markDomains(cdt, n, e.first->info().nesting + 1, border, isBorder);
  }
}

}  // namespace

void TopoMesh::build(const Board& b, const MeshOptions& opt) {
  verts.clear();
  tris.clear();
  edges.clear();
  padVerts.assign(b.pads.size(), {});

  auto addVert = [&](Vec2 p, VKind k, int pad) {
    MVertex v;
    v.p = p;
    v.kind = k;
    v.pad = pad;
    verts.push_back(v);
    return int(verts.size() - 1);
  };

  // Pads: centre + core polygon corners (capsule ends).
  LayerMask cuMask = b.allCopperMask();
  for (int i = 0; i < int(b.pads.size()); ++i) {
    const Pad& p = b.pads[i];
    if (!(p.copper & cuMask) && p.drill == 0) continue;
    Shape s = p.shapeGeom();
    padVerts[i].push_back(addVert(p.pos.v(), VKind::PadCenter, i));
    if (s.kind == Shape::Kind::Segment) {
      padVerts[i].push_back(addVert(s.a, VKind::PadCorner, i));
      padVerts[i].push_back(addVert(s.b, VKind::PadCorner, i));
    } else if (s.kind == Shape::Kind::Polygon) {
      for (auto& c : s.poly) padVerts[i].push_back(addVert(c, VKind::PadCorner, i));
    }
  }
  for (int i = 0; i < int(b.vias.size()); ++i) {
    int v = addVert(b.vias[i].pos.v(), VKind::FixedVia, -1);
    verts[v].fixedVia = i;
  }

  // Board outline (subdivided so that edge clearance is sampled densely enough).
  BBox bb = b.bbox();
  double pitch = opt.viaPitch > 0 ? opt.viaPitch : std::max(1.2 * (opt.viaDiameter + opt.clearance), 1.0 * kNmPerMm);
  std::vector<std::pair<int, int>> constraints;
  for (auto& loop : b.outline) {
    int first = -1, prev = -1;
    for (size_t i = 0; i < loop.size(); ++i) {
      Vec2 a = loop[i], c = loop[(i + 1) % loop.size()];
      int n = std::max(1, int(std::ceil((c - a).len() / pitch)));
      for (int k = 0; k < n; ++k) {
        int v = addVert(a + (c - a) * (double(k) / n), VKind::Outline, -1);
        if (prev >= 0) constraints.push_back({prev, v});
        else first = v;
        prev = v;
      }
    }
    if (prev >= 0 && first >= 0) constraints.push_back({prev, first});
  }
  if (b.outline.empty() && bb.valid()) {
    BBox ob = bb.inflated(2 * kNmPerMm);
    Polyline loop = {{ob.minX, ob.minY}, {ob.maxX, ob.minY}, {ob.maxX, ob.maxY}, {ob.minX, ob.maxY}};
    int first = -1, prev = -1;
    for (size_t i = 0; i < 4; ++i) {
      int v = addVert(loop[i], VKind::Outline, -1);
      if (prev >= 0) constraints.push_back({prev, v});
      else first = v;
      prev = v;
    }
    constraints.push_back({prev, first});
  }

  // Routing keepouts that keep wires out: boundary points (dense enough for the clearance), linked
  // as constraints that block their layers only.
  struct KeepoutLoop {
    int keepout;
    LayerMask layers;
    std::vector<int> verts;
    bool area;
  };
  std::vector<KeepoutLoop> keepoutLoops;
  std::vector<std::pair<int, int>> barrierConstraints;  // keepout boundaries and kept wires
  for (int ki = 0; ki < int(b.keepouts.size()); ++ki) {
    const Keepout& k = b.keepouts[ki];
    if (k.role != Keepout::Role::Route || !k.wires) continue;
    LayerMask layers = k.layers ? k.layers : cuMask;
    for (const Shape& s : k.shapes()) {
      KeepoutLoop kl{ki, layers, {}, s.kind != Shape::Kind::Segment};
      Polyline pts = s.kind == Shape::Kind::Polygon ? s.poly
                     : s.kind == Shape::Kind::Point ? s.outline(std::max(2000.0, s.r * 0.02))
                                                    : Polyline{s.a, s.b};
      size_t n = pts.size(), segs = kl.area ? n : n - 1;
      for (size_t i = 0; i < segs; ++i) {
        Vec2 a = pts[i], c = pts[(i + 1) % n];
        int parts = std::max(1, int(std::ceil((c - a).len() / pitch)));
        for (int k2 = 0; k2 < parts; ++k2) {
          int v = addVert(a + (c - a) * (double(k2) / parts), VKind::Keepout, -1);
          verts[v].keepout = ki;
          kl.verts.push_back(v);
        }
      }
      if (!kl.area) {
        int v = addVert(pts.back(), VKind::Keepout, -1);
        verts[v].keepout = ki;
        kl.verts.push_back(v);
      }
      for (size_t i = 0; i + 1 < kl.verts.size(); ++i) barrierConstraints.push_back({kl.verts[i], kl.verts[i + 1]});
      if (kl.area && kl.verts.size() > 2) barrierConstraints.push_back({kl.verts.back(), kl.verts.front()});
      keepoutLoops.push_back(std::move(kl));
    }
  }
  // Wires kept on the board (locked, or all of them when the routing is a starting point): points
  // along them, linked into barriers of their layer; the points carry the wire's width as obstacles.
  {
    double step = std::min(pitch, 1.0 * kNmPerMm);
    for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
      auto pts = b.tracks[ti].path(20000);
      if (pts.size() < 2) continue;
      std::vector<int> chain;
      auto addPt = [&](Vec2 p) {
        int v = addVert(p, VKind::Track, -1);
        verts[v].track = ti;
        chain.push_back(v);
      };
      addPt(pts.front());
      double carry = 0;
      for (size_t i = 1; i < pts.size(); ++i) {
        Vec2 a = pts[i - 1], c = pts[i];
        double len = (c - a).len();
        for (double s = step - carry; s < len; s += step) addPt(a + (c - a) * (s / len));
        carry = std::fmod(carry + len, step);
      }
      if ((pts.back() - verts[chain.back()].p).len() > 1) addPt(pts.back());
      for (size_t i = 0; i + 1 < chain.size(); ++i) barrierConstraints.push_back({chain[i], chain[i + 1]});
    }
  }
  // No via sites where the via's copper would touch a keepout that keeps vias out.
  auto viaKeptOut = [&](Vec2 p) {
    for (const Keepout& k : b.keepouts)
      if (k.role == Keepout::Role::Route && k.vias)
        for (const Shape& s : k.shapes())
          if (s.distance(p) < opt.viaDiameter / 2) return true;
    return false;
  };

  // The obstacles alone triangulated first: every edge between two obstacles (the gap a wire must fit
  // through) is kept as a constraint of the final mesh, so that the via sites added next only
  // subdivide those triangles and never hide a gap behind a site vertex (a free site between two pads
  // let two wires pass, one on each side of it, where the gap holds one; arz_2L with 1.016 mm vias:
  // 195 overflowed realiser edges from a topology with 3). Experiment (XR_OBSTEDGES): the stricter
  // capacity leaves the negotiation unable to settle (MinVia: 119 overflowed edges in the best pass, 84
  // failed connections in the hard one, 1096 violations), so the leak is closed elsewhere first.
  std::vector<std::pair<int, int>> obstEdges;
  if (std::getenv("XR_OBSTEDGES")) {
    CDT ocdt;
    std::vector<CDT::Vertex_handle> oh(verts.size());
    CDT::Face_handle ohint;
    for (size_t i = 0; i < verts.size(); ++i) {
      size_t before = ocdt.number_of_vertices();
      auto vh = ocdt.insert(CPoint(verts[i].p.x, verts[i].p.y), ohint);
      ohint = vh->face();
      if (ocdt.number_of_vertices() > before) vh->info() = int(i);
      oh[i] = vh;
    }
    for (auto [a, c] : constraints)
      if (oh[a] != oh[c]) ocdt.insert_constraint(oh[a], oh[c]);
    for (auto [a, c] : barrierConstraints)
      if (oh[a] != oh[c]) ocdt.insert_constraint(oh[a], oh[c]);
    for (auto e = ocdt.finite_edges_begin(); e != ocdt.finite_edges_end(); ++e) {
      int a = e->first->vertex(CDT::cw(e->second))->info(), c = e->first->vertex(CDT::ccw(e->second))->info();
      if (a < 0 || c < 0 || a >= int(verts.size()) || c >= int(verts.size()) || a == c) continue;
      if (ocdt.is_constrained(*e)) continue;  // already a constraint
      obstEdges.push_back({a, c});
    }
  }

  // Via candidate sites: a staggered grid away from pads and the board edge, and fanout sites in front
  // of every SMD pad's ends, on the pad's axis, where a via of the pad's net fits among the other
  // copper (TopoR puts a via right over the end of a fine-pitch pad whose row leaves no room between).
  if (opt.viaSites && bb.valid()) {
    SpatialIndex idx;
    idx.build(b);
    double need = opt.viaDiameter / 2 + opt.clearance;
    double edgeNeed = opt.viaDiameter / 2 + double(b.edgeClearance);
    auto siteOk = [&](Vec2 p, int ownPad) {
      bool inside = b.outline.empty();
      for (size_t li = 0; li < b.outline.size(); ++li)
        if (pointInPolygon(p, b.outline[li])) inside = !inside;
      if (!inside || viaKeptOut(p)) return false;
      for (auto& loop : b.outline)
        for (size_t i = 0; i < loop.size(); ++i)
          if (distPointSegment(p, loop[i], loop[(i + 1) % loop.size()]) < edgeNeed) return false;
      bool ok = true;
      BBox q;
      q.add(p);
      idx.query(q.inflated(need + 5 * kNmPerMm), cuMask, [&](ItemRef r) {
        if (!ok || r.type == ItemType::Zone || r == ItemRef{ItemType::Pad, ownPad}) return;
        // A track of the pad's class must be able to leave the pad past the via.
        double exitRoom = r.type == ItemType::Pad ? double(b.classOf(b.pads[r.index].net).trackWidth) : 0.0;
        for (auto& s : itemShapes(b, r))
          if (s.distance(p) < need + exitRoom) ok = false;
      });
      // Non-plated holes have no copper but still block vias.
      if (ok)
        for (auto& pad : b.pads)
          if (pad.drill > 0 && !pad.copper && (pad.pos.v() - p).len() < pad.drill / 2.0 + need) ok = false;
      return ok;
    };
    int row = 0;
    for (double y = bb.minY + pitch / 2; y < bb.maxY; y += pitch * 0.866, ++row)
      for (double x = bb.minX + pitch / 2 + (row % 2 ? pitch / 2 : 0); x < bb.maxX; x += pitch)
        if (siteOk({x, y}, -1)) addVert({x, y}, VKind::ViaSite, -1);
    // Fanout sites, reserved for the pad's net: the nearest place along the axis where the via fits,
    // and a second one a via further out so that the vias of neighbouring pads can stagger.
    // Fanout sites are an experiment (XR_FANOUT): they let arz_2L route more connections but choke the
    // mesh around a 0.65 mm QFP (Arcs 90 → 362 violations); the capacity model does not yet know that
    // the sites of neighbouring pads exclude each other.
    static const bool kFanout = std::getenv("XR_FANOUT") != nullptr;
    for (int i = 0; i < int(b.pads.size()) && kFanout; ++i) {
      const Pad& pad = b.pads[i];
      if (pad.drill > 0 || pad.net == kNoNet || !(pad.copper & cuMask)) continue;
      Shape s = pad.shapeGeom();
      std::vector<std::pair<Vec2, Vec2>> ends;  // (end point on the copper boundary, outward direction)
      if (s.kind == Shape::Kind::Segment && (s.b - s.a).len2() > 1) {
        Vec2 d = (s.b - s.a).normalized();
        ends = {{s.a - d * s.r, d * -1.0}, {s.b + d * s.r, d}};
      } else if (s.kind == Shape::Kind::Polygon && s.poly.size() == 4) {
        double l0 = (s.poly[1] - s.poly[0]).len(), l1 = (s.poly[2] - s.poly[1]).len();
        if (std::abs(l0 - l1) < 1000) continue;  // square: no axis
        int k0 = l0 < l1 ? 0 : 1;
        for (int k : {k0, k0 + 2}) {
          Vec2 a = s.poly[size_t(k)], c = s.poly[size_t((k + 1) % 4)];
          Vec2 M = (a + c) * 0.5;
          Vec2 n = (c - a).perp().normalized();
          if (n.dot(M - s.center()) < 0) n = n * -1.0;
          ends.push_back({M + n * s.r, n});
        }
      } else {
        continue;
      }
      for (auto& [M, n] : ends) {
        int levels = 0;
        double from = opt.viaDiameter / 2;  // the via's edge at the pad's end
        for (double d = from; d <= from + 3 * kNmPerMm && levels < 2; d += 0.1 * kNmPerMm) {
          Vec2 p = M + n * d;
          if (!siteOk(p, i)) continue;
          int v = addVert(p, VKind::ViaSite, -1);
          verts[v].onlyNet = pad.net;
          verts[v].sitePad = i;
          ++levels;
          d += opt.viaDiameter + opt.clearance - 0.1 * kNmPerMm;
        }
      }
    }
  }

  // Triangulate.
  CDT cdt;
  std::vector<CDT::Vertex_handle> handles(verts.size());
  std::vector<int> alias(verts.size(), -1);
  CDT::Face_handle hint;
  for (size_t i = 0; i < verts.size(); ++i) {
    size_t before = cdt.number_of_vertices();
    auto vh = cdt.insert(CPoint(verts[i].p.x, verts[i].p.y), hint);
    hint = vh->face();
    if (cdt.number_of_vertices() > before) vh->info() = int(i);
    else alias[i] = vh->info();  // duplicate point
    handles[i] = vh;
  }
  for (auto [a, c] : constraints)
    if (handles[a] != handles[c]) cdt.insert_constraint(handles[a], handles[c]);
  for (auto [a, c] : barrierConstraints)
    if (handles[a] != handles[c]) cdt.insert_constraint(handles[a], handles[c]);
  for (auto [a, c] : obstEdges)
    if (handles[a] != handles[c]) cdt.insert_constraint(handles[a], handles[c]);
  // Constraint intersections may create new vertices.
  for (auto v = cdt.finite_vertices_begin(); v != cdt.finite_vertices_end(); ++v) {
    int id = v->info();
    if (id >= 0 && id < int(handles.size()) && handles[id] == CDT::Vertex_handle(v)) continue;
    v->info() = addVert({v->point().x(), v->point().y()}, VKind::Outline, -1);
  }
  // Outline pieces: constrained edges lying on the board contour (keepout lines may run along it).
  std::vector<std::pair<Vec2, Vec2>> contour;
  for (auto [a, c] : constraints) contour.push_back({verts[a].p, verts[c].p});
  auto onOutline = [&](Vec2 p, Vec2 q) {
    Vec2 m = (p + q) * 0.5;
    for (auto& [a, c] : contour)
      if (distPointSegment(m, a, c) < 10 && distPointSegment(p, a, c) < 10 && distPointSegment(q, a, c) < 10) return true;
    return false;
  };
  auto edgePts = [&](const CDT::Edge& e) {
    auto pa = e.first->vertex(CDT::cw(e.second))->point(), pc = e.first->vertex(CDT::ccw(e.second))->point();
    return std::pair{Vec2{pa.x(), pa.y()}, Vec2{pc.x(), pc.y()}};
  };
  markDomains(cdt, [&](const CDT::Edge& e) {
    if (!cdt.is_constrained(e)) return false;
    if (barrierConstraints.empty() && obstEdges.empty()) return true;
    auto [p, q] = edgePts(e);
    return onOutline(p, q);
  });

  for (auto f = cdt.finite_faces_begin(); f != cdt.finite_faces_end(); ++f) {
    f->info().id = int(tris.size());
    MTri t;
    for (int i = 0; i < 3; ++i) t.v[i] = f->vertex(i)->info();
    t.inside = (f->info().nesting % 2) == 1;
    tris.push_back(t);
  }
  // Remap duplicates: pad vertices that coincide with another vertex refer to the first one. Of
  // coincident pads (a connector drawn as two parts, one without nets) the one with a net owns the
  // vertex, or its own net could not reach it.
  for (size_t i = 0; i < alias.size(); ++i)
    if (alias[i] >= 0) {
      int keep = alias[i];
      int mine = verts[i].pad, theirs = verts[keep].pad;
      if (mine >= 0 && theirs >= 0 && b.pads[theirs].net == kNoNet && b.pads[mine].net != kNoNet) {
        verts[keep].pad = mine;
        verts[keep].kind = verts[i].kind;
      }
      for (auto& pv : padVerts)
        for (auto& v : pv)
          if (v == int(i)) v = keep;
    }

  std::map<std::pair<int, int>, int> edgeIdx;
  for (auto f = cdt.finite_faces_begin(); f != cdt.finite_faces_end(); ++f) {
    int ti = f->info().id;
    MTri& t = tris[ti];
    for (int i = 0; i < 3; ++i) {
      auto n = f->neighbor(i);
      t.nb[i] = cdt.is_infinite(n) ? -1 : n->info().id;
      int a = t.v[(i + 1) % 3], c = t.v[(i + 2) % 3];
      auto key = std::minmax(a, c);
      auto it = edgeIdx.find(key);
      int e;
      if (it == edgeIdx.end()) {
        e = int(edges.size());
        MEdge me;
        me.v[0] = key.first;
        me.v[1] = key.second;
        me.constrained = cdt.is_constrained(CDT::Edge(f, i));
        edges.push_back(me);
        edgeIdx[key] = e;
      } else {
        e = it->second;
      }
      t.e[i] = e;
      MEdge& me = edges[e];
      if (me.t[0] < 0) me.t[0] = ti; else me.t[1] = ti;
    }
  }
  // Keepout boundaries and kept wires block their layers; only the board outline separates the domain.
  auto keepoutOf = [&](int v) { return verts[v].kind == VKind::Keepout ? verts[v].keepout : -1; };
  auto trackOf = [&](int v) { return verts[v].kind == VKind::Track ? verts[v].track : -1; };
  std::set<std::pair<int, int>> obstSet;
  for (auto [a, c] : obstEdges) obstSet.insert({std::min(a, c), std::max(a, c)});
  for (auto& me : edges) {
    if (!me.constrained || (barrierConstraints.empty() && obstEdges.empty()) || onOutline(verts[me.v[0]].p, verts[me.v[1]].p)) continue;
    if (obstSet.contains({std::min(me.v[0], me.v[1]), std::max(me.v[0], me.v[1])})) {
      me.constrained = false;  // an obstacle-to-obstacle edge: a gap to measure, not a wall
      continue;
    }
    int ta = trackOf(me.v[0]), tc = trackOf(me.v[1]);
    int ka = keepoutOf(me.v[0]), kc = keepoutOf(me.v[1]);
    if (int ti = ta >= 0 ? ta : tc; ti >= 0) {
      me.blocked |= LayerMask(1) << b.tracks[ti].layer;
      me.net = b.tracks[ti].net;
    } else if (int ki = ka >= 0 ? ka : kc; ki >= 0) {  // pieces between two crossing keepouts block for either
      const Keepout& k = b.keepouts[ki];
      me.blocked |= k.layers ? k.layers : cuMask;
    } else {
      me.blocked |= cuMask;
    }
    me.constrained = false;
  }
  for (const KeepoutLoop& kl : keepoutLoops) {
    if (!kl.area) continue;
    Polyline poly;
    for (int v : kl.verts) poly.push_back(verts[v].p);
    for (auto& t : tris)
      if (t.inside && pointInPolygon((verts[t.v[0]].p + verts[t.v[1]].p + verts[t.v[2]].p) / 3.0, poly)) t.blocked |= kl.layers;
  }
  for (auto& t : tris)
    for (int i = 0; i < 3; ++i)
      if (t.nb[i] >= 0 && (!tris[t.nb[i]].inside || edges[t.e[i]].constrained)) t.nb[i] = -1;
  for (int ti = 0; ti < int(tris.size()); ++ti)
    if (tris[ti].inside)
      for (int i = 0; i < 3; ++i) verts[tris[ti].v[i]].tris.push_back(ti);
}

bool TopoMesh::strictlyInside(int t, Vec2 p) const {
  const MTri& T = tris[t];
  Vec2 a = verts[T.v[0]].p, b = verts[T.v[1]].p, c = verts[T.v[2]].p;
  return orient(a, b, p) > 0 && orient(b, c, p) > 0 && orient(c, a, p) > 0;
}

int TopoMesh::splitTriangle(int t, Vec2 p, VKind kind) {
  MTri old = tris[t];
  int A = old.v[0], B = old.v[1], C = old.v[2];
  int e0 = old.e[0], e1 = old.e[1], e2 = old.e[2];  // opposite A (B-C), B (C-A), C (A-B)
  MVertex nv;
  nv.p = p;
  nv.kind = kind;
  int v = int(verts.size());
  verts.push_back(nv);
  auto addEdge = [&](int a, int c) {
    MEdge me;
    me.v[0] = std::min(a, c);
    me.v[1] = std::max(a, c);
    edges.push_back(me);
    return int(edges.size()) - 1;
  };
  int eA = addEdge(A, v), eB = addEdge(B, v), eC = addEdge(C, v);
  int t1 = t, t2 = int(tris.size()), t3 = t2 + 1;
  MTri T1, T2, T3;
  T1.v[0] = A; T1.v[1] = B; T1.v[2] = v;
  T1.e[0] = eB; T1.e[1] = eA; T1.e[2] = e2;
  T1.nb[0] = t2; T1.nb[1] = t3; T1.nb[2] = old.nb[2];
  T2.v[0] = B; T2.v[1] = C; T2.v[2] = v;
  T2.e[0] = eC; T2.e[1] = eB; T2.e[2] = e0;
  T2.nb[0] = t3; T2.nb[1] = t1; T2.nb[2] = old.nb[0];
  T3.v[0] = C; T3.v[1] = A; T3.v[2] = v;
  T3.e[0] = eA; T3.e[1] = eC; T3.e[2] = e1;
  T3.nb[0] = t1; T3.nb[1] = t2; T3.nb[2] = old.nb[1];
  for (MTri* T : {&T1, &T2, &T3}) {
    T->inside = old.inside;
    T->blocked = old.blocked;
  }
  tris[t1] = T1;
  tris.push_back(T2);
  tris.push_back(T3);
  // Neighbours across the old edges now face the new owners of those edges.
  auto relink = [&](int nb, int oldT, int newT) {
    if (nb < 0) return;
    for (int& x : tris[nb].nb)
      if (x == oldT) x = newT;
  };
  relink(old.nb[0], t, t2);
  relink(old.nb[1], t, t3);
  for (int e : {e0, e1}) {
    MEdge& me = edges[e];
    int owner = e == e0 ? t2 : t3;
    if (me.t[0] == t) me.t[0] = owner;
    else if (me.t[1] == t) me.t[1] = owner;
  }
  edges[eA].t[0] = t1; edges[eA].t[1] = t3;
  edges[eB].t[0] = t1; edges[eB].t[1] = t2;
  edges[eC].t[0] = t2; edges[eC].t[1] = t3;
  // Incident triangles: A keeps t (= t1) and gains t3, B keeps t1 and gains t2, C's t becomes t2 and t3.
  verts[A].tris.push_back(t3);
  verts[B].tris.push_back(t2);
  for (int& x : verts[C].tris)
    if (x == t) x = t2;
  verts[C].tris.push_back(t3);
  verts[v].tris = {t1, t2, t3};
  return v;
}

bool TopoMesh::unsplit(int v) {
  MVertex& V = verts[v];
  if (V.tris.size() != 3) return false;
  // The parts in the order splitTriangle made them: t1 (A,B,v), t2 (B,C,v), t3 (C,A,v).
  int t1 = V.tris[0], t2 = V.tris[1], t3 = V.tris[2];
  auto& T1 = tris[t1];
  auto& T2 = tris[t2];
  auto& T3 = tris[t3];
  if (T1.v[2] != v || T2.v[2] != v || T3.v[2] != v) return false;
  int A = T1.v[0], B = T1.v[1], C = T2.v[1];
  if (T2.v[0] != B || T3.v[0] != C || T3.v[1] != A) return false;
  int eA = T1.e[1], eB = T1.e[0], eC = T2.e[0];
  int e2 = T1.e[2], e0 = T2.e[2], e1 = T3.e[2];
  int nb2 = T1.nb[2], nb0 = T2.nb[2], nb1 = T3.nb[2];
  MTri T;
  T.v[0] = A; T.v[1] = B; T.v[2] = C;
  T.e[0] = e0; T.e[1] = e1; T.e[2] = e2;
  T.nb[0] = nb0; T.nb[1] = nb1; T.nb[2] = nb2;
  T.inside = T1.inside;
  T.blocked = T1.blocked | T2.blocked | T3.blocked;
  auto relink = [&](int nb, int oldT) {
    if (nb < 0) return;
    for (int& x : tris[nb].nb)
      if (x == oldT) x = t1;
  };
  relink(nb0, t2);
  relink(nb1, t3);
  for (int e : {e0, e1}) {
    MEdge& me = edges[e];
    int old = e == e0 ? t2 : t3;
    if (me.t[0] == old) me.t[0] = t1;
    else if (me.t[1] == old) me.t[1] = t1;
  }
  tris[t1] = T;
  for (int t : {t2, t3}) {
    tris[t] = MTri{};
    tris[t].inside = false;
  }
  for (int e : {eA, eB, eC}) edges[e] = MEdge{};
  std::erase(verts[A].tris, t3);
  std::erase(verts[B].tris, t2);
  for (int& x : verts[C].tris)
    if (x == t2) x = t1;
  std::erase(verts[C].tris, t3);
  V.tris.clear();
  return true;
}

int TopoMesh::locate(Vec2 p) const {
  for (int i = 0; i < int(tris.size()); ++i) {
    const MTri& t = tris[i];
    if (!t.inside) continue;
    Vec2 a = verts[t.v[0]].p, b = verts[t.v[1]].p, c = verts[t.v[2]].p;
    if (orient(a, b, p) >= 0 && orient(b, c, p) >= 0 && orient(c, a, p) >= 0) return i;
  }
  return -1;
}

}  // namespace xr::topo
