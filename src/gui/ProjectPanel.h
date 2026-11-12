#pragma once
// «Проект» (Ctrl+Q), as in TopoR: tab «Проект» with the project tree — «Документы» and «Варианты
// автотрассировки», folders, the open document in bold — its buttons and context menus, the file
// properties; tab «История» with the files opened before, grouped by date.
#include <QTreeWidget>
#include <QWidget>

#include "gui/Document.h"
#include "gui/Project.h"

class QComboBox;
class QLabel;

namespace xr::gui {

class ProjectPanel : public QWidget {
  Q_OBJECT
 public:
  explicit ProjectPanel(Document* doc, QWidget* parent = nullptr);
  void setProject(Project* p);  // nullptr: a design opened without a project
  void refresh();
  void refreshHistory();

 signals:
  void openRequested(const QString& path);
  void projectEdited();  // the project changed and should be saved
  void copyProjectRequested();
  void projectNeeded();  // a design without a project: make one (synchronously) to add folders/files to

 private:
  void contextMenu(QPoint pos);
  void historyMenu(QPoint pos);
  void showProperties(const QString& path);
  void createFolder(QTreeWidgetItem* at);
  void addFiles(QTreeWidgetItem* at);
  io::FsProjFolder* targetFolder(QTreeWidgetItem* at);  // where new folders/files go; makes the project
  void deleteFromDisk(const QString& path);
  void renameFile(const QString& path);
  io::FsProjFolder* folderOf(QTreeWidgetItem* it);  // section/folder an item belongs to
  QString pathOf(QTreeWidgetItem* it) const;
  void updateFileInfo();

  Document* doc_;
  Project* project_ = nullptr;
  QTreeWidget* tree_;
  QTreeWidget* history_;
  QComboBox* sort_;
  QLabel* info_;
};

}  // namespace xr::gui
