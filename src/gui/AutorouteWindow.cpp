#include "gui/AutorouteWindow.h"

#include <QApplication>
#include <QCheckBox>
#include <QDoubleSpinBox>
#include <QFileInfo>
#include <QFormLayout>
#include <QGroupBox>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QLabel>
#include <QMessageBox>
#include <QPainter>
#include <QPointer>
#include <QProgressBar>
#include <QPushButton>
#include <QRadioButton>
#include <QSpinBox>
#include <QTabWidget>
#include <QTableWidget>
#include <QTreeWidget>
#include <QVBoxLayout>
#include <QtConcurrent/QtConcurrent>

#include "drc/Drc.h"
#include "io/BoardIO.h"

namespace xr::gui {

namespace {

constexpr int kMaxVariants = 12;  // beyond this TopoR advises to stop the search

// Strategies tried one after the other: via cost factor and extra rip-up passes.
struct Strategy {
  double viaCost;
  int extraPasses;
  bool soft;
};
const Strategy kStrategies[] = {{1, 0, false}, {0.5, 2, false}, {2, 0, false},  {1.5, 4, false},
                                {3, 2, false}, {1, 0, true},    {0.75, 6, false}, {4, 4, false}};

QIcon dot(QColor c) {
  QPixmap pm(10, 10);
  pm.fill(Qt::transparent);
  QPainter p(&pm);
  p.setRenderHint(QPainter::Antialiasing);
  p.setBrush(c);
  p.setPen(Qt::NoPen);
  p.drawEllipse(1, 1, 8, 8);
  return QIcon(pm);
}

}  // namespace

AutorouteWindow::AutorouteWindow(Document* doc, QWidget* parent) : QDialog(parent), doc_(doc) {
  setWindowTitle(tr("Автотрассировка"));
  setModal(false);
  resize(900, 520);
  auto* v = new QVBoxLayout(this);
  auto* tabs = new QTabWidget(this);
  v->addWidget(tabs, 1);

  // «Варианты»
  auto* page = new QWidget;
  auto* pv = new QVBoxLayout(page);
  hint_ = new QLabel(tr("Для запуска автоматической трассировки нажмите Запустить"));
  hint_->setWordWrap(true);
  pv->addWidget(hint_);
  pv->addWidget(new QLabel(tr("<b>Варианты автотрассировки</b>")));
  table_ = new QTableWidget(0, 8);
  table_->setHorizontalHeaderLabels({tr("Имя"), tr("Длина"), tr("Переходов"), tr("Нарушений"), tr("Подрезок"), tr("Таймер"),
                                     tr("Стоимость"), tr("Уровень")});
  table_->verticalHeader()->hide();
  table_->setSelectionBehavior(QAbstractItemView::SelectRows);
  table_->setSelectionMode(QAbstractItemView::SingleSelection);
  table_->setEditTriggers(QAbstractItemView::NoEditTriggers);
  table_->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
  pv->addWidget(table_, 1);
  auto* show = new QCheckBox(tr("Показывать процесс трассировки (может замедлить работу)"));
  show->setEnabled(false);
  pv->addWidget(show);
  addOpened_ = new QCheckBox(tr("Добавлять в проект вариант, открытый в редакторе"));
  pv->addWidget(addOpened_);
  auto* cost = new QHBoxLayout;
  cost->addWidget(new QLabel(tr("Стоимость = Длина + Переходов ×")));
  viaWeight_ = new QDoubleSpinBox;
  viaWeight_->setRange(0, 1000);
  viaWeight_->setValue(3.0);
  viaWeight_->setSuffix(tr(" мм/переход"));
  cost->addWidget(viaWeight_);
  cost->addStretch(1);
  auto* addAll = new QLabel(QString("<a href=\"#\">%1</a>").arg(tr("Добавить все варианты в проект")));
  cost->addWidget(addAll);
  pv->addLayout(cost);
  tabs->addTab(page, tr("Варианты"));

  // «Цепи»
  auto* netsPage = new QWidget;
  auto* nv = new QVBoxLayout(netsPage);
  nets_ = new QTreeWidget;
  nets_->setHeaderLabels({tr("Объект"), tr("Трассировать")});
  nv->addWidget(nets_, 1);
  auto* legend = new QHBoxLayout;
  legend->addWidget(new QLabel(tr("Обозначения:")));
  for (auto [c, t] : {std::pair{QColor(0x30, 0xa0, 0x30), tr("Цепь разведена полностью")},
                      std::pair{QColor(0xe0, 0xb0, 0x20), tr("Цепь разведена частично")},
                      std::pair{QColor(0xd0, 0x30, 0x30), tr("Цепь не разведена")}}) {
    auto* l = new QLabel;
    l->setPixmap(dot(c).pixmap(10, 10));
    legend->addWidget(l);
    legend->addWidget(new QLabel(t));
  }
  legend->addStretch(1);
  nv->addLayout(legend);
  tabs->addTab(netsPage, tr("Цепи"));

  // «Настройки»
  auto* settings = new QWidget;
  auto* sv = new QVBoxLayout(settings);
  auto* shape = new QGroupBox(tr("Форма проводников"));
  auto* shv = new QHBoxLayout(shape);
  shapeArcs_ = new QRadioButton(tr("С дугами"));
  auto* any = new QRadioButton(tr("Any-angle"));
  auto* deg45 = new QRadioButton(tr("Под 45°"));
  shapeArcs_->setChecked(true);
  any->setEnabled(false);
  deg45->setEnabled(false);
  for (auto* r : {shapeArcs_, any, deg45}) shv->addWidget(r);
  shv->addStretch(1);
  sv->addWidget(shape);
  auto* basic = new QGroupBox(tr("Основные настройки"));
  auto* bv = new QVBoxLayout(basic);
  auto* direct = new QCheckBox(tr("Разрешить соединять планарные контакты напрямую"));
  auto* swap = new QCheckBox(tr("Переназначать функционально эквивалентные контакты компонентов"));
  direct->setEnabled(false);
  swap->setEnabled(false);
  bv->addWidget(direct);
  bv->addWidget(swap);
  auto* single = new QHBoxLayout;
  singleLayer_ = new QCheckBox(tr("Однослойная трассировка"));
  singleTop_ = new QRadioButton(tr("на верхнем слое"));
  auto* singleBottom = new QRadioButton(tr("на нижнем слое"));
  singleTop_->setChecked(true);
  single->addWidget(singleLayer_);
  single->addWidget(singleTop_);
  single->addWidget(singleBottom);
  single->addStretch(1);
  bv->addLayout(single);
  sv->addWidget(basic);
  auto* advanced = new QGroupBox(tr("Дополнительные настройки (только для опытных пользователей)"));
  auto* av = new QFormLayout(advanced);
  auto* relaxed = new QCheckBox(tr("Ослабленный контроль зазоров"));
  relaxed->setEnabled(false);
  av->addRow(relaxed);
  keepRouting_ = new QCheckBox(tr("Использовать имеющуюся разводку в качестве начального варианта"));
  av->addRow(keepRouting_);
  auto* noPull = new QCheckBox(tr("Не дотягивать проводник до точки привязки полигонального контакта"));
  noPull->setEnabled(false);
  av->addRow(noPull);
  passes_ = new QSpinBox;
  passes_->setRange(1, 50);
  av->addRow(tr("Проходов перекладки:"), passes_);
  viaCost_ = new QDoubleSpinBox;
  viaCost_->setRange(0, 100);
  viaCost_->setSuffix(tr(" мм"));
  av->addRow(tr("Стоимость перехода:"), viaCost_);
  optimize_ = new QSpinBox;
  optimize_->setRange(0, 10);
  av->addRow(tr("Итераций подвижки переходов:"), optimize_);
  pour_ = new QCheckBox(tr("Перезаливать области металлизации"));
  av->addRow(pour_);
  sv->addWidget(advanced);
  auto* defaults = new QPushButton(tr("По умолчанию"));
  auto* dl = new QHBoxLayout;
  dl->addStretch(1);
  dl->addWidget(defaults);
  sv->addLayout(dl);
  sv->addStretch(1);
  tabs->addTab(settings, tr("Настройки"));

  // Current operation and buttons.
  auto* op = new QHBoxLayout;
  operation_ = new QLabel(tr("Текущая операция:"));
  progress_ = new QProgressBar;
  progress_->setRange(0, 100);
  op->addWidget(operation_, 1);
  op->addWidget(progress_, 1);
  v->addLayout(op);
  auto* buttons = new QHBoxLayout;
  startButton_ = new QPushButton(tr("Запустить"));
  stopButton_ = new QPushButton(tr("Остановить"));
  openButton_ = new QPushButton(tr("Открыть в редакторе"));
  auto* close = new QPushButton(tr("Закрыть"));
  buttons->addStretch(1);
  for (auto* b : {startButton_, stopButton_, openButton_, close}) buttons->addWidget(b);
  v->addLayout(buttons);

  connect(startButton_, &QPushButton::clicked, this, &AutorouteWindow::start);
  connect(stopButton_, &QPushButton::clicked, this, &AutorouteWindow::stop);
  connect(openButton_, &QPushButton::clicked, this, [this] { openInEditor(table_->currentRow()); });
  connect(table_, &QTableWidget::cellDoubleClicked, this, [this](int row, int) { openInEditor(row); });
  connect(close, &QPushButton::clicked, this, &QDialog::hide);
  connect(defaults, &QPushButton::clicked, this, &AutorouteWindow::setDefaults);
  connect(viaWeight_, &QDoubleSpinBox::valueChanged, this, &AutorouteWindow::refreshTable);
  connect(addAll, &QLabel::linkActivated, this, [this] {
    if (!addToProject_) {
      QMessageBox::information(this, windowTitle(), tr("Дизайн открыт без проекта."));
      return;
    }
    for (auto& v : variants_)
      if (QString f = saveVariant(v); !f.isEmpty()) addToProject_(f);
  });
  connect(nets_, &QTreeWidget::itemChanged, this, [this](QTreeWidgetItem* it, int col) {
    // «Все цепи» switches every net.
    if (col != 1 || it != nets_->topLevelItem(0)) return;
    QSignalBlocker block(nets_);
    for (int i = 0; i < it->childCount(); ++i) it->child(i)->setCheckState(1, it->checkState(1));
  });
  connect(doc_, &Document::boardReplaced, this, [this] {
    stop();
    resetVariants();
    fillNets();
  });
  setDefaults();
  fillNets();
  setRunning(false);
}

AutorouteWindow::~AutorouteWindow() {
  if (cancel_) cancel_->store(true);
  if (watcher_) watcher_->waitForFinished();
}

void AutorouteWindow::setProjectHooks(std::function<QString()> dir, std::function<void(const QString&)> add) {
  projectDir_ = std::move(dir);
  addToProject_ = std::move(add);
}

void AutorouteWindow::setDefaults() {
  topo::RouterOptions d;
  passes_->setValue(d.maxPasses);
  viaCost_->setValue(d.viaCost);
  optimize_->setValue(d.optimizeIterations);
  pour_->setChecked(d.fillZones);
  keepRouting_->setChecked(!d.ripupExisting);
  singleLayer_->setChecked(false);
  shapeArcs_->setChecked(true);
}

void AutorouteWindow::fillNets() {
  QSignalBlocker block(nets_);
  nets_->clear();
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  auto* all = new QTreeWidgetItem(nets_, {tr("Все цепи:")});
  all->setCheckState(1, Qt::Checked);
  std::vector<int> pins(b.nets.size(), 0), open(b.nets.size(), 0);
  for (auto& p : b.pads)
    if (p.net >= 0) pins[size_t(p.net)]++;
  for (auto& r : doc_->connectivity().ratsnest) open[size_t(r.net)]++;
  for (int n = 0; n < int(b.nets.size()); ++n) {
    if (pins[size_t(n)] < 2) continue;
    auto* it = new QTreeWidgetItem(all, {QString::fromStdString(b.nets[size_t(n)].name)});
    it->setCheckState(1, Qt::Checked);
    int opened = open[size_t(n)];
    it->setIcon(0, dot(opened == 0                         ? QColor(0x30, 0xa0, 0x30)
                       : opened < pins[size_t(n)] - 1 ? QColor(0xe0, 0xb0, 0x20)
                                                       : QColor(0xd0, 0x30, 0x30)));
  }
  all->setExpanded(true);
  nets_->resizeColumnToContents(0);
}

topo::RouterOptions AutorouteWindow::options(int strategy) const {
  const Strategy& s = kStrategies[size_t(strategy) % std::size(kStrategies)];
  topo::RouterOptions o;
  o.maxPasses = passes_->value() + s.extraPasses;
  o.viaCost = viaCost_->value() * s.viaCost;
  o.softPlanarity = s.soft;
  o.optimizeIterations = optimize_->value();
  o.fillZones = pour_->isChecked();
  o.ripupExisting = !keepRouting_->isChecked();
  if (singleLayer_->isChecked()) {
    int n = doc_->board()->copperCount();
    o.copperIndices = {singleTop_->isChecked() ? 0 : n - 1};
    o.useVias = false;
  }
  QTreeWidgetItem* all = nets_->topLevelItem(0);
  if (all && all->checkState(1) != Qt::Checked)
    for (int i = 0; i < all->childCount(); ++i)
      if (all->child(i)->checkState(1) == Qt::Checked) o.nets.push_back(all->child(i)->text(0).toStdString());
  return o;
}

void AutorouteWindow::setRunning(bool on) {
  running_ = on;
  startButton_->setEnabled(!on && doc_->hasBoard());
  startButton_->setText(variants_.empty() ? tr("Запустить") : tr("Продолжить"));
  stopButton_->setEnabled(on);
  openButton_->setEnabled(!on && !variants_.empty());
  if (on) hint_->setText(tr("Поиск вариантов будет продолжаться, пока не будет остановлен"));
  else if (!variants_.empty())
    hint_->setText(tr("Для работы с результатами автотрассировки следует открыть один из вариантов в редакторе"));
}

void AutorouteWindow::resetVariants() {
  variants_.clear();
  refreshTable();
  setRunning(false);
}

void AutorouteWindow::start() {
  if (running_ || !doc_->hasBoard()) return;
  QTreeWidgetItem* all = nets_->topLevelItem(0);
  if (all && all->checkState(1) == Qt::Unchecked) {
    QMessageBox::warning(this, windowTitle(), tr("Не выбрано ни одной цепи для трассировки"));
    return;
  }
  auto base = std::make_shared<const Board>(*doc_->board());
  std::vector<topo::RouterOptions> plans;
  for (int s = int(variants_.size()); s < kMaxVariants; ++s) plans.push_back(options(s));
  cancel_ = std::make_shared<std::atomic<bool>>(false);
  setRunning(true);
  operation_->setText(tr("Текущая операция: Подготовка данных"));
  progress_->setValue(0);
  int first = int(variants_.size());
  QPointer<AutorouteWindow> self(this);
  auto cancel = cancel_;
  watcher_ = new QFutureWatcher<void>(this);
  connect(watcher_, &QFutureWatcher<void>::finished, this, [this] {
    watcher_->deleteLater();
    watcher_ = nullptr;
    operation_->setText(tr("Текущая операция:"));
    progress_->setValue(0);
    setRunning(false);
    if (int(variants_.size()) >= kMaxVariants) hint_->setText(tr("Поиск вариантов целесообразно остановить"));
    emit finished();
  });
  watcher_->setFuture(QtConcurrent::run([base, plans, cancel, self, first] {
    for (size_t i = 0; i < plans.size() && !cancel->load(); ++i) {
      Board work = *base;
      topo::RouterOptions o = plans[i];
      o.cancel = cancel.get();
      o.progress = [self, i, first](int done, int total, const std::string& stage) {
        QMetaObject::invokeMethod(qApp, [self, done, total, stage, i, first] {
          if (!self) return;
          self->operation_->setText(QObject::tr("Текущая операция: вариант %1 — %2")
                                        .arg(first + int(i) + 1)
                                        .arg(QString::fromStdString(stage)));
          self->progress_->setValue(total ? done * 100 / total : 0);
        }, Qt::QueuedConnection);
      };
      topo::RouterResult res = topo::routeBoard(work, o);
      if (res.cancelled) break;
      RoutingVariant v;
      v.name = QObject::tr("Вариант %1").arg(first + int(i) + 1);
      v.level = first + int(i) + 1;
      v.length = res.length;
      v.viaCount = res.vias;
      v.seconds = res.seconds;
      DrcOptions d;
      d.unconnected = false;
      v.violations = int(runDrc(work, d).size());
      v.unrouted = int(Connectivity::compute(work).ratsnest.size());
      v.tracks = std::move(work.tracks);
      v.vias = std::move(work.vias);
      v.zones = std::move(work.zones);
      QMetaObject::invokeMethod(qApp, [self, v = std::move(v)]() mutable {
        if (self) self->addVariant(std::move(v));
      }, Qt::QueuedConnection);
    }
  }));
}

void AutorouteWindow::stop() {
  if (cancel_) cancel_->store(true);
}

void AutorouteWindow::addVariant(RoutingVariant v) {
  variants_.push_back(std::move(v));
  refreshTable();
  emit variantFound(int(variants_.size()) - 1);
}

void AutorouteWindow::refreshTable() {
  table_->setRowCount(int(variants_.size()));
  Unit u = doc_->unit();
  // The best variant: fewest violations, then lowest cost.
  auto cost = [&](const RoutingVariant& v) { return v.length / kNmPerMm + v.viaCount * viaWeight_->value(); };
  int best = -1;
  for (int i = 0; i < int(variants_.size()); ++i) {
    auto key = [&](int k) { return std::pair{variants_[size_t(k)].violations + variants_[size_t(k)].unrouted, cost(variants_[size_t(k)])}; };
    if (best < 0 || key(i) < key(best)) best = i;
  }
  for (int i = 0; i < int(variants_.size()); ++i) {
    const RoutingVariant& v = variants_[size_t(i)];
    int secs = int(v.seconds);
    QStringList cells{v.name,
                      formatLength(v.length, u, 1) + " " + unitName(u),
                      QString::number(v.viaCount),
                      QString::number(v.violations + v.unrouted),
                      "0",
                      QString("%1:%2").arg(secs / 60, 2, 10, QChar('0')).arg(secs % 60, 2, 10, QChar('0')),
                      QString::number(cost(v), 'f', 1),
                      QString::number(v.level)};
    for (int c = 0; c < cells.size(); ++c) {
      auto* it = new QTableWidgetItem(cells[c]);
      if (i == best) {
        QFont f = it->font();
        f.setBold(true);
        it->setFont(f);
      }
      if (c == 3)
        it->setToolTip(tr("Нарушений DRC: %1, неразведённых связей: %2").arg(v.violations).arg(v.unrouted));
      table_->setItem(i, c, it);
    }
  }
}

QString AutorouteWindow::saveVariant(const RoutingVariant& v) {
  if (!projectDir_ || !doc_->hasBoard()) return {};
  Board b = *doc_->board();
  b.tracks = v.tracks;
  b.vias = v.vias;
  b.zones = v.zones;
  QString base = QFileInfo(doc_->path()).completeBaseName();
  QString file = projectDir_() + "/" + base + "_" + QString(v.name).replace(' ', '_') + ".fst";
  if (auto r = io::saveBoard(b, file.toStdString()); !r) {
    QMessageBox::warning(this, windowTitle(), QString::fromStdString(r.error()));
    return {};
  }
  return file;
}

void AutorouteWindow::openInEditor(int i) {
  if (i < 0 || i >= int(variants_.size()) || !doc_->hasBoard()) return;
  const RoutingVariant& v = variants_[size_t(i)];
  auto before = doc_->beginEdit();
  Board& b = *doc_->board();
  b.tracks = v.tracks;
  b.vias = v.vias;
  b.zones = v.zones;
  doc_->commitEdit(before, tr("Автотрассировка: %1").arg(v.name));
  doc_->clearLog(tr("Автотрассировка"));
  doc_->addLog({LogMessage::Kind::Info, tr("Автотрассировка"),
                tr("%1 открыт в редакторе: длина %2 мм, переходов %3, нарушений %4")
                    .arg(v.name)
                    .arg(v.length / kNmPerMm, 0, 'f', 1)
                    .arg(v.viaCount)
                    .arg(v.violations + v.unrouted)});
  if (addOpened_->isChecked() && addToProject_)
    if (QString f = saveVariant(v); !f.isEmpty()) addToProject_(f);
}

}  // namespace xr::gui
