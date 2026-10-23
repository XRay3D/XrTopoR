#include "drc/Drc.h"

#include <cstdio>
#include <set>

namespace xr {

const char* drcTypeName(DrcViolation::Type t) {
  switch (t) {
    case DrcViolation::Type::Clearance: return "clearance";
    case DrcViolation::Type::Short: return "short";
    case DrcViolation::Type::Edge: return "edge";
    case DrcViolation::Type::Unconnected: return "unconnected";
  }
  return "?";
}

double requiredClearance(const Board& b, int netA, int netB) {
  return double(std::max(b.classOf(netA).clearance, b.classOf(netB).clearance));
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
  double maxClr = 0;
  for (auto& nc : b.netClasses) maxClr = std::max(maxClr, double(nc.clearance));
  idx.query(s.bbox().inflated(maxClr), layers, [&](ItemRef r) {
    int on = itemNet(b, r);
    if (net != kNoNet && on == net) return;
    double req = requiredClearance(b, net, on);
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

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt) {
  std::vector<DrcViolation> out;
  SpatialIndex idx;
  idx.build(b);
  double maxClr = 0;
  for (auto& nc : b.netClasses) maxClr = std::max(maxClr, double(nc.clearance));

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
        double req = requiredClearance(b, na, nc);
        auto cs = itemShapes(b, c);
        double best = std::numeric_limits<double>::max();
        Vec2 where;
        for (auto& s1 : shapes)
          for (auto& s2 : cs) {
            double d = s1.distance(s2);
            if (d < best) { best = d; where = (s1.center() + s2.center()) * 0.5; }
          }
        if (best >= req - 1) return;  // 1 nm tolerance
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
      for (auto& s : itemShapes(b, r))
        for (auto& loop : b.outline)
          for (size_t i = 0; i < loop.size(); ++i) {
            Vec2 p0 = loop[i], p1 = loop[(i + 1) % loop.size()];
            double d = s.distanceToSegment(p0, p1);
            if (d < ec - 1) {
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
    };
    for (int i = 0; i < int(b.tracks.size()); ++i) checkEdge({ItemType::Track, i});
    for (int i = 0; i < int(b.vias.size()); ++i) checkEdge({ItemType::Via, i});
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
