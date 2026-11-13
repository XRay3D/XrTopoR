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

namespace xr::gui::mcp {
class HttpTransport;
class Server;
class Tools;
}  // namespace xr::gui::mcp

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
  bool saveAs(const QString& file);  // «Сохранить как» without the dialog; the file joins the project
  bool openLastFile();  // the project or design opened in the previous session, if any
  Project* project() { return project_ ? &*project_ : nullptr; }
  AutorouteWindow* autorouteWindow();  // F11, created on first use
  // Takes over an installed TopoR's settings (hotkeys, panels, recent projects, start-up).
  bool importToporSettings(const QString& cfg, bool interactive = true);
  Commands* commands() const { return cmds_; }
  BoardView* view() const { return view_; }
  Document* document() const { return doc_; }

  // The MCP server for agents (gui/mcp): HTTP on 127.0.0.1 while the program's setting says so or `--mcp` asked
  // for it; on stdin/stdout for a client that started the editor (`--mcp-stdio`).
  mcp::Server* mcpServer();  // made on first use
  bool startMcpHttp(quint16 port, QString* error = nullptr);
  void keepMcpForRun() { mcpForRun_ = true; }  // `--mcp`: listening whatever the setting
  void stopMcpHttp();
  QString mcpUrl() const;  // empty: not listening
  void startMcpStdio();    // stdin's end closes the program

 signals:
  // F6 or F7 is done (its result shown); `more`: another procedure of the same command follows it.
  void procedureFinished(const QString& title, const QString& summary, bool more);

 protected:
  bool event(QEvent* e) override;
  void closeEvent(QCloseEvent* e) override;

 private:
  friend class mcp::Tools;
  void applyMcpSettings();
  void warn(const QString& title, const QString& text);  // a message box, or the MCP tool's answer (quietError_)
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
  void optimize(bool components, bool thenRefine = false);  // F7 sub-modes
  void optimizeModel(bool thenRefine);                      // F7 on the topological model
  void showTopologyViolations(const Board& b, const topo::Topology& t, const std::vector<topo::Violation>& vs, const QString& what);
  void saveTopologyFile(const QString& boardPath);
  void refine(bool changeLayers);  // F6 sub-modes
  void refineTracks(bool changeLayers);                    // ... among the copper as it lies (the selected wires; layer changes)
  void refineModel(bool thenLayers);                       // ... on the topological model
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
  mcp::Server* mcp_ = nullptr;
  mcp::HttpTransport* mcpHttp_ = nullptr;
  bool mcpForRun_ = false;
  QString* quietError_ = nullptr;  // set while an MCP tool opens or saves: failures go there, not to a message box
};

}  // namespace xr::gui
