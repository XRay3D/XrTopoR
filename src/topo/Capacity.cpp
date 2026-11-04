#include "topo/Capacity.h"

#include <algorithm>

namespace xr::topo {

namespace {

// The crossing wire sees the owner as copper to keep away from: another net's (own copper is
// transparent, the centre line may pass through the point itself).
bool foreign(const Owner& o, const Wire& w) { return o.net != w.net || w.net == kNoNet; }

}  // namespace

EdgeCapacity edgeCapacity(const Topology& t, const LayerMesh& m, int e) {
  const Edge& E = m.edges[e];
  std::vector<int> ws;
  for (int cid : E.cross) ws.push_back(t.crossings[cid].wire);
  return capacityOf(t, m, E.v[0], E.v[1], ws, E.along);
}

EdgeCapacity capacityOf(const Topology& t, const LayerMesh& m, int va, int vb, const std::vector<int>& ws, int along) {
  EdgeCapacity c;
  const Vertex& U = m.verts[va];
  const Vertex& V = m.verts[vb];
  const Owner& ou = t.owners[U.owner];
  const Owner& ov = t.owners[V.owner];
  c.L = (V.p - U.p).len();
  Vec2 dir = c.L > 0 ? (V.p - U.p) / c.L : Vec2{};
  c.reachU = std::max(0.0, ou.shape.rayExit(U.p, dir));
  c.reachV = std::max(0.0, ov.shape.rayExit(V.p, dir * -1.0));
  if (U.owner == V.owner) c.reachU = c.reachV = c.L / 2;  // inside one owner: no room for anybody else
  if (along >= 0 && !ws.empty() && t.wires[ws[0]].net != t.wires[along].net)
    c.reachU = c.reachV = c.L / 2;  // a wire runs along it: no room for another net across
  c.freeLen = c.L - c.reachU - c.reachV;
  const int n = int(ws.size());
  c.a.assign(n, 0);
  c.b.assign(n, 0);
  c.width.resize(n);
  for (int k = 0; k < n; ++k) c.width[k] = double(t.wires[ws[k]].width);
  if (n == 0) {
    c.cls = 0;
    return c;
  }
  const double clrU = m.ownerClr[U.owner], clrV = m.ownerClr[V.owner];
  auto wireOf = [&](int k) -> const Wire& { return t.wires[ws[k]]; };
  // The stack from each end: the k-th wire sits on the (k-1)-th, never nearer the owner than its own
  // rule allows.
  auto pack = [&](double margin) {
    // Own copper is no obstacle; on an edge inside the own pad (its perimeter, a spoke) the wire still keeps
    // half its width off the corners: at the corner itself the track would leave the copper, and a track
    // through a vertex sends the next conversion's walk astray (arz_4L: into the neighbouring pad).
    const bool inside = U.owner == V.owner;
    auto need = [&](const Owner& o, double reach, double clrO, const Wire& w, double width) {
      if (!foreign(o, w)) return inside ? width / 2.0 : 0.0;
      return reach + std::max(clrO, double(w.clr)) + margin + width / 2.0;
    };
    for (int k = 0; k < n; ++k) {
      const Wire& w = wireOf(k);
      double own = need(ou, c.reachU, clrU, w, c.width[k]);
      if (k == 0) c.a[k] = own;
      else {
        double spacing = c.width[k - 1] / 2 + std::max(double(wireOf(k - 1).clr), double(w.clr)) + margin + c.width[k] / 2;
        c.a[k] = std::max(c.a[k - 1] + spacing, own);
      }
    }
    for (int k = n - 1; k >= 0; --k) {
      const Wire& w = wireOf(k);
      double own = need(ov, c.reachV, clrV, w, c.width[k]);
      if (k == n - 1) c.b[k] = own;
      else {
        double spacing = c.width[k + 1] / 2 + std::max(double(wireOf(k + 1).clr), double(w.clr)) + margin + c.width[k] / 2;
        c.b[k] = std::max(c.b[k + 1] + spacing, own);
      }
    }
    c.need = c.a[n - 1] + c.b[n - 1];
    double slack = c.L - c.need;
    return slack < 0 && slack > -1.0 ? 0.0 : slack;  // a nanometre of rounding is no shortfall
  };
  c.margin = true;
  c.slack = pack(kCapacityMargin);
  if (c.slack <= 0) {
    // No room for the nominal widths: the wires that may be narrowed are, on this edge.
    for (int k = 0; k < n; ++k) {
      const Wire& w = wireOf(k);
      if (w.widthMin > 0 && w.widthMin < w.width) {
        c.width[k] = double(w.widthMin);
        c.narrowed = true;
      }
    }
    if (c.narrowed) c.slack = pack(kCapacityMargin);
  }
  if (c.slack < 0 && c.slack > -2.0 * kCapacityMargin * (n + 1)) {
    c.margin = false;
    c.slack = pack(0);
  }
  if (c.slack < 0) {
    if (c.margin) {
      c.margin = false;
      c.slack = pack(0);
    }
    c.deficit = -c.slack;
  }
  c.cls = c.freeLen <= 0 ? 3 : c.deficit > 0 ? 2 : (c.narrowed || !c.margin) ? 1 : 0;
  return c;
}

void refreshEdge(Topology& t, LayerMesh& m, int e) {
  EdgeCapacity c = edgeCapacity(t, m, e);
  Edge& E = m.edges[e];
  E.freeLen = c.freeLen;
  E.need = c.need;
  E.cls = c.cls;
  for (int k = 0; k < int(E.cross.size()); ++k) t.crossings[E.cross[k]].width = c.width[k];
}

Slot slotOf(const EdgeCapacity& c, int k) {
  if (c.a.empty()) return {};
  const int n = int(c.a.size());
  if (c.deficit > 0) {
    // Overflow: keep the order, share the deficit (a violation the DRC will report).
    double scale = c.L > 0 ? c.L / c.need : 1.0;
    return {c.a[k] * scale, c.a[k] * scale};
  }
  return {c.a[k], c.L - c.b[k]};
  (void)n;
}

double stackRadius(const EdgeCapacity& c, int k, int end) { return end == 0 ? c.a[k] : c.b[k]; }

}  // namespace xr::topo
