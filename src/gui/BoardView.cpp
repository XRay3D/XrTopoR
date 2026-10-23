#include "gui/BoardView.h"

#include <QInputDialog>
#include <QKeyEvent>
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
#include "router/topo/Realizer.h"

namespace xr::gui {

BoardView::BoardView(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  setMouseTracking(true);
  setFocusPolicy(Qt::StrongFocus);
  setAutoFillBackground(false);
  connect(doc_, &Document::boardReplaced, this, [this] { fitBoard(); });
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
  BBox bb = doc_->board()->bbox();
  if (!bb.valid()) { center_ = {}; scale_ = 1e-5; update(); return; }
  bb = bb.inflated(2 * kNmPerMm);
  center_ = bb.center();
  scale_ = std::min(width() / bb.width(), height() / bb.height());
  update();
}

void BoardView::fitAll() {
  if (!doc_->hasBoard()) return;
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
  center_ = cursor_;
  update();
}

void BoardView::centerOn(Vec2 p, double widthMm) {
  center_ = p;
  if (widthMm > 0) scale_ = width() / (widthMm * kNmPerMm);
  update();
}

void BoardView::zoomBy(double factor) {
  scale_ = std::clamp(scale_ * factor, 1e-7, 1e-2);
  update();
}

void BoardView::resizeEvent(QResizeEvent*) { update(); }

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
  // Prefer the active layer, then anything visible; vias > tracks > pads.
  double best = std::numeric_limits<double>::max();
  int bestRank = 99;
  auto consider = [&](ItemRef r, int rank) {
    for (auto& s : itemShapes(b, r)) {
      double dist = s.distance(w);
      if (dist > tol) continue;
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
        if ((filter & SelWires) && d.flag("showWires")) consider(r, 1);
        break;
      case ItemType::Pad:
        if (pads) consider(r, 2);
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
  if (!(filter & SelComponents) || !d.flag("showComponents")) return pk;
  // Component by its drawings or pad bounding box.
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    if (!componentVisible(ci)) continue;
    const Component& c = b.components[ci];
    BBox bb;
    for (int pi : c.pads) bb.add(b.pads[pi].shapeGeom().bbox());
    for (auto& g : c.graphics) {
      if (g.layer < 0 || !layerVisible(g.layer)) continue;
      bb.add(g.a);
      bb.add(g.b);
      if (g.kind == GraphicKind::Arc) bb.add(g.m);
      for (auto& p : g.pts) bb.add(p);
    }
    if (bb.valid() && bb.inflated(tol).contains(w)) {
      pk.component = ci;
      return pk;
    }
  }
  return pk;
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
        default: break;
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
  if (e->button() == Qt::MiddleButton || e->button() == Qt::RightButton) {
    panning_ = true;
    return;
  }
  if (e->button() != Qt::LeftButton || !doc_->hasBoard()) return;
  Pick pk = pick(e->position());
  Vec2 w = snapped(toWorld(e->position()));
  emit clicked(w);
  switch (mode_) {
    case Mode::Select: {
      if (pk.item && pk.item->type != ItemType::Pad) {
        doc_->setSelection({*pk.item}, {});
      } else if (pk.component >= 0) {
        doc_->setSelection(pk.item ? std::vector<ItemRef>{*pk.item} : std::vector<ItemRef>{}, {pk.component});
        dragging_ = true;
        dragStart_ = w;
        dragBefore_ = doc_->beginEdit();
        dragOrigins_.clear();
        for (int ci : doc_->selectedComponents()) dragOrigins_.push_back(doc_->board()->components[ci].pos);
      } else {
        doc_->clearSelection();
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
  }
  update();
}

void BoardView::mouseMoveEvent(QMouseEvent* e) {
  QPointF pos = e->position();
  cursor_ = toWorld(pos);
  emit cursorMoved(cursor_);
  if (panning_) {
    QPointF d = pos - lastMouse_;
    center_ -= Vec2{d.x() / scale_, d.y() / scale_};
    lastMouse_ = pos;
    update();
    return;
  }
  if (dragging_ && doc_->hasBoard()) {
    Vec2 d = snapped(cursor_) - snapped(dragStart_);
    auto comps = doc_->selectedComponents();
    for (size_t i = 0; i < comps.size(); ++i)
      doc_->board()->moveComponent(comps[i], dragOrigins_[i] + Point(d));
    doc_->invalidate();
    update();
    return;
  }
  if (routing_) update();
  lastMouse_ = pos;
}

void BoardView::mouseReleaseEvent(QMouseEvent* e) {
  if (e->button() == Qt::MiddleButton || e->button() == Qt::RightButton) {
    panning_ = false;
    return;
  }
  if (dragging_) {
    dragging_ = false;
    Vec2 d = cursor_ - dragStart_;
    if (dragBefore_ && (std::abs(d.x) > 1 || std::abs(d.y) > 1)) doc_->commitEdit(*dragBefore_, tr("Переместить компонент"));
    else if (dragBefore_) {
      dragBefore_->apply(*doc_->board());
      doc_->invalidate();
    }
    dragBefore_.reset();
    update();
  }
}

void BoardView::mouseDoubleClickEvent(QMouseEvent* e) {
  if (mode_ == Mode::Route && routing_ && e->button() == Qt::LeftButton) finishRoute();
}

void BoardView::wheelEvent(QWheelEvent* e) {
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
  emit modeChanged(m);
  emit status(m == Mode::Select   ? tr("Выделять и перемещать объекты")
              : m == Mode::Route  ? tr("Прокладка проводника: щёлкните контакт, с которого начать")
                                  : tr("Создание переходов: щёлкните место перехода"));
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
  if (!doc_->hasBoard()) return;
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  if (items.empty() && comps.empty()) return;
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  std::vector<int> tracks, vias;
  for (ItemRef r : items) {
    if (r.type == ItemType::Track) tracks.push_back(r.index);
    if (r.type == ItemType::Via) vias.push_back(r.index);
  }
  std::ranges::sort(tracks, std::greater{});
  std::ranges::sort(vias, std::greater{});
  for (int i : tracks) b.tracks.erase(b.tracks.begin() + i);
  for (int i : vias) b.vias.erase(b.vias.begin() + i);
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Удалить"));
}

void BoardView::rotateSelection(double deg) {
  if (!doc_->hasBoard()) return;
  auto comps = doc_->selectedComponents();
  if (comps.empty()) return;
  auto before = doc_->beginEdit();
  for (int ci : comps) doc_->board()->rotateComponent(ci, deg);
  doc_->commitEdit(before, tr("Повернуть"));
}

void BoardView::changeTrackWidth() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  double cur = routing_ ? routeWidth_ / 1e6 : 0;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) cur = b.tracks[r.index].width / 1e6;
  bool ok = false;
  double w = QInputDialog::getDouble(this, tr("Ширина проводника"), tr("Ширина, мм:"), cur > 0 ? cur : 0.25, 0.01, 10.0, 3, &ok);
  if (!ok) return;
  if (routing_) { routeWidth_ = mmToNm(w); update(); return; }
  auto before = doc_->beginEdit();
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) b.tracks[r.index].width = mmToNm(w);
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
  if (routing_) {
    routing_ = false;
    routeTracks_.clear();
    routeVias_.clear();
    emit status(tr("Прокладка отменена"));
    update();
    return;
  }
  if (mode_ != Mode::Select) setMode(Mode::Select);
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
