#include "core/BoxGrid.h"
#include "drc/Drc.h"

#include "core/Prof.h"

#include "core/Parallel.h"

#include <array>
#include <bit>
#include <cstdio>
#include <optional>
#include <unordered_set>
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
// The ends of a track are whole nanometres: a tool that lays copper at the tolerance's very edge (they do) is put a
// nanometre inside it or outside by the rounding. Not a violation either way. (While arcs were measured as chords,
// up to 0.2 um inside the arc, that edge was never met.)
constexpr double kGridSlack = 2;

double requiredClearance(const Board& b, int netA, int netB, LayerMask layers) {
  if (!layers) return double(b.clearance(netA, netB, -1));
  Coord req = 0;
  for (LayerMask m = layers; m; m &= m - 1) req = std::max(req, b.clearance(netA, netB, LayerId(std::countr_zero(m))));
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

// A straight track lying wholly inside the copper of a pad or via of its own net is that copper (a wire's
// lead from the pad's centre to its end): what it is too close to, the pad is too, and is reported once.
bool inOwnCopper(const Board& b, const SpatialIndex& idx, ItemRef r) {
  if (r.type != ItemType::Track) return false;
  const Track& t = b.tracks[r.index];
  if (t.net == kNoNet || t.isArc()) return false;
  const double hw = t.width / 2.0 - kDrcTolerance;
  bool in = false;
  BBox q;
  q.add(t.a.v());
  q.add(t.b.v());
  idx.query(q, LayerMask(1) << t.layer, [&](ItemRef o) {
    if (in || (o.type != ItemType::Pad && o.type != ItemType::Via) || itemNet(b, o) != t.net) return;
    for (auto& s : itemShapes(b, o))
      if (s.distance(t.a.v()) <= -hw && s.distance(t.b.v()) <= -hw) {
        in = true;
        return;
      }
  });
  return in;
}

bool skipPair(const Board& b, ItemRef a, ItemRef c) {
  int na = itemNet(b, a), nc = itemNet(b, c);
  if (na != kNoNet && na == nc) return true;
  // The two conductors of one zipped section of a differential pair are one object (their gap is the rule).
  if (a.type == ItemType::Track && c.type == ItemType::Track && b.tracks[a.index].zip >= 0 && b.tracks[a.index].zip == b.tracks[c.index].zip) return true;
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
    for (auto& os : itemShapesExact(b, r)) {  // (as the DRC measures: an arc as it is)
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
    if (it == cache.end()) it = cache.emplace(gid(r), itemShapesExact(b, r)).first;
    return it->second;
  };
  for (ItemRef a : idx.query(region, ~LayerMask(0))) {
    if (a.type == ItemType::Zone) continue;
    bool aChanged = !changed || changed(a);
    const auto& shapes = shapesOf(a);
    BBox bb;
    for (auto& s : shapes) bb.add(s.bbox());
    LayerMask lm = itemLayers(b, a);
    if (inOwnCopper(b, idx, a)) continue;
    idx.query(bb.inflated(maxClr), lm, [&](ItemRef c) {
      if (c == a || skipPair(b, a, c) || inOwnCopper(b, idx, c)) return;
      if (!aChanged && !changed(c)) return;
      int ka = gid(a), kc = gid(c);
      if (!seen.insert({std::min(ka, kc), std::max(ka, kc)}).second) return;
      double req = requiredClearance(b, itemNet(b, a), itemNet(b, c), lm & itemLayers(b, c));
      double best = std::numeric_limits<double>::max();
      const auto& cshapes = shapesOf(c);
      for (auto& s1 : shapes)
        for (auto& s2 : cshapes) best = std::min(best, s1.distance(s2));
      if (best < req - kDrcTolerance - kGridSlack) {
        ++sum.count;
        if (best <= 0) ++sum.shorts;
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
    if (edge < ec - kDrcTolerance - kGridSlack) {
      ++sum.count;
      sum.depth += ec - edge;
    }
  }
  return sum;
}

namespace {
std::vector<DrcViolation> check(const Board& b, const DrcOptions& opt, const DrcEarlier* earlier) {
  std::vector<DrcViolation> out;
  // The checks of one item, for the whole board and for the changed items of a board checked before.
  auto edgeOf = [&](ItemRef r) -> std::optional<DrcViolation> {
    const double ec = double(b.edgeClearance);
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
            return v;
          }
        }
    }
    return std::nullopt;
  };
  auto widthOf = [&](int i) -> std::optional<DrcViolation> {
    const Track& t = b.tracks[size_t(i)];
    Coord min = b.minTrackWidth(t.net, t.layer);
    if (t.width >= min - opt.tolerance) return std::nullopt;
    DrcViolation v;
    v.type = DrcViolation::Type::Width;
    v.a = {ItemType::Track, i};
    v.pos = (t.a.v() + t.b.v()) * 0.5;
    v.layer = t.layer;
    v.actual = double(t.width);
    v.required = double(min);
    v.message = "Width " + mm(double(t.width)) + " < " + mm(double(min)) + " mm: " + itemName(b, v.a) + " [" + netName(b, t.net) + "]";
    return v;
  };
  auto keepoutOf = [&](int ki, const std::vector<Shape>& ks, ItemRef r) -> std::optional<DrcViolation> {
    const Keepout& k = b.keepouts[size_t(ki)];
    const bool kept = (r.type == ItemType::Track && k.wires) || (r.type == ItemType::Via && k.vias) || (r.type == ItemType::Zone && k.wires);
    if (!kept) return std::nullopt;
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
          return v;
        }
    return std::nullopt;
  };
  // The place of an item in the order of the check: the tracks, the vias, the pads, the zones.
  const size_t nT = b.tracks.size(), nV = b.vias.size(), nP = b.pads.size();
  auto placeOf = [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Track: return size_t(r.index);
      case ItemType::Via: return nT + size_t(r.index);
      case ItemType::Pad: return nT + nV + size_t(r.index);
      default: return nT + nV + nP + size_t(r.index);
    }
  };
  // The tree of the items' boxes, for the checks that still ask it (the keepouts, the connections): made when the
  // first of them asks. The clearances have a grid of their own from the shapes they make anyway — the tree was
  // built from every item's shapes made once more, for nothing where the keepouts are none and the connections
  // are not asked for (F7's judge of every drawing).
  std::optional<SpatialIndex> tree;
  auto index = [&]() -> const SpatialIndex& {
    if (!tree) {
      tree.emplace();
      tree->build(b);
    }
    return *tree;
  };
  double maxClr = double(b.maxClearance());

  if (opt.clearance) {
    // Every item against its neighbours, in parallel; each pair is then taken once, from the item that comes
    // first in the order of the items (tracks, vias, pads) and of its neighbours, as the check did one item
    // after another. The shapes of every item and whether a track is its pad's copper are found first, once
    // (they were half of the check, found again for every pair).
    std::vector<ItemRef> order;
    order.reserve(b.tracks.size() + b.vias.size() + b.pads.size());
    for (int i = 0; i < int(b.tracks.size()); ++i) order.push_back({ItemType::Track, i});
    for (int i = 0; i < int(b.vias.size()); ++i) order.push_back({ItemType::Via, i});
    for (int i = 0; i < int(b.pads.size()); ++i) order.push_back({ItemType::Pad, i});
    using Cache = std::vector<std::vector<Shape>>;
    Cache shapeCache[4] = {Cache(b.tracks.size()), Cache(b.vias.size()), Cache(b.pads.size()), Cache(b.zones.size())};
    auto slot = [](ItemType t) {
      switch (t) {
        case ItemType::Track: return 0;
        case ItemType::Via: return 1;
        case ItemType::Pad: return 2;
        case ItemType::Zone: return 3;
        default: return -1;
      }
    };
    using Boxes = std::vector<std::vector<BBox>>;
    Boxes boxCache[4] = {Boxes(b.tracks.size()), Boxes(b.vias.size()), Boxes(b.pads.size()), Boxes(b.zones.size())};
    auto boxesFor = [](const std::vector<Shape>& shapes) {
      std::vector<BBox> out;
      out.reserve(shapes.size());
      for (const Shape& sh : shapes) out.push_back(sh.bbox());
      return out;
    };
    std::vector<char> ownCopper(b.tracks.size(), 0);
    // The items in a grid by the boxes of their shapes (BoxGrid): the tracks, the vias, the pads, then the zones.
    // The neighbours of an item come from it, by ascending number (a tree of boxes was asked before, built from
    // every item's shapes made once more, and answered in the order its nodes lay).
    const size_t nItems = order.size() + b.zones.size();
    auto refOf = [&](size_t k) { return k < order.size() ? order[k] : ItemRef{ItemType::Zone, int(k - order.size())}; };
    std::vector<BBox> itemBox(nItems);
    std::vector<LayerMask> itemMask(nItems);
    std::optional<ProfScope> ps(std::in_place, "drc.shapes");
    parallelFor(nItems, [&](size_t k) {
      const ItemRef r = refOf(k);
      shapeCache[slot(r.type)][size_t(r.index)] = itemShapesExact(b, r);  // (an arc track is one shape: no chords)
      boxCache[slot(r.type)][size_t(r.index)] = boxesFor(shapeCache[slot(r.type)][size_t(r.index)]);
      for (const BBox& sb : boxCache[slot(r.type)][size_t(r.index)]) itemBox[k].add(sb);
      itemMask[k] = itemLayers(b, r);
    });
    ps.emplace("drc.grid");
    BoxGrid grid;
    grid.build(itemBox);
    ps.emplace("drc.own");
    // (The grid holds pads, tracks, vias and zones only.)
    auto shapesOf = [&](ItemRef r) -> const std::vector<Shape>& { return shapeCache[slot(r.type)][size_t(r.index)]; };
    auto boxesOf = [&](ItemRef r) -> const std::vector<BBox>& { return boxCache[slot(r.type)][size_t(r.index)]; };
    // A straight track lying wholly inside the copper of a pad or via of its own net is that copper (inOwnCopper,
    // from the shapes made above).
    auto ownCopperOf = [&](size_t ti, std::vector<int>& near) {
      const Track& t = b.tracks[ti];
      if (t.net == kNoNet || t.isArc()) return false;
      const double hw = t.width / 2.0 - kDrcTolerance;
      BBox q;
      q.add(t.a.v());
      q.add(t.b.v());
      grid.query(q, near);
      for (int j : near) {
        const ItemRef o = refOf(size_t(j));
        if (!((itemMask[size_t(j)] >> t.layer) & 1) || (o.type != ItemType::Pad && o.type != ItemType::Via) || itemNet(b, o) != t.net) continue;
        if (r::any_of(shapesOf(o), [&](const Shape& sh) { return sh.distance(t.a.v()) <= -hw && sh.distance(t.b.v()) <= -hw; })) return true;
      }
      return false;
    };
    if (!earlier) {
      std::vector<int> near;
      for (size_t ti = 0; ti < b.tracks.size(); ++ti) ownCopper[ti] = ownCopperOf(ti, near);
    }
    auto inOwn = [&](ItemRef r) { return r.type == ItemType::Track && ownCopper[size_t(r.index)]; };
    auto gid = [&](ItemRef r) { return uint64_t(int(r.type) * 10'000'000 + r.index); };
    // Per item: its neighbours in the order met, each with the violation the pair makes seen from it (-1 none).
    struct Met {
      uint64_t pair;
      int violation;
    };
    struct Seen {
      bool skip = false;  // the item is its pad's copper: it checks nothing
      std::vector<Met> met;
      std::vector<DrcViolation> found;
    };
    std::vector<Seen> seenBy(order.size());
    // The violation the pair makes, seen from `a` (the marker and the message are its side's).
    auto violationOf = [&](ItemRef a, ItemRef c) -> std::optional<DrcViolation> {
      int na = itemNet(b, a), nc = itemNet(b, c);
      LayerMask common = itemLayers(b, a) & itemLayers(b, c);
      // The closest points of two lists of shapes: the distance and a marker near the contact (of the pair
      // of shapes nearest).
      // Only a distance below `limit` (the clearance less the tolerance) is a violation and has to be exact: a
      // pair of shapes whose boxes are as far apart as the least found, or as the limit, is not measured (an arc
      // is tens of capsules, and every one was measured against every one of the neighbour's: a sixth of F7).
      auto measure = [&](const std::vector<Shape>& as, const std::vector<BBox>& ab, const std::vector<Shape>& cs, const std::vector<BBox>& cb,
                         double limit, Vec2& where) {
        double best = std::numeric_limits<double>::max();
        const Shape *n1 = nullptr, *n2 = nullptr;
        for (size_t i = 0; i < as.size(); ++i)
          for (size_t k = 0; k < cs.size(); ++k) {
            const double bound = std::min(best, limit);
            const double gap = std::max({ab[i].minX - cb[k].maxX, cb[k].minX - ab[i].maxX, ab[i].minY - cb[k].maxY, cb[k].minY - ab[i].maxY});
            if (gap >= bound) continue;
            if (double d = as[i].distance(cs[k], bound); d < best) {
              best = d;
              n1 = &as[i];
              n2 = &cs[k];
            }
          }
        if (best >= limit) return best;  // (no violation: no marker)
        if (n1) {
          // Marker near the actual contact: the closest of the shapes' key points to the other shape.
          auto keyPts = [](const Shape& s) {
            if (s.kind == Shape::Kind::Point) return Polyline{s.a};
            if (s.kind == Shape::Kind::Segment) return Polyline{s.a, (s.a + s.b) * 0.5, s.b};
            if (s.kind == Shape::Kind::Arc) {
              Polyline along;  // the arc's ends and points between, a chord's worth apart
              const int n = std::max(2, int(std::abs(s.arc.sweep) * s.arc.R / 100000.0));
              for (int i = 0; i <= n; ++i) along.push_back(s.arc.at(s.arc.a0 + s.arc.sweep * i / n));
              return along;
            }
            return s.poly;
          };
          double bd = std::numeric_limits<double>::max();
          for (auto& p : keyPts(*n1)) {
            double dd = n2->distance(p);
            if (dd < bd) { bd = dd; where = p; }
          }
          for (auto& p : keyPts(*n2)) {
            double dd = n1->distance(p);
            if (dd < bd) { bd = dd; where = p; }
          }
        }
        return best;
      };
      Vec2 where;
      double req = 0, best = 0;
      LayerId worstLayer = -1;
      auto layered = [&](ItemRef r) { return r.type == ItemType::Pad && !b.pads[r.index].uniform; };
      if (layered(a) || layered(c)) {
        // A pad with another shape on some copper layers: layer by layer, the worst one reported.
        double worst = std::numeric_limits<double>::max();
        for (LayerId l = 0; l < 64; ++l) {
          if (!((common >> l) & 1)) continue;
          Vec2 at;
          double rq = double(b.clearance(na, nc, l));
          const std::vector<Shape> sa = itemShapes(b, a, 0, l), sc = itemShapes(b, c, 0, l);
          double d = measure(sa, boxesFor(sa), sc, boxesFor(sc), rq - opt.tolerance - kGridSlack, at);
          if (d - rq < worst) {
            worst = d - rq;
            best = d;
            req = rq;
            where = at;
            worstLayer = l;
          }
        }
        if (worstLayer < 0) return std::nullopt;
      } else {
        req = requiredClearance(b, na, nc, common);
        best = measure(shapesOf(a), boxesOf(a), shapesOf(c), boxesOf(c), req - opt.tolerance - kGridSlack, where);
      }
      if (best >= req - opt.tolerance - kGridSlack) return std::nullopt;
      DrcViolation v;
      v.type = best <= 0 ? DrcViolation::Type::Short : DrcViolation::Type::Clearance;
      v.a = a;
      v.b = c;
      v.hasB = true;
      v.pos = where;
      v.layer = worstLayer;
      for (LayerId l = 0; l < 64 && v.layer < 0; ++l)
        if ((common >> l) & 1) v.layer = l;
      v.actual = best;
      v.required = req;
      v.message = std::string(v.type == DrcViolation::Type::Short ? "Short" : "Clearance") + " " + mm(best) +
                  " < " + mm(req) + " mm: " + itemName(b, a) + " [" + netName(b, na) + "] / " + itemName(b, c) +
                  " [" + netName(b, nc) + "]";
      return v;
    };
    auto check = [&](size_t k) {
      const ItemRef a = order[k];
      Seen& me = seenBy[k];
      const std::vector<BBox>& boxes = boxesOf(a);
      BBox bb;
      for (const BBox& sb : boxes) bb.add(sb);
      LayerMask lm = itemLayers(b, a);
      if (inOwn(a)) {
        me.skip = true;
        return;
      }
      thread_local std::vector<int> near;
      grid.query(bb.inflated(maxClr), near);
      auto visit = [&](ItemRef c) {
        if (c == a || skipPair(b, a, c) || inOwn(c)) return;
        const uint64_t ka = gid(a), kc = gid(c);
        me.met.push_back({std::min(ka, kc) << 32 | std::max(ka, kc), -1});
        if (auto v = violationOf(a, c)) {
          me.met.back().violation = int(me.found.size());
          me.found.push_back(std::move(*v));
        }
      };
      for (int j : near)
        if (itemMask[size_t(j)] & lm) visit(refOf(size_t(j)));
    };
    if (earlier) {
      // A board checked before, a few of its tracks and vias changed since: the violations of what stands are that
      // check's, the changed items are checked against all, and the whole is put in the order the check of the whole
      // board gives (a pair by its items' places, the one that comes first reporting it).
      ps.emplace("drc.changed");
      auto changed = [&](ItemRef r) {
        return (r.type == ItemType::Track && earlier->trackWas[size_t(r.index)] < 0) || (r.type == ItemType::Via && earlier->viaWas[size_t(r.index)] < 0);
      };
      struct Keyed {
        std::array<size_t, 3> key;
        DrcViolation v;
      };
      std::vector<Keyed> all;
      std::vector<signed char> own(nT, -1);  // a track is its pad's copper: found when asked
      std::vector<int> near, nearOwn;
      auto inOwnCopper = [&](ItemRef r) {
        if (r.type != ItemType::Track) return false;
        signed char& o = own[size_t(r.index)];
        if (o < 0) o = ownCopperOf(size_t(r.index), nearOwn);
        return o > 0;
      };
      for (size_t k = 0; k < order.size(); ++k) {
        const ItemRef a = order[k];
        if (!changed(a) || inOwnCopper(a)) continue;
        BBox bb;
        for (const BBox& sb : boxesOf(a)) bb.add(sb);
        const LayerMask lm = itemLayers(b, a);
        grid.query(bb.inflated(maxClr), near);
        for (int j : near) {
          if (!(itemMask[size_t(j)] & lm)) continue;
          const ItemRef c = refOf(size_t(j));
          if (c == a || skipPair(b, a, c) || inOwnCopper(c)) continue;
          const bool first = size_t(j) > k;  // `a` comes first of the two
          if (!first && changed(c)) continue;  // (found from `c`)
          if (auto v = first ? violationOf(a, c) : violationOf(c, a)) all.push_back({{0, std::min(k, size_t(j)), std::max(k, size_t(j))}, std::move(*v)});
        }
      }
      // The earlier check's, of the items that stand, by their numbers on this board.
      std::vector<int> trackNow, viaNow;
      auto invert = [](const std::vector<int>& was, std::vector<int>& now) {
        for (size_t i = 0; i < was.size(); ++i)
          if (was[i] >= 0) {
            if (now.size() <= size_t(was[i])) now.resize(size_t(was[i]) + 1, -1);
            now[size_t(was[i])] = int(i);
          }
      };
      invert(earlier->trackWas, trackNow);
      invert(earlier->viaWas, viaNow);
      auto standing = [&](ItemRef& r) {
        if (r.type != ItemType::Track && r.type != ItemType::Via) return true;
        const std::vector<int>& now = r.type == ItemType::Track ? trackNow : viaNow;
        if (r.index < 0 || size_t(r.index) >= now.size() || now[size_t(r.index)] < 0) return false;
        r.index = now[size_t(r.index)];
        return true;
      };
      for (const DrcViolation& was : *earlier->violations) {
        DrcViolation v = was;
        if (!standing(v.a) || (v.hasB && !standing(v.b))) continue;
        switch (v.type) {
          case DrcViolation::Type::Clearance:
          case DrcViolation::Type::Short: {
            if (placeOf(v.a) > placeOf(v.b)) std::swap(v.a, v.b);
            all.push_back({{0, placeOf(v.a), placeOf(v.b)}, std::move(v)});
            break;
          }
          case DrcViolation::Type::Edge: all.push_back({{1, placeOf(v.a), 0}, std::move(v)}); break;
          case DrcViolation::Type::Width: all.push_back({{2, placeOf(v.a), 0}, std::move(v)}); break;
          case DrcViolation::Type::Keepout: all.push_back({{3, size_t(v.b.index), placeOf(v.a)}, std::move(v)}); break;
          default: break;
        }
      }
      // The other checks of the changed items.
      std::vector<std::vector<Shape>> keepShapes(b.keepouts.size());
      std::vector<BBox> keepBox(b.keepouts.size());
      if (opt.keepouts)
        for (size_t ki = 0; ki < b.keepouts.size(); ++ki)
          if (b.keepouts[ki].role == Keepout::Role::Route) {
            keepShapes[ki] = b.keepouts[ki].shapes();
            for (const Shape& sh : keepShapes[ki]) keepBox[ki].add(sh.bbox());
          }
      for (size_t k = 0; k < nT + nV; ++k) {
        const ItemRef a = order[k];
        if (!changed(a)) continue;
        if (opt.edge && !b.outline.empty())
          if (auto v = edgeOf(a)) all.push_back({{1, k, 0}, std::move(*v)});
        if (opt.widths && a.type == ItemType::Track)
          if (auto v = widthOf(a.index)) all.push_back({{2, k, 0}, std::move(*v)});
        for (size_t ki = 0; ki < keepShapes.size(); ++ki) {
          if (keepShapes[ki].empty() || !keepBox[ki].intersects(itemBox[k])) continue;
          const LayerMask lm = b.keepouts[ki].layers ? b.keepouts[ki].layers : b.allCopperMask();
          if (!(itemMask[k] & lm)) continue;
          if (auto v = keepoutOf(int(ki), keepShapes[ki], a)) all.push_back({{3, ki, k}, std::move(*v)});
        }
      }
      r::stable_sort(all, {}, &Keyed::key);
      out.reserve(all.size());
      for (Keyed& kv : all) out.push_back(std::move(kv.v));
      return out;
    }
    ps.emplace("drc.pairs");
    parallelFor(order.size(), check);
    ps.emplace("drc.merge");
    std::unordered_set<uint64_t> seen;
    for (size_t k = 0; k < order.size(); ++k) {
      if (out.size() >= opt.maxViolations) break;
      Seen& me = seenBy[k];
      if (me.skip) continue;
      for (const Met& m : me.met)
        if (seen.insert(m.pair).second && m.violation >= 0) out.push_back(std::move(me.found[size_t(m.violation)]));
    }
  }

  ProfScope psRest("drc.rest");
  if (opt.edge && !b.outline.empty()) {
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (auto v = edgeOf({ItemType::Track, i})) out.push_back(std::move(*v));
    for (int i = 0; i < int(b.vias.size()); ++i)
      if (auto v = edgeOf({ItemType::Via, i})) out.push_back(std::move(*v));
  }

  if (opt.widths)
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (auto v = widthOf(i)) out.push_back(std::move(*v));

  if (opt.keepouts)
    for (int ki = 0; ki < int(b.keepouts.size()); ++ki) {
      const Keepout& k = b.keepouts[ki];
      if (k.role != Keepout::Role::Route) continue;
      auto ks = k.shapes();
      BBox kb;
      for (auto& s : ks) kb.add(s.bbox());
      LayerMask lm = k.layers ? k.layers : b.allCopperMask();
      // By the items' places (the tree answers in the order its nodes lie: not one to keep between two checks).
      std::vector<ItemRef> hit;
      index().query(kb, lm, [&](ItemRef r) { hit.push_back(r); });
      r::sort(hit, {}, placeOf);
      for (ItemRef r : hit) {
        if (out.size() >= opt.maxViolations) break;
        if (auto v = keepoutOf(ki, ks, r)) out.push_back(std::move(*v));
      }
    }

  if (opt.unconnected) {
    auto conn = Connectivity::compute(b, index());
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
}  // namespace

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt) { return check(b, opt, nullptr); }

std::vector<DrcViolation> runDrc(const Board& b, const DrcOptions& opt, const DrcEarlier& earlier) {
  const bool fits = earlier.violations && opt.clearance && !opt.unconnected && earlier.violations->size() < opt.maxViolations &&
                    earlier.trackWas.size() == b.tracks.size() && earlier.viaWas.size() == b.vias.size();
  if (!fits) return check(b, opt, nullptr);
  std::vector<DrcViolation> out = check(b, opt, &earlier);
  return out.size() < opt.maxViolations ? out : check(b, opt, nullptr);
}

DrcEarlier drcEarlier(const Board& was, const std::vector<DrcViolation>& violations, const Board& now, size_t* changed) {
  DrcEarlier e;
  if (changed) *changed = now.tracks.size() + now.vias.size();
  if (was.pads.size() != now.pads.size() || was.zones.size() != now.zones.size()) return e;
  e.trackWas.assign(now.tracks.size(), -1);
  e.viaWas.assign(now.vias.size(), -1);
  auto mix = [](uint64_t h, uint64_t x) {
    h ^= x + 0x9e3779b97f4a7c15ull + (h << 6) + (h >> 2);
    return h * 0xff51afd7ed558ccdull;
  };
  auto hashOf = [&](const Track& t) {
    uint64_t h = mix(uint64_t(t.layer) << 32 ^ uint64_t(uint32_t(t.net)), uint64_t(t.width));
    for (int64_t x : {int64_t(t.a.x), int64_t(t.a.y), int64_t(t.b.x), int64_t(t.b.y)}) h = mix(h, uint64_t(x));
    if (t.mid) h = mix(mix(h, uint64_t(int64_t(t.mid->x))), uint64_t(int64_t(t.mid->y)));
    return h;
  };
  auto same = [](const Track& x, const Track& y) {
    return x.a == y.a && x.b == y.b && x.mid == y.mid && x.width == y.width && x.layer == y.layer && x.net == y.net && x.zip == y.zip;
  };
  // The earlier board's tracks by their hash, those of one hash in a chain by ascending number.
  std::unordered_map<uint64_t, int> head;
  head.reserve(was.tracks.size() * 2);
  std::vector<int> next(was.tracks.size(), -1);
  for (int i = int(was.tracks.size()) - 1; i >= 0; --i) {
    auto [it, fresh] = head.try_emplace(hashOf(was.tracks[size_t(i)]), i);
    if (!fresh) {
      next[size_t(i)] = it->second;
      it->second = i;
    }
  }
  std::vector<char> taken(was.tracks.size(), 0);
  size_t n = 0;
  for (size_t i = 0; i < now.tracks.size(); ++i) {
    const auto it = head.find(hashOf(now.tracks[i]));
    for (int j = it == head.end() ? -1 : it->second; j >= 0; j = next[size_t(j)])
      if (!taken[size_t(j)] && same(was.tracks[size_t(j)], now.tracks[i])) {
        taken[size_t(j)] = 1;
        e.trackWas[i] = j;
        break;
      }
    n += e.trackWas[i] < 0;
  }
  if (was.vias.size() == now.vias.size())
    for (size_t i = 0; i < now.vias.size(); ++i) {
      const Via& x = was.vias[i];
      const Via& y = now.vias[i];
      if (x.pos == y.pos && x.diameter == y.diameter && x.drill == y.drill && x.net == y.net && x.layers == y.layers) e.viaWas[i] = int(i);
    }
  for (int w : e.viaWas) n += w < 0;
  if (changed) *changed = n;
  e.violations = &violations;
  return e;
}

}  // namespace xr
