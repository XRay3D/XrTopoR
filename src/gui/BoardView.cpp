#include "gui/BoardView.h"

#include <QKeyEvent>
#include <QMenu>
#include <QMouseEvent>
#include <QPainter>
#include <QPainterPath>
#include <QWheelEvent>
#include <algorithm>
#include <cmath>
#include <map>
#include <numeric>
#include <ranges>

#include "gui/Schemes.h"
#include "gui/SmallDialogs.h"
#include "router/topo/Realizer.h"

namespace xr::gui {

BoardView::BoardView(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  setMouseTracking(true);
  setFocusPolicy(Qt::StrongFocus);
  setAutoFillBackground(false);
  connect(doc_, &Document::boardReplaced, this, [this] {
    views_.clear();
    viewPos_ = -1;
    viewTimer_.invalidate();
    cycleSeed_ = -1;
    fitBoard();
    autoFit_ = true;
  });
  connect(doc_, &Document::boardChanged, this, qOverload<>(&QWidget::update));
  connect(doc_, &Document::selectionChanged, this, qOverload<>(&QWidget::update));
  connect(doc_, &Document::layersChanged, this, [this] {
    // The 45° routing mode follows «Привязка к углу» of the display settings.
    if (doc_->hasBoard() && doc_->display().snapToAngle != (angle_ == RouteAngle::Deg45))
      setRouteAngle(doc_->display().snapToAngle ? RouteAngle::Deg45 : RouteAngle::Free);
    emit viewChanged();
    update();
  });
  connect(doc_, &Document::drcChanged, this, qOverload<>(&QWidget::update));
}

// ---------------------------------------------------------------- view transform

QPointF BoardView::toScreen(Vec2 w) const {
  return {(w.x - center_.x) * scale_ + width() / 2.0, (w.y - center_.y) * scale_ + height() / 2.0};
}

Vec2 BoardView::toWorld(QPointF s) const {
  return {(s.x() - width() / 2.0) / scale_ + center_.x, (s.y() - height() / 2.0) / scale_ + center_.y};
}

void BoardView::fitBoard() {
  if (!doc_->hasBoard()) { update(); return; }
  pushView();
  BBox bb = doc_->board()->bbox();
  if (!bb.valid()) { center_ = {}; scale_ = 1e-5; update(); return; }
  bb = bb.inflated(2 * kNmPerMm);
  center_ = bb.center();
  scale_ = std::min(width() / bb.width(), height() / bb.height());
  update();
}

void BoardView::fitAll() {
  if (!doc_->hasBoard()) return;
  pushView();
  const Board& b = *doc_->board();
  BBox bb = b.bbox();
  for (auto& t : b.tracks) {
    bb.add(t.a.v());
    bb.add(t.b.v());
  }
  for (auto& v : b.vias) bb.add(v.pos.v());
  for (auto& g : b.graphics) {
    bb.add(g.a);
    bb.add(g.b);
    for (auto& q : g.pts) bb.add(q);
  }
  if (!bb.valid()) return;
  bb = bb.inflated(2 * kNmPerMm);
  center_ = bb.center();
  scale_ = std::min(width() / bb.width(), height() / bb.height());
  update();
}

void BoardView::centerAtCursor() {
  pushView();
  center_ = cursor_;
  update();
}

void BoardView::centerOn(Vec2 p, double widthMm) {
  pushView();
  center_ = p;
  if (widthMm > 0) scale_ = width() / (widthMm * kNmPerMm);
  update();
}

void BoardView::zoomBy(double factor) {
  pushView();
  scale_ = std::clamp(scale_ * factor, 1e-7, 1e-2);
  update();
}

void BoardView::resizeEvent(QResizeEvent*) {
  if (autoFit_ && doc_->hasBoard()) {
    BBox bb = doc_->board()->bbox();
    if (bb.valid()) {
      bb = bb.inflated(2 * kNmPerMm);
      center_ = bb.center();
      scale_ = std::min(width() / bb.width(), height() / bb.height());
    }
  }
  update();
}

// ---------------------------------------------------------------- layers / picking

bool BoardView::layerVisible(LayerId l) const { return doc_->layerVisible(l); }

LayerMask BoardView::visibleCopper() const {
  LayerMask m = 0;
  for (LayerId l : doc_->board()->copperLayers())
    if (layerVisible(l)) m |= LayerMask(1) << l;
  return m;
}

bool BoardView::ratsnestVisible() const { return doc_->hasBoard() && doc_->display().flag("showNetLines"); }
bool BoardView::onlyActiveLayer() const { return doc_->hasBoard() && doc_->display().flag("showActiveLayerOnly", false); }

Vec2 BoardView::snapped(Vec2 w) const {
  if (!doc_->hasBoard() || !doc_->display().alignToGrid) return w;
  const DisplayControl& d = doc_->display();
  return {std::round(w.x / d.gridX) * d.gridX, std::round(w.y / d.gridY) * d.gridY};
}

BoardView::Pick BoardView::pick(QPointF screen) const {
  Pick pk;
  if (!doc_->hasBoard()) return pk;
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  uint32_t filter = doc_->selectionFilter();
  Vec2 w = toWorld(screen);
  pk.snap = snapped(w);
  double tol = 4.0 / scale_;  // 4 px
  BBox q;
  q.add(w);
  LayerMask vis = visibleCopper();
  // Prefer the active layer, then anything visible; vias > the pad under the cursor > tracks > pads
  // nearby (a click inside a pad takes its component, not the wire ending there).
  double best = std::numeric_limits<double>::max();
  int bestRank = 99;
  auto consider = [&](ItemRef r, int rank) {
    for (auto& s : itemShapes(b, r)) {
      double dist = s.distance(w);
      if (dist > tol) continue;
      if (r.type == ItemType::Pad && dist > 0) rank = 3;
      bool active = itemLayers(b, r) & (LayerMask(1) << doc_->activeLayer());
      int rk = rank + (active ? 0 : 10);
      if (rk < bestRank || (rk == bestRank && dist < best)) {
        best = dist;
        bestRank = rk;
        pk.item = r;
      }
    }
  };
  bool pads = (filter & (SelPins | SelComponents)) && d.flag("showMetalPads");
  doc_->index().query(q.inflated(tol), vis, [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Via:
        if ((filter & SelVias) && d.flag("showVias")) consider(r, 0);
        break;
      case ItemType::Track:
        if ((filter & SelWires) && d.flag("showWires")) consider(r, 2);
        break;
      case ItemType::Pad:
        if (pads) consider(r, 1);
        break;
      case ItemType::Zone: break;
    }
  });
  if (pk.item) {
    if (pk.item->type == ItemType::Pad) {
      pk.component = filter & SelComponents ? b.pads[pk.item->index].component : -1;
      pk.snap = b.pads[pk.item->index].pos.v();
    } else if (pk.item->type == ItemType::Via) {
      pk.snap = b.vias[pk.item->index].pos.v();
    } else {
      const Track& t = b.tracks[pk.item->index];
      if ((t.a.v() - w).len() < tol * 2) pk.snap = t.a.v();
      else if ((t.b.v() - w).len() < tol * 2) pk.snap = t.b.v();
      else if (!t.isArc()) pk.snap = closestPointOnSegment(w, t.a.v(), t.b.v());
    }
    return pk;
  }
  // Component by its drawings or pad bounding box.
  if ((filter & SelComponents) && d.flag("showComponents"))
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      const Component& c = b.components[ci];
      BBox bb;
      for (int pi : c.pads) bb.add(b.pads[pi].shapeGeom().bbox());
      for (auto& g : c.graphics)
        if (g.layer >= 0 && layerVisible(g.layer)) bb.add(graphicBBox(g));
      if (bb.valid() && bb.inflated(tol).contains(w)) {
        pk.component = ci;
        return pk;
      }
    }
  // Copper area under the cursor (the active layer first).
  if ((filter & SelCoppers) && d.flag("showCoppers")) {
    int best = -1;
    for (int zi = 0; zi < int(b.zones.size()); ++zi) {
      const Zone& z = b.zones[zi];
      if (!layerVisible(z.layer) || z.outline.size() < 3 || !pointInPolygon(w, z.outline)) continue;
      if (best < 0 || z.layer == doc_->activeLayer()) best = zi;
    }
    if (best >= 0) pk.item = ItemRef{ItemType::Zone, best};
  }
  return pk;
}

// Extent of a drawing: only the points its kind uses (unused ones are zero).
BBox BoardView::graphicBBox(const Graphic& g) {
  BBox bb;
  switch (g.kind) {
    case GraphicKind::Line:
    case GraphicKind::Rect:
      bb.add(g.a);
      bb.add(g.b);
      break;
    case GraphicKind::Arc:
      bb.add(g.a);
      bb.add(g.m);
      bb.add(g.b);
      break;
    case GraphicKind::Circle: {
      double r = (g.b - g.a).len();
      bb.add(g.a - Vec2{r, r});
      bb.add(g.a + Vec2{r, r});
      break;
    }
    case GraphicKind::Poly:
      for (auto& p : g.pts) bb.add(p);
      break;
  }
  return bb;
}

bool BoardView::componentVisible(int ci) const {
  const DisplayControl& d = doc_->display();
  if (!d.flag("showComponents")) return false;
  return doc_->board()->components[ci].side == Side::Bottom ? d.flag("showCompBot") : d.flag("showCompTop");
}

// ---------------------------------------------------------------- painting

static QPolygonF toPoly(const Polyline& pl, auto&& map) {
  QPolygonF poly;
  poly.reserve(int(pl.size()));
  for (auto& v : pl) poly << map(v);
  return poly;
}

// TopoR shows selected objects brighter by «Выделенные объекты, %».
static QColor brighter(QColor c, int rate) {
  auto up = [&](int v) { return v + (255 - v) * rate / 100; };
  return QColor(up(c.red()), up(c.green()), up(c.blue()), c.alpha());
}

void BoardView::paintEvent(QPaintEvent*) {
  QPainter p(this);
  if (!doc_->hasBoard()) {
    p.fillRect(rect(), QColor(0x03, 0x0b, 0x10));
    return;
  }
  p.fillRect(rect(), doc_->color("background", 0x030b10));
  drawGrid(p);
  p.setRenderHint(QPainter::Antialiasing, true);
  drawBoard(p);
  drawOverlay(p);
  drawTools(p);
}

void BoardView::drawTools(QPainter& p) {
  if (drag_ == Drag::None || !dragMoved_) {
    p.setPen(QPen(QColor(0x20, 0x20, 0x20), 1));
    p.setBrush(QColor(0xf0, 0xf0, 0xf0));
    for (const Marker& m : markers()) {
      QPointF c = toScreen(markerPos(m));
      if (m.kind == Marker::End) p.drawRect(QRectF(c - QPointF(3, 3), QSizeF(6, 6)));
      else p.drawEllipse(c, 3.5, 3.5);
    }
  }
  if (frameStart_) {
    // Window (→) solid, crossing (←) dashed, as in TopoR.
    bool crossing = frameEnd_.x() < frameStart_->x();
    QColor c = crossing ? QColor(0x40, 0xc0, 0x40) : QColor(0x50, 0x90, 0xff);
    p.setPen(QPen(c, 1, crossing ? Qt::DashLine : Qt::SolidLine));
    QColor fill = c;
    fill.setAlpha(40);
    p.setBrush(fill);
    p.drawRect(QRectF(*frameStart_, frameEnd_).normalized());
  }
  if (mode_ == Mode::Measure && measureA_) {
    Vec2 b = measureB_ ? *measureB_ : (measureKind_ == MeasureKind::Points ? snapped(cursor_) : cursor_);
    p.setPen(QPen(QColor(0xff, 0xff, 0x60), 1, Qt::DashLine));
    p.drawLine(toScreen(*measureA_), toScreen(b));
    p.setBrush(QColor(0xff, 0xff, 0x60));
    p.drawEllipse(toScreen(*measureA_), 3, 3);
    if (measureKind_ == MeasureKind::Points && !measureB_) {
      Unit u = doc_->unit();
      p.drawText(toScreen(b) + QPointF(10, -6), formatLength((b - *measureA_).len(), u, 3) + " " + unitName(u));
    }
  }
}

void BoardView::drawGrid(QPainter& p) {
  const DisplayControl& d = doc_->display();
  if (!d.gridShow || d.gridX <= 0 || d.gridY <= 0) return;
  // Too dense a grid is drawn at a multiple of its step.
  double sx = d.gridX, sy = d.gridY;
  while (px(sx) < 8) sx *= 2;
  while (px(sy) < 8) sy *= 2;
  Vec2 a = toWorld({0, 0}), b = toWorld({double(width()), double(height())});
  QColor c = QColor::fromRgb(QRgb(d.gridColor));
  c.setAlpha(d.gridDots ? 160 : 60);
  p.setPen(QPen(c, d.gridDots ? 1.5 : 1));
  if (d.gridDots) {
    QVector<QPointF> pts;
    for (double x = std::floor(a.x / sx) * sx; x <= b.x; x += sx)
      for (double y = std::floor(a.y / sy) * sy; y <= b.y; y += sy) pts << toScreen({x, y});
    p.drawPoints(pts.data(), int(pts.size()));
  } else {
    for (double x = std::floor(a.x / sx) * sx; x <= b.x; x += sx) {
      double sxp = toScreen({x, 0}).x();
      p.drawLine(QPointF(sxp, 0), QPointF(sxp, height()));
    }
    for (double y = std::floor(a.y / sy) * sy; y <= b.y; y += sy) {
      double syp = toScreen({0, y}).y();
      p.drawLine(QPointF(0, syp), QPointF(width(), syp));
    }
  }
}

void BoardView::drawTrack(QPainter& p, const Track& t, const QColor& c, double extra) {
  bool thin = doc_->display().flag("showThinWires", false);
  QPen pen(c, thin ? 1.0 : px(double(t.width) + extra), Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
  p.setPen(pen);
  p.setBrush(Qt::NoBrush);
  if (!t.isArc()) {
    p.drawLine(toScreen(t.a.v()), toScreen(t.b.v()));
    return;
  }
  auto pts = t.path(std::max(500.0, 0.3 / scale_));
  QPolygonF poly = toPoly(pts, [&](Vec2 v) { return toScreen(v); });
  p.drawPolyline(poly);
}

void BoardView::drawPad(QPainter& p, const Pad& pad, LayerId, const QColor& c) {
  Shape s = pad.shapeGeom();
  p.setPen(Qt::NoPen);
  p.setBrush(c);
  if (s.kind == Shape::Kind::Point) {
    QPointF ctr = toScreen(s.a);
    double r = px(s.r);
    p.drawEllipse(ctr, r, r);
  } else {
    auto outline = s.outline(std::max(2000.0, 0.5 / scale_));
    p.drawPolygon(toPoly(outline, [&](Vec2 v) { return toScreen(v); }));
  }
}

void BoardView::drawVia(QPainter& p, const Via& v, const QColor& c) {
  p.setPen(Qt::NoPen);
  p.setBrush(c);
  QPointF ctr = toScreen(v.pos.v());
  double r = px(v.diameter / 2.0);
  p.drawEllipse(ctr, r, r);
}

void BoardView::drawGraphic(QPainter& p, const Graphic& g, const QColor& c) {
  QPen pen(c, std::max(1.0, px(double(g.width))), Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
  p.setPen(pen);
  p.setBrush(g.filled ? QBrush(c) : Qt::NoBrush);
  switch (g.kind) {
    case GraphicKind::Line: p.drawLine(toScreen(g.a), toScreen(g.b)); break;
    case GraphicKind::Arc: {
      auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
      if (!arc.valid) {
        p.drawLine(toScreen(g.a), toScreen(g.b));
        break;
      }
      p.drawPolyline(toPoly(arc.tessellate(std::max(2000.0, 0.5 / scale_)), [&](Vec2 v) { return toScreen(v); }));
      break;
    }
    case GraphicKind::Circle: {
      double r = px((g.b - g.a).len());
      p.drawEllipse(toScreen(g.a), r, r);
      break;
    }
    case GraphicKind::Rect: {
      QPointF a = toScreen(g.a), b = toScreen(g.b);
      p.drawRect(QRectF(a, b));
      break;
    }
    case GraphicKind::Poly: {
      if (g.pts.size() < 2) break;
      QPolygonF poly = toPoly(g.pts, [&](Vec2 v) { return toScreen(v); });
      if (g.filled) p.drawPolygon(poly);
      else {
        poly << poly.first();
        p.drawPolyline(poly);
      }
      break;
    }
  }
}

// Special colour of a net («Цепи» tab), if any and enabled for this kind of object.
std::optional<QColor> BoardView::netColor(int net, bool enabledForKind) const {
  const DisplayControl& d = doc_->display();
  if (net < 0 || !d.colorNets || !enabledForKind) return std::nullopt;
  const std::string& name = doc_->board()->nets[net].name;
  for (auto& nc : d.netColors)
    if (nc.net == name) return QColor::fromRgb(QRgb(nc.color));
  return std::nullopt;
}

void BoardView::drawLayer(QPainter& p, LayerId l) {
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
      p.setPen(Qt::NoPen);
      for (auto& z : b.zones)
        if (z.layer == l) {
          p.setBrush(netColor(z.net, d.colorizeCopper).value_or(details));
          for (auto& f : z.filled) p.drawPolygon(toPoly(f, [&](Vec2 v) { return toScreen(v); }));
        }
    }
    if (d.flag("showWires") && showDetails)
      for (auto& t : b.tracks)
        if (t.layer == l) drawTrack(p, t, netColor(t.net, d.colorizeWire).value_or(t.locked ? fixColor : details));
    if (d.flag("showMetalPads") && showPads) {
      bool special = d.flag("throughPad", false);
      QColor through = doc_->color("clrThroughPads", 0xc0c0c0);
      for (auto& pad : b.pads) {
        if (!pad.onLayer(l)) continue;
        if (pad.component >= 0 && !componentVisible(pad.component)) continue;
        QColor c = special && pad.drill > 0 ? through : padColor;
        drawPad(p, pad, l, netColor(pad.net, d.colorizePad).value_or(c));
      }
    }
    return;
  }
  // Technical layers: drawings of the board and of visible components.
  int group = layerGroup(b, l);
  if (!showDetails || (group == 0 && !d.flag("showTopMechDetails")) || (group == 2 && !d.flag("showBotMechDetails")))
    return;
  auto draw = [&](const Graphic& g) {
    if (L.kind == LayerKind::Edge && g.filled) {  // board contours are never filled
      Graphic h = g;
      h.filled = false;
      drawGraphic(p, h, details);
    } else {
      drawGraphic(p, g, details);
    }
  };
  for (int ci = 0; ci < int(b.components.size()); ++ci)
    if (componentVisible(ci))
      for (auto& g : b.components[ci].graphics)
        if (g.layer == l) draw(g);
  for (auto& g : b.graphics)
    if (g.layer == l) draw(g);
}

void BoardView::drawVias(QPainter& p) {
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  if (!d.flag("showVias")) return;
  LayerMask vis = visibleCopper();
  QColor through = doc_->color("clrThroughVias", 0x949494), fixed = doc_->color("clrFixedVias", 0x7070b8);
  bool showFixed = d.flag("fixedVia");
  for (auto& v : b.vias)
    if (v.layers & vis) drawVia(p, v, netColor(v.net, d.colorizeVia).value_or(v.locked && showFixed ? fixed : through));
}

void BoardView::drawLabels(QPainter& p) {
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  QFont f = font();
  // Component names at the component origin.
  if (d.flag("showCompsDes")) {
    f.setPixelSize(std::clamp(int(px(1.0 * kNmPerMm)), 7, 18));
    p.setFont(f);
    p.setPen(doc_->color("compsName", 0xffffff));
    if (px(0.6 * kNmPerMm) >= 3)
      for (int ci = 0; ci < int(b.components.size()); ++ci)
        if (componentVisible(ci)) {
          QRectF r(toScreen(b.components[ci].pos.v()) - QPointF(60, 10), QSizeF(120, 20));
          p.drawText(r, Qt::AlignCenter, QString::fromStdString(b.components[ci].ref));
        }
  }
  // Pin names and nets inside pads big enough on screen.
  bool names = d.flag("showPinsName"), nets = d.flag("showPinsNet");
  if (!names && !nets) return;
  for (auto& pad : b.pads) {
    if (pad.component >= 0 && !componentVisible(pad.component)) continue;
    if (!(pad.copper & visibleCopper())) continue;
    double size = px(double(std::min(pad.shape.w, pad.shape.h)));
    if (size < 14) continue;
    f.setPixelSize(std::clamp(int(size / 3), 6, 14));
    p.setFont(f);
    QRectF r(toScreen(pad.pos.v()) - QPointF(size, size / 2), QSizeF(2 * size, size));
    if (names) {
      p.setPen(doc_->color("pinsName", 0xbad3ef));
      p.drawText(r, nets ? Qt::AlignHCenter | Qt::AlignTop : Qt::AlignCenter, QString::fromStdString(pad.number));
    }
    if (nets && pad.net >= 0) {
      p.setPen(doc_->color("pinsNet", 0xbad3ef));
      p.drawText(r, names ? Qt::AlignHCenter | Qt::AlignBottom : Qt::AlignCenter, QString::fromStdString(b.nets[pad.net].name));
    }
  }
}

void BoardView::drawBoard(QPainter& p) {
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  // Bottom side first, active copper last among copper, top side over it, documenting layers on top.
  auto groupOf = [&](LayerId l) { return layerGroup(b, l); };
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (groupOf(l) == 2 && layerVisible(l)) drawLayer(p, l);
  auto cu = b.copperLayers();
  LayerId active = doc_->activeLayer();
  for (LayerId l : cu | std::views::reverse)
    if (l != active && layerVisible(l)) drawLayer(p, l);
  if (layerVisible(active)) drawLayer(p, active);
  drawVias(p);
  // Drill holes in the background colour.
  p.setPen(Qt::NoPen);
  p.setBrush(doc_->color("background", 0x030b10));
  LayerMask vis = visibleCopper();
  for (auto& pad : b.pads)
    if (pad.drill > 0 && (pad.copper & vis || !pad.copper)) {
      double r = px(pad.drill / 2.0);
      if (pad.drillH > 0 && pad.drillH != pad.drill) {
        Shape s = Shape::rect(pad.pos.v(), double(pad.drill), double(pad.drillH), -degToRad(pad.angle),
                              std::min(pad.drill, pad.drillH) / 2.0);
        p.drawPolygon(toPoly(s.outline(2000), [&](Vec2 v) { return toScreen(v); }));
      } else if (r >= 0.5) {
        p.drawEllipse(toScreen(pad.pos.v()), r, r);
      }
    }
  if (d.flag("showVias"))
    for (auto& v : b.vias)
      if (v.layers & vis) {
        double r = px(v.drill / 2.0);
        if (r >= 0.5) p.drawEllipse(toScreen(v.pos.v()), r, r);
      }
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if ((groupOf(l) == 0 || groupOf(l) == 3) && layerVisible(l)) drawLayer(p, l);
  // Board outline.
  if (d.flag("showBoardOutline")) {
    p.setPen(QPen(doc_->color("board", 0xd4d4d4), 1));
    p.setBrush(Qt::NoBrush);
    for (auto& loop : b.outline) p.drawPolygon(toPoly(loop, [&](Vec2 v) { return toScreen(v); }));
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (groupOf(l) == -1) drawLayer(p, l);
  }
  drawLabels(p);

  // Ratsnest, with the «Показывать связи» filter.
  if (d.flag("showNetLines")) {
    QColor nl = doc_->color("netLines", 0xaf7d3a);
    for (auto& r : doc_->connectivity().ratsnest) {
      if (d.filterNetlines && !d.netlineNets.empty()) {
        bool listed = std::ranges::contains(d.netlineNets, b.nets[r.net].name);
        if (listed == d.hideFilteredNetlines) continue;
      }
      p.setPen(QPen(netColor(r.net, d.colorizeNetline).value_or(nl), 1));
      p.drawLine(toScreen(r.a), toScreen(r.b));
    }
  }

  // Selection and the highlighted net: others darkened by «Затемнение объектов», selected brightened.
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  int hn = doc_->highlightedNet();
  if (!items.empty() || !comps.empty() || hn != kNoNet) {
    if (d.darkRate > 0) {
      QColor dark = doc_->color("background", 0x030b10);
      dark.setAlpha(d.darkRate * 255 / 100);
      p.fillRect(rect(), dark);
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
    QColor viaLit = brighter(doc_->color("clrThroughVias", 0x949494), rate);
    if (hn != kNoNet) {
      for (auto& t : b.tracks)
        if (t.net == hn && layerVisible(t.layer)) drawTrack(p, t, lit(t.layer));
      for (auto& v : b.vias)
        if (v.net == hn) drawVia(p, v, viaLit);
      for (auto& pad : b.pads)
        if (pad.net == hn) drawPad(p, pad, -1, litPad(pad));
    }
    for (ItemRef r : items) {
      switch (r.type) {
        case ItemType::Track: drawTrack(p, b.tracks[r.index], lit(b.tracks[r.index].layer)); break;
        case ItemType::Via: drawVia(p, b.vias[r.index], viaLit); break;
        case ItemType::Pad: drawPad(p, b.pads[r.index], -1, litPad(b.pads[r.index])); break;
        case ItemType::Zone: {
          const Zone& z = b.zones[r.index];
          QColor c = lit(z.layer);
          p.setPen(QPen(c, 2));
          QColor fill = c;
          fill.setAlpha(z.filled.empty() ? 40 : 255);
          p.setBrush(fill);
          for (auto& f : z.filled) p.drawPolygon(toPoly(f, [&](Vec2 v) { return toScreen(v); }));
          p.setBrush(Qt::NoBrush);
          p.drawPolygon(toPoly(z.outline, [&](Vec2 v) { return toScreen(v); }));
          break;
        }
      }
    }
    for (int ci : comps) {
      const Component& c = b.components[ci];
      for (auto& g : c.graphics)
        if (g.layer >= 0 && layerVisible(g.layer)) drawGraphic(p, g, lit(g.layer));
      for (int pi : c.pads) drawPad(p, b.pads[pi], -1, litPad(b.pads[pi]));
    }
  }

  // DRC markers.
  if (d.flag("showViolations") && d.flag("showDRCViolations")) {
    p.setPen(QPen(doc_->color("drcViolation", 0xffffff), 2));
    p.setBrush(Qt::NoBrush);
    for (auto& v : doc_->drc()) {
      QPointF c = toScreen(v.pos);
      p.drawEllipse(c, 7, 7);
      p.drawLine(c + QPointF(-4, -4), c + QPointF(4, 4));
      p.drawLine(c + QPointF(-4, 4), c + QPointF(4, -4));
    }
  }
}

void BoardView::drawOverlay(QPainter& p) {
  if (!routing_) return;
  QColor c = doc_->layerColor(routeLayer_);
  for (auto& t : routeTracks_) drawTrack(p, t, doc_->layerColor(t.layer));
  for (auto& v : routeVias_) drawVia(p, v, doc_->color("clrThroughVias", 0x949494));
  if (auto seg = makeSegment(routeLast_, constrained(routeLast_, snapped(cursor_)))) {
    double m = rubberMargin(*seg);
    QColor rc = m < 0 ? QColor(0xff, 0x30, 0x30) : brighter(c, 30);
    rc.setAlpha(200);
    drawTrack(p, *seg, rc);
  }
}

// ---------------------------------------------------------------- mouse / keys

void BoardView::mousePressEvent(QMouseEvent* e) {
  setFocus();
  lastMouse_ = e->position();
  if (e->button() == Qt::MiddleButton) {
    panning_ = true;
    return;
  }
  if (placing_ && (e->button() == Qt::LeftButton || e->button() == Qt::RightButton)) {
    // A click places the pasted fragment, the right button drops it.
    if (e->button() == Qt::LeftButton) finishDrag();
    else cancelDrag();
    return;
  }
  if (e->button() == Qt::RightButton) {
    rightDown_ = true;
    rightMoved_ = false;
    rightPos_ = e->position();
    return;
  }
  if (e->button() != Qt::LeftButton || !doc_->hasBoard()) return;
  Pick pk = pick(e->position());
  Vec2 w = snapped(toWorld(e->position()));
  emit clicked(w);
  switch (mode_) {
    case Mode::Select: {
      bool add = e->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier);
      // A marker of a selected segment edits it; the segment itself moves in parallel.
      if (!add)
        if (auto mk = markerAt(e->position())) {
          startDrag(mk->kind == Marker::End ? Drag::Vertex : Drag::Bend, w, mk);
          if (pk.item || pk.component >= 0) pendingClick_ = pk;  // a click there still selects
          break;
        }
      if (!pk.item && pk.component < 0) {
        // Empty spot: a frame selection starts (a click alone clears the selection).
        frameStart_ = frameEnd_ = e->position();
        if (!add) doc_->clearSelection();
        break;
      }
      if (add) {
        clickSelect(pk, e->modifiers());
        break;
      }
      // Pressing a selected object drags the whole selection; a click without a drag selects it alone.
      bool selected = (pk.component >= 0 && std::ranges::contains(doc_->selectedComponents(), pk.component)) ||
                      (pk.component < 0 && pk.item && std::ranges::contains(doc_->selectedItems(), *pk.item));
      if (selected) pendingClick_ = pk;
      else clickSelect(pk, {});
      edit::Fragment f = selectedFragment();
      if (!f.empty()) {
        bool segment = f.tracks.size() == 1 && f.components.empty() && f.vias.empty() && f.zones.empty();
        startDrag(segment ? Drag::Segment : Drag::Fragment, w);
      }
      break;
    }
    case Mode::Route: {
      if (!routing_) routeStart(pk, pk.item ? pk.snap : w);
      else routeAddPoint(constrained(routeLast_, pk.item && itemNet(*doc_->board(), *pk.item) == routeNet_ ? pk.snap : w), pk);
      break;
    }
    case Mode::Via: {
      Board& b = *doc_->board();
      auto before = doc_->beginEdit();
      Via v;
      v.pos = Point(w);
      v.net = pk.item ? itemNet(b, *pk.item) : kNoNet;
      const NetClass& nc = b.classOf(v.net);
      v.diameter = nc.viaDiameter;
      v.drill = nc.viaDrill;
      v.layers = b.allCopperMask();
      b.vias.push_back(v);
      doc_->commitEdit(before, tr("Добавить переход"));
      break;
    }
    case Mode::Measure: measureClick(pk, w); break;
  }
  update();
}

void BoardView::clickSelect(const Pick& pk, Qt::KeyboardModifiers mods) {
  bool add = mods & (Qt::ShiftModifier | Qt::ControlModifier);
  auto items = add ? doc_->selectedItems() : std::vector<ItemRef>{};
  auto comps = add ? doc_->selectedComponents() : std::vector<int>{};
  auto toggle = [&](auto& list, auto v) {
    if (auto it = std::ranges::find(list, v); it != list.end()) list.erase(it);
    else list.push_back(v);
  };
  if (pk.item && pk.item->type != ItemType::Pad) {
    toggle(items, *pk.item);
    cycleSeed_ = pk.item->type == ItemType::Track ? pk.item->index : -1;
    cycleLevel_ = 0;
  } else if (pk.component >= 0) {
    toggle(comps, pk.component);
    if (pk.item && !add) items.push_back(*pk.item);
  } else if (pk.item) {
    toggle(items, *pk.item);  // a pad alone (components filtered out)
  }
  doc_->setSelection(std::move(items), std::move(comps));
}

void BoardView::selectInFrame(QRectF screenRect, bool crossing, bool add) {
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  uint32_t filter = doc_->selectionFilter();
  BBox box;
  box.add(toWorld(screenRect.topLeft()));
  box.add(toWorld(screenRect.bottomRight()));
  // Window (left to right): objects entirely inside; crossing (right to left): touched ones too.
  auto hit = [&](const BBox& bb) {
    if (!bb.valid()) return false;
    if (crossing) return bb.intersects(box);
    return box.contains({bb.minX, bb.minY}) && box.contains({bb.maxX, bb.maxY});
  };
  auto items = add ? doc_->selectedItems() : std::vector<ItemRef>{};
  auto comps = add ? doc_->selectedComponents() : std::vector<int>{};
  auto addItem = [&](ItemRef r) {
    if (!std::ranges::contains(items, r)) items.push_back(r);
  };
  if ((filter & SelWires) && d.flag("showWires"))
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (layerVisible(b.tracks[i].layer) && hit(itemBBox(b, {ItemType::Track, i}))) addItem({ItemType::Track, i});
  if ((filter & SelVias) && d.flag("showVias"))
    for (int i = 0; i < int(b.vias.size()); ++i)
      if (hit(itemBBox(b, {ItemType::Via, i}))) addItem({ItemType::Via, i});
  if ((filter & SelCoppers) && d.flag("showCoppers"))
    for (int i = 0; i < int(b.zones.size()); ++i) {
      BBox bb;
      for (auto& v : b.zones[i].outline) bb.add(v);
      if (layerVisible(b.zones[i].layer) && hit(bb)) addItem({ItemType::Zone, i});
    }
  if (filter & SelComponents)
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      BBox bb;
      for (int pi : b.components[ci].pads) bb.add(b.pads[pi].shapeGeom().bbox());
      if (hit(bb) && !std::ranges::contains(comps, ci)) comps.push_back(ci);
    }
  doc_->setSelection(std::move(items), std::move(comps));
}

std::vector<ItemRef> BoardView::wireOf(int track) const {
  // A wire: same-net tracks joined end to end (through vias), not passing through pads.
  const Board& b = *doc_->board();
  int net = b.tracks[track].net;
  std::vector<char> seenT(b.tracks.size(), 0), seenV(b.vias.size(), 0);
  std::vector<ItemRef> out;
  std::vector<std::pair<Vec2, LayerMask>> todo;
  auto atPad = [&](Vec2 p, LayerMask lm) {
    for (auto& pad : b.pads)
      if (pad.net == net && (pad.copper & lm) && pad.shapeGeom().contains(p)) return true;
    return false;
  };
  auto visit = [&](int ti) {
    seenT[ti] = 1;
    out.push_back({ItemType::Track, ti});
    const Track& t = b.tracks[ti];
    LayerMask lm = LayerMask(1) << t.layer;
    for (Vec2 p : {t.a.v(), t.b.v()})
      if (!atPad(p, lm)) todo.push_back({p, lm});
  };
  visit(track);
  while (!todo.empty()) {
    auto [p, lm] = todo.back();
    todo.pop_back();
    for (int vi = 0; vi < int(b.vias.size()); ++vi)
      if (!seenV[vi] && b.vias[vi].net == net && (b.vias[vi].pos.v() - p).len() <= b.vias[vi].diameter / 2.0) {
        seenV[vi] = 1;
        out.push_back({ItemType::Via, vi});
        todo.push_back({b.vias[vi].pos.v(), b.vias[vi].layers});
      }
    for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
      const Track& t = b.tracks[ti];
      if (seenT[ti] || t.net != net || !((lm >> t.layer) & 1)) continue;
      double tol = t.width / 2.0;
      if ((t.a.v() - p).len() <= tol || (t.b.v() - p).len() <= tol) visit(ti);
    }
  }
  return out;
}

void BoardView::selectWire() {
  if (!doc_->hasBoard()) return;
  std::vector<ItemRef> items;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track)
      for (ItemRef w : wireOf(r.index))
        if (!std::ranges::contains(items, w)) items.push_back(w);
  if (!items.empty()) doc_->setSelection(std::move(items), {});
}

void BoardView::selectNet() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  std::vector<int> nets;
  for (ItemRef r : doc_->selectedItems())
    if (int n = itemNet(b, r); n >= 0 && !std::ranges::contains(nets, n)) nets.push_back(n);
  if (nets.empty()) return;
  std::vector<ItemRef> items;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (std::ranges::contains(nets, b.tracks[i].net)) items.push_back({ItemType::Track, i});
  for (int i = 0; i < int(b.vias.size()); ++i)
    if (std::ranges::contains(nets, b.vias[i].net)) items.push_back({ItemType::Via, i});
  for (int i = 0; i < int(b.pads.size()); ++i)
    if (std::ranges::contains(nets, b.pads[i].net)) items.push_back({ItemType::Pad, i});
  doc_->setSelection(std::move(items), {});
}

void BoardView::cycleSelection() {
  if (!doc_->hasBoard()) return;
  auto items = doc_->selectedItems();
  if (items.size() == 1 && items[0].type == ItemType::Track && cycleLevel_ != 1) {
    cycleSeed_ = items[0].index;
    cycleLevel_ = 1;
    selectWire();
  } else if (cycleLevel_ == 1 && cycleSeed_ >= 0) {
    cycleLevel_ = 2;
    selectNet();
  } else if (cycleLevel_ == 2 && cycleSeed_ >= 0 && cycleSeed_ < int(doc_->board()->tracks.size())) {
    cycleLevel_ = 0;
    doc_->setSelection({{ItemType::Track, cycleSeed_}}, {});
  }
}

void BoardView::startMeasure(MeasureKind k) {
  if (mode_ != Mode::Measure) measureReturn_ = mode_;
  measureKind_ = k;
  measureA_.reset();
  measureB_.reset();
  measureObjA_.reset();
  setMode(Mode::Measure);
}

void BoardView::measureClick(const Pick& pk, Vec2 w) {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  auto len = [&](double nm) { return formatLength(nm, u, 3) + " " + unitName(u); };
  if (measureKind_ == MeasureKind::Points) {
    Vec2 p = pk.item ? pk.snap : w;
    if (!measureA_ || measureB_) {
      measureA_ = p;
      measureB_.reset();
      emit measured(tr("Расстояние: укажите вторую точку"));
      return;
    }
    measureB_ = p;
    Vec2 d = *measureB_ - *measureA_;
    emit measured(tr("Расстояние: %1;  dx: %2;  dy: %3").arg(len(d.len()), len(std::abs(d.x)), len(std::abs(d.y))));
    return;
  }
  if (!pk.item) return;
  if (!measureObjA_ || measureB_) {
    measureObjA_ = pk.item;
    measureA_ = pk.snap;
    measureB_.reset();
    emit measured(tr("Расстояние между объектами: укажите второй объект"));
    return;
  }
  double best = std::numeric_limits<double>::max();
  for (auto& s1 : itemShapes(b, *measureObjA_))
    for (auto& s2 : itemShapes(b, *pk.item)) best = std::min(best, s1.distance(s2));
  measureB_ = pk.snap;
  emit measured(tr("Расстояние между объектами: %1").arg(len(std::max(0.0, best))));
}

void BoardView::pushView() {
  autoFit_ = false;
  // Steps of one gesture (wheel turns) merge into one history entry.
  bool merge = viewTimer_.isValid() && viewTimer_.elapsed() < 700 && viewPos_ >= 0;
  viewTimer_.restart();
  if (merge) return;
  views_.resize(size_t(viewPos_ + 1));
  views_.push_back({center_, scale_});
  if (views_.size() > 100) views_.erase(views_.begin());
  viewPos_ = int(views_.size()) - 1;
}

// History: views_[viewPos_] is the view before the latest change; views_[viewPos_ + 1], when present,
// the current one (recorded on the first step back so that «Следующий вид» returns to it).
void BoardView::prevView() {
  if (viewPos_ < 0) return;
  if (viewPos_ == int(views_.size()) - 1) views_.push_back({center_, scale_});
  center_ = views_[size_t(viewPos_)].center;
  scale_ = views_[size_t(viewPos_)].scale;
  --viewPos_;
  viewTimer_.invalidate();
  update();
}

void BoardView::nextView() {
  if (viewPos_ + 2 >= int(views_.size())) return;
  ++viewPos_;
  center_ = views_[size_t(viewPos_ + 1)].center;
  scale_ = views_[size_t(viewPos_ + 1)].scale;
  viewTimer_.invalidate();
  update();
}

void BoardView::mouseMoveEvent(QMouseEvent* e) {
  QPointF pos = e->position();
  cursor_ = toWorld(pos);
  emit cursorMoved(cursor_);
  if (rightDown_ && !rightMoved_ && (pos - rightPos_).manhattanLength() > 4) {
    rightMoved_ = true;
    pushView();
  }
  if (panning_ || (rightDown_ && rightMoved_)) {
    QPointF d = pos - lastMouse_;
    center_ -= Vec2{d.x() / scale_, d.y() / scale_};
    lastMouse_ = pos;
    update();
    return;
  }
  if (frameStart_) {
    frameEnd_ = pos;
    update();
    return;
  }
  if (drag_ != Drag::None && doc_->hasBoard()) {
    if (!dragMoved_) {
      if ((pos - dragScreen_).manhattanLength() < 4) return;
      // TopoR: nothing moves while fixed objects are among the moved ones.
      const Board& b = *doc_->board();
      bool locked = drag_ == Drag::Fragment || drag_ == Drag::Segment ? edit::hasLocked(b, dragFragment_)
                                                                       : b.tracks[dragMarker_.track].locked;
      if (locked) {
        emit status(tr("Среди выделенных объектов есть зафиксированные: перемещение запрещено"));
        cancelDrag();
        return;
      }
      dragMoved_ = true;
      pendingClick_.reset();
      dragBefore_ = doc_->beginEdit();
    }
    applyDrag();
    return;
  }
  if (mode_ == Mode::Select && !panning_ && !frameStart_)
    setCursor(markerAt(pos) ? Qt::SizeAllCursor : Qt::ArrowCursor);
  if (routing_ || mode_ == Mode::Measure) update();
  lastMouse_ = pos;
}

void BoardView::mouseReleaseEvent(QMouseEvent* e) {
  if (e->button() == Qt::MiddleButton) {
    panning_ = false;
    return;
  }
  if (e->button() == Qt::RightButton) {
    bool click = rightDown_ && !rightMoved_;
    rightDown_ = false;
    if (!click || !doc_->hasBoard()) return;
    if (routing_ || mode_ == Mode::Measure) {
      // In a tool the right button ends it, as TopoR's «Вернуться в основной режим».
      emit contextMenuRequested(e->globalPosition().toPoint());
      return;
    }
    // The object under the cursor becomes the selection unless it is already selected.
    Pick pk = pick(e->position());
    bool selected = (pk.item && std::ranges::contains(doc_->selectedItems(), *pk.item)) ||
                    (pk.component >= 0 && std::ranges::contains(doc_->selectedComponents(), pk.component));
    if (!selected && (pk.item || pk.component >= 0)) clickSelect(pk, {});
    emit contextMenuRequested(e->globalPosition().toPoint());
    return;
  }
  if (frameStart_) {
    QRectF r = QRectF(*frameStart_, frameEnd_).normalized();
    bool crossing = frameEnd_.x() < frameStart_->x();
    if (r.width() > 3 || r.height() > 3)
      selectInFrame(r, crossing, e->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier));
    frameStart_.reset();
    update();
    return;
  }
  if (drag_ != Drag::None && e->button() == Qt::LeftButton) finishDrag();
}

void BoardView::mouseDoubleClickEvent(QMouseEvent* e) {
  if (mode_ == Mode::Route && routing_ && e->button() == Qt::LeftButton) finishRoute();
}

void BoardView::wheelEvent(QWheelEvent* e) {
  pushView();
  double f = std::pow(1.0015, e->angleDelta().y());
  Vec2 before = toWorld(e->position());
  scale_ = std::clamp(scale_ * f, 1e-7, 1e-2);
  Vec2 after = toWorld(e->position());
  center_ += before - after;
  update();
}

void BoardView::keyPressEvent(QKeyEvent* e) {
  // Everything else is a window command (see Commands), so user hotkeys apply while routing too.
  if (e->key() == Qt::Key_Return || e->key() == Qt::Key_Enter) {
    finishRoute();
    return;
  }
  QWidget::keyPressEvent(e);
}

// ---------------------------------------------------------------- editing actions

void BoardView::setMode(Mode m) {
  if (routing_) cancelTool();
  mode_ = m;
  setCursor(m == Mode::Select ? Qt::ArrowCursor : Qt::CrossCursor);
  frameStart_.reset();
  emit modeChanged(m);
  switch (m) {
    case Mode::Select: emit status(tr("Выделять и перемещать объекты")); break;
    case Mode::Route: emit status(tr("Прокладка проводника: щёлкните контакт, с которого начать")); break;
    case Mode::Via: emit status(tr("Создание переходов: щёлкните место перехода")); break;
    case Mode::Measure:
      emit status(measureKind_ == MeasureKind::Points ? tr("Линейка: укажите первую точку")
                                                      : tr("Линейка: укажите первый объект"));
      break;
  }
  update();
}

void BoardView::setRouteAngle(RouteAngle a) {
  if (angle_ == a) return;
  angle_ = a;
  // «Привязка к углу» of the display settings is the 45° mode.
  if (doc_->hasBoard() && doc_->display().snapToAngle != (a == RouteAngle::Deg45)) {
    doc_->display().snapToAngle = a == RouteAngle::Deg45;
    doc_->displayChanged();
  }
  emit routeAngleChanged(a);
  update();
}

void BoardView::setRatsnestVisible(bool on) {
  if (!doc_->hasBoard()) return;
  doc_->display().show["showNetLines"] = on;
  doc_->displayChanged();
}

void BoardView::setOnlyActiveLayer(bool on) {
  if (!doc_->hasBoard()) return;
  doc_->display().show["showActiveLayerOnly"] = on;
  doc_->displayChanged();
}

void BoardView::deleteSelection() {
  if (!doc_->hasBoard() || drag_ != Drag::None) return;
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  if (items.empty() && comps.empty()) return;
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  std::vector<int> tracks, vias, zones;
  for (ItemRef r : items) {
    if (r.type == ItemType::Track) tracks.push_back(r.index);
    if (r.type == ItemType::Via) vias.push_back(r.index);
    if (r.type == ItemType::Zone) zones.push_back(r.index);
  }
  for (auto* list : {&tracks, &vias, &zones}) std::ranges::sort(*list, std::greater{});
  for (int i : tracks) b.tracks.erase(b.tracks.begin() + i);
  for (int i : vias) b.vias.erase(b.vias.begin() + i);
  for (int i : zones) b.zones.erase(b.zones.begin() + i);
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Удалить"));
}

void BoardView::rotateSelection(double deg) {
  if (!doc_->hasBoard()) return;
  if (drag_ == Drag::Fragment && dragMoved_) {
    // Space while dragging turns what is being dragged.
    dragRotate_ += deg;
    applyDrag();
    return;
  }
  transformSelection(deg, false, tr("Повернуть"));
}

void BoardView::flipSelection(bool vertical) {
  if (!doc_->hasBoard()) return;
  if (drag_ == Drag::Fragment && dragMoved_) {
    // A flip after the motion so far: about the screen axis through the pivot.
    dragRotate_ = (vertical ? 180 : 0) - dragRotate_;
    dragMirror_ = !dragMirror_;
    applyDrag();
    return;
  }
  transformSelection(vertical ? 180 : 0, true, vertical ? tr("Перевернуть вертикально") : tr("Перевернуть горизонтально"));
}

edit::Fragment BoardView::selectedFragment() const {
  edit::Fragment f;
  if (!doc_->hasBoard()) return f;
  f.components = doc_->selectedComponents();
  for (ItemRef r : doc_->selectedItems()) {
    if (r.type == ItemType::Track) f.tracks.push_back(r.index);
    if (r.type == ItemType::Via) f.vias.push_back(r.index);
    if (r.type == ItemType::Zone) f.zones.push_back(r.index);
  }
  return f;
}

void BoardView::transformSelection(double rotate, bool mirror, const QString& title) {
  edit::Fragment f = selectedFragment();
  if (f.empty()) return;
  Board& b = *doc_->board();
  if (edit::hasLocked(b, f)) {
    emit status(tr("Среди выделенных объектов есть зафиксированные: перемещение запрещено"));
    return;
  }
  auto before = doc_->beginEdit();
  edit::Motion m;
  m.pivot = edit::pivotOf(b, f);
  m.rotate = rotate;
  m.mirror = mirror;
  edit::move(b, f, m);
  auto map = edit::removeDegenerate(b);
  auto items = doc_->selectedItems();
  std::erase_if(items, [&](ItemRef& r) {
    if (r.type != ItemType::Track) return false;
    r.index = map[r.index];
    return r.index < 0;
  });
  doc_->commitEdit(before, title);
  doc_->setSelection(std::move(items), doc_->selectedComponents());
}

// ---------------------------------------------------------------- drags

std::vector<BoardView::Marker> BoardView::markers() const {
  std::vector<Marker> out;
  if (!doc_->hasBoard() || mode_ != Mode::Select) return out;
  const Board& b = *doc_->board();
  auto items = doc_->selectedItems();
  if (items.size() > 200) return out;  // markers of a whole board would hide it
  for (ItemRef r : items) {
    if (r.type != ItemType::Track || r.index >= int(b.tracks.size())) continue;
    out.push_back({r.index, Marker::End, 0});
    out.push_back({r.index, Marker::End, 1});
    // The middle marker only when the segment is long enough on screen to hold three.
    const Track& t = b.tracks[r.index];
    if (px((t.b.v() - t.a.v()).len()) > 30) out.push_back({r.index, Marker::Middle, 0});
  }
  return out;
}

Vec2 BoardView::markerPos(const Marker& m) const {
  const Track& t = doc_->board()->tracks[m.track];
  if (m.kind == Marker::End) return m.end ? t.b.v() : t.a.v();
  return t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
}

std::optional<BoardView::Marker> BoardView::markerAt(QPointF screen) const {
  std::optional<Marker> best;
  double bd = 6;  // px
  for (const Marker& m : markers()) {
    QPointF d = toScreen(markerPos(m)) - screen;
    double dist = std::hypot(d.x(), d.y());
    if (dist <= bd) {
      bd = dist;
      best = m;
    }
  }
  return best;
}

void BoardView::startDrag(Drag kind, Vec2 at, std::optional<Marker> marker) {
  drag_ = kind;
  dragMoved_ = false;
  dragScreen_ = lastMouse_;
  dragStart_ = at;
  dragFragment_ = selectedFragment();
  dragPivot_ = edit::pivotOf(*doc_->board(), dragFragment_);
  dragRotate_ = 0;
  dragMirror_ = false;
  if (marker) dragMarker_ = *marker;
  dragBefore_.reset();
}

void BoardView::applyDrag() {
  Board& b = *doc_->board();
  dragBefore_->apply(b);
  Vec2 to = snapped(cursor_);
  Vec2 d = to - dragStart_;
  edit::Motion m;
  m.pivot = dragPivot_;
  m.rotate = dragRotate_;
  m.mirror = dragMirror_;
  switch (drag_) {
    case Drag::None: break;
    case Drag::Fragment:
      m.shift = d;
      edit::move(b, dragFragment_, m);
      break;
    case Drag::Segment: {
      // A straight segment moves across itself, so its neighbours keep their directions roughly.
      const Track& t = b.tracks[dragFragment_.tracks[0]];
      Vec2 n = (t.b.v() - t.a.v()).perp().normalized();
      m.shift = t.isArc() || n.len2() == 0 ? d : n * d.dot(n);
      edit::move(b, dragFragment_, m);
      break;
    }
    case Drag::Vertex: {
      const Track& t = b.tracks[dragMarker_.track];
      Vec2 other = dragMarker_.end ? t.a.v() : t.b.v();
      edit::moveVertex(b, dragMarker_.track, dragMarker_.end, constrained(other, to));
      break;
    }
    case Drag::Bend: {
      const Track& t = b.tracks[dragMarker_.track];
      if (t.isArc()) {
        edit::bendTrack(b, dragMarker_.track, to);
      } else {
        // The middle of a straight segment becomes a new bend of the wire.
        Vec2 mid = (t.a.v() + t.b.v()) * 0.5;
        Vec2 a = t.a.v();
        edit::splitTrack(b, dragMarker_.track, mid);
        edit::moveVertex(b, dragMarker_.track, 1, constrained(a, to));
      }
      break;
    }
  }
  doc_->invalidate();
  update();
}

void BoardView::finishDrag() {
  Drag kind = drag_;
  drag_ = Drag::None;
  if (placing_) {
    placing_ = false;
    doc_->invalidate();
    doc_->commitEdit(*pasteBefore_, tr("Вставить"));
    pasteBefore_.reset();
    dragBefore_.reset();
    emit status(tr("Вставлено"));
    update();
    return;
  }
  if (!dragMoved_) {
    if (pendingClick_) clickSelect(*pendingClick_, {});
    pendingClick_.reset();
    return;
  }
  Board& b = *doc_->board();
  auto map = edit::removeDegenerate(b);
  auto items = doc_->selectedItems();
  std::erase_if(items, [&](ItemRef& r) {
    if (r.type != ItemType::Track) return false;
    r.index = r.index < int(map.size()) ? map[r.index] : -1;
    return r.index < 0;
  });
  QString title = kind == Drag::Fragment ? (dragFragment_.components.empty() ? tr("Переместить") : tr("Переместить компонент"))
                  : kind == Drag::Segment ? tr("Переместить сегмент")
                                          : tr("Изменить форму проводника");
  doc_->commitEdit(*dragBefore_, title);
  dragBefore_.reset();
  doc_->setSelection(std::move(items), doc_->selectedComponents());
  update();
}

void BoardView::cancelDrag() {
  if (placing_) {
    placing_ = false;
    pasteBefore_->apply(*doc_->board());
    pasteBefore_.reset();
    dragMoved_ = false;
    dragBefore_.reset();
    drag_ = Drag::None;
    doc_->invalidate();
    doc_->clearSelection();
    emit status(tr("Вставка отменена"));
    update();
    return;
  }
  if (dragMoved_ && dragBefore_) {
    dragBefore_->apply(*doc_->board());
    doc_->invalidate();
  }
  drag_ = Drag::None;
  dragMoved_ = false;
  dragBefore_.reset();
  pendingClick_.reset();
  update();
}

void BoardView::changeTrackWidth() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  Coord cur = routing_ ? routeWidth_ : 0;
  std::vector<int> nets;
  LayerId layer = routing_ ? routeLayer_ : doc_->activeLayer();
  if (routing_) nets.push_back(routeNet_);
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) {
      cur = b.tracks[r.index].width;
      layer = b.tracks[r.index].layer;
      if (!std::ranges::contains(nets, b.tracks[r.index].net)) nets.push_back(b.tracks[r.index].net);
    }
  if (!routing_ && nets.empty()) return;
  std::erase(nets, kNoNet);
  auto w = askTrackWidth(this, doc_, nets, layer, cur > 0 ? cur : b.netClasses[0].trackWidth);
  if (!w) return;
  if (routing_) {
    routeWidth_ = *w;
    update();
    return;
  }
  auto before = doc_->beginEdit();
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) b.tracks[r.index].width = *w;
  doc_->commitEdit(before, tr("Изменить ширину"));
}

void BoardView::recomputeShapes() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::vector<char> chosen(b.tracks.size(), 0);
  bool any = false;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) { chosen[r.index] = 1; any = true; }
  if (!any)
    for (size_t i = 0; i < b.tracks.size(); ++i) chosen[i] = !b.tracks[i].locked;
  auto before = doc_->beginEdit();
  auto st = topo::reshapeTracks(b, std::move(chosen));
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Расчёт формы проводников"));
  emit status(tr("Расчёт формы проводников: %1 проводник(ов), %2 дуг").arg(st.wires).arg(st.arcs));
}

void BoardView::cancelTool() {
  if (drag_ != Drag::None) {
    cancelDrag();
    return;
  }
  if (routing_) {
    routing_ = false;
    routeTracks_.clear();
    routeVias_.clear();
    emit status(tr("Прокладка отменена"));
    update();
    return;
  }
  if (mode_ == Mode::Measure) setMode(measureReturn_);
  else if (mode_ != Mode::Select) setMode(Mode::Select);
  else doc_->clearSelection();
}

// ---------------------------------------------------------------- routing tool

void BoardView::routeStart(const Pick& pk, Vec2 at) {
  Board& b = *doc_->board();
  routing_ = true;
  routeNet_ = pk.item ? itemNet(b, *pk.item) : kNoNet;
  routeLayer_ = doc_->activeLayer();
  if (pk.item) {
    LayerMask lm = itemLayers(b, *pk.item);
    if (!((lm >> routeLayer_) & 1))
      for (LayerId l : b.copperLayers())
        if ((lm >> l) & 1) { routeLayer_ = l; doc_->setActiveLayer(l); break; }
  }
  routeWidth_ = b.trackWidth(routeNet_, routeLayer_);
  routeTracks_.clear();
  routeVias_.clear();
  routeLast_ = at;
  routeDir_.reset();
  emit status(tr("Прокладка цепи %1 на слое %2: V — переход, Backspace — отменить сегмент, Enter — завершить, Esc — отмена")
                  .arg(routeNet_ >= 0 ? QString::fromStdString(b.nets[routeNet_].name) : tr("(без цепи)"))
                  .arg(QString::fromStdString(b.layers[routeLayer_].name)));
}

Vec2 BoardView::constrained(Vec2 from, Vec2 to) const {
  if (angle_ != RouteAngle::Deg45) return to;
  Vec2 d = to - from;
  double ang = std::atan2(d.y, d.x);
  double q = std::round(ang / (kPi / 4)) * (kPi / 4);
  double len = d.len();
  // Project onto the nearest 45-degree direction.
  Vec2 dir{std::cos(q), std::sin(q)};
  return from + dir * (d.dot(dir) > 0 ? d.dot(dir) : len);
}

std::optional<Track> BoardView::makeSegment(Vec2 from, Vec2 to) const {
  if ((to - from).len2() < 1) return std::nullopt;
  Track t;
  t.a = Point(from);
  t.b = Point(to);
  t.width = routeWidth_;
  t.layer = routeLayer_;
  t.net = routeNet_;
  if (angle_ == RouteAngle::Arc && routeDir_) {
    // Arc tangent to the previous segment: centre on the normal at `from`.
    Vec2 d = *routeDir_;
    Vec2 n = d.perp();
    Vec2 e = to - from;
    double denom = 2 * n.dot(e);
    if (std::abs(denom) > 1e-3 * e.len()) {
      double k = e.len2() / denom;
      Vec2 c = from + n * k;
      double r = std::abs(k);
      Vec2 mid = c + ((from + to) * 0.5 - c).normalized() * r;
      if (((from + to) * 0.5 - c).len() < 1) mid = c + d * r;  // half circle
      t.mid = Point(mid);
    }
  }
  return t;
}

double BoardView::rubberMargin(const Track& t) const {
  const Board& b = *doc_->board();
  double worst = std::numeric_limits<double>::max();
  // Capsule(s) of the rubber segment.
  auto pts = t.path();
  for (size_t i = 1; i < pts.size(); ++i) {
    Shape s = Shape::capsule(pts[i - 1], pts[i], t.width / 2.0);
    worst = std::min(worst, shapeMargin(b, doc_->index(), s, LayerMask(1) << t.layer, t.net));
  }
  return worst;
}

void BoardView::routeAddPoint(Vec2 at, const Pick& pk) {
  auto seg = makeSegment(routeLast_, at);
  if (seg) {
    routeTracks_.push_back(*seg);
    Vec2 dir = seg->isArc() ? (seg->b.v() - seg->mid->v()).normalized() : (seg->b.v() - seg->a.v()).normalized();
    if (seg->isArc()) {
      // Tangent at the arc end: perpendicular to the radius.
      auto g = ArcGeom::fromThreePoints(seg->a.v(), seg->mid->v(), seg->b.v());
      Vec2 rad = seg->b.v() - g.center;
      dir = (g.sweep > 0 ? rad.perp() : -rad.perp()).normalized();
    }
    routeDir_ = dir;
    routeLast_ = at;
  }
  // Clicking an item of the same net ends the route on it.
  if (pk.item && routeNet_ != kNoNet && itemNet(*doc_->board(), *pk.item) == routeNet_ && pk.item->type != ItemType::Track)
    finishRoute();
  update();
}

void BoardView::routeAddVia() {
  if (!routing_) return;
  Board& b = *doc_->board();
  const NetClass& nc = b.classOf(routeNet_);
  Via v;
  v.pos = Point(routeLast_);
  v.net = routeNet_;
  v.diameter = nc.viaDiameter;
  v.drill = nc.viaDrill;
  v.layers = b.allCopperMask();
  routeVias_.push_back(v);
  routeDir_.reset();
  // Next copper layer (cyclic).
  auto cu = b.copperLayers();
  auto it = std::ranges::find(cu, routeLayer_);
  size_t idx = it == cu.end() ? 0 : size_t(it - cu.begin());
  routeLayer_ = cu[(idx + 1) % cu.size()];
  routeWidth_ = b.trackWidth(routeNet_, routeLayer_);
  doc_->setActiveLayer(routeLayer_);
  update();
}

void BoardView::toggleLayer() {
  if (routing_) routeAddVia();
}

void BoardView::changeLayer() {
  if (routing_) {
    routeAddVia();
    return;
  }
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::vector<int> tracks = selectedFragment().tracks;
  if (tracks.empty()) {
    emit status(tr("Выделите участки проводников"));
    return;
  }
  // TopoR: the layers are offered in a menu at the cursor.
  QMenu menu(this);
  for (LayerId l : b.copperLayers()) {
    if (b.layers[l].plane) continue;
    QAction* a = menu.addAction(QString::fromStdString(b.layers[l].name));
    a->setData(l);
    a->setCheckable(true);
    a->setChecked(std::ranges::all_of(tracks, [&](int ti) { return b.tracks[ti].layer == l; }));
  }
  QAction* chosen = menu.exec(QCursor::pos());
  if (!chosen) return;
  LayerId layer = chosen->data().toInt();
  if (std::ranges::any_of(tracks, [&](int ti) { return b.tracks[ti].locked; }))
    emit status(tr("Зафиксированные участки проводников остались на своём слое"));
  auto before = doc_->beginEdit();
  int vias = edit::changeLayer(b, tracks, layer);
  doc_->commitEdit(before, tr("Изменить слой"));
  if (vias) emit status(tr("Добавлено переходов: %1").arg(vias));
  update();
}

void BoardView::straighten() {
  if (!doc_->hasBoard()) return;
  std::vector<int> tracks = selectedFragment().tracks;
  if (tracks.empty()) return;
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  int made = edit::straighten(b, tracks);
  if (!made) {
    emit status(tr("Спрямить можно цепочку нефиксированных сегментов одного проводника без ветвлений"));
    return;
  }
  doc_->commitEdit(before, tr("Спрямить"));
  // The new segments stay selected (they are appended).
  std::vector<ItemRef> items;
  for (size_t i = b.tracks.size() - size_t(made); i < b.tracks.size(); ++i) items.push_back({ItemType::Track, int(i)});
  doc_->setSelection(std::move(items), {});
}

void BoardView::unlinkSelection() {
  if (!doc_->hasBoard()) return;
  edit::Fragment f = selectedFragment();
  if (f.components.empty() && f.vias.empty()) return;
  auto before = doc_->beginEdit();
  int n = edit::unlink(*doc_->board(), f);
  if (!n) return;
  doc_->setSelection({}, f.components);
  doc_->commitEdit(before, tr("Отсоединить"));
  emit status(tr("Отсоединено участков проводников: %1").arg(n));
}

void BoardView::changeNet() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  edit::Fragment f = selectedFragment();
  std::vector<int> pads;
  int current = kNoNet;
  for (ItemRef r : doc_->selectedItems()) {
    if (r.type == ItemType::Pad) pads.push_back(r.index);
    if (current == kNoNet) current = itemNet(b, r);
  }
  if (f.tracks.empty() && f.vias.empty() && f.zones.empty() && pads.empty()) {
    emit status(tr("Выделите проводники, переходы, контакты или области металлизации"));
    return;
  }
  auto net = askNet(this, doc_, current);
  if (!net) return;
  auto before = doc_->beginEdit();
  edit::changeNet(b, f, pads, *net);
  doc_->commitEdit(before, tr("Изменить цепь"));
}

static edit::Clip& clipboard() {
  static edit::Clip c;
  return c;
}

bool BoardView::clipboardEmpty() { return clipboard().empty(); }

void BoardView::copySelection() {
  if (!doc_->hasBoard()) return;
  edit::Fragment f = selectedFragment();
  f.components.clear();
  if (f.empty()) {
    emit status(tr("Копируются проводники, переходы и области металлизации"));
    return;
  }
  clipboard() = edit::copy(*doc_->board(), f);
  emit status(tr("Скопировано объектов: %1").arg(f.tracks.size() + f.vias.size() + f.zones.size()));
}

void BoardView::cutSelection() {
  if (!doc_->hasBoard()) return;
  edit::Fragment f = selectedFragment();
  f.components.clear();
  if (f.empty()) return;
  clipboard() = edit::copy(*doc_->board(), f);
  auto before = doc_->beginEdit();
  edit::erase(*doc_->board(), f);
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Вырезать"));
}

void BoardView::duplicateSelection() {
  copySelection();
  if (!clipboard().empty()) paste();
}

void BoardView::paste() {
  if (!doc_->hasBoard()) return;
  if (clipboard().empty()) {
    emit status(tr("Буфер обмена пуст"));
    return;
  }
  if (drag_ != Drag::None) cancelDrag();
  if (mode_ != Mode::Select) setMode(Mode::Select);
  Board& b = *doc_->board();
  pasteBefore_ = doc_->beginEdit();
  Vec2 at = snapped(cursor_);
  edit::Fragment f = edit::paste(b, clipboard(), at);
  if (f.empty()) {
    pasteBefore_.reset();
    emit status(tr("В дизайне нет слоёв скопированных объектов"));
    return;
  }
  doc_->invalidate();
  std::vector<ItemRef> items;
  for (int i : f.tracks) items.push_back({ItemType::Track, i});
  for (int i : f.vias) items.push_back({ItemType::Via, i});
  for (int i : f.zones) items.push_back({ItemType::Zone, i});
  doc_->setSelection(std::move(items), {});
  startDrag(Drag::Fragment, at);
  dragMoved_ = true;
  dragBefore_ = doc_->beginEdit();
  placing_ = true;
  emit status(tr("Вставка: щёлкните, где разместить; Space — повернуть, Esc — отмена"));
  update();
}

void BoardView::invertSelection() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  const DisplayControl& d = doc_->display();
  uint32_t filter = doc_->selectionFilter();
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  std::vector<ItemRef> ni;
  std::vector<int> nc;
  if ((filter & SelWires) && d.flag("showWires"))
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (layerVisible(b.tracks[i].layer) && !std::ranges::contains(items, ItemRef{ItemType::Track, i}))
        ni.push_back({ItemType::Track, i});
  if ((filter & SelVias) && d.flag("showVias"))
    for (int i = 0; i < int(b.vias.size()); ++i)
      if (!std::ranges::contains(items, ItemRef{ItemType::Via, i})) ni.push_back({ItemType::Via, i});
  if ((filter & SelCoppers) && d.flag("showCoppers"))
    for (int i = 0; i < int(b.zones.size()); ++i)
      if (layerVisible(b.zones[i].layer) && !std::ranges::contains(items, ItemRef{ItemType::Zone, i}))
        ni.push_back({ItemType::Zone, i});
  if (filter & SelComponents)
    for (int i = 0; i < int(b.components.size()); ++i)
      if (componentVisible(i) && !std::ranges::contains(comps, i)) nc.push_back(i);
  doc_->setSelection(std::move(ni), std::move(nc));
}

void BoardView::viaKey() {
  if (routing_) routeAddVia();
  else setMode(Mode::Via);
}

void BoardView::routeUndoLast() {
  if (!routing_ || routeTracks_.empty()) return;
  Track t = routeTracks_.back();
  routeTracks_.pop_back();
  if (!routeVias_.empty() && Point(routeLast_) == routeVias_.back().pos && t.layer != routeLayer_) {
    routeVias_.pop_back();
    routeLayer_ = t.layer;
    doc_->setActiveLayer(routeLayer_);
  }
  routeLast_ = t.a.v();
  routeDir_.reset();
  if (!routeTracks_.empty()) {
    const Track& pr = routeTracks_.back();
    routeDir_ = (pr.b.v() - pr.a.v()).normalized();
  }
  update();
}

void BoardView::selectCopper(int toporIndex) {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  int n = b.copperCount();
  int idx = toporIndex == 0 ? n - 1 : toporIndex - 1;  // copper index: 0 = top
  if (idx < 0 || idx >= n) return;
  LayerId l = b.copperByIndex(idx);
  if (routing_ && l != routeLayer_) {
    routeAddVia();
    routeLayer_ = l;
    routeWidth_ = b.trackWidth(routeNet_, routeLayer_);
  }
  doc_->setActiveLayer(l);
}

void BoardView::toggleMetalLayers() {
  if (!doc_->hasBoard()) return;
  auto& show = doc_->display().show;
  show["showSignalLayers"] = !doc_->display().flag("showSignalLayers");
  doc_->displayChanged();
}

void BoardView::toggleFix() {
  if (!doc_->hasBoard()) return;
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  if (items.empty() && comps.empty()) return;
  Board& b = *doc_->board();
  // Like TopoR: all become fixed unless all already are.
  bool allFixed = true;
  for (ItemRef r : items) {
    if (r.type == ItemType::Track) allFixed = allFixed && b.tracks[r.index].locked;
    if (r.type == ItemType::Via) allFixed = allFixed && b.vias[r.index].locked;
  }
  for (int ci : comps) allFixed = allFixed && b.components[ci].locked;
  auto before = doc_->beginEdit();
  for (ItemRef r : items) {
    if (r.type == ItemType::Track) b.tracks[r.index].locked = !allFixed;
    if (r.type == ItemType::Via) b.vias[r.index].locked = !allFixed;
  }
  for (int ci : comps) b.components[ci].locked = !allFixed;
  doc_->commitEdit(before, allFixed ? tr("Расфиксировать") : tr("Фиксировать"));
}

void BoardView::selectAll() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  std::vector<ItemRef> items;
  for (int i = 0; i < int(b.tracks.size()); ++i) items.push_back({ItemType::Track, i});
  for (int i = 0; i < int(b.vias.size()); ++i) items.push_back({ItemType::Via, i});
  std::vector<int> comps(b.components.size());
  std::ranges::iota(comps, 0);
  doc_->setSelection(std::move(items), std::move(comps));
}

void BoardView::finishRoute() {
  if (!routing_) return;
  Board& b = *doc_->board();
  routing_ = false;
  if (!routeTracks_.empty() || !routeVias_.empty()) {
    auto before = doc_->beginEdit();
    for (auto& t : routeTracks_) b.tracks.push_back(t);
    for (auto& v : routeVias_) b.vias.push_back(v);
    doc_->commitEdit(before, tr("Прокладка проводника"));
  }
  routeTracks_.clear();
  routeVias_.clear();
  emit status(tr("Проводник проложен"));
  update();
}

}  // namespace xr::gui
