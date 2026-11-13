#include "topo/Topology.h"

#include <algorithm>
#include <unordered_set>
#include <cmath>
#include <cstdlib>
#include <format>
#include <limits>
#include <map>
#include <print>
#include <span>

#include "core/BoxGrid.h"
#include "core/Parallel.h"
#include "core/SpatialIndex.h"
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

// The least room a wire of any net takes between copper of two nets on a layer: its least width and its clearance
// to each of the two (none to its own net).
struct Passage {
  const Board& b;
  LayerId layer;
  std::vector<std::pair<Coord, Coord>> kinds;  // the nets' (own clearance, least width), the distinct clearances
  Coord most = 0;                              // no passage is wider than this

  Passage(const Board& board, LayerId l) : b(board), layer(l) {
    std::map<Coord, Coord> byClr;
    auto take = [&](int n) {
      const Coord own = b.clearance(n, layer), w = std::min(b.trackWidth(n, layer), b.minTrackWidth(n, layer));
      auto [it, isNew] = byClr.emplace(own, w);
      if (!isNew) it->second = std::min(it->second, w);
    };
    for (int n = 0; n < int(b.nets.size()); ++n) take(n);
    if (b.nets.empty()) take(kNoNet);
    kinds.assign(byClr.begin(), byClr.end());
    for (auto [own, w] : kinds) most = std::max(most, w);
    most += 2 * b.maxClearance();
  }
  Coord leastWidth(int n) const { return std::min(b.trackWidth(n, layer), b.minTrackWidth(n, layer)); }
  double least(int netA, int netB) const {
    double best = std::numeric_limits<double>::max();
    if (!b.pairRules.empty()) {  // (a rule for two nets may ask for less than either's own)
      for (int n = 0; n < int(b.nets.size()); ++n)
        best = std::min(best, double(leastWidth(n) + (n == netA ? 0 : b.clearance(n, netA, layer)) + (n == netB ? 0 : b.clearance(n, netB, layer))));
      return best;
    }
    const Coord ownA = b.clearance(netA, layer), ownB = b.clearance(netB, layer);
    for (auto [own, w] : kinds) best = std::min(best, double(w + std::max(own, ownA) + std::max(own, ownB)));
    if (netA >= 0) best = std::min(best, double(leastWidth(netA) + (netA == netB ? 0 : std::max(ownA, ownB))));
    if (netB >= 0) best = std::min(best, double(leastWidth(netB) + (netA == netB ? 0 : std::max(ownA, ownB))));
    return best;
  }
};

// Whether two segments cross at a point inside both (ends touching do not count).
bool crossInside(Vec2 a, Vec2 b, Vec2 c, Vec2 d) {
  const double o1 = orient(a, b, c), o2 = orient(a, b, d), o3 = orient(c, d, a), o4 = orient(c, d, b);
  return ((o1 > 0) != (o2 > 0)) && ((o3 > 0) != (o4 > 0)) && o1 != 0 && o2 != 0 && o3 != 0 && o4 != 0;
}

// A component's pads with no room for any wire between them are one body: the mesh gets rigid edges from one to
// the other (the user's thought: «объединение рядных контактов в один многоугольник» — the pads stay owners each
// of its net, the wires end at their vertices; what they share is the edges between them, which no flip takes and
// no vertex passes). A row of an IC's pads is then a wall: a via or another component's pad dragged at it stops at
// the row instead of sinking in between two pads, where no wire could follow it; and the flips have nothing to do
// inside a component that is moved. The pads move together (moveOwners), so the edges stay as long as they were.
// The rule alone decides, not what is drawn: a wire that does lie there crosses the edges as it crosses any
// (they are rigid, not walls), and is short of room as it was.
void padWalls(const Board& b, LayerId layer, const std::vector<Owner>& owners, const std::vector<int>& padOwner, const LayerMesh& m, const SpatialIndex& idx,
              CdtInput& in, int& made) {
  const Passage passage(b, layer);
  const LayerMask mask = LayerMask(1) << layer;
  struct P {
    int pad, owner;
    Shape shape;
    BBox box;
  };
  std::vector<P> ps;
  for (const Component& comp : b.components) {
    ps.clear();
    for (int pi : comp.pads) {
      if (pi < 0 || pi >= int(padOwner.size()) || padOwner[size_t(pi)] < 0 || !b.pads[size_t(pi)].onLayer(layer)) continue;
      const int oi = padOwner[size_t(pi)];
      if (oi >= int(m.ownerVerts.size()) || m.ownerVerts[size_t(oi)].empty()) continue;
      ps.push_back({pi, oi, owners[size_t(oi)].shape, owners[size_t(oi)].shape.bbox()});
    }
    if (ps.size() < 2) continue;
    std::vector<std::pair<Vec2, Vec2>> walls;  // of this component, so far
    // (The vertices a wall may start at: a polygon's corners — its centre lies behind its own sides —, an oval's two
    // ends, a round pad's centre.)
    auto vertsOf = [&](const P& x) {
      std::span<const int> vs(m.ownerVerts[size_t(x.owner)]);
      return vs.size() > 2 ? vs.subspan(1) : vs;
    };
    auto ringCrossed = [&](const P& x, Vec2 p, Vec2 q) {
      const std::span<const int> vs(m.ownerVerts[size_t(x.owner)]);
      if (vs.size() <= 2) return false;
      const std::span<const int> ring = vs.subspan(1);
      for (size_t k = 0; k < ring.size(); ++k)
        if (crossInside(p, q, m.verts[size_t(ring[k])].p, m.verts[size_t(ring[(k + 1) % ring.size()])].p)) return true;
      return false;
    };
    for (size_t i = 0; i < ps.size(); ++i)
      for (size_t j = i + 1; j < ps.size(); ++j) {
        const P& A = ps[i];
        const P& B = ps[j];
        if (!A.box.inflated(double(passage.most)).intersects(B.box)) continue;
        const double gap = A.shape.distance(B.shape);
        if (gap >= passage.least(b.pads[size_t(A.pad)].net, b.pads[size_t(B.pad)].net)) continue;
        struct Cand {
          double len;
          int va, vb;
        };
        std::vector<Cand> cands;
        for (int va : vertsOf(A))
          for (int vb : vertsOf(B)) cands.push_back({(m.verts[size_t(va)].p - m.verts[size_t(vb)].p).len(), va, vb});
        r::sort(cands, {}, &Cand::len);
        // The two sides of the gap: the nearest pair of vertices, and the next one of other vertices not much
        // longer (two pads face to face have two; a pad cornerwise to another has the one).
        std::vector<Cand> taken;
        for (const Cand& c : cands) {
          if (!taken.empty() && (c.va == taken.front().va || c.vb == taken.front().vb || c.len > 1.5 * taken.front().len + 1000)) continue;
          const Vec2 p = m.verts[size_t(c.va)].p, q = m.verts[size_t(c.vb)].p;
          if (c.len < 1 || ringCrossed(A, p, q) || ringCrossed(B, p, q)) continue;
          if (r::any_of(walls, [&](const auto& w) { return crossInside(p, q, w.first, w.second); })) continue;
          // Nothing else's copper on the line: a via or a third pad standing in the gap would be a vertex of the wall.
          bool clear = true;
          BBox box;
          box.add(p);
          box.add(q);
          idx.query(box.inflated(1000), mask, [&](ItemRef ref) {
            if (!clear || ref.type == ItemType::Track || ref.type == ItemType::Zone) return;
            if (ref.type == ItemType::Pad && (ref.index == A.pad || ref.index == B.pad)) return;
            for (const Shape& sh : itemShapes(b, ref))
              if (sh.distanceToSegment(p, q) <= 0) clear = false;
          });
          if (!clear) continue;
          taken.push_back(c);
          if (taken.size() == 2) break;
        }
        for (const Cand& c : taken) {
          in.constraints.push_back({c.va, c.vb});
          in.border.push_back(2);
          walls.push_back({m.verts[size_t(c.va)].p, m.verts[size_t(c.vb)].p});
          ++made;
        }
      }
  }
}

}  // namespace

void Topology::assignIds(Board& b) {
  uint32_t next = 1;
  for (const Track& t : b.tracks) next = std::max(next, t.id + 1);
  for (const Via& v : b.vias) next = std::max(next, v.id + 1);
  // A new id for every track and via without one and for the second of two with one id (each names one piece
  // of copper to the model's wires and owners).
  std::unordered_set<uint32_t> seen;
  for (Track& t : b.tracks)
    if (!t.id || !seen.insert(t.id).second) t.id = next++;
  for (Via& v : b.vias)
    if (!v.id || !seen.insert(v.id).second) v.id = next++;
}

void Topology::translate(Vec2 d) {
  auto shift = [&](Shape& sh) {
    sh.a = sh.a + d;
    sh.b = sh.b + d;
    for (Vec2& p : sh.poly) p = p + d;
  };
  for (Owner& o : owners) {
    o.c = o.c + d;
    shift(o.shape);
  }
  for (LayerMesh& m : layers)
    for (Vertex& v : m.verts) v.p = v.p + d;
  for (Junction& j : junctions) j.pos = j.pos + d;
  for (Wire& w : wires)
    for (Vec2& e : w.exit) e = e + d;
  for (Violation& v : violations) v.pos = v.pos + d;
  for (ViaBar& vb : viaBars) shift(vb.shape);
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
  netPair = b.netPair;
}

int Topology::netAt(const LayerMesh& m, int v) const {
  const Vertex& x = m.verts[size_t(v)];
  const Owner& o = owners[size_t(x.owner)];
  return o.kind == Owner::Kind::Clasp && x.t < 0 ? o.net2 : o.net;
}

bool Topology::own(const LayerMesh& m, int v, const Wire& w) const {
  const Vertex& x = m.verts[size_t(v)];
  const Owner& o = owners[size_t(x.owner)];
  if (o.kind == Owner::Kind::Clasp) {
    if (w.pair >= 0) return w.pair == o.pair;  // the pair's wire: all three
    if (netAt(m, v) == w.net && w.net != kNoNet) return true;  // a single wire: its own end
    // ... and the centre between (the pair's axis, no copper of the other net)
    return x.t == 0 && w.net >= 0 && w.net < int(netPair.size()) && netPair[size_t(w.net)] == o.pair;
  }
  if (w.pair >= 0 && o.net >= 0 && o.net < int(netPair.size()) && netPair[size_t(o.net)] == w.pair) return true;
  return o.net == w.net && w.net != kNoNet;
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
  // One mesh per copper layer, of the owners on it: the vertices and the constraints of every layer first, then
  // the triangulations — each layer's own business, all at once — then what is made of each in turn (the points
  // the constraints' crossings created become owners, numbered layer after layer).
  const auto copper = b.copperLayers();
  std::vector<LayerMesh> meshes(copper.size());
  std::vector<CdtInput> inputs(copper.size());
  std::vector<CdtResult> results(copper.size());
  auto vertexIn = [&](LayerMesh& m, CdtInput& in, int owner, double t, Vec2 off) {
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
  SpatialIndex copperIdx;  // the pads and the vias: what may stand between two pads of a component
  copperIdx.build(b, false, false);
  int padWallsMade = 0;
  for (size_t li = 0; li < copper.size(); ++li) {
    const LayerId layer = copper[li];
    LayerMesh& m = meshes[li];
    m.layer = layer;
    m.ownerVerts.assign(owners.size(), {});
    CdtInput& in = inputs[li];
    auto vertex = [&](int owner, double t, Vec2 off) { return vertexIn(m, in, owner, t, off); };
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
      if (o.kind == Owner::Kind::Clasp) {  // the two conductors' ends and the centre between, rigid
        int a = vertex(oi, -1, {}), m0 = vertex(oi, 0, {}), c = vertex(oi, 1, {});
        in.constraints.push_back({a, m0});
        in.border.push_back(2);
        in.constraints.push_back({m0, c});
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
    if (static const bool off = std::getenv("XR_NO_PAD_WALLS") != nullptr; !off) padWalls(b, layer, owners, padOwner, m, copperIdx, in, padWallsMade);
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
  }
  if (static const bool debug = std::getenv("XR_TOPO_DEBUG") != nullptr; debug) std::println(stderr, "{} rigid edges between pads of one component", padWallsMade);
  parallelFor(copper.size(), [&](size_t li) { results[li] = triangulate(inputs[li]); });
  for (size_t li = 0; li < copper.size(); ++li) {
    const LayerId layer = copper[li];
    LayerMesh& m = meshes[li];
    m.ownerVerts.resize(owners.size());  // (the layers before made owners of their own)
    CdtInput& in = inputs[li];
    const CdtResult& r = results[li];
    auto vertex = [&](int owner, double t, Vec2 off) { return vertexIn(m, in, owner, t, off); };
    // Points the constraints' intersections created: a zone's vertex where it lies on the zone's ring and
    // on no wall (a pad's corner ring across the pour's boundary), else an outline owner of this layer.
    // (The walls' pieces and the zones' rings in grids by their boxes, made when the first such point asks: every
    // point against every piece of every wall and ring was a sixteenth of F6 on a board with pours.)
    struct Pieces {
      std::vector<std::pair<Vec2, Vec2>> segs;
      std::vector<int> owner;  // (of a ring's piece)
      BoxGrid grid;
      std::vector<int> near;
      bool made = false;
      void index() {
        made = true;
        std::vector<BBox> boxes(segs.size());
        for (size_t i = 0; i < segs.size(); ++i) {
          boxes[i].add(segs[i].first);
          boxes[i].add(segs[i].second);
          boxes[i] = boxes[i].inflated(10);
        }
        grid.build(std::move(boxes));
      }
      // The first piece within 10 nm of the point, -1: none.
      int at(Vec2 p) {
        BBox q;
        q.add(p);
        grid.query(q, near);
        for (int i : near)
          if (distPointSegment(p, segs[size_t(i)].first, segs[size_t(i)].second) < 10) return i;
        return -1;
      }
    } wallPieces, ringPieces;
    auto onWall = [&](Vec2 p) {
      if (!wallPieces.made) {
        for (const WallLoop& wl : walls) {
          if (!((wl.layers >> layer) & 1)) continue;
          for (size_t i = 0; i < wl.owners.size(); ++i) {
            if (i + 1 == wl.owners.size() && !wl.area) break;
            wallPieces.segs.push_back({owners[wl.owners[i]].c, owners[wl.owners[(i + 1) % wl.owners.size()]].c});
          }
        }
        wallPieces.index();
      }
      return wallPieces.at(p) >= 0;
    };
    auto zoneRingAt = [&](Vec2 p) {  // (the first zone, by its number, with a piece there)
      if (!ringPieces.made) {
        for (int oi = 0; oi < int(owners.size()); ++oi) {
          const Owner& o = owners[oi];
          if (o.kind != Owner::Kind::Zone || !((o.layers >> layer) & 1) || oi >= int(corners.size())) continue;
          const std::vector<Vec2>& ring = corners[oi];
          for (size_t i = 0; i < ring.size(); ++i) {
            ringPieces.segs.push_back({o.c + ring[i], o.c + ring[(i + 1) % ring.size()]});
            ringPieces.owner.push_back(oi);
          }
        }
        ringPieces.index();
      }
      const int i = ringPieces.at(p);
      return i < 0 ? -1 : ringPieces.owner[size_t(i)];
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
                       : o.kind == Owner::Kind::Zone ? double(b.zoneClearance(b.zones[o.zone]))
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
        if (t.inside && !r::contains(m.verts[t.v[i]].tris, ti)) fail(m, std::format("vertex {} does not list triangle {}", t.v[i], ti));
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
      if (!r::contains(E.cross, cid)) bad.push_back(std::format("edge {} does not list crossing {} of wire {}", crossings[cid].edge, cid, wi));
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
