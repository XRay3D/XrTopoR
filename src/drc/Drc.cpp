#include "drc/Drc.h"

#include <cstdio>
#include <set>
#include <unordered_map>

namespace xr {

const char* drcTypeName(DrcViolation::Type t) {
  switch (t) {
    case DrcViolation::Type::Clearance: return "clearance";
    case DrcViolation::Type::Short: return "short";
    case DrcViolation::Type::Edge: return "edge";
    case DrcViolation::Type::Unconnected: return "unconnected";
    case DrcViolation::Type::Width: return "width";
    case DrcViolation::Type::Keepout: return "keepout";
  }
  return "?";
}

// Files store coordinates with 0.1 um (TopoR) or 1 nm (KiCad) precision and arcs are tessellated:
// deficits below this are rounding, not design errors.
constexpr double kDrcTolerance = 2000;

double requiredClearance(const Board& b, int netA, int netB, LayerMask layers) {
  if (!layers) return double(std::max(b.clearance(netA, -1), b.clearance(netB, -1)));
  Coord req = 0;
  for (LayerId l = 0; l < 64; ++l)
    if ((layers >> l) & 1) req = std::max({req, b.clearance(netA, l), b.clearance(netB, l)});
  return double(req);
}

namespace {

std::string itemName(const Board& b, ItemRef r) {
  char buf[256];
  switch (r.type) {
    case ItemType::Pad: {
      const Pad& p = b.pads[r.index];
      std::string ref = p.component >= 0 ? b.components[p.component].ref : "?";
      std::snprintf(buf, sizeof buf, "pad %s-%s", ref.c_str(), p.number.c_str());
      return buf;
    }
    case ItemType::Track: return "track";
    case ItemType::Via: return "via";
    case ItemType::Zone: return "zone";
    case ItemType::Keepout: return "keepout";
    case ItemType::Text: return "text";
    case ItemType::Detail: return "detail";
  }
  return "?";
}

std::string netName(const Board& b, int n) { return n >= 0 ? b.nets[n].name : "<no net>"; }

std::string mm(double nm) {
  char buf[32];
  std::snprintf(buf, sizeof buf, "%.3f", nm / kNmPerMm);
  return buf;
}

bool skipPair(const Board& b, ItemRef a, ItemRef c) {
  int na = itemNet(b, a), nc = itemNet(b, c);
  if (na != kNoNet && na == nc) return true;
  if (a.type == ItemType::Pad && c.type == ItemType::Pad) {
    const Pad& pa = b.pads[a.index];
    const Pad& pc = b.pads[c.index];
    if (pa.component == pc.component && pa.number == pc.number) return true;
  }
  // Zone fills are computed by the source CAD with their own rules.
  if (a.type == ItemType::Zone && c.type == ItemType::Zone) return true;
  return false;
}

}  // namespace

double shapeMargin(const Board& b, const SpatialIndex& idx, const Shape& s, LayerMask layers, int net, ItemRef* hit) {
  double worst = std::numeric_limits<double>::max();
  double maxClr = double(b.maxClearance());
  idx.query(s.bbox().inflated(maxClr), layers, [&](ItemRef r) {
    int on = itemNet(b, r);
    if (net != kNoNet && on == net) return;
    double req = requiredClearance(b, net, on, layers & itemLayers(b, r));
    for (auto& os : itemShapes(b, r)) {
      double m = s.distance(os) - req;
      if (m < worst) {
        worst = m;
        if (hit) *hit = r;
      }
    }
  });
  for (auto& loop : b.outline)
    for (size_t i = 0; i < loop.size(); ++i) {
      double m = s.distanceToSegment(loop[i], loop[(i + 1) % loop.size()]) - double(b.edgeClearance);
      if (m < worst) {
        worst = m;
        if (hit) *hit = ItemRef{ItemType::Zone, -1};
      }
    }
  return worst;
}

ConflictSum regionConflicts(const Board& b, const SpatialIndex& idx, const BBox& region,
                            const std::function<bool(ItemRef)>& changed) {
  ConflictSum sum;
  double maxClr = double(b.maxClearance());
  std::set<std::pair<int, int>> seen;
  auto gid = [](ItemRef r) { return int(r.type) * 10'000'000 + r.index; };
  // The shapes of every item once, not once per pair.
  std::unordered_map<int, std::vector<Shape>> cache;
  auto shapesOf = [&](ItemRef r) -> const std::vector<Shape>& {
    auto it = cache.find(gid(r));
    if (it == cache.end()) it = cache.emplace(gid(r), itemShapes(b, r)).first;
    return it->second;
  };
  for (ItemRef a : idx.query(region, ~LayerMask(0))) {
    if (a.type == ItemType::Zone) continue;
    bool aChanged = !changed || changed(a);
    const auto& shapes = shapesOf(a);
    BBox bb;
    for (auto& s : shapes) bb.add(s.bbox());
    LayerMask lm = itemLayers(b, a);
    idx.query(bb.inflated(maxClr), lm, [&](ItemRef c) {
      if (c == a || skipPair(b, a, c)) return;
      if (!aChanged && !changed(c)) return;
      int ka = gid(a), kc = gid(c);
      if (!seen.insert({std::min(ka, kc), std::max(ka, kc)}).second) return;
      double req = requiredClearance(b, itemNet(b, a), itemNet(b, c), lm & itemLayers(b, c));
      double best = std::numeric_limits<double>::max();
      const auto& cshapes = shapesOf(c);
      for (auto& s1 : shapes)
        for (auto& s2 : cshapes) best = std::min(best, s1.distance(s2));
      if (best < req - kDrcTolerance) {
        ++sum.count;
        sum.depth += req - best;
      }
    });
    if (a.type == ItemType::Pad || !aChanged) continue;
    double ec = double(b.edgeClearance), edge = std::numeric_limits<double>::max();
    BBox near = bb.inflated(ec);
    for (auto& loop : b.outline)
      for (size_t i = 0; i < loop.size(); ++i) {
        Vec2 p0 = loop[i], p1 = loop[(i + 1) % loop.size()];
        BBox sb;
        sb.add(p0);
        sb.add(p1);
        if (!sb.intersects(near)) continue;  // farther than the edge clearance
        for (auto& s : shapes) edge = std::min(edge, s.distanceToSegment(p0, p1));
      }
    if (edge < ec - kDrcTolerance) {
      ++sum.count;
      sum.depth += ec - edge;
    }
  }
  return sum;
}

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt) {
  std::vector<DrcViolation> out;
  SpatialIndex idx;
  idx.build(b);
  double maxClr = double(b.maxClearance());

  if (opt.clearance) {
    std::set<std::pair<int, int>> seen;
    auto gid = [&](ItemRef r) { return int(r.type) * 10'000'000 + r.index; };
    auto check = [&](ItemRef a) {
      if (out.size() >= opt.maxViolations) return;
      auto shapes = itemShapes(b, a);
      BBox bb;
      for (auto& s : shapes) bb.add(s.bbox());
      LayerMask lm = itemLayers(b, a);
      idx.query(bb.inflated(maxClr), lm, [&](ItemRef c) {
        if (c == a || skipPair(b, a, c)) return;
        int ka = gid(a), kc = gid(c);
        if (!seen.insert({std::min(ka, kc), std::max(ka, kc)}).second) return;
        int na = itemNet(b, a), nc = itemNet(b, c);
        double req = requiredClearance(b, na, nc, lm & itemLayers(b, c));
        auto cs = itemShapes(b, c);
        double best = std::numeric_limits<double>::max();
        Vec2 where;
        for (auto& s1 : shapes)
          for (auto& s2 : cs) {
            double d = s1.distance(s2);
            if (d < best) {
              best = d;
              // Marker near the actual contact: the closest of the shapes' key points to the other shape.
              auto keyPts = [](const Shape& s) {
                if (s.kind == Shape::Kind::Point) return Polyline{s.a};
                if (s.kind == Shape::Kind::Segment) return Polyline{s.a, (s.a + s.b) * 0.5, s.b};
                return s.poly;
              };
              double bd = std::numeric_limits<double>::max();
              for (auto& p : keyPts(s1)) {
                double dd = s2.distance(p);
                if (dd < bd) { bd = dd; where = p; }
              }
              for (auto& p : keyPts(s2)) {
                double dd = s1.distance(p);
                if (dd < bd) { bd = dd; where = p; }
              }
            }
          }
        if (best >= req - opt.tolerance) return;
        DrcViolation v;
        v.type = best <= 0 ? DrcViolation::Type::Short : DrcViolation::Type::Clearance;
        v.a = a;
        v.b = c;
        v.hasB = true;
        v.pos = where;
        LayerMask common = lm & itemLayers(b, c);
        for (LayerId l = 0; l < 64; ++l)
          if ((common >> l) & 1) { v.layer = l; break; }
        v.actual = best;
        v.required = req;
        v.message = std::string(v.type == DrcViolation::Type::Short ? "Short" : "Clearance") + " " + mm(best) +
                    " < " + mm(req) + " mm: " + itemName(b, a) + " [" + netName(b, na) + "] / " + itemName(b, c) +
                    " [" + netName(b, nc) + "]";
        out.push_back(std::move(v));
      });
    };
    for (int i = 0; i < int(b.tracks.size()); ++i) check({ItemType::Track, i});
    for (int i = 0; i < int(b.vias.size()); ++i) check({ItemType::Via, i});
    for (int i = 0; i < int(b.pads.size()); ++i) check({ItemType::Pad, i});
  }

  if (opt.edge && !b.outline.empty()) {
    double ec = double(b.edgeClearance);
    auto checkEdge = [&](ItemRef r) {
      for (auto& s : itemShapes(b, r)) {
        BBox near = s.bbox().inflated(ec);
        for (auto& loop : b.outline)
          for (size_t i = 0; i < loop.size(); ++i) {
            Vec2 p0 = loop[i], p1 = loop[(i + 1) % loop.size()];
            BBox sb;
            sb.add(p0);
            sb.add(p1);
            if (!sb.intersects(near)) continue;
            double d = s.distanceToSegment(p0, p1);
            if (d < ec - opt.tolerance) {
              DrcViolation v;
              v.type = DrcViolation::Type::Edge;
              v.a = r;
              v.pos = closestPointOnSegment(s.center(), p0, p1);
              v.actual = d;
              v.required = ec;
              v.message = "Board edge clearance " + mm(d) + " < " + mm(ec) + " mm: " + itemName(b, r);
              out.push_back(std::move(v));
              return;
            }
          }
      }
    };
    for (int i = 0; i < int(b.tracks.size()); ++i) checkEdge({ItemType::Track, i});
    for (int i = 0; i < int(b.vias.size()); ++i) checkEdge({ItemType::Via, i});
  }

  if (opt.widths)
    for (int i = 0; i < int(b.tracks.size()); ++i) {
      const Track& t = b.tracks[i];
      Coord min = b.minTrackWidth(t.net, t.layer);
      if (t.width >= min - opt.tolerance) continue;
      DrcViolation v;
      v.type = DrcViolation::Type::Width;
      v.a = {ItemType::Track, i};
      v.pos = (t.a.v() + t.b.v()) * 0.5;
      v.layer = t.layer;
      v.actual = double(t.width);
      v.required = double(min);
      v.message = "Width " + mm(double(t.width)) + " < " + mm(double(min)) + " mm: " + itemName(b, v.a) + " [" +
                  netName(b, t.net) + "]";
      out.push_back(std::move(v));
    }

  if (opt.keepouts)
    for (int ki = 0; ki < int(b.keepouts.size()); ++ki) {
      const Keepout& k = b.keepouts[ki];
      if (k.role != Keepout::Role::Route) continue;
      auto ks = k.shapes();
      BBox kb;
      for (auto& s : ks) kb.add(s.bbox());
      LayerMask lm = k.layers ? k.layers : b.allCopperMask();
      idx.query(kb, lm, [&](ItemRef r) {
        bool kept = (r.type == ItemType::Track && k.wires) || (r.type == ItemType::Via && k.vias) ||
                    (r.type == ItemType::Zone && k.wires);
        if (!kept || out.size() >= opt.maxViolations) return;
        for (auto& s1 : itemShapes(b, r))
          for (auto& s2 : ks)
            if (s1.distance(s2) < -opt.tolerance) {
              DrcViolation v;
              v.type = DrcViolation::Type::Keepout;
              v.a = r;
              v.b = {ItemType::Keepout, ki};
              v.hasB = true;
              v.pos = s1.center();
              if (r.type == ItemType::Track) v.layer = b.tracks[r.index].layer;
              v.message = "Keepout: " + itemName(b, r) + " [" + netName(b, itemNet(b, r)) + "]";
              out.push_back(std::move(v));
              return;
            }
      });
    }

  if (opt.unconnected) {
    auto conn = Connectivity::compute(b, idx);
    for (auto& r : conn.ratsnest) {
      DrcViolation v;
      v.type = DrcViolation::Type::Unconnected;
      v.a = r.from;
      v.b = r.to;
      v.hasB = true;
      v.pos = (r.a + r.b) * 0.5;
      v.message = "Unconnected [" + netName(b, r.net) + "]: " + itemName(b, r.from) + " - " + itemName(b, r.to);
      out.push_back(std::move(v));
    }
  }
  return out;
}

}  // namespace xr
