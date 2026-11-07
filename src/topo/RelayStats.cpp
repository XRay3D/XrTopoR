#include "topo/RelayStats.h"

#include <algorithm>
#include <cstdlib>
#include <format>
#include <print>
#include <set>

#include "core/SpatialIndex.h"
#include "geom/Geometry.h"
#include "topo/Chains.h"
#include "topo/PadExit.h"

namespace xr::topo {

namespace {

constexpr double kAt = 5000;  // 5 um: "at the centre", "on the pattern"

}  // namespace

RelayStats relayStats(const Board& b) {
  RelayStats s;
  for (const Track& t : b.tracks) {
    auto& w = s.widths[t.width];
    ++w.first;
    w.second += t.length();
  }
  std::vector<char> all(b.tracks.size(), 1);
  const WireGraph g = wireGraph(b, all);
  OwnCopper copper(b);
  if (std::getenv("XR_TOPO_DEBUG")) {  // what the width rules would do to this board's runs (printed by effectiveWidths)
    WireGraph probe = g;
    effectiveWidths(b, probe, copper);
  }
  std::vector<PadFrame> frames;
  for (const Pad& p : b.pads) frames.push_back(padFrame(p));
  auto endOf = [&](int ti, int e) { return e ? b.tracks[ti].b.v() : b.tracks[ti].a.v(); };
  // Every vertex of the track graph: where it lies, what meets there.
  struct Vx {
    Vec2 p;
    LayerId layer = 0;
    int net = kNoNet;
    int degree = 0;
    std::set<Coord> widths;
    std::optional<ItemRef> in;
    bool centre = false;
  };
  std::vector<Vx> vx(size_t(g.count));
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    if (g.tiny[ti]) continue;
    for (int e = 0; e < 2; ++e) {
      Vx& v = vx[size_t(g.vid[ti][e])];
      if (!v.degree) {
        v.p = endOf(ti, e);
        v.layer = b.tracks[ti].layer;
        v.net = b.tracks[ti].net;
      }
      ++v.degree;
      v.widths.insert(b.tracks[ti].width);
    }
  }
  std::vector<char> padHas(b.pads.size(), 0), padCentre(b.pads.size(), 0), viaHas(b.vias.size(), 0), viaCentre(b.vias.size(), 0);
  for (Vx& v : vx) {
    if (!v.degree) continue;
    v.in = copper.at(v.p, v.net, v.layer);
    if (v.in) {
      const bool pad = v.in->type == ItemType::Pad;
      Vec2 c = pad ? frames[size_t(v.in->index)].c : b.vias[size_t(v.in->index)].pos.v();
      v.centre = (v.p - c).len() <= kAt;
      (pad ? padHas : viaHas)[size_t(v.in->index)] = 1;
      if (v.centre) (pad ? padCentre : viaCentre)[size_t(v.in->index)] = 1;
      if (v.degree == 1 && !v.centre) {
        ++s.deadEnds;
        if (std::getenv("XR_TOPO_DEBUG"))
          std::println(stderr, "end off the centre: net {} at ({:.3f},{:.3f}) in {} {}, {:.3f} mm from its centre", v.net == kNoNet ? "-" : b.nets[v.net].name,
                       v.p.x / 1e6, -v.p.y / 1e6, pad ? "pad" : "via",
                       pad ? std::format("{}-{}", b.pads[size_t(v.in->index)].component >= 0 ? b.components[size_t(b.pads[size_t(v.in->index)].component)].ref : "?",
                                         b.pads[size_t(v.in->index)].number)
                           : std::to_string(v.in->index),
                       (v.p - c).len() / 1e6);
      }
    }
    // Two widths meeting.
    if (v.widths.size() > 1) {
      if (v.in && v.centre) ++(v.in->type == ItemType::Pad ? s.jointPad : s.jointVia);
      else if (v.in) ++s.jointInCopper;
      else ++(v.degree == 2 ? s.jointSeries : s.jointBranch);
    }
    // Inside an elongated pad, off the centre: on the pattern or not.
    if (v.in && v.in->type == ItemType::Pad && !v.centre) {
      const PadFrame& f = frames[size_t(v.in->index)];
      if (f.elongated()) {
        Vec2 l = f.local(v.p);
        bool pattern = false;
        for (Coord w : v.widths) {
          const double inner = f.L - w / 2.0, room = std::max(0.0, f.W - w / 2.0);
          pattern |= std::abs(std::abs(l.x) - inner) <= kAt && std::abs(l.y) <= room + kAt;  // half a width short of the end
          pattern |= std::abs(l.x) >= inner - kAt && std::abs(l.y) <= room + kAt;            // the edge beyond it
        }
        ++(pattern ? s.innerPattern : s.innerOther);
      }
    }
  }
  s.pads = int(r::count(padHas, 1));
  s.padsAtCentre = int(r::count(padCentre, 1));
  s.vias = int(r::count(viaHas, 1));
  s.viasAtCentre = int(r::count(viaCentre, 1));
  // Tracks wholly inside their own copper; the boundary crossings of the elongated pads.
  for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
    const Track& t = b.tracks[ti];
    if (t.net == kNoNet) continue;
    auto ia = copper.at(t.a.v(), t.net, t.layer), ic = copper.at(t.b.v(), t.net, t.layer);
    if (ia && ic && ia->type == ic->type && ia->index == ic->index) {
      if (ia->type == ItemType::Via) {
        ++s.inVia;
        if (std::getenv("XR_TOPO_DEBUG"))
          std::println(stderr, "run inside a via: net {} ({:.4f},{:.4f}) - ({:.4f},{:.4f}){}, the via at ({:.4f},{:.4f}) d {:.3f}", b.nets[size_t(t.net)].name,
                       t.a.x / 1e6, -t.a.y / 1e6, t.b.x / 1e6, -t.b.y / 1e6, t.mid ? " arc" : "", b.vias[size_t(ia->index)].pos.x / 1e6,
                       -b.vias[size_t(ia->index)].pos.y / 1e6, b.vias[size_t(ia->index)].diameter / 1e6);
      }
      else
        switch (frames[size_t(ia->index)].kind) {
          case PadFrame::Kind::Round: ++s.inRound; break;
          case PadFrame::Kind::Oval: ++s.inOval; break;
          default: ++s.inRect; break;
        }
      continue;
    }
    for (int e = 0; e < 2; ++e) {
      auto in = e ? ic : ia;
      if (!in || in->type != ItemType::Pad) continue;
      const PadFrame& f = frames[size_t(in->index)];
      if (!f.elongated()) continue;
      const Shape shape = b.pads[size_t(in->index)].shapeGeom();
      // The boundary point along the track from this end.
      Polyline path = t.path(2000);
      if (e) r::reverse(path);
      Vec2 inside = path.front(), outside = path.front();
      bool found = false;
      for (size_t k = 1; k < path.size(); ++k) {
        if (shape.contains(path[k])) {
          inside = path[k];
          continue;
        }
        outside = path[k];
        found = true;
        break;
      }
      if (!found) continue;
      for (int it = 0; it < 30; ++it) {
        Vec2 mid = (inside + outside) * 0.5;
        (shape.contains(mid) ? inside : outside) = mid;
      }
      if (f.onEnd(outside)) {
        ++s.exitsEnd;
        continue;
      }
      // Through the long side: a bridge when the track ends in another pad of the net.
      auto far = e ? ia : ic;
      bool bridge = far && far->type == ItemType::Pad && far->index != in->index;
      ++(bridge ? s.exitsBridge : s.exitsSide);
      if (!bridge && std::getenv("XR_TOPO_DEBUG")) {
        const Pad& p = b.pads[size_t(in->index)];
        std::println(stderr, "side exit: pad {}-{} net {} at ({:.3f},{:.3f}), leaves at local ({:.3f},{:.3f}) of half sizes {:.3f} x {:.3f}",
                     p.component >= 0 ? b.components[size_t(p.component)].ref : "?", p.number, b.nets[size_t(t.net)].name, f.c.x / 1e6, f.c.y / 1e6,
                     f.local(outside).x / 1e6, f.local(outside).y / 1e6, f.L / 1e6, f.W / 1e6);
      }
    }
  }
  // A neck: a run narrower than the wires at both its ends, in series off the copper.
  for (const WireChain& c : wireChains(b, g, all, copper)) {
    if (c.closed || c.vertex[0] < 0 || c.vertex[1] < 0 || c.vertex[0] == c.vertex[1]) continue;
    bool neck = true;
    for (int e = 0; e < 2 && neck; ++e) {
      const Vx& v = vx[size_t(c.vertex[e])];
      neck = v.degree == 2 && !v.in && v.widths.size() == 2 && *v.widths.rbegin() > c.width && *v.widths.begin() == c.width;
    }
    s.necks += neck;
  }
  // A free end on the inside of another track of its net.
  for (const Vx& v : vx) {
    if (v.degree != 1 || v.in) continue;
    bool tee = false;
    for (int ti = 0; ti < int(b.tracks.size()) && !tee; ++ti) {
      const Track& t = b.tracks[ti];
      if (t.net != v.net || t.layer != v.layer) continue;
      const double tol = std::max(1000.0, 0.1 * t.width);
      if ((t.a.v() - v.p).len() <= tol || (t.b.v() - v.p).len() <= tol) continue;
      Polyline path = t.path(2000);
      for (size_t k = 0; k + 1 < path.size() && !tee; ++k) tee = distPointSegment(v.p, path[k], path[k + 1]) <= tol;
    }
    s.tees += tee;
  }
  return s;
}

std::string RelayStats::text() const {
  std::string out;
  out += "widths:";
  for (const auto& [w, n] : widths) out += std::format(" {:.3f} mm x {} ({:.1f} mm)", w / 1e6, n.first, n.second / 1e6);
  out += std::format("\nnecks (narrower than both wires they join): {}\n", necks);
  out += std::format("pads with wires: {}, a vertex at the centre: {}; vias: {}, at the centre: {}; wire ends in own copper off the centre: {}\n", pads,
                     padsAtCentre, vias, viasAtCentre, deadEnds);
  out += std::format("elongated pads, leaving through: the end {}, the long side {}, a bridge to the next pad {}\n", exitsEnd, exitsSide, exitsBridge);
  out += std::format("vertices inside elongated pads: on the pattern {}, elsewhere {}\n", innerPattern, innerOther);
  out += std::format("tracks wholly inside own copper: vias {}, round pads {}, oval pads {}, rectangular pads {}\n", inVia, inRound, inOval, inRect);
  out += std::format("width joints: at a via centre {}, at a pad centre {}, in copper off the centre {}, in series {}, at a branch {}; ends on a track's inside {}\n",
                     jointVia, jointPad, jointInCopper, jointSeries, jointBranch, tees);
  return out;
}

}  // namespace xr::topo
