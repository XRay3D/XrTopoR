#pragma once
// Interactive board canvas: rendering, zoom/pan, picking, selection (click, frame, cyclic), moving
// fragments with the wires attached to them, editing wires by their markers, manual routing, vias and
// the ruler — with TopoR's mouse conventions.
#include <QElapsedTimer>
#include <QWidget>
#include <optional>
#include <vector>

#include "core/Edit.h"
#include "gui/Document.h"

namespace xr::gui {

enum class Mode { Select, Route, Via, Measure };
enum class MeasureKind { Points, Objects };
enum class RouteAngle { Free, Deg45, Arc };

class BoardView : public QWidget {
  Q_OBJECT
 public:
  explicit BoardView(Document* doc, QWidget* parent = nullptr);

  Mode mode() const { return mode_; }
  RouteAngle routeAngle() const { return angle_; }
  bool ratsnestVisible() const;
  bool onlyActiveLayer() const;
  bool isRouting() const { return routing_; }

 public slots:
  void setMode(Mode m);
  void setRouteAngle(RouteAngle a);
  void setRatsnestVisible(bool on);
  void setOnlyActiveLayer(bool on);
  void fitBoard();
  void fitAll();          // board, components and everything drawn
  void centerAtCursor();  // «Перейти в центр»: the point under the cursor becomes the view centre
  void centerOn(Vec2 p, double widthMm = 0);
  void zoomBy(double factor);
  void deleteSelection();
  void rotateSelection(double deg);  // with the attached wires; while dragging, turns the dragged fragment
  void flipSelection(bool vertical);  // S / Y: to the other side, about the vertical / horizontal axis
  void changeLayer();                 // L: a via while routing, otherwise the layer menu for the selected wires
  void straighten();                  // C
  void unlinkSelection();             // U
  void changeNet();                   // Shift+N
  void invertSelection();
  void cancelTool();
  void finishRoute();
  void routeAddVia();      // via + layer change while routing
  void toggleLayer();      // L: while routing, a via to the next copper layer
  void viaKey();           // V: a via while routing, otherwise the via tool
  void routeUndoLast();    // Backspace: drops the last routed segment (and its via)
  void selectCopper(int toporIndex);  // 0 = bottom, 1 = top, 2..9 = inner layers (with a via while routing)
  void toggleMetalLayers();           // all copper layers on/off
  void toggleFix();                   // F: lock/unlock the selection
  void selectAll();
  void cycleSelection();             // X: segment → wire → net
  void selectWire();                 // whole wires of the selected segments
  void selectNet();                  // everything of the selected objects' nets
  void startMeasure(MeasureKind k);  // Ctrl+M: the ruler; Esc returns to the previous mode
  void prevView();                   // Alt+←
  void nextView();                   // Alt+→
  void changeTrackWidth();
  void recomputeShapes();  // F5: selected (or all) tracks become sketches and are re-realised

 signals:
  void cursorMoved(Vec2 world);
  void clicked(Vec2 world);  // left button pressed on the board (origin of dx/dy in the status bar)
  void status(const QString& text);
  void modeChanged(Mode m);
  void routeAngleChanged(RouteAngle a);
  void viewChanged();  // ratsnest / only-active-layer toggles
  void contextMenuRequested(QPoint globalPos);  // right click (the object under it is selected first)
  void measured(const QString& text);

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
  struct Marker {
    int track = -1;
    enum Kind { End, Middle } kind = End;
    int end = 0;  // End: 0 = a, 1 = b
  };
  std::optional<Marker> markerAt(QPointF screen) const;  // markers of the selected tracks
  std::vector<Marker> markers() const;
  Vec2 markerPos(const Marker& m) const;

  edit::Fragment selectedFragment() const;
  // Moves the selection by an edit::Motion built around its pivot (rotations and flips).
  void transformSelection(double rotate, bool mirror, const QString& title);
  enum class Drag { None, Fragment, Segment, Vertex, Bend };
  void startDrag(Drag kind, Vec2 at, std::optional<Marker> marker = {});
  void applyDrag();
  void finishDrag();
  void cancelDrag();

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
  void drawLayer(QPainter& p, LayerId l);
  void drawGrid(QPainter& p);
  void drawVias(QPainter& p);
  void drawLabels(QPainter& p);
  std::optional<QColor> netColor(int net, bool enabledForKind) const;
  bool componentVisible(int ci) const;
  static BBox graphicBBox(const Graphic& g);
  Vec2 snapped(Vec2 w) const;  // «Привязка к сетке»
  void pushView();             // records the view for Alt+← / Alt+→
  void selectInFrame(QRectF screenRect, bool crossing, bool add);
  void clickSelect(const Pick& pk, Qt::KeyboardModifiers mods);
  std::vector<ItemRef> wireOf(int track) const;  // connected same-net tracks and vias, up to pads
  void measureClick(const Pick& pk, Vec2 w);
  void drawTools(QPainter& p);  // selection frame, ruler
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
  Vec2 center_;
  double scale_ = 1e-5;  // px per nm
  QPointF lastMouse_;
  Vec2 cursor_;
  bool panning_ = false;
  // right button: context menu on click, panning on drag
  bool rightDown_ = false, rightMoved_ = false;
  QPointF rightPos_;
  // frame selection (screen coordinates)
  std::optional<QPointF> frameStart_;
  QPointF frameEnd_;
  // X: cyclic selection
  int cycleSeed_ = -1, cycleLevel_ = 0;
  // view history
  struct ViewState {
    Vec2 center;
    double scale;
  };
  std::vector<ViewState> views_;
  int viewPos_ = -1;
  bool autoFit_ = false;  // the board is shown whole until the user changes the view
  QElapsedTimer viewTimer_;
  // ruler
  MeasureKind measureKind_ = MeasureKind::Objects;
  Mode measureReturn_ = Mode::Select;
  std::optional<Vec2> measureA_, measureB_;
  std::optional<ItemRef> measureObjA_;
  // drags: a fragment (selection), one segment (parallel transfer), a vertex or the bend of a segment
  Drag drag_ = Drag::None;
  bool dragMoved_ = false;  // past the threshold: a drag, not a click
  QPointF dragScreen_;
  Vec2 dragStart_;
  edit::Fragment dragFragment_;
  Vec2 dragPivot_;
  double dragRotate_ = 0;
  bool dragMirror_ = false;
  Marker dragMarker_;
  std::optional<EditSnapshot> dragBefore_;
  std::optional<Pick> pendingClick_;  // press on a selected object: selects it alone if not dragged
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
