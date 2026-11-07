#include "gui/BoardView.h"

#include "core/DiffPairs.h"
#include "core/Padstack.h"

#include <QApplication>
#include <QKeyEvent>
#include <QMenu>
#include <QSettings>
#include <QMouseEvent>
#include <QPainter>
#include <QFontMetricsF>
#include <QPainterPath>
#include <QWheelEvent>
#include <algorithm>
#include <bit>
#include <cmath>
#include <map>
#include <numeric>
#include <ranges>

#include "gui/Schemes.h"
#include "gui/SmallDialogs.h"
#include "gui/TextFont.h"
#include "io/BoardIO.h"
#include "router/topo/Optimizer.h"
#include "router/topo/ModelTools.h"
#include "topo/Chains.h"
#include "router/topo/Wires.h"
#include "router/topo/Refine.h"

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
  for (auto& g : b.graphics) bb.add(g.bbox());
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
      default: break;  // areas and drawings are picked below
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
  // Texts in their box; keepouts and board drawings (outline, details) near their lines.
  if ((filter & SelTexts) && d.flag("showTexts"))
    for (int i = int(b.texts.size()) - 1; i >= 0; --i) {
      const Text& t = b.texts[i];
      auto c = b.textBox(t);
      if (layerVisible(t.layer) && pointInPolygon(w, {c.begin(), c.end()})) {
        pk.item = ItemRef{ItemType::Text, i};
        return pk;
      }
    }
  {
    double bd = tol;
    auto edgeDist = [&](const Shape& sh) {
      if (sh.kind != Shape::Kind::Polygon) return std::abs(sh.distance(w));
      double m = std::numeric_limits<double>::max();
      for (size_t k = 0; k < sh.poly.size(); ++k)
        m = std::min(m, distPointSegment(w, sh.poly[k], sh.poly[(k + 1) % sh.poly.size()]));
      return m;
    };
    if (filter & SelKeepouts)
      for (int i = 0; i < int(b.keepouts.size()); ++i) {
        if (!keepoutVisible(b.keepouts[i])) continue;
        for (auto& sh : b.keepouts[i].shapes())
          if (double dd = edgeDist(sh); dd <= bd) {
            bd = dd;
            pk.item = ItemRef{ItemType::Keepout, i};
          }
      }
    for (int i = 0; i < int(b.graphics.size()); ++i) {
      LayerId l = b.graphics[i].layer;
      if (l < 0 || l >= LayerId(b.layers.size())) continue;
      bool edge = b.layers[l].kind == LayerKind::Edge;
      if (edge ? !(filter & SelBoard) || !d.flag("showBoardOutline") : !(filter & SelMechDetails) || !layerVisible(l)) continue;
      // Drawings lying on one another (TopoR's contour beside the outline's lines): the selected one is taken.
      bool chosen = r::contains(doc_->selectedItems(), ItemRef{ItemType::Detail, i});
      for (auto& sh : itemShapes(b, {ItemType::Detail, i}))
        if (double dd = std::max(0.0, sh.distance(w)); dd < bd || (dd == bd && (chosen || !pk.item))) {
          bd = dd;
          pk.item = ItemRef{ItemType::Detail, i};
        }
    }
    if (pk.item) return pk;
  }
  // Component by the rectangle round its pads and visible drawings, in its own frame (turned with it).
  if ((filter & SelComponents) && d.flag("showComponents"))
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      BBox bb = componentBounds(b, ci, [&](LayerId l) { return l >= 0 && layerVisible(l); });
      if (bb.valid() && bb.inflated(tol).contains(b.components[ci].toLocal(w))) {
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

BBox BoardView::graphicBBox(const Graphic& g) { return g.bbox(); }

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
  if (mode_ == Mode::Draw) drawDrawing(p);
  if (mode_ == Mode::Via && viaStart_) {
    double r = px(doc_->board()->classOf(viaNet_).viaDiameter / 2.0);
    p.setPen(QPen(QColor(0xff, 0xff, 0x60), 1));
    p.setBrush(Qt::NoBrush);
    for (Vec2 v : viaSites(snapped(cursor_))) p.drawEllipse(toScreen(v), std::max(r, 2.0), std::max(r, 2.0));
  }
  // The axis of a selected zipped section, thin between its conductors (TopoR: the pair is edited by it).
  if (doc_->hasBoard() && mode_ == Mode::Select) {
    const Board& b = *doc_->board();
    p.setPen(QPen(QColor(0xff, 0xff, 0xff), 1));
    p.setBrush(Qt::NoBrush);
    for (int z : selectedZips())
      for (const Track& t : b.zips[size_t(z)].axis) {
        if (!t.mid) {
          p.drawLine(toScreen(t.a.v()), toScreen(t.b.v()));
          continue;
        }
        QPolygonF pl;
        for (Vec2 v : ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).tessellate(std::max(500.0, 0.3 / scale_))) pl << toScreen(v);
        p.drawPolyline(pl);
      }
  }
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

void BoardView::drawPad(QPainter& p, const Pad& pad, LayerId l, const QColor& c) {
  // On a layer: the pad's shape there (its stack's detail: another size on an inner layer, the mask, the paste).
  std::optional<Shape> on = l >= 0 ? padShapeOn(*doc_->board(), pad, l) : std::nullopt;
  if (l >= 0 && !on) return;
  Shape s = on ? *on : pad.shapeGeom();
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
  bool filled = doc_->board()->drawnFilled(g);
  p.setBrush(filled ? QBrush(c) : Qt::NoBrush);
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
      QPolygonF poly = toPoly(g.path(std::max(2000.0, 0.5 / scale_)), [&](Vec2 v) { return toScreen(v); });
      if (filled) p.drawPolygon(poly);
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
      for (auto& z : b.zones)
        if (z.layer == l) {
          QColor c = netColor(z.net, d.colorizeCopper).value_or(details);
          p.setPen(Qt::NoPen);
          p.setBrush(c);
          for (auto& f : z.filled) p.drawPolygon(toPoly(f, [&](Vec2 v) { return toScreen(v); }));
          // An unpoured area shows its outline; cutouts are dashed.
          p.setBrush(Qt::NoBrush);
          if (z.filled.empty()) {
            p.setPen(QPen(c, 1));
            p.drawPolygon(toPoly(z.outline, [&](Vec2 v) { return toScreen(v); }));
          }
          p.setPen(QPen(c, 1, Qt::DashLine));
          for (auto& cut : z.cutouts) p.drawPolygon(toPoly(cut, [&](Vec2 v) { return toScreen(v); }));
        }
    }
    if (d.flag("showWires") && showDetails) {
      for (auto& t : b.tracks)
        if (t.layer == l) drawTrack(p, t, netColor(t.net, d.colorizeWire).value_or(t.locked ? fixColor : details));
      // The clasps («замки») of the zipped sections: a bar across the pair at each end of its axis.
      p.setPen(QPen(details.lighter(170), 2));
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
          p.drawLine(toScreen(at - n), toScreen(at + n));
        }
      }
    }
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
    if (d.flag("showTexts") && showDetails)
      for (auto& t : b.texts)
        if (t.layer == l) drawText(p, t, details);
    return;
  }
  // Technical layers: the pads' details on the mask and paste layers, drawings of the board and of visible
  // components.
  int group = layerGroup(b, l);
  bool groupPads = group == 0 ? d.flag("showTopMechPads") : group == 2 ? d.flag("showBotMechPads") : true;
  if ((L.kind == LayerKind::Mask || L.kind == LayerKind::Paste) && showPads && groupPads)
  {
    for (auto& pad : b.pads)
      if (pad.padstack >= 0 && (pad.component < 0 || componentVisible(pad.component))) drawPad(p, pad, l, padColor);
    // The vias' openings, as their type gives them.
    if (d.flag("showVias") && b.rules) {
      p.setPen(Qt::NoPen);
      p.setBrush(padColor);
      for (auto& v : b.vias)
        if (Coord dia = viaDiameterOn(b, v, l); dia > 0) {
          double r = px(dia / 2.0);
          p.drawEllipse(toScreen(v.pos.v()), r, r);
        }
    }
  }
  if (!showDetails || (group == 0 && !d.flag("showTopMechDetails")) || (group == 2 && !d.flag("showBotMechDetails")))
    return;
  auto draw = [&](const Graphic& g) { drawGraphic(p, g, details); };  // board contours are never filled
  for (int ci = 0; ci < int(b.components.size()); ++ci)
    if (componentVisible(ci))
      for (auto& g : b.components[ci].graphics)
        if (g.layer == l) draw(g);
  for (auto& g : b.graphics)
    if (g.layer == l) draw(g);
  if (d.flag("showTexts"))
    for (auto& t : b.texts)
      if (t.layer == l) drawText(p, t, details);
}

void BoardView::drawText(QPainter& p, const Text& t, const QColor& c) {
  const TextStyle& st = doc_->board()->styleOf(t);
  double h = px(double(st.height));
  if (h < 2) {
    // Too small to read: the box.
    auto box = doc_->board()->textBox(t);
    p.setPen(QPen(c, 1));
    p.setBrush(Qt::NoBrush);
    QPolygonF poly;
    for (Vec2 v : box) poly << toScreen(v);
    p.drawPolygon(poly);
    return;
  }
  // The lines as the board lays them out (Board::textLayout), each in the style's font with its cell (ascent and
  // descent) one character height; a line's top is the top of its capitals, as TopoR has it (a centred «2» in a
  // circle: the top of the digit half the height above the point, its baseline under it by the rest).
  TextLayout l = doc_->board()->textLayout(t);
  QFont f = textFont(st);
  QFontMetricsF fm(f);
  double k = l.lineHeight / (fm.ascent() + fm.descent());  // nm per font pixel
  QPainterPath path;
  for (auto [i, line] : v::enumerate(l.lines)) {
    QPainterPath one;
    one.addText(0, fm.capHeight(), f, QString::fromUtf8(line.data(), qsizetype(line.size())));
    path.addPath(QTransform().translate(l.left, l.top + double(i) * l.lineHeight).scale(k, k).map(one));
  }
  QTransform tr;
  QPointF at = toScreen(t.pos);
  tr.translate(at.x(), at.y());
  tr.rotate(-t.angle);
  if (t.mirror) tr.scale(-1, 1);
  tr.scale(scale_, scale_);
  p.save();
  p.setTransform(tr, true);
  p.setPen(Qt::NoPen);
  p.setBrush(c);
  p.drawPath(path);
  p.restore();
}

bool BoardView::keepoutVisible(const Keepout& k) const {
  const DisplayControl& d = doc_->display();
  if (!d.flag("showKeepouts")) return false;
  if (k.role == Keepout::Role::Place) return d.flag("showPlaceKeepouts", false);
  if (!d.flag("showRouteKeepouts")) return false;
  LayerMask lm = k.layers ? k.layers : doc_->board()->allCopperMask();
  return (lm & visibleCopper()) != 0;
}

void BoardView::drawKeepouts(QPainter& p) {
  const Board& b = *doc_->board();
  for (const Keepout& k : b.keepouts) {
    if (!keepoutVisible(k)) continue;
    QColor c = k.role == Keepout::Role::Route ? doc_->color("keepoutWireAll", 0xff0000)
               : k.side == Side::Top          ? doc_->color("keepoutPlaceTop", 0x259500)
               : k.side == Side::Bottom       ? doc_->color("keepoutPlaceBot", 0x00aaaa)
                                              : doc_->color("keepoutPlaceBoth", 0xf79646);
    // A keepout on one layer takes that layer's colour, as TopoR shows them.
    if (k.role == Keepout::Role::Route && std::popcount(k.layers) == 1) c = doc_->layerColor(std::countr_zero(k.layers));
    for (auto& sh : k.shapes()) {
      if (sh.kind == Shape::Kind::Segment) {
        p.setPen(QPen(c, 2, Qt::DashLine));
        p.drawLine(toScreen(sh.a), toScreen(sh.b));
        continue;
      }
      QPolygonF poly = toPoly(sh.kind == Shape::Kind::Polygon ? sh.poly : sh.outline(std::max(2000.0, 0.5 / scale_)),
                              [&](Vec2 v) { return toScreen(v); });
      p.setPen(QPen(c, 1.5));
      p.setBrush(QBrush(c, Qt::BDiagPattern));
      p.drawPolygon(poly);
    }
  }
  p.setBrush(Qt::NoBrush);
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
  for (LayerId l : cu | v::reverse)
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
  drawKeepouts(p);
  // «Габариты»: the rectangle round the component's pads and drawings in its own frame, turned with it (TopoR
  // draws the rectangle round the turned component, which grows at an odd angle).
  if (d.flag("showCompsBound", false)) {
    p.setPen(QPen(doc_->color("compsBound", 0xffffff), 1));
    p.setBrush(Qt::NoBrush);
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      const Component& c = b.components[ci];
      if (BBox bb = componentBounds(b, ci); bb.valid())
        p.drawPolygon(QPolygonF{toScreen(c.toBoard({bb.minX, bb.minY})), toScreen(c.toBoard({bb.maxX, bb.minY})),
                                toScreen(c.toBoard({bb.maxX, bb.maxY})), toScreen(c.toBoard({bb.minX, bb.maxY}))});
    }
  }
  drawLabels(p);

  // Ratsnest, with the «Показывать связи» filter.
  if (d.flag("showNetLines")) {
    QColor nl = doc_->color("netLines", 0xaf7d3a);
    for (auto& r : doc_->connectivity().ratsnest) {
      if (d.filterNetlines && !d.netlineNets.empty()) {
        bool listed = r::contains(d.netlineNets, b.nets[r.net].name);
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
        case ItemType::Keepout:
          for (auto& sh : b.keepouts[r.index].shapes()) {
            p.setPen(QPen(QColor(0xff, 0xff, 0xff), 2));
            p.setBrush(Qt::NoBrush);
            if (sh.kind == Shape::Kind::Segment) p.drawLine(toScreen(sh.a), toScreen(sh.b));
            else
              p.drawPolygon(toPoly(sh.kind == Shape::Kind::Polygon ? sh.poly : sh.outline(std::max(2000.0, 0.5 / scale_)),
                                   [&](Vec2 v) { return toScreen(v); }));
          }
          break;
        case ItemType::Text: drawText(p, b.texts[r.index], lit(b.texts[r.index].layer)); break;
        case ItemType::Detail: {
          const Graphic& g = b.graphics[r.index];
          drawGraphic(p, g, brighter(g.layer >= 0 && b.layers[g.layer].kind == LayerKind::Edge ? doc_->color("board", 0xd4d4d4)
                                                                                                 : doc_->layerColor(g.layer),
                                     rate));
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
  if (routePair_) {  // the pair: the sections laid, the one being laid, the rubber band, as conductors
    for (const auto& sec : pr_.done)
      for (const Track& t : pairCopper(sec)) drawTrack(p, t, doc_->layerColor(t.layer));
    for (const Via& v : pr_.vias) drawVia(p, v, doc_->color("clrThroughVias", 0x949494));
    PairRoute::Section cur{routeLayer_, routeTracks_, pr_.fromP, pr_.fromN, {}, {}, false};
    const Vec2 at = constrained(routeLast_, snapped(cursor_));
    if (!pr_.clasp) {  // the conductors converging from the pads to a clasp at the cursor
      const Vec2 mid = (pr_.fromP + pr_.fromN) * 0.5;
      Vec2 d = at - mid;
      if (d.len2() < 1) return;
      const Vec2 n = d.normalized().perp() * (double(pr_.w + pr_.gap) / 2.0);
      const Vec2 side = (pr_.fromP - mid).dot(n) >= 0 ? n : n * -1.0;
      p.setPen(QPen(brighter(c, 30), std::max(1.0, px(double(pr_.w))), Qt::SolidLine, Qt::RoundCap));
      p.drawLine(toScreen(pr_.fromP), toScreen(at + side));
      p.drawLine(toScreen(pr_.fromN), toScreen(at - side));
      return;
    }
    if (auto seg = makeSegment(routeLast_, at)) cur.axis.push_back(*seg);
    for (const Track& t : pairCopper(cur)) drawTrack(p, t, brighter(c, 30));
    return;
  }
  for (auto& t : routeTracks_) drawTrack(p, t, doc_->layerColor(t.layer));
  for (auto& v : routeVias_) drawVia(p, v, doc_->color("clrThroughVias", 0x949494));
  // The suggested path to the target (dash-dotted), or a pointer to it when there is none.
  if (!routeHint_.empty()) {
    QColor hc = brighter(c, 50);
    for (auto& t : routeHint_) {
      QPen pen(hc, 1.5, Qt::DashDotLine);
      p.setPen(pen);
      p.setBrush(Qt::NoBrush);
      auto pts = t.path(std::max(500.0, 0.3 / scale_));
      p.drawPolyline(toPoly(pts, [&](Vec2 v) { return toScreen(v); }));
    }
  } else if (routeTarget_) {
    p.setPen(QPen(brighter(c, 50), 1, Qt::DashLine));
    p.drawLine(toScreen(routeLast_), toScreen(*routeTarget_));
  }
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
      bool selected = (pk.component >= 0 && r::contains(doc_->selectedComponents(), pk.component)) ||
                      (pk.component < 0 && pk.item && r::contains(doc_->selectedItems(), *pk.item));
      if (selected) pendingClick_ = pk;
      else clickSelect(pk, {});
      edit::Fragment f = selectedFragment();
      // A conductor of a zipped section, the section alone selected: the piece of its axis there moves across
      // itself, the conductors made again from it.
      if (pk.item && pk.item->type == ItemType::Track && f.components.empty() && f.vias.empty() && f.zones.empty() &&
          f.keepouts.empty() && f.texts.empty() && f.details.empty())
        if (const int z = doc_->board()->tracks[pk.item->index].zip;
            z >= 0 && r::all_of(f.tracks, [&](int ti) { return doc_->board()->tracks[ti].zip == z; })) {
          const auto& axis = doc_->board()->zips[size_t(z)].axis;
          double bd = std::numeric_limits<double>::max();
          dragPiece_ = -1;
          for (int k = 0; k < int(axis.size()); ++k)
            if (double dd = distPointSegment(w, axis[k].a.v(), axis[k].b.v()); dd < bd) bd = dd, dragPiece_ = k;
          if (dragPiece_ >= 0) {
            dragZip_ = z;
            startDrag(Drag::AxisPiece, w);
            break;
          }
        }
      if (!f.empty()) {
        // One straight segment of a wire, or one drawn line or arc, moves across itself.
        bool alone = f.components.empty() && f.vias.empty() && f.zones.empty() && f.keepouts.empty() && f.texts.empty();
        bool segment = alone && ((f.tracks.size() == 1 && f.details.empty()) ||
                                 (f.tracks.empty() && f.details.size() == 1 &&
                                  (doc_->board()->graphics[f.details[0]].kind == GraphicKind::Line ||
                                   doc_->board()->graphics[f.details[0]].kind == GraphicKind::Arc)));
        startDrag(segment ? Drag::Segment : Drag::Fragment, w);
      }
      break;
    }
    case Mode::Freestyle: {
      bool add = e->modifiers() & (Qt::ShiftModifier | Qt::ControlModifier);
      if (!pk.item && pk.component < 0) {
        // A branch point of a wire, or a frame selection.
        double tol = 6 / scale_;
        if (auto bp = !add ? topo::branchPointAt(*doc_->board(), toWorld(e->position()), tol) : std::nullopt) {
          fsTarget_ = *bp;
          startDrag(Drag::Freestyle, w);
          doc_->clearSelection();
          break;
        }
        frameStart_ = frameEnd_ = e->position();
        if (!add) doc_->clearSelection();
        break;
      }
      if (pk.item && pk.item->type == ItemType::Track) {
        if (auto bp = topo::branchPointAt(*doc_->board(), pk.snap, 6 / scale_); bp && !add) {
          fsTarget_ = *bp;
          startDrag(Drag::Freestyle, w);
          break;
        }
        clickSelect(pk, e->modifiers());  // wires are not moved in Freestyle: their shape is computed
        break;
      }
      bool selected = (pk.component >= 0 && r::contains(doc_->selectedComponents(), pk.component)) ||
                      (pk.component < 0 && pk.item && r::contains(doc_->selectedItems(), *pk.item));
      if (add || !selected) clickSelect(pk, e->modifiers());
      if (add) break;
      fsTarget_ = {};
      fsTarget_.fragment = selectedFragment();
      fsTarget_.fragment.tracks.clear();
      fsTarget_.fragment.zones.clear();
      if (!fsTarget_.fragment.empty()) startDrag(Drag::Freestyle, w);
      break;
    }
    case Mode::Route: {
      if (routePair_) {
        if (!routing_) pairStart(pk);
        else pairAddPoint(constrained(routeLast_, w), pk);
        break;
      }
      if (!routing_) routeStart(pk, pk.item ? pk.snap : w);
      else routeAddPoint(constrained(routeLast_, pk.item && itemNet(*doc_->board(), *pk.item) == routeNet_ ? pk.snap : w), pk);
      break;
    }
    case Mode::Via: {
      Board& b = *doc_->board();
      if (viaKind_ != ViaKind::Single) {
        if (!viaStart_) {
          viaStart_ = pk.item ? pk.snap : w;
          viaNet_ = pk.item ? itemNet(b, *pk.item) : kNoNet;
          emit status(tr("Укажите вторую точку %1").arg(viaKind_ == ViaKind::Row ? tr("ряда") : tr("матрицы")));
          break;
        }
        auto sites = viaSites(w);
        auto before = doc_->beginEdit();
        const NetClass& nc = b.classOf(viaNet_);
        for (Vec2 p : sites) {
          Via v;
          v.pos = Point(p);
          v.net = viaNet_;
          v.diameter = nc.viaDiameter;
          v.drill = nc.viaDrill;
          v.layers = b.allCopperMask();
          b.vias.push_back(v);
        }
        viaStart_.reset();
        doc_->commitEdit(before, viaKind_ == ViaKind::Row ? tr("Ряд переходов") : tr("Матрица переходов"));
        emit status(tr("Добавлено переходов: %1").arg(sites.size()));
        break;
      }
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
    case Mode::Draw: drawClick(drawPts_.empty() ? w : constrained(drawPts_.back(), w)); break;
    case Mode::Text: {
      Board& b = *doc_->board();
      LayerId active = doc_->activeLayer();
      // New texts go on the active layer when it is a documenting one, else on the top silk screen.
      LayerId layer = active >= 0 && b.layers[active].kind != LayerKind::Copper ? active : -1;
      for (LayerId l = 0; l < LayerId(b.layers.size()) && layer < 0; ++l)
        if (b.layers[l].kind == LayerKind::Silk && b.layers[l].side == Side::Top) layer = l;
      if (layer < 0) layer = active;
      Text t;
      t.pos = w;
      t.layer = layer;
      if (!askText(this, doc_, t)) break;
      auto before = doc_->beginEdit();
      b.texts.push_back(t);
      doc_->commitEdit(before, tr("Создать надпись"));
      doc_->setSelection({{ItemType::Text, int(b.texts.size()) - 1}}, {});
      if (!drawSticky_) setMode(Mode::Select);
      break;
    }
  }
  update();
}

void BoardView::clickSelect(const Pick& pk, Qt::KeyboardModifiers mods) {
  bool add = mods & (Qt::ShiftModifier | Qt::ControlModifier);
  auto items = add ? doc_->selectedItems() : std::vector<ItemRef>{};
  auto comps = add ? doc_->selectedComponents() : std::vector<int>{};
  auto toggle = [&](auto& list, auto v) {
    if (auto it = r::find(list, v); it != list.end()) list.erase(it);
    else list.push_back(v);
  };
  if (pk.item && pk.item->type == ItemType::Track && doc_->board()->tracks[pk.item->index].zip >= 0) {
    // A conductor of a zipped section: the whole section, as a wire (X: both nets, then the piece alone).
    const bool had = r::contains(items, *pk.item);
    for (ItemRef r : sectionTracks(doc_->board()->tracks[pk.item->index].zip)) {
      std::erase(items, r);
      if (!had) items.push_back(r);
    }
    cycleSeed_ = pk.item->index;
    cycleLevel_ = 1;
  } else if (pk.item && pk.item->type != ItemType::Pad) {
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
    if (!r::contains(items, r)) items.push_back(r);
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
      if (hit(bb) && !r::contains(comps, ci)) comps.push_back(ci);
    }
  if ((filter & SelTexts) && d.flag("showTexts"))
    for (int i = 0; i < int(b.texts.size()); ++i)
      if (layerVisible(b.texts[i].layer) && hit(itemBBox(b, {ItemType::Text, i}))) addItem({ItemType::Text, i});
  if (filter & SelKeepouts)
    for (int i = 0; i < int(b.keepouts.size()); ++i)
      if (keepoutVisible(b.keepouts[i]) && hit(itemBBox(b, {ItemType::Keepout, i}))) addItem({ItemType::Keepout, i});
  for (int i = 0; i < int(b.graphics.size()); ++i) {
    LayerId l = b.graphics[i].layer;
    if (l < 0 || l >= LayerId(b.layers.size())) continue;
    bool edge = b.layers[l].kind == LayerKind::Edge;
    // TopoR: drawings are taken by a frame only when wholly inside it.
    if (edge ? (filter & SelBoard) && d.flag("showBoardOutline") : (filter & SelMechDetails) && layerVisible(l)) {
      BBox bb = itemBBox(b, {ItemType::Detail, i});
      if (box.contains({bb.minX, bb.minY}) && box.contains({bb.maxX, bb.maxY})) addItem({ItemType::Detail, i});
    }
  }
  doc_->setSelection(std::move(items), std::move(comps));
}

std::vector<ItemRef> BoardView::wireOf(int track) const {
  // A wire as TopoR selects it: same-net tracks of one layer joined end to end, up to a pad, a via
  // or a junction where several tracks meet (none of those is part of it). A conductor of a zipped pair:
  // the whole section, both conductors (X once more takes both nets).
  const Board& b = *doc_->board();
  const Track& t0 = b.tracks[track];
  if (t0.zip >= 0) {
    std::vector<ItemRef> out;
    for (int i = 0; i < int(b.tracks.size()); ++i)
      if (b.tracks[i].zip == t0.zip) out.push_back({ItemType::Track, i});
    return out;
  }
  const int net = t0.net;
  const LayerId layer = t0.layer;
  const LayerMask lm = LayerMask(1) << layer;
  // The copper of the net the point lies in: a pad or a via (-1: none). The wire runs on inside it
  // up to the connection point (the segments within one pad or via are part of the wire).
  auto copperAt = [&](Vec2 p) -> std::pair<ItemType, int> {
    for (int i = 0; i < int(b.pads.size()); ++i) {
      const Pad& pad = b.pads[i];
      if (pad.net == net && (pad.copper & lm) && pad.shapeGeom().contains(p)) return {ItemType::Pad, i};
    }
    for (int i = 0; i < int(b.vias.size()); ++i) {
      const Via& v = b.vias[i];
      if (v.net == net && v.onLayer(layer) && (v.pos.v() - p).len() <= v.diameter / 2.0) return {ItemType::Via, i};
    }
    return {ItemType::Track, -1};
  };
  // The vertices of the track graph: ends glued within 10 % of the width. Tracks shorter than that are the
  // vertex itself and no branch of it; by a tolerance of half a width the short pieces of a serpentine and the
  // tangents between arcs all met in one point, and the wire stopped there as at a junction.
  std::vector<char> mine(b.tracks.size(), 0);
  mine[track] = 1;
  const topo::WireGraph g = topo::wireGraph(b, mine);
  auto endOf = [&](const Track& t, int e) { return e ? t.b.v() : t.a.v(); };
  // Ends that meet by no more than half a width: a free end of the graph, with one other track there.
  auto touching = [&](Vec2 p, double tol) {
    std::vector<int> ts;
    for (int ti = 0; ti < int(b.tracks.size()); ++ti) {
      const Track& t = b.tracks[ti];
      if (t.net != net || t.layer != layer) continue;
      if ((t.a.v() - p).len() <= tol || (t.b.v() - p).len() <= tol) ts.push_back(ti);
    }
    return ts;
  };
  std::vector<char> seen(b.tracks.size(), 0);
  std::vector<ItemRef> out;
  auto take = [&](int ti) {
    seen[ti] = 1;
    out.push_back({ItemType::Track, ti});
  };
  std::vector<std::pair<int, int>> todo{{track, 0}, {track, 1}};  // (track, the end to go on from)
  take(track);
  while (!todo.empty()) {
    auto [ti, e] = todo.back();
    todo.pop_back();
    const Vec2 p = endOf(b.tracks[ti], e);
    const int v = g.vid[ti][e];
    int degree = 0;  // of the tracks that are more than the vertex (a loop round a via counts twice)
    std::vector<int> others;
    for (int o : g.ends[v])
      if (!g.tiny[o]) {
        ++degree;
        if (o != ti && !r::contains(others, o)) others.push_back(o);
      }
    if (degree > 2) continue;  // a junction
    if (degree <= 2)
      for (int o : g.ends[v])
        if (g.tiny[o] && !seen[o]) take(o);
    if (!g.tiny[ti] && degree == 1) {
      auto nb = touching(p, b.tracks[ti].width / 2.0);
      if (nb.size() == 2) others.push_back(nb[0] == ti ? nb[1] : nb[0]);
    }
    const auto copper = copperAt(p);
    for (int o : others) {
      if (seen[o]) continue;
      const Track& t = b.tracks[o];
      const int nearEnd = g.vid[o][0] == v ? 0 : g.vid[o][1] == v ? 1 : (t.a.v() - p).len() <= (t.b.v() - p).len() ? 0 : 1;
      const int farEnd = 1 - nearEnd;
      if (copper.second >= 0 && copperAt(endOf(t, farEnd)) != copper) continue;  // leaves the pad or via: not this wire
      take(o);
      todo.push_back({o, farEnd});
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
        if (!r::contains(items, w)) items.push_back(w);
  if (!items.empty()) doc_->setSelection(std::move(items), {});
}

void BoardView::selectNet() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  std::vector<int> nets;
  for (ItemRef r : doc_->selectedItems())
    if (int n = itemNet(b, r); n >= 0 && !r::contains(nets, n)) nets.push_back(n);
  if (nets.empty()) return;
  std::vector<ItemRef> items;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (r::contains(nets, b.tracks[i].net)) items.push_back({ItemType::Track, i});
  for (int i = 0; i < int(b.vias.size()); ++i)
    if (r::contains(nets, b.vias[i].net)) items.push_back({ItemType::Via, i});
  for (int i = 0; i < int(b.pads.size()); ++i)
    if (r::contains(nets, b.pads[i].net)) items.push_back({ItemType::Pad, i});
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
      bool locked = drag_ == Drag::Freestyle ? edit::hasLocked(b, fsTarget_.fragment)
                    : drag_ == Drag::Fragment || drag_ == Drag::Segment ? edit::hasLocked(b, dragFragment_)
                    : drag_ == Drag::AxisPiece                          ? b.zips[size_t(dragZip_)].fixed
                    : dragMarker_.zip >= 0                              ? b.zips[size_t(dragMarker_.zip)].fixed
                                                                        : dragMarker_.item.type == ItemType::Track && b.tracks[dragMarker_.item.index].locked;
      if (locked) {
        emit status(tr("Среди выделенных объектов есть зафиксированные: перемещение запрещено"));
        cancelDrag();
        return;
      }
      // TopoR: a poured copper area is not moved, only an unpoured outline is.
      if ((drag_ == Drag::Fragment || drag_ == Drag::Segment) && edit::hasPoured(b, dragFragment_)) {
        emit status(tr("Залитую область металлизации нельзя перемещать: снимите заливку"));
        cancelDrag();
        return;
      }
      dragMoved_ = true;
      pendingClick_.reset();
      dragBefore_ = doc_->beginEdit();
      if (drag_ == Drag::Freestyle) {
        // Re-shaping renumbers the wires: only components and vias stay selected.
        auto items = doc_->selectedItems();
        std::erase_if(items, [](ItemRef r) { return r.type == ItemType::Track || r.type == ItemType::Zone; });
        doc_->setSelection(std::move(items), doc_->selectedComponents());
        fsLast_ = dragStart_;
      }
    }
    if (drag_ == Drag::Freestyle) freestyleBy(snapped(cursor_) - fsLast_, 0);
    else applyDrag();
    return;
  }
  if (mode_ == Mode::Select && !panning_ && !frameStart_)
    setCursor(markerAt(pos) ? Qt::SizeAllCursor : Qt::ArrowCursor);
  if (routing_ || mode_ == Mode::Measure || (mode_ == Mode::Draw && !drawPts_.empty()) || (mode_ == Mode::Via && viaStart_))
    update();
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
    if (mode_ == Mode::Draw && !drawPts_.empty()) {
      finishShape();  // a polygon or line ends with the right button
      return;
    }
    if (routing_ || mode_ == Mode::Measure || mode_ == Mode::Draw || mode_ == Mode::Text) {
      // In a tool the right button ends it, as TopoR's «Вернуться в основной режим».
      emit contextMenuRequested(e->globalPosition().toPoint());
      return;
    }
    // The object under the cursor becomes the selection unless it is already selected.
    Pick pk = pick(e->position());
    bool selected = (pk.item && r::contains(doc_->selectedItems(), *pk.item)) ||
                    (pk.component >= 0 && r::contains(doc_->selectedComponents(), pk.component));
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
  if (mode_ == Mode::Draw && e->button() == Qt::LeftButton) finishShape();
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
    if (mode_ == Mode::Draw) finishShape();
    else finishRoute();
    return;
  }
  QWidget::keyPressEvent(e);
}

// ---------------------------------------------------------------- editing actions

void BoardView::startFreestyle(topo::Push push) {
  push_ = push;
  setMode(Mode::Freestyle);
}

void BoardView::setMode(Mode m) {
  if (routing_) cancelTool();
  if (drag_ != Drag::None) cancelDrag();
  mode_ = m;
  setCursor(m == Mode::Select || m == Mode::Freestyle ? Qt::ArrowCursor : Qt::CrossCursor);
  drawPts_.clear();
  frameStart_.reset();
  emit modeChanged(m);
  switch (m) {
    case Mode::Select: emit status(tr("Выделять и перемещать объекты")); break;
    case Mode::Freestyle:
      emit status(push_ == topo::Push::None    ? tr("Freestyle: перемещение без подталкивания и соблюдения зазоров")
                  : push_ == topo::Push::Vias ? tr("Freestyle: перемещение с подталкиванием переходов")
                                              : tr("Freestyle: перемещение с подталкиванием компонентов и переходов"));
      break;
    case Mode::Route:
      emit status(routePair_ ? tr("Прокладка дифф. пары: щёлкните контакт цепи дифференциального сигнала")
                             : tr("Прокладка проводника: щёлкните контакт, с которого начать"));
      break;
    case Mode::Via: emit status(tr("Создание переходов: щёлкните место перехода")); break;
    case Mode::Measure:
      emit status(measureKind_ == MeasureKind::Points ? tr("Линейка: укажите первую точку")
                                                      : tr("Линейка: укажите первый объект"));
      break;
    case Mode::Draw: {
      static const char* what[] = {"контур платы", "запрет", "область металлизации", "вырез в металлизации", "деталь"};
      QString how;
      switch (drawShape_) {
        case DrawShape::Poly: how = tr("щёлкайте вершины; двойной щелчок, Enter или правая кнопка — завершить"); break;
        case DrawShape::Rect: how = tr("щёлкните две противоположные вершины"); break;
        case DrawShape::Disk:
        case DrawShape::Circle: how = tr("щёлкните центр, затем точку окружности"); break;
        case DrawShape::Line: how = tr("щёлкайте точки линии; двойной щелчок, Enter или правая кнопка — завершить"); break;
        case DrawShape::ArcC: how = tr("щёлкните центр, начало и конец дуги (против часовой стрелки)"); break;
        case DrawShape::ArcP: how = tr("щёлкните начало, конец и точку дуги"); break;
      }
      emit status(tr("Создание: %1 — %2; Backspace — убрать точку, Esc — отмена").arg(tr(what[int(drawTarget_)]), how));
      break;
    }
    case Mode::Text: emit status(tr("Создание надписи: щёлкните место надписи")); break;
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
  edit::Fragment f = selectedFragment();
  f.components.clear();  // components belong to the netlist
  if (f.empty()) return;
  bool outline = f.touchesOutline(b);
  auto before = doc_->beginEdit();
  edit::erase(b, f);
  if (outline) syncOutline();
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Удалить"));
}

void BoardView::rotateSelection(double deg) {
  if (!doc_->hasBoard()) return;
  if (drag_ == Drag::Freestyle && dragMoved_ && !fsTarget_.vertex) {
    freestyleBy({}, deg);
    return;
  }
  if (mode_ == Mode::Freestyle && drag_ == Drag::None) {
    // Turned in Freestyle, the wires are re-shaped as well.
    fsTarget_ = {};
    fsTarget_.fragment = selectedFragment();
    fsTarget_.fragment.tracks.clear();
    fsTarget_.fragment.zones.clear();
    if (fsTarget_.fragment.empty()) return;
    if (edit::hasLocked(*doc_->board(), fsTarget_.fragment)) {
      emit status(tr("Среди выделенных объектов есть зафиксированные: перемещение запрещено"));
      return;
    }
    auto before = doc_->beginEdit();
    auto r = topo::freestyle(*doc_->board(), fsTarget_, {}, deg, edit::pivotOf(*doc_->board(), fsTarget_.fragment), push_);
    doc_->setSelection({}, doc_->selectedComponents());
    doc_->commitEdit(before, tr("Повернуть"));
    if (r.blocked) emit status(tr("Поворот ограничен зазорами"));
    return;
  }
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
    if (r.type == ItemType::Keepout) f.keepouts.push_back(r.index);
    if (r.type == ItemType::Text) f.texts.push_back(r.index);
    if (r.type == ItemType::Detail) f.details.push_back(r.index);
  }
  // A zipped section goes whole: the pair is edited as a pair (its conductors are made from its axis).
  const Board& b = *doc_->board();
  std::vector<int> zips;
  for (int ti : f.tracks)
    if (b.tracks[ti].zip >= 0 && !r::contains(zips, b.tracks[ti].zip)) zips.push_back(b.tracks[ti].zip);
  for (int z : zips)
    for (ItemRef r : sectionTracks(z))
      if (!r::contains(f.tracks, r.index)) f.tracks.push_back(r.index);
  return f;
}

std::vector<ItemRef> BoardView::sectionTracks(int zip) const {
  std::vector<ItemRef> out;
  const Board& b = *doc_->board();
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[i].zip == zip) out.push_back({ItemType::Track, i});
  return out;
}

void BoardView::selectSection(int zip) {
  auto items = sectionTracks(zip);
  auto cur = doc_->selectedItems();
  if (cur.size() != items.size() || !r::all_of(items, [&](ItemRef r) { return r::contains(cur, r); })) doc_->setSelection(std::move(items), {});
}

void BoardView::editMarked(const std::function<void(std::vector<Graphic>&, int)>& fn) {
  Board& b = *doc_->board();
  edit::editFigure(b, dragMarker_.item, dragMarker_.part, fn);
  if (dragMarker_.item.type == ItemType::Detail && b.isEdge(b.graphics[dragMarker_.item.index].layer)) syncOutline();
}

void BoardView::syncOutline() { io::rebuildOutline(*doc_->board()); }

void BoardView::transformSelection(double rotate, bool mirror, const QString& title) {
  edit::Fragment f = selectedFragment();
  if (f.empty()) return;
  Board& b = *doc_->board();
  if (edit::hasLocked(b, f)) {
    emit status(tr("Среди выделенных объектов есть зафиксированные: перемещение запрещено"));
    return;
  }
  if (edit::hasPoured(b, f)) {
    emit status(tr("Залитую область металлизации нельзя перемещать: снимите заливку"));
    return;
  }
  auto before = doc_->beginEdit();
  edit::Motion m;
  m.pivot = edit::pivotOf(b, f);
  m.rotate = rotate;
  m.mirror = mirror;
  edit::move(b, f, m);
  if (f.touchesOutline(b)) syncOutline();
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
  // The middle marker only when the side is long enough on screen to hold three.
  auto roomy = [&](Vec2 a, Vec2 c) { return px((c - a).len()) > 30; };
  auto figure = [&](ItemRef r, int part, const Graphic& g) {
    auto vs = edit::figureVertices(g);
    for (int k = 0; k < int(vs.size()); ++k) out.push_back({r, part, Marker::End, k});
    for (int k = 0; Vec2 m : edit::figureMiddles(g)) {
      double near = std::numeric_limits<double>::max();
      for (Vec2 v : vs) near = std::min(near, (v - m).len());
      if (px(near) > 15) out.push_back({r, part, Marker::Middle, k});
      ++k;
    }
  };
  std::vector<int> zips;  // the sections of the selected conductors: their axes take the handles
  for (ItemRef r : items) {
    if (r.type == ItemType::Track) {
      if (r.index >= int(b.tracks.size())) continue;
      const Track& t = b.tracks[r.index];
      if (t.zip >= 0) {
        if (!r::contains(zips, t.zip)) zips.push_back(t.zip);
        continue;
      }
      out.push_back({r, 0, Marker::End, 0});
      out.push_back({r, 0, Marker::End, 1});
      if (roomy(t.a.v(), t.b.v())) out.push_back({r, 0, Marker::Middle, 0});
    } else if (r.type == ItemType::Keepout) {
      const auto& sh = b.keepouts[r.index].shape;
      for (int k = 0; k < int(sh.size()); ++k) figure(r, k, sh[k]);
    } else if (r.type == ItemType::Zone && !b.zones[r.index].filled.empty()) {
      continue;  // TopoR: a poured area's shape is not edited
    } else if (auto g = edit::figureOf(b, r)) {
      figure(r, 0, *g);
    }
  }
  for (int z : zips) {
    const auto& axis = b.zips[size_t(z)].axis;
    for (int k = 0; k <= int(axis.size()) && !axis.empty(); ++k) out.push_back({{ItemType::Track, -1}, 0, Marker::End, k, z});
    for (int k = 0; k < int(axis.size()); ++k)
      if (roomy(axis[k].a.v(), axis[k].b.v())) out.push_back({{ItemType::Track, -1}, 0, Marker::Middle, k, z});
  }
  return out;
}

Vec2 BoardView::markerPos(const Marker& m) const {
  const Board& b = *doc_->board();
  if (m.zip >= 0) {
    const auto& axis = b.zips[size_t(m.zip)].axis;
    const int n = int(axis.size());
    if (n == 0) return {};
    if (m.kind == Marker::End) return m.vertex < n ? axis[size_t(m.vertex)].a.v() : axis.back().b.v();
    const Track& t = axis[size_t(std::min(m.vertex, n - 1))];
    return t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
  }
  if (m.item.type == ItemType::Track) {
    const Track& t = b.tracks[m.item.index];
    if (m.kind == Marker::End) return m.vertex ? t.b.v() : t.a.v();
    return t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
  }
  auto g = edit::figureOf(b, m.item, m.part);
  if (!g) return {};
  auto pts = m.kind == Marker::End ? edit::figureVertices(*g) : edit::figureMiddles(*g);
  return m.vertex < int(pts.size()) ? pts[m.vertex] : Vec2{};
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
  dragMarker_ = marker ? *marker : Marker{};
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
    case Drag::None:
    case Drag::Freestyle: break;
    case Drag::Fragment:
      m.shift = d;
      edit::move(b, dragFragment_, m);
      if (dragFragment_.touchesOutline(b)) syncOutline();
      break;
    case Drag::Segment: {
      // A straight segment (of a wire or a drawn line) moves across itself, so its neighbours keep their
      // directions roughly.
      bool track = !dragFragment_.tracks.empty();
      Vec2 a = track ? b.tracks[dragFragment_.tracks[0]].a.v() : b.graphics[dragFragment_.details[0]].a;
      Vec2 c = track ? b.tracks[dragFragment_.tracks[0]].b.v() : b.graphics[dragFragment_.details[0]].b;
      bool arc = track ? b.tracks[dragFragment_.tracks[0]].isArc() : b.graphics[dragFragment_.details[0]].kind == GraphicKind::Arc;
      Vec2 n = (c - a).perp().normalized();
      // With the grid on, the moved segment's start goes to the grid along the normal.
      m.shift = arc || n.len2() == 0 ? d : snappedOnLine(a + n * d.dot(n), n) - a;
      if (track) edit::move(b, dragFragment_, m);
      else edit::moveFigureSide(b.graphics, dragFragment_.details[0], m.shift);
      if (dragFragment_.touchesOutline(b)) syncOutline();
      break;
    }
    case Drag::AxisPiece: {
      // As a segment of a wire: a straight piece of the axis across itself, to the grid along its normal.
      const Track& t = b.zips[size_t(dragZip_)].axis[size_t(dragPiece_)];
      Vec2 n = (t.b.v() - t.a.v()).perp().normalized();
      Vec2 shift = t.isArc() || n.len2() == 0 ? d : snappedOnLine(t.a.v() + n * d.dot(n), n) - t.a.v();
      moveAxisPiece(b, dragZip_, dragPiece_, shift);
      selectSection(dragZip_);
      break;
    }
    case Drag::Vertex:
      if (dragMarker_.zip >= 0) {
        // A vertex of the axis (an end: the clasp), held to its neighbour in the angle mode.
        const auto& axis = b.zips[size_t(dragMarker_.zip)].axis;
        const int k = dragMarker_.vertex;
        Vec2 other = k > 0 ? axis[size_t(k - 1)].a.v() : axis[0].b.v();
        moveAxisVertex(b, dragMarker_.zip, k, constrained(other, to));
        selectSection(dragMarker_.zip);
      } else if (dragMarker_.item.type == ItemType::Track) {
        const Track& t = b.tracks[dragMarker_.item.index];
        Vec2 other = dragMarker_.vertex ? t.a.v() : t.b.v();
        edit::moveVertex(b, dragMarker_.item.index, dragMarker_.vertex, constrained(other, to));
      } else {
        editMarked([&](std::vector<Graphic>& list, int i) {
          // The angle mode holds the dragged vertex to its previous neighbour, as a wire's end to the other.
          auto vs = edit::figureVertices(list[i]);
          int k = dragMarker_.vertex;
          Vec2 from = vs.size() > 1 ? vs[(k + vs.size() - 1) % vs.size()] : vs[k];
          edit::moveFigureVertex(list, i, k, list[i].kind == GraphicKind::Circle ? to : constrained(from, to));
        });
      }
      break;
    case Drag::Bend:
      if (dragMarker_.zip >= 0) {
        // The middle of a piece of the axis: an arc bends, a straight piece gets a new vertex there.
        const Track& t = b.zips[size_t(dragMarker_.zip)].axis[size_t(dragMarker_.vertex)];
        bendAxis(b, dragMarker_.zip, dragMarker_.vertex, t.isArc() ? to : constrained(t.a.v(), to));
        selectSection(dragMarker_.zip);
      } else if (dragMarker_.item.type == ItemType::Track) {
        int ti = dragMarker_.item.index;
        const Track& t = b.tracks[ti];
        if (t.isArc()) {
          edit::bendTrack(b, ti, to);
        } else {
          // The middle of a straight segment becomes a new bend of the wire.
          Vec2 mid = (t.a.v() + t.b.v()) * 0.5;
          Vec2 a = t.a.v();
          edit::splitTrack(b, ti, mid);
          edit::moveVertex(b, ti, 1, constrained(a, to));
        }
      } else {
        editMarked([&](std::vector<Graphic>& list, int i) {
          // The angle mode holds a new vertex to the side's start; arcs and rectangle sides go where they are put.
          const Graphic& g = list[i];
          bool free = g.kind != GraphicKind::Line && (g.kind != GraphicKind::Poly || g.arcOf(dragMarker_.vertex) != 0);
          Vec2 from = edit::figureVertices(g)[g.kind == GraphicKind::Line ? 0 : dragMarker_.vertex];
          edit::bendFigure(list, i, dragMarker_.vertex, free ? to : constrained(from, to));
        });
      }
      break;
  }
  doc_->invalidate();
  update();
}

// ---------------------------------------------------------------- creation tools

void BoardView::startDraw(DrawTarget target, DrawShape shape) {
  if (!doc_->hasBoard()) return;
  if (target == DrawTarget::Cutout) {
    // TopoR: a cutout goes into the one selected copper area, which must not be poured.
    auto items = doc_->selectedItems();
    if (items.size() != 1 || items[0].type != ItemType::Zone || !doc_->board()->zones[items[0].index].filled.empty()) {
      emit status(tr("Для создания выреза выделите одну незалитую область металлизации"));
      return;
    }
  }
  drawSticky_ = QApplication::keyboardModifiers() & Qt::ShiftModifier;
  drawTarget_ = target;
  drawShape_ = shape;
  setMode(Mode::Draw);
}

void BoardView::startVias(ViaKind kind) {
  if (!doc_->hasBoard()) return;
  viaKind_ = kind;
  viaStart_.reset();
  setMode(Mode::Via);
  if (kind != ViaKind::Single)
    emit status(kind == ViaKind::Row ? tr("Ряд переходов: щёлкните центр первого перехода")
                                     : tr("Матрица переходов: щёлкните угол прямоугольника"));
}

// Via centres of a row (along the line to `to`) or a matrix (filling the rectangle), one via diameter
// plus the clearance apart.
std::vector<Vec2> BoardView::viaSites(Vec2 to) const {
  std::vector<Vec2> out;
  if (!viaStart_) return out;
  const Board& b = *doc_->board();
  const NetClass& nc = b.classOf(viaNet_);
  double pitch = double(nc.viaDiameter + b.clearance(viaNet_, -1));
  if (pitch <= 0) return out;
  Vec2 a = *viaStart_, d = to - a;
  if (viaKind_ == ViaKind::Row) {
    int n = int(d.len() / pitch) + 1;
    Vec2 dir = d.normalized();
    for (int i = 0; i < n && i < 1000; ++i) out.push_back(a + dir * (pitch * i));
  } else {
    int nx = int(std::abs(d.x) / pitch) + 1, ny = int(std::abs(d.y) / pitch) + 1;
    double sx = d.x < 0 ? -pitch : pitch, sy = d.y < 0 ? -pitch : pitch;
    for (int j = 0; j < ny && nx * ny <= 10000; ++j)
      for (int i = 0; i < nx; ++i) out.push_back(a + Vec2{sx * i, sy * j});
  }
  return out;
}

void BoardView::startText() {
  if (!doc_->hasBoard()) return;
  drawSticky_ = QApplication::keyboardModifiers() & Qt::ShiftModifier;
  setMode(Mode::Text);
}

void BoardView::drawClick(Vec2 w) {
  if (!drawPts_.empty() && (w - drawPts_.back()).len() * scale_ < 1) return;  // the second click of a double click
  drawPts_.push_back(w);
  size_t need = 0;
  switch (drawShape_) {
    case DrawShape::Rect:
    case DrawShape::Disk:
    case DrawShape::Circle: need = 2; break;
    case DrawShape::ArcC:
    case DrawShape::ArcP: need = 3; break;
    case DrawShape::Poly:
    case DrawShape::Line: break;
  }
  if (need && drawPts_.size() >= need) finishShape();
  update();
}

namespace {

// The figure of a drawing tool from its points (empty if they do not make one yet).
std::vector<Graphic> figureOf(DrawShape shape, const std::vector<Vec2>& pts) {
  std::vector<Graphic> out;
  Graphic g;
  switch (shape) {
    case DrawShape::Poly:
      if (pts.size() < 3) break;
      g.kind = GraphicKind::Poly;
      g.pts = pts;
      g.filled = true;
      out.push_back(g);
      break;
    case DrawShape::Rect:
      if (pts.size() < 2 || pts[0].x == pts[1].x || pts[0].y == pts[1].y) break;
      g.kind = GraphicKind::Rect;  // edited as a rectangle
      g.a = pts[0];
      g.b = pts[1];
      g.filled = true;
      out.push_back(g);
      break;
    case DrawShape::Disk:
    case DrawShape::Circle:
      if (pts.size() < 2 || pts[0] == pts[1]) break;
      g.kind = GraphicKind::Circle;
      g.a = pts[0];
      g.b = pts[0] + Vec2{(pts[1] - pts[0]).len(), 0};
      g.filled = shape == DrawShape::Disk;
      out.push_back(g);
      break;
    case DrawShape::Line:
      for (size_t i = 1; i < pts.size(); ++i) {
        g.kind = GraphicKind::Line;
        g.a = pts[i - 1];
        g.b = pts[i];
        out.push_back(g);
      }
      break;
    case DrawShape::ArcC: {
      if (pts.size() < 3) break;
      // Counter-clockwise on screen from the start to the direction of the end (Y down: decreasing angles).
      Vec2 c = pts[0], st = pts[1], en = pts[2];
      double a0 = std::atan2(st.y - c.y, st.x - c.x), a1 = std::atan2(en.y - c.y, en.x - c.x);
      double sweep = -normalizeAngle(a0 - a1);
      if (sweep == 0) sweep = -2 * kPi;
      auto arc = ArcGeom::fromCenter(c, st, sweep);
      if (!arc.valid) break;
      g.kind = GraphicKind::Arc;
      g.a = arc.start();
      g.m = arc.mid();
      g.b = arc.end();
      out.push_back(g);
      break;
    }
    case DrawShape::ArcP: {
      if (pts.size() < 3) break;
      if (!ArcGeom::fromThreePoints(pts[0], pts[2], pts[1]).valid) break;
      g.kind = GraphicKind::Arc;
      g.a = pts[0];
      g.m = pts[2];
      g.b = pts[1];
      out.push_back(g);
      break;
    }
  }
  return out;
}

// A closed outline of the figure (copper areas and cutouts are polygons).
Polyline polygonOf(const std::vector<Graphic>& fig) {
  Polyline out;
  for (const Graphic& g : fig) {
    auto pts = g.path();
    // Lines drawn one after another share their ends.
    if (!out.empty() && !pts.empty() && (out.back() - pts.front()).len() < 1) out.pop_back();
    out.insert(out.end(), pts.begin(), pts.end());
  }
  if (out.size() >= 2 && (out.front() - out.back()).len() < 1) out.pop_back();
  return out;
}

}  // namespace

void BoardView::finishShape() {
  if (mode_ != Mode::Draw) return;
  auto fig = figureOf(drawShape_, drawPts_);
  drawPts_.clear();
  if (fig.empty()) {
    update();
    return;
  }
  createShape(std::move(fig));
  if (!drawSticky_) setMode(Mode::Select);
  update();
}

void BoardView::createShape(std::vector<Graphic> fig) {
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  LayerId active = doc_->activeLayer();
  LayerId copper = active >= 0 && b.layers[active].kind == LayerKind::Copper && !b.layers[active].plane ? active : b.topCopper();
  ItemRef made;
  QString title;
  switch (drawTarget_) {
    case DrawTarget::Board: {
      LayerId edge = -1;
      for (LayerId l = 0; l < LayerId(b.layers.size()) && edge < 0; ++l)
        if (b.layers[l].kind == LayerKind::Edge) edge = l;
      if (edge < 0) edge = b.addLayer("Board_outline", LayerKind::Edge, Side::None);
      // An outline without drawings (Specctra) becomes drawings first, so that it is built again with the new one.
      if (!r::contains(b.graphics, edge, &Graphic::layer))
        for (auto& loop : b.outline) {
          Graphic g;
          g.kind = GraphicKind::Poly;
          g.layer = edge;
          g.pts = loop;
          g.width = mmToNm(0.2);
          b.graphics.push_back(g);
        }
      for (auto& g : fig) {
        g.layer = edge;
        g.width = mmToNm(0.2);
        g.filled = false;
        b.graphics.push_back(g);
      }
      made = {ItemType::Detail, int(b.graphics.size()) - 1};
      syncOutline();
      title = tr("Создать контур платы");
      break;
    }
    case DrawTarget::Keepout: {
      Keepout k;
      k.layers = LayerMask(1) << copper;
      k.shape = std::move(fig);
      b.keepouts.push_back(std::move(k));
      made = {ItemType::Keepout, int(b.keepouts.size()) - 1};
      title = tr("Создать запрет");
      break;
    }
    case DrawTarget::Copper: {
      Polyline poly = polygonOf(fig);
      if (poly.size() < 3) return;
      Zone z;
      z.layer = copper;
      // One figure stays itself (a circle, a rectangle), lines become the polygon they close.
      if (fig.size() == 1 && fig[0].closed()) z.setShape(fig[0]);
      else z.outline = std::move(poly);
      b.zones.push_back(std::move(z));
      made = {ItemType::Zone, int(b.zones.size()) - 1};
      title = tr("Создать область металлизации");
      break;
    }
    case DrawTarget::Cutout: {
      Polyline poly = polygonOf(fig);
      auto items = doc_->selectedItems();
      if (poly.size() < 3 || items.size() != 1 || items[0].type != ItemType::Zone) return;
      b.zones[items[0].index].cutouts.push_back(std::move(poly));
      made = items[0];
      title = tr("Создать вырез в металлизации");
      break;
    }
    case DrawTarget::Detail: {
      // On the active layer when it is not copper, else on the first mechanical (or documenting) layer.
      LayerId layer = active >= 0 && b.layers[active].kind != LayerKind::Copper && b.layers[active].kind != LayerKind::Edge ? active : -1;
      for (LayerKind kind : {LayerKind::Other, LayerKind::Fab, LayerKind::Silk})
        for (LayerId l = 0; l < LayerId(b.layers.size()) && layer < 0; ++l)
          if (b.layers[l].kind == kind) layer = l;
      if (layer < 0) layer = b.addLayer("Mechanical", LayerKind::Other, Side::None);
      for (auto& g : fig) {
        g.layer = layer;
        g.width = mmToNm(0.1);
        b.graphics.push_back(g);
      }
      made = {ItemType::Detail, int(b.graphics.size()) - 1};
      title = tr("Создать деталь");
      break;
    }
  }
  doc_->commitEdit(before, title);
  doc_->setSelection({made}, {});
}

void BoardView::drawDrawing(QPainter& p) {
  if (drawPts_.empty()) return;
  std::vector<Vec2> pts = drawPts_;
  pts.push_back(constrained(drawPts_.back(), snapped(cursor_)));
  QColor c(0xff, 0xff, 0x60);
  p.setPen(QPen(c, 1, Qt::DashLine));
  p.setBrush(Qt::NoBrush);
  auto fig = figureOf(drawShape_, pts);
  if (drawShape_ == DrawShape::Poly && pts.size() == 2) fig = figureOf(DrawShape::Line, pts);
  if (drawShape_ == DrawShape::ArcC && pts.size() == 2) {
    // The radius so far.
    p.drawLine(toScreen(pts[0]), toScreen(pts[1]));
    double r = px((pts[1] - pts[0]).len());
    p.drawEllipse(toScreen(pts[0]), r, r);
    return;
  }
  if (drawShape_ == DrawShape::ArcP && pts.size() == 2) fig = figureOf(DrawShape::Line, pts);
  for (auto& g : fig) {
    g.filled = false;
    g.width = 0;
    drawGraphic(p, g, c);
  }
  p.setPen(QPen(c, 1));
  p.setBrush(c);
  for (Vec2 v : drawPts_) p.drawEllipse(toScreen(v), 2.5, 2.5);
}

void BoardView::freestyleBy(Vec2 shift, double rotate) {
  if (shift.len2() == 0 && rotate == 0) return;
  Board& b = *doc_->board();
  Vec2 pivot = fsTarget_.vertex ? *fsTarget_.vertex : edit::pivotOf(b, fsTarget_.fragment);
  auto r = topo::freestyle(b, fsTarget_, shift, rotate, pivot, push_);
  fsLast_ += r.moved;
  if (r.blocked) emit status(tr("Перемещение ограничено зазорами: объекты, которые нельзя подтолкнуть"));
  doc_->invalidate();
  update();
}

void BoardView::finishDrag() {
  Drag kind = drag_;
  drag_ = Drag::None;
  if (placing_) {
    placing_ = false;
    if (dragFragment_.touchesOutline(*doc_->board())) syncOutline();
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
  if (kind == Drag::Vertex && dragMarker_.item.type != ItemType::Track)
    editMarked([](std::vector<Graphic>& list, int i) { edit::tidyFigure(list[i]); });
  auto map = edit::removeDegenerate(b);
  auto items = doc_->selectedItems();
  std::erase_if(items, [&](ItemRef& r) {
    if (r.type != ItemType::Track) return false;
    r.index = r.index < int(map.size()) ? map[r.index] : -1;
    return r.index < 0;
  });
  const int zip = kind == Drag::AxisPiece ? dragZip_ : dragMarker_.zip;
  if ((kind == Drag::AxisPiece || ((kind == Drag::Vertex || kind == Drag::Bend) && zip >= 0)) && zip < int(b.zips.size())) items = sectionTracks(zip);
  QString title = kind == Drag::Freestyle ? tr("Перемещение Freestyle")
                  : kind == Drag::Fragment ? (dragFragment_.components.empty() ? tr("Переместить") : tr("Переместить компонент"))
                  : kind == Drag::Segment ? tr("Переместить сегмент")
                  : kind == Drag::AxisPiece || dragMarker_.zip >= 0 ? tr("Изменить форму дифф. пары")
                  : dragMarker_.item.type == ItemType::Track ? tr("Изменить форму проводника")
                                                             : tr("Изменить форму");
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
      if (!r::contains(nets, b.tracks[r.index].net)) nets.push_back(b.tracks[r.index].net);
    }
  if (!routing_ && nets.empty()) return;
  if (!routing_ && r::any_of(doc_->selectedItems(), [&](ItemRef r) { return r.type == ItemType::Track && b.tracks[r.index].zip >= 0; })) {
    emit status(tr("Ширина проводников застёгнутой дифф. пары задаётся правилом волнового сопротивления"));
    return;
  }
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

// The zipped sections the selected tracks are conductors of.
std::vector<int> BoardView::selectedZips() const {
  std::vector<int> out;
  if (!doc_->hasBoard()) return out;
  const Board& b = *doc_->board();
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track && b.tracks[r.index].zip >= 0 && !r::contains(out, b.tracks[r.index].zip)) out.push_back(b.tracks[r.index].zip);
  return out;
}

// «Застегнуть проводники»: the selected tracks of the two nets of a pair, a chain each on one layer.
void BoardView::zipSelection() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::vector<int> tracks;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) tracks.push_back(r.index);
  auto before = doc_->beginEdit();
  auto z = zipTracks(b, tracks);
  if (!z) {  // (nothing changed: zipTracks checks everything first)
    emit status(tr("Застегнуть проводники нельзя: %1").arg(QString::fromStdString(z.error())));
    return;
  }
  doc_->commitEdit(before, tr("Застегнуть проводники"));
  std::vector<ItemRef> sel;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[i].zip == *z) sel.push_back({ItemType::Track, i});
  doc_->setSelection(sel, {});
  emit status(tr("Проводники застёгнуты"));
}

// «Расстегнуть проводники»: the sections of the selected conductors go, the conductors stay.
void BoardView::unzipSelection() {
  std::vector<int> zips = selectedZips();
  if (zips.empty()) return;
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  r::sort(zips, std::greater<>());
  for (int z : zips) unzip(b, z);
  doc_->commitEdit(before, tr("Расстегнуть проводники"));
  emit status(tr("Проводники расстёгнуты: %1").arg(zips.size()));
}

// «Поменять цепи местами» (Alt+Space): each selected section's conductors take each other's net.
void BoardView::swapZipNets() {
  std::vector<int> zips = selectedZips();
  if (zips.empty()) return;
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  for (int z : zips) xr::swapZipNets(b, z);
  doc_->commitEdit(before, tr("Поменять цепи местами"));
}

void BoardView::recomputeShapes() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::vector<char> chosen(b.tracks.size(), 0);
  bool any = false;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) { chosen[r.index] = 1; any = true; }
  // Nothing selected: the tracks edited since the last computation only (their chains, with the
  // rest of the copper as it lies), when the setting says so and there are any; else everything.
  bool local = any;
  const bool model = QSettings().value("topo/model", true).toBool();
  if (!any && QSettings().value("f5/editedOnly", true).toBool()) {
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (b.tracks[i].edited && !b.tracks[i].locked) { chosen[i] = 1; any = true; }
    local = any;
    // By the model: the edited wires drawn from it, the rest as they lie (the sketch path on every track
    // of a board moved whole made 7 shorts of nothing on SingleLayer); when the model stops at a crossing
    // the edit made, the sketch path lays the chains as drawn.
    if (any && model && recomputeShapesModel(true)) return;
  }
  if (!any && model) {
    recomputeShapesModel();
    return;
  }
  if (!any)
    for (size_t i = 0; i < b.tracks.size(); ++i) chosen[i] = !b.tracks[i].locked;
  std::vector<int> nets;  // junctions settle on the re-laid nets only (all when everything is re-laid)
  if (local)
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (chosen[i] && b.tracks[i].net != kNoNet && !r::contains(nets, b.tracks[i].net)) nets.push_back(b.tracks[i].net);
  auto before = doc_->beginEdit();
  auto st = topo::reshapeTracks(b, std::move(chosen), {.local = local});
  int settled = topo::settleJunctions(b, nets);
  for (auto& t : b.tracks) t.edited = false;
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Расчёт формы проводников"), false);
  QString msg = tr("Расчёт формы проводников: %1 проводник(ов), %2 дуг, ветвлений стянуто %3").arg(st.wires).arg(st.arcs).arg(settled);
  // Narrowing is the last resort (topo/Narrowing.h): said when it was taken.
  if (st.narrowedWires > 0) msg += tr("; заужено проводников: %1").arg(st.narrowedWires);
  if (!st.crossingNets.empty()) {
    QStringList pairs;
    for (auto [n1, n2] : st.crossingNets)
      pairs << QString("%1/%2").arg(QString::fromStdString(b.nets[n1].name), QString::fromStdString(b.nets[n2].name));
    msg += tr("; топологическое пересечение проводников: %1 (уложены как нарисованы)").arg(pairs.join(", "));
  }
  emit status(msg);
}

// F5 on the topological model (ModelTools.h): every unlocked wire drawn from the model. Stopped by a
// violation (wires crossing, a wire through another net's pad) nothing changes and the wires concerned
// are selected, the violations in the message list.
bool BoardView::recomputeShapesModel(bool editedOnly) {
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  topo::Topology& t = doc_->topology();
  topo::F5ModelOptions o;
  o.editedOnly = editedOnly;
  auto res = topo::runF5Model(b, t, o);
  if (!res.drawn && editedOnly) return false;  // nothing changed: the edit made a crossing, the sketch path takes the chains as drawn
  if (!res.drawn) {
    auto drc = topo::topologyViolations(b, t, res.violations);
    std::vector<ItemRef> sel;
    for (const DrcViolation& v : drc) {
      if (v.a.type == ItemType::Track) sel.push_back(v.a);
      if (v.hasB) sel.push_back(v.b);
    }
    r::sort(sel, {}, [](ItemRef x) { return std::pair(x.type, x.index); });
    sel.erase(r::unique(sel).begin(), sel.end());
    doc_->setDrc(drc);
    doc_->setSelection(sel, {});
    emit status(tr("Расчёт формы прерван: топологических нарушений %1 (проводники выделены, см. окно сообщений)").arg(drc.size()));
    return false;
  }
  for (auto& tr : b.tracks) tr.edited = false;
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Расчёт формы проводников"), false);
  doc_->markTopologyFresh();
  QString msg = tr("Расчёт формы проводников по модели: %1 проводник(ов), %2 дуг, переполненных рёбер %3")
                    .arg(res.wires)
                    .arg(res.stats.arcs)
                    .arg(res.stats.overflowEdges);
  if (res.junctionMoves > 0) msg += tr("; ветвлений сдвинуто: %1").arg(res.junctionMoves);
  if (res.stats.narrowedWires > 0) msg += tr("; заужено проводников: %1").arg(res.stats.narrowedWires);
  emit status(msg);
  return true;
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
    pr_ = {};
    emit status(tr("Прокладка отменена"));
    update();
    return;
  }
  if (mode_ == Mode::Draw && !drawPts_.empty()) {
    drawPts_.clear();
    update();
    return;
  }
  if (mode_ == Mode::Via && viaStart_) {
    viaStart_.reset();
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
  routeFrom_ = pk.item;
  targetIndex_ = 0;
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
  updateRouteHint();
  emit status(tr("Прокладка цепи %1 на слое %2: «;» — проложить до цели, Q — другая цель, V — переход, Backspace — отменить, "
                 "Enter — завершить")
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
  return snappedOnLine(from + dir * (d.dot(dir) > 0 ? d.dot(dir) : len), dir);
}

// A point held to a line through `p` along `dir`, with the grid on: where the line crosses the grid line nearest
// `p` — both coordinates on the grid when the line goes through a grid point, the free one at least when not.
Vec2 BoardView::snappedOnLine(Vec2 p, Vec2 dir) const {
  if (!doc_->hasBoard() || !doc_->display().alignToGrid || dir.len2() == 0) return p;
  Vec2 g = snapped(p);
  dir = dir.normalized();
  if (std::abs(dir.y) < 1e-9) return {g.x, p.y};
  if (std::abs(dir.x) < 1e-9) return {p.x, g.y};
  Vec2 byX = p + dir * ((g.x - p.x) / dir.x), byY = p + dir * ((g.y - p.y) / dir.y);
  return (byX - p).len2() <= (byY - p).len2() ? byX : byY;
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
    updateRouteHint();
  }
  // Clicking an item of the same net ends the route on it.
  if (pk.item && routeNet_ != kNoNet && itemNet(*doc_->board(), *pk.item) == routeNet_ && pk.item->type != ItemType::Track)
    finishRoute();
  update();
}

void BoardView::routeAddVia() {
  if (!routing_) return;
  if (routePair_) {
    pairAddVia();
    return;
  }
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
  auto it = r::find(cu, routeLayer_);
  size_t idx = it == cu.end() ? 0 : size_t(it - cu.begin());
  routeLayer_ = cu[(idx + 1) % cu.size()];
  routeWidth_ = b.trackWidth(routeNet_, routeLayer_);
  doc_->setActiveLayer(routeLayer_);
  updateRouteHint();
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
    a->setChecked(r::all_of(tracks, [&](int ti) { return b.tracks[ti].layer == l; }));
  }
  QAction* chosen = menu.exec(QCursor::pos());
  if (!chosen) return;
  LayerId layer = chosen->data().toInt();
  if (r::any_of(tracks, &Track::locked, of(b.tracks)))
    emit status(tr("Зафиксированные участки проводников остались на своём слое"));
  auto before = doc_->beginEdit();
  int vias = edit::changeLayer(b, tracks, layer);
  {  // a section moved has its conductors made again: the selection by what is there
    auto items = doc_->selectedItems();
    std::erase_if(items, [&](ItemRef r) { return r.type == ItemType::Track && r.index >= int(b.tracks.size()); });
    doc_->setSelection(std::move(items), doc_->selectedComponents());
  }
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
    emit status(tr("Копируются проводники, переходы, области металлизации, запреты, надписи и детали"));
    return;
  }
  clipboard() = edit::copy(*doc_->board(), f);
  emit status(tr("Скопировано объектов: %1")
                  .arg(f.tracks.size() + f.vias.size() + f.zones.size() + f.keepouts.size() + f.texts.size() + f.details.size()));
}

void BoardView::cutSelection() {
  if (!doc_->hasBoard()) return;
  edit::Fragment f = selectedFragment();
  f.components.clear();
  if (f.empty()) return;
  clipboard() = edit::copy(*doc_->board(), f);
  auto before = doc_->beginEdit();
  bool outline = f.touchesOutline(*doc_->board());
  edit::erase(*doc_->board(), f);
  if (outline) syncOutline();
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
  for (int i : f.keepouts) items.push_back({ItemType::Keepout, i});
  for (int i : f.texts) items.push_back({ItemType::Text, i});
  for (int i : f.details) items.push_back({ItemType::Detail, i});
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
      if (layerVisible(b.tracks[i].layer) && !r::contains(items, ItemRef{ItemType::Track, i}))
        ni.push_back({ItemType::Track, i});
  if ((filter & SelVias) && d.flag("showVias"))
    for (int i = 0; i < int(b.vias.size()); ++i)
      if (!r::contains(items, ItemRef{ItemType::Via, i})) ni.push_back({ItemType::Via, i});
  if ((filter & SelCoppers) && d.flag("showCoppers"))
    for (int i = 0; i < int(b.zones.size()); ++i)
      if (layerVisible(b.zones[i].layer) && !r::contains(items, ItemRef{ItemType::Zone, i}))
        ni.push_back({ItemType::Zone, i});
  if (filter & SelComponents)
    for (int i = 0; i < int(b.components.size()); ++i)
      if (componentVisible(i) && !r::contains(comps, i)) nc.push_back(i);
  doc_->setSelection(std::move(ni), std::move(nc));
}

void BoardView::viaKey() {
  if (routing_) routeAddVia();
  else startVias(ViaKind::Single);
}

void BoardView::routeUndoLast() {
  if (mode_ == Mode::Draw && !drawPts_.empty()) {
    drawPts_.pop_back();
    update();
    return;
  }
  if (routing_ && routePair_) {
    pairUndoLast();
    return;
  }
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
  updateRouteHint();
  update();
}

void BoardView::updateRouteHint() {
  routeHint_.clear();
  routeTarget_.reset();
  if (!routing_ || routeNet_ == kNoNet) return;
  const Board& b = *doc_->board();
  const Connectivity& conn = doc_->connectivity();
  auto clusterOf = [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Pad: return conn.padCluster[r.index];
      case ItemType::Track: return conn.trackCluster[r.index];
      case ItemType::Via: return conn.viaCluster[r.index];
      default: return -1;
    }
  };
  int from = routeFrom_ ? clusterOf(*routeFrom_) : -1;
  // Unconnected pads and vias of the net on the routing layer, nearest first.
  std::vector<std::pair<double, Vec2>> cands;
  for (int i = 0; i < int(b.pads.size()); ++i) {
    const Pad& p = b.pads[i];
    if (p.net != routeNet_ || !p.onLayer(routeLayer_) || (from >= 0 && conn.padCluster[i] == from)) continue;
    cands.push_back({(p.pos.v() - routeLast_).len(), p.pos.v()});
  }
  for (int i = 0; i < int(b.vias.size()); ++i) {
    const Via& v = b.vias[i];
    if (v.net != routeNet_ || !v.onLayer(routeLayer_) || (from >= 0 && conn.viaCluster[i] == from)) continue;
    cands.push_back({(v.pos.v() - routeLast_).len(), v.pos.v()});
  }
  std::erase_if(cands, [&](auto& c) { return c.first < 1; });
  if (cands.empty()) return;
  r::sort(cands, {}, &std::pair<double, Vec2>::first);
  routeTarget_ = cands[size_t(targetIndex_) % cands.size()].second;
  routeHint_ = topo::routeConnection(b, routeLast_, *routeTarget_, routeLayer_, routeNet_, routeWidth_);
}

void BoardView::nextTarget() {
  if (!routing_) return;
  ++targetIndex_;
  updateRouteHint();
  update();
}

void BoardView::routeToTarget() {
  if (!routing_) return;
  if (routeHint_.empty()) {
    emit status(tr("Путь до цели в текущем слое не найден"));
    return;
  }
  for (auto& t : routeHint_) routeTracks_.push_back(t);
  routeHint_.clear();
  finishRoute();
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
    updateRouteHint();
  }
  doc_->setActiveLayer(l);
}

void BoardView::toggleMetalLayers() {
  if (!doc_->hasBoard()) return;
  auto& show = doc_->display().show;
  show["showSignalLayers"] = !doc_->display().flag("showSignalLayers");
  doc_->displayChanged();
}

// TopoR's «гибкая фиксация» of a net: its topology stays (the autorouter and F6 leave it, F7 leaves its vias),
// the shape of its wires does not. Set for the nets of the selected wires and vias unless all of them have it;
// «Трассировать» goes the other way, as in TopoR.
void BoardView::toggleFlexFix() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::set<int> nets;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track || r.type == ItemType::Via)
      if (int net = itemNet(b, r); net >= 0) nets.insert(net);
  if (nets.empty()) {
    emit status(tr("Гибкая фиксация: выделите проводник или переход цепи"));
    return;
  }
  const bool all = r::all_of(nets, &Net::flexFixed, of(b.nets));
  auto before = doc_->beginEdit();
  for (int n : nets) {
    b.nets[size_t(n)].flexFixed = !all;
    b.nets[size_t(n)].route = all;
  }
  doc_->commitEdit(before, all ? tr("Снять гибкую фиксацию") : tr("Гибкая фиксация"), false);
  emit status((all ? tr("Гибкая фиксация снята, цепей: %1") : tr("Гибкая фиксация включена, цепей: %1")).arg(nets.size()));
  update();
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

// Ctrl+A: what a crossing frame round the whole board would take — by the selection filter and the
// visibility of the layers and kinds, as TopoR does.
void BoardView::selectAll() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  BBox all;
  for (const auto& loop : b.outline)
    for (Vec2 p : loop) all.add(p);
  for (const Track& t : b.tracks) all.add(itemBBox(b, {ItemType::Track, int(&t - b.tracks.data())}));
  for (const Via& v : b.vias) all.add(v.pos.v());
  for (const Pad& p : b.pads) all.add(p.pos.v());
  for (const Text& t : b.texts) all.add(itemBBox(b, {ItemType::Text, int(&t - b.texts.data())}));
  for (const Graphic& g : b.graphics) all.add(itemBBox(b, {ItemType::Detail, int(&g - b.graphics.data())}));
  if (!all.valid()) return;
  const double margin = 10 * kNmPerMm;
  QPointF a = toScreen({all.minX - margin, all.minY - margin}), c = toScreen({all.maxX + margin, all.maxY + margin});
  selectInFrame(QRectF(a, c).normalized(), true, false);
}

void BoardView::finishRoute() {
  if (!routing_) return;
  if (routePair_) {
    pairFinish(std::nullopt);
    return;
  }
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

// ---------------------------------------------------------------- the differential pair laid by hand

std::optional<Vec2> BoardView::partnerOf(ItemRef item, int otherNet) const {
  const Board& b = *doc_->board();
  Vec2 at;
  int comp = -1;
  if (item.type == ItemType::Pad) {
    at = b.pads[size_t(item.index)].pos.v();
    comp = b.pads[size_t(item.index)].component;
  } else if (item.type == ItemType::Via) {
    at = b.vias[size_t(item.index)].pos.v();
  } else {
    return std::nullopt;
  }
  std::optional<Vec2> best;
  double bd = 1e300;
  for (int pass = 0; pass < 2 && !best; ++pass)  // its component's pads first, then any pad or via within 10 mm
    for (const Pad& pad : b.pads) {
      if (pad.net != otherNet || (pass == 0 && (comp < 0 || pad.component != comp))) continue;
      if (double d = (pad.pos.v() - at).len(); d < bd && (pass == 0 || d < 10 * kNmPerMm)) bd = d, best = pad.pos.v();
    }
  if (!best)
    for (const Via& v : b.vias)
      if (v.net == otherNet)
        if (double d = (v.pos.v() - at).len(); d < bd && d < 10 * kNmPerMm) bd = d, best = v.pos.v();
  return best;
}

std::vector<Track> BoardView::pairCopper(const PairRoute::Section& s) const {
  std::vector<Track> out;
  if (s.axis.empty()) return out;
  const double off = double(pr_.w + pr_.gap) / 2.0;
  const int side = pr_.pSide ? pr_.pSide : 1;
  for (int k = 0; k < 2; ++k) {  // [0] negative, [1] positive
    const double sg = (k ? 1.0 : -1.0) * side;
    std::vector<Track> cond = offsetRun(s.axis, sg * off, 4 * double(2 * pr_.w + pr_.gap));
    if (cond.empty()) continue;
    const int net = k ? pr_.netP : pr_.netN;
    for (Track& t : cond) {
      t.width = pr_.w;
      t.layer = s.layer;
      t.net = net;
      out.push_back(t);
    }
    auto stub = [&](Vec2 a, Vec2 c) {
      if ((a - c).len() <= edit::kJoinTol) return;
      Track t;
      t.a = Point(a);
      t.b = Point(c);
      t.width = pr_.w;
      t.layer = s.layer;
      t.net = net;
      out.push_back(t);
    };
    stub(k ? s.fromP : s.fromN, cond.front().a.v());
    if (s.hasTo) stub(cond.back().b.v(), k ? s.toP : s.toN);
  }
  return out;
}

void BoardView::pairStart(const Pick& pk) {
  const Board& b = *doc_->board();
  const int net = pk.item ? itemNet(b, *pk.item) : kNoNet;
  const int pair = b.pairOfNet(net);
  if (pair < 0 || !pk.item || (pk.item->type != ItemType::Pad && pk.item->type != ItemType::Via)) {
    emit status(tr("Прокладка дифф. пары: щёлкните контакт цепи дифференциального сигнала"));
    return;
  }
  // The pair's nets: the positive one of its first signal's cluster.
  const DiffSignal& ds = b.hispeed.diffSignals[size_t(pair)];
  std::vector<int> pn[2];
  for (int k = 0; k < 2; ++k)
    if (const SignalCluster* c = b.hispeed.clusterOf(k ? ds.signalB : ds.signalA))
      for (const std::string& n : c->nets)
        if (int ni = b.findNet(n); ni >= 0) pn[k].push_back(ni);
  const bool positive = r::contains(pn[0], net);
  const int other = positive ? (pn[1].empty() ? kNoNet : pn[1].front()) : (pn[0].empty() ? kNoNet : pn[0].front());
  const auto partner = partnerOf(*pk.item, other);
  if (other == kNoNet || !partner) {
    emit status(tr("Прокладка дифф. пары: у контакта нет парного контакта другой цепи"));
    return;
  }
  LayerId layer = doc_->activeLayer();
  const LayerMask lm = itemLayers(b, *pk.item);
  if (!((lm >> layer) & 1))
    for (LayerId l : b.copperLayers())
      if ((lm >> l) & 1) {
        layer = l;
        break;
      }
  Coord w = 0, gap = 0;
  if (!b.pairRule(pair, layer, w, gap)) {
    emit status(tr("Прокладка дифф. пары: нет правила волнового сопротивления пары на слое %1").arg(QString::fromStdString(b.layers[size_t(layer)].name)));
    return;
  }
  pr_ = {};
  pr_.pair = pair;
  pr_.netP = positive ? net : other;
  pr_.netN = positive ? other : net;
  pr_.w = w;
  pr_.gap = gap;
  pr_.fromP = positive ? pk.snap : *partner;
  pr_.fromN = positive ? *partner : pk.snap;
  routing_ = true;
  routeNet_ = net;
  routeLayer_ = layer;
  doc_->setActiveLayer(layer);
  routeWidth_ = 2 * w + gap;
  routeTracks_.clear();
  routeVias_.clear();
  routeLast_ = (pr_.fromP + pr_.fromN) * 0.5;
  routeDir_.reset();
  routeHint_.clear();
  routeTarget_.reset();
  emit status(tr("Прокладка дифф. пары %1: щёлкните, где поставить замок").arg(QString::fromStdString(ds.name)));
  update();
}

void BoardView::pairAddPoint(Vec2 at, const Pick& pk) {
  const Board& b = *doc_->board();
  if (!pr_.clasp) {  // the second click: the clasp
    pr_.clasp = true;
    routeLast_ = at;
    routeDir_.reset();
    emit status(tr("Ведите пару; щелчок по контакту цепи пары — завершить, V — смена слоя, Enter — закончить"));
    update();
    return;
  }
  // A pad or via of the pair's nets: the clasp at the end of the last segment, the conductors to it and its partner.
  if (pk.item && (pk.item->type == ItemType::Pad || pk.item->type == ItemType::Via) && !routeTracks_.empty()) {
    const int net = itemNet(b, *pk.item);
    if (net == pr_.netP || net == pr_.netN) {
      if (auto partner = partnerOf(*pk.item, net == pr_.netP ? pr_.netN : pr_.netP)) {
        pairFinish(net == pr_.netP ? std::pair{pk.snap, *partner} : std::pair{*partner, pk.snap});
        return;
      }
    }
  }
  auto seg = makeSegment(routeLast_, at);
  if (!seg) return;
  seg->net = kNoNet;
  if (routeTracks_.empty() && pr_.done.empty() && pr_.pSide == 0) {  // the positive conductor on the side of its pad
    const Vec2 d = seg->b.v() - seg->a.v();
    pr_.pSide = d.cross(pr_.fromP - seg->a.v()) >= 0 ? 1 : -1;
  }
  routeTracks_.push_back(*seg);
  Vec2 dir = (seg->b.v() - seg->a.v()).normalized();
  if (seg->isArc()) {
    auto g = ArcGeom::fromThreePoints(seg->a.v(), seg->mid->v(), seg->b.v());
    Vec2 rad = seg->b.v() - g.center;
    dir = (g.sweep > 0 ? rad.perp() : rad.perp() * -1.0).normalized();
  }
  routeDir_ = dir;
  routeLast_ = at;
  update();
}

void BoardView::pairAddVia() {
  if (!pr_.clasp || routeTracks_.empty() || !routeDir_) return;
  Board& b = *doc_->board();
  // The section ends at a clasp here; two vias abreast of it, as far apart as the vias and the pair's gap need;
  // the next section starts from them on the next layer at a clasp on the same spot.
  const NetClass& nc = b.classOf(pr_.netP);
  const double s = std::max(double(nc.viaDiameter + b.clearance(pr_.netP, pr_.netN, routeLayer_)), double(pr_.w + pr_.gap));
  const Vec2 n = routeDir_->perp() * double(pr_.pSide ? pr_.pSide : 1);
  const Vec2 viaP = routeLast_ + n * (s / 2), viaN = routeLast_ - n * (s / 2);
  PairRoute::Section sec{routeLayer_, routeTracks_, pr_.fromP, pr_.fromN, viaP, viaN, true};
  pr_.done.push_back(sec);
  for (auto [pos, net] : {std::pair{viaP, pr_.netP}, std::pair{viaN, pr_.netN}}) {
    Via v;
    v.pos = Point(pos);
    v.net = net;
    v.diameter = nc.viaDiameter;
    v.drill = nc.viaDrill;
    v.layers = b.allCopperMask();
    pr_.vias.push_back(v);
  }
  auto cu = b.copperLayers();
  auto it = r::find(cu, routeLayer_);
  size_t idx = it == cu.end() ? 0 : size_t(it - cu.begin());
  routeLayer_ = cu[(idx + 1) % cu.size()];
  doc_->setActiveLayer(routeLayer_);
  Coord w = pr_.w, gap = pr_.gap;
  if (b.pairRule(pr_.pair, routeLayer_, w, gap)) {
    pr_.w = w;
    pr_.gap = gap;
  }
  routeWidth_ = 2 * pr_.w + pr_.gap;
  routeTracks_.clear();
  pr_.fromP = viaP;
  pr_.fromN = viaN;
  update();
}

void BoardView::pairUndoLast() {
  if (!routeTracks_.empty()) {
    const Track t = routeTracks_.back();
    routeTracks_.pop_back();
    routeLast_ = t.a.v();  // back to where the piece began (the clasp, for the first)
    routeDir_.reset();
    if (!routeTracks_.empty()) routeDir_ = (routeTracks_.back().b.v() - routeTracks_.back().a.v()).normalized();
  } else if (!pr_.done.empty()) {  // back over the change of layer
    PairRoute::Section sec = pr_.done.back();
    pr_.done.pop_back();
    pr_.vias.resize(pr_.vias.size() >= 2 ? pr_.vias.size() - 2 : 0);
    routeLayer_ = sec.layer;
    doc_->setActiveLayer(routeLayer_);
    routeTracks_ = sec.axis;
    pr_.fromP = sec.fromP;
    pr_.fromN = sec.fromN;
    routeLast_ = routeTracks_.back().b.v();
    routeDir_ = (routeTracks_.back().b.v() - routeTracks_.back().a.v()).normalized();
  } else if (pr_.clasp) {
    pr_.clasp = false;
    routeLast_ = (pr_.fromP + pr_.fromN) * 0.5;
    routeDir_.reset();
  }
  update();
}

void BoardView::pairFinish(std::optional<std::pair<Vec2, Vec2>> endPads) {
  Board& b = *doc_->board();
  routing_ = false;
  std::vector<PairRoute::Section> all = pr_.done;
  if (pr_.clasp && !routeTracks_.empty()) {
    PairRoute::Section last{routeLayer_, routeTracks_, pr_.fromP, pr_.fromN, {}, {}, false};
    if (endPads) {
      last.toP = endPads->first;
      last.toN = endPads->second;
      last.hasTo = true;
    }
    all.push_back(last);
  }
  if (all.empty()) {
    pr_ = {};
    routeTracks_.clear();
    emit status(tr("Прокладка дифф. пары отменена"));
    update();
    return;
  }
  auto before = doc_->beginEdit();
  for (const auto& sec : all) {
    ZippedWire z;
    z.layer = sec.layer;
    z.pair = pr_.pair;
    z.netP = pr_.netP;
    z.netN = pr_.netN;
    z.pSide = pr_.pSide ? pr_.pSide : 1;
    Coord w = pr_.w, gap = pr_.gap;
    b.pairRule(pr_.pair, sec.layer, w, gap);
    z.condWidth = w;
    z.gap = gap;
    z.axis = sec.axis;
    for (Track& t : z.axis) {
      t.width = z.width();
      t.net = kNoNet;
      t.layer = sec.layer;
    }
    const int zi = int(b.zips.size());
    b.zips.push_back(z);
    for (Track t : pairCopper(sec)) {
      // The conductors (the pieces of the offset axis) belong to the section; the stubs do not.
      const bool stub = (t.a.v() - sec.fromP).len() <= edit::kJoinTol || (t.a.v() - sec.fromN).len() <= edit::kJoinTol ||
                        (sec.hasTo && ((t.b.v() - sec.toP).len() <= edit::kJoinTol || (t.b.v() - sec.toN).len() <= edit::kJoinTol));
      if (!stub) t.zip = zi;
      t.edited = true;
      b.tracks.push_back(t);
    }
  }
  for (const Via& v : pr_.vias) b.vias.push_back(v);
  doc_->commitEdit(before, tr("Прокладка дифф. пары"));
  pr_ = {};
  routeTracks_.clear();
  emit status(tr("Дифференциальная пара проложена"));
  update();
}

}  // namespace xr::gui
