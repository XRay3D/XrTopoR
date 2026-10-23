#pragma once
#include <QLineEdit>
#include <QListWidget>
#include <QTextBrowser>
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

// «Проект»: the open document and the recent files («История»).
class ProjectPanel : public QWidget {
  Q_OBJECT
 public:
  explicit ProjectPanel(Document* doc, QWidget* parent = nullptr);
  void refreshHistory();
 signals:
  void openRequested(const QString& path);
 private:
  void rebuildProject();
  Document* doc_;
  QTreeWidget* project_;
  QTreeWidget* history_;
};

}  // namespace xr::gui
