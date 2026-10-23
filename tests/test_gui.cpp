// GUI smoke test: drives the board view with synthetic mouse/key events on the offscreen platform.
#include <QApplication>
#include <QDockWidget>
#include <QMenuBar>
#include <QMouseEvent>
#include <QSettings>
#include <QTemporaryDir>
#include <QTest>
#include <QToolBar>
#include <gtest/gtest.h>
#include <set>

#include "gui/BoardView.h"
#include "gui/Commands.h"
#include "gui/Document.h"
#include "gui/MainWindow.h"
#include "gui/Schemes.h"
#include "io/BoardIO.h"

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
  // Zone fills are dropped by the recompute, so the baseline is the board without fills.
  Board baseline = *doc.board();
  for (auto& z : baseline.zones) z.filled.clear();
  size_t unroutedBaseline = Connectivity::compute(baseline).ratsnest.size();
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
