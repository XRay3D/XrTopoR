#pragma once
// «Окно сообщений» (Alt+Q), as in TopoR: messages grouped by kind with their count — unrouted nets,
// DRC violations, procedure output — coloured like TopoR's; a double click shows the place.
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

class MessagesPanel : public QWidget {
  Q_OBJECT
 public:
  MessagesPanel(Document* doc, BoardView* view, QWidget* parent = nullptr);

 signals:
  void drcSettingsRequested();

 private:
  void rebuild();
  void activate(QTreeWidgetItem* it);
  QString describe(const DrcViolation& v) const;
  Document* doc_;
  BoardView* view_;
  QTreeWidget* tree_;
};

}  // namespace xr::gui
