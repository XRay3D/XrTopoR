#include "gui/BoardView.h"

#include <QApplication>
#include <QKeyEvent>
#include <QMenu>
#include <QSettings>
#include <QMouseEvent>
#include <QPainter>
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
      for (auto& sh : itemShapes(b, {ItemType::Detail, i}))
        if (double dd = std::max(0.0, sh.distance(w)); dd <= bd) {
          bd = dd;
          pk.item = ItemRef{ItemType::Detail, i};
        }
    }
    if (pk.item) return pk;
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

BBox BoardView::componentBounds(int ci) const {
  const Board& b = *doc_->board();
  const Component& c = b.components[ci];
  BBox bb;
  for (int pi : c.pads) bb.add(b.pads[pi].shapeGeom().bbox());
  for (auto& g : c.graphics) bb.add(graphicBBox(g));
  return bb;
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
    if (d.flag("showTexts") && showDetails)
      for (auto& t : b.texts)
        if (t.layer == l) drawText(p, t, details);
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
  // TopoR's vector fonts are drawn with a sans font scaled to the style's character height.
  QFont f("Sans");
  f.setPixelSize(100);
  f.setBold(st.bold);
  f.setItalic(st.italic);
  QPainterPath path;
  path.addText(0, 0, f, QString::fromStdString(t.text));
  QRectF r = path.boundingRect();
  constexpr double cap = 72;  // cap height of a 100 px font
  double k = h / cap;
  int col = int(t.align) % 3, row = int(t.align) / 3;
  QTransform tr;
  QPointF at = toScreen(t.pos);
  tr.translate(at.x(), at.y());
  tr.rotate(-t.angle);
  if (t.mirror) tr.scale(-1, 1);
  tr.scale(k, k);
  tr.translate(-(r.left() + r.width() * col / 2.0), cap * (2 - row) / 2.0);
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
  drawKeepouts(p);
  // «Габариты»: the rectangle enclosing the component's pads and drawings, as TopoR draws it.
  if (d.flag("showCompsBound", false)) {
    p.setPen(QPen(doc_->color("compsBound", 0xffffff), 1));
    p.setBrush(Qt::NoBrush);
    for (int ci = 0; ci < int(b.components.size()); ++ci) {
      if (!componentVisible(ci)) continue;
      BBox bb = componentBounds(ci);
      if (bb.valid()) p.drawRect(QRectF(toScreen({bb.minX, bb.minY}), toScreen({bb.maxX, bb.maxY})).normalized());
    }
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
      bool selected = (pk.component >= 0 && std::ranges::contains(doc_->selectedComponents(), pk.component)) ||
                      (pk.component < 0 && pk.item && std::ranges::contains(doc_->selectedItems(), *pk.item));
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
  // or a junction where several tracks meet (none of those is part of it).
  const Board& b = *doc_->board();
  const Track& t0 = b.tracks[track];
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
        if (o != ti && !std::ranges::contains(others, o)) others.push_back(o);
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
      bool locked = drag_ == Drag::Freestyle ? edit::hasLocked(b, fsTarget_.fragment)
                    : drag_ == Drag::Fragment || drag_ == Drag::Segment ? edit::hasLocked(b, dragFragment_)
                                                                        : b.tracks[dragMarker_.track].locked;
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
    case Mode::Route: emit status(tr("Прокладка проводника: щёлкните контакт, с которого начать")); break;
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
  return f;
}

void BoardView::syncOutline() {
  Board& b = *doc_->board();
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind == LayerKind::Edge) {
      io::buildOutline(b, l);
      return;
    }
}

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
    case Drag::None:
    case Drag::Freestyle: break;
    case Drag::Fragment:
      m.shift = d;
      edit::move(b, dragFragment_, m);
      if (dragFragment_.touchesOutline(b)) syncOutline();
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
      g.kind = GraphicKind::Poly;
      g.pts = {pts[0], {pts[1].x, pts[0].y}, pts[1], {pts[0].x, pts[1].y}};
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
  for (const Graphic& g : fig) switch (g.kind) {
      case GraphicKind::Poly: out.insert(out.end(), g.pts.begin(), g.pts.end()); break;
      case GraphicKind::Circle: {
        auto pts = Shape::circle(g.a, (g.b - g.a).len()).outline(5000);
        out.insert(out.end(), pts.begin(), pts.end());
        break;
      }
      case GraphicKind::Line:
        if (out.empty()) out.push_back(g.a);
        out.push_back(g.b);
        break;
      case GraphicKind::Arc: {
        auto arc = ArcGeom::fromThreePoints(g.a, g.m, g.b);
        if (arc.valid) {
          auto pts = arc.tessellate(5000);
          out.insert(out.end(), pts.begin(), pts.end());
        }
        break;
      }
      case GraphicKind::Rect: out.insert(out.end(), {g.a, {g.b.x, g.a.y}, g.b, {g.a.x, g.b.y}}); break;
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
      if (std::ranges::none_of(b.graphics, [&](const Graphic& g) { return g.layer == edge; }))
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
      z.outline = std::move(poly);
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
  auto map = edit::removeDegenerate(b);
  auto items = doc_->selectedItems();
  std::erase_if(items, [&](ItemRef& r) {
    if (r.type != ItemType::Track) return false;
    r.index = r.index < int(map.size()) ? map[r.index] : -1;
    return r.index < 0;
  });
  QString title = kind == Drag::Freestyle ? tr("Перемещение Freestyle")
                  : kind == Drag::Fragment ? (dragFragment_.components.empty() ? tr("Переместить") : tr("Переместить компонент"))
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
  // Nothing selected: the tracks edited since the last computation only (their chains, with the
  // rest of the copper as it lies), when the setting says so and there are any; else everything.
  bool local = any;
  if (!any && QSettings().value("f5/editedOnly", true).toBool()) {
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (b.tracks[i].edited && !b.tracks[i].locked) { chosen[i] = 1; any = true; }
    local = any;
  }
  if (!any && QSettings().value("topo/model", true).toBool()) {
    recomputeShapesModel();
    return;
  }
  if (!any)
    for (size_t i = 0; i < b.tracks.size(); ++i) chosen[i] = !b.tracks[i].locked;
  std::vector<int> nets;  // junctions settle on the re-laid nets only (all when everything is re-laid)
  if (local)
    for (size_t i = 0; i < b.tracks.size(); ++i)
      if (chosen[i] && b.tracks[i].net != kNoNet && !std::ranges::contains(nets, b.tracks[i].net)) nets.push_back(b.tracks[i].net);
  auto before = doc_->beginEdit();
  auto st = topo::reshapeTracks(b, std::move(chosen), {.local = local});
  int settled = topo::settleJunctions(b, nets);
  for (auto& t : b.tracks) t.edited = false;
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Расчёт формы проводников"), false);
  QString msg = tr("Расчёт формы проводников: %1 проводник(ов), %2 дуг, ветвлений стянуто %3").arg(st.wires).arg(st.arcs).arg(settled);
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
void BoardView::recomputeShapesModel() {
  Board& b = *doc_->board();
  auto before = doc_->beginEdit();
  topo::Topology& t = doc_->topology();
  auto res = topo::runF5Model(b, t);
  if (!res.drawn) {
    auto drc = topo::topologyViolations(b, t, res.violations);
    std::vector<ItemRef> sel;
    for (const DrcViolation& v : drc) {
      if (v.a.type == ItemType::Track) sel.push_back(v.a);
      if (v.hasB) sel.push_back(v.b);
    }
    std::ranges::sort(sel, [](ItemRef x, ItemRef y) { return std::tie(x.type, x.index) < std::tie(y.type, y.index); });
    sel.erase(std::unique(sel.begin(), sel.end(), [](ItemRef x, ItemRef y) { return x.type == y.type && x.index == y.index; }), sel.end());
    doc_->setDrc(drc);
    doc_->setSelection(sel, {});
    emit status(tr("Расчёт формы прерван: топологических нарушений %1 (проводники выделены, см. окно сообщений)").arg(drc.size()));
    return;
  }
  for (auto& tr : b.tracks) tr.edited = false;
  doc_->clearSelection();
  doc_->commitEdit(before, tr("Расчёт формы проводников"), false);
  doc_->markTopologyFresh();
  emit status(tr("Расчёт формы проводников по модели: %1 проводник(ов), %2 дуг, переполненных рёбер %3")
                  .arg(res.wires)
                  .arg(res.stats.arcs)
                  .arg(res.stats.overflowEdges));
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
    updateRouteHint();
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
  else startVias(ViaKind::Single);
}

void BoardView::routeUndoLast() {
  if (mode_ == Mode::Draw && !drawPts_.empty()) {
    drawPts_.pop_back();
    update();
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
  std::ranges::sort(cands, {}, &std::pair<double, Vec2>::first);
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
