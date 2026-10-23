#pragma once
// Interactive board canvas: rendering, zoom/pan, picking, component moves, manual routing and vias.
#include <QWidget>
#include <optional>
#include <vector>

#include "gui/Document.h"

namespace xr::gui {

enum class Mode { Select, Route, Via };
enum class RouteAngle { Free, Deg45, Arc };

class BoardView : public QWidget {
  Q_OBJECT
 public:
  explicit BoardView(Document* doc, QWidget* parent = nullptr);

  Mode mode() const { return mode_; }
  RouteAngle routeAngle() const { return angle_; }
  bool ratsnestVisible() const { return showRatsnest_; }
  bool onlyActiveLayer() const { return onlyActive_; }

 public slots:
  void setMode(Mode m);
  void setRouteAngle(RouteAngle a);
  void setRatsnestVisible(bool on);
  void setOnlyActiveLayer(bool on);
  void fitBoard();
  void centerOn(Vec2 p, double widthMm = 0);
  void zoomBy(double factor);
  void deleteSelection();
  void rotateSelection(double deg);
  void cancelTool();
  void finishRoute();
  void routeAddVia();  // via + layer change while routing
  void toggleLayer();  // L: next copper layer (while routing: with a via)
  void changeTrackWidth();
  void recomputeShapes();  // F5: selected (or all) tracks become sketches and are re-realised

 signals:
  void cursorMoved(Vec2 world);
  void status(const QString& text);
  void modeChanged(Mode m);

 protected:
  void paintEvent(QPaintEvent*) override;
  void mousePressEvent(QMouseEvent*) override;
  void mouseMoveEvent(QMouseEvent*) override;
  void mouseReleaseEvent(QMouseEvent*) override;
  void mouseDoubleClickEvent(QMouseEvent*) override;
  void wheelEvent(QWheelEvent*) override;
  void keyPressEvent(QKeyEvent*) override;
  void resizeEvent(QResizeEvent*) override;

 private:
  struct Pick {
    std::optional<ItemRef> item;
    int component = -1;
    Vec2 snap;  // pad/via centre or the click point
  };
  QPointF toScreen(Vec2 w) const;
  Vec2 toWorld(QPointF s) const;
  double px(double nm) const { return nm * scale_; }
  Pick pick(QPointF screen) const;
  LayerMask visibleCopper() const;
  bool layerVisible(LayerId l) const;

  void drawBoard(QPainter& p);
  void drawLayer(QPainter& p, LayerId l, bool dim);
  void drawTrack(QPainter& p, const Track& t, const QColor& c, double extra = 0);
  void drawPad(QPainter& p, const Pad& pad, LayerId l, const QColor& c);
  void drawVia(QPainter& p, const Via& v, const QColor& c);
  void drawGraphic(QPainter& p, const Graphic& g, const QColor& c);
  void drawOverlay(QPainter& p);

  // Routing tool state
  void routeStart(const Pick& pk, Vec2 at);
  void routeAddPoint(Vec2 at, const Pick& pk);
  Vec2 constrained(Vec2 from, Vec2 to) const;
  std::optional<Track> makeSegment(Vec2 from, Vec2 to) const;  // honours angle mode (arc)
  double rubberMargin(const Track& t) const;

  Document* doc_;
  Mode mode_ = Mode::Select;
  RouteAngle angle_ = RouteAngle::Free;
  bool showRatsnest_ = true;
  bool onlyActive_ = false;
  Vec2 center_;
  double scale_ = 1e-5;  // px per nm
  QPointF lastMouse_;
  Vec2 cursor_;
  bool panning_ = false;
  // component drag
  bool dragging_ = false;
  Vec2 dragStart_;
  std::optional<EditSnapshot> dragBefore_;
  std::vector<Point> dragOrigins_;
  // routing
  bool routing_ = false;
  int routeNet_ = kNoNet;
  LayerId routeLayer_ = 0;
  Coord routeWidth_ = 0;
  std::vector<Track> routeTracks_;
  std::vector<Via> routeVias_;
  Vec2 routeLast_;
  std::optional<Vec2> routeDir_;  // direction of the last segment (for tangent arcs)
};

}  // namespace xr::gui
