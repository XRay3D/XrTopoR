#pragma once
#include <QLineEdit>
#include <QListWidget>
#include <QTextBrowser>
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"

namespace xr::gui {

class BoardView;

class LayersPanel : public QWidget {
  Q_OBJECT
 public:
  explicit LayersPanel(Document* doc, QWidget* parent = nullptr);
 private:
  void rebuild();
  Document* doc_;
  QTreeWidget* tree_;
  bool building_ = false;
};

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
 signals:
  void runRequested();
 private:
  void rebuild();
  Document* doc_;
  BoardView* view_;
  QListWidget* list_;
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
