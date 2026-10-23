// GUI smoke test: drives the board view with synthetic mouse/key events on the offscreen platform.
#include <QApplication>
#include <QMouseEvent>
#include <QTest>
#include <gtest/gtest.h>

#include "gui/BoardView.h"
#include "gui/Document.h"
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
};

App& app() {
  static App a;
  return a;
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
