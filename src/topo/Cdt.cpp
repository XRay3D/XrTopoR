#include "topo/Cdt.h"

#include <CGAL/Constrained_Delaunay_triangulation_2.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Triangulation_face_base_with_info_2.h>
#include <CGAL/Triangulation_vertex_base_with_info_2.h>

#include <list>
#include <map>
#include <set>

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

// Domains are separated by the border constraints only; the other constraints are walls inside them.
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

CdtResult triangulate(const CdtInput& in) {
  CdtResult out;
  CDT cdt;
  std::vector<CDT::Vertex_handle> handles(in.points.size());
  out.alias.assign(in.points.size(), -1);
  CDT::Face_handle hint;
  for (size_t i = 0; i < in.points.size(); ++i) {
    size_t before = cdt.number_of_vertices();
    auto vh = cdt.insert(CPoint(in.points[i].x, in.points[i].y), hint);
    hint = vh->face();
    if (cdt.number_of_vertices() > before) vh->info() = int(i);
    else out.alias[i] = vh->info();  // duplicate point
    handles[i] = vh;
  }
  for (auto [a, c] : in.constraints)
    if (handles[a] != handles[c]) cdt.insert_constraint(handles[a], handles[c]);
  // Constraint intersections may create new vertices.
  for (auto v = cdt.finite_vertices_begin(); v != cdt.finite_vertices_end(); ++v) {
    int id = v->info();
    if (id >= 0 && id < int(handles.size()) && handles[id] == CDT::Vertex_handle(v)) continue;
    v->info() = int(in.points.size() + out.extra.size());
    out.extra.push_back({v->point().x(), v->point().y()});
  }
  // The border pieces: constrained edges lying on a border constraint.
  std::vector<std::pair<Vec2, Vec2>> contour;
  for (size_t k = 0; k < in.constraints.size(); ++k)
    if (k < in.border.size() && in.border[k]) contour.push_back({in.points[in.constraints[k].first], in.points[in.constraints[k].second]});
  const bool allBorder = contour.size() == in.constraints.size();
  auto onBorder = [&](Vec2 p, Vec2 q) {
    if (allBorder) return true;
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
    auto [p, q] = edgePts(e);
    return onBorder(p, q);
  });
  for (auto f = cdt.finite_faces_begin(); f != cdt.finite_faces_end(); ++f) {
    f->info().id = int(out.tris.size());
    CdtTri t;
    for (int i = 0; i < 3; ++i) t.v[i] = f->vertex(i)->info();
    t.inside = (f->info().nesting % 2) == 1;
    out.tris.push_back(t);
  }
  std::map<std::pair<int, int>, int> edgeIdx;
  out.triEdges.resize(out.tris.size());
  for (auto f = cdt.finite_faces_begin(); f != cdt.finite_faces_end(); ++f) {
    int ti = f->info().id;
    CdtTri& t = out.tris[ti];
    for (int i = 0; i < 3; ++i) {
      auto n = f->neighbor(i);
      t.nb[i] = cdt.is_infinite(n) ? -1 : n->info().id;
      auto key = std::minmax(t.v[(i + 1) % 3], t.v[(i + 2) % 3]);
      auto it = edgeIdx.find(key);
      int e;
      if (it == edgeIdx.end()) {
        e = int(out.edges.size());
        out.edges.push_back({{key.first, key.second}, cdt.is_constrained(CDT::Edge(f, i))});
        edgeIdx[key] = e;
      } else {
        e = it->second;
      }
      out.triEdges[ti][i] = e;
    }
  }
  return out;
}

}  // namespace xr::topo
