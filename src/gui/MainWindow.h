#pragma once
// Main window laid out like TopoR 7.0: menus and toolbars from the command registry, the editor's
// vertical mode toolbars beside the canvas, docks «Проект», «Поиск», «Свойства», «Окно сообщений»,
// «Управление отображением», and TopoR's five-field status bar.
#include <QMainWindow>
#include <atomic>
#include <memory>

#include "gui/BoardView.h"
#include "gui/Commands.h"
#include "gui/Document.h"
#include "gui/Project.h"

class QDockWidget;
class QLabel;

namespace xr::gui {

class AutorouteWindow;
class DisplayPanel;
class ModeBar;
class ProjectPanel;

class MainWindow : public QMainWindow {
  Q_OBJECT
 public:
  MainWindow();
  // A project (.fsproj) or a design file; a design inside a project opens with its project.
  bool openFile(const QString& path);
  bool openLastFile();  // the project or design opened in the previous session, if any
  Project* project() { return project_ ? &*project_ : nullptr; }
  AutorouteWindow* autorouteWindow();  // F11, created on first use
  // Takes over an installed TopoR's settings (hotkeys, panels, recent projects, start-up).
  bool importToporSettings(const QString& cfg, bool interactive = true);
  Commands* commands() const { return cmds_; }
  BoardView* view() const { return view_; }
  Document* document() const { return doc_; }

 protected:
  bool event(QEvent* e) override;
  void closeEvent(QCloseEvent* e) override;

 private:
  void bindCommands();
  void buildMenus();
  void buildToolbars();
  void buildDocks();
  void buildStatusBar();
  void restoreLayout();
  void applyToporLayout(const struct ToporSettings& t);
  void showProgramSettings();
  void resetSettings();
  QDockWidget* addDock(const QString& objectName, const QString& title, QWidget* w, Qt::DockWidgetArea area,
                       const QString& toggleCommand);

  bool maybeSave();
  bool openProject(const QString& path);
  bool openDesign(const QString& path);  // into the editor, keeping the current project
  void newProject();
  void copyProject();
  void saveProject();
  void importDesign();
  void open();
  void openExamples();
  void closeBoard();
  bool save();
  bool saveAs();
  void exportDesign();
  void importSes();
  void exportGerber();
  void exportSvg();
  void exportBom();
  void showSummary();
  void showHotkeys();
  void runDrc();
  void autoroute();
  void optimize(bool components);  // F7 sub-modes
  void pour(bool fill, bool clear, const QString& title);
  void pourSelected(int how);  // 0 toggle (Z), 1 remove fill, 2 re-pour
  void showContextMenu(QPoint globalPos);
  void describeSelection();    // status hint about the selected objects
  void clearRouting();

  void updateTitle();
  void updateStatus();      // field 0: mode, length, vias, violations
  void showHint(const QString& text, int ms = 5000);
  void updateCursor(Vec2 world);
  void updateModeButtons();

  Document* doc_;
  BoardView* view_;
  Commands* cmds_;
  ModeBar* modeBar_ = nullptr;
  ModeBar* autoBar_ = nullptr;
  ProjectPanel* projectPanel_ = nullptr;
  std::optional<Project> project_;
  DisplayPanel* display_ = nullptr;
  AutorouteWindow* autoroute_ = nullptr;
  QLabel* stMain_ = nullptr;
  QLabel* stHint_ = nullptr;
  QLabel* stXY_ = nullptr;
  QLabel* stGrid_ = nullptr;
  QLabel* stAngle_ = nullptr;
  QString hint_;  // persistent hint shown when no temporary message is active
  Vec2 cursor_;
  std::optional<Vec2> origin_;  // last left click: dx/dy reference
  QByteArray defaultState_;     // TopoR's default layout, for «Сбросить сейчас»
  std::shared_ptr<std::atomic<bool>> cancel_;
};

}  // namespace xr::gui
