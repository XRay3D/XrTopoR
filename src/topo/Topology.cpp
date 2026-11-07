#include "topo/Topology.h"

#include <algorithm>
#include <cmath>
#include <format>
#include <limits>
#include <map>

#include "topo/Build.h"
#include "topo/Cdt.h"
#include "topo/Sidecar.h"

namespace xr::topo {

namespace {

// Points along a closed or open polyline every `pitch` at most.
std::vector<Vec2> subdivide(const Polyline& pts, bool closed, double pitch) {
  std::vector<Vec2> out;
  size_t n = pts.size(), segs = closed ? n : n - 1;
  for (size_t i = 0; i < segs; ++i) {
    Vec2 a = pts[i], c = pts[(i + 1) % n];
    int parts = std::max(1, int(std::ceil((c - a).len() / pitch)));
    for (int k = 0; k < parts; ++k) out.push_back(a + (c - a) * (double(k) / parts));
  }
  if (!closed) out.push_back(pts.back());
  return out;
}

// The axis and half width of a pad's copper. A capsule or a rectangle has its long axis; a round or
// square pad none; a custom polygon none and its corners as fixed vertices.
void padGeometry(const Shape& s, Owner& o, std::vector<Vec2>& corners) {
  switch (s.kind) {
    case Shape::Kind::Point:
      o.c = s.a;
      o.axis = {};
      o.halfWidth = s.r;
      break;
    case Shape::Kind::Segment:
      o.c = (s.a + s.b) * 0.5;
      o.axis = (s.b - s.a) * 0.5;
      o.halfWidth = s.r;
      break;
    case Shape::Kind::Polygon: {
      Vec2 c{};
      for (Vec2 p : s.poly) c += p;
      o.c = c / double(s.poly.size());
      o.axis = {};
      o.halfWidth = s.r;
      if (s.poly.size() == 4) {
        Vec2 d0 = s.poly[1] - s.poly[0], d1 = s.poly[2] - s.poly[1];
        double l0 = d0.len(), l1 = d1.len();
        // A rectangle (opposite sides equal): the long side is the axis, the short one the width.
        bool rect = std::abs((s.poly[3] - s.poly[2]).len() - l0) < 10 && std::abs((s.poly[0] - s.poly[3]).len() - l1) < 10 &&
                    std::abs(d0.dot(d1)) < 1e-3 * l0 * l1;
        if (rect) {
          if (std::abs(l0 - l1) >= 1000) o.axis = (l0 > l1 ? d0 : d1) * 0.5;
          o.halfWidth = std::min(l0, l1) / 2 + s.r;
        }
      }
      // The corners are vertices (the realiser bends round them); the axis says which way the pad lies.
      for (Vec2 p : s.poly) corners.push_back(p - o.c);
      break;
    }
  }
}

}  // namespace

void Topology::assignIds(Board& b) {
  uint32_t next = 1;
  for (const Track& t : b.tracks) next = std::max(next, t.id + 1);
  for (const Via& v : b.vias) next = std::max(next, v.id + 1);
  for (Track& t : b.tracks)
    if (!t.id) t.id = next++;
  for (Via& v : b.vias)
    if (!v.id) v.id = next++;
}

const LayerMesh* Topology::mesh(LayerId layer) const {
  for (const LayerMesh& m : layers)
    if (m.layer == layer) return &m;
  return nullptr;
}

LayerMesh* Topology::mesh(LayerId layer) {
  for (LayerMesh& m : layers)
    if (m.layer == layer) return &m;
  return nullptr;
}

void Topology::placeVertex(LayerMesh& m, int v) const {
  Vertex& x = m.verts[v];
  const Owner& o = owners[x.owner];
  x.p = o.c + o.axis * x.t + x.off;
}

int LayerMesh::locate(Vec2 p) const {
  for (int t = 0; t < int(tris.size()); ++t) {
    const Tri& T = tris[t];
    if (!T.inside) continue;
    Vec2 a = verts[T.v[0]].p, b = verts[T.v[1]].p, c = verts[T.v[2]].p;
    if (orient(a, b, p) >= 0 && orient(b, c, p) >= 0 && orient(c, a, p) >= 0) return t;
  }
  return -1;
}

void Topology::build(const Board& b) {
  owners.clear();
  junctions.clear();
  layers.clear();
  wires.clear();
  crossings.clear();
  violations.clear();
  BuildScratch scratch;
  buildOwners(b, scratch);
  takeViaBars(b);
  takeRules(b);  // before the wires: relayDisplaced searches with the pair rules
  convertWires(b, scratch);  // adds the junction owners, builds the meshes, lays the wires on them
  relayDisplaced(b, scratch);  // the wires drawn through keepouts and cutouts, round them
  boardHash = boardHashOf(b);
}

void Topology::takeViaBars(const Board& b) {
  viaBars.clear();
  const LayerMask cuMask = b.allCopperMask();
  for (const Keepout& k : b.keepouts) {
    if (k.role != Keepout::Role::Route || !k.vias) continue;
    const LayerMask layers = (k.layers ? k.layers : cuMask) & cuMask;
    for (const Shape& s : k.shapes()) viaBars.push_back({layers, s});
  }
}

double Topology::viaBarIntrusion(Vec2 p, double r, LayerMask layers, Vec2* way) const {
  double worst = 0;
  if (way) *way = {};
  for (const ViaBar& bar : viaBars) {
    if (!(bar.layers & layers)) continue;
    const Shape& s = bar.shape;
    double depth;
    Vec2 out;
    if (s.kind == Shape::Kind::Polygon && pointInPolygon(p, s.poly)) {
      // Inside: the distance to the nearest side, the way out towards its foot (the polygon's distance is 0
      // anywhere inside, flat).
      double d = std::numeric_limits<double>::max();
      Vec2 foot;
      for (size_t i = 0, n = s.poly.size(), j = n - 1; i < n; j = i++) {
        Vec2 f = closestPointOnSegment(p, s.poly[j], s.poly[i]);
        if (double x = (f - p).len(); x < d) d = x, foot = f;
      }
      depth = r + s.r + d;
      out = d > 1 ? (foot - p).normalized() : Vec2{0, 1};
    } else {
      depth = r - s.distance(p);
      constexpr double e = 2000;
      out = {s.distance(p + Vec2{e, 0}) - s.distance(p - Vec2{e, 0}), s.distance(p + Vec2{0, e}) - s.distance(p - Vec2{0, e})};
      if (out.len() < 1) out = p - s.center();
      out = out.len() < 1 ? Vec2{0, 1} : out.normalized();
    }
    if (depth > worst) {
      worst = depth;
      if (way) *way = out;
    }
  }
  return worst;
}

void Topology::takeRules(const Board& b) {
  classClr = b.classClearances();
  layerRules = b.layerRules;
  pairRules = b.pairRules;
}

void Topology::buildOwners(const Board& b, BuildScratch& scratch) {
  const LayerMask cuMask = b.allCopperMask();
  std::vector<std::vector<Vec2>>& corners = scratch.corners;
  padOwner.assign(b.pads.size(), -1);
  viaOwner.assign(b.vias.size(), -1);
  auto add = [&](Owner o) {
    owners.push_back(std::move(o));
    corners.emplace_back();
    return int(owners.size() - 1);
  };
  for (int pi = 0; pi < int(b.pads.size()); ++pi) {
    const Pad& p = b.pads[pi];
    Owner o;
    o.kind = Owner::Kind::Pad;
    o.pad = pi;
    o.net = p.net;
    if (!(p.copper & cuMask)) {
      if (p.drill == 0) continue;
      // A hole without copper: nobody's, in everybody's way on every layer.
      o.net = kNoNet;
      o.c = p.pos.v();
      o.halfWidth = p.drill / 2.0;
      o.shape = Shape::circle(o.c, o.halfWidth);
      o.layers = cuMask;
      padOwner[pi] = add(std::move(o));
      continue;
    }
    o.shape = p.shapeGeom();
    o.layers = p.copper & cuMask;
    std::vector<Vec2> cs;
    padGeometry(o.shape, o, cs);
    int id = add(std::move(o));
    corners[id] = std::move(cs);
    padOwner[pi] = id;
  }
  for (int vi = 0; vi < int(b.vias.size()); ++vi) {
    const Via& v = b.vias[vi];
    Owner o;
    o.kind = Owner::Kind::Via;
    o.via = vi;
    o.viaId = v.id;
    o.net = v.net;
    o.c = v.pos.v();
    o.halfWidth = v.diameter / 2.0;
    o.shape = Shape::circle(o.c, o.halfWidth);
    o.layers = v.layers & cuMask;
    o.locked = v.locked;
    viaOwner[vi] = add(std::move(o));
  }
  double viaDia = 0;
  for (const NetClass& nc : b.netClasses) viaDia = std::max(viaDia, double(nc.viaDiameter));
  const double pitch = std::max(1.2 * (viaDia + double(b.maxClearance())), 1.0 * kNmPerMm);
  // The poured zones: a pad of its net whose vertices are its outline, subdivided like the walls, and no
  // centre (one could lie outside an L-shaped outline, in a cutout, on a pad's centre). The owner's shape
  // is the outline; its cutouts are not taken off it (what lies in them lies in the zone).
  scratch.zoneOwner.assign(b.zones.size(), -1);
  for (int zi = 0; zi < int(b.zones.size()); ++zi) {
    const Zone& z = b.zones[zi];
    if (z.filled.empty() || z.outline.size() < 3 || z.layer < 0 || z.layer >= LayerId(b.layers.size()) || !((cuMask >> z.layer) & 1)) continue;
    Owner o;
    o.kind = Owner::Kind::Zone;
    o.zone = zi;
    o.net = z.net;
    o.layers = LayerMask(1) << z.layer;
    o.shape = Shape::polygon(z.outline);
    for (Vec2 p : z.outline) o.c = o.c + p / double(z.outline.size());
    const Vec2 c = o.c;
    std::vector<Vec2> ring;
    for (Vec2 p : subdivide(z.outline, true, pitch)) ring.push_back(p - c);
    const int id = add(std::move(o));
    corners[id] = std::move(ring);
    scratch.zoneOwner[zi] = id;
  }
  // The walls: the outline and its cutouts (the clearance to the board edge is kept from them), the
  // keepouts (no clearance); all subdivided so that the clearance is sampled densely enough.
  auto wall = [&](const Polyline& pts, bool area, bool border, LayerMask layers) {
    WallLoop wl{layers, {}, area, border};
    for (Vec2 p : subdivide(pts, area, pitch)) {
      Owner o;
      o.kind = border ? Owner::Kind::Outline : Owner::Kind::Keepout;
      o.net = border ? kBoardEdge : kNoNet;
      o.c = p;
      o.shape = Shape::circle(p, 0);
      o.layers = layers;
      wl.owners.push_back(add(std::move(o)));
    }
    if (!wl.owners.empty()) scratch.walls.push_back(std::move(wl));
  };
  for (const auto& loop : b.outline) wall(loop, true, true, cuMask);
  if (b.outline.empty()) {
    BBox bb = b.bbox();
    if (bb.valid()) {
      BBox ob = bb.inflated(2 * kNmPerMm);
      wall({{ob.minX, ob.minY}, {ob.maxX, ob.minY}, {ob.maxX, ob.maxY}, {ob.minX, ob.maxY}}, true, true, cuMask);
    }
  }
  for (const Keepout& k : b.keepouts) {
    if (k.role != Keepout::Role::Route || !k.wires) continue;
    LayerMask layers = (k.layers ? k.layers : cuMask) & cuMask;
    for (const Shape& s : k.shapes()) {
      const bool area = s.kind != Shape::Kind::Segment;
      // (A round keepout as a polygon within 1 um of the circle: the DRC measures against the circle itself,
      // and a wire along a chord 30 um inside it was 30 um into the keepout.)
      wall(s.kind == Shape::Kind::Polygon ? s.poly
           : s.kind == Shape::Kind::Point ? s.outline(1000.0)
                                          : Polyline{s.a, s.b},
           area, false, layers);
    }
  }
}

void Topology::buildMeshes(const Board& b, BuildScratch& scratch) {
  const std::vector<std::vector<Vec2>>& corners = scratch.corners;
  const std::vector<WallLoop>& walls = scratch.walls;
  auto add = [&](Owner o) {
    owners.push_back(std::move(o));
    scratch.corners.emplace_back();
    return int(owners.size() - 1);
  };
  layers.clear();
  // One mesh per copper layer, of the owners on it.
  for (LayerId layer : b.copperLayers()) {
    LayerMesh m;
    m.layer = layer;
    m.ownerVerts.assign(owners.size(), {});
    CdtInput in;
    auto vertex = [&](int owner, double t, Vec2 off) {
      Vertex x;
      x.owner = owner;
      x.t = t;
      x.off = off;
      m.verts.push_back(x);
      int v = int(m.verts.size() - 1);
      placeVertex(m, v);
      in.points.push_back(m.verts[v].p);
      m.ownerVerts[owner].push_back(v);
      return v;
    };
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[oi];
      if (!((o.layers >> layer) & 1)) continue;
      const bool hasCorners = oi < int(corners.size()) && !corners[oi].empty();
      // An oval has its two ends (the realiser's points; from a centre, an edge leaving at a slant would
      // put the slot nearer the side than the rule), a polygon its centre and its corners, the rest their
      // centre.
      if (o.kind == Owner::Kind::Pad && o.axis.len2() > 0 && !hasCorners && o.shape.kind == Shape::Kind::Segment) {
        int a = vertex(oi, -1, {}), c = vertex(oi, 1, {});
        in.constraints.push_back({a, c});
        in.border.push_back(2);
        continue;
      }
      if (o.kind != Owner::Kind::Zone) vertex(oi, 0, {});
      if (hasCorners) {
        std::vector<int> ring;
        for (Vec2 c : corners[oi]) ring.push_back(vertex(oi, 0, c));
        for (size_t k = 0; k < ring.size(); ++k) {
          in.constraints.push_back({ring[k], ring[(k + 1) % ring.size()]});
          in.border.push_back(2);
        }
      }
    }
    auto only = [&](int owner) { return m.ownerVerts[owner].front(); };
    for (const WallLoop& wl : walls) {
      if (!((wl.layers >> layer) & 1)) continue;
      for (size_t i = 0; i + 1 < wl.owners.size(); ++i) {
        in.constraints.push_back({only(wl.owners[i]), only(wl.owners[i + 1])});
        in.border.push_back(wl.border ? 1 : 0);
      }
      if (wl.area && wl.owners.size() > 2) {
        in.constraints.push_back({only(wl.owners.back()), only(wl.owners.front())});
        in.border.push_back(wl.border ? 1 : 0);
      }
    }
    CdtResult r = triangulate(in);
    // Points the constraints' intersections created: a zone's vertex where it lies on the zone's ring and
    // on no wall (a pad's corner ring across the pour's boundary), else an outline owner of this layer.
    auto onWall = [&](Vec2 p) {
      for (const WallLoop& wl : walls) {
        if (!((wl.layers >> layer) & 1)) continue;
        for (size_t i = 0; i < wl.owners.size(); ++i) {
          if (i + 1 == wl.owners.size() && !wl.area) break;
          if (distPointSegment(p, owners[wl.owners[i]].c, owners[wl.owners[(i + 1) % wl.owners.size()]].c) < 10) return true;
        }
      }
      return false;
    };
    auto zoneRingAt = [&](Vec2 p) {
      for (int oi = 0; oi < int(owners.size()); ++oi) {
        const Owner& o = owners[oi];
        if (o.kind != Owner::Kind::Zone || !((o.layers >> layer) & 1) || oi >= int(corners.size())) continue;
        const std::vector<Vec2>& ring = corners[oi];
        for (size_t i = 0; i < ring.size(); ++i)
          if (distPointSegment(p, o.c + ring[i], o.c + ring[(i + 1) % ring.size()]) < 10) return oi;
      }
      return -1;
    };
    for (Vec2 p : r.extra) {
      if (int zo = onWall(p) ? -1 : zoneRingAt(p); zo >= 0) {
        vertex(zo, 0, p - owners[zo].c);
        continue;
      }
      Owner o;
      o.kind = Owner::Kind::Outline;
      o.net = kBoardEdge;
      o.c = p;
      o.shape = Shape::circle(p, 0);
      o.layers = LayerMask(1) << layer;
      int id = add(std::move(o));
      m.ownerVerts.emplace_back();
      vertex(id, 0, {});
    }
    // Coincident points: the vertex that stayed stands for both; of two pads there (a connector drawn
    // as two parts, one without nets) the one with a net owns it, or its own net could not reach it.
    for (size_t i = 0; i < r.alias.size(); ++i) {
      if (r.alias[i] < 0) continue;
      int keep = r.alias[i];
      Vertex& mine = m.verts[i];
      Vertex& theirs = m.verts[keep];
      if (owners[theirs.owner].net == kNoNet && owners[mine.owner].net != kNoNet) {
        theirs.owner = mine.owner;
        theirs.t = mine.t;
        theirs.off = mine.off;
      }
      for (auto& list : m.ownerVerts)
        for (int& v : list)
          if (v == int(i)) v = keep;
    }
    for (const CdtTri& ct : r.tris) {
      Tri t;
      for (int i = 0; i < 3; ++i) t.v[i] = ct.v[i];
      t.inside = ct.inside;
      m.tris.push_back(t);
    }
    for (const CdtEdge& ce : r.edges) {
      Edge e;
      e.v[0] = ce.v[0];
      e.v[1] = ce.v[1];
      e.constrained = ce.constrained;
      e.rigid = ce.rigid;
      m.edges.push_back(e);
    }
    for (int ti = 0; ti < int(m.tris.size()); ++ti) {
      Tri& t = m.tris[ti];
      for (int i = 0; i < 3; ++i) {
        int e = r.triEdges[ti][i];
        t.e[i] = e;
        Edge& me = m.edges[e];
        if (me.t[0] < 0) me.t[0] = ti;
        else me.t[1] = ti;
        int n = r.tris[ti].nb[i];
        t.nb[i] = n >= 0 && m.tris.size() > size_t(n) ? n : -1;
      }
    }
    for (Tri& t : m.tris)
      for (int i = 0; i < 3; ++i)
        if (t.nb[i] >= 0 && (!m.tris[t.nb[i]].inside || m.edges[t.e[i]].constrained)) t.nb[i] = -1;
    for (Edge& e : m.edges) e.rigid |= m.verts[e.v[0]].owner == m.verts[e.v[1]].owner;
    for (const WallLoop& wl : walls) {
      if (wl.border || !wl.area || !((wl.layers >> layer) & 1)) continue;  // a keepout area: its triangles are blocked (a cutout's are outside)
      Polyline poly;
      for (int o : wl.owners) poly.push_back(owners[o].c);
      for (Tri& t : m.tris)
        if (t.inside && pointInPolygon((m.verts[t.v[0]].p + m.verts[t.v[1]].p + m.verts[t.v[2]].p) / 3.0, poly)) t.blocked = true;
    }
    // The triangles of a pour, by their centroids in its ring (the first zone wins where two overlap).
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[oi];
      if (o.kind != Owner::Kind::Zone || !((o.layers >> layer) & 1)) continue;
      Polyline poly;
      for (Vec2 c : corners[oi]) poly.push_back(o.c + c);
      for (Tri& t : m.tris)
        if (t.inside && t.zone < 0 && pointInPolygon((m.verts[t.v[0]].p + m.verts[t.v[1]].p + m.verts[t.v[2]].p) / 3.0, poly)) t.zone = oi;
    }
    for (int ti = 0; ti < int(m.tris.size()); ++ti)
      if (m.tris[ti].inside)
        for (int i = 0; i < 3; ++i) m.verts[m.tris[ti].v[i]].tris.push_back(ti);
    m.ownerClr.resize(owners.size());
    for (int oi = 0; oi < int(owners.size()); ++oi) {
      const Owner& o = owners[oi];
      m.ownerClr[oi] = o.kind == Owner::Kind::Outline ? double(b.edgeClearance)
                       : o.kind == Owner::Kind::Keepout ? 0.0
                       : o.kind == Owner::Kind::Zone ? std::max(double(b.zones[o.zone].clearance), double(b.clearance(o.net, layer)))
                                                     : double(b.clearance(o.net, layer));
    }
    layers.push_back(std::move(m));
  }
}

int Topology::nearestVertex(const LayerMesh& m, int owner, Vec2 p) const {
  int best = -1;
  double bd = std::numeric_limits<double>::max();
  for (int v : m.ownerVerts[owner])
    if (double d = (m.verts[v].p - p).len2(); d < bd) {
      bd = d;
      best = v;
    }
  return best;
}

std::vector<std::string> Topology::check() const {
  std::vector<std::string> bad;
  auto fail = [&](const LayerMesh& m, std::string what) {
    if (bad.size() < 50) bad.push_back(std::format("layer {}: {}", m.layer, what));
  };
  for (const LayerMesh& m : layers) {
    for (int ti = 0; ti < int(m.tris.size()); ++ti) {
      const Tri& t = m.tris[ti];
      if (m.dead(ti)) continue;
      if (t.inside && orient(m.verts[t.v[0]].p, m.verts[t.v[1]].p, m.verts[t.v[2]].p) <= 0) fail(m, std::format("triangle {} is not counter-clockwise", ti));
      for (int i = 0; i < 3; ++i) {
        int e = t.e[i];
        if (e < 0 || e >= int(m.edges.size())) { fail(m, std::format("triangle {} has no edge {}", ti, i)); continue; }
        const Edge& E = m.edges[e];
        auto [lo, hi] = std::minmax(t.v[(i + 1) % 3], t.v[(i + 2) % 3]);
        if (E.v[0] != lo || E.v[1] != hi) fail(m, std::format("edge {} of triangle {} joins other vertices", e, ti));
        if (E.t[0] != ti && E.t[1] != ti) fail(m, std::format("edge {} does not know triangle {}", e, ti));
        int n = t.nb[i];
        if (n >= 0) {
          const Tri& N = m.tris[n];
          int back = m.localEdge(n, e);
          if (back < 0 || N.nb[back] != ti) fail(m, std::format("triangles {} and {} disagree about edge {}", ti, n, e));
          if (!t.inside || !N.inside) fail(m, std::format("outside triangle {} has a neighbour", ti));
        } else if (t.inside && !E.constrained) {
          int other = E.t[0] == ti ? E.t[1] : E.t[0];
          if (other >= 0 && m.tris[other].inside) fail(m, std::format("triangle {} ignores its neighbour {} across edge {}", ti, other, e));
        }
        if (t.inside && !std::ranges::contains(m.verts[t.v[i]].tris, ti)) fail(m, std::format("vertex {} does not list triangle {}", t.v[i], ti));
      }
    }
    for (int v = 0; v < int(m.verts.size()); ++v)
      for (int ti : m.verts[v].tris)
        if (m.localVertex(ti, v) < 0 || !m.tris[ti].inside) fail(m, std::format("vertex {} lists triangle {} it is not in", v, ti));
    // The edges' crossing lists agree with the crossings.
    for (int e = 0; e < int(m.edges.size()); ++e)
      for (int cid : m.edges[e].cross) {
        if (cid < 0 || cid >= int(crossings.size()) || crossings[cid].edge != e) { fail(m, std::format("edge {} lists crossing {} of another edge", e, cid)); continue; }
        const Wire& w = wires[crossings[cid].wire];
        if (w.layer != m.layer) fail(m, std::format("edge {} carries wire {} of another layer", e, crossings[cid].wire));
        if (crossings[cid].idx < 0 || crossings[cid].idx >= int(w.cross.size()) || w.cross[crossings[cid].idx] != cid)
          fail(m, std::format("crossing {} is not where wire {} says", cid, crossings[cid].wire));
      }
  }
  // The wires: every consecutive pair of crossings on one triangle, the first and the last next to the
  // end owners' vertices.
  for (int wi = 0; wi < int(wires.size()); ++wi) {
    const Wire& w = wires[wi];
    const LayerMesh* mp = mesh(w.layer);
    if (!mp) { bad.push_back(std::format("wire {} on no layer", wi)); continue; }
    const LayerMesh& m = *mp;
    auto triOwner = [&](int t, int owner) {
      if (t < 0) return false;
      for (int i = 0; i < 3; ++i)
        if (m.verts[m.tris[t].v[i]].owner == owner) return true;
      return false;
    };
    for (size_t k = 0; k < w.cross.size(); ++k) {
      int cid = w.cross[k];
      if (cid < 0 || cid >= int(crossings.size()) || crossings[cid].wire != wi) { bad.push_back(std::format("wire {} lists crossing {} that is not its", wi, cid)); break; }
      const Edge& E = m.edges[crossings[cid].edge];
      if (!std::ranges::contains(E.cross, cid)) bad.push_back(std::format("edge {} does not list crossing {} of wire {}", crossings[cid].edge, cid, wi));
      if (k + 1 < w.cross.size()) {
        const Edge& N = m.edges[crossings[w.cross[k + 1]].edge];
        bool share = (E.t[0] >= 0 && (E.t[0] == N.t[0] || E.t[0] == N.t[1])) || (E.t[1] >= 0 && (E.t[1] == N.t[0] || E.t[1] == N.t[1]));
        if (!share) bad.push_back(std::format("wire {}: crossings {} and {} share no triangle", wi, k, k + 1));
      }
      if (k == 0 && !triOwner(E.t[0], w.end[0]) && !triOwner(E.t[1], w.end[0])) bad.push_back(std::format("wire {} does not start at its end owner", wi));
      if (k + 1 == w.cross.size() && !triOwner(E.t[0], w.end[1]) && !triOwner(E.t[1], w.end[1])) bad.push_back(std::format("wire {} does not end at its end owner", wi));
    }
  }
  return bad;
}

}  // namespace xr::topo
