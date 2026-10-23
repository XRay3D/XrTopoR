#pragma once
// «Окно сообщений» (Alt+Q), as in TopoR: messages grouped by kind with their count — unrouted nets,
// DRC violations, procedure output — coloured like TopoR's; a double click shows the place.
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

// A DRC violation in words, as the messages window and the DRC report show it.
QString describeViolation(const Board& b, Unit u, const DrcViolation& v);

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
