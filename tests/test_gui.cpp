// GUI smoke test: drives the board view with synthetic mouse/key events on the offscreen platform.
#include <QApplication>
#include <QDir>
#include <QDockWidget>
#include <QPushButton>
#include <QTableWidget>
#include <QFile>
#include <QDoubleSpinBox>
#include <QLineEdit>
#include <QTreeWidget>
#include <QMenuBar>
#include <QMouseEvent>
#include <QSettings>
#include <QSignalSpy>
#include <QTemporaryDir>
#include <QTest>
#include <QToolBar>
#include <gtest/gtest.h>
#include <set>

#include "core/Connectivity.h"
#include "gui/BoardView.h"
#include "gui/Commands.h"
#include "gui/Document.h"
#include "gui/AutorouteWindow.h"
#include "gui/DesignParamsDialog.h"
#include "gui/DrcDialog.h"
#include "gui/MainWindow.h"
#include "gui/MessagesPanel.h"
#include "gui/PropertiesPanel.h"
#include "gui/SearchPanel.h"
#include "gui/Schemes.h"
#include "gui/ToporConfig.h"
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
  int seed = -1;
  for (int i = 0; i < int(b.tracks.size()) && seed < 0; ++i)
    for (int j = 0; j < int(b.tracks.size()); ++j)
      if (i != j && b.tracks[i].net == b.tracks[j].net && b.tracks[i].layer == b.tracks[j].layer &&
          (b.tracks[i].b == b.tracks[j].a || b.tracks[i].b == b.tracks[j].b)) {
        seed = i;
        break;
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
  EXPECT_TRUE(std::ranges::any_of(f.doc.drc(), [](auto& v) { return v.type == DrcViolation::Type::Width; }));
  QFile report(dir.filePath("drc.txt"));
  ASSERT_TRUE(report.open(QIODevice::ReadOnly));
  EXPECT_TRUE(QString::fromUtf8(report.readAll()).contains("Ширина 0.05 <"));
  s.setValue("drc/widths", false);
  s.setValue("drc/report", false);
  DrcDialog::run(&f.doc);
  EXPECT_TRUE(std::ranges::none_of(f.doc.drc(), [](auto& v) { return v.type == DrcViolation::Type::Width; }));
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
  EXPECT_TRUE(std::ranges::any_of(recent, [](auto& r) { return r.path == "/tmp/xrtopor_test/a.fsproj"; }));
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
