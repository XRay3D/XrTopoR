// GUI smoke test: drives the board view with synthetic mouse/key events on the offscreen platform.
#include <QApplication>
#include <format>
#include <print>
#include <QDir>
#include <QDockWidget>
#include <QPushButton>
#include <QTableWidget>
#include <QFile>
#include <QDoubleSpinBox>
#include <QPlainTextEdit>
#include <QRadioButton>
#include <QToolButton>
#include <QComboBox>
#include <QFontDatabase>
#include <QLabel>
#include <QLineEdit>
#include <QTreeWidget>
#include <QMenuBar>
#include <QMouseEvent>
#include <QSettings>
#include <QSignalSpy>
#include <QStackedWidget>
#include <QTemporaryDir>
#include <QTest>
#include <QWheelEvent>
#include <QToolBar>
#include <QToolButton>
#include <gtest/gtest.h>
#include <set>

#include "core/Connectivity.h"
#include "core/DiffPairs.h"
#include "core/Edit.h"
#include "gui/BoardView.h"
#include "gui/Commands.h"
#include "gui/Document.h"
#include "gui/AutorouteWindow.h"
#include "gui/DesignParamsDialog.h"
#include "gui/PadstackDialogs.h"
#include "gui/SpinBox.h"
#include "core/Padstack.h"
#include "gui/DisplayPanel.h"
#include "gui/DrcDialog.h"
#include "gui/MainWindow.h"
#include "gui/MessagesPanel.h"
#include "gui/PropertiesPanel.h"
#include "gui/TextStylesDialog.h"
#include "gui/SearchPanel.h"
#include "gui/Schemes.h"
#include "gui/ToporConfig.h"
#include "io/BoardIO.h"
#include "topo/Chains.h"
#include "topo/Sidecar.h"

using namespace xr;
using namespace xr::gui;

static std::string data(const char* name) { return std::string(XR_TEST_DATA) + "/" + name; }

namespace {

struct App {
  int argc = 1;
  char arg0[8] = "xrtests";
  char* argv[2] = {arg0, nullptr};
  QApplication app{argc, argv};
  QTemporaryDir settings;  // tests never touch the user's settings
  App() {
    QSettings::setDefaultFormat(QSettings::IniFormat);
    QSettings::setPath(QSettings::IniFormat, QSettings::UserScope, settings.path());
  }
};

// Never destroyed: a QApplication torn down by static destructors outlives Qt's own globals (fonts).
App& app() {
  static App* a = new App;
  return *a;
}

// QTest::mouseMove is not delivered as a move event on every platform plugin: send one directly.
void moveTo(QWidget& w, QPoint pos, Qt::MouseButtons held = Qt::NoButton) {
  QMouseEvent ev(QEvent::MouseMove, QPointF(pos), w.mapToGlobal(QPointF(pos)), Qt::NoButton, held, Qt::NoModifier);
  QApplication::sendEvent(&w, &ev);
}

// Screen position of a world point for the given view.
QPoint screenOf(BoardView& v, Vec2 w, Vec2 center, double scale) {
  return QPoint(int((w.x - center.x) * scale + v.width() / 2.0), int((w.y - center.y) * scale + v.height() / 2.0));
}

}  // namespace

TEST(Gui, ManualRouteBetweenPads) {
  app();
  Document doc;
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  (*b)->clearRouting(false);
  Board& brd = **b;
  // Two pads of the same net, reasonably apart.
  int pa = -1, pb = -1;
  for (int i = 0; i < int(brd.pads.size()) && pa < 0; ++i)
    for (int j = i + 1; j < int(brd.pads.size()); ++j)
      if (brd.pads[i].net >= 0 && brd.pads[i].net == brd.pads[j].net &&
          (brd.pads[i].pos.v() - brd.pads[j].pos.v()).len() > 5 * kNmPerMm) {
        pa = i;
        pb = j;
        break;
      }
  ASSERT_GE(pa, 0);
  Vec2 A = brd.pads[pa].pos.v(), B = brd.pads[pb].pos.v();
  size_t tracksBefore = brd.tracks.size();

  BoardView view(&doc);
  view.resize(800, 600);
  view.show();
  doc.setBoard(std::move(*b), "x");
  QTest::qWait(50);
  // Centre the view on the pad pair at a known scale.
  Vec2 c = (A + B) * 0.5;
  double scale = 400.0 / (B - A).len();
  view.centerOn(c, (B - A).len() * 2 / kNmPerMm);
  (void)scale;
  // Query the actual scale from a round trip: centerOn sets width()/(2*len) px per nm.
  double s = view.width() / ((B - A).len() * 2);

  view.setMode(Mode::Route);
  QTest::mouseClick(&view, Qt::LeftButton, Qt::NoModifier, screenOf(view, A, c, s));
  QTest::qWait(10);
  Vec2 mid = c + Vec2{0, 3 * kNmPerMm};
  moveTo(view, screenOf(view, mid, c, s));
  QTest::mouseClick(&view, Qt::LeftButton, Qt::NoModifier, screenOf(view, mid, c, s));
  moveTo(view, screenOf(view, B, c, s));
  QTest::mouseClick(&view, Qt::LeftButton, Qt::NoModifier, screenOf(view, B, c, s));  // ends on the target pad
  QTest::qWait(10);
  const Board& nb = *doc.board();
  EXPECT_EQ(nb.tracks.size(), tracksBefore + 2);
  ASSERT_GE(nb.tracks.size(), 2u);
  EXPECT_EQ(nb.tracks.back().net, nb.pads[pa].net);
  EXPECT_EQ(nb.tracks.back().b, nb.pads[pb].pos);
  EXPECT_TRUE(doc.undoStack()->canUndo());
  doc.undoStack()->undo();
  EXPECT_EQ(doc.board()->tracks.size(), tracksBefore);
  doc.undoStack()->redo();
  EXPECT_EQ(doc.board()->tracks.size(), tracksBefore + 2);
}

TEST(Gui, MoveComponentAndVia) {
  app();
  Document doc;
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  (*b)->clearRouting(false);  // a track ending on the pad would be picked instead of the component
  Board& brd = **b;
  int ci = 0;
  Vec2 P0 = brd.components[ci].pos.v();
  Vec2 padBefore = brd.pads[brd.components[ci].pads[0]].pos.v();
  BoardView view(&doc);
  view.resize(800, 600);
  view.show();
  doc.setBoard(std::move(*b), "x");
  QTest::qWait(50);
  Vec2 c = P0;
  view.centerOn(c, 20);
  double s = view.width() / (20.0 * kNmPerMm);
  // Drag the first pad of the component by 5 mm.
  QPoint from = screenOf(view, padBefore, c, s);
  QPoint to = from + QPoint(int(5 * kNmPerMm * s), 0);
  QTest::mousePress(&view, Qt::LeftButton, Qt::NoModifier, from);
  moveTo(view, from + QPoint(10, 0), Qt::LeftButton);
  moveTo(view, to, Qt::LeftButton);
  QTest::mouseRelease(&view, Qt::LeftButton, Qt::NoModifier, to);
  QTest::qWait(10);
  const Board& nb = *doc.board();
  EXPECT_NEAR(nb.components[ci].pos.x, P0.x + 5 * kNmPerMm, 50000);
  EXPECT_NEAR(nb.pads[nb.components[ci].pads[0]].pos.x, padBefore.x + 5 * kNmPerMm, 50000);
  doc.undoStack()->undo();
  EXPECT_EQ(doc.board()->components[ci].pos, Point(P0));

  size_t vias = doc.board()->vias.size();
  view.setMode(Mode::Via);
  QTest::mouseClick(&view, Qt::LeftButton, Qt::NoModifier, screenOf(view, c + Vec2{7 * kNmPerMm, 7 * kNmPerMm}, c, s));
  EXPECT_EQ(doc.board()->vias.size(), vias + 1);
}

TEST(Gui, RecomputeShapesKeepsConnectivityAndClearance) {
  app();
  Document doc;
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  BoardView view(&doc);
  view.resize(800, 600);
  doc.setBoard(std::move(*b), "x");
  size_t tracksBefore = doc.board()->tracks.size();
  // The zone fills stay through the recompute (the model holds the poured zones, what lies in them is
  // locked): the connectivity is the board's own.
  size_t unroutedBaseline = Connectivity::compute(*doc.board()).ratsnest.size();
  view.recomputeShapes();  // nothing selected: every track becomes a sketch
  const Board& nb = *doc.board();
  EXPECT_NE(nb.tracks.size(), tracksBefore);
  bool arc = false;
  for (auto& t : nb.tracks) arc |= t.isArc();
  EXPECT_TRUE(arc);
  EXPECT_EQ(Connectivity::compute(nb).ratsnest.size(), unroutedBaseline);
  for (auto& v : runDrc(nb))
    if (v.type != DrcViolation::Type::Unconnected) ADD_FAILURE() << v.message;
  doc.undoStack()->undo();
  EXPECT_EQ(doc.board()->tracks.size(), tracksBefore) << "after undo";
}

// A hand edit marks exactly the tracks it changed (by content: the edit renumbers the tracks), and F5 without a
// selection re-lays those chains and the wires sharing their edges (those near it may move, further off by little),
// leaving the rest of the board as it was. An edit that drags a wire across
// another (AD9 over AD11) stops F5 instead, as in TopoR: the crossing in the messages, its wires selected, nothing
// laid as drawn.
TEST(Gui, RecomputeShapesEditedOnly) {
  app();
  Document doc;
  auto b = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(b);
  BoardView view(&doc);
  view.resize(800, 600);
  doc.setBoard(std::move(*b), "x");
  view.recomputeShapes();  // everything: nothing is marked yet
  Board& bd = *doc.board();
  for (auto& t : bd.tracks) EXPECT_FALSE(t.edited);
  int ad9 = -1;
  for (size_t i = 0; i < bd.nets.size(); ++i)
    if (bd.nets[i].name == "AD9") ad9 = int(i);
  ASSERT_GE(ad9, 0);
  // Move the end of the AD9 bottom track that enters the via at (186.9, 82.15), as a drag does: the segment gets
  // a new far end, a joining track leads on to the via, degenerate tracks go.
  const Point via{Coord(186.9 * kNmPerMm), Coord(-82.15 * kNmPerMm)};
  auto drag = [&](Vec2 to) {
    int moved = -1;
    for (size_t i = 0; i < bd.tracks.size(); ++i) {
      const Track& t = bd.tracks[i];
      if (t.net == ad9 && !t.isArc() && (t.b == via || t.a == via) && (t.a.v() - t.b.v()).len() > 3 * kNmPerMm) moved = int(i);
    }
    ASSERT_GE(moved, 0);
    auto before = doc.beginEdit();
    Track& t = bd.tracks[moved];
    if (t.a == via) std::swap(t.a, t.b);
    const Point far(to);
    t.b = far;
    Track join = t;
    join.a = far;
    join.b = via;
    join.id = 0;
    bd.tracks.insert(bd.tracks.begin(), join);  // at the front: every index shifts
    edit::removeDegenerate(bd);
    doc.commitEdit(before, "drag");
    int marked = 0;
    for (auto& x : bd.tracks) marked += x.edited;
    EXPECT_EQ(marked, 2) << "the moved segment and the joining track only";
  };
  // Across AD11: F5 stops.
  {
    drag(Vec2{189.47 * kNmPerMm, -85.57 * kNmPerMm});
    const Board was = bd;
    view.recomputeShapes();
    EXPECT_EQ(bd.tracks.size(), was.tracks.size()) << "nothing laid";
    EXPECT_FALSE(doc.selectedItems().empty()) << "the crossing wires selected";
    EXPECT_TRUE(r::any_of(doc.drc(), [](const DrcViolation& v) { return v.type == DrcViolation::Type::Topology; }));
    doc.undoStack()->undo();
    doc.clearSelection();
    for (auto& x : bd.tracks) x.edited = false;
  }
  // Off to the side, clear of the others: the AD9 chain only.
  drag(via.v() + Vec2{0.35 * kNmPerMm, -0.35 * kNmPerMm});
  Board unchanged = bd;
  view.recomputeShapes();
  const Board& nb = *doc.board();
  // Tracks of other nets are as they were but next to AD9 (the wires sharing its edges are packed with it again).
  int farChanged = 0, ad9Changed = 0;
  std::set<std::tuple<Coord, Coord, Coord, Coord>> was;
  for (auto& x : unchanged.tracks) was.insert({x.a.x, x.a.y, x.b.x, x.b.y});
  auto nearAd9 = [&](const Track& x) {
    for (const Track& y : nb.tracks)
      if (y.net == ad9 && distSegmentSegment(x.a.v(), x.b.v(), y.a.v(), y.b.v()) < 3 * kNmPerMm) return true;
    return false;
  };
  for (auto& x : nb.tracks)
    if (!was.contains({x.a.x, x.a.y, x.b.x, x.b.y})) {
      if (x.net == ad9) ++ad9Changed;
      else if (!nearAd9(x)) {
        // Further off, a wire sharing AD9's edges laid again whole: it may shift a little, no more.
        double d = 1e300;
        for (const Track& y : unchanged.tracks)
          if (y.net == x.net && y.layer == x.layer) d = std::min(d, std::max(distPointSegment(x.a.v(), y.a.v(), y.b.v()), distPointSegment(x.b.v(), y.a.v(), y.b.v())));
        if (d > 0.6 * kNmPerMm) ++farChanged;
      }
    }
  EXPECT_EQ(farChanged, 0);
  EXPECT_GT(ad9Changed, 0) << "the AD9 chain laid again";
  for (auto& x : nb.tracks) EXPECT_FALSE(x.edited);
  if (const char* out = std::getenv("XR_TEST_OUT")) (void)io::saveBoard(nb, std::string(out) + "/edited_only.fst");
}

// The window is laid out like TopoR: its menus in order, its docks and toolbars under TopoR's names.
TEST(Gui, MainWindowLayoutLikeTopoR) {
  app();
  MainWindow w;
  QStringList menus;
  for (QAction* a : w.menuBar()->actions()) menus << a->text();
  EXPECT_EQ(menus, (QStringList{"&Файл", "&Правка", "&Вид", "&Дизайн", "Т&рассировка", "Вс&тавка", "&Инструменты",
                                "&Справка"}));
  std::map<QString, Qt::DockWidgetArea> docks{{"Project_View", Qt::LeftDockWidgetArea},
                                              {"Search_View", Qt::LeftDockWidgetArea},
                                              {"properties", Qt::BottomDockWidgetArea},
                                              {"Output_View", Qt::BottomDockWidgetArea},
                                              {"display_control", Qt::RightDockWidgetArea}};
  for (auto& [name, area] : docks) {
    auto* d = w.findChild<QDockWidget*>(name);
    ASSERT_TRUE(d) << name.toStdString();
    EXPECT_EQ(w.dockWidgetArea(d), area) << name.toStdString();
  }
  for (const char* tb : {"ide_toolbar", "pcbdoctb_edit2", "pcbdoctb_mode", "pcbdoctb_view", "pcbdoctb_edit",
                         "editor_mode_toolbar", "editor_autoproc_toolbar"})
    EXPECT_TRUE(w.findChild<QToolBar*>(tb)) << tb;
  // Commands work only with a board open.
  EXPECT_FALSE((*w.commands())["Accel_DRC"]->isEnabled());
  EXPECT_TRUE((*w.commands())["Accel_FileOpen"]->isEnabled());
  ASSERT_TRUE(w.openFile(QString::fromStdString(data("astable.kicad_pcb"))));
  EXPECT_TRUE((*w.commands())["Accel_DRC"]->isEnabled());
}

// TopoR's default hotkeys: every key belongs to one command.
TEST(Gui, DefaultHotkeysAreUnique) {
  app();
  QWidget host;
  Commands cmds(&host);
  std::map<QString, QString> owner;
  for (auto& i : cmds.all())
    for (auto& k : i.defaults) {
      QString key = k.toString(QKeySequence::PortableText);
      EXPECT_FALSE(owner.contains(key)) << key.toStdString() << ": " << owner[key].toStdString() << " / "
                                        << i.id.toStdString();
      owner[key] = i.id;
    }
  EXPECT_EQ(owner["F7"], "Accel_AutoStart");
  EXPECT_EQ(owner["F11"], "Accel_TO");
  EXPECT_EQ(owner["Alt+D"], "Accel_ViewDispCtrl");
}

// While routing, V adds a via (the route continues on the next layer) instead of switching tools.
TEST(Gui, ViaKeyWhileRouting) {
  app();
  MainWindow w;
  w.resize(1200, 800);
  w.show();
  ASSERT_TRUE(QTest::qWaitForWindowExposed(&w));
  ASSERT_TRUE(w.openFile(QString::fromStdString(data("astable.kicad_pcb"))));
  Document& doc = *w.document();
  BoardView& view = *w.view();
  doc.board()->clearRouting(false);
  doc.invalidate();
  const Board& b = *doc.board();
  int pa = -1, pb = -1;
  for (int i = 0; i < int(b.pads.size()) && pb < 0; ++i)
    for (int j = i + 1; j < int(b.pads.size()); ++j)
      if (b.pads[i].net >= 0 && b.pads[i].net == b.pads[j].net && b.pads[i].drill > 0 && b.pads[j].drill > 0 &&
          (b.pads[i].pos.v() - b.pads[j].pos.v()).len() > 5 * kNmPerMm) {
        pa = i;
        pb = j;
        break;
      }
  ASSERT_GE(pb, 0);
  Vec2 a = b.pads[pa].pos.v(), c = b.pads[pb].pos.v();
  Vec2 mid = (a + c) * 0.5;
  double widthMm = 2 * (a - c).len() / kNmPerMm;
  view.centerOn(mid, widthMm);
  double scale = view.width() / (widthMm * kNmPerMm);
  view.setMode(Mode::Route);
  QTest::mouseClick(&view, Qt::LeftButton, {}, screenOf(view, a, mid, scale));
  ASSERT_TRUE(view.isRouting());
  QTest::mouseClick(&view, Qt::LeftButton, {}, screenOf(view, mid + Vec2{0, 3 * kNmPerMm}, mid, scale));
  size_t vias = b.vias.size();
  QTest::keyClick(&view, Qt::Key_V);
  EXPECT_TRUE(view.isRouting());
  EXPECT_EQ(view.mode(), Mode::Route);
  QTest::mouseClick(&view, Qt::LeftButton, {}, screenOf(view, c, mid, scale));
  EXPECT_FALSE(view.isRouting());
  EXPECT_EQ(b.vias.size(), vias + 1);
}

// Designs from other CADs get TopoR's default schemes; a colour scheme recolours the layers.
TEST(Gui, DisplaySchemes) {
  app();
  Document doc;
  auto r = io::loadBoard(data("el4134_pcad_ascii.pcb"));
  ASSERT_TRUE(r) << r.error();
  doc.setBoard(std::move(*r), "el4134.pcb");
  const Board& b = *doc.board();
  DisplayControl& d = doc.display();
  EXPECT_EQ(d.colorScheme, "TopoR 6.0");
  EXPECT_EQ(d.color("background", 0), 0x030b10u);
  LayerId top = b.topCopper(), bottom = b.bottomCopper();
  EXPECT_EQ(d.layer(b.layers[top].name)->details, 0xa52310u);
  EXPECT_EQ(d.layer(b.layers[bottom].name)->details, 0x0f7140u);
  EXPECT_EQ(doc.unit(), Unit::Mil);  // the P-CAD design is in mils
  // Routing view: copper and component outlines on, masks off.
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    if (b.layers[l].kind == LayerKind::Copper) EXPECT_TRUE(doc.layerVisible(l)) << b.layers[l].name;
    if (b.layers[l].kind == LayerKind::Mask) EXPECT_FALSE(doc.layerVisible(l)) << b.layers[l].name;
  }
  auto all = allColorSchemes();
  applyColorScheme(d, b, colorSchemeByName(all, "P-CAD 2006"));
  EXPECT_EQ(d.color("background", 1), 0x000000u);
  EXPECT_EQ(d.layer(b.layers[top].name)->details, 0xff0000u);
  // «Только активный слой» hides the other metal layers.
  d.show["showActiveLayerOnly"] = true;
  EXPECT_TRUE(doc.layerVisible(top));
  EXPECT_FALSE(doc.layerVisible(bottom));
}

// The selection filter decides what a click may select.
TEST(Gui, SelectionFilter) {
  app();
  Document doc;
  BoardView view(&doc);
  view.resize(800, 600);
  auto r = io::loadBoard(data("tt.kicad_pcb"));
  ASSERT_TRUE(r) << r.error();
  doc.setBoard(std::move(*r), "tt.kicad_pcb");
  const Board& b = *doc.board();
  ASSERT_FALSE(b.vias.empty());
  Vec2 at = b.vias[0].pos.v();
  view.centerOn(at, 5);
  double scale = view.width() / (5.0 * kNmPerMm);
  QPoint p = screenOf(view, at, at, scale);
  doc.setSelectionFilter(SelAll & ~SelVias);
  QTest::mouseClick(&view, Qt::LeftButton, {}, p);
  for (ItemRef it : doc.selectedItems()) EXPECT_NE(it.type, ItemType::Via);
  doc.setSelectionFilter(SelAll);
  QTest::mouseClick(&view, Qt::LeftButton, {}, p);
  ASSERT_EQ(doc.selectedItems().size(), 1u);
  EXPECT_EQ(doc.selectedItems()[0].type, ItemType::Via);
}

namespace {

struct Fixture {
  App& a = app();  // before any widget
  Document doc;
  BoardView view{&doc};
  explicit Fixture(const char* file) {
    view.resize(800, 600);
    auto r = io::loadBoard(data(file));
    EXPECT_TRUE(r) << r.error();
    doc.setBoard(std::move(*r), file);
  }
  const Board& b() { return *doc.board(); }
  // Shows a window of `widthMm` around `c`; returns the screen point of world `w`.
  Vec2 c;
  double scale = 0;
  void look(Vec2 center, double widthMm) {
    c = center;
    view.centerOn(center, widthMm);
    scale = view.width() / (widthMm * kNmPerMm);
  }
  QPoint at(Vec2 w) { return screenOf(view, w, c, scale); }
  void drag(QPoint from, QPoint to) {
    QTest::mousePress(&view, Qt::LeftButton, {}, from);
    moveTo(view, to, Qt::LeftButton);
    QTest::mouseRelease(&view, Qt::LeftButton, {}, to);
  }
};

}  // namespace

// A frame left to right selects objects entirely inside it, right to left also those it crosses.
TEST(Gui, FrameSelection) {
  Fixture f("tt.kicad_pcb");
  BBox bb = f.b().bbox();
  f.look(bb.center(), bb.width() / kNmPerMm * 1.5);
  // A frame over the left half of the board, starting well off it.
  QPoint a = f.at({bb.minX - 5e6, bb.minY - 5e6}), z = f.at({bb.center().x, bb.maxY + 5e6});
  f.drag(a, z);
  size_t window = f.doc.selectedItems().size() + f.doc.selectedComponents().size();
  f.drag(z, a);
  size_t crossing = f.doc.selectedItems().size() + f.doc.selectedComponents().size();
  EXPECT_GT(window, 0u);
  EXPECT_GT(crossing, window);
  // Everything in the window frame lies inside it.
  f.drag(a, z);
  for (ItemRef r : f.doc.selectedItems()) {
    BBox ib = itemBBox(f.b(), r);
    EXPECT_LE(ib.maxX, bb.center().x + 1);
  }
}

// X: a segment, then its whole wire, then the whole net, then the segment again.
TEST(Gui, CyclicSelection) {
  Fixture f("tt.kicad_pcb");
  const Board& b = f.b();
  // A seed whose end joins exactly one other track of its net and layer, at no via or pad: the
  // wire (the chain up to a pad, a via or a junction) then has at least two tracks.
  int seed = -1;
  for (int i = 0; i < int(b.tracks.size()) && seed < 0; ++i) {
    const Track& ti = b.tracks[i];
    int joined = 0;
    for (int j = 0; j < int(b.tracks.size()); ++j)
      if (i != j && b.tracks[j].net == ti.net && b.tracks[j].layer == ti.layer &&
          (ti.b == b.tracks[j].a || ti.b == b.tracks[j].b))
        ++joined;
    if (joined != 1) continue;
    bool free = true;
    for (auto& v : b.vias) free &= v.net != ti.net || (v.pos.v() - ti.b.v()).len() > v.diameter / 2.0;
    for (auto& pad : b.pads) free &= pad.net != ti.net || !pad.shapeGeom().contains(ti.b.v());
    if (free) seed = i;
  }
  ASSERT_GE(seed, 0);
  f.doc.setSelection({{ItemType::Track, seed}}, {});
  f.view.cycleSelection();
  size_t wire = f.doc.selectedItems().size();
  EXPECT_GT(wire, 1u);
  for (ItemRef r : f.doc.selectedItems()) EXPECT_EQ(itemNet(b, r), b.tracks[seed].net);
  f.view.cycleSelection();
  EXPECT_GE(f.doc.selectedItems().size(), wire);
  f.view.cycleSelection();
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  EXPECT_EQ(f.doc.selectedItems()[0].index, seed);
}

// Alt+← / Alt+→ walk through the views.
TEST(Gui, ViewHistory) {
  Fixture f("tt.kicad_pcb");
  QPoint mid(400, 300);
  // Two distinct views; going back restores the first, forward the second.
  f.view.centerOn({10 * kNmPerMm, 0}, 20);
  QTest::qWait(800);  // separate gestures
  f.view.centerOn({30 * kNmPerMm, 5 * kNmPerMm}, 10);
  QSignalSpy spy(&f.view, &BoardView::cursorMoved);
  auto centerNow = [&] {
    moveTo(f.view, mid);
    return spy.isEmpty() ? Vec2{} : spy.takeLast().at(0).value<Vec2>();
  };
  Vec2 last = centerNow();
  f.view.prevView();
  Vec2 back = centerNow();
  EXPECT_NEAR(back.x, 10 * kNmPerMm, 1e3);
  f.view.nextView();
  Vec2 fwd = centerNow();
  EXPECT_NEAR(fwd.x, last.x, 1e3);
  EXPECT_NEAR(fwd.y, last.y, 1e3);
}

// A right click selects the object under the cursor and asks for the context menu.
TEST(Gui, RightClickSelectsAndAsksForMenu) {
  Fixture f("tt.kicad_pcb");
  Vec2 v = f.b().vias[0].pos.v();
  f.look(v, 5);
  QSignalSpy spy(&f.view, &BoardView::contextMenuRequested);
  QTest::mouseClick(&f.view, Qt::RightButton, {}, f.at(v));
  EXPECT_EQ(spy.count(), 1);
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  EXPECT_EQ(f.doc.selectedItems()[0].type, ItemType::Via);
}

// Ctrl+M «Расстояние между двумя точками».
TEST(Gui, RulerMeasuresPoints) {
  Fixture f("tt.kicad_pcb");
  f.doc.setUnit(Unit::Mm);
  f.doc.display().alignToGrid = false;
  BBox bb = f.b().bbox();
  Vec2 p0{bb.maxX + 20 * kNmPerMm, bb.center().y};  // off the board: nothing to snap to
  f.look(p0, 40);
  QSignalSpy spy(&f.view, &BoardView::measured);
  f.view.startMeasure(MeasureKind::Points);
  EXPECT_EQ(f.view.mode(), Mode::Measure);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(p0));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(p0 + Vec2{3 * kNmPerMm, 4 * kNmPerMm}));
  ASSERT_GE(spy.count(), 2);
  QString text = spy.last().at(0).toString();
  EXPECT_TRUE(text.contains("Расстояние: 5")) << text.toStdString();
  f.view.cancelTool();
  EXPECT_EQ(f.view.mode(), Mode::Select);
}

// A conductor of a zipped pair (Signals.fst, the pair SDCLK_U2 on Int 1): X takes the whole section, both
// conductors; «Свойства» shows the section (TopoR's «Свойства застёгнутой пары проводников»), its button swaps
// the nets as one undoable step; «Расстегнуть» takes the section away, the conductors stay, undo brings it back.
TEST(Gui, ZippedPairSelectionAndProperties) {
  Fixture f("topor/Example_06/Signals.fst");
  PropertiesPanel props(&f.doc);
  const Board& b = f.b();
  ASSERT_EQ(b.zips.size(), 1u);
  int seed = -1, conductors = 0;
  for (int i = 0; i < int(b.tracks.size()); ++i)
    if (b.tracks[i].zip == 0) {
      ++conductors;
      if (seed < 0) seed = i;
    }
  ASSERT_GE(seed, 0);
  f.doc.setSelection({{ItemType::Track, seed}}, {});
  f.view.cycleSelection();
  EXPECT_EQ(int(f.doc.selectedItems().size()), conductors) << "the whole section";
  bool titled = false;
  for (QLabel* l : props.findChildren<QLabel*>()) titled |= l->text().contains("Застёгнутая пара");
  EXPECT_TRUE(titled);
  QPushButton* swap = nullptr;
  for (QPushButton* p : props.findChildren<QPushButton*>())
    if (p->text().contains("Поменять цепи")) swap = p;
  ASSERT_TRUE(swap);
  const int pSide = b.zips[0].pSide;
  const int netOfSeed = b.tracks[seed].net;
  swap->click();
  EXPECT_EQ(f.b().zips[0].pSide, -pSide);
  EXPECT_NE(f.b().tracks[seed].net, netOfSeed);
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().tracks[seed].net, netOfSeed);
  f.doc.setSelection({{ItemType::Track, seed}}, {});
  f.view.unzipSelection();
  EXPECT_TRUE(f.b().zips.empty());
  int left = 0;
  for (const Track& t : f.b().tracks) left += t.net == netOfSeed;
  EXPECT_GT(left, 0);
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().zips.size(), 1u);
}

namespace {

// The pair P/N (0.3 wide, 0.2 apart) between U1's pads (4,11)/(4,9) and U2's (36,11)/(36,9) on one layer,
// laid by clicks with «Ручная прокладка дифф. пары»: the clasp at (8,10), the axis by (20,12) to (32,10).
void layPairByClicks(Fixture& f) {
  auto board = std::make_unique<Board>();
  Board& b = *board;
  const LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  b.netClasses[0].clearance = mmToNm(0.2);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
  for (const char* ref : {"U1", "U2"}) {
    Component c;
    c.ref = ref;
    b.components.push_back(c);
  }
  auto pad = [&](const char* net, int comp, double x, double y) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = comp;
    p.net = b.addNet(net);
    p.pos = Point(at(x, y));
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = LayerMask(1) << top;
    b.components[size_t(comp)].pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
  };
  pad("P", 0, 4, 11);
  pad("N", 0, 4, 9);
  pad("P", 1, 36, 11);
  pad("N", 1, 36, 9);
  Impedance z;
  z.name = "ZD";
  z.diff = true;
  z.rules.push_back({"Top", mmToNm(0.3), mmToNm(0.2)});
  b.hispeed.impedances.push_back(z);
  for (const char* n : {"P", "N"}) {
    SignalCluster c;
    c.impedance = "ZD";
    c.nets = {n};
    Signal sg;
    sg.name = std::string(n) + "_sig";
    c.signalList.push_back(sg);
    b.hispeed.clusters.push_back(c);
  }
  b.hispeed.diffSignals.push_back({"PN", mmToNm(0.1), "ZD", "P_sig", "N_sig"});
  b.rules = rulesFromBoard(b);
  compileRules(b);
  f.doc.setBoard(std::move(board), "pair");
  f.look(at(20, 10), 44);
  f.view.setRoutePair(true);
  f.view.setMode(Mode::Route);
  auto click = [&](Vec2 w) { QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(w)); };
  click(at(4, 11));  // P of U1: N of U1 is its partner
  ASSERT_TRUE(f.view.isRouting());
  click(at(8, 10));   // the clasp
  click(at(20, 12));  // the pair
  click(at(32, 10));
  click(at(36, 11));  // P of U2: the end
  EXPECT_FALSE(f.view.isRouting());
  f.view.setRoutePair(false);
  f.view.setMode(Mode::Select);
}

}  // namespace

// «Ручная прокладка дифф. пары»: a click on a pad of a pair's net starts from it and its partner on the same
// component, the second click places the clasp, the pair is laid by clicks as one wire, a click on a pad of the
// pair at the far end ends it at a clasp with the conductors to that pad and its partner. One section, its
// conductors 0.3 wide and 0.5 apart, every connection made, no violation.
TEST(Gui, RoutePairByClicks) {
  Fixture f("tt.kicad_pcb");
  layPairByClicks(f);
  const Board& nb = f.b();
  ASSERT_EQ(nb.zips.size(), 1u);
  EXPECT_EQ(nb.zips[0].axis.size(), 2u) << "(8,10) -> (20,12) -> (32,10)";
  int conductors[2] = {0, 0};
  for (const Track& t : nb.tracks)
    if (t.zip == 0) ++conductors[t.net == nb.findNet("P")];
  EXPECT_GE(conductors[0], 2);
  EXPECT_GE(conductors[1], 2);
  DrcOptions d;
  d.widths = false;
  EXPECT_EQ(Connectivity::compute(nb).ratsnest.size(), 0u) << "as laid";
  for (const DrcViolation& v : runDrc(nb, d))
    if (v.type != DrcViolation::Type::Unconnected) ADD_FAILURE() << "as laid: " << v.message;
  // F5 on the model takes the pair as it was laid: one wire, the same section, clean.
  f.view.recomputeShapes();
  EXPECT_EQ(f.b().zips.size(), 1u);
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), 0u) << "after F5";
  for (const DrcViolation& v : runDrc(f.b(), d))
    if (v.type != DrcViolation::Type::Unconnected) ADD_FAILURE() << "after F5: " << v.message;
}

// The pair edited as a pair, by its axis (TopoR: the thin line between the conductors with its handles): a
// click on a conductor takes the whole section, its handles are the axis's; the joint of the axis dragged goes
// where it is put and the conductors are made from the axis again, at the offset either side, the connections
// kept; dragged by a conductor, the piece of the axis there moves across itself; undo brings the axis back;
// the width of the conductors is not changed by hand (the rule of the impedance gives it); Del takes the section
// with its conductors.
TEST(Gui, ZippedPairEditedByItsAxis) {
  Fixture f("tt.kicad_pcb");
  layPairByClicks(f);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  ASSERT_EQ(f.b().zips.size(), 1u);
  ASSERT_EQ(f.b().zips[0].axis.size(), 2u);
  auto section = [&] {
    int n = 0;
    for (const Track& t : f.b().tracks) n += t.zip == 0;
    return n;
  };
  // Each conductor piece's middle at the offset from the nearest piece of the axis.
  auto offsetMiss = [&] {
    const ZippedWire& z = f.b().zips[0];
    double worst = 0;
    for (const Track& t : f.b().tracks) {
      if (t.zip != 0) continue;
      const Vec2 m = t.mid ? t.mid->v() : (t.a.v() + t.b.v()) * 0.5;
      double d = 1e300;
      for (const Track& a : z.axis) d = std::min(d, distPointSegment(m, a.a.v(), a.b.v()));
      worst = std::max(worst, std::abs(d - double(z.offset())));
    }
    return worst;
  };
  // A click on the positive conductor halfway along the first piece.
  const Vec2 a0 = f.b().zips[0].axis[0].a.v(), a1 = f.b().zips[0].axis[0].b.v();
  const Vec2 n = (a1 - a0).perp().normalized() * double(f.b().zips[0].offset());
  const Vec2 onP = (a0 + a1) * 0.5 + n * double(f.b().zips[0].pSide);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(onP));
  EXPECT_EQ(int(f.doc.selectedItems().size()), section()) << "the whole section";
  // The joint of the axis dragged from (20,12) to (20,13.5).
  f.drag(f.at(at(20, 12)), f.at(at(20, 13.5)));
  ASSERT_EQ(f.b().zips.size(), 1u);
  ASSERT_EQ(f.b().zips[0].axis.size(), 2u);
  EXPECT_LT((f.b().zips[0].axis[0].b.v() - at(20, 13.5)).len(), mmToNm(0.1));
  EXPECT_EQ(f.b().zips[0].axis[0].b, f.b().zips[0].axis[1].a);
  EXPECT_LT(offsetMiss(), 2000);
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), 0u);
  EXPECT_EQ(int(f.doc.selectedItems().size()), section()) << "still the section";
  // By a conductor of the second piece: that piece of the axis moves across itself, down by 0.5.
  {
    const Vec2 b0 = f.b().zips[0].axis[1].a.v(), b1 = f.b().zips[0].axis[1].b.v();
    const Vec2 m = (b0 + b1) * 0.5 - (b1 - b0).perp().normalized() * double(f.b().zips[0].offset() * f.b().zips[0].pSide);
    const double before = distPointSegment(at(26, 10), b0, b1);
    f.drag(f.at(m), f.at(m + at(0, -0.5)));
    const Track& p1 = f.b().zips[0].axis[1];
    EXPECT_GT(std::abs(distPointSegment(at(26, 10), p1.a.v(), p1.b.v()) - before), mmToNm(0.2)) << "moved";
    EXPECT_LT(offsetMiss(), 2000);
    EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), 0u);
  }
  // F5 at once, the section still selected: drawn by the model (the first press only took the selection off).
  {
    QSignalSpy said(&f.view, &BoardView::status);
    ASSERT_FALSE(f.doc.selectedItems().empty());
    f.view.recomputeShapes();
    ASSERT_FALSE(said.isEmpty());
    EXPECT_TRUE(said.last().at(0).toString().contains("по модели")) << said.last().at(0).toString().toStdString();
    EXPECT_EQ(f.b().zips.size(), 1u);
    EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), 0u);
    for (const Track& t : f.b().tracks) EXPECT_FALSE(t.edited);
    f.doc.undoStack()->undo();
  }
  f.doc.undoStack()->undo();
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().zips[0].axis[0].b.v(), a1) << "undone";
  EXPECT_LT(offsetMiss(), 2000);
  // The width is the rule's.
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(onP));
  ASSERT_FALSE(f.doc.selectedItems().empty());
  const Coord w = f.b().tracks[f.doc.selectedItems()[0].index].width;
  f.view.changeTrackWidth();
  EXPECT_EQ(f.b().tracks[f.doc.selectedItems()[0].index].width, w);
  // Del: the section and its conductors go.
  f.view.deleteSelection();
  EXPECT_TRUE(f.b().zips.empty());
  for (const Track& t : f.b().tracks) EXPECT_EQ(t.zip, -1);
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().zips.size(), 1u);
}

// The axis of a zipped section is drawn without a selection (between the conductors, unlike the background), and a
// wire of a net under the flexible fixation has a dashed centre line (pixels of the background's colour along
// it); each goes with its display flag.
TEST(Gui, ZipAxisAndFlexFixDrawn) {
  Fixture f("tt.kicad_pcb");
  layPairByClicks(f);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  Board& b = *f.doc.board();
  ASSERT_EQ(b.zips.size(), 1u);
  Track t;
  t.a = Point(at(10, 4));
  t.b = Point(at(30, 4));
  t.width = mmToNm(0.5);
  t.layer = b.topCopper();
  t.net = b.addNet("F");
  b.tracks.push_back(t);
  b.nets[size_t(t.net)].flexFixed = true;
  f.doc.invalidate();
  f.doc.clearSelection();
  f.view.show();
  const QColor bg = f.doc.color("background", 0x030b10);
  auto isBg = [&](QColor c) { return std::abs(c.red() - bg.red()) + std::abs(c.green() - bg.green()) + std::abs(c.blue() - bg.blue()) < 40; };
  auto grab = [&] {
    f.view.refresh();
    QTest::qWait(10);
    return f.view.grab().toImage();
  };
  // The axis halfway along the first piece, 0.2 mm between the conductors: 16 px at 10 mm across the view.
  const Vec2 a0 = b.zips[0].axis[0].a.v(), a1 = b.zips[0].axis[0].b.v();
  f.look((a0 + a1) * 0.5, 10);
  const QPoint onAxis = f.at((a0 + a1) * 0.5);
  EXPECT_FALSE(isBg(grab().pixelColor(onAxis))) << "the axis drawn";
  if (const char* dir = std::getenv("XR_SHOT_DIR")) grab().save(QString(dir) + "/zipaxis.png");
  f.doc.display().show["showZipAxis"] = false;
  EXPECT_TRUE(isBg(grab().pixelColor(onAxis))) << "the axis off";
  // The flexibly fixed wire: along its centre line some pixels are the background's (the dashes' gaps are not).
  f.look(at(20, 4), 10);
  auto gaps = [&] {
    QImage img = grab();
    int n = 0;
    for (int dx = -40; dx <= 40; ++dx) n += isBg(img.pixelColor(f.at(at(20, 4)) + QPoint(dx, 0)));
    return n;
  };
  if (const char* dir = std::getenv("XR_SHOT_DIR")) grab().save(QString(dir) + "/flexfix.png");
  EXPECT_GT(gaps(), 10) << "dashed";
  f.doc.display().show["showFlexFix"] = false;
  EXPECT_EQ(gaps(), 0) << "solid";
}

// The same with a change of layer (V): the section ends at a clasp, two vias abreast of it as far apart as the
// vias and the gap need, the next section starts there on the other layer. Two sections, two vias, every
// connection made, no violation.
TEST(Gui, RoutePairChangesLayer) {
  Fixture f("tt.kicad_pcb");
  auto board = std::make_unique<Board>();
  Board& b = *board;
  const LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  const LayerId bottom = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  b.layers[top].copperIndex = 0;
  b.layers[bottom].copperIndex = 1;
  b.netClasses[0].clearance = mmToNm(0.2);
  b.netClasses[0].viaDiameter = mmToNm(0.6);
  b.netClasses[0].viaDrill = mmToNm(0.3);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
  for (const char* ref : {"U1", "U2"}) {
    Component c;
    c.ref = ref;
    b.components.push_back(c);
  }
  auto pad = [&](const char* net, int comp, double x, double y) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = comp;
    p.net = b.addNet(net);
    p.pos = Point(at(x, y));
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1);
    p.drill = mmToNm(0.5);
    p.copper = (LayerMask(1) << top) | (LayerMask(1) << bottom);
    b.components[size_t(comp)].pads.push_back(int(b.pads.size()));
    b.pads.push_back(p);
  };
  pad("P", 0, 4, 11);
  pad("N", 0, 4, 9);
  pad("P", 1, 36, 11);
  pad("N", 1, 36, 9);
  Impedance z;
  z.name = "ZD";
  z.diff = true;
  z.rules.push_back({"Top", mmToNm(0.3), mmToNm(0.2)});
  z.rules.push_back({"Bottom", mmToNm(0.3), mmToNm(0.2)});
  b.hispeed.impedances.push_back(z);
  for (const char* n : {"P", "N"}) {
    SignalCluster c;
    c.impedance = "ZD";
    c.nets = {n};
    Signal sg;
    sg.name = std::string(n) + "_sig";
    c.signalList.push_back(sg);
    b.hispeed.clusters.push_back(c);
  }
  b.hispeed.diffSignals.push_back({"PN", mmToNm(0.1), "ZD", "P_sig", "N_sig"});
  b.rules = rulesFromBoard(b);
  compileRules(b);
  f.doc.setBoard(std::move(board), "pair2");
  f.doc.setActiveLayer(top);
  f.look(at(20, 10), 44);
  f.view.setRoutePair(true);
  f.view.setMode(Mode::Route);
  auto click = [&](Vec2 w) { QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(w)); };
  click(at(4, 11));
  click(at(8, 10));   // the clasp
  click(at(20, 10));
  f.view.routeAddVia();
  click(at(32, 10));
  click(at(36, 11));
  EXPECT_FALSE(f.view.isRouting());
  const Board& nb = f.b();
  ASSERT_EQ(nb.zips.size(), 2u);
  EXPECT_NE(nb.zips[0].layer, nb.zips[1].layer);
  EXPECT_EQ(nb.vias.size(), 2u);
  EXPECT_EQ(Connectivity::compute(nb).ratsnest.size(), 0u);
  DrcOptions d;
  d.widths = false;
  for (const DrcViolation& v : runDrc(nb, d))
    if (v.type != DrcViolation::Type::Unconnected) ADD_FAILURE() << v.message;
}

// «Свойства»: the width of the selected wires is edited in place, as one undoable step.
TEST(Gui, PropertiesEditWireWidth) {
  Fixture f("tt.kicad_pcb");
  PropertiesPanel props(&f.doc);
  f.doc.setUnit(Unit::Mm);
  f.doc.setSelection({{ItemType::Track, 0}, {ItemType::Track, 1}}, {});
  auto spins = props.findChildren<QDoubleSpinBox*>();
  ASSERT_EQ(spins.size(), 1);  // the width
  Coord w0 = f.b().tracks[0].width;
  spins[0]->setValue(0.5);
  emit spins[0]->editingFinished();
  EXPECT_EQ(f.b().tracks[0].width, mmToNm(0.5));
  EXPECT_EQ(f.b().tracks[1].width, mmToNm(0.5));
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().tracks[0].width, w0);
}

// «Форма (Многоугольник)» of the board outline in «Свойства»: the vertices in the unit, y up, the arcs' angles; a
// value edited moves the vertex and the outline with it, an angle makes the side an arc, «Добавить» / «Удалить» a
// vertex; each an undoable step. A circle's page has its centre and radius.
TEST(Gui, ShapeEditor) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  PropertiesPanel props(&f.doc);
  f.doc.setUnit(Unit::Mm);
  int poly = -1;
  for (int i = 0; i < int(f.b().graphics.size()); ++i)
    if (f.b().isEdge(f.b().graphics[i].layer) && f.b().graphics[i].kind == GraphicKind::Poly) poly = i;
  ASSERT_GE(poly, 0);
  f.doc.setSelection({{ItemType::Detail, poly}}, {});
  auto* tabs = props.findChild<QTabWidget*>();
  ASSERT_TRUE(tabs);
  EXPECT_EQ(tabs->tabText(1), "Форма (Многоугольник)");
  auto table = [&] { return props.findChild<QTableWidget*>("shape"); };
  ASSERT_TRUE(table());
  const auto pts = f.b().graphics[poly].pts;
  ASSERT_EQ(table()->rowCount(), int(pts.size()));
  EXPECT_NEAR(table()->item(0, 1)->text().toDouble(), pts[0].x / kNmPerMm, 1e-3);
  EXPECT_NEAR(table()->item(0, 2)->text().toDouble(), -pts[0].y / kNmPerMm, 1e-3);
  tabs->setCurrentIndex(1);

  table()->item(0, 1)->setText(QString::number(pts[0].x / kNmPerMm + 1));
  EXPECT_NEAR(f.b().graphics[poly].pts[0].x, pts[0].x + kNmPerMm, 1);
  EXPECT_TRUE(r::any_of(f.b().outline[0], [&](Vec2 v) { return (v - f.b().graphics[poly].pts[0]).len() < 1000; }));
  EXPECT_EQ(props.findChild<QTabWidget*>()->currentIndex(), 1) << "the page stays on the shape";

  table()->item(1, 3)->setText("90");
  ASSERT_EQ(f.b().graphics[poly].arcOf(1), 90);
  EXPECT_GT(f.b().outline[0].size(), pts.size() + 4) << "the arc in chords";
  Vec2 a = f.b().graphics[poly].pts[1], c = f.b().graphics[poly].pts[2];
  Vec2 mid = arcMiddle(a, c, 90);
  EXPECT_NEAR(std::abs(orient(a, c, mid)) / (c - a).len(), (c - a).len() / 2 * std::tan(kPi / 8), 1000);

  if (const char* dir = std::getenv("XR_SHOT_DIR")) {
    props.resize(520, 300);
    props.grab().save(QString(dir) + "/shape.png");
  }
  table()->selectRow(1);
  props.findChild<QPushButton*>("addVertex")->click();
  QCoreApplication::processEvents();
  ASSERT_EQ(f.b().graphics[poly].pts.size(), pts.size() + 1);
  ASSERT_EQ(table()->rowCount(), int(pts.size()) + 1);
  EXPECT_NEAR((f.b().graphics[poly].pts[2] - mid).len(), 0, 1000) << "on the arc's middle";
  EXPECT_EQ(f.b().graphics[poly].arcOf(1), 45);
  EXPECT_EQ(f.b().graphics[poly].arcOf(2), 45);
  table()->selectRow(2);
  props.findChild<QPushButton*>("deleteVertex")->click();
  QCoreApplication::processEvents();
  EXPECT_EQ(f.b().graphics[poly].pts.size(), pts.size());
  for (int i = 0; i < 4; ++i) f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().graphics[poly].pts, pts);
  EXPECT_FALSE(f.b().graphics[poly].hasArcs());

  // A copper area drawn as a circle stays one: its centre and radius.
  {
    auto snap = f.doc.beginEdit();
    Zone z;
    z.layer = f.b().topCopper();
    Graphic g;
    g.kind = GraphicKind::Circle;
    g.a = pts[0] + Vec2{5 * kNmPerMm, 5 * kNmPerMm};
    g.b = g.a + Vec2{2 * kNmPerMm, 0};
    z.setShape(g);
    f.doc.board()->zones.push_back(z);
    f.doc.commitEdit(snap, "zone");
  }
  int zi = int(f.b().zones.size()) - 1;
  f.doc.setSelection({{ItemType::Zone, zi}}, {});
  tabs = props.findChild<QTabWidget*>();
  EXPECT_EQ(tabs->tabText(tabs->count() - 1), "Форма (Круг)");
  ASSERT_EQ(table()->rowCount(), 2);
  table()->item(1, 1)->setText("3");
  EXPECT_NEAR(f.b().zones[zi].outline.front().x - f.b().zones[zi].shape->a.x, 3 * kNmPerMm, 1000);
  EXPECT_EQ(f.b().zones[zi].shape->kind, GraphicKind::Circle);

  // A drawn arc: its centre (edited, the arc moves whole) and its radius (edited, the ends stay).
  {
    LayerId mech = -1;
    for (LayerId l = 0; l < LayerId(f.b().layers.size()) && mech < 0; ++l)
      if (f.b().layers[size_t(l)].kind != LayerKind::Copper && !f.b().isEdge(l)) mech = l;
    ASSERT_GE(mech, 0);
    auto snap = f.doc.beginEdit();
    Graphic g;
    g.kind = GraphicKind::Arc;
    g.layer = mech;
    g.a = pts[0] + Vec2{2 * kNmPerMm, 2 * kNmPerMm};
    g.b = g.a + Vec2{8 * kNmPerMm, 0};
    g.m = arcMiddle(g.a, g.b, 90);
    f.doc.board()->graphics.push_back(g);
    f.doc.commitEdit(snap, "arc");
  }
  const int gi = int(f.b().graphics.size()) - 1;
  f.doc.setSelection({{ItemType::Detail, gi}}, {});
  ASSERT_TRUE(table());
  ASSERT_EQ(table()->rowCount(), 5) << "start, end, angle, centre, radius";
  EXPECT_EQ(table()->item(3, 0)->text(), "Центр");
  const Graphic arc0 = f.b().graphics[size_t(gi)];
  const double r0 = ArcGeom::fromThreePoints(arc0.a, arc0.m, arc0.b).radius;
  EXPECT_NEAR(table()->item(4, 1)->text().toDouble(), r0 / kNmPerMm, 1e-3);
  table()->item(4, 1)->setText("10");
  const Graphic& arc1 = f.b().graphics[size_t(gi)];
  EXPECT_NEAR(ArcGeom::fromThreePoints(arc1.a, arc1.m, arc1.b).radius, 10 * kNmPerMm, 1000);
  EXPECT_EQ(arc1.a, arc0.a);
  EXPECT_EQ(arc1.b, arc0.b);
  const double cx = table()->item(3, 1)->text().toDouble();
  table()->item(3, 1)->setText(QString::number(cx + 1));
  EXPECT_NEAR(f.b().graphics[size_t(gi)].a.x, arc0.a.x + kNmPerMm, 1000) << "moved whole";
}

// «Окно сообщений»: unrouted nets and DRC results are listed by kind.
TEST(Gui, MessagesWindow) {
  Fixture f("tt.kicad_pcb");
  MessagesPanel messages(&f.doc, &f.view);
  auto* tree = messages.findChild<QTreeWidget*>();
  ASSERT_TRUE(tree);
  auto texts = [&] {
    QStringList t;
    for (int i = 0; i < tree->topLevelItemCount(); ++i) t << tree->topLevelItem(i)->text(0);
    return t.join("\n");
  };
  EXPECT_FALSE(texts().contains("Не разведена"));
  auto before = f.doc.beginEdit();
  f.doc.board()->clearRouting(false);
  f.doc.commitEdit(before, "clear");
  EXPECT_TRUE(texts().contains("Не разведена цепь")) << texts().toStdString();
  f.doc.setDrc({});
  EXPECT_TRUE(texts().contains("DRC: нарушений нет"));
}

// «Поиск»: the filter narrows each kind of object.
TEST(Gui, SearchPanel) {
  Fixture f("tt.kicad_pcb");
  SearchPanel search(&f.doc, &f.view);
  auto* tree = search.findChild<QTreeWidget*>();
  auto* edit = search.findChild<QLineEdit*>();
  ASSERT_TRUE(tree && edit);
  const Component& c = f.b().components[0];
  edit->setText(QString::fromStdString(c.ref));
  QTreeWidgetItem* comps = tree->topLevelItem(0);
  ASSERT_GE(comps->childCount(), 1);
  EXPECT_LT(comps->childCount(), int(f.b().components.size()));
  emit tree->itemClicked(comps->child(0), 0);
  ASSERT_EQ(f.doc.selectedComponents().size(), 1u);
}

// A TopoR project opens with its document (the .fst saved next to TopoR's .fsx), which is marked open
// in the project; other documents of the project open within it.
TEST(Gui, TopoRProject) {
  app();
  QTemporaryDir dir;
  QString src = QString::fromStdString(data("topor/Example_05"));
  for (const char* f : {"Example_05.fsproj", "MinVia.fst", "MinVia_standard_routing.fst", "MinVia_master.PCB"})
    ASSERT_TRUE(QFile::copy(src + "/" + f, dir.filePath(f))) << f;
  MainWindow w;
  ASSERT_TRUE(w.openFile(dir.filePath("Example_05.fsproj")));
  ASSERT_TRUE(w.project());
  ASSERT_TRUE(w.document()->hasBoard());
  QString opened = w.document()->path();
  EXPECT_TRUE(opened.endsWith(".fst")) << opened.toStdString();
  // The project file now marks that document open.
  auto p = Project::load(dir.filePath("Example_05.fsproj"), nullptr);
  ASSERT_TRUE(p);
  EXPECT_EQ(p->openedDocument(), opened);
  // Another document of the project keeps the project.
  ASSERT_TRUE(w.openFile(dir.filePath("MinVia_master.PCB")));
  ASSERT_TRUE(w.project());
  EXPECT_EQ(w.project()->path(), QFileInfo(dir.filePath("Example_05.fsproj")).absoluteFilePath());
  p = Project::load(dir.filePath("Example_05.fsproj"), nullptr);
  // Reopening the project returns to the design viewed last.
  EXPECT_EQ(p->openedDocument(), w.document()->path());
}

// «Редактор параметров дизайна»: a rule edited and applied changes the design's classes; as in TopoR
// the undo history is cleared and the design is marked modified.
TEST(Gui, DesignParametersEditor) {
  Fixture f("topor/Example_02/Placement.fst");
  f.doc.setUnit(Unit::Mm);
  auto before = f.doc.beginEdit();
  f.doc.commitEdit(before, "something to undo");
  DesignParamsDialog dlg(&f.doc);
  dlg.resize(1100, 640);
  dlg.showPage("Ширина проводников");
  auto* table = dlg.findChild<QTableWidget*>();
  ASSERT_TRUE(table);
  ASSERT_GE(table->rowCount(), 3);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/dpe.png");
  // Row 0: all nets, 0.4 mm.
  auto* nom = qobject_cast<QDoubleSpinBox*>(table->cellWidget(0, 5));
  ASSERT_TRUE(nom);
  EXPECT_NEAR(nom->value(), 0.4, 1e-9);
  nom->setValue(0.3);
  QPushButton* apply = nullptr;
  for (auto* b : dlg.findChildren<QPushButton*>())
    if (b->text() == "Применить") apply = b;
  ASSERT_TRUE(apply && apply->isEnabled());
  apply->click();
  const Board& b = f.b();
  EXPECT_EQ(b.netClasses[0].trackWidth, mmToNm(0.3));
  EXPECT_EQ(b.trackWidth(b.findNet("+5V"), b.topCopper()), mmToNm(1.5));  // group rules still win
  EXPECT_EQ(f.doc.undoStack()->count(), 0);
  EXPECT_FALSE(f.doc.undoStack()->isClean());
}

// «Автотрассировка»: variants are searched until stopped; one opens in the editor as an undoable step.
TEST(Gui, AutorouteVariants) {
  Fixture f("astable.kicad_pcb");
  auto before = f.doc.beginEdit();
  f.doc.board()->clearRouting(false);
  f.doc.commitEdit(before, "clear");
  ASSERT_FALSE(f.doc.connectivity().ratsnest.empty());
  AutorouteWindow w(&f.doc);
  QSignalSpy found(&w, &AutorouteWindow::variantFound);
  QSignalSpy done(&w, &AutorouteWindow::finished);
  w.start();
  EXPECT_TRUE(w.running());
  while (found.count() < 2) ASSERT_TRUE(found.wait(60000));
  w.stop();
  if (done.isEmpty()) ASSERT_TRUE(done.wait(60000));
  EXPECT_FALSE(w.running());
  ASSERT_GE(w.variants().size(), 2u);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) w.grab().save(QString(dir) + "/autoroute.png");
  const RoutingVariant& v = w.variants()[0];
  EXPECT_EQ(v.unrouted, 0);
  EXPECT_GT(v.tracks.size(), 0u);
  w.openInEditor(0);
  EXPECT_EQ(f.b().tracks.size(), v.tracks.size());
  EXPECT_TRUE(f.doc.connectivity().ratsnest.empty());
  f.doc.undoStack()->undo();
  EXPECT_FALSE(f.doc.connectivity().ratsnest.empty());
}

// DRC with the dialog's settings: wire widths against the rules' minimum, checks switched off, report.
TEST(Gui, DrcSettingsAndReport) {
  Fixture f("tt.kicad_pcb");
  f.doc.setUnit(Unit::Mm);
  f.doc.board()->tracks[0].width = mmToNm(0.05);
  f.doc.invalidate();
  QTemporaryDir dir;
  QSettings s;
  s.setValue("drc/widths", true);
  s.setValue("drc/report", true);
  s.setValue("drc/reportPath", dir.filePath("drc.txt"));
  int n = DrcDialog::run(&f.doc);
  ASSERT_GE(n, 1);
  EXPECT_TRUE(r::contains(f.doc.drc(), DrcViolation::Type::Width, &DrcViolation::type));
  QFile report(dir.filePath("drc.txt"));
  ASSERT_TRUE(report.open(QIODevice::ReadOnly));
  EXPECT_TRUE(QString::fromUtf8(report.readAll()).contains("Ширина 0.05 <"));
  s.setValue("drc/widths", false);
  s.setValue("drc/report", false);
  DrcDialog::run(&f.doc);
  EXPECT_FALSE(r::contains(f.doc.drc(), DrcViolation::Type::Width, &DrcViolation::type));
  s.remove("drc");
}

// Windows accelerators of TopoR's configuration as Qt key sequences.
TEST(ToporSettings, WindowsKeys) {
  EXPECT_EQ(keyFromWindows(68, 19), QKeySequence(Qt::ALT | Qt::Key_D));
  EXPECT_EQ(keyFromWindows(107, 3), QKeySequence(Qt::KeypadModifier | Qt::Key_Plus));
  EXPECT_EQ(keyFromWindows(192, 3), QKeySequence(Qt::Key_QuoteLeft));
  EXPECT_EQ(keyFromWindows(32, 7), QKeySequence(Qt::SHIFT | Qt::Key_Space));
  EXPECT_EQ(keyFromWindows(118, 3), QKeySequence(Qt::Key_F7));
  EXPECT_TRUE(keyFromWindows(0, 3).isEmpty());
}

// TopoR's settings are read and taken over: hotkeys, panels, recent projects, start-up.
TEST(ToporSettings, ImportIntoMainWindow) {
  app();
  QString cfg = QString::fromStdString(data("topor/TopoR_test.cfg"));
  auto t = readToporConfig(cfg);
  ASSERT_TRUE(t);
  EXPECT_EQ(t->accelerators.value("Accel_DRC"), QList<QKeySequence>{QKeySequence(Qt::CTRL | Qt::Key_F9)});
  EXPECT_TRUE(t->accelerators.value("Accel_SelInvert").isEmpty());
  ASSERT_EQ(t->recentProjects.size(), 1u);
  EXPECT_EQ(t->recentProjects[0].path, "/tmp/xrtopor_test/a.fsproj");
  EXPECT_EQ(t->recentProjects[0].opened.date(), QDate(2025, 1, 2));
  ASSERT_TRUE(t->openLastProject);
  EXPECT_FALSE(*t->openLastProject);

  MainWindow w;
  ASSERT_TRUE(w.importToporSettings(cfg, false));
  EXPECT_EQ((*w.commands())["Accel_DRC"]->shortcut(), QKeySequence(Qt::CTRL | Qt::Key_F9));
  EXPECT_EQ(w.toolBarArea(w.findChild<QToolBar*>("ide_toolbar")), Qt::LeftToolBarArea);
  EXPECT_EQ(w.dockWidgetArea(w.findChild<QDockWidget*>("display_control")), Qt::RightDockWidgetArea);
  EXPECT_TRUE(w.findChild<QDockWidget*>("Search_View")->isHidden());
  EXPECT_FALSE(AppSettings::openLastProject());
  EXPECT_TRUE(AppSettings::toporImported());
  auto recent = AppSettings::recentFiles();
  EXPECT_TRUE(r::contains(recent, QString("/tmp/xrtopor_test/a.fsproj"), &RecentFile::path));
  QSettings().clear();
}

// Dragging a routed component: the wires ending on its pads go along, also when it is turned with
// Space during the drag; a wire's bend moves by its marker.
TEST(Gui, DragKeepsWiresConnected) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  const Board& b = f.b();
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  // A component with a wire ending on its first pad.
  int ci = -1, track = -1;
  for (int c = 0; c < int(b.components.size()) && ci < 0; ++c) {
    if (b.components[c].locked || b.components[c].pads.empty()) continue;
    const Pad& p = b.pads[b.components[c].pads[0]];
    for (int t = 0; t < int(b.tracks.size()); ++t)
      if (b.tracks[t].net == p.net && p.onLayer(b.tracks[t].layer) && p.shapeGeom().contains(b.tracks[t].a.v())) {
        ci = c;
        track = t;
        break;
      }
  }
  ASSERT_GE(ci, 0);
  Vec2 pad = b.pads[b.components[ci].pads[0]].pos.v();
  Vec2 far = b.tracks[track].b.v();
  f.look(pad, 30);
  QPoint from = f.at(pad), to = from + QPoint(int(2 * kNmPerMm * f.scale), int(1 * kNmPerMm * f.scale));
  QTest::mousePress(&f.view, Qt::LeftButton, {}, from);
  moveTo(f.view, from + QPoint(10, 0), Qt::LeftButton);
  f.view.rotateSelection(90);
  moveTo(f.view, to, Qt::LeftButton);
  QTest::mouseRelease(&f.view, Qt::LeftButton, {}, to);
  ASSERT_EQ(f.doc.selectedComponents(), std::vector<int>{ci});
  EXPECT_NE(f.b().pads[f.b().components[ci].pads[0]].pos.v(), pad);
  EXPECT_EQ(f.b().tracks[track].b.v(), far);  // the far end stays
  EXPECT_TRUE(f.b().pads[f.b().components[ci].pads[0]].shapeGeom().contains(f.b().tracks[track].a.v()));
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), unrouted);
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().pads[f.b().components[ci].pads[0]].pos.v(), pad);

  // A free bend of a wire: both segments meeting there follow its marker.
  int t0 = -1, t1 = -1;
  for (int i = 0; i < int(b.tracks.size()) && t0 < 0; ++i) {
    if (b.tracks[i].locked || edit::anchoredAt(b, b.tracks[i].b.v(), b.tracks[i].layer, b.tracks[i].net)) continue;
    auto ends = edit::endsAt(b, b.tracks[i].b.v(), b.tracks[i].layer, b.tracks[i].net);
    if (ends.size() == 2) {
      t0 = i;
      t1 = ends[0].first == i ? ends[1].first : ends[0].first;
    }
  }
  ASSERT_GE(t0, 0);
  Vec2 bend = b.tracks[t0].b.v();
  f.look(bend, 10);
  f.doc.setSelection({{ItemType::Track, t0}}, {});
  Vec2 target = bend + Vec2{0.5 * kNmPerMm, 0.5 * kNmPerMm};
  f.drag(f.at(bend), f.at(target));
  Vec2 moved = f.b().tracks[t0].b.v();
  EXPECT_NEAR((moved - target).len(), 0, 0.05 * kNmPerMm);
  const Track& n = f.b().tracks[t1];
  EXPECT_TRUE(n.a.v() == moved || n.b.v() == moved);
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), unrouted);
}

// The board outline is picked by its line, not inside it (its contour is never filled), and edited by handles as a
// wire is: a corner drags the ends of the outline's lines meeting there, a side's middle adds a vertex.
TEST(Gui, BoardOutlineByItsHandles) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  const Board& b = f.b();
  int poly = -1;
  for (int i = 0; i < int(b.graphics.size()); ++i)
    if (b.isEdge(b.graphics[i].layer) && b.graphics[i].kind == GraphicKind::Poly) poly = i;
  ASSERT_GE(poly, 0);  // TopoR's FilledContour beside the four lines
  EXPECT_TRUE(b.graphics[poly].filled);
  auto isOutline = [&](ItemRef r) { return r.type == ItemType::Detail && f.b().isEdge(f.b().graphics[r.index].layer); };
  BBox bb;
  for (Vec2 v : b.outline[0]) bb.add(v);
  Vec2 lo{bb.minX, bb.minY}, hi{bb.maxX, bb.maxY};
  Vec2 left{lo.x, (lo.y + hi.y) / 2};

  // Inside the board, 1 mm off its left side: not the outline.
  f.look(left, 20);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(left + Vec2{kNmPerMm, 0}));
  EXPECT_FALSE(r::any_of(f.doc.selectedItems(), isOutline));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(left));
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  EXPECT_TRUE(isOutline(f.doc.selectedItems()[0]));
  if (const char* dir = std::getenv("XR_SHOT_DIR")) {
    f.doc.setSelection({{ItemType::Detail, poly}}, {});
    f.view.fitBoard();
    f.view.grab().save(QString(dir) + "/outline.png");
  }

  // A corner of the contour: the polygon's vertex and the two lines' ends meeting there go to the new place.
  f.doc.setSelection({{ItemType::Detail, poly}}, {});
  auto pts = b.graphics[poly].pts;
  int k = int(r::find_if(pts, [&](Vec2 v) { return (v - lo).len() < 1000; }) - pts.begin());
  ASSERT_LT(k, int(pts.size()));
  f.look(lo, 20);
  Vec2 to = lo + Vec2{2 * kNmPerMm, 1 * kNmPerMm};
  f.drag(f.at(lo), f.at(to));
  Vec2 moved = f.b().graphics[poly].pts[k];
  EXPECT_NEAR((moved - to).len(), 0, 0.05 * kNmPerMm);
  int ends = 0;
  for (auto& g : f.b().graphics)
    if (g.kind == GraphicKind::Line && f.b().isEdge(g.layer)) {
      ends += g.a == moved;
      ends += g.b == moved;
      EXPECT_GT((g.a - lo).len(), 1000);
      EXPECT_GT((g.b - lo).len(), 1000);
    }
  EXPECT_EQ(ends, 2);
  EXPECT_TRUE(r::any_of(f.b().outline[0], [&](Vec2 v) { return (v - moved).len() < 1000; }));
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().graphics[poly].pts[k], lo);

  // The middle of a side: a new vertex there.
  f.doc.setSelection({{ItemType::Detail, poly}}, {});
  Vec2 a = pts[k], c = pts[(k + 1) % pts.size()];
  Vec2 mid = (a + c) * 0.5;
  f.look(mid, 20);
  Vec2 out = mid + (c - a).perp().normalized() * (2 * kNmPerMm);
  f.drag(f.at(mid), f.at(out));
  ASSERT_EQ(f.b().graphics[poly].pts.size(), pts.size() + 1);
  EXPECT_NEAR((f.b().graphics[poly].pts[k + 1] - out).len(), 0, 0.05 * kNmPerMm);
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().graphics[poly].pts.size(), pts.size());

  // One line of the contour moves across itself, the lines meeting its ends stretch.
  int line = -1;
  for (int i = 0; i < int(b.graphics.size()) && line < 0; ++i)
    if (b.isEdge(b.graphics[i].layer) && b.graphics[i].kind == GraphicKind::Line &&
        std::abs(b.graphics[i].a.x - lo.x) < 1000 && std::abs(b.graphics[i].b.x - lo.x) < 1000)
      line = i;
  ASSERT_GE(line, 0);
  f.look(left, 20);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(left));
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  f.doc.setSelection({{ItemType::Detail, line}}, {});
  Vec2 lmid = (b.graphics[line].a + b.graphics[line].b) * 0.5;
  // Off the middle marker: the line itself.
  Vec2 grab = lmid + Vec2{0, 3 * kNmPerMm};
  f.drag(f.at(grab), f.at(grab + Vec2{-1.5 * kNmPerMm, 2 * kNmPerMm}));
  const Graphic& g = f.b().graphics[line];
  EXPECT_NEAR(g.a.x, lo.x - 1.5 * kNmPerMm, 0.05 * kNmPerMm);
  EXPECT_NEAR(g.b.x, lo.x - 1.5 * kNmPerMm, 0.05 * kNmPerMm);
  EXPECT_NEAR(std::abs(g.b.y - g.a.y), hi.y - lo.y, 1000);  // across itself only
  int joined = 0;
  for (auto& h : f.b().graphics)
    if (&h != &g && f.b().isEdge(h.layer) && h.kind == GraphicKind::Line)
      joined += (h.a == g.a) + (h.b == g.a) + (h.a == g.b) + (h.b == g.b);
  EXPECT_EQ(joined, 2);
}

// With «Привязка к сетке» on, a handle dragged lands on the grid: a corner of the outline, a new vertex at a
// side's middle, a line of the outline moved across itself, the end of a wire; also with the 45-degree mode on
// (the 45-degree line from a neighbour on the grid crosses the grid at a grid point). The steps of 0.5 mm and
// of 0.001 mm (a projection on a 45-degree line left nanometres off it).
TEST(Gui, HandlesSnapToTheGrid) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  const Board& b = f.b();
  int poly = -1, line = -1;
  for (int i = 0; i < int(b.graphics.size()); ++i)
    if (b.isEdge(b.graphics[i].layer)) (b.graphics[i].kind == GraphicKind::Poly ? poly : line) = i;
  ASSERT_GE(poly, 0);
  ASSERT_GE(line, 0);
  struct Case { double step; bool angle; };
  for (Case cs : {Case{0.5 * kNmPerMm, false}, Case{0.001 * kNmPerMm, false}, Case{0.001 * kNmPerMm, true}}) {
    SCOPED_TRACE(std::to_string(cs.step) + (cs.angle ? " 45" : " free"));
    auto onGrid = [&](Vec2 v) {
      return std::abs(v.x / cs.step - std::round(v.x / cs.step)) < 1e-6 &&
             std::abs(v.y / cs.step - std::round(v.y / cs.step)) < 1e-6;
    };
    auto show = [](Vec2 v) { return std::to_string(v.x) + " " + std::to_string(v.y); };
    f.doc.display().alignToGrid = true;
    f.doc.display().gridX = f.doc.display().gridY = cs.step;
    f.view.setRouteAngle(cs.angle ? RouteAngle::Deg45 : RouteAngle::Free);
    auto pts = b.graphics[poly].pts;
    Vec2 lo = pts[0];
    f.doc.setSelection({{ItemType::Detail, poly}}, {});
    f.look(lo, 20);
    f.drag(f.at(lo), f.at(lo + Vec2{1.37 * kNmPerMm, 0.81 * kNmPerMm}));
    Vec2 v = f.b().graphics[poly].pts[0];
    EXPECT_NE(v, lo);
    // The 45-degree mode on the 0.5 mm grid with the outline off it: the free coordinate at least.
    if (cs.step < kNmPerMm / 100 || !cs.angle) EXPECT_TRUE(onGrid(v)) << show(v);
    f.doc.undoStack()->undo();

    Vec2 mid = (pts[0] + pts[1]) * 0.5;
    f.doc.setSelection({{ItemType::Detail, poly}}, {});
    f.look(mid, 20);
    f.drag(f.at(mid), f.at(mid + (pts[1] - pts[0]).perp().normalized() * (1.73 * kNmPerMm)));
    ASSERT_EQ(f.b().graphics[poly].pts.size(), pts.size() + 1);
    v = f.b().graphics[poly].pts[1];
    if (cs.step < kNmPerMm / 100 || !cs.angle) EXPECT_TRUE(onGrid(v)) << show(v);
    f.doc.undoStack()->undo();

    const Graphic& g = f.b().graphics[line];
    Vec2 grab = g.a + (g.b - g.a) * 0.3;
    f.doc.setSelection({{ItemType::Detail, line}}, {});
    f.look(grab, 20);
    f.drag(f.at(grab), f.at(grab + (g.b - g.a).perp().normalized() * (1.21 * kNmPerMm) + (g.b - g.a).normalized() * 3e5));
    EXPECT_TRUE(onGrid(f.b().graphics[line].a) || cs.step > kNmPerMm / 100) << show(f.b().graphics[line].a);
    if (cs.step > kNmPerMm / 100) {
      // Across itself, onto the grid line.
      Vec2 n = (g.b - g.a).perp().normalized();
      Vec2 m = f.b().graphics[line].a;
      double c = std::abs(n.x) > 0.5 ? m.x : m.y;
      EXPECT_NEAR(c / cs.step, std::round(c / cs.step), 1e-6) << show(m);
    }
    f.doc.undoStack()->undo();

    int ti = 0;
    Vec2 a = b.tracks[ti].b.v();
    f.doc.setSelection({{ItemType::Track, ti}}, {});
    f.look(a, 10);
    f.drag(f.at(a), f.at(a + Vec2{0.63 * kNmPerMm, 0.29 * kNmPerMm}));
    v = f.b().tracks[ti].b.v();
    if (cs.step < kNmPerMm / 100 || !cs.angle) EXPECT_TRUE(onGrid(v)) << show(v);
    f.doc.undoStack()->undo();
  }
}

// «Габариты» turn with the component: one turned by 45 degrees is drawn and picked by its own rectangle, not by
// the box round it (a click beside its side is no click on it).
TEST(Gui, ComponentBoundsTurnWithIt) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  Board& b = *f.doc.board();
  int ci = int(r::find(b.components, std::string("D1"), &Component::ref) - b.components.begin());
  ASSERT_LT(ci, int(b.components.size()));
  edit::Fragment fr;
  fr.components = {ci};
  edit::Motion m;
  m.pivot = b.components[ci].pos.v();
  m.rotate = 45;
  b.components[ci].locked = false;
  ASSERT_TRUE(edit::move(b, fr, m));
  f.doc.invalidate();
  const Component& c = b.components[ci];
  BBox bb = componentBounds(b, ci);
  ASSERT_TRUE(bb.valid());
  bool wide = bb.width() >= bb.height();
  Vec2 centre = c.toBoard(bb.center());
  f.look(centre, std::max(bb.width(), bb.height()) / kNmPerMm * 2);
  f.doc.display().show["showCompsBound"] = true;
  if (const char* dir = std::getenv("XR_SHOT_DIR")) f.view.grab().save(QString(dir) + "/bounds-turned.png");

  // 1 mm off the middle of the long side: inside the box round the turned component (at 45 degrees a side's
  // middle lies half the other side within it), outside its rectangle. Components only: tracks run over D1.
  f.doc.setSelectionFilter(SelComponents);
  Vec2 beside = c.toBoard(wide ? Vec2{bb.center().x, bb.maxY + kNmPerMm} : Vec2{bb.maxX + kNmPerMm, bb.center().y});
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(beside));
  EXPECT_FALSE(r::contains(f.doc.selectedComponents(), ci));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(centre));
  EXPECT_TRUE(r::contains(f.doc.selectedComponents(), ci));
}

// S flips a component to the other side; its SMD wires stay behind, a second S brings it back.
TEST(Gui, FlipComponent) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  int ci = -1;
  for (int c = 0; c < int(f.b().components.size()) && ci < 0; ++c)
    if (!f.b().components[c].locked && !f.b().components[c].pads.empty()) ci = c;
  ASSERT_GE(ci, 0);
  Side side = f.b().components[ci].side;
  auto pads = f.b().pads;
  f.doc.setSelection({}, {ci});
  f.view.flipSelection(false);
  EXPECT_NE(f.b().components[ci].side, side);
  f.view.flipSelection(false);
  EXPECT_EQ(f.b().components[ci].side, side);
  for (int pi : f.b().components[ci].pads) {
    EXPECT_NEAR(f.b().pads[pi].pos.x, pads[pi].pos.x, 2);
    EXPECT_NEAR(f.b().pads[pi].pos.y, pads[pi].pos.y, 2);
    EXPECT_EQ(f.b().pads[pi].copper, pads[pi].copper);
  }
}

// Ctrl+C / Ctrl+V: the pasted copy follows the cursor and a click puts it down; Esc drops it.
TEST(Gui, CopyPaste) {
  Fixture f("tt.kicad_pcb");
  const Board& b = f.b();
  ASSERT_FALSE(b.vias.empty());
  Vec2 v = b.vias[0].pos.v();
  f.look(v, 20);
  size_t tracks = b.tracks.size(), vias = b.vias.size();
  f.doc.setSelection({{ItemType::Via, 0}, {ItemType::Track, 0}}, {});
  f.view.copySelection();
  ASSERT_FALSE(BoardView::clipboardEmpty());
  Vec2 target = v + Vec2{3 * kNmPerMm, 2 * kNmPerMm};
  moveTo(f.view, f.at(target));
  f.view.paste();
  EXPECT_TRUE(f.view.isPlacing());
  Vec2 to = target + Vec2{1 * kNmPerMm, 0};
  moveTo(f.view, f.at(to));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(to));
  EXPECT_FALSE(f.view.isPlacing());
  ASSERT_EQ(b.vias.size(), vias + 1);
  EXPECT_EQ(b.tracks.size(), tracks + 1);
  EXPECT_EQ(b.vias.back().net, b.vias[0].net);
  // The copy keeps its place relative to the clip's centre.
  Vec2 shift = b.vias.back().pos.v() - v;
  Vec2 tshift = b.tracks.back().a.v() - b.tracks[0].a.v();
  EXPECT_NEAR(shift.x, tshift.x, 2);
  EXPECT_NEAR(shift.y, tshift.y, 2);
  f.doc.undoStack()->undo();
  EXPECT_EQ(b.vias.size(), vias);
  // A paste dropped with Esc leaves nothing behind.
  f.view.paste();
  f.view.cancelTool();
  EXPECT_FALSE(f.view.isPlacing());
  EXPECT_EQ(b.vias.size(), vias);
  EXPECT_EQ(b.tracks.size(), tracks);
  // Cut removes, paste brings back.
  f.doc.setSelection({{ItemType::Via, 0}}, {});
  f.view.cutSelection();
  EXPECT_EQ(b.vias.size(), vias - 1);
}

// F8: a component dragged in Freestyle keeps its routing whole; one undo step takes it back. Without pushing it goes
// on the live model: its pads' owners move in the model, the wires round them are drawn from it — the model is the
// same one after, as one built anew from the board; the undo brings the model back too. (Without pushing nothing
// keeps the clearances: the move may make shorts, by the tracks as by the model.)
TEST(Gui, FreestyleDrag) {
  Fixture f("topor/Example_05/MinVia_standard_routing.fst");
  const Board& b = f.b();
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  const topo::Topology* live = &f.doc.topology();
  auto likeBuilt = [&](const char* how) {
    topo::Topology fresh;
    Board c = f.b();
    topo::Topology::assignIds(c);
    fresh.build(c);
    EXPECT_EQ(f.doc.topology().wires.size(), fresh.wires.size()) << how;
  };
  size_t tracks = b.tracks.size();
  int ci = -1;
  for (int c = 0; c < int(b.components.size()) && ci < 0; ++c)
    if (!b.components[c].locked && !b.components[c].pads.empty()) ci = c;
  ASSERT_GE(ci, 0);
  Vec2 pad = b.pads[b.components[ci].pads[0]].pos.v();
  Vec2 pos = b.components[ci].pos.v();
  f.look(pad, 30);
  f.view.startFreestyle(topo::Push::None);
  EXPECT_EQ(f.view.mode(), Mode::Freestyle);
  QPoint from = f.at(pad), to = f.at(pad + Vec2{1.5 * kNmPerMm, 0});
  QTest::mousePress(&f.view, Qt::LeftButton, {}, from);
  moveTo(f.view, from + QPoint(8, 0), Qt::LeftButton);
  moveTo(f.view, to, Qt::LeftButton);
  QTest::mouseRelease(&f.view, Qt::LeftButton, {}, to);
  EXPECT_NEAR(f.b().components[ci].pos.x, pos.x + 1.5 * kNmPerMm, 0.05 * kNmPerMm);
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), unrouted);
  EXPECT_EQ(&f.doc.topology(), live) << "moved in the model, not built anew";
  likeBuilt("after the drag");
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().components[ci].pos.v(), pos);
  EXPECT_EQ(f.b().tracks.size(), tracks);
  likeBuilt("after the undo");
  f.view.cancelTool();
  EXPECT_EQ(f.view.mode(), Mode::Select);
}

// The whole board moved (every part with every track, as the user dragged SingleLayer by 0.3 and 1.1 mm),
// then F5 three times: every track is edited, and the edited wires are drawn from the model, not by the
// sketch path (that made 7 shorts and 21 clearance violations of a drawing that had none, and the next
// presses, with nothing edited, stopped at the crossings it had made).
TEST(Gui, MovedBoardThenF5) {
  Fixture f("topor/Example_01/SingleLayer.fst");
  Board& b = *f.doc.board();
  // The model live before the move: it moves with the board (not built anew from the moved tracks).
  const topo::Topology* live = &f.doc.topology();
  const Vec2 owner0 = live->owners.front().c;
  {
    edit::Fragment fr;
    for (int i = 0; i < int(b.components.size()); ++i) fr.components.push_back(i);
    for (int i = 0; i < int(b.tracks.size()); ++i) fr.tracks.push_back(i);
    for (int i = 0; i < int(b.graphics.size()); ++i) fr.details.push_back(i);  // the outline among them
    edit::Motion m;
    m.pivot = edit::pivotOf(b, fr);
    m.shift = Vec2{0.3167 * kNmPerMm, 1.1179 * kNmPerMm};
    auto before = f.doc.beginEdit();
    ASSERT_TRUE(edit::move(b, fr, m));
    if (fr.touchesOutline(b)) io::rebuildOutline(b);
    f.doc.commitEdit(before, "move");
    ASSERT_EQ(b.outline.size(), 2u) << "the hole moved along";
  }
  EXPECT_EQ(&f.doc.topology(), live) << "moved, not built anew";
  EXPECT_LT((f.doc.topology().owners.front().c - owner0 - Vec2{0.3167 * kNmPerMm, 1.1179 * kNmPerMm}).len(), 1.0);
  {
    topo::Topology fresh;
    fresh.build(b);
    EXPECT_EQ(f.doc.topology().wires.size(), fresh.wires.size());
  }
  int edited = 0;
  for (const Track& t : b.tracks) edited += t.edited;
  ASSERT_EQ(edited, int(b.tracks.size())) << "the move marks every track";
  for (int pass = 0; pass < 3; ++pass) {
    f.view.recomputeShapes();
    DrcOptions d;
    d.unconnected = false;
    d.widths = false;
    int shorts = 0, clearances = 0;
    for (const DrcViolation& v : runDrc(b, d)) {
      shorts += v.type == DrcViolation::Type::Short;
      clearances += v.type == DrcViolation::Type::Clearance;
    }
    EXPECT_EQ(shorts, 0) << "pass " << pass;
    EXPECT_EQ(clearances, 0) << "pass " << pass;
  }
}

// A keepout drawn over a track, then F5 with nothing selected: the track goes round it (the model is built
// anew with the keepout, its wire laid round, and every wire is drawn from the model).
TEST(Gui, KeepoutDrawnOverATrackThenF5) {
  Fixture f("topor/Example_01/SingleLayer.fst");
  auto keepouts = [&] {
    int n = 0;
    for (const DrcViolation& v : runDrc(f.b())) n += v.type == DrcViolation::Type::Keepout;
    return n;
  };
  auto before = f.doc.beginEdit();
  Keepout k;
  Graphic g;
  g.kind = GraphicKind::Circle;
  g.a = {20.5 * kNmPerMm, -9.7 * kNmPerMm};  // on the wire of NET00015 between the ring and R8
  g.b = g.a + Vec2{1.5 * kNmPerMm, 0};
  k.shape.push_back(g);
  f.doc.board()->keepouts.push_back(k);
  f.doc.commitEdit(before, "keepout");
  ASSERT_GE(keepouts(), 1) << "drawn over the track";
  f.view.recomputeShapes();
  EXPECT_EQ(keepouts(), 0) << "F5 laid the wire round the keepout";
}

// «Вставка»: a keepout rectangle, a copper polygon with a cutout and another board contour.
TEST(Gui, DrawingTools) {
  Fixture f("tt.kicad_pcb");
  const Board& b = f.b();
  BBox bb = b.bbox();
  Vec2 c = bb.center();
  f.look(c, bb.width() / kNmPerMm * 1.2);
  auto click = [&](Vec2 w) { QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(w)); };
  Vec2 d{2 * kNmPerMm, 2 * kNmPerMm};

  f.view.startDraw(DrawTarget::Keepout, DrawShape::Rect);
  EXPECT_EQ(f.view.mode(), Mode::Draw);
  click(c - d);
  click(c + d);
  EXPECT_EQ(f.view.mode(), Mode::Select);  // single-shot
  ASSERT_EQ(b.keepouts.size(), 1u);
  EXPECT_EQ(b.keepouts[0].layers, LayerMask(1) << f.doc.activeLayer());
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  EXPECT_EQ(f.doc.selectedItems()[0].type, ItemType::Keepout);

  size_t zones = b.zones.size();
  f.view.startDraw(DrawTarget::Copper, DrawShape::Poly);
  click(c + Vec2{-6e6, -6e6});
  click(c + Vec2{6e6, -6e6});
  click(c + Vec2{6e6, 6e6});
  click(c + Vec2{-6e6, 6e6});
  f.view.finishShape();
  ASSERT_EQ(b.zones.size(), zones + 1);
  EXPECT_EQ(b.zones.back().outline.size(), 4u);
  EXPECT_TRUE(b.zones.back().filled.empty());
  // A cutout goes into the selected (unpoured) area.
  f.view.startDraw(DrawTarget::Cutout, DrawShape::Circle);
  ASSERT_EQ(f.view.mode(), Mode::Draw);
  click(c + Vec2{3e6, 3e6});
  click(c + Vec2{4e6, 3e6});
  ASSERT_EQ(b.zones.back().cutouts.size(), 1u);
  f.doc.undoStack()->undo();
  EXPECT_TRUE(b.zones.back().cutouts.empty());
  f.doc.undoStack()->undo();
  EXPECT_EQ(b.zones.size(), zones);

  // Another contour (a cutout of the board here).
  size_t loops = b.outline.size();
  f.view.startDraw(DrawTarget::Board, DrawShape::Rect);
  click(c + Vec2{1e6, -1e6});
  click(c + Vec2{2e6, 1e6});
  EXPECT_EQ(b.outline.size(), loops + 1);
  f.doc.undoStack()->undo();
  EXPECT_EQ(b.outline.size(), loops);

  // Esc drops a figure half drawn, then leaves the tool.
  f.view.startDraw(DrawTarget::Detail, DrawShape::Line);
  click(c);
  f.view.cancelTool();
  EXPECT_EQ(f.view.mode(), Mode::Draw);
  f.view.cancelTool();
  EXPECT_EQ(f.view.mode(), Mode::Select);
}

// Texts are picked by their box and move with the selection.
TEST(Gui, TextsSelectAndMove) {
  Fixture f("topor/Example_05/MinVia.fst");
  const Board& b = f.b();
  ASSERT_FALSE(b.texts.empty());
  // MinVia's texts are on documenting layers the routing scheme hides: put one on the top copper.
  int ti = 0;
  f.doc.board()->texts[ti].layer = b.topCopper();
  ASSERT_TRUE(f.doc.layerVisible(b.texts[ti].layer));
  auto box = b.textBox(b.texts[ti]);
  Vec2 mid = (box[0] + box[2]) * 0.5;
  f.look(mid, 20);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(mid));
  ASSERT_EQ(f.doc.selectedItems().size(), 1u);
  EXPECT_EQ(f.doc.selectedItems()[0].type, ItemType::Text);
  Vec2 pos = b.texts[ti].pos;
  f.drag(f.at(mid), f.at(mid + Vec2{2 * kNmPerMm, 0}));
  EXPECT_NEAR(b.texts[ti].pos.x, pos.x + 2 * kNmPerMm, 0.05 * kNmPerMm);
}

// «Ряд переходов» and «Матрица переходов»: two clicks, vias a diameter plus the clearance apart.
TEST(Gui, ViaRowAndMatrix) {
  Fixture f("tt.kicad_pcb");
  const Board& b = f.b();
  BBox bb = b.bbox();
  Vec2 c = bb.center();
  f.look(c, 40);
  double pitch = double(b.classOf(kNoNet).viaDiameter + b.clearance(kNoNet, -1));
  size_t vias = b.vias.size();
  f.view.startVias(ViaKind::Row);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(c + Vec2{0, 5e6}));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(c + Vec2{pitch * 3.5, 5e6}));
  EXPECT_EQ(b.vias.size(), vias + 4);
  f.view.startVias(ViaKind::Matrix);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(c + Vec2{0, -5e6}));
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(c + Vec2{pitch * 2.5, -5e6 + pitch * 1.5}));
  EXPECT_EQ(b.vias.size(), vias + 4 + 6);
}

// While routing, «;» lays the suggested path to the nearest unconnected pad and ends the route.
TEST(Gui, RouteToTarget) {
  Fixture f("astable.kicad_pcb");
  Board& b = *f.doc.board();
  b.clearRouting(false);
  f.doc.invalidate();
  size_t unrouted = Connectivity::compute(b).ratsnest.size();
  ASSERT_GT(unrouted, 0u);
  const RatsLine& r = Connectivity::compute(b).ratsnest[0];
  ASSERT_EQ(r.from.type, ItemType::Pad);
  Vec2 a = b.pads[r.from.index].pos.v();
  f.look(a, 30);
  f.view.setMode(Mode::Route);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(a));
  ASSERT_TRUE(f.view.isRouting());
  f.view.routeToTarget();
  EXPECT_FALSE(f.view.isRouting());
  EXPECT_FALSE(b.tracks.empty());
  EXPECT_EQ(Connectivity::compute(b).ratsnest.size(), unrouted - 1);
  DrcOptions o;
  o.unconnected = false;
  EXPECT_EQ(runDrc(b, o).size(), 0u);
}

// «Габариты»: the component's bounding rectangle in the compsBound colour, only when the flag is on.
TEST(Gui, ComponentBounds) {
  app();
  Document doc;
  auto b = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(b) << b.error();
  BoardView view(&doc);
  view.resize(800, 600);
  view.show();
  doc.setBoard(std::move(*b), "x");
  QTest::qWait(50);
  const Board& brd = *doc.board();
  int ci = 0;
  BBox bb;
  for (int pi : brd.components[ci].pads) bb.add(brd.pads[pi].shapeGeom().bbox());
  for (auto& g : brd.components[ci].graphics) {
    bb.add(g.a);
    bb.add(g.b);
  }
  ASSERT_TRUE(bb.valid());
  Vec2 c = bb.center();
  double mm = std::max(bb.width(), bb.height()) / kNmPerMm * 1.5;
  view.centerOn(c, mm);
  double s = view.width() / (mm * kNmPerMm);
  QPoint edge = screenOf(view, Vec2{bb.minX, c.y}, c, s);  // the left side of the rectangle
  // The 1 px line is antialiased over two pixels: a light grey, unlike the dark background and the coloured copper.
  auto edgeIsBound = [&] {
    QImage img = view.grab().toImage();
    for (int dx = -1; dx <= 1; ++dx) {
      QColor px = img.pixelColor(edge + QPoint(dx, 0));
      if (std::min({px.red(), px.green(), px.blue()}) >= 0x60) return true;
    }
    return false;
  };
  EXPECT_FALSE(doc.display().flag("showCompsBound", false));
  EXPECT_FALSE(edgeIsBound());
  doc.display().show["showCompsBound"] = true;
  view.refresh();
  QTest::qWait(10);
  EXPECT_TRUE(edgeIsBound());
  if (const char* dir = std::getenv("XR_SHOT_DIR")) {
    view.fitBoard();
    view.grab().save(QString(dir) + "/bounds.png");
  }
  doc.display().show["showComponents"] = false;
  doc.displayChanged();
  EXPECT_FALSE(edgeIsBound());
}

namespace {

// Two nets, two pads each, on one layer 30 x 30 mm; the tracks crossing or not.
Board crossBoard(bool crossing) {
  Board b;
  LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  auto mm = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({mm(0, 0), mm(30, 0), mm(30, 30), mm(0, 30)});
  int A = b.addNet("A"), B = b.addNet("B");
  Component c;
  c.ref = "U1";
  b.components.push_back(c);
  auto pad = [&](Vec2 at, int net) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = 0;
    p.net = net;
    p.pos = Point(at);
    p.shape.w = p.shape.h = mmToNm(1.0);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  };
  auto track = [&](Vec2 p, Vec2 q, int net) {
    Track t;
    t.a = Point(p);
    t.b = Point(q);
    t.width = mmToNm(0.3);
    t.layer = top;
    t.net = net;
    b.tracks.push_back(t);
  };
  pad(mm(5, 15), A);
  pad(mm(25, 15), A);
  pad(mm(15, 5), B);
  pad(mm(15, 25), B);
  track(mm(5, 15), mm(25, 15), A);
  if (crossing) track(mm(15, 5), mm(15, 25), B);
  else track(mm(15, 5), mm(15, 12), B), track(mm(15, 12), mm(3, 12), B), track(mm(3, 12), mm(3, 18), B), track(mm(3, 18), mm(15, 18), B), track(mm(15, 18), mm(15, 25), B);
  return b;
}

}  // namespace

// F5 through the model on a board whose wires cross: nothing is drawn, the crossing goes to the
// message list as a topological violation, the two tracks are selected, the undo stack is untouched.
TEST(Gui, F5AbortsOnCrossing) {
  app();
  QSettings().setValue("topo/model", true);
  Document doc;
  BoardView view(&doc);
  view.resize(800, 600);
  doc.setBoard(std::make_unique<Board>(crossBoard(true)), "x");
  const size_t tracks = doc.board()->tracks.size();
  view.recomputeShapes();
  EXPECT_EQ(doc.board()->tracks.size(), tracks);
  EXPECT_EQ(doc.undoStack()->count(), 0);
  ASSERT_TRUE(doc.drcRun());
  ASSERT_FALSE(doc.drc().empty());
  for (const DrcViolation& v : doc.drc()) EXPECT_EQ(v.type, DrcViolation::Type::Topology);
  int selectedTracks = 0;
  for (ItemRef r : doc.selectedItems()) selectedTracks += r.type == ItemType::Track;
  EXPECT_EQ(selectedTracks, 2) << "the two crossing tracks";
  // Without the crossing the same board is drawn.
  doc.setBoard(std::make_unique<Board>(crossBoard(false)), "x");
  view.recomputeShapes();
  EXPECT_EQ(doc.undoStack()->count(), 1);
  EXPECT_NE(doc.board()->tracks.size(), 6u);
}

// The model follows the board through a tool, an undo, a hand edit and a save: after F5 it is the board's, after
// an undo and after a segment dragged it follows the board (the wires of a model built anew from it), and the
// file next to the board is written and read back.
TEST(Gui, UndoKeepsTopologyInSync) {
  app();
  QSettings().setValue("topo/model", true);
  Document doc;
  BoardView view(&doc);
  view.resize(800, 600);
  auto b = io::loadBoard(data("topor/Example_03/arz_2L.fst"));
  ASSERT_TRUE(b);
  QTemporaryDir dir;
  const QString path = dir.filePath("board.fst");
  doc.setBoard(std::move(*b), path);
  const size_t wires = doc.topology().wires.size();
  view.recomputeShapes();
  EXPECT_EQ(doc.undoStack()->count(), 1);
  EXPECT_EQ(doc.topology().boardHash, topo::boardHashOf(*doc.board())) << "the model is the drawn board's";
  const topo::Topology* drawn = &doc.topology();
  EXPECT_EQ(&doc.topology(), drawn) << "not rebuilt while the board stands";
  // The live model against one built anew from the board: the same wires, by their tracks.
  auto likeBuilt = [&](const char* how) {
    topo::Topology fresh;
    fresh.build(*doc.board());
    auto sets = [](const topo::Topology& t) {
      std::multiset<std::vector<uint32_t>> out;
      for (const topo::Wire& w : t.wires) {
        std::vector<uint32_t> ids = w.tracks;
        r::sort(ids);
        out.insert(ids);
      }
      return out;
    };
    EXPECT_TRUE(sets(doc.topology()) == sets(fresh)) << how;
  };
  doc.undoStack()->undo();
  EXPECT_EQ(&doc.topology(), drawn) << "followed through the undo, not built again";
  EXPECT_EQ(doc.topology().wires.size(), wires);
  likeBuilt("after the undo");
  doc.undoStack()->redo();
  likeBuilt("after the redo");
  // A segment dragged by hand (the track count unchanged, as the hash sees it): the model follows the drag — F7
  // after a hand edit must not put the wire back.
  const topo::Topology* before = &doc.topology();
  {
    auto snap = doc.beginEdit();
    Board& bd = *doc.board();
    int moved = -1;
    for (size_t i = 0; i < bd.tracks.size() && moved < 0; ++i)
      if (!bd.tracks[i].isArc() && (bd.tracks[i].a.v() - bd.tracks[i].b.v()).len() > 5 * kNmPerMm) moved = int(i);
    ASSERT_GE(moved, 0);
    bd.tracks[moved].a.x += Coord(0.5 * kNmPerMm);
    doc.commitEdit(snap, "drag");
  }
  EXPECT_EQ(&doc.topology(), before) << "the model follows the drag";
  likeBuilt("after the drag");
  doc.undoStack()->undo();
  ASSERT_TRUE(io::saveBoard(*doc.board(), path.toStdString()).has_value());
  ASSERT_TRUE(doc.saveTopologyFile(path).has_value());
  auto again = io::loadBoard(path.toStdString());
  ASSERT_TRUE(again);
  topo::Topology::assignIds(**again);
  auto loaded = topo::loadTopology(**again, topo::sidecarPath(path.toStdString()));
  EXPECT_TRUE(loaded.has_value()) << (loaded ? "" : loaded.error());
}

// Ctrl+A takes what the selection filter allows (and nothing of the kinds it does not), like a frame
// round the whole board.
TEST(Gui, SelectAllFollowsTheFilter) {
  app();
  Document doc;
  BoardView view(&doc);
  view.resize(800, 600);
  auto b = io::loadBoard(data("topor/Example_04/Arcs_master.pcb"));
  ASSERT_TRUE(b);
  doc.setBoard(std::move(*b), "x");
  const Board& bd = *doc.board();
  doc.setSelectionFilter(SelVias);
  view.selectAll();
  EXPECT_EQ(doc.selectedItems().size(), bd.vias.size());
  for (ItemRef r : doc.selectedItems()) EXPECT_EQ(r.type, ItemType::Via);
  EXPECT_TRUE(doc.selectedComponents().empty());
  doc.setSelectionFilter(SelWires);
  view.selectAll();
  EXPECT_EQ(doc.selectedItems().size(), bd.tracks.size());
  for (ItemRef r : doc.selectedItems()) EXPECT_EQ(r.type, ItemType::Track);
  doc.setSelectionFilter(SelComponents);
  view.selectAll();
  EXPECT_TRUE(doc.selectedItems().empty());
  EXPECT_EQ(doc.selectedComponents().size(), bd.components.size());
  doc.setSelectionFilter(SelAll);
  view.selectAll();
  EXPECT_GE(doc.selectedItems().size(), bd.tracks.size() + bd.vias.size());
}

// Copper areas: a poured one is not moved (TopoR: only an unpoured outline is edited), and the pour
// commands work on the selected area and on all of them — pour, re-pour, unpour, re-pour all.
TEST(Gui, PouredCopperIsNotMovedAndRepours) {
  app();
  MainWindow w;
  ASSERT_TRUE(w.openFile(QString::fromStdString(data("astable.kicad_pcb"))));
  Document& doc = *w.document();
  Board& b = *doc.board();
  ASSERT_FALSE(b.zones.empty());
  Commands& c = *w.commands();
  c["Accel_UnPourAllPoly"]->trigger();
  ASSERT_TRUE(b.zones[0].filled.empty());
  doc.setSelection({ItemRef{ItemType::Zone, 0}}, {});
  ASSERT_TRUE(c["Accel_Pour"]->isEnabled());
  c["Accel_Pour"]->trigger();  // Z: pours an empty area
  ASSERT_FALSE(b.zones[0].filled.empty()) << "poured";
  const size_t polys = b.zones[0].filled.size();
  const Vec2 corner = b.zones[0].outline.front();
  // Moving a poured area is refused: nothing changes, no edit on the undo stack.
  const int edits = doc.undoStack()->count();
  doc.setSelection({ItemRef{ItemType::Zone, 0}}, {});
  w.view()->rotateSelection(90);
  EXPECT_EQ(doc.undoStack()->count(), edits);
  EXPECT_EQ(b.zones[0].outline.front(), corner);
  EXPECT_EQ(b.zones[0].filled.size(), polys);
  c["Cmd_RePour"]->trigger();
  EXPECT_EQ(b.zones[0].filled.size(), polys) << "re-poured the same";
  c["Accel_UnPourWithRestore"]->trigger();
  EXPECT_TRUE(b.zones[0].filled.empty()) << "unpoured";
  // Unpoured: the outline moves.
  const int beforeRotate = doc.undoStack()->count();
  doc.setSelection({ItemRef{ItemType::Zone, 0}}, {});
  w.view()->rotateSelection(90);
  EXPECT_EQ(doc.undoStack()->count(), beforeRotate + 1);
  EXPECT_NE(b.zones[0].outline.front(), corner);
  doc.undoStack()->undo();
  c["Accel_RePourAllPoly"]->trigger();
  EXPECT_EQ(b.zones[0].filled.size(), polys) << "re-poured all";
  c["Accel_UnPourAllPoly"]->trigger();
  EXPECT_TRUE(b.zones[0].filled.empty());
  c["Accel_PourAllPoly"]->trigger();
  EXPECT_EQ(b.zones[0].filled.size(), polys);
}

// «Выделить весь проводник»: from any track of a chain the whole chain, on a board as TopoR drew it and after
// F5 (short tangents between arcs).
TEST(Gui, SelectWireTakesTheWholeChain) {
  app();
  QSettings().setValue("topo/model", true);
  for (const char* name : {"topor/Example_03/arz_2L.fst", "topor/Example_04/Arcs_master.pcb"}) {
    Document doc;
    BoardView view(&doc);
    view.resize(800, 600);
    auto lb = io::loadBoard(data(name));
    ASSERT_TRUE(lb);
    doc.setBoard(std::move(*lb), "x");
    for (int pass = 0; pass < 2; ++pass) {
      if (pass == 1) view.recomputeShapes();
      const Board& b = *doc.board();
      std::vector<char> all(b.tracks.size(), 1);
      auto g = topo::wireGraph(b, all);
      topo::OwnCopper copper(b);
      int chains = 0, partial = 0, wider = 0, widthChange = 0, throughCopper = 0, unexplained = 0;
      std::string first, firstExtra;
      for (const topo::WireChain& c : topo::wireChains(b, g, all, copper)) {
        if (c.tracks.size() < 2) continue;
        ++chains;
        doc.setSelection({ItemRef{ItemType::Track, c.tracks.front()}}, {});
        view.selectWire();
        auto got = doc.selectedItems();
        int missing = 0;
        for (int ti : c.tracks) missing += !r::contains(got, ItemRef{ItemType::Track, ti});
        // More than the chain: the wire goes on through a change of width or inside a pad or via it touches
        // (chains end there), no further.
        if (got.size() > c.tracks.size()) {
          ++wider;
          bool width = false, inCopper = false;
          inCopper = true;  // every track beyond the chain lies inside copper with both its ends
          for (ItemRef r : got) {
            const Track& t = b.tracks[r.index];
            width |= t.width != b.tracks[c.tracks.front()].width;
            if (!r::contains(c.tracks, r.index)) inCopper &= copper.touches(t.a, t.net, t.layer) && copper.touches(t.b, t.net, t.layer);
          }
          widthChange += width;
          throughCopper += inCopper;
          if (!width && !inCopper) {
            if (!unexplained) firstExtra = std::format("net {} from ({:.3f},{:.3f}): {} against {}", b.nets[c.net].name, c.a().x / 1e6, c.a().y / 1e6, got.size(), c.tracks.size());
            ++unexplained;
          }
        }
        if (missing) {
          if (!partial) first = std::format("net {}, {} of {} tracks missing, from ({:.3f},{:.3f})", b.nets[c.net].name, missing, c.tracks.size(), c.a().x / 1e6, c.a().y / 1e6);
          ++partial;
        }
      }
      std::println("{} pass {}: {} chains, {} selected only in part; {} wider ({} past a width change, {} only inside copper, {} unexplained) {}", name, pass, chains, partial, wider, widthChange,
                   throughCopper, unexplained, firstExtra);
      EXPECT_EQ(partial, 0) << name << " pass " << pass << ": " << first;
      EXPECT_EQ(unexplained, 0) << name << " pass " << pass << ": " << firstExtra;
    }
  }
}

// A serpentine of pieces shorter than half the width is one wire (they all meet within half a width of each
// other, no junction); a real branch stops the selection, and so does a wire leaving the same pad.
TEST(Gui, SelectWireThroughASerpentine) {
  app();
  auto mm = [](double x, double y) { return Point(Vec2{x * kNmPerMm, y * kNmPerMm}); };
  auto b = std::make_unique<Board>();
  LayerId top = b->addLayer("Top", LayerKind::Copper, Side::Top);
  b->layers[top].copperIndex = 0;
  b->outline.push_back({mm(0, 0).v(), mm(60, 0).v(), mm(60, 30).v(), mm(0, 30).v()});
  int A = b->addNet("A");
  Component c;
  c.ref = "U1";
  b->components.push_back(c);
  Pad pad;
  pad.number = "1";
  pad.component = 0;
  pad.net = A;
  pad.pos = mm(5, 10);
  pad.shape.w = pad.shape.h = mmToNm(1.0);
  pad.copper = LayerMask(1) << top;
  b->pads.push_back(pad);
  auto track = [&](Point p, Point q, Coord w = mmToNm(0.5)) {
    Track t;
    t.a = p;
    t.b = q;
    t.width = w;
    t.layer = top;
    t.net = A;
    b->tracks.push_back(t);
    return int(b->tracks.size() - 1);
  };
  std::vector<int> wire;
  wire.push_back(track(mm(5, 10), mm(10, 10)));
  // The serpentine: pieces of 0.1 mm at a width of 0.5 mm.
  Point at = mm(10, 10);
  for (int k = 0; k < 40; ++k) {
    Point next = mm(10 + 0.1 * (k + 1), 10 + (k % 8 < 4 ? 0.1 * (k % 8 + 1) : 0.1 * (8 - k % 8 - 1)));
    wire.push_back(track(at, next));
    at = next;
  }
  wire.push_back(track(at, mm(25, 10)));
  // A junction at the far end: both branches are other wires.
  int branch1 = track(mm(25, 10), mm(30, 15)), branch2 = track(mm(25, 10), mm(30, 5));
  // Another wire out of the same pad.
  int otherOut = track(mm(5, 10), mm(5, 20));
  Document doc;
  BoardView view(&doc);
  view.resize(800, 600);
  doc.setBoard(std::move(b), "x");
  for (int from : {wire.front(), wire[20], wire.back()}) {
    doc.setSelection({ItemRef{ItemType::Track, from}}, {});
    view.selectWire();
    auto got = doc.selectedItems();
    EXPECT_EQ(got.size(), wire.size()) << "from track " << from;
    for (int ti : wire) EXPECT_TRUE(r::contains(got, ItemRef{ItemType::Track, ti})) << "from " << from << ", track " << ti;
    for (int ti : {branch1, branch2, otherOut}) EXPECT_FALSE(r::contains(got, ItemRef{ItemType::Track, ti})) << "from " << from << ", track " << ti;
  }
  doc.setSelection({ItemRef{ItemType::Track, branch1}}, {});
  view.selectWire();
  EXPECT_EQ(doc.selectedItems().size(), 1u) << "a branch alone, up to the junction";
}

// The flexible fixation is set for the nets of the selected wires («Трассировать» goes off with it), is undone
// with the edit, and «Удалить разводку» leaves such a net's wires.
TEST(Gui, FlexFixTogglesAndUndoes) {
  app();
  Document doc;
  auto b = io::loadBoard(data("astable.kicad_pcb"));
  ASSERT_TRUE(b);
  BoardView view(&doc);
  view.resize(800, 600);
  doc.setBoard(std::move(*b), "x");
  Board& brd = *doc.board();
  ASSERT_FALSE(brd.tracks.empty());
  const int net = brd.tracks[0].net;
  ASSERT_GE(net, 0);
  doc.setSelection({{ItemType::Track, 0}}, {});
  view.toggleFlexFix();
  EXPECT_TRUE(brd.nets[size_t(net)].flexFixed);
  EXPECT_FALSE(brd.nets[size_t(net)].route);
  const size_t ofNet = size_t(r::count(brd.tracks, net, &Track::net));
  Board cleared = brd;
  cleared.clearRouting(true);
  EXPECT_EQ(cleared.tracks.size(), ofNet);  // the fixed net's wires stay, the rest go
  doc.undoStack()->undo();
  EXPECT_FALSE(doc.board()->nets[size_t(net)].flexFixed);
  EXPECT_TRUE(doc.board()->nets[size_t(net)].route);
  doc.undoStack()->redo();
  EXPECT_TRUE(doc.board()->nets[size_t(net)].flexFixed);
  doc.setSelection({{ItemType::Track, 0}}, {});
  view.toggleFlexFix();  // all the selected nets have it: off again
  EXPECT_FALSE(doc.board()->nets[size_t(net)].flexFixed);
  EXPECT_TRUE(doc.board()->nets[size_t(net)].route);
}

// «Параметры дизайна»: «Мин.» never exceeds «Ном.» and a via type's hole its pad — the one edited past the
// other takes it along.
TEST(Gui, DesignParametersStayOrdered) {
  Fixture f("topor/Example_04/Arcs_standard_routing.fst");
  f.doc.setUnit(Unit::Mm);
  DesignParamsDialog dlg(&f.doc);
  auto* stack = dlg.findChild<QStackedWidget*>();
  ASSERT_TRUE(stack);
  auto cells = [&](const char* page, int low, int high) {
    dlg.showPage(page);
    auto* t = stack->currentWidget()->findChild<QTableWidget*>();
    EXPECT_TRUE(t && t->rowCount() > 0) << page;
    // A cell is the spin box, or holds it (the via pad's «...» next to it).
    auto spin = [](QWidget* w) {
      auto* s = qobject_cast<QDoubleSpinBox*>(w);
      return s ? s : w ? w->findChild<QDoubleSpinBox*>() : nullptr;
    };
    return std::pair{spin(t->cellWidget(0, low)), spin(t->cellWidget(0, high))};
  };
  for (auto [page, low, high] : {std::tuple{"Ширина проводников", 4, 5}, std::tuple{"Зазор между проводниками", 5, 6},
                                 std::tuple{"Переходные отверстия (ПО)", 6, 5}}) {
    auto [lo, hi] = cells(page, low, high);
    ASSERT_TRUE(lo && hi) << page;
    hi->setValue(0.5);
    lo->setValue(0.3);
    EXPECT_NEAR(hi->value(), 0.5, 1e-9) << page;  // in order: the other one stays
    lo->setValue(0.7);
    EXPECT_NEAR(hi->value(), 0.7, 1e-9) << page;  // the low one over the high one raises it
    hi->setValue(0.2);
    EXPECT_NEAR(lo->value(), 0.2, 1e-9) << page;  // the high one under the low one lowers it
    hi->setValue(0.6);
    EXPECT_NEAR(lo->value(), 0.2, 1e-9) << page;
  }
  for (auto* b : dlg.findChildren<QPushButton*>())
    if (b->text() == "Применить") b->click();
  const DesignRules& r = *f.b().rules;
  EXPECT_EQ(r.widths[0].min, mmToNm(0.2));
  EXPECT_EQ(r.widths[0].nom, mmToNm(0.6));
  EXPECT_EQ(r.clearances[0].min, mmToNm(0.2));
  EXPECT_EQ(r.clearances[0].nom, mmToNm(0.6));
  EXPECT_EQ(r.viaTypes[0].drill, mmToNm(0.2));
  EXPECT_EQ(r.viaTypes[0].diameter, mmToNm(0.6));
}

// «Свойства» of a via: the hole never exceeds the pad, and the other box shows what followed.
TEST(Gui, ViaPadAndHoleStayOrdered) {
  Fixture f("topor/Example_04/Arcs_standard_routing.fst");
  f.doc.setUnit(Unit::Mm);
  PropertiesPanel props(&f.doc);
  f.doc.setSelection({{ItemType::Via, 0}}, {});
  auto spins = props.findChildren<QDoubleSpinBox*>();
  ASSERT_EQ(spins.size(), 4);  // x, y, pad, hole
  QDoubleSpinBox *pad = spins[2], *hole = spins[3];
  double pad0 = pad->value();
  auto enter = [](QDoubleSpinBox* s, double v) {
    s->setValue(v);
    emit s->editingFinished();
  };
  enter(hole, pad0 + 0.4);
  EXPECT_EQ(f.b().vias[0].drill, mmToNm(pad0 + 0.4));
  EXPECT_EQ(f.b().vias[0].diameter, mmToNm(pad0 + 0.4));
  EXPECT_NEAR(pad->value(), pad0 + 0.4, 1e-9);
  enter(pad, pad0);  // the value the box started with is an edit again
  EXPECT_EQ(f.b().vias[0].diameter, mmToNm(pad0));
  EXPECT_EQ(f.b().vias[0].drill, mmToNm(pad0));
  EXPECT_NEAR(hole->value(), pad0, 1e-9);
  enter(hole, pad0 / 2);
  EXPECT_EQ(f.b().vias[0].diameter, mmToNm(pad0));  // in order: the pad stays
  EXPECT_NEAR(pad->value(), pad0, 1e-9);
}

// «Сохранять пропорции»: one grid step edited scales the other, and its box shows it.
TEST(Gui, GridStepsKeepProportion) {
  Fixture f("tt.kicad_pcb");
  f.doc.setUnit(Unit::Mm);
  DisplayControl& d = f.doc.display();
  d.gridX = mmToNm(1.0);
  d.gridY = mmToNm(2.0);
  d.saveProportion = true;
  DisplayPanel panel(&f.doc);
  std::vector<QDoubleSpinBox*> steps;
  for (auto* s : panel.findChildren<QDoubleSpinBox*>())
    if (s->suffix() == " мм" && s->decimals() == 4) steps.push_back(s);
  ASSERT_EQ(steps.size(), 2u);
  EXPECT_NEAR(steps[0]->value(), 1.0, 1e-9);
  EXPECT_NEAR(steps[1]->value(), 2.0, 1e-9);
  steps[0]->setValue(2.5);
  EXPECT_NEAR(d.gridY, mmToNm(5.0), 1);
  EXPECT_NEAR(steps[1]->value(), 5.0, 1e-9);
  steps[1]->setValue(1.0);
  EXPECT_NEAR(d.gridX, mmToNm(0.5), 1);
  EXPECT_NEAR(steps[0]->value(), 0.5, 1e-9);
  d.saveProportion = false;
  steps[0]->setValue(3.0);
  EXPECT_NEAR(d.gridX, mmToNm(3.0), 1);
  EXPECT_NEAR(steps[1]->value(), 1.0, 1e-9);
}

// «Контактные площадки (КП)»: TopoR's table of the stacks with a column per layer, the used and the unused ones.
TEST(Gui, PadstacksPage) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  f.doc.setUnit(Unit::Mm);
  DesignParamsDialog dlg(&f.doc);
  dlg.resize(1150, 640);
  dlg.showPage("Контактные площадки (КП)");
  auto* t = dlg.findChild<QTableWidget*>("padstacks");
  ASSERT_TRUE(t);
  EXPECT_EQ(t->rowCount(), 9);
  QStringList headers;
  for (int c = 0; c < t->columnCount(); ++c) headers << t->horizontalHeaderItem(c)->text();
  EXPECT_TRUE(headers.contains("TopMask"));
  EXPECT_TRUE(headers.contains("Top"));
  EXPECT_TRUE(headers.contains("BotMask"));
  EXPECT_FALSE(headers.contains("TopSilk"));  // hidden at first, as in TopoR
  bool counted = false;
  for (auto* l : dlg.findChildren<QLabel*>())
    if (l->text().contains("Всего стеков КП: 9 (2 не используется)")) counted = true;
  EXPECT_TRUE(counted);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/padstacks.png");
}

// «Редактор контактных площадок»: a detail's size edited and applied; the pads of the stack follow.
TEST(Gui, PadstackEditorResizesPads) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  f.doc.setUnit(Unit::Mm);
  const Board& b = f.b();
  int si = -1;
  for (size_t i = 0; i < b.padstacks.size(); ++i)
    if (b.padstacks[i].name == "N150S.PS") si = int(i);
  ASSERT_GE(si, 0);
  PadstackEditor ed(b, b.padstacks[size_t(si)], Unit::Mm, {}, false);
  ed.resize(920, 600);
  auto* tree = ed.findChild<QTreeWidget*>();
  ASSERT_TRUE(tree);
  // The detail of the «Top» layer row: right under it.
  QTreeWidgetItem* detail = nullptr;
  for (int i = 0; i + 1 < tree->topLevelItemCount(); ++i)
    if (tree->topLevelItem(i)->text(0).startsWith("Top :")) detail = tree->topLevelItem(i + 1);
  ASSERT_TRUE(detail);
  tree->setCurrentItem(detail);
  auto* width = ed.findChild<QDoubleSpinBox*>("width");
  auto* height = ed.findChild<QDoubleSpinBox*>("height");
  ASSERT_TRUE(width && height);
  EXPECT_NEAR(width->value(), 1.5, 1e-9);
  width->setValue(2.0);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) ed.grab().save(QString(dir) + "/padeditor.png");
  std::optional<Padstack> got;
  QObject::connect(&ed, &PadstackEditor::applied, [&](const Padstack& ps) { got = ps; });
  ed.findChild<QPushButton*>("apply")->click();
  ASSERT_TRUE(got);
  // Into the design, as «Свойства» does: one undoable step.
  auto before = f.doc.beginEdit();
  std::vector<Padstack> stacks = f.doc.board()->padstacks;
  stacks[size_t(si)] = *got;
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(*f.doc.board(), stacks, origin);
  f.doc.commitEdit(before, "Изменить стек КП");
  for (auto& p : f.b().pads)
    if (p.padstack == si && p.onLayer(f.b().topCopper())) {
      auto s = padShapeOn(f.b(), p, f.b().topCopper());
      ASSERT_TRUE(s);
      EXPECT_NEAR(std::max(s->bbox().width(), s->bbox().height()), double(mmToNm(2.0)), 10);
    }
  f.doc.undoStack()->undo();
  for (auto& p : f.b().pads)
    if (p.padstack == si) EXPECT_EQ(std::max(p.shape.w, p.shape.h), mmToNm(1.5));
  // A form button turns the detail into another form.
  PadstackEditor ed2(b, b.padstacks[size_t(si)], Unit::Mm, {}, false);
  auto* tree2 = ed2.findChild<QTreeWidget*>();
  for (int i = 0; i + 1 < tree2->topLevelItemCount(); ++i)
    if (tree2->topLevelItem(i)->text(0).startsWith("Top :")) tree2->setCurrentItem(tree2->topLevelItem(i + 1));
  ed2.findChild<QToolButton*>("form4")->click();  // cut corners
  std::optional<Padstack> got2;
  QObject::connect(&ed2, &PadstackEditor::applied, [&](const Padstack& ps) { got2 = ps; });
  ed2.findChild<QPushButton*>("apply")->click();
  ASSERT_TRUE(got2);
  auto top = r::find(got2->details, std::string("Top"), &PadDetail::layer);
  ASSERT_NE(top, got2->details.end());
  EXPECT_EQ(top->handling, CornerHandling::Chamfer);
}

// «Создать детали в стеках контактных площадок»: masks for two stacks, the report, «Изменить параметры для
// выбранных стеков КП» back to the settings with the checked one only; the paste goes inward.
TEST(Gui, CreateMaskDetails) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  const Board& b = f.b();
  auto index = [&](const char* name) {
    for (size_t i = 0; i < b.padstacks.size(); ++i)
      if (b.padstacks[i].name == name) return int(i);
    return -1;
  };
  int round = index("N150R.PS"), square = index("N150S.PS");
  auto mask = [&](const Padstack& ps, const char* layer) -> const PadDetail* {
    for (auto& d : ps.details)
      if (d.layer == layer) return &d;
    return nullptr;
  };
  CreateDetailsDialog dlg(b, b.padstacks, {round, square}, LayerKind::Mask, Unit::Mm);
  dlg.resize(820, 520);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/createmask.png");
  dlg.create();
  EXPECT_TRUE(dlg.findChild<QLabel*>("summary")->text().contains("Добавлены детали в 2 из 2 стеков КП"));
  ASSERT_TRUE(mask(dlg.stacks()[size_t(round)], "TopMask"));
  EXPECT_EQ(mask(dlg.stacks()[size_t(round)], "TopMask")->w, mmToNm(1.7));
  EXPECT_EQ(mask(dlg.stacks()[size_t(square)], "BotMask")->h, mmToNm(1.7));
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/createmask-report.png");
  dlg.changeChecked({round});
  EXPECT_EQ(dlg.listed(), std::vector<int>{round});
  EXPECT_FALSE(mask(dlg.stacks()[size_t(round)], "TopMask"));  // back to what it was
  EXPECT_TRUE(mask(dlg.stacks()[size_t(square)], "TopMask"));  // the other keeps its new mask
  dlg.setOffset(0, mmToNm(0.2));
  dlg.create();
  EXPECT_EQ(mask(dlg.stacks()[size_t(round)], "TopMask")->w, mmToNm(1.9));
  EXPECT_EQ(mask(dlg.stacks()[size_t(round)], "BotMask")->w, mmToNm(1.7));

  CreateDetailsDialog paste(b, b.padstacks, {square}, LayerKind::Paste, Unit::Mm);
  paste.create();
  EXPECT_EQ(mask(paste.stacks()[size_t(square)], "TopPaste")->w, mmToNm(1.3));
}

// «Диаметр площадки переходного отверстия»: the mask class's size, inherited by the mask layers.
TEST(Gui, ViaPadsDialog) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  ViaType t{"V", mmToNm(1.4), mmToNm(0.6)};
  ViaPadsDialog dlg(f.b(), t, Unit::Mm);
  QTableWidget* mech = nullptr;
  for (auto* tw : dlg.findChildren<QTableWidget*>())
    for (int r = 0; r < tw->rowCount(); ++r)
      if (tw->item(r, 0) && tw->item(r, 0)->text() == "Маска") mech = tw;
  ASSERT_TRUE(mech);
  for (int r = 0; r < mech->rowCount(); ++r)
    if (mech->item(r, 0)->text() == "Маска") mech->item(r, 1)->setText("1.5");
  ASSERT_EQ(dlg.type().pads.size(), 1u);
  EXPECT_EQ(dlg.type().pads[0].layerClass, "Mask");
  EXPECT_EQ(viaPadDiameter(dlg.type(), "Mask", "TopMask"), mmToNm(1.5));
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/viapads.png");
  DesignParamsDialog dp(&f.doc);
  dp.resize(1150, 640);
  dp.showPage("Переходные отверстия (ПО)");
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dp.grab().save(QString(dir) + "/viatypes.png");
}

// The mask layer shows the pads' mask details (and nothing where a stack has none).
TEST(Gui, MaskLayerShowsDetails) {
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  Board& b = *f.doc.board();
  int round = -1;
  for (size_t i = 0; i < b.padstacks.size(); ++i)
    if (b.padstacks[i].name == "N150R.PS") round = int(i);
  LayerId topMask = b.findLayer("TopMask");
  std::vector<Padstack> stacks = b.padstacks;
  createLayerDetails(b, stacks, {round}, topMask, mmToNm(0.5), true);
  std::vector<int> origin(stacks.size());
  for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
  setPadstacks(b, stacks, origin);
  // Only the mask layer on.
  DisplayControl& d = f.doc.display();
  for (auto& L : b.layers)
    if (auto* ld = d.layer(L.name)) ld->visible = L.name == "TopMask";
  d.show["showTopMechPads"] = true;
  f.view.show();
  auto pr = r::find(b.pads, round, &Pad::padstack);
  auto other = r::find_if(b.pads, [&](const Pad& p) { return p.padstack != round && p.padstack >= 0; });
  ASSERT_NE(pr, b.pads.end());
  ASSERT_NE(other, b.pads.end());
  QRgb bg = QColor(f.doc.color("background", 0x030b10)).rgb();
  auto at = [&](const Pad& p) {
    f.look(p.pos.v(), 10);
    f.view.refresh();
    QTest::qWait(10);
    return f.view.grab().toImage().pixel(f.at(p.pos.v()) + QPoint(int(f.scale * mmToNm(0.9)), 0));  // in the ring
  };
  EXPECT_NE(at(*pr) & 0xffffff, bg & 0xffffff);
  EXPECT_EQ(at(*other) & 0xffffff, bg & 0xffffff);
  if (const char* dir = std::getenv("XR_SHOT_DIR")) f.view.grab().save(QString(dir) + "/masklayer.png");
}

// Every numeric field steps by 0.01, by 0.1 with Ctrl: the arrow keys, the wheel, the buttons.
TEST(Gui, SpinBoxSteps) {
  app();
  DoubleSpinBox s;
  s.setDecimals(4);
  s.setRange(-100, 100);
  s.setValue(1);
  s.show();
  QTest::keyClick(&s, Qt::Key_Up);
  EXPECT_NEAR(s.value(), 1.01, 1e-9);
  QTest::keyClick(&s, Qt::Key_Up, Qt::ControlModifier);
  EXPECT_NEAR(s.value(), 1.11, 1e-9);
  QTest::keyClick(&s, Qt::Key_Down, Qt::ControlModifier);
  EXPECT_NEAR(s.value(), 1.01, 1e-9);
  auto wheel = [&](Qt::KeyboardModifiers m) {
    QPointF at(s.width() / 2.0, s.height() / 2.0);
    QWheelEvent e(at, s.mapToGlobal(at), {}, QPoint(0, 120), Qt::NoButton, m, Qt::NoScrollPhase, false);
    QApplication::sendEvent(&s, &e);
  };
  s.setFocus();
  wheel(Qt::NoModifier);
  EXPECT_NEAR(s.value(), 1.02, 1e-9);
  wheel(Qt::ControlModifier);
  EXPECT_NEAR(s.value(), 1.12, 1e-9);
  // The fields of the dialogs are these.
  Fixture f("topor/Example_04/Arcs_master_f5.fst");
  DesignParamsDialog dlg(&f.doc);
  dlg.showPage("Ширина проводников");
  auto spins = dlg.findChildren<QDoubleSpinBox*>();
  ASSERT_FALSE(spins.empty());
  for (auto* sp : spins) EXPECT_DOUBLE_EQ(sp->singleStep(), 0.01);
}

// «Фильтр выделения»: a filter that is on looks unlike one that is off (filled and bold against greyed), in a
// dark theme as in a light one.
TEST(Gui, SelectionFilterLooks) {
  Fixture f("tt.kicad_pcb");
  f.doc.setSelectionFilter(SelComponents | SelWires | SelVias | SelBoard);
  for (bool dark : {true, false}) {
    DisplayPanel panel(&f.doc);
    if (dark) {
      QPalette pal;
      pal.setColor(QPalette::Window, QColor(0x2b, 0x2b, 0x2b));
      pal.setColor(QPalette::Button, QColor(0x3a, 0x3a, 0x3a));
      pal.setColor(QPalette::ButtonText, QColor(0xe0, 0xe0, 0xe0));
      pal.setColor(QPalette::WindowText, QColor(0xe0, 0xe0, 0xe0));
      pal.setColor(QPalette::Disabled, QPalette::ButtonText, QColor(0x80, 0x80, 0x80));
      pal.setColor(QPalette::Mid, QColor(0x55, 0x55, 0x55));
      panel.setPalette(pal);
    }
    panel.resize(320, 600);
    panel.show();
    QTest::qWait(10);
    QToolButton *on = nullptr, *off = nullptr;
    for (auto* b : panel.findChildren<QToolButton*>()) {
      if (b->text() == "Компоненты") on = b;
      if (b->text() == "Контакты") off = b;
    }
    ASSERT_TRUE(on && off);
    EXPECT_TRUE(on->isChecked());
    EXPECT_FALSE(off->isChecked());
    // The middle of each: the fill differs plainly.
    QImage a = on->grab().toImage(), b = off->grab().toImage();
    QColor ca = a.pixelColor(4, a.height() / 2), cb = b.pixelColor(4, b.height() / 2);
    EXPECT_GT(std::abs(ca.lightness() - cb.lightness()) + std::abs(ca.hue() - cb.hue()), 40) << dark;
    if (const char* dir = std::getenv("XR_SHOT_DIR"))
      panel.grab().save(QString(dir) + (dark ? "/filter-dark.png" : "/filter-light.png"));
  }
}

// A text in its style's font: «GOST type B» as TopoR draws the notes of AMK310_MCU_V2 (measured on TopoR's screen
// at 9.5 px/mm: the block of the widest line «Толщина текстолита 1,5 - 1.6 мм.» at 4 mm is 53 mm wide).
TEST(Gui, TextInItsFont) {
  app();
  if (!QFontDatabase::hasFamily("GOST type B")) GTEST_SKIP() << "no GOST type B font";
  Document doc;  // gives the layout the fonts' widths
  Board b;
  b.addLayer("TopSilk", LayerKind::Silk, Side::Top);
  TextStyle st;
  st.name = "GOST_B_4";
  st.font = "GOST type B";
  st.height = mmToNm(4);
  b.textStyles = {st};
  Text t;
  t.text = "Плата 1 (AMK310_MCU_M_V2.1):\r\nТолщина текстолита 1,5 - 1.6 мм.\r\nTOP SILK";
  t.layer = 0;
  t.align = TextAlign::CT;
  TextLayout l = b.textLayout(t);
  EXPECT_NEAR(l.width, mmToNm(53), mmToNm(0.5));
  EXPECT_NEAR(l.top, 2 * mmToNm(4) + l.rise, 1);

  // Centred, measured on TopoR's screen at 66 px/mm: the top of a «2» 1.98 mm above its point; the digits of a
  // «27/2/25» at 2 mm 0.79 mm above it (its «/» rises above them, the block is the higher by that).
  t.text = "2";
  t.align = TextAlign::CM;
  EXPECT_NEAR(b.textLayout(t).top, -mmToNm(1.98), mmToNm(0.03));
  b.textStyles[0].height = mmToNm(2);
  t.text = "27/2/25";
  EXPECT_NEAR(b.textLayout(t).top, -mmToNm(0.79), mmToNm(0.03));
}

// «Надпись» in «Свойства», as TopoR has it: «Общие» — the text of several lines (Enter applies, the lines kept with
// TopoR's "\r\n"), the point it is aligned by, its place; «Стиль» — the style's height edited and saved into the
// style, another style taken; several texts edited together, but for the alignment; every change undone.
TEST(Gui, TextProperties) {
  Fixture f("topor/Example_01/SingleLayer.fst");
  f.doc.setUnit(Unit::Mm);
  Board& b = *f.doc.board();
  LayerId silk = b.findLayer("TopSilk");
  b.textStyles.push_back({.name = "GOST_B_4", .font = "GOST type B", .height = mmToNm(4)});
  int big = int(b.textStyles.size()) - 1;
  Text t{.text = "Плата 1:\r\r\nTOP", .pos = {mmToNm(10), -mmToNm(20)}, .layer = silk, .style = big, .align = TextAlign::CT};
  b.texts.push_back(t);
  b.texts.push_back(Text{.text = "2", .pos = {mmToNm(5), -mmToNm(5)}, .layer = silk, .style = big});
  int t0 = int(b.texts.size()) - 2, t1 = t0 + 1;
  f.doc.invalidate();
  PropertiesPanel props(&f.doc);
  f.doc.setSelection({{ItemType::Text, t0}}, {});
  auto* text = props.findChild<QPlainTextEdit*>("text");
  ASSERT_TRUE(text);
  EXPECT_EQ(text->toPlainText(), "Плата 1:\nTOP");
  text->setPlainText("Плата 2:\nTOP\nBOTTOM");
  QTest::keyClick(text, Qt::Key_Return);
  EXPECT_EQ(f.b().texts[t0].text, "Плата 2:\r\nTOP\r\nBOTTOM");
  EXPECT_EQ(f.b().textLayout(f.b().texts[t0]).lines.size(), 3u);

  // The alignment: the button of the top-centre point is down; the right-bottom one taken.
  auto* align = props.findChild<QRadioButton*>("align1");
  ASSERT_TRUE(align);
  EXPECT_TRUE(align->isChecked());
  props.findChild<QRadioButton*>("align8")->click();
  EXPECT_EQ(f.b().texts[t0].align, TextAlign::RB);
  EXPECT_TRUE(props.findChild<QRadioButton*>("align8")->isChecked());
  EXPECT_FALSE(align->isChecked());

  // «Стиль»: 4 -> 3 mm, saved into the style (the other text of the style follows).
  auto* height = props.findChild<QDoubleSpinBox*>("height");
  auto* save = props.findChild<QToolButton*>("saveStyle");
  ASSERT_TRUE(height && save);
  EXPECT_NEAR(height->value(), 4, 1e-9);
  EXPECT_FALSE(save->isEnabled());
  height->setValue(3);
  EXPECT_TRUE(save->isEnabled());
  EXPECT_EQ(f.b().textStyles[size_t(big)].height, mmToNm(4)) << "not before it is saved";
  save->click();
  EXPECT_EQ(f.b().textStyles[size_t(big)].height, mmToNm(3));
  if (const char* dir = std::getenv("XR_SHOT_DIR")) {
    QCoreApplication::processEvents();
    props.resize(420, 360);
    props.findChild<QTabWidget*>()->setCurrentIndex(0);
    props.grab().save(QString(dir) + "/text-general.png");
    props.findChild<QTabWidget*>()->setCurrentIndex(1);
    props.grab().save(QString(dir) + "/text-style.png");
  }
  f.doc.undoStack()->undo();
  EXPECT_EQ(f.b().textStyles[size_t(big)].height, mmToNm(4));
  QCoreApplication::processEvents();
  auto* style = props.findChild<QComboBox*>("style");
  ASSERT_TRUE(style);
  style->activated(0);
  EXPECT_EQ(f.b().texts[t0].style, 0);

  // Two texts: the alignment is not theirs to edit, the mirror is both's.
  f.doc.setSelection({{ItemType::Text, t0}, {ItemType::Text, t1}}, {});
  EXPECT_FALSE(props.findChild<QRadioButton*>("align0")->isEnabled());
  EXPECT_TRUE(props.findChild<QPlainTextEdit*>("text")->toPlainText().isEmpty()) << "their texts differ";
  props.findChild<QToolButton*>("mirror")->click();
  EXPECT_TRUE(f.b().texts[t0].mirror);
  EXPECT_TRUE(f.b().texts[t1].mirror);
}

// «Редактор стилей надписей»: «+» copies the selected style, «−» takes away one no text uses and never the first;
// «Применить» gives the styles to the design, the texts keep theirs when one before them goes.
TEST(Gui, TextStylesEditor) {
  app();
  Board b;
  LayerId silk = b.addLayer("TopSilk", LayerKind::Silk, Side::Top);
  b.textStyles = {TextStyle{}, {.name = "unused", .height = mmToNm(1)}, {.name = "GOST_B_4", .font = "GOST type B", .height = mmToNm(4)}};
  b.texts.push_back(Text{.text = "XR", .layer = silk, .style = 2});
  TextStylesDialog dlg(b, Unit::Mm, 2);
  std::vector<TextStyle> got;
  std::vector<int> origin;
  QObject::connect(&dlg, &TextStylesDialog::applied, [&](auto& s, auto& o) { got = s, origin = o; });
  auto* table = dlg.findChild<QTableWidget*>("styles");
  auto* remove = dlg.findChild<QPushButton*>("remove");
  auto* apply = dlg.findChild<QPushButton*>("apply");
  ASSERT_TRUE(table && remove && apply);
  EXPECT_EQ(table->rowCount(), 3);
  EXPECT_EQ(table->item(2, 1)->text(), "GOST type B, 4 мм");
  EXPECT_FALSE(remove->isEnabled()) << "used by a text";
  EXPECT_FALSE(apply->isEnabled());
  table->selectRow(0);
  EXPECT_FALSE(remove->isEnabled()) << "(Default)";
  table->selectRow(1);
  ASSERT_TRUE(remove->isEnabled());
  remove->click();
  table->selectRow(1);
  dlg.findChild<QPushButton*>("add")->click();
  EXPECT_EQ(table->rowCount(), 3);
  dlg.findChild<QToolButton*>("bold")->click();
  EXPECT_EQ(table->item(2, 1)->text(), "GOST type B, 4 мм, Bold");
  if (const char* dir = std::getenv("XR_SHOT_DIR")) dlg.grab().save(QString(dir) + "/text-styles.png");
  ASSERT_TRUE(apply->isEnabled());
  apply->click();
  ASSERT_EQ(got.size(), 3u);
  EXPECT_EQ(origin, (std::vector<int>{0, 2, -1}));
  EXPECT_TRUE(got[2].bold);
  EXPECT_EQ(got[2].font, "GOST type B");
  setTextStyles(b, got, origin);
  EXPECT_EQ(b.texts[0].style, 1) << "GOST_B_4 is the second now";
  EXPECT_EQ(b.textStyles[1].name, "GOST_B_4");
}

// F5 of a selected zipped pair (or after an edit) draws its axis as F5 of the whole board does: the arcs round the
// bends of its neighbours, not a chain of small bends round their points (AMK310's pair along +5V's wide bend: 27
// pieces of axis for 9). With the pair are drawn the wires sharing its edges, packed with it.
TEST(Gui, ZippedPairF5KeepsItsArcs) {
  Fixture f("topor/AMK310/AMK310_MCU_V2.fst");
  auto shape = [&] {
    int arcs = 0;
    for (const Track& t : f.b().zips[0].axis) arcs += t.isArc();
    return std::pair(f.b().zips[0].axis.size(), arcs);
  };
  f.view.recomputeShapes();
  const auto whole = shape();
  std::vector<ItemRef> sel;
  for (int i = 0; i < int(f.b().tracks.size()); ++i)
    if (f.b().tracks[size_t(i)].zip == 0) sel.push_back({ItemType::Track, i});
  f.doc.setSelection(sel, {});
  f.view.recomputeShapes();
  EXPECT_EQ(shape(), whole) << "the selected pair";
  {
    Board& b = *f.doc.board();
    auto before = f.doc.beginEdit();
    xr::moveAxisVertex(b, 0, 1, b.zips[0].axis[0].b.v() + Vec2{20000, 0});
    f.doc.commitEdit(before, "axis");
    f.view.recomputeShapes();
  }
  EXPECT_EQ(shape(), whole) << "after the axis edited";
}

// F5 on a board where a wire was drawn down across two others and back (the article's fig. 2): the double crossings
// are taken apart, not stopped at — three parallel wires, no short, and the status says so.
TEST(Gui, F5TakesDoubleCrossingsApart) {
  Fixture f("tt.kicad_pcb");
  auto board = std::make_unique<Board>();
  Board& b = *board;
  const LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  b.netClasses[0].clearance = mmToNm(0.2);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
  Component comp;
  comp.ref = "U1";
  b.components.push_back(comp);
  auto pad = [&](const char* net, double x, double y) {
    Pad p;
    p.number = std::to_string(b.pads.size());
    p.component = 0;
    p.net = b.addNet(net);
    p.pos = Point(at(x, y));
    p.shape.kind = PadShapeKind::Circle;
    p.shape.w = p.shape.h = mmToNm(1);
    p.copper = LayerMask(1) << top;
    b.pads.push_back(p);
  };
  auto track = [&](const char* net, std::initializer_list<std::pair<double, double>> pts) {
    const std::pair<double, double>* prev = nullptr;
    for (const auto& q : pts) {
      if (prev) {
        Track t;
        t.a = Point(at(prev->first, prev->second));
        t.b = Point(at(q.first, q.second));
        t.width = mmToNm(0.3);
        t.layer = top;
        t.net = b.addNet(net);
        b.tracks.push_back(t);
      }
      prev = &q;
    }
  };
  for (auto [net, y] : {std::pair{"A", 8.0}, {"B", 10.0}, {"C", 12.0}}) {
    pad(net, 4, y);
    pad(net, 36, y);
  }
  track("A", {{4, 8}, {36, 8}});
  track("B", {{4, 10}, {36, 10}});
  track("C", {{4, 12}, {10, 12}, {14, 6}, {26, 6}, {30, 12}, {36, 12}});
  // C drawn by hand: its tracks alone edited — the wires A and B its double crossings are taken apart from go
  // another way in the model, and are drawn with it (left as drawn, C was laid over them).
  for (Track& t : b.tracks) t.edited = b.nets[size_t(t.net)].name == "C";
  f.doc.setBoard(std::move(board), "tangled");
  QSignalSpy said(&f.view, &BoardView::status);
  f.view.recomputeShapes();
  ASSERT_FALSE(said.isEmpty());
  const QString msg = said.last().at(0).toString();
  EXPECT_TRUE(msg.contains("распутано двойных пересечений")) << msg.toStdString();
  DrcOptions d;
  d.unconnected = false;
  d.widths = false;
  EXPECT_TRUE(runDrc(f.b(), d).empty());
  EXPECT_EQ(Connectivity::compute(f.b()).ratsnest.size(), 0u);
}

// An arc's centre has a handle on the mechanical and the helper drawings — a keepout drawn as an arc, a polygon's
// arc side — dragged along the chord's bisector (the ends stay, the arc bends); none on a track (its arcs are F5's).
TEST(Gui, ArcCentreHandle) {
  Fixture f("tt.kicad_pcb");
  auto board = std::make_unique<Board>();
  Board& b = *board;
  const LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
  Track t;
  t.a = Point(at(10, 10));
  t.b = Point(at(30, 10));
  t.mid = Point(at(20, 14));
  t.width = mmToNm(0.3);
  t.layer = top;
  t.net = b.addNet("N");
  b.tracks.push_back(t);
  Keepout k;
  Graphic arc;
  arc.kind = GraphicKind::Arc;
  arc.a = at(5, 4);
  arc.b = at(15, 4);
  arc.m = arcMiddle(arc.a, arc.b, 120);
  k.shape.push_back(arc);
  b.keepouts.push_back(k);
  Keepout k2;
  Graphic poly;
  poly.kind = GraphicKind::Poly;
  poly.pts = {at(25, 3), at(35, 3), at(35, 7), at(25, 7)};
  poly.arcs = {0, 0, 60, 0};
  k2.shape.push_back(poly);
  b.keepouts.push_back(k2);
  f.doc.setBoard(std::move(board), "arcs");
  // No handle on a track's centre: a drag from there changes nothing.
  f.look(at(20, 10), 30);
  f.doc.setSelection({{ItemType::Track, 0}}, {});
  const Vec2 c0 = ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).center;
  f.drag(f.at(c0), f.at(c0 + at(0, -3)));
  EXPECT_EQ(f.b().tracks[0].mid, t.mid);
  for (int ki : {0, 1}) {
    f.doc.setSelection({{ItemType::Keepout, ki}}, {});
    const Graphic g = f.b().keepouts[size_t(ki)].shape[0];
    Vec2 c;
    if (g.kind == GraphicKind::Arc) c = ArcGeom::fromThreePoints(g.a, g.m, g.b).center;
    else c = ArcGeom::fromThreePoints(g.pts[2], arcMiddle(g.pts[2], g.pts[3], 60), g.pts[3]).center;
    f.look(c, 30);
    f.drag(f.at(c), f.at(c + (ki == 0 ? at(0, -2) : at(0, 2))));
    const Graphic& n = f.b().keepouts[size_t(ki)].shape[0];
    if (ki == 0) {
      EXPECT_EQ(n.a, g.a);
      EXPECT_EQ(n.b, g.b);
      EXPECT_NE(arcAngle(n.a, n.m, n.b), arcAngle(g.a, g.m, g.b)) << "the keepout's arc bent";
    } else {
      EXPECT_EQ(n.pts, g.pts);
      EXPECT_NE(n.arcOf(2), 60.0) << "the polygon's arc side bent";
    }
  }
}

// A mechanical layer made active is drawn over everything (its drawing over a metal layer's wire), «Только активный
// слой» shows it alone (the metal and the other mechanical layers hidden), and routing keeps to the last active metal
// layer.
TEST(Gui, MechanicalLayerActive) {
  Fixture f("tt.kicad_pcb");
  auto board = std::make_unique<Board>();
  Board& b = *board;
  const LayerId top = b.addLayer("Top", LayerKind::Copper, Side::Top);
  b.layers[top].copperIndex = 0;
  const LayerId bot = b.addLayer("Bottom", LayerKind::Copper, Side::Bottom);
  b.layers[bot].copperIndex = 1;
  const LayerId mech = b.addLayer("Mech", LayerKind::Other, Side::Bottom);
  const LayerId silk = b.addLayer("Silk", LayerKind::Silk, Side::Top);
  auto at = [](double x, double y) { return Vec2{x * kNmPerMm, y * kNmPerMm}; };
  b.outline.push_back({at(0, 0), at(40, 0), at(40, 20), at(0, 20)});
  Track t;
  t.a = Point(at(10, 10));
  t.b = Point(at(30, 10));
  t.width = mmToNm(2);
  t.layer = top;
  t.net = b.addNet("N");
  b.tracks.push_back(t);
  Graphic g;
  g.kind = GraphicKind::Line;
  g.a = at(20, 5);
  g.b = at(20, 15);
  g.width = mmToNm(1);
  g.layer = mech;
  b.graphics.push_back(g);
  f.doc.setBoard(std::move(board), "mech");
  f.doc.setActiveLayer(bot);
  f.doc.display().layer("Mech")->details = 0x00ff00;
  f.doc.display().layer("Mech")->visible = true;
  f.doc.display().layer("Silk")->visible = true;
  f.doc.display().layer("Top")->details = 0xff0000;
  f.doc.display().show["showBotMechLayers"] = true;
  f.doc.display().show["showBotMechDetails"] = true;
  f.view.show();
  f.look(at(20, 10), 20);
  auto pixel = [&] {
    f.view.refresh();
    QTest::qWait(10);
    return f.view.grab().toImage().pixelColor(f.at(at(20, 10)));
  };
  const QColor mechColor = QColor::fromRgb(0x00ff00);
  EXPECT_NE(pixel(), mechColor) << "the bottom mechanical layer under the metal";
  f.doc.setActiveLayer(mech);
  EXPECT_EQ(f.doc.activeLayer(), mech);
  EXPECT_EQ(f.doc.activeCopper(), bot);
  EXPECT_EQ(pixel(), mechColor) << "the active mechanical layer over the metal";
  // Only the active layer.
  f.view.setOnlyActiveLayer(true);
  EXPECT_TRUE(f.doc.layerVisible(mech));
  EXPECT_FALSE(f.doc.layerVisible(top));
  EXPECT_FALSE(f.doc.layerVisible(bot));
  EXPECT_FALSE(f.doc.layerVisible(silk));
  f.doc.setActiveLayer(top);
  EXPECT_TRUE(f.doc.layerVisible(top));
  EXPECT_FALSE(f.doc.layerVisible(mech)) << "a metal layer active hides the mechanical ones too";
  EXPECT_FALSE(f.doc.layerVisible(silk));
  f.view.setOnlyActiveLayer(false);
  // Routing from a mechanical layer active goes on the last active metal one.
  f.doc.setActiveLayer(mech);
  EXPECT_EQ(f.doc.activeCopper(), top);
  f.view.setMode(Mode::Route);
  QTest::mouseClick(&f.view, Qt::LeftButton, {}, f.at(at(10, 10)));
  ASSERT_TRUE(f.view.isRouting());
  EXPECT_EQ(f.doc.activeLayer(), top);
}

// The board's picture is kept between frames: panned, it is moved and the strips uncovered drawn; what comes out is
// the picture drawn anew (to a level of a pixel's colour, the antialiasing of a shape cut at a strip's edge).
TEST(Gui, PannedPictureAsDrawnAnew) {
  Fixture f("topor/Example_04/Arcs_master.pcb");
  f.view.show();
  f.view.fitBoard();
  f.view.zoomBy(3);
  auto grab = [&] {
    QTest::qWait(5);
    return f.view.grab().toImage().convertToFormat(QImage::Format_RGB32);
  };
  const QImage before = grab();
  const QPoint mid(400, 300);
  QTest::mousePress(&f.view, Qt::MiddleButton, {}, mid);
  QPoint at = mid;
  for (QPoint step : {QPoint(37, 0), QPoint(0, -23), QPoint(-11, 19), QPoint(5, 5)}) {
    at += step;
    moveTo(f.view, at, Qt::MiddleButton);
    grab();
  }
  QTest::mouseRelease(&f.view, Qt::MiddleButton, {}, at);
  const QImage moved = grab();
  EXPECT_NE(moved, before) << "panned";
  f.view.refresh();
  const QImage fresh = grab();
  ASSERT_EQ(moved.size(), fresh.size());
  int off = 0;
  for (int y = 0; y < fresh.height(); ++y)
    for (int x = 0; x < fresh.width(); ++x) {
      const QRgb u = moved.pixel(x, y), v = fresh.pixel(x, y);
      if (std::abs(qRed(u) - qRed(v)) > 2 || std::abs(qGreen(u) - qGreen(v)) > 2 || std::abs(qBlue(u) - qBlue(v)) > 2)
        ++off;
    }
  EXPECT_EQ(off, 0) << "pixels unlike the picture drawn anew";
  if (const char* dir = std::getenv("XR_SHOT_DIR")) {
    moved.save(QString(dir) + "/panned.png");
    fresh.save(QString(dir) + "/fresh.png");
  }
}
