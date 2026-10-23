#include "gui/MainWindow.h"

#include <QApplication>
#include <QDockWidget>
#include <QFileDialog>
#include <QFutureWatcher>
#include <QInputDialog>
#include <QLabel>
#include <QMenuBar>
#include <QMessageBox>
#include <QProgressDialog>
#include <QSettings>
#include <QStatusBar>
#include <QToolBar>
#include <QtConcurrent/QtConcurrent>

#include "gui/Panels.h"
#include "io/BoardIO.h"
#include "io/gerber/GerberWriter.h"
#include "io/svg/SvgWriter.h"
#include "core/ZoneFill.h"
#include "router/topo/Optimizer.h"
#include "router/topo/TopoRouter.h"

namespace xr::gui {

MainWindow::MainWindow() : doc_(new Document(this)), view_(new BoardView(doc_, this)) {
  setCentralWidget(view_);
  resize(1400, 900);
  buildMenus();
  buildDocks();
  coords_ = new QLabel(this);
  layerLabel_ = new QLabel(this);
  statusBar()->addPermanentWidget(layerLabel_);
  statusBar()->addPermanentWidget(coords_);
  connect(view_, &BoardView::cursorMoved, this, [this](Vec2 w) {
    coords_->setText(QString("X %1  Y %2 mm").arg(w.x / 1e6, 0, 'f', 3).arg(w.y / 1e6, 0, 'f', 3));
  });
  connect(view_, &BoardView::status, this, [this](const QString& s) { statusBar()->showMessage(s, 5000); });
  auto updLayer = [this] {
    if (!doc_->hasBoard()) { layerLabel_->clear(); return; }
    layerLabel_->setText(tr("Layer: %1").arg(QString::fromStdString(doc_->board()->layers[doc_->activeLayer()].name)));
  };
  connect(doc_, &Document::layersChanged, this, updLayer);
  connect(doc_, &Document::boardReplaced, this, [this, updLayer] { updateTitle(); updLayer(); });
  connect(doc_->undoStack(), &QUndoStack::cleanChanged, this, &MainWindow::updateTitle);
  updateTitle();
}

void MainWindow::buildMenus() {
  auto* file = menuBar()->addMenu(tr("&File"));
  file->addAction(tr("&Open..."), QKeySequence::Open, this, &MainWindow::open);
  file->addAction(tr("&Save"), QKeySequence::Save, this, &MainWindow::save);
  file->addAction(tr("Save &As..."), QKeySequence::SaveAs, this, &MainWindow::saveAs);
  file->addSeparator();
  file->addAction(tr("Import routing (.ses)..."), this, &MainWindow::importSes);
  file->addAction(tr("Export Gerber/Excellon..."), this, &MainWindow::exportGerber);
  file->addAction(tr("Export SVG..."), this, &MainWindow::exportSvg);
  file->addSeparator();
  file->addAction(tr("&Quit"), QKeySequence::Quit, qApp, &QApplication::quit);

  auto* edit = menuBar()->addMenu(tr("&Edit"));
  auto* undo = doc_->undoStack()->createUndoAction(this, tr("&Undo"));
  undo->setShortcut(QKeySequence::Undo);
  auto* redo = doc_->undoStack()->createRedoAction(this, tr("&Redo"));
  redo->setShortcut(QKeySequence::Redo);
  edit->addAction(undo);
  edit->addAction(redo);
  edit->addSeparator();
  edit->addAction(tr("&Delete"), QKeySequence::Delete, view_, &BoardView::deleteSelection);
  edit->addAction(tr("Rotate 90°"), QKeySequence(Qt::SHIFT | Qt::Key_Space), view_, [this] { view_->rotateSelection(90); });
  edit->addAction(tr("Rotate -90°"), QKeySequence(Qt::Key_Space), view_, [this] { view_->rotateSelection(-90); });
  edit->addAction(tr("Track &width..."), QKeySequence(Qt::Key_W), view_, &BoardView::changeTrackWidth);

  auto* viewMenu = menuBar()->addMenu(tr("&View"));
  viewMenu->addAction(tr("Fit board"), QKeySequence(Qt::CTRL | Qt::Key_B), view_, &BoardView::fitBoard);
  viewMenu->addAction(tr("Zoom in"), QKeySequence::ZoomIn, view_, [this] { view_->zoomBy(1.25); });
  viewMenu->addAction(tr("Zoom out"), QKeySequence::ZoomOut, view_, [this] { view_->zoomBy(0.8); });
  auto* rats = viewMenu->addAction(tr("Ratsnest"), QKeySequence(Qt::Key_N), view_, &BoardView::setRatsnestVisible);
  rats->setCheckable(true);
  rats->setChecked(true);
  auto* only = viewMenu->addAction(tr("Only active copper layer"), QKeySequence(Qt::SHIFT | Qt::Key_S), view_,
                                   &BoardView::setOnlyActiveLayer);
  only->setCheckable(true);

  auto* tools = menuBar()->addMenu(tr("&Tools"));
  auto* sel = tools->addAction(tr("Select / move"), QKeySequence(Qt::Key_Escape), view_, [this] { view_->setMode(Mode::Select); });
  auto* route = tools->addAction(tr("Route tracks"), QKeySequence(Qt::Key_R), view_, [this] { view_->setMode(Mode::Route); });
  auto* via = tools->addAction(tr("Place vias"), QKeySequence(Qt::Key_V), view_, [this] { view_->setMode(Mode::Via); });
  for (auto* a : {sel, route, via}) a->setCheckable(true);
  sel->setChecked(true);
  connect(view_, &BoardView::modeChanged, this, [=](Mode m) {
    sel->setChecked(m == Mode::Select);
    route->setChecked(m == Mode::Route);
    via->setChecked(m == Mode::Via);
  });
  tools->addSeparator();
  auto* free = tools->addAction(tr("Any angle"), view_, [this] { view_->setRouteAngle(RouteAngle::Free); });
  auto* deg45 = tools->addAction(tr("45° (O)"), view_, [this] { view_->setRouteAngle(RouteAngle::Deg45); });
  auto* arcs = tools->addAction(tr("Arcs (A)"), view_, [this] { view_->setRouteAngle(RouteAngle::Arc); });
  for (auto* a : {free, deg45, arcs}) a->setCheckable(true);
  free->setChecked(true);
  tools->addSeparator();
  tools->addAction(tr("Next layer (L)"), view_, &BoardView::toggleLayer);
  tools->addAction(tr("Recompute track shapes"), QKeySequence(Qt::Key_F5), view_, &BoardView::recomputeShapes);
  tools->addSeparator();
  tools->addAction(tr("&DRC"), QKeySequence(Qt::Key_F9), this, &MainWindow::runDrc);

  auto* routeMenu = menuBar()->addMenu(tr("&Route"));
  routeMenu->addAction(tr("&Autoroute..."), QKeySequence(Qt::Key_F10), this, &MainWindow::autoroute);
  routeMenu->addAction(tr("Move &vias (optimise)"), QKeySequence(Qt::Key_F7), this, [this] { optimize(false); });
  routeMenu->addAction(tr("Move vias and &components"), QKeySequence(Qt::SHIFT | Qt::Key_F7), this, [this] { optimize(true); });
  routeMenu->addAction(tr("&Clear routing"), this, &MainWindow::clearRouting);
  routeMenu->addSeparator();
  routeMenu->addAction(tr("&Pour zones"), QKeySequence(Qt::Key_Z), this, [this] {
    if (!doc_->hasBoard()) return;
    auto before = doc_->beginEdit();
    auto st = fillZones(*doc_->board());
    commitZones(before, tr("Pour zones"));
    statusBar()->showMessage(tr("Poured %1 zone(s): %2 polygon(s), %3 island(s) removed")
                                 .arg(st.zones).arg(st.polygons).arg(st.islandsRemoved), 5000);
  });
  routeMenu->addAction(tr("Remove zone fills"), QKeySequence(Qt::SHIFT | Qt::Key_Z), this, [this] {
    if (!doc_->hasBoard()) return;
    auto before = doc_->beginEdit();
    clearZoneFills(*doc_->board());
    commitZones(before, tr("Remove zone fills"));
  });

  auto* tb = addToolBar(tr("Tools"));
  tb->addAction(sel);
  tb->addAction(route);
  tb->addAction(via);
  tb->addSeparator();
  tb->addAction(free);
  tb->addAction(deg45);
  tb->addAction(arcs);
  tb->addSeparator();
  tb->addAction(undo);
  tb->addAction(redo);
  // Angle mode radio behaviour
  connect(free, &QAction::triggered, this, [=] { free->setChecked(true); deg45->setChecked(false); arcs->setChecked(false); });
  connect(deg45, &QAction::triggered, this, [=] { free->setChecked(false); deg45->setChecked(true); arcs->setChecked(false); });
  connect(arcs, &QAction::triggered, this, [=] { free->setChecked(false); deg45->setChecked(false); arcs->setChecked(true); });
}

void MainWindow::buildDocks() {
  auto dock = [this](const QString& title, QWidget* w, Qt::DockWidgetArea area) {
    auto* d = new QDockWidget(title, this);
    d->setWidget(w);
    addDockWidget(area, d);
    return d;
  };
  dock(tr("Layers"), new LayersPanel(doc_, this), Qt::RightDockWidgetArea);
  dock(tr("Nets"), new NetsPanel(doc_, this), Qt::RightDockWidgetArea);
  dock(tr("Properties"), new PropertiesPanel(doc_, this), Qt::RightDockWidgetArea);
  auto* drc = new DrcPanel(doc_, view_, this);
  connect(drc, &DrcPanel::runRequested, this, &MainWindow::runDrc);
  dock(tr("DRC"), drc, Qt::BottomDockWidgetArea);
}

void MainWindow::updateTitle() {
  QString t = "XrTopoR";
  if (doc_->hasBoard()) t = QFileInfo(doc_->path()).fileName() + (doc_->undoStack()->isClean() ? "" : " *") + " - " + t;
  setWindowTitle(t);
}

bool MainWindow::openFile(const QString& path) {
  auto r = io::loadBoard(path.toStdString());
  if (!r) {
    QMessageBox::warning(this, tr("Open"), QString::fromStdString(r.error()));
    return false;
  }
  doc_->setBoard(std::move(*r), path);
  statusBar()->showMessage(tr("Loaded %1").arg(path), 5000);
  QSettings().setValue("lastFile", QFileInfo(path).absoluteFilePath());
  return true;
}

bool MainWindow::openLastFile() {
  QString last = QSettings().value("lastFile").toString();
  if (last.isEmpty() || !QFileInfo::exists(last)) return false;
  return openFile(last);
}

void MainWindow::open() {
  QString f = QFileDialog::getOpenFileName(this, tr("Open board"), {},
                                           tr("Boards (*.kicad_pcb *.dsn *.pcb *.PCB *.fst);;All files (*)"));
  if (!f.isEmpty()) openFile(f);
}

void MainWindow::save() {
  if (!doc_->hasBoard()) return;
  QString p = doc_->path();
  if (p.isEmpty() || io::detectFormat(p.toStdString()) == io::Format::Unknown) { saveAs(); return; }
  auto r = io::saveBoard(*doc_->board(), p.toStdString());
  if (!r) QMessageBox::warning(this, tr("Save"), QString::fromStdString(r.error()));
  else {
    doc_->undoStack()->setClean();
    statusBar()->showMessage(tr("Saved %1").arg(p), 5000);
  }
}

void MainWindow::saveAs() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getSaveFileName(this, tr("Save board as"), doc_->path(),
                                           tr("KiCad board (*.kicad_pcb);;TopoR PCB (*.fst);;P-CAD ASCII (*.pcb);;Specctra design (*.dsn);;Specctra session (*.ses)"));
  if (f.isEmpty()) return;
  auto r = io::saveBoard(*doc_->board(), f.toStdString());
  if (!r) QMessageBox::warning(this, tr("Save"), QString::fromStdString(r.error()));
  else statusBar()->showMessage(tr("Saved %1").arg(f), 5000);
}

void MainWindow::importSes() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getOpenFileName(this, tr("Import session"), {}, tr("Specctra session (*.ses)"));
  if (f.isEmpty()) return;
  auto text = io::readFile(f.toStdString());
  if (!text) { QMessageBox::warning(this, tr("Import"), QString::fromStdString(text.error())); return; }
  auto before = doc_->beginEdit();
  if (auto r = io::applySes(*doc_->board(), *text); !r) {
    QMessageBox::warning(this, tr("Import"), QString::fromStdString(r.error()));
    return;
  }
  doc_->commitEdit(before, tr("Import session"));
}

void MainWindow::exportGerber() {
  if (!doc_->hasBoard()) return;
  QString d = QFileDialog::getExistingDirectory(this, tr("Gerber output folder"));
  if (d.isEmpty()) return;
  auto r = io::writeGerbers(*doc_->board(), d.toStdString());
  if (!r) QMessageBox::warning(this, tr("Gerber"), QString::fromStdString(r.error()));
  else statusBar()->showMessage(tr("Gerbers written to %1").arg(d), 5000);
}

void MainWindow::exportSvg() {
  if (!doc_->hasBoard()) return;
  QString f = QFileDialog::getSaveFileName(this, tr("Export SVG"), {}, tr("SVG (*.svg)"));
  if (f.isEmpty()) return;
  auto r = io::writeFile(f.toStdString(), io::writeSvg(*doc_->board()));
  if (!r) QMessageBox::warning(this, tr("SVG"), QString::fromStdString(r.error()));
}

void MainWindow::runDrc() {
  if (!doc_->hasBoard()) return;
  auto v = xr::runDrc(*doc_->board());
  statusBar()->showMessage(tr("DRC: %1 violation(s)").arg(v.size()), 5000);
  doc_->setDrc(std::move(v));
}

void MainWindow::clearRouting() {
  if (!doc_->hasBoard()) return;
  auto before = doc_->beginEdit();
  doc_->board()->clearRouting(true);
  doc_->commitEdit(before, tr("Clear routing"));
}

void MainWindow::autoroute() {
  if (!doc_->hasBoard()) return;
  bool ok = false;
  int passes = QInputDialog::getInt(this, tr("Autoroute"), tr("Rip-up passes:"), 6, 1, 50, 1, &ok);
  if (!ok) return;
  double viaCost = QInputDialog::getDouble(this, tr("Autoroute"), tr("Via cost, mm of track:"), 3.0, 0.0, 100.0, 1, &ok);
  if (!ok) return;

  auto work = std::make_shared<Board>(*doc_->board());  // routed in a worker thread
  cancel_ = std::make_shared<std::atomic<bool>>(false);
  auto* dlg = new QProgressDialog(tr("Routing..."), tr("Cancel"), 0, 100, this);
  dlg->setWindowModality(Qt::WindowModal);
  dlg->setMinimumDuration(0);
  dlg->setValue(0);
  auto cancel = cancel_;
  connect(dlg, &QProgressDialog::canceled, this, [cancel] { cancel->store(true); });

  auto* watcher = new QFutureWatcher<topo::RouterResult>(this);
  connect(watcher, &QFutureWatcher<topo::RouterResult>::finished, this, [this, watcher, dlg, work] {
    topo::RouterResult res = watcher->result();
    dlg->close();
    dlg->deleteLater();
    watcher->deleteLater();
    auto before = doc_->beginEdit();
    Board& b = *doc_->board();
    b.tracks = work->tracks;
    b.vias = work->vias;
    b.zones = work->zones;
    doc_->commitEdit(before, tr("Autoroute"));
    QString log;
    for (auto& l : res.log) log += QString::fromStdString(l) + "\n";
    QMessageBox::information(this, tr("Autoroute"),
                             tr("Routed %1 of %2 connections, %3 vias, length %4 mm, %5 s\n\n%6")
                                 .arg(res.routed).arg(res.connections).arg(res.vias)
                                 .arg(res.length / 1e6, 0, 'f', 1).arg(res.seconds, 0, 'f', 2).arg(log));
  });
  QPointer<QProgressDialog> dp(dlg);
  watcher->setFuture(QtConcurrent::run([work, passes, viaCost, cancel, dp] {
    topo::RouterOptions o;
    o.maxPasses = passes;
    o.viaCost = viaCost;
    o.cancel = cancel.get();
    o.progress = [dp](int done, int total, const std::string& stage) {
      QMetaObject::invokeMethod(qApp, [dp, done, total, stage] {
        if (!dp) return;
        dp->setLabelText(QString::fromStdString(stage));
        dp->setValue(total ? done * 100 / total : 0);
      }, Qt::QueuedConnection);
    };
    return topo::routeBoard(*work, o);
  }));
}

void MainWindow::optimize(bool components) {
  if (!doc_->hasBoard()) return;
  auto work = std::make_shared<Board>(*doc_->board());
  cancel_ = std::make_shared<std::atomic<bool>>(false);
  auto* dlg = new QProgressDialog(tr("Optimising..."), tr("Cancel"), 0, 100, this);
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
    doc_->commitEdit(before, tr("Optimise"));
    statusBar()->showMessage(tr("Moved %1 via(s), %2 component(s); conflicts %3 -> %4; length %5 -> %6 mm")
                                 .arg(res.viaMoves).arg(res.componentMoves).arg(res.conflictsBefore).arg(res.conflictsAfter)
                                 .arg(res.lengthBefore / 1e6, 0, 'f', 1).arg(res.lengthAfter / 1e6, 0, 'f', 1),
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

void MainWindow::commitZones(const EditSnapshot& before, const QString& title) {
  doc_->commitEdit(before, title);
}

}  // namespace xr::gui
