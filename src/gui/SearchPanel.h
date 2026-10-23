#pragma once
// «Поиск» (Ctrl+F), as in TopoR: a filter and «Результат поиска» by kind — components, nets, pins,
// vias; a click selects the object, a double click shows it.
#include <QLineEdit>
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

class SearchPanel : public QWidget {
  Q_OBJECT
 public:
  SearchPanel(Document* doc, BoardView* view, QWidget* parent = nullptr);
  void focusSearch();

 private:
  void rebuild();
  void select(QTreeWidgetItem* it, bool show);
  Document* doc_;
  BoardView* view_;
  QLineEdit* filter_;
  QTreeWidget* tree_;
};

}  // namespace xr::gui
