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
#include "router/topo/Freestyle.h"

namespace xr::gui {

enum class Mode { Select, Freestyle, Route, Via, Measure, Draw, Text };
// Creation tools of the «Вставка» menu: what is drawn and with which figure.
enum class DrawTarget { Board, Keepout, Copper, Cutout, Detail };
enum class DrawShape { Poly, Rect, Disk, Circle, Line, ArcC, ArcP };
enum class ViaKind { Single, Row, Matrix };
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
  topo::Push freestylePush() const { return push_; }

 public slots:
  void setMode(Mode m);
  void startFreestyle(topo::Push push);  // F8 and its sub-modes
  // A creation tool; one object unless Shift is held when it is chosen (TopoR's single-shot tools).
  void startDraw(DrawTarget target, DrawShape shape);
  void startText();
  void startVias(ViaKind kind);  // «Ряд переходов» / «Матрица переходов»: two clicks
  DrawTarget drawTarget() const { return drawTarget_; }
  void finishShape();  // Enter / double click / right click: the polygon or line drawn so far
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
  // Clipboard (wires, vias, copper areas): a paste follows the cursor until a click places it.
  void copySelection();
  void cutSelection();
  void paste();
  void duplicateSelection();
  static bool clipboardEmpty();
  bool isPlacing() const { return placing_; }
  bool isDragging() const { return drag_ != Drag::None; }
  void cancelTool();
  void finishRoute();
  void routeAddVia();      // via + layer change while routing
  void toggleLayer();      // L: while routing, a via to the next copper layer
  void viaKey();           // V: a via while routing, otherwise the via tool
  void routeUndoLast();    // Backspace: drops the last routed segment (and its via)
  void routeToTarget();    // «;»: the suggested path to the target is laid and the route finished
  void nextTarget();       // Q: the next unconnected object of the net becomes the target
  void selectCopper(int toporIndex);  // 0 = bottom, 1 = top, 2..9 = inner layers (with a via while routing)
  void toggleMetalLayers();           // all copper layers on/off
  void toggleFix();                   // F: lock/unlock the selection
  void selectAll();
  void cycleSelection();             // X: segment → wire → net
  void selectWire();                 // whole wires (chains up to pads, vias, junctions) of the selected segments
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
  enum class Drag { None, Fragment, Segment, Vertex, Bend, Freestyle };
  void freestyleBy(Vec2 shift, double rotate);  // one Freestyle move of fsTarget_
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
  BBox componentBounds(int ci) const;  // «Габариты»: pads and drawings on every layer
  static BBox graphicBBox(const Graphic& g);
  Vec2 snapped(Vec2 w) const;  // «Привязка к сетке»
  void pushView();             // records the view for Alt+← / Alt+→
  void selectInFrame(QRectF screenRect, bool crossing, bool add);
  void clickSelect(const Pick& pk, Qt::KeyboardModifiers mods);
  std::vector<ItemRef> wireOf(int track) const;  // the chain of one layer up to a pad, a via or a junction
  void measureClick(const Pick& pk, Vec2 w);
  void drawTools(QPainter& p);  // selection frame, ruler
  void drawTrack(QPainter& p, const Track& t, const QColor& c, double extra = 0);
  void drawPad(QPainter& p, const Pad& pad, LayerId l, const QColor& c);
  void drawVia(QPainter& p, const Via& v, const QColor& c);
  void drawGraphic(QPainter& p, const Graphic& g, const QColor& c);
  void drawOverlay(QPainter& p);
  void drawKeepouts(QPainter& p);
  void drawText(QPainter& p, const Text& t, const QColor& c);
  void drawDrawing(QPainter& p);  // the figure being drawn
  void drawClick(Vec2 w);
  void createShape(std::vector<Graphic> figure);  // what the drawing tool makes of a finished figure
  bool keepoutVisible(const Keepout& k) const;
  void syncOutline();  // board outline from its drawings, after they changed

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
  bool placing_ = false;                // a pasted fragment follows the cursor
  // vias: a single one, or a row / matrix between two clicks
  ViaKind viaKind_ = ViaKind::Single;
  std::optional<Vec2> viaStart_;
  int viaNet_ = kNoNet;
  std::vector<Vec2> viaSites(Vec2 to) const;
  // drawing tools
  DrawTarget drawTarget_ = DrawTarget::Board;
  DrawShape drawShape_ = DrawShape::Poly;
  bool drawSticky_ = false;
  std::vector<Vec2> drawPts_;
  // Freestyle: the board changes step by step (wires re-shaped), so a drag goes on from where it is.
  topo::Push push_ = topo::Push::None;
  topo::FreestyleTarget fsTarget_;
  Vec2 fsLast_;
  std::optional<EditSnapshot> pasteBefore_;
  // routing
  bool routing_ = false;
  int routeNet_ = kNoNet;
  LayerId routeLayer_ = 0;
  Coord routeWidth_ = 0;
  std::vector<Track> routeTracks_;
  std::vector<Via> routeVias_;
  Vec2 routeLast_;
  std::optional<Vec2> routeDir_;  // direction of the last segment (for tangent arcs)
  // TopoR's target and suggested path: the nearest unconnected object of the net on the routing
  // layer and the way to it without violations (dash-dotted); none found: a dashed pointer.
  std::optional<ItemRef> routeFrom_;
  int targetIndex_ = 0;
  std::optional<Vec2> routeTarget_;
  std::vector<Track> routeHint_;
  void updateRouteHint();
};

}  // namespace xr::gui
