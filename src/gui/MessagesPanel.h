#pragma once
// «Окно сообщений» (Alt+Q), as in TopoR: messages grouped by kind with their count — unrouted nets,
// DRC violations, procedure output — coloured like TopoR's; a double click shows the place.
#include <QTreeWidget>
#include <QWidget>

#include "core/Serpents.h"
#include "gui/Document.h"

namespace xr::gui {

class BoardView;

// A DRC violation in words, as the messages window and the DRC report show it.
QString describeViolation(const Board& b, Unit u, const DrcViolation& v);
// A delay rule the board does not keep, in words: the rule, the nets furthest apart (the shorter first), the value.
QString describeDelayViolation(const Board& b, Unit u, const DelayViolation& v);
QStringList delayAdvice(const Board& b, Unit u, const DelayViolation& v);  // TopoR's «Совет: …» lines under it
// A serpent's area met by something: TopoR's message of that number, word for word.
QString describeSerpentConflict(const Board& b, const SerpentConflict& c);

class MessagesPanel : public QWidget {
  Q_OBJECT
 public:
  MessagesPanel(Document* doc, BoardView* view, QWidget* parent = nullptr);

 signals:
  void drcSettingsRequested();

 private:
  void rebuild();
  void activate(QTreeWidgetItem* it);
  Document* doc_;
  BoardView* view_;
  QTreeWidget* tree_;
};

}  // namespace xr::gui
