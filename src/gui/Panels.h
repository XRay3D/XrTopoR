#pragma once
#include <QLineEdit>
#include <QListWidget>
#include <QTextBrowser>
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

class NetsPanel : public QWidget {
  Q_OBJECT
 public:
  explicit NetsPanel(Document* doc, QWidget* parent = nullptr);
 private:
  void rebuild();
  Document* doc_;
  QLineEdit* filter_;
  QListWidget* list_;
};

class DrcPanel : public QWidget {
  Q_OBJECT
 public:
  explicit DrcPanel(Document* doc, BoardView* view, QWidget* parent = nullptr);
 private:
  void rebuild();
  Document* doc_;
  BoardView* view_;
  QListWidget* list_;
};

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

class PropertiesPanel : public QWidget {
  Q_OBJECT
 public:
  explicit PropertiesPanel(Document* doc, QWidget* parent = nullptr);
 private:
  void rebuild();
  Document* doc_;
  QTextBrowser* text_;
};

}  // namespace xr::gui
