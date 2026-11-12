// The board view's picture as scenes for the video card (gui/gl): the board itself, what is selected and marked on
// it, the tool's work in hand; and the frame drawn from them.
#include <QFontMetricsF>
#include <QOpenGLContext>
#include <QOpenGLFunctions>
#include <QResizeEvent>
#include <QPainter>
#include <QPainterPath>
#include <bit>
#include <format>

#include "core/Padstack.h"
#include "core/Prof.h"
#include "gui/AppSettings.h"
#include "gui/BoardView.h"
#include "gui/Schemes.h"
#include "gui/TextFont.h"

static void initShaderResources() { Q_INIT_RESOURCE(shaders); }

namespace xr::gui {

namespace {

gl::Color col(const QColor& c) { return {std::uint8_t(c.red()), std::uint8_t(c.green()), std::uint8_t(c.blue()), std::uint8_t(c.alpha())}; }

// TopoR shows selected objects brighter by «Выделенные объекты, %».
QColor brighter(QColor c, int rate) {
  auto up = [&](int v) { return v + (255 - v) * rate / 100; };
  return QColor(up(c.red()), up(c.green()), up(c.blue()), c.alpha());
}

constexpr gl::Stroke kHair{0, 0.5f};  // a line one pixel wide

}  // namespace

// ---------------------------------------------------------------- the pieces

// A wire: as wide as it is, or a pixel in the thin-wire mode.
void BoardView::sceneTrack(gl::SceneBuilder& sb, const Track& t, const QColor& c) const {
  const bool thin = doc_->display().flag("showThinWires", false);
  sb.track(t, thin ? kHair : gl::Stroke{double(t.width) / 2}, col(c));
}

// The flexible fixation («гибкая фиксация»): a dashed centre line in the background's colour over the wire (over a
// thin one the line itself comes out dashed).
void BoardView::sceneFlexFix(gl::SceneBuilder& sb, const Track& t) const {
  const DisplayControl& d = doc_->display();
  if (!doc_->board()->flexFixed(t.net) || !d.flag("showFlexFix")) return;
  const bool thin = d.flag("showThinWires", false);
  sb.track(t, thin ? gl::Stroke{0, 0.5f, 0, -2} : gl::Stroke{double(t.width) / 6, 0, 1, -2}, col(doc_->color("background", 0x030b10)));
}

// The lines as the board lays them out (Board::textLayout), each in the style's font with its cell (ascent and
// descent) one character height; a line's top is the top of its capitals, as TopoR has it. The glyphs' outlines go
// as they are: their curves are cut in the shader.
void BoardView::sceneText(gl::SceneBuilder& sb, const Text& t, const QColor& c) const {
  const Board& b = *doc_->board();
  const TextStyle& st = b.styleOf(t);
  // The outlines of a text are kept from scene to scene (building them was most of a mechanical layer's time).
  const std::string key = std::format("{}|{}|{}{}|{}|{}", st.font, st.height, int(st.bold), int(st.italic), int(t.align), t.text);
  if (textPaths_.size() > 20000) textPaths_.clear();
  auto [it, fresh] = textPaths_.try_emplace(key);
  QPainterPath& path = it->second;
  if (fresh) {
    const TextLayout l = b.textLayout(t);
    const QFont f = textFont(st);
    const QFontMetricsF fm(f);
    const double k = l.lineHeight / (fm.ascent() + fm.descent());  // nm per font pixel
    for (auto [i, line] : v::enumerate(l.lines)) {
      QPainterPath one;
      one.addText(0, fm.capHeight(), f, QString::fromUtf8(line.data(), qsizetype(line.size())));
      path.addPath(QTransform().translate(l.left, l.top + double(i) * l.lineHeight).scale(k, k).map(one));
    }
  }
  QTransform tr;
  tr.translate(t.pos.x, t.pos.y);
  tr.rotate(-t.angle);
  if (t.mirror) tr.scale(-1, 1);
  sb.path(path, tr, col(c));
}

void BoardView::sceneGraphic(gl::SceneBuilder& sb, const Graphic& g, const QColor& c) const {
  sb.graphic(g, {double(g.width) / 2, 0.5f}, col(c), doc_->board()->drawnFilled(g));
}

// A keepout: its areas hatched with a contour, its lines dashed.
void BoardView::sceneKeepout(gl::SceneBuilder& sb, const Keepout& k, const QColor& c) const {
  for (const Graphic& g : k.shape) {
    if (!g.closed()) {
      sb.graphic(g, {0, 1, 0, 5}, col(c), false);
      continue;
    }
    if (auto contour = gl::contourOf(g)) sb.polygon(std::vector<gl::SceneBuilder::Contour>{*contour}, col(c), true);
    sb.graphic(g, {0, 0.75f}, col(c), false);
  }
}

void BoardView::sceneLayer(gl::SceneBuilder& sb, LayerId l) const {
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  const LayerDisplay* ld = d.layer(b.layers[l].name);
  QColor details = QColor::fromRgb(QRgb(ld ? ld->details : 0xc0c0c0));
  QColor padColor = QColor::fromRgb(QRgb(ld ? ld->pads : 0xc0c0c0));
  QColor fixColor = QColor::fromRgb(QRgb(ld ? ld->fix : 0x808080));
  bool showDetails = !ld || ld->showDetails, showPads = !ld || ld->showPads;
  const Layer& L = b.layers[l];
  if (L.kind == LayerKind::Copper) {
    if (d.flag("showCoppers")) {
      ProfScope ps("scene.zones");
      for (auto& z : sketch_ ? sketch_->zones : b.zones)
        if (z.layer == l) {
          const gl::Color c = col(netColor(z.net, d.colorizeCopper).value_or(details));
          for (auto& f : z.filled) sb.polygon(f, c);
          // An unpoured area shows its outline; cutouts are dashed.
          if (z.filled.empty()) sb.loop(z.outline, kHair, c);
          for (auto& cut : z.cutouts) sb.loop(cut, {0, 0.5f, 0, 4}, c);
        }
      sb.flush();
    }
    if (d.flag("showWires") && showDetails) {
      ProfScope ps("scene.tracks");
      for (auto& t : shownTracks())
        if (t.layer == l) sceneTrack(sb, t, netColor(t.net, d.colorizeWire).value_or(t.locked ? fixColor : details));
      sb.flush();
      for (auto& t : shownTracks())
        if (t.layer == l) sceneFlexFix(sb, t);
      // The clasps («замки») of the zipped sections: a bar across the pair at each end of its axis.
      const gl::Color light = col(details.lighter(170));
      for (const ZippedWire& z : b.zips) {
        if (z.layer != l || z.axis.empty()) continue;
        for (int end = 0; end < 2; ++end) {
          const Track& piece = end ? z.axis.back() : z.axis.front();
          const Vec2 at = end ? piece.b.v() : piece.a.v();
          Vec2 dir;
          if (piece.mid) {
            const ArcGeom g = ArcGeom::fromThreePoints(piece.a.v(), piece.mid->v(), piece.b.v());
            dir = (at - g.center).perp();
          } else {
            dir = piece.b.v() - piece.a.v();
          }
          if (dir.len2() < 1) continue;
          const Vec2 n = dir.normalized().perp() * (double(z.width()) / 2.0);
          sb.segment(at - n, at + n, {0, 1}, light);
        }
      }
      // The axes of the zipped sections, thin between their conductors (a selected one's is drawn again, white,
      // with its handles).
      if (d.flag("showZipAxis"))
        for (const ZippedWire& z : b.zips)
          if (z.layer == l)
            for (const Track& t : z.axis) sb.track(t, kHair, light);
      sb.flush();
    }
    if (d.flag("showMetalPads") && showPads) {
      ProfScope ps("scene.pads");
      bool special = d.flag("throughPad", false);
      QColor through = doc_->color("clrThroughPads", 0xc0c0c0);
      for (auto& pad : b.pads) {
        if (!pad.onLayer(l)) continue;
        if (pad.component >= 0 && !componentVisible(pad.component)) continue;
        // On a layer: the pad's shape there (its stack's detail: another size on an inner layer).
        if (auto on = padShapeOn(b, pad, l)) sb.shape(*on, col(netColor(pad.net, d.colorizePad).value_or(special && pad.drill > 0 ? through : padColor)));
      }
      sb.flush();
    }
    if (d.flag("showTexts") && showDetails) {
      ProfScope ps("scene.texts");
      for (auto& t : b.texts)
        if (t.layer == l) sceneText(sb, t, details);
      sb.flush();
    }
    return;
  }
  // Technical layers: the pads' details on the mask and paste layers, drawings of the board and of visible
  // components.
  ProfScope ps("scene.mech");
  int group = layerGroup(b, l);
  bool groupPads = group == 0 ? d.flag("showTopMechPads") : group == 2 ? d.flag("showBotMechPads") : true;
  if ((L.kind == LayerKind::Mask || L.kind == LayerKind::Paste) && showPads && groupPads) {
    for (auto& pad : b.pads)
      if (pad.padstack >= 0 && (pad.component < 0 || componentVisible(pad.component)))
        if (auto on = padShapeOn(b, pad, l)) sb.shape(*on, col(padColor));
    // The vias' openings, as their type gives them.
    if (d.flag("showVias") && b.rules)
      for (auto& v : b.vias)
        if (Coord dia = viaDiameterOn(b, v, l); dia > 0) sb.disc(v.pos.v(), dia / 2.0, col(padColor));
    sb.flush();
  }
  if (!showDetails || (group == 0 && !d.flag("showTopMechDetails")) || (group == 2 && !d.flag("showBotMechDetails"))) return;
  for (int ci = 0; ci < int(b.components.size()); ++ci)
    if (componentVisible(ci))
      for (auto& g : b.components[ci].graphics)
        if (g.layer == l) sceneGraphic(sb, g, details);
  for (auto& g : b.graphics)
    if (g.layer == l) sceneGraphic(sb, g, details);
  sb.flush();
  if (d.flag("showTexts")) {
    for (auto& t : b.texts)
      if (t.layer == l) sceneText(sb, t, details);
    sb.flush();
  }
}

// ---------------------------------------------------------------- the scenes

// The board: bottom side first, active copper last among copper, top side over it, documenting layers on top; an
// active mechanical or documenting layer over them all; then what lies over every layer.
void BoardView::buildBoardScene(gl::SceneData& out) const {
  out.clear();
  if (!doc_->hasBoard()) return;
  gl::SceneBuilder sb(out);
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  auto groupOf = [&](LayerId l) { return layerGroup(b, l); };
  LayerId active = doc_->activeLayer();
  bool activeCopper = b.layers[active].kind == LayerKind::Copper;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (groupOf(l) == 2 && l != active && layerVisible(l)) sceneLayer(sb, l);
  auto cu = b.copperLayers();
  for (LayerId l : cu | v::reverse)
    if (l != active && layerVisible(l)) {
      sb.setBlend(gl::Blend::Copper, int(l));
      sceneLayer(sb, l);
    }
  if (activeCopper && layerVisible(active)) {
    sb.setBlend(gl::Blend::ActiveCopper, int(active));
    sceneLayer(sb, active);
  }
  sb.setBlend(gl::Blend::Opaque, -1);
  ProfScope psRest("scene.rest");
  if (d.flag("showVias")) {
    LayerMask vis = visibleCopper();
    QColor through = doc_->color("clrThroughVias", 0x949494), fixed = doc_->color("clrFixedVias", 0x7070b8);
    bool showFixed = d.flag("fixedVia");
    for (auto& v : shownVias())
      if (v.layers & vis) sb.disc(v.pos.v(), v.diameter / 2.0, col(netColor(v.net, d.colorizeVia).value_or(v.locked && showFixed ? fixed : through)));
    sb.flush();
  }
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if ((groupOf(l) == 0 || groupOf(l) == 3) && l != active && layerVisible(l)) sceneLayer(sb, l);
  if (!activeCopper && layerVisible(active)) sceneLayer(sb, active);
  // Board outline.
  if (d.flag("showBoardOutline")) {
    for (auto& loop : b.outline) sb.loop(loop, kHair, col(doc_->color("board", 0xd4d4d4)));
    sb.flush();
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (groupOf(l) == -1) sceneLayer(sb, l);
  }
  for (const Keepout& k : b.keepouts) {
    if (!keepoutVisible(k)) continue;
    QColor c = k.role == Keepout::Role::Route ? doc_->color("keepoutWireAll", 0xff0000)
               : k.side == Side::Top          ? doc_->color("keepoutPlaceTop", 0x259500)
               : k.side == Side::Bottom       ? doc_->color("keepoutPlaceBot", 0x00aaaa)
                                              : doc_->color("keepoutPlaceBoth", 0xf79646);
    // A keepout on one layer takes that layer's colour, as TopoR shows them.
    if (k.role == Keepout::Role::Route && std::popcount(k.layers) == 1) c = doc_->layerColor(std::countr_zero(k.layers));
    sceneKeepout(sb, k, c);
  }
  sb.flush();
  // «Габариты»: the rectangle round the component's pads and drawings in its own frame, turned with it.
  if (d.flag("showCompsBound", false)) {
    const gl::Color c = col(doc_->color("compsBound", 0xffffff));
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      const Component& comp = b.components[ci];
      if (BBox bb = componentBounds(b, ci); bb.valid())
        sb.loop({comp.toBoard({bb.minX, bb.minY}), comp.toBoard({bb.maxX, bb.minY}), comp.toBoard({bb.maxX, bb.maxY}), comp.toBoard({bb.minX, bb.maxY})}, kHair, c);
    }
    sb.flush();
  }
  // Drill holes over everything, whatever layers are shown.
  for (auto& pad : b.pads) {
    if (pad.drill <= 0) continue;
    if (pad.drillH > 0 && pad.drillH != pad.drill) {
      const Shape s = Shape::rect(pad.pos.v(), double(pad.drill), double(pad.drillH), -degToRad(pad.angle), std::min(pad.drill, pad.drillH) / 2.0);
      sb.hole(s.a, s.kind == Shape::Kind::Segment ? s.b : s.a, s.r);
    } else {
      sb.hole(pad.pos.v(), pad.pos.v(), pad.drill / 2.0);
    }
  }
  if (d.flag("showVias"))
    for (auto& v : shownVias()) sb.hole(v.pos.v(), v.pos.v(), v.drill / 2.0);
  // Ratsnest, with the «Показывать связи» filter; not over the autorouter's progress (the board's own connections).
  if (d.flag("showNetLines") && !sketch_) {
    QColor nl = doc_->color("netLines", 0xaf7d3a);
    const auto& ratsnest = [&]() -> const auto& {
      ProfScope ps("scene.connectivity");
      return doc_->connectivity().ratsnest;
    }();
    for (auto& r : ratsnest) {
      if (d.filterNetlines && !d.netlineNets.empty()) {
        bool listed = r::contains(d.netlineNets, b.nets[r.net].name);
        if (listed == d.hideFilteredNetlines) continue;
      }
      sb.segment(r.a, r.b, kHair, col(netColor(r.net, d.colorizeNetline).value_or(nl)));
    }
    sb.flush();
  }
}

// Selection and the highlighted net: the rest darkened by «Затемнение объектов», these brightened; the DRC's marks.
void BoardView::buildHighlightScene(gl::SceneData& out) const {
  out.clear();
  if (!doc_->hasBoard()) return;
  gl::SceneBuilder sb(out);
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  int hn = doc_->highlightedNet();
  if (!items.empty() || !comps.empty() || hn != kNoNet) {
    if (d.darkRate > 0) {
      QColor dark = doc_->color("background", 0x030b10);
      dark.setAlpha(d.darkRate * 255 / 100);
      sb.dim(col(dark));
    }
    int rate = d.hilightRate;
    auto lit = [&](LayerId l) { return brighter(doc_->layerColor(l), rate); };
    auto litPad = [&](const Pad& pad) {
      for (LayerId l : b.copperLayers())
        if (pad.onLayer(l) && layerVisible(l)) {
          const LayerDisplay* ld = d.layer(b.layers[l].name);
          return brighter(QColor::fromRgb(QRgb(ld ? ld->pads : 0xc0c0c0)), rate);
        }
      return brighter(QColor(0xc0, 0xc0, 0xc0), rate);
    };
    const gl::Color viaLit = col(brighter(doc_->color("clrThroughVias", 0x949494), rate));
    std::vector<const Track*> tracks;
    if (hn != kNoNet) {
      for (auto& t : b.tracks)
        if (t.net == hn && layerVisible(t.layer)) tracks.push_back(&t);
      for (auto& v : b.vias)
        if (v.net == hn) sb.disc(v.pos.v(), v.diameter / 2.0, viaLit);
      for (auto& pad : b.pads)
        if (pad.net == hn) sb.shape(pad.shapeGeom(), col(litPad(pad)));
    }
    for (ItemRef r : items) {
      if (!doc_->itemExists(r)) continue;  // (a selection outliving its items is not drawn)
      switch (r.type) {
        case ItemType::Track: tracks.push_back(&b.tracks[r.index]); break;
        case ItemType::Via: sb.disc(b.vias[r.index].pos.v(), b.vias[r.index].diameter / 2.0, viaLit); break;
        case ItemType::Pad: sb.shape(b.pads[r.index].shapeGeom(), col(litPad(b.pads[r.index]))); break;
        case ItemType::Zone: {
          const Zone& z = b.zones[r.index];
          const gl::Color c = col(lit(z.layer));
          for (auto& f : z.filled) sb.polygon(f, c);
          sb.loop(z.outline, {0, 1}, c);
          break;
        }
        case ItemType::Keepout:
          for (const Graphic& g : b.keepouts[r.index].shape) sb.graphic(g, {0, 1}, {255, 255, 255, 255}, false);
          break;
        case ItemType::Text: sceneText(sb, b.texts[r.index], lit(b.texts[r.index].layer)); break;
        case ItemType::Detail: {
          const Graphic& g = b.graphics[r.index];
          sceneGraphic(sb, g, brighter(g.layer >= 0 && b.layers[g.layer].kind == LayerKind::Edge ? doc_->color("board", 0xd4d4d4) : doc_->layerColor(g.layer), rate));
          break;
        }
      }
    }
    for (const Track* t : tracks) sceneTrack(sb, *t, lit(t->layer));
    for (int ci : comps) {
      const Component& c = b.components[ci];
      for (auto& g : c.graphics)
        if (g.layer >= 0 && layerVisible(g.layer)) sceneGraphic(sb, g, lit(g.layer));
      for (int pi : c.pads) sb.shape(b.pads[pi].shapeGeom(), col(litPad(b.pads[pi])));
    }
    sb.flush();
    for (const Track* t : tracks) sceneFlexFix(sb, *t);
    sb.flush();
  }
  if (d.flag("showViolations") && d.flag("showDRCViolations")) {
    const gl::Color c = col(doc_->color("drcViolation", 0xffffff));
    for (auto& v : doc_->drc()) sb.marker(v.pos, c);
  }
}

// The tool's work in hand, anew every frame: the route being laid and the way suggested, the figure being drawn,
// the axes of the selected zipped sections.
void BoardView::buildOverlayScene(gl::SceneData& out) const {
  out.clear();
  if (!doc_->hasBoard()) return;
  gl::SceneBuilder sb(out);
  const Board& b = *doc_->board();
  if (mode_ == Mode::Select)
    for (int z : selectedZips())
      for (const Track& t : b.zips[size_t(z)].axis) sb.track(t, kHair, {255, 255, 255, 255});
  if (mode_ == Mode::Draw && !drawPts_.empty()) {
    std::vector<Vec2> pts = drawPts_;
    pts.push_back(constrained(drawPts_.back(), snapped(cursor_)));
    auto fig = figureOf(drawShape_, pts);
    if ((drawShape_ == DrawShape::Poly || drawShape_ == DrawShape::ArcP) && pts.size() == 2) fig = figureOf(DrawShape::Line, pts);
    if (!(drawShape_ == DrawShape::ArcC && pts.size() == 2))
      for (auto& g : fig) sb.graphic(g, {0, 0.5f, 0, 4}, {0xff, 0xff, 0x60, 255}, false);
  }
  if (!routing_) return;
  const QColor c = doc_->layerColor(routeLayer_);
  const gl::Color via = col(doc_->color("clrThroughVias", 0x949494));
  if (routePair_) {  // the pair: the sections laid, the one being laid, the rubber band, as conductors
    for (const auto& sec : pr_.done)
      for (const Track& t : pairCopper(sec)) sceneTrack(sb, t, doc_->layerColor(t.layer));
    for (const Via& v : pr_.vias) sb.disc(v.pos.v(), v.diameter / 2.0, via);
    PairRoute::Section cur{routeLayer_, routeTracks_, pr_.fromP, pr_.fromN, {}, {}, false};
    const Vec2 at = constrained(routeLast_, snapped(cursor_));
    if (!pr_.clasp) {  // the conductors converging from the pads to a clasp at the cursor
      const Vec2 mid = (pr_.fromP + pr_.fromN) * 0.5;
      Vec2 d = at - mid;
      if (d.len2() < 1) return;
      const Vec2 n = d.normalized().perp() * (double(pr_.w + pr_.gap) / 2.0);
      const Vec2 side = (pr_.fromP - mid).dot(n) >= 0 ? n : n * -1.0;
      const gl::Stroke s{double(pr_.w) / 2, 0.5f};
      sb.segment(pr_.fromP, at + side, s, col(brighter(c, 30)));
      sb.segment(pr_.fromN, at - side, s, col(brighter(c, 30)));
      return;
    }
    if (auto seg = makeSegment(routeLast_, at)) cur.axis.push_back(*seg);
    for (const Track& t : pairCopper(cur)) sceneTrack(sb, t, brighter(c, 30));
    return;
  }
  for (auto& t : routeTracks_) sceneTrack(sb, t, doc_->layerColor(t.layer));
  for (auto& v : routeVias_) sb.disc(v.pos.v(), v.diameter / 2.0, via);
  sb.flush();
  // Where and how the wire is led to its target (dashed), or a pointer to it when there is no way.
  if (!routeHint_.empty()) {
    for (auto& t : routeHint_) sb.track(t, {0, 0.75f, 0, 5}, col(brighter(c, 50)));
  } else if (routeTarget_) {
    sb.segment(routeLast_, routeTarget_->at, {0, 0.5f, 0, 4}, col(brighter(c, 50)));
  }
  auto magnet = routeMagnet(cursor_);
  if (auto seg = makeSegment(routeLast_, magnet ? magnet->at : constrained(routeLast_, snapped(cursor_)))) {
    QColor rc = rubberMargin(*seg) < 0 ? QColor(0xff, 0x30, 0x30) : brighter(c, 30);
    rc.setAlpha(200);
    sceneTrack(sb, *seg, rc);
  }
}

// ---------------------------------------------------------------- the frame

void BoardView::initializeGL() {
  initShaderResources();
  QString error;
  glOk_ = renderer_.init(&error);
  if (!glOk_) qWarning("XrTopoR: the board view cannot be drawn: %s", qPrintable(error));
  // The context may go before the view does (the widget moved to another window): its objects go with it.
  connect(context(), &QOpenGLContext::aboutToBeDestroyed, this, &BoardView::releaseGl);
  sceneDirty_ = true;
}

void BoardView::releaseGl() {
  if (!context()) return;
  disconnect(context(), &QOpenGLContext::aboutToBeDestroyed, this, &BoardView::releaseGl);
  makeCurrent();
  renderer_.destroy();
  glOk_ = false;
  doneCurrent();
}

// (Before the members go: the base class destroys the context after them.)
BoardView::~BoardView() { releaseGl(); }

void BoardView::paintGL() {
  ProfScope frame("paint");
  const qreal dpr = devicePixelRatioF();
  if (glOk_) {
    gl::Renderer::Frame f;
    f.w = std::max(1, int(std::lround(width() * dpr)));
    f.h = std::max(1, int(std::lround(height() * dpr)));
    f.background = doc_->hasBoard() ? col(doc_->color("background", 0x030b10)) : gl::Color{0x03, 0x0b, 0x10, 255};
    if (doc_->hasBoard()) {
      const DisplayControl& d = doc_->display();
      f.cx = center_.x, f.cy = center_.y;
      f.scale = scale_ * dpr;
      f.holeEdge = col(doc_->color("board", 0xd4d4d4));
      f.grid = d.gridShow && d.gridX > 0 && d.gridY > 0;
      f.gridDots = d.gridDots;
      QColor gc = QColor::fromRgb(QRgb(d.gridColor));
      gc.setAlpha(d.gridDots ? 160 : 60);
      f.gridColor = col(gc);
      // Too dense a grid is drawn at a multiple of its step.
      f.gridX = d.gridX, f.gridY = d.gridY;
      while (f.grid && f.gridX * f.scale < 8) f.gridX *= 2;
      while (f.grid && f.gridY * f.scale < 8) f.gridY *= 2;
      const double t = AppSettings::copperTransparency() / 100.0;
      f.copperAlpha = float(1 - t);
      f.activeAlpha = float(1 - t / 2);  // the active layer is less transparent
      // The board and the marks as drawn are kept while the view stands: a frame of the tool's work alone (the
      // cursor moved, the rubber band) puts them back and draws over them.
      const std::array<double, 6> view{center_.x, center_.y, scale_, double(f.w), double(f.h), t};
      const bool fresh = sceneDirty_ || marksDirty_ || view != keptView_;
      if (sceneDirty_) {
        ProfScope ps("paint.scene");
        buildBoardScene(boardScene_);
        ProfScope pu("scene.upload");
        renderer_.upload(gl::Renderer::Board, boardScene_);
      }
      if (sceneDirty_ || marksDirty_) {
        ProfScope ps("paint.marks");
        buildHighlightScene(highlightScene_);
        renderer_.upload(gl::Renderer::Highlight, highlightScene_);
      }
      sceneDirty_ = marksDirty_ = false;
      buildOverlayScene(overlayScene_);
      renderer_.upload(gl::Renderer::Overlay, overlayScene_);
      ProfScope ps("paint.board");
      renderer_.begin(f, defaultFramebufferObject());
      if (fresh || !renderer_.restore()) {
        renderer_.clear();
        renderer_.draw(gl::Renderer::Board);
        renderer_.draw(gl::Renderer::Highlight);
        renderer_.end();
        {  // (the labels are of the picture kept: painted before it is taken)
          ProfScope pl("tools.labels");
          QPainter p(this);
          p.setRenderHint(QPainter::Antialiasing, true);
          drawLabels(p);
        }
        renderer_.begin(f, defaultFramebufferObject());
        renderer_.keep();
        keptView_ = view;
      }
      renderer_.draw(gl::Renderer::Overlay);
      renderer_.end();
    } else {
      renderer_.begin(f, defaultFramebufferObject());
      renderer_.clear();
      renderer_.end();
    }
  }
  if (!doc_->hasBoard()) return;
  // Over the picture, the little that is in pixels: the handles, the selection frame, the ruler.
  ProfScope ps("paint.tools");
  QPainter p(this);
  p.setRenderHint(QPainter::Antialiasing, true);
  drawTools(p);
}

// A frame drawn at once and to its last pixel (the benchmark: repaint() of a widget drawn by OpenGL only asks the
// window for a frame).
void BoardView::frameNow() {
  makeCurrent();
  context()->functions()->glBindFramebuffer(GL_FRAMEBUFFER, defaultFramebufferObject());
  paintGL();
  context()->functions()->glFinish();
  doneCurrent();
}

QImage BoardView::picture() {
  if (!isVisible()) {
    // Never shown (the tests): the framebuffer follows the size by resize events, which a hidden widget does not get.
    QResizeEvent e(size(), size());
    QOpenGLWidget::resizeEvent(&e);
  }
  return grabFramebuffer();
}

}  // namespace xr::gui
