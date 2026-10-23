#include "gui/MainWindow.h"

#include <QApplication>
#include <QCloseEvent>
#include <QColorDialog>
#include <QDialog>
#include <QDir>
#include <QDockWidget>
#include <QFileDialog>
#include <QFontDatabase>
#include <QFutureWatcher>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QInputDialog>
#include <QLabel>
#include <QMenuBar>
#include <QMessageBox>
#include <QPlainTextEdit>
#include <QProgressDialog>
#include <QStatusBar>
#include <QStatusTipEvent>
#include <QTableWidget>
#include <QTimer>
#include <QToolBar>
#include <QVBoxLayout>
#include <QtConcurrent/QtConcurrent>

#include "core/ZoneFill.h"
#include "gui/AppSettings.h"
#include "gui/AutorouteWindow.h"
#include "gui/DesignParamsDialog.h"
#include "gui/DisplayPanel.h"
#include "gui/MessagesPanel.h"
#include "gui/PropertiesPanel.h"
#include "gui/SearchPanel.h"
#include "gui/ModeBar.h"
#include "gui/ProjectPanel.h"
#include "io/BoardIO.h"
#include "io/Report.h"
#include "io/gerber/GerberWriter.h"
#include "io/svg/SvgWriter.h"
#include "router/topo/Optimizer.h"
#include "router/topo/TopoRouter.h"

// Resources of a static library are registered explicitly (outside any namespace).
static void initGuiResources() { Q_INIT_RESOURCE(icons); }

namespace xr::gui {

namespace {

const QString kBoardFilter = QObject::tr(
    "Все поддерживаемые (*.fst *.kicad_pcb *.dsn *.pcb *.PCB);;TopoR PCB (*.fst);;KiCad (*.kicad_pcb);;"
    "Specctra DSN (*.dsn);;P-CAD ASCII (*.pcb *.PCB);;Все файлы (*)");
const QString kSaveFilter = QObject::tr(
    "TopoR PCB (*.fst);;KiCad (*.kicad_pcb);;P-CAD ASCII (*.pcb);;Specctra DSN (*.dsn);;Specctra SES (*.ses)");

double totalLength(const Board& b) {
  double l = 0;
  for (auto& t : b.tracks)
    l += t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : (t.b.v() - t.a.v()).len();
  return l;
}

}  // namespace

MainWindow::MainWindow()
    : doc_(new Document(this)), view_(new BoardView(doc_, this)), cmds_((initGuiResources(), new Commands(this))) {
  setDockOptions(AnimatedDocks | AllowNestedDocks | AllowTabbedDocks);
  // Bottom docks run under the side docks, as in TopoR.
  setCorner(Qt::BottomLeftCorner, Qt::BottomDockWidgetArea);
  setCorner(Qt::BottomRightCorner, Qt::BottomDockWidgetArea);

  bindCommands();
  buildMenus();
  buildToolbars();

  // Canvas with the vertical editor toolbars on its left.
  auto* central = new QWidget(this);
  auto* h = new QHBoxLayout(central);
  h->setContentsMargins(0, 0, 0, 0);
  h->setSpacing(0);
  auto* bars = new QVBoxLayout;
  bars->setContentsMargins(0, 0, 0, 0);
  bars->setSpacing(0);
  modeBar_ = new ModeBar(tr("Режимы Редактора"), "editor_mode_toolbar", cmds_,
                         {"Cmd_ModeSelect", "Accel_FM", "-", "Accel_RouteMode", "Cmd_ModeBoard", "Cmd_ModeKeepout",
                          "Cmd_ModeCopper", "Cmd_ModeCutout", "Cmd_ModeDetail", "Accel_InsertText", "Cmd_ModeVia", "-",
                          "Cmd_ModeSwap", "Accel_Measure"},
                         central);
  autoBar_ = new ModeBar(tr("Действия Редактора Топологии"), "editor_autoproc_toolbar", cmds_,
                         {"Accel_RecalcWires", "Accel_RefineWires", "Accel_AutoStart", "-", "Cmd_Teardrops"}, central);
  bars->addWidget(modeBar_);
  bars->addSpacing(12);
  bars->addWidget(autoBar_);
  bars->addStretch(1);
  h->addLayout(bars);
  h->addWidget(view_, 1);
  setCentralWidget(central);

  buildDocks();
  buildStatusBar();
  restoreLayout();
  cmds_->applyOverrides(AppSettings::shortcuts());

  connect(view_, &BoardView::status, this, [this](const QString& s) { showHint(s); });
  connect(view_, &BoardView::cursorMoved, this, &MainWindow::updateCursor);
  connect(view_, &BoardView::clicked, this, [this](Vec2 w) {
    origin_ = w;
    updateCursor(w);
  });
  connect(view_, &BoardView::modeChanged, this, &MainWindow::updateModeButtons);
  connect(view_, &BoardView::contextMenuRequested, this, &MainWindow::showContextMenu);
  connect(view_, &BoardView::measured, this, [this](const QString& t) { showHint(t, 0); });
  connect(doc_, &Document::selectionChanged, this, &MainWindow::describeSelection);
  connect(view_, &BoardView::routeAngleChanged, this, [this](RouteAngle a) {
    stAngle_->setText(a == RouteAngle::Deg45 ? "x45" : a == RouteAngle::Arc ? "Arc" : "Any");
    (*cmds_)["Accel_ToogleOrtho"]->setChecked(a == RouteAngle::Deg45);
  });
  connect(view_, &BoardView::viewChanged, this, [this] {
    (*cmds_)["Accel_ToggleNetlines"]->setChecked(view_->ratsnestVisible());
    (*cmds_)["Accel_ToggleActiveLayerOnly"]->setChecked(view_->onlyActiveLayer());
    bool snap = doc_->hasBoard() && doc_->display().alignToGrid;
    stGrid_->setText(snap ? "Grid:on" : "Grid:off");
    (*cmds_)["Accel_ToogleGrid"]->setChecked(snap);
  });
  connect(doc_, &Document::boardReplaced, this, [this] {
    cmds_->setBoardOpen(doc_->hasBoard());
    origin_.reset();
    updateTitle();
    updateStatus();
    updateCursor({});
  });
  connect(doc_, &Document::boardChanged, this, &MainWindow::updateStatus);
  connect(doc_, &Document::drcChanged, this, &MainWindow::updateStatus);
  connect(doc_, &Document::unitChanged, this, [this] {
    updateStatus();
    updateCursor(cursor_);
  });
  connect(doc_->undoStack(), &QUndoStack::cleanChanged, this, &MainWindow::updateTitle);
  (*cmds_)["Accel_ToggleNetlines"]->setChecked(view_->ratsnestVisible());
  updateModeButtons();
  updateTitle();
  updateStatus();
}

// ---------------------------------------------------------------- commands

void MainWindow::bindCommands() {
  Commands& c = *cmds_;
  // Файл
  c.bind("Cmd_NewProject", [this] { newProject(); }, false);
  c.bind("Accel_FileOpen", [this] { open(); }, false);
  c.bind("Cmd_ImportDesign", [this] { importDesign(); }, false);
  c.bind("Cmd_OpenExamples", [this] { openExamples(); }, false);
  c.bind("Cmd_CloseProject", [this] { closeBoard(); }, false);
  c.bind("Accel_FileSave", [this] { save(); });
  c.bind("Cmd_SaveAs", [this] { saveAs(); });
  c.bind("Cmd_ImportSes", [this] { importSes(); });
  c.bind("Cmd_ExportDesign", [this] { exportDesign(); });
  c.bind("Cmd_ExportSvg", [this] { exportSvg(); });
  c.bind("Cmd_ExportBom", [this] { exportBom(); });
  c.bind("Cmd_Gerber", [this] { exportGerber(); });
  c.bind("Cmd_Drill", [this] { exportGerber(); });  // drill files are written with the Gerbers
  c.bind("Cmd_Exit", [this] { close(); }, false);

  // Правка
  auto* undo = c.bind("Accel_Undo", [this] { doc_->undoStack()->undo(); }, false);
  auto* redo = c.bind("Accel_Redo", [this] { doc_->undoStack()->redo(); }, false);
  undo->setEnabled(false);
  redo->setEnabled(false);
  connect(doc_->undoStack(), &QUndoStack::canUndoChanged, undo, &QAction::setEnabled);
  connect(doc_->undoStack(), &QUndoStack::canRedoChanged, redo, &QAction::setEnabled);
  c.bind("Accel_Delete", [this] { view_->deleteSelection(); });
  c.bind("Accel_SelAll", [this] { view_->selectAll(); });
  c.bind("Accel_Fix", [this] { view_->toggleFix(); });
  c.bind("Accel_Layer", [this] { view_->toggleLayer(); });
  c.bind("Accel_Width", [this] { view_->changeTrackWidth(); });
  c.bind("Accel_Pour", [this] { pourSelected(0); });
  c.bind("Accel_UnPourWithRestore", [this] { pourSelected(1); });
  c.bind("Cmd_RePour", [this] { pourSelected(2); });
  c.bind("Accel_SelCyclic", [this] { view_->cycleSelection(); });
  c.bind("Accel_PrevView", [this] { view_->prevView(); });
  c.bind("Accel_NextView", [this] { view_->nextView(); });
  c.bind("Cmd_MeasureDots", [this] { view_->startMeasure(MeasureKind::Points); });
  c.bind("Cmd_MeasureObj", [this] { view_->startMeasure(MeasureKind::Objects); });
  c.bind("Accel_RotateLeft", [this] { view_->rotateSelection(90); });
  c.bind("Accel_RotateRight", [this] { view_->rotateSelection(-90); });

  // Вид
  c.bind("Accel_ZoomIn", [this] { view_->zoomBy(1.25); });
  c.bind("Accel_ZoomOut", [this] { view_->zoomBy(0.8); });
  c.bind("Accel_ZoomBoard", [this] { view_->fitBoard(); });
  c.bind("Accel_ZoomAll", [this] { view_->fitAll(); });
  c.bind("Accel_ZoomCenter", [this] { view_->centerAtCursor(); });
  c.bind("Accel_ToggleMetalLayers", [this] { view_->toggleMetalLayers(); });
  c.bind("Accel_ToggleNetlines", [this] { view_->setRatsnestVisible(!view_->ratsnestVisible()); });
  c.bind("Accel_ToggleActiveLayerOnly", [this] { view_->setOnlyActiveLayer(!view_->onlyActiveLayer()); });
  auto toggleShow = [this](const char* flag, bool def) {
    return [this, flag, def] {
      if (!doc_->hasBoard()) return;
      doc_->display().show[flag] = !doc_->display().flag(flag, def);
      doc_->displayChanged();
    };
  };
  c.bind("Accel_TogglePadDetails", toggleShow("showMetalPads", true));
  c.bind("Accel_ToggleWires", toggleShow("showWires", true));
  c.bind("Accel_ToggleThinWires", toggleShow("showThinWires", false));
  c.bind("Accel_ToggleCoppers", toggleShow("showCoppers", true));
  c.bind("Accel_ToggleKeepouts", toggleShow("showKeepouts", true));
  c.bind("Accel_ToggleGrid", [this] {
    doc_->display().gridShow = !doc_->display().gridShow;
    doc_->displayChanged();
  });
  c.bind("Accel_ToogleGrid", [this] {
    doc_->display().alignToGrid = !doc_->display().alignToGrid;
    doc_->displayChanged();
  });
  for (int i = 0; i < 20; ++i) {
    c.bind(QString("Accel_ColorScheme_%1").arg(i), [this, i] { display_->applyColorScheme(i); });
    c.bind(QString("Accel_VisibilityScheme_%1").arg(i), [this, i] { display_->applyViewScheme(i); });
  }

  // Дизайн
  c.bind("Accel_ShowDPE", [this] {
    DesignParamsDialog dlg(doc_, this);
    dlg.exec();
  });
  c.bind("Cmd_Summary", [this] { showSummary(); });

  // Трассировка
  c.bind("Accel_TO", [this] { autoroute(); });
  c.bind("Cmd_RouteWire", [this] { view_->setMode(Mode::Route); });
  c.bind("Cmd_Unroute", [this] { clearRouting(); });

  // Вставка
  c.bind("Accel_ViaSingle", [this] { view_->viaKey(); });

  // Инструменты
  c.bind("Accel_DRC", [this] { runDrc(); });
  c.bind("Accel_PourAllPoly", [this] { pour(true, false, tr("Залить все")); });
  c.bind("Accel_UnPourAllPoly", [this] { pour(false, true, tr("Удалить заливку у всех")); });
  c.bind("Accel_RePourAllPoly", [this] { pour(true, true, tr("Перезалить все")); });

  // Справка
  c.bind("Cmd_HotkeysHelp", [this] { showHotkeys(); }, false);
  c.bind("Cmd_About", [this] {
    QMessageBox::about(this, tr("О программе"),
                       tr("<b>XrTopoR</b><br>Топологический редактор и трассировщик печатных плат.<br>"
                          "Интерфейс повторяет TopoR 7.0."));
  }, false);

  // Режимы редактора и автопроцедуры
  c.bind("Cmd_ModeSelect", [this] { view_->setMode(Mode::Select); });
  c.bind("Cmd_RecalcArcs", [this] { view_->recomputeShapes(); });
  c.bind("Cmd_MoveVias", [this] { optimize(false); });
  c.bind("Cmd_MoveCompsVias", [this] { optimize(true); });

  // Ручная прокладка, выделение, слои
  c.bind("Accel_Cancel", [this] { view_->cancelTool(); });
  c.bind("Accel_DelLast", [this] { view_->routeUndoLast(); });
  c.bind("Accel_ToogleOrtho", [this] {
    view_->setRouteAngle(view_->routeAngle() == RouteAngle::Deg45 ? RouteAngle::Free : RouteAngle::Deg45);
  });
  for (int i = 0; i <= 9; ++i) c.bind(QString("Accel_SetActiveLayer%1").arg(i), [this, i] { view_->selectCopper(i); });
}

void MainWindow::buildMenus() {
  auto menu = [this](const QString& title, const QStringList& ids) {
    QMenu* m = menuBar()->addMenu(title);
    cmds_->fill(m, ids);
    return m;
  };
  auto sub = [this](QMenu* parent, const QString& title, const QStringList& ids) {
    QMenu* m = parent->addMenu(title);
    cmds_->fill(m, ids);
    return m;
  };
  auto shapeMenu = [&](QMenu* parent, const QString& title, const QString& p, bool disk, bool open) {
    QMenu* m = parent->addMenu(title);
    cmds_->fill(m, {p + "Poly", p + "Rect"});
    if (disk) cmds_->fill(m, {p + "Disk"});
    if (open) {
      cmds_->fill(m, {p + "Circle", p + "Line"});
      sub(m, tr("&Дуга"), {p + "ArcC", p + "ArcP"});
    }
  };

  QMenu* file = menu(tr("&Файл"), {"Cmd_NewProject", "Accel_FileOpen", "Cmd_OpenExamples", "Cmd_CloseProject", "-",
                                   "Accel_FileSave", "Cmd_SaveAs", "-", "Cmd_ImportDesign", "Cmd_ImportSes"});
  sub(file, tr("&Экспорт"), {"Cmd_ExportDesign", "-", "Cmd_ExportDxf", "Cmd_ExportSvg", "Cmd_ExportBom"});
  sub(file, tr("Файлы для п&роизводства"), {"Cmd_Gerber", "Cmd_Drill"});
  cmds_->fill(file, {"-", "Accel_Print", "-", "Cmd_Exit"});

  QMenu* edit = menu(tr("&Правка"), {"Accel_Undo", "Accel_Redo", "-", "Accel_Cut", "Accel_Copy", "Accel_Duplicate",
                                     "Accel_Paste", "Accel_Delete", "-", "Accel_SelAll", "Accel_SelInvert",
                                     "Accel_SelCyclic", "-", "Accel_Fix", "-", "Accel_Layer", "Accel_Width",
                                     "Accel_Reduce", "Accel_Serpent", "-", "Accel_Pour", "Accel_UnPourWithRestore",
                                     "Cmd_RePour", "-"});
  sub(edit, tr("Повер&нуть"), {"Accel_RotateLeft", "Accel_RotateRight", "Cmd_RotateAngle"});
  sub(edit, tr("Пере&вернуть"), {"Accel_FlipHorizontally", "Accel_FlipVertically"});
  cmds_->fill(edit, {"Accel_Unlink", "-", "Accel_ZipWire", "Accel_UnZipWire"});

  QMenu* view = menuBar()->addMenu(tr("&Вид"));
  sub(view, tr("П&анели"), {"Accel_ViewProject", "Accel_ViewOutput", "Accel_ViewSearch", "Accel_ViewDispCtrl",
                            "Accel_ViewPropertyBar"});
  cmds_->fill(view, {"-", "Accel_ZoomIn", "Accel_ZoomOut", "Accel_ZoomBoard", "Accel_ZoomAll", "Accel_ZoomCenter", "-",
                     "Accel_PrevView", "Accel_NextView"});

  menu(tr("&Дизайн"), {"Accel_ShowDPE", "Cmd_TextStyles", "Cmd_EditSettings", "Cmd_PadConnect", "Cmd_MsgFilter", "-",
                       "Cmd_CopperArea", "Cmd_Summary"});
  menu(tr("Т&рассировка"), {"Accel_TO", "-", "Accel_RouteMode", "Cmd_RouteDiff", "-", "Cmd_Unroute"});

  QMenu* insert = menuBar()->addMenu(tr("Вс&тавка"));
  shapeMenu(insert, tr("&Контур платы"), "Cmd_Board", false, true);
  shapeMenu(insert, tr("&Запрет"), "Cmd_Keepout", true, true);
  shapeMenu(insert, tr("Область &металлизации"), "Cmd_Copper", true, true);
  shapeMenu(insert, tr("&Вырез в металлизации"), "Cmd_Cutout", true, false);
  shapeMenu(insert, tr("&Деталь"), "Cmd_Detail", true, true);
  cmds_->fill(insert, {"Accel_InsertText"});
  sub(insert, tr("&Переход"), {"Accel_ViaSingle", "Cmd_ViaRow", "Cmd_ViaMatrix"});

  QMenu* tools = menu(tr("&Инструменты"), {"Accel_PT", "Accel_DRC", "-", "Cmd_SwapPins", "Cmd_SwapGates", "-",
                                           "Cmd_MeasureDots", "Cmd_MeasureObj", "-", "Cmd_RestoreDiff", "Cmd_Serpents",
                                           "-", "Cmd_Fanout", "Cmd_WiresToCopper"});
  sub(tools, tr("Области &металлизации"), {"Accel_PourAllPoly", "Accel_UnPourAllPoly", "Accel_RePourAllPoly"});
  cmds_->fill(tools, {"-", "Cmd_RemoveExcessVias", "Cmd_RemoveSinglePinNets", "-", "Cmd_Sync", "Cmd_Eco", "-",
                      "Cmd_Settings"});

  menu(tr("&Справка"), {"Accel_Help", "Cmd_Features", "Cmd_HotkeysHelp", "-", "Cmd_HomePage", "-", "Cmd_About"});
}

void MainWindow::buildToolbars() {
  auto bar = [this](const QString& name, const QString& title, const QStringList& ids) {
    auto* tb = new QToolBar(title, this);
    tb->setObjectName(name);
    tb->setIconSize({20, 20});
    cmds_->fill(tb, ids);
    addToolBar(Qt::TopToolBarArea, tb);
    return tb;
  };
  bar("ide_toolbar", tr("Стандартная"),
      {"Cmd_Settings", "Cmd_NewProject", "Cmd_ImportDesign", "Accel_FileOpen", "Accel_FileSave", "-", "Accel_ShowDPE",
       "-", "Cmd_ExportDesign"});
  bar("pcbdoctb_edit2", tr("Инструменты"),
      {"Accel_Fix", "Accel_Delete", "Accel_Width", "Accel_Reduce", "Accel_Serpent", "-", "Accel_ZipWire",
       "Accel_UnZipWire", "-", "Cmd_FlexFix"});
  bar("pcbdoctb_mode", tr("Режимы"), {"Accel_PT", "Accel_TO", "-", "Accel_DRC"});
  bar("pcbdoctb_view", tr("Вид"), {"Accel_PrevView", "Accel_NextView", "Accel_ZoomAll", "Accel_ZoomBoard"});
  bar("pcbdoctb_edit", tr("Правка"), {"Accel_Cut", "Accel_Copy", "Accel_Paste", "-", "Accel_Undo", "Accel_Redo"});
}

QDockWidget* MainWindow::addDock(const QString& objectName, const QString& title, QWidget* w, Qt::DockWidgetArea area,
                                 const QString& toggleCommand) {
  auto* d = new QDockWidget(title, this);
  d->setObjectName(objectName);
  d->setWidget(w);
  addDockWidget(area, d);
  // The «Вид › Панели» command shows/hides the dock and follows its visibility.
  QAction* a = (*cmds_)[toggleCommand];
  a->setCheckable(true);
  a->setChecked(true);
  cmds_->bind(toggleCommand, [d] { d->setVisible(!d->isVisible()); }, false);
  connect(d, &QDockWidget::visibilityChanged, a, [a, d] { a->setChecked(!d->isHidden()); });
  return d;
}

void MainWindow::buildDocks() {
  projectPanel_ = new ProjectPanel(doc_, this);
  connect(projectPanel_, &ProjectPanel::openRequested, this, [this](const QString& p) {
    if (maybeSave()) openFile(p);
  });
  connect(projectPanel_, &ProjectPanel::projectEdited, this, &MainWindow::saveProject);
  connect(projectPanel_, &ProjectPanel::copyProjectRequested, this, &MainWindow::copyProject);
  auto* projectDock = addDock("Project_View", tr("Проект"), projectPanel_, Qt::LeftDockWidgetArea, "Accel_ViewProject");
  auto* search = new SearchPanel(doc_, view_, this);
  auto* searchDock = addDock("Search_View", tr("Поиск"), search, Qt::LeftDockWidgetArea, "Accel_ViewSearch");
  // Ctrl+F also puts the cursor into the search field when the panel is shown.
  connect((*cmds_)["Accel_ViewSearch"], &QAction::triggered, search, [search, searchDock] {
    if (searchDock->isVisible()) search->focusSearch();
  });
  splitDockWidget(projectDock, searchDock, Qt::Vertical);
  auto* props = addDock("properties", tr("Свойства"), new PropertiesPanel(doc_, this), Qt::BottomDockWidgetArea,
                        "Accel_ViewPropertyBar");
  auto* messages = new MessagesPanel(doc_, view_, this);
  connect(messages, &MessagesPanel::drcSettingsRequested, this, &MainWindow::runDrc);
  auto* output = addDock("Output_View", tr("Окно сообщений"), messages, Qt::BottomDockWidgetArea, "Accel_ViewOutput");
  splitDockWidget(props, output, Qt::Horizontal);
  display_ = new DisplayPanel(doc_, this);
  auto* display = addDock("display_control", tr("Управление отображением"), display_, Qt::RightDockWidgetArea,
                          "Accel_ViewDispCtrl");
  // TopoR default sizes.
  resizeDocks({projectDock, display}, {229, 227}, Qt::Horizontal);
  resizeDocks({props}, {146}, Qt::Vertical);
  resizeDocks({projectDock, searchDock}, {688, 310}, Qt::Vertical);
  resizeDocks({props, output}, {476, 524}, Qt::Horizontal);
}

void MainWindow::buildStatusBar() {
  auto field = [this](int minWidth) {
    auto* l = new QLabel(this);
    l->setFrameShape(QFrame::StyledPanel);
    l->setMinimumWidth(minWidth);
    return l;
  };
  stMain_ = field(260);
  stHint_ = field(100);
  stXY_ = field(260);
  stGrid_ = field(50);
  stAngle_ = field(32);
  stGrid_->setText("Grid:off");
  stAngle_->setText("Any");
  stAngle_->setToolTip(tr("Привязка к углу: Any — любой, x45 — кратный 45° (O)"));
  statusBar()->addWidget(stMain_);
  statusBar()->addWidget(stHint_, 1);
  statusBar()->addPermanentWidget(stXY_);
  statusBar()->addPermanentWidget(stGrid_);
  statusBar()->addPermanentWidget(stAngle_);
  updateCursor({});
}

void MainWindow::restoreLayout() {
  QByteArray geom = AppSettings::windowGeometry();
  if (!geom.isEmpty()) restoreGeometry(geom);
  else resize(1400, 900);
  QByteArray state = AppSettings::windowState();
  if (!state.isEmpty()) restoreState(state);
}

bool MainWindow::event(QEvent* e) {
  // Status tips go to the hint field, as TopoR shows them, not over the whole bar.
  if (e->type() == QEvent::StatusTip) {
    QString tip = static_cast<QStatusTipEvent*>(e)->tip();
    stHint_->setText(tip.isEmpty() ? hint_ : tip);
    return true;
  }
  return QMainWindow::event(e);
}

void MainWindow::closeEvent(QCloseEvent* e) {
  if (!maybeSave()) {
    e->ignore();
    return;
  }
  AppSettings::setWindowLayout(saveGeometry(), saveState());
  AppSettings::setShortcuts(cmds_->overrides());
  e->accept();
}

// ---------------------------------------------------------------- status bar

void MainWindow::showHint(const QString& text, int ms) {
  stHint_->setText(text);
  if (ms > 0)
    QTimer::singleShot(ms, stHint_, [this, text] {
      if (stHint_->text() == text) stHint_->setText(hint_);
    });
  else hint_ = text;
}

void MainWindow::updateStatus() {
  if (!doc_->hasBoard()) {
    stMain_->setText(tr("Нет открытого документа"));
    return;
  }
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  stMain_->setText(tr("Редактор топологии: %1 %2, переходов: %3, нарушений: %4")
                       .arg(formatLength(totalLength(b), u, 1))
                       .arg(unitName(u))
                       .arg(b.vias.size())
                       .arg(doc_->drc().size()));
}

void MainWindow::updateCursor(Vec2 w) {
  cursor_ = w;
  Unit u = doc_->unit();
  // TopoR shows coordinates with Y up; the model is Y down.
  QString s = QString("xy: %1/%2").arg(formatLength(w.x, u, 1), formatLength(-w.y, u, 1));
  if (origin_) {
    Vec2 d = w - *origin_;
    s += QString("    dxdy: %1/%2").arg(formatLength(d.x, u, 1), formatLength(-d.y, u, 1));
  }
  stXY_->setText(s + " " + unitName(u));
}

void MainWindow::updateModeButtons() {
  switch (view_->mode()) {
    case Mode::Select: modeBar_->setActiveMode("Cmd_ModeSelect"); break;
    case Mode::Route: modeBar_->setActiveMode("Accel_RouteMode"); break;
    case Mode::Via: modeBar_->setActiveMode("Cmd_ModeVia"); break;
    case Mode::Measure: modeBar_->setActiveMode("Accel_Measure"); break;
  }
}

void MainWindow::updateTitle() {
  // As TopoR: «TopoR - [Редактор ПП - file]».
  QString t = "XrTopoR";
  if (doc_->hasBoard())
    t = tr("%1 - [Редактор ПП - %2%3]")
            .arg(t, QFileInfo(doc_->path()).fileName(), doc_->undoStack()->isClean() ? "" : " *");
  else if (project_)
    t = QString("%1 - [%2]").arg(t, project_->name());
  setWindowTitle(t);
}

// ---------------------------------------------------------------- files

bool MainWindow::maybeSave() {
  if (!doc_->hasBoard() || doc_->undoStack()->isClean()) return true;
  auto r = QMessageBox::question(this, tr("Сохранение"),
                                 tr("Сохранить изменения в «%1»?").arg(QFileInfo(doc_->path()).fileName()),
                                 QMessageBox::Save | QMessageBox::Discard | QMessageBox::Cancel);
  if (r == QMessageBox::Cancel) return false;
  return r == QMessageBox::Discard || save();
}

bool MainWindow::openFile(const QString& path) {
  QFileInfo fi(path);
  if (fi.suffix().compare("fsproj", Qt::CaseInsensitive) == 0) return openProject(fi.absoluteFilePath());
  QString file = openableFile(fi.absoluteFilePath());
  if (file.isEmpty()) {
    QMessageBox::warning(this, tr("Открыть"),
                         fi.suffix().compare("fsx", Qt::CaseInsensitive) == 0
                             ? tr("Формат TopoR .fsx не поддерживается: сохраните дизайн в TopoR как .fst "
                                  "(Файл › Экспорт › Экспорт дизайна) рядом с «%1».")
                                   .arg(fi.fileName())
                             : tr("Не удалось открыть «%1»: формат не поддерживается.").arg(fi.fileName()));
    return false;
  }
  // A design of the open project stays in it; otherwise a project next to it that lists it is opened.
  if (!project_ || !project_->contains(file)) {
    project_.reset();
    for (const QFileInfo& pf : QDir(fi.absolutePath()).entryInfoList({"*.fsproj"}, QDir::Files)) {
      auto p = Project::load(pf.absoluteFilePath(), nullptr);
      if (p && (p->contains(file) || p->contains(fi.absoluteFilePath()))) {
        project_ = std::move(*p);
        break;
      }
    }
    projectPanel_->setProject(project());
  }
  if (!openDesign(file)) return false;
  AppSettings::addRecentFile(project_ ? project_->path() : file);
  projectPanel_->refreshHistory();
  return true;
}

bool MainWindow::openDesign(const QString& file) {
  auto r = io::loadBoard(file.toStdString());
  if (!r) {
    QMessageBox::warning(this, tr("Открыть"), QString::fromStdString(r.error()));
    return false;
  }
  doc_->setBoard(std::move(*r), QFileInfo(file).absoluteFilePath());
  showHint(tr("Открыт %1").arg(file));
  const Board& b = *doc_->board();
  doc_->addLog({LogMessage::Kind::Info, tr("Документ"),
                tr("Открыт %1: компонентов %2, цепей %3, проводников %4, переходов %5")
                    .arg(QFileInfo(file).fileName())
                    .arg(b.components.size())
                    .arg(b.nets.size())
                    .arg(b.tracks.size())
                    .arg(b.vias.size())});
  if (project_) {
    project_->setOpened(doc_->path());
    saveProject();
  }
  projectPanel_->refresh();
  updateTitle();
  return true;
}

bool MainWindow::openProject(const QString& path) {
  QString error;
  auto p = Project::load(path, &error);
  if (!p) {
    QMessageBox::warning(this, tr("Открыть проект"), error);
    return false;
  }
  doc_->setBoard(nullptr, {});
  project_ = std::move(*p);
  projectPanel_->setProject(project());
  AppSettings::addRecentFile(project_->path());
  projectPanel_->refreshHistory();
  // The document open last time, else the first one the editor can open.
  QString doc = project_->openedDocument();
  if (doc.isEmpty() && !project_->documents().isEmpty()) doc = project_->documents().front();
  if (!doc.isEmpty()) openDesign(doc);
  else showHint(tr("В проекте нет документов, которые можно открыть (формат .fsx не поддерживается)"), 10000);
  updateTitle();
  return true;
}

void MainWindow::saveProject() {
  if (!project_) return;
  QString error;
  if (!project_->save(&error)) showHint(tr("Не удалось сохранить проект: %1").arg(error), 10000);
}

void MainWindow::newProject() {
  if (!maybeSave()) return;
  QString start = doc_->hasBoard() ? QFileInfo(doc_->path()).absolutePath() + "/" + QFileInfo(doc_->path()).completeBaseName()
                                   : QDir::homePath();
  QString f = QFileDialog::getSaveFileName(this, tr("Создать проект"), start + ".fsproj", tr("Проект TopoR (*.fsproj)"));
  if (f.isEmpty()) return;
  if (!f.endsWith(".fsproj", Qt::CaseInsensitive)) f += ".fsproj";
  project_ = Project::create(f);
  if (doc_->hasBoard() && !doc_->path().isEmpty()) {
    project_->add(doc_->path());
    project_->setOpened(doc_->path());
  }
  saveProject();
  projectPanel_->setProject(project());
  AppSettings::addRecentFile(project_->path());
  projectPanel_->refreshHistory();
  updateTitle();
}

void MainWindow::copyProject() {
  if (!project_) return;
  QString dir = QFileDialog::getExistingDirectory(this, tr("Скопировать проект в папку"));
  if (dir.isEmpty()) return;
  // The project file and every file it lists that lies in its folder.
  QDir src(project_->dir()), dst(dir);
  int copied = 0;
  for (const QString& f : QDir(project_->dir()).entryList(QDir::Files)) {
    QString from = src.filePath(f);
    if (from != project_->path() && !project_->contains(from)) continue;
    if (QFile::copy(from, dst.filePath(f))) ++copied;
  }
  showHint(tr("Скопировано файлов: %1").arg(copied));
}

void MainWindow::importDesign() {
  if (!maybeSave()) return;
  QString f = QFileDialog::getOpenFileName(this, tr("Импорт дизайна"), project_ ? project_->dir() : QString(),
                                           tr("Дизайны (*.kicad_pcb *.dsn *.pcb *.PCB *.fst);;Все файлы (*)"));
  if (f.isEmpty()) return;
  f = QFileInfo(f).absoluteFilePath();
  if (project_) {
    project_->add(f);
    saveProject();
    if (openDesign(f)) AppSettings::addRecentFile(project_->path());
    return;
  }
  openFile(f);
}

bool MainWindow::openLastFile() {
  if (!AppSettings::openLastProject()) return false;
  auto recent = AppSettings::recentFiles();
  if (recent.empty() || !QFileInfo::exists(recent.front().path)) return false;
  return openFile(recent.front().path);
}

void MainWindow::open() {
  if (!maybeSave()) return;
  QString start = project_ ? project_->dir() : QFileInfo(doc_->path()).absolutePath();
  QString f = QFileDialog::getOpenFileName(
      this, tr("Открыть"), start,
      tr("Проекты и дизайны (*.fsproj *.fst *.fsx *.kicad_pcb *.dsn *.pcb *.PCB);;Проект TopoR (*.fsproj);;") + kBoardFilter);
  if (!f.isEmpty()) openFile(f);
}

void MainWindow::openExamples() {
  if (!maybeSave()) return;
  QString dir = QDir::home().filePath("Документы/TopoR/Examples");
  if (!QFileInfo::exists(dir)) dir = QDir::homePath();
  QString f = QFileDialog::getOpenFileName(this, tr("Открыть примеры"), dir,
                                           tr("Проекты и дизайны (*.fsproj *.fst *.kicad_pcb *.dsn *.pcb *.PCB)"));
  if (!f.isEmpty()) openFile(f);
}

void MainWindow::closeBoard() {
  if (!maybeSave()) return;
  doc_->setBoard(nullptr, {});
  project_.reset();
  projectPanel_->setProject(nullptr);
  updateTitle();
}

bool MainWindow::save() {
  if (!doc_->hasBoard()) return false;
  QString p = doc_->path();
  if (p.isEmpty() || io::detectFormat(p.toStdString()) == io::Format::Unknown) return saveAs();
  auto r = io::saveBoard(*doc_->board(), p.toStdString());
  if (!r) {
    QMessageBox::warning(this, tr("Сохранить"), QString::fromStdString(r.error()));
    return false;
  }
  doc_->undoStack()->setClean();
  showHint(tr("Сохранён %1").arg(p));
  return true;
}

bool MainWindow::saveAs() {
  if (!doc_->hasBoard()) return false;
  QString f = QFileDialog::getSaveFileName(this, tr("Сохранить как"), doc_->path(), kSaveFilter);
  if (f.isEmpty()) return false;
  auto r = io::saveBoard(*doc_->board(), f.toStdString());
  if (!r) {
    QMessageBox::warning(this, tr("Сохранить"), QString::fromStdString(r.error()));
    return false;
  }
  doc_->setPath(QFileInfo(f).absoluteFilePath());
  doc_->undoStack()->setClean();
  if (project_) {
    project_->add(doc_->path());
    project_->setOpened(doc_->path());
    saveProject();
    projectPanel_->refresh();
  }
  AppSettings::addRecentFile(project_ ? project_->path() : f);
  projectPanel_->refreshHistory();
  updateTitle();
  showHint(tr("Сохранён %1").arg(f));
  return true;
}

void MainWindow::exportDesign() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getSaveFileName(this, tr("Экспорт дизайна"), QFileInfo(doc_->path()).absolutePath(), kSaveFilter);
  if (f.isEmpty()) return;
  auto r = io::saveBoard(*doc_->board(), f.toStdString());
  if (!r) QMessageBox::warning(this, tr("Экспорт"), QString::fromStdString(r.error()));
  else showHint(tr("Экспортирован %1").arg(f));
}

void MainWindow::importSes() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getOpenFileName(this, tr("Импорт разводки"), {}, tr("Specctra SES (*.ses)"));
  if (f.isEmpty()) return;
  auto text = io::readFile(f.toStdString());
  if (!text) {
    QMessageBox::warning(this, tr("Импорт"), QString::fromStdString(text.error()));
    return;
  }
  auto before = doc_->beginEdit();
  if (auto r = io::applySes(*doc_->board(), *text); !r) {
    QMessageBox::warning(this, tr("Импорт"), QString::fromStdString(r.error()));
    return;
  }
  doc_->commitEdit(before, tr("Импорт разводки"));
}

void MainWindow::exportGerber() {
  if (!doc_->hasBoard()) return;
  QString d = QFileDialog::getExistingDirectory(this, tr("Папка для файлов производства"));
  if (d.isEmpty()) return;
  auto r = io::writeGerbers(*doc_->board(), d.toStdString());
  if (!r) QMessageBox::warning(this, tr("Gerber"), QString::fromStdString(r.error()));
  else showHint(tr("Файлы Gerber и сверловки записаны в %1").arg(d));
}

void MainWindow::exportSvg() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getSaveFileName(this, tr("Экспорт SVG"), {}, tr("SVG (*.svg)"));
  if (f.isEmpty()) return;
  auto r = io::writeFile(f.toStdString(), io::writeSvg(*doc_->board()));
  if (!r) QMessageBox::warning(this, tr("SVG"), QString::fromStdString(r.error()));
}

void MainWindow::exportBom() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getSaveFileName(this, tr("Экспорт BOM"), {}, tr("CSV (*.csv)"));
  if (f.isEmpty()) return;
  if (auto r = io::writeFile(f.toStdString(), io::bomCsv(*doc_->board())); !r)
    QMessageBox::warning(this, tr("BOM"), QString::fromStdString(r.error()));
}

void MainWindow::showSummary() {
  if (!doc_->hasBoard()) return;
  auto* dlg = new QDialog(this);
  dlg->setWindowTitle(tr("Сводная информация"));
  dlg->resize(760, 600);
  auto* lay = new QVBoxLayout(dlg);
  auto* text = new QPlainTextEdit(dlg);
  text->setReadOnly(true);
  text->setFont(QFontDatabase::systemFont(QFontDatabase::FixedFont));
  text->setPlainText(QString::fromStdString(io::routingReport(*doc_->board())));
  lay->addWidget(text);
  dlg->setAttribute(Qt::WA_DeleteOnClose);
  dlg->show();
}

void MainWindow::showHotkeys() {
  auto* dlg = new QDialog(this);
  dlg->setWindowTitle(tr("Горячие клавиши"));
  dlg->resize(640, 700);
  auto* lay = new QVBoxLayout(dlg);
  auto* table = new QTableWidget(dlg);
  table->setColumnCount(2);
  table->setHorizontalHeaderLabels({tr("Имя команды"), tr("Назначено")});
  table->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
  table->verticalHeader()->hide();
  table->setEditTriggers(QAbstractItemView::NoEditTriggers);
  QString group;
  for (auto& i : cmds_->all()) {
    QAction* a = (*cmds_)[i.id];
    if (i.group.isEmpty() || a->shortcuts().isEmpty()) continue;
    int row = table->rowCount();
    if (i.group != group) {
      group = i.group;
      table->insertRow(row);
      auto* g = new QTableWidgetItem(group);
      QFont f = g->font();
      f.setBold(true);
      g->setFont(f);
      table->setItem(row, 0, g);
      ++row;
    }
    table->insertRow(row);
    QStringList keys;
    for (auto& k : a->shortcuts()) keys << k.toString(QKeySequence::NativeText);
    table->setItem(row, 0, new QTableWidgetItem(QString(a->text()).remove('&')));
    table->setItem(row, 1, new QTableWidgetItem(keys.join(", ")));
  }
  lay->addWidget(table);
  dlg->setAttribute(Qt::WA_DeleteOnClose);
  dlg->show();
}

// ---------------------------------------------------------------- tools

void MainWindow::runDrc() {
  if (!doc_->hasBoard()) return;
  auto v = xr::runDrc(*doc_->board());
  showHint(tr("DRC: нарушений — %1").arg(v.size()));
  doc_->setDrc(std::move(v));
}

void MainWindow::clearRouting() {
  if (!doc_->hasBoard()) return;
  auto before = doc_->beginEdit();
  doc_->board()->clearRouting(true);
  doc_->commitEdit(before, tr("Удалить разводку"));
}

void MainWindow::pour(bool fill, bool clear, const QString& title) {
  if (!doc_->hasBoard()) return;
  auto before = doc_->beginEdit();
  if (clear) clearZoneFills(*doc_->board());
  if (fill) {
    auto st = fillZones(*doc_->board());
    showHint(tr("Залито областей: %1, полигонов: %2, удалено островков: %3")
                 .arg(st.zones)
                 .arg(st.polygons)
                 .arg(st.islandsRemoved));
  }
  doc_->commitEdit(before, title);
}

void MainWindow::pourSelected(int how) {
  if (!doc_->hasBoard()) return;
  Board& b = *doc_->board();
  std::vector<int> zones;
  for (ItemRef r : doc_->selectedItems())
    if (r.type == ItemType::Zone) zones.push_back(r.index);
  if (zones.empty()) {
    showHint(tr("Выделите области металлизации"));
    return;
  }
  auto before = doc_->beginEdit();
  ZoneFillOptions o;
  for (int z : zones) {
    // Z toggles: filled areas lose their fill, empty ones are poured.
    bool filled = !b.zones[z].filled.empty();
    if (how != 0 || filled) b.zones[z].filled.clear();
    if (how == 2 || (how == 0 && !filled)) o.only.push_back(z);
  }
  if (!o.only.empty()) fillZones(b, o);
  doc_->commitEdit(before, how == 1 ? tr("Удалить заливку") : how == 2 ? tr("Перезалить") : tr("Залить"));
}

void MainWindow::showContextMenu(QPoint globalPos) {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  QMenu m(this);
  Commands& c = *cmds_;
  // In a tool the menu offers the way back first.
  if (view_->mode() != Mode::Select) {
    m.addAction(tr("Вернуться в основной режим редактора"), this, [this] {
      view_->cancelTool();
      view_->setMode(Mode::Select);
    });
    m.exec(globalPos);
    return;
  }
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  bool tracks = false, vias = false, zones = false, pads = false;
  int net = kNoNet;
  for (ItemRef r : items) {
    tracks |= r.type == ItemType::Track;
    vias |= r.type == ItemType::Via;
    zones |= r.type == ItemType::Zone;
    pads |= r.type == ItemType::Pad;
    if (net == kNoNet) net = itemNet(b, r);
  }
  c.fill(&m, {"Accel_Cut", "Accel_Copy", "Accel_Duplicate", "Accel_Paste", "Accel_Delete"});
  if (!items.empty() || !comps.empty()) m.addSeparator();
  if (tracks) m.addAction(tr("Выделить весь проводник"), view_, &BoardView::selectWire);
  if (tracks || vias || pads || zones) m.addAction(tr("Выделить всю цепь"), view_, &BoardView::selectNet);
  if (tracks || vias || !comps.empty()) m.addAction(c["Accel_Fix"]);
  if (tracks) m.addAction(c["Accel_Width"]);
  if (!comps.empty()) {
    c.fill(m.addMenu(tr("Повернуть")), {"Accel_RotateLeft", "Accel_RotateRight", "Cmd_RotateAngle"});
    c.fill(m.addMenu(tr("Перевернуть")), {"Accel_FlipHorizontally", "Accel_FlipVertically"});
  }
  if (zones) c.fill(&m, {"Accel_Pour", "Accel_UnPourWithRestore", "Cmd_RePour"});
  if (net != kNoNet) {
    m.addSeparator();
    QString name = QString::fromStdString(b.nets[net].name);
    m.addAction(tr("Задать для цепи особый цвет..."), this, [this, name] {
      QColor col = QColorDialog::getColor(Qt::red, this, tr("Особый цвет цепи %1").arg(name));
      if (!col.isValid()) return;
      auto& list = doc_->display().netColors;
      std::erase_if(list, [&](const NetColor& nc) { return nc.net == name.toStdString(); });
      list.push_back({name.toStdString(), uint32_t(col.rgb() & 0xffffff)});
      doc_->display().colorNets = true;
      doc_->displayChanged();
    });
    m.addAction(tr("Сбросить особые цвета цепей"), this, [this] {
      doc_->display().netColors.clear();
      doc_->displayChanged();
    });
    m.addAction(tr("Добавить в фильтр отображения связей"), this, [this, name] {
      auto& list = doc_->display().netlineNets;
      if (!std::ranges::contains(list, name.toStdString())) list.push_back(name.toStdString());
      doc_->display().filterNetlines = true;
      doc_->displayChanged();
    });
    m.addAction(tr("Очистить фильтр отображения связей"), this, [this] {
      doc_->display().netlineNets.clear();
      doc_->display().filterNetlines = false;
      doc_->displayChanged();
    });
  }
  // Autoprocedures, with their sub-modes.
  m.addSeparator();
  auto group = [&](const QString& title, const QString& id) {
    QMenu* sub = m.addMenu(title);
    for (const QString& s : c.group(id)->subs) sub->addAction(c[s]);
  };
  group(tr("Рассчитать форму проводников"), "Accel_RecalcWires");
  group(tr("Переложить проводники"), "Accel_RefineWires");
  group(tr("Выполнить подвижку"), "Accel_AutoStart");
  m.exec(globalPos);
}

void MainWindow::describeSelection() {
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  auto items = doc_->selectedItems();
  auto comps = doc_->selectedComponents();
  Unit u = doc_->unit();
  auto len = [&](double nm) { return formatLength(nm, u, 3); };
  auto netName = [&](int n) { return n >= 0 ? QString::fromStdString(b.nets[n].name) : tr("(без цепи)"); };
  QString text;
  if (items.size() == 1 && comps.empty()) {
    ItemRef r = items[0];
    switch (r.type) {
      case ItemType::Track: {
        // TopoR's Status_Wire: «%1 Сегмент: dx:%2, dy:%3. Длина сегмента: %4 [%5]».
        const Track& t = b.tracks[r.index];
        Vec2 d = t.b.v() - t.a.v();
        double l = t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : d.len();
        text = tr("%1 Сегмент: dx:%2, dy:%3. Длина сегмента: %4 [%5]")
                   .arg(netName(t.net), len(std::abs(d.x)), len(std::abs(d.y)), len(l), unitName(u));
        break;
      }
      case ItemType::Via: text = tr("Переход, цепь %1").arg(netName(b.vias[r.index].net)); break;
      case ItemType::Pad: text = tr("Контакт %1, цепь %2").arg(QString::fromStdString(b.pads[r.index].number), netName(b.pads[r.index].net)); break;
      case ItemType::Zone: text = tr("Область металлизации, цепь %1").arg(netName(b.zones[r.index].net)); break;
    }
  } else if (comps.size() == 1 && items.size() <= 1) {
    const Component& c = b.components[comps[0]];
    text = tr("Компонент %1 %2").arg(QString::fromStdString(c.ref), QString::fromStdString(c.value));
  } else if (!items.empty() || !comps.empty()) {
    text = tr("Выделено объектов: %1").arg(items.size() + comps.size());
  }
  hint_ = text;
  stHint_->setText(text);
}

AutorouteWindow* MainWindow::autorouteWindow() {
  if (!autoroute_) {
    autoroute_ = new AutorouteWindow(doc_, this);
    // Variants go next to the project (or the design) and into «Варианты автотрассировки».
    autoroute_->setProjectHooks(
        [this] { return project_ ? project_->dir() : QFileInfo(doc_->path()).absolutePath(); },
        [this](const QString& f) {
          if (!project_) return;
          project_->add(f, true);
          saveProject();
          projectPanel_->refresh();
        });
  }
  return autoroute_;
}

void MainWindow::autoroute() {
  if (!doc_->hasBoard()) return;
  AutorouteWindow* w = autorouteWindow();
  w->show();
  w->raise();
  w->activateWindow();
}

void MainWindow::optimize(bool components) {
  if (!doc_->hasBoard()) return;
  auto work = std::make_shared<Board>(*doc_->board());
  cancel_ = std::make_shared<std::atomic<bool>>(false);
  auto* dlg = new QProgressDialog(tr("Подвижка..."), tr("Остановить"), 0, 100, this);
  dlg->setWindowModality(Qt::WindowModal);
  dlg->setMinimumDuration(300);
  auto cancel = cancel_;
  connect(dlg, &QProgressDialog::canceled, this, [cancel] { cancel->store(true); });
  auto* watcher = new QFutureWatcher<topo::OptimizeResult>(this);
  connect(watcher, &QFutureWatcher<topo::OptimizeResult>::finished, this, [this, watcher, dlg, work] {
    topo::OptimizeResult res = watcher->result();
    dlg->close();
    dlg->deleteLater();
    watcher->deleteLater();
    auto before = doc_->beginEdit();
    Board& b = *doc_->board();
    b.components = work->components;
    b.pads = work->pads;
    b.tracks = work->tracks;
    b.vias = work->vias;
    doc_->commitEdit(before, tr("Подвижка"));
    doc_->clearLog(tr("Подвижка"));
    for (auto& l : res.log) doc_->addLog({LogMessage::Kind::Info, tr("Подвижка"), QString::fromStdString(l)});
    showHint(tr("Подвижка: переходов %1, компонентов %2; конфликтов %3 → %4; длина %5 → %6 мм")
                 .arg(res.viaMoves)
                 .arg(res.componentMoves)
                 .arg(res.conflictsBefore)
                 .arg(res.conflictsAfter)
                 .arg(res.lengthBefore / 1e6, 0, 'f', 1)
                 .arg(res.lengthAfter / 1e6, 0, 'f', 1),
             10000);
  });
  QPointer<QProgressDialog> dp(dlg);
  watcher->setFuture(QtConcurrent::run([work, components, cancel, dp] {
    topo::OptimizeOptions o;
    o.components = components;
    o.cancel = cancel.get();
    o.progress = [dp](int done, int total, const std::string& stage) {
      QMetaObject::invokeMethod(qApp, [dp, done, total, stage] {
        if (!dp) return;
        dp->setLabelText(QString::fromStdString(stage));
        dp->setValue(total ? done * 100 / total : 0);
      }, Qt::QueuedConnection);
    };
    return topo::optimize(*work, o);
  }));
}

}  // namespace xr::gui
