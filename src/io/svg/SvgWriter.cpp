#include "io/svg/SvgWriter.h"

#include <format>
#include <ranges>

#include "core/Connectivity.h"

namespace xr::io {

namespace {

constexpr const char* kCopperColors[] = {"#d33a2c", "#2f6fd6", "#c9a227", "#2aa876", "#9b59b6", "#e67e22"};

std::string pathOf(const Polyline& pts, bool close) {
  std::string d;
  for (auto [i, p] : std::views::enumerate(pts)) d += std::format("{}{:.4f},{:.4f} ", i ? 'L' : 'M', p.x / 1e6, p.y / 1e6);
  if (close) d += 'Z';
  return d;
}

}  // namespace

std::string writeSvg(const Board& b, const SvgOptions& opt) {
  BBox bb = b.bbox().inflated(2 * kNmPerMm);
  double w = bb.width() / 1e6, h = bb.height() / 1e6;
  std::string out = std::format(
      "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{:.0f}\" height=\"{:.0f}\" viewBox=\"{:.4f} {:.4f} {:.4f} {:.4f}\">\n"
      "<rect x=\"{:.4f}\" y=\"{:.4f}\" width=\"{:.4f}\" height=\"{:.4f}\" fill=\"#10141a\"/>\n",
      w * opt.pxPerMm, h * opt.pxPerMm, bb.minX / 1e6, bb.minY / 1e6, w, h, bb.minX / 1e6, bb.minY / 1e6, w, h);
  for (auto& loop : b.outline)
    out += std::format("<path d=\"{}\" fill=\"#1b2430\" stroke=\"#e8e0a0\" stroke-width=\"0.1\"/>\n", pathOf(loop, true));

  auto cu = b.copperLayers();
  // Bottom layers first so the top copper is drawn last.
  for (auto [ci, l] : std::views::enumerate(cu) | std::views::reverse) {
    const char* col = kCopperColors[ci % std::size(kCopperColors)];
    out += std::format("<g fill=\"{0}\" stroke=\"{0}\" opacity=\"0.65\">\n", col);
    for (auto& z : b.zones)
      if (z.layer == l)
        for (auto& f : z.filled) out += std::format("<path d=\"{}\" stroke=\"none\" opacity=\"0.35\"/>\n", pathOf(f, true));
    for (auto& t : b.tracks) {
      if (t.layer != l) continue;
      out += std::format("<path d=\"{}\" fill=\"none\" stroke-width=\"{:.4f}\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n",
                         pathOf(t.path(5000), false), t.width / 1e6);
    }
    for (auto& p : b.pads)
      if (p.onLayer(l)) out += std::format("<path d=\"{}\" stroke=\"none\"/>\n", pathOf(p.shapeGeom().outline(5000), true));
    out += "</g>\n";
  }
  for (auto& p : b.pads)
    if (p.drill > 0)
      out += std::format("<circle cx=\"{:.4f}\" cy=\"{:.4f}\" r=\"{:.4f}\" fill=\"#10141a\"/>\n", p.pos.x / 1e6, p.pos.y / 1e6,
                         p.drill / 2e6);
  for (auto& v : b.vias)
    out += std::format(
        "<circle cx=\"{0:.4f}\" cy=\"{1:.4f}\" r=\"{2:.4f}\" fill=\"#b8b8b8\"/><circle cx=\"{0:.4f}\" cy=\"{1:.4f}\" r=\"{3:.4f}\" fill=\"#10141a\"/>\n",
        v.pos.x / 1e6, v.pos.y / 1e6, v.diameter / 2e6, v.drill / 2e6);
  if (opt.silk) {
    out += "<g fill=\"none\" stroke=\"#e0e0e0\" stroke-width=\"0.08\" opacity=\"0.5\">\n";
    for (auto& c : b.components)
      for (auto& g : c.graphics) {
        if (g.layer < 0 || b.layers[g.layer].kind != LayerKind::Silk || b.layers[g.layer].side != Side::Top) continue;
        if (g.kind == GraphicKind::Line) out += std::format("<path d=\"{}\"/>\n", pathOf({g.a, g.b}, false));
        else if (g.kind == GraphicKind::Arc) out += std::format("<path d=\"{}\"/>\n", pathOf(ArcGeom::fromThreePoints(g.a, g.m, g.b).tessellate(5000), false));
      }
    out += "</g>\n";
  }
  if (opt.ratsnest) {
    auto conn = Connectivity::compute(b);
    out += "<g stroke=\"#ffffff\" stroke-width=\"0.06\" opacity=\"0.8\">\n";
    for (auto& r : conn.ratsnest)
      out += std::format("<line x1=\"{:.4f}\" y1=\"{:.4f}\" x2=\"{:.4f}\" y2=\"{:.4f}\"/>\n", r.a.x / 1e6, r.a.y / 1e6, r.b.x / 1e6, r.b.y / 1e6);
    out += "</g>\n";
  }
  out += "</svg>\n";
  return out;
}

}  // namespace xr::io
