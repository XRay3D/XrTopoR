#pragma once
#include <QMainWindow>
#include <atomic>
#include <memory>

#include "gui/BoardView.h"
#include "gui/Document.h"

class QLabel;
class QProgressDialog;

namespace xr::gui {

class MainWindow : public QMainWindow {
  Q_OBJECT
 public:
  MainWindow();
  bool openFile(const QString& path);

 private:
  void buildMenus();
  void buildDocks();
  void open();
  void save();
  void saveAs();
  void importSes();
  void exportGerber();
  void exportSvg();
  void runDrc();
  void autoroute();
  void clearRouting();
  void updateTitle();

  Document* doc_;
  BoardView* view_;
  QLabel* coords_;
  QLabel* layerLabel_;
  std::shared_ptr<std::atomic<bool>> cancel_;
};

}  // namespace xr::gui
