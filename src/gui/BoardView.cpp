#include "gui/BoardView.h"

#include <QInputDialog>
#include <QKeyEvent>
#include <QMouseEvent>
#include <QPainter>
#include <QPainterPath>
#include <QWheelEvent>
#include <algorithm>
#include <cmath>
#include <ranges>

#include "gui/Theme.h"

namespace xr::gui {

BoardView::BoardView(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  setMouseTracking(true);
  setFocusPolicy(Qt::StrongFocus);
  setAutoFillBackground(false);
  connect(doc_, &Document::boardReplaced, this, [this] { fitBoard(); });
  connect(doc_, &Document::boardChanged, this, qOverload<>(&QWidget::update));
  connect(doc_, &Document::selectionChanged, this, qOverload<>(&QWidget::update));
  connect(doc_, &Document::layersChanged, this, qOverload<>(&QWidget::update));
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

bool BoardView::layerVisible(LayerId l) const {
  if (l < 0 || l >= LayerId(doc_->layerViews().size())) return false;
  if (onlyActive_ && doc_->board()->layers[l].kind == LayerKind::Copper) return l == doc_->activeLayer();
  return doc_->layerViews()[l].visible;
}

LayerMask BoardView::visibleCopper() const {
  LayerMask m = 0;
  for (LayerId l : doc_->board()->copperLayers())
    if (layerVisible(l)) m |= LayerMask(1) << l;
  return m;
}

BoardView::Pick BoardView::pick(QPointF screen) const {
  Pick pk;
  if (!doc_->hasBoard()) return pk;
  const Board& b = *doc_->board();
  Vec2 w = toWorld(screen);
  pk.snap = w;
  double tol = 4.0 / scale_;  // 4 px
  BBox q;
  q.add(w);
  LayerMask vis = visibleCopper();
  // Prefer the active layer, then anything visible; vias > tracks > pads.
  double best = std::numeric_limits<double>::max();
  int bestRank = 99;
  auto consider = [&](ItemRef r, int rank) {
    for (auto& s : itemShapes(b, r)) {
      double d = s.distance(w);
      if (d > tol) continue;
      bool active = itemLayers(b, r) & (LayerMask(1) << doc_->activeLayer());
      int rk = rank + (active ? 0 : 10);
      if (rk < bestRank || (rk == bestRank && d < best)) {
        best = d;
        bestRank = rk;
        pk.item = r;
      }
    }
  };
  doc_->index().query(q.inflated(tol), vis, [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Via: consider(r, 0); break;
      case ItemType::Track: consider(r, 1); break;
      case ItemType::Pad: consider(r, 2); break;
      case ItemType::Zone: break;
    }
  });
  if (pk.item) {
    if (pk.item->type == ItemType::Pad) {
      pk.component = b.pads[pk.item->index].component;
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
  // Component by silk/courtyard graphics or pad bounding box.
  for (int ci = 0; ci < int(b.components.size()); ++ci) {
    const Component& c = b.components[ci];
    BBox bb;
    for (int pi : c.pads) bb.add(b.pads[pi].shapeGeom().bbox());
    for (auto& g : c.graphics) {
      if (g.layer < 0 || !layerVisible(g.layer)) continue;
      bb.add(g.a); bb.add(g.b);
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

// ---------------------------------------------------------------- painting

void BoardView::paintEvent(QPaintEvent*) {
  QPainter p(this);
  p.fillRect(rect(), Theme::background());
  if (!doc_->hasBoard()) return;
  p.setRenderHint(QPainter::Antialiasing, true);
  drawBoard(p);
  drawOverlay(p);
}

static QPolygonF toPoly(const Polyline& pl, auto&& map) {
  QPolygonF poly;
  poly.reserve(int(pl.size()));
  for (auto& v : pl) poly << map(v);
  return poly;
}

void BoardView::drawTrack(QPainter& p, const Track& t, const QColor& c, double extra) {
  QPen pen(c, px(double(t.width) + extra), Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
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
      if (!arc.valid) { p.drawLine(toScreen(g.a), toScreen(g.b)); break; }
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
      else { poly << poly.first(); p.drawPolyline(poly); }
      break;
    }
  }
}

void BoardView::drawLayer(QPainter& p, LayerId l, bool dim) {
  const Board& b = *doc_->board();
  QColor c = doc_->layerViews()[l].color;
  if (dim) c.setAlpha(110);
  const Layer& L = b.layers[l];
  if (L.kind == LayerKind::Copper) {
    QColor zc = c;
    zc.setAlpha(zc.alpha() / 2);
    p.setPen(Qt::NoPen);
    p.setBrush(zc);
    for (auto& z : b.zones)
      if (z.layer == l)
        for (auto& f : z.filled) p.drawPolygon(toPoly(f, [&](Vec2 v) { return toScreen(v); }));
    for (auto& t : b.tracks)
      if (t.layer == l) drawTrack(p, t, c);
    for (auto& pad : b.pads)
      if (pad.onLayer(l)) drawPad(p, pad, l, c);
    for (auto& v : b.vias)
      if (v.onLayer(l)) drawVia(p, v, c);
  } else {
    for (auto& comp : b.components)
      for (auto& g : comp.graphics)
        if (g.layer == l) drawGraphic(p, g, c);
    for (auto& g : b.graphics)
      if (g.layer == l) drawGraphic(p, g, c);
  }
}

void BoardView::drawBoard(QPainter& p) {
  const Board& b = *doc_->board();
  // Board area
  p.setPen(QPen(Theme::outline(), 1));
  p.setBrush(Theme::boardFill());
  for (auto& loop : b.outline) p.drawPolygon(toPoly(loop, [&](Vec2 v) { return toScreen(v); }));

  // Layers: bottom copper first, active copper last, then technical layers on top.
  auto cu = b.copperLayers();
  LayerId active = doc_->activeLayer();
  for (LayerId l : cu | std::views::reverse)
    if (l != active && layerVisible(l)) drawLayer(p, l, true);
  if (layerVisible(active)) drawLayer(p, active, false);
  // Drill holes
  p.setPen(Qt::NoPen);
  p.setBrush(Theme::drill());
  for (auto& pad : b.pads)
    if (pad.drill > 0 && (pad.copper & visibleCopper() || !pad.copper)) {
      double r = px(pad.drill / 2.0);
      if (pad.drillH > 0 && pad.drillH != pad.drill) {
        Shape s = Shape::rect(pad.pos.v(), double(pad.drill), double(pad.drillH), -degToRad(pad.angle),
                              std::min(pad.drill, pad.drillH) / 2.0);
        p.drawPolygon(toPoly(s.outline(2000), [&](Vec2 v) { return toScreen(v); }));
      } else if (r >= 0.5) {
        p.drawEllipse(toScreen(pad.pos.v()), r, r);
      }
    }
  for (auto& v : b.vias)
    if (v.layers & visibleCopper()) {
      double r = px(v.drill / 2.0);
      if (r >= 0.5) p.drawEllipse(toScreen(v.pos.v()), r, r);
    }
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind != LayerKind::Copper && b.layers[l].kind != LayerKind::Edge && layerVisible(l))
      drawLayer(p, l, false);
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind == LayerKind::Edge && layerVisible(l)) drawLayer(p, l, false);

  // Ratsnest
  if (showRatsnest_) {
    p.setPen(QPen(Theme::ratsnest(), 1));
    for (auto& r : doc_->connectivity().ratsnest) p.drawLine(toScreen(r.a), toScreen(r.b));
  }

  // Net highlight and selection
  QColor hl = Theme::highlight();
  int hn = doc_->highlightedNet();
  if (hn != kNoNet) {
    for (auto& t : b.tracks)
      if (t.net == hn) drawTrack(p, t, hl, 2.0 / scale_);
    for (auto& v : b.vias)
      if (v.net == hn) drawVia(p, v, hl);
    for (auto& pad : b.pads)
      if (pad.net == hn) drawPad(p, pad, -1, hl);
  }
  QColor sc = Theme::selection();
  for (ItemRef r : doc_->selectedItems()) {
    switch (r.type) {
      case ItemType::Track: drawTrack(p, b.tracks[r.index], sc, 3.0 / scale_); break;
      case ItemType::Via: drawVia(p, b.vias[r.index], sc); break;
      case ItemType::Pad: drawPad(p, b.pads[r.index], -1, sc); break;
      default: break;
    }
  }
  p.setPen(QPen(sc, 1, Qt::DashLine));
  p.setBrush(Qt::NoBrush);
  for (int ci : doc_->selectedComponents()) {
    const Component& c = b.components[ci];
    BBox bb;
    for (int pi : c.pads) bb.add(b.pads[pi].shapeGeom().bbox());
    for (auto& g : c.graphics) {
      bb.add(g.a); bb.add(g.b);
      for (auto& q : g.pts) bb.add(q);
    }
    if (bb.valid()) p.drawRect(QRectF(toScreen({bb.minX, bb.minY}), toScreen({bb.maxX, bb.maxY})));
  }

  // DRC markers
  p.setPen(QPen(Theme::drcMarker(), 2));
  p.setBrush(Qt::NoBrush);
  for (auto& v : doc_->drc()) {
    QPointF c = toScreen(v.pos);
    p.drawEllipse(c, 7, 7);
    p.drawLine(c + QPointF(-4, -4), c + QPointF(4, 4));
    p.drawLine(c + QPointF(-4, 4), c + QPointF(4, -4));
  }
}

void BoardView::drawOverlay(QPainter& p) {
  if (!routing_) return;
  const Board& b = *doc_->board();
  QColor c = doc_->layerViews()[routeLayer_].color;
  for (auto& t : routeTracks_) drawTrack(p, t, doc_->layerViews()[t.layer].color);
  for (auto& v : routeVias_) drawVia(p, v, Theme::viaRing());
  if (auto seg = makeSegment(routeLast_, constrained(routeLast_, cursor_))) {
    double m = rubberMargin(*seg);
    QColor rc = m < 0 ? Theme::drcMarker() : c;
    rc.setAlpha(180);
    drawTrack(p, *seg, rc);
  }
  Q_UNUSED(b);
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
  Vec2 w = toWorld(e->position());
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
      doc_->commitEdit(before, tr("Add via"));
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
    Vec2 d = cursor_ - dragStart_;
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
    if (dragBefore_ && (std::abs(d.x) > 1 || std::abs(d.y) > 1)) doc_->commitEdit(*dragBefore_, tr("Move component"));
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
  const Board* b = doc_->hasBoard() ? doc_->board() : nullptr;
  int k = e->key();
  if (k == Qt::Key_Escape) { cancelTool(); return; }
  if (!b) return;
  if (k >= Qt::Key_0 && k <= Qt::Key_9) {
    int n = b->copperCount();
    int idx = k == Qt::Key_0 ? n - 1 : k - Qt::Key_1;
    if (idx >= 0 && idx < n) {
      LayerId l = b->copperByIndex(idx);
      if (routing_ && l != routeLayer_) { routeAddVia(); routeLayer_ = l; }
      doc_->setActiveLayer(l);
    }
    return;
  }
  switch (k) {
    case Qt::Key_Delete: deleteSelection(); break;
    case Qt::Key_Backspace:
      if (routing_ && !routeTracks_.empty()) {
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
      break;
    case Qt::Key_Return:
    case Qt::Key_Enter: finishRoute(); break;
    case Qt::Key_L: toggleLayer(); break;
    case Qt::Key_V:
      if (routing_) routeAddVia();
      else setMode(Mode::Via);
      break;
    case Qt::Key_R: setMode(Mode::Route); break;
    case Qt::Key_W: changeTrackWidth(); break;
    case Qt::Key_Space: rotateSelection(e->modifiers() & Qt::ShiftModifier ? 90 : -90); break;
    case Qt::Key_N: setRatsnestVisible(!showRatsnest_); break;
    case Qt::Key_O:
      setRouteAngle(angle_ == RouteAngle::Deg45 ? RouteAngle::Free : RouteAngle::Deg45);
      break;
    case Qt::Key_A:
      setRouteAngle(angle_ == RouteAngle::Arc ? RouteAngle::Free : RouteAngle::Arc);
      break;
    default: QWidget::keyPressEvent(e);
  }
}

// ---------------------------------------------------------------- editing actions

void BoardView::setMode(Mode m) {
  if (routing_) cancelTool();
  mode_ = m;
  setCursor(m == Mode::Select ? Qt::ArrowCursor : Qt::CrossCursor);
  emit modeChanged(m);
  emit status(m == Mode::Select ? tr("Select / move") : m == Mode::Route ? tr("Route: click a pad to start") : tr("Via: click to place"));
  update();
}

void BoardView::setRouteAngle(RouteAngle a) {
  angle_ = a;
  emit status(a == RouteAngle::Free ? tr("Any angle") : a == RouteAngle::Deg45 ? tr("45 degrees") : tr("Arcs"));
  update();
}

void BoardView::setRatsnestVisible(bool on) { showRatsnest_ = on; update(); }
void BoardView::setOnlyActiveLayer(bool on) { onlyActive_ = on; update(); }

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
  doc_->commitEdit(before, tr("Delete"));
}

void BoardView::rotateSelection(double deg) {
  if (!doc_->hasBoard()) return;
  auto comps = doc_->selectedComponents();
  if (comps.empty()) return;
  auto before = doc_->beginEdit();
  for (int ci : comps) doc_->board()->rotateComponent(ci, deg);
  doc_->commitEdit(before, tr("Rotate"));
}

void BoardView::changeTrackWidth() {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  double cur = routing_ ? routeWidth_ / 1e6 : 0;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) cur = b.tracks[r.index].width / 1e6;
  bool ok = false;
  double w = QInputDialog::getDouble(this, tr("Track width"), tr("Width, mm:"), cur > 0 ? cur : 0.25, 0.01, 10.0, 3, &ok);
  if (!ok) return;
  if (routing_) { routeWidth_ = mmToNm(w); update(); return; }
  auto before = doc_->beginEdit();
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Track) b.tracks[r.index].width = mmToNm(w);
  doc_->commitEdit(before, tr("Track width"));
}

void BoardView::cancelTool() {
  if (routing_) {
    routing_ = false;
    routeTracks_.clear();
    routeVias_.clear();
    emit status(tr("Route cancelled"));
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
  routeWidth_ = b.classOf(routeNet_).trackWidth;
  routeTracks_.clear();
  routeVias_.clear();
  routeLast_ = at;
  routeDir_.reset();
  emit status(tr("Routing %1 on %2: click points, V = via, L = layer, Enter = finish, Esc = cancel")
                  .arg(routeNet_ >= 0 ? QString::fromStdString(b.nets[routeNet_].name) : tr("(no net)"))
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
  for (auto& s : itemShapes(b, ItemRef{ItemType::Track, -1}).empty() ? std::vector<Shape>{} : std::vector<Shape>{}) (void)s;
  // Build the capsule(s) of the rubber segment directly.
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
  doc_->setActiveLayer(routeLayer_);
  update();
}

void BoardView::toggleLayer() {
  if (!doc_->hasBoard()) return;
  if (routing_) { routeAddVia(); return; }
  auto cu = doc_->board()->copperLayers();
  auto it = std::ranges::find(cu, doc_->activeLayer());
  size_t idx = it == cu.end() ? 0 : size_t(it - cu.begin());
  doc_->setActiveLayer(cu[(idx + 1) % cu.size()]);
}

void BoardView::finishRoute() {
  if (!routing_) return;
  Board& b = *doc_->board();
  routing_ = false;
  if (!routeTracks_.empty() || !routeVias_.empty()) {
    auto before = doc_->beginEdit();
    for (auto& t : routeTracks_) b.tracks.push_back(t);
    for (auto& v : routeVias_) b.vias.push_back(v);
    doc_->commitEdit(before, tr("Route"));
  }
  routeTracks_.clear();
  routeVias_.clear();
  emit status(tr("Route finished"));
  update();
}

}  // namespace xr::gui
