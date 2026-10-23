#include "router/topo/TopoMesh.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_face_base_with_info_2.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <list>
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

void markDomains(CDT& cdt, CDT::Face_handle start, int index, std::list<CDT::Edge>& border) {
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
          if (cdt.is_constrained(e)) border.push_back(e);
          else queue.push_back(n);
        }
      }
    }
  }
}

void markDomains(CDT& cdt) {
  for (auto f = cdt.all_faces_begin(); f != cdt.all_faces_end(); ++f) f->info().nesting = -1;
  std::list<CDT::Edge> border;
  markDomains(cdt, cdt.infinite_face(), 0, border);
  while (!border.empty()) {
    CDT::Edge e = border.front();
    border.pop_front();
    auto n = e.first->neighbor(e.second);
    if (n->info().nesting == -1) markDomains(cdt, n, e.first->info().nesting + 1, border);
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

  // Via candidate sites on a staggered grid, away from pads and the board edge.
  if (opt.viaSites && bb.valid()) {
    SpatialIndex idx;
    idx.build(b);
    double need = opt.viaDiameter / 2 + opt.clearance;
    double edgeNeed = opt.viaDiameter / 2 + double(b.edgeClearance);
    int row = 0;
    for (double y = bb.minY + pitch / 2; y < bb.maxY; y += pitch * 0.866, ++row) {
      for (double x = bb.minX + pitch / 2 + (row % 2 ? pitch / 2 : 0); x < bb.maxX; x += pitch) {
        Vec2 p{x, y};
        bool inside = b.outline.empty();
        for (size_t li = 0; li < b.outline.size(); ++li)
          if (pointInPolygon(p, b.outline[li])) inside = !inside;
        if (!inside) continue;
        bool ok = true;
        for (auto& loop : b.outline)
          for (size_t i = 0; i < loop.size() && ok; ++i)
            if (distPointSegment(p, loop[i], loop[(i + 1) % loop.size()]) < edgeNeed) ok = false;
        if (!ok) continue;
        BBox q;
        q.add(p);
        idx.query(q.inflated(need + 5 * kNmPerMm), cuMask, [&](ItemRef r) {
          if (!ok || r.type == ItemType::Track || r.type == ItemType::Zone) return;
          // A track of the pad's class must be able to leave the pad past the via.
          double exitRoom = r.type == ItemType::Pad ? double(b.classOf(b.pads[r.index].net).trackWidth) : 0.0;
          for (auto& s : itemShapes(b, r))
            if (s.distance(p) < need + exitRoom) ok = false;
        });
        // Non-plated holes have no copper but still block vias.
        if (ok)
          for (auto& pad : b.pads)
            if (pad.drill > 0 && !pad.copper && (pad.pos.v() - p).len() < pad.drill / 2.0 + need) ok = false;
        if (ok) addVert(p, VKind::ViaSite, -1);
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
  // Constraint intersections may create new vertices.
  for (auto v = cdt.finite_vertices_begin(); v != cdt.finite_vertices_end(); ++v) {
    int id = v->info();
    if (id >= 0 && id < int(handles.size()) && handles[id] == CDT::Vertex_handle(v)) continue;
    v->info() = addVert({v->point().x(), v->point().y()}, VKind::Outline, -1);
  }
  markDomains(cdt);

  for (auto f = cdt.finite_faces_begin(); f != cdt.finite_faces_end(); ++f) {
    f->info().id = int(tris.size());
    MTri t;
    for (int i = 0; i < 3; ++i) t.v[i] = f->vertex(i)->info();
    t.inside = (f->info().nesting % 2) == 1;
    tris.push_back(t);
  }
  // Remap duplicates: pad vertices that coincide with another vertex refer to the first one.
  for (size_t i = 0; i < alias.size(); ++i)
    if (alias[i] >= 0)
      for (auto& pv : padVerts)
        for (auto& v : pv)
          if (v == int(i)) v = alias[i];

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
  for (auto& t : tris)
    for (int i = 0; i < 3; ++i)
      if (t.nb[i] >= 0 && (!tris[t.nb[i]].inside || edges[t.e[i]].constrained)) t.nb[i] = -1;
  for (int ti = 0; ti < int(tris.size()); ++ti)
    if (tris[ti].inside)
      for (int i = 0; i < 3; ++i) verts[tris[ti].v[i]].tris.push_back(ti);
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
