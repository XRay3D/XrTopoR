#include "gui/DesignParamsDialog.h"

#include <QCheckBox>
#include <QCollator>
#include <QComboBox>
#include <QDoubleSpinBox>
#include <QFileDialog>
#include <QFormLayout>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QInputDialog>
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QMessageBox>
#include <QScrollArea>
#include <QMenu>
#include <QPushButton>
#include <QSplitter>
#include <QStackedWidget>
#include <QTableWidget>
#include <QTextBrowser>
#include <QToolButton>
#include <QTreeWidget>
#include <QVBoxLayout>
#include <format>
#include <set>

#include "core/Padstack.h"
#include "core/ZoneFill.h"
#include "gui/PadstackDialogs.h"
#include "gui/Schemes.h"
#include "io/BoardIO.h"
#include "gui/SpinBox.h"

namespace xr::gui {

namespace {

const QColor kHeader(0x9d, 0x8f, 0xbf);

QString netsText(const RuleNets& n) {
  switch (n.kind) {
    case RuleNets::Kind::All: return QObject::tr("Все цепи");
    case RuleNets::Kind::Net: return QString::fromStdString(n.name);
    case RuleNets::Kind::Group: return QObject::tr("Группа: %1").arg(QString::fromStdString(n.name));
    case RuleNets::Kind::Signal: return QObject::tr("Сигнал: %1").arg(QString::fromStdString(n.name));
    case RuleNets::Kind::DiffSignal: return QObject::tr("Дифф. сигнал: %1").arg(QString::fromStdString(n.name));
    case RuleNets::Kind::SignalGroup: return QObject::tr("Группа сигналов: %1").arg(QString::fromStdString(n.name));
  }
  return {};
}

}  // namespace

DesignParamsDialog::DesignParamsDialog(Document* doc, QWidget* parent) : QDialog(parent), doc_(doc) {
  setWindowTitle(tr("Редактор параметров дизайна"));
  resize(1100, 640);
  auto* v = new QVBoxLayout(this);
  auto* vsplit = new QSplitter(Qt::Vertical, this);
  auto* hsplit = new QSplitter(Qt::Horizontal, vsplit);
  nav_ = new QTreeWidget(hsplit);
  nav_->setHeaderHidden(true);
  nav_->setRootIsDecorated(false);
  nav_->setIndentation(14);
  pages_ = new QStackedWidget(hsplit);
  hsplit->addWidget(nav_);
  hsplit->addWidget(pages_);
  hsplit->setSizes({230, 870});
  help_ = new QTextBrowser(vsplit);
  vsplit->addWidget(hsplit);
  vsplit->addWidget(help_);
  vsplit->setSizes({480, 110});
  v->addWidget(vsplit, 1);
  auto* buttons = new QHBoxLayout;
  auto* import = new QPushButton(tr("Импорт..."), this);
  applyButton_ = new QPushButton(tr("Применить"), this);
  resetButton_ = new QPushButton(tr("Сбросить"), this);
  auto* close = new QPushButton(tr("Закрыть"), this);
  buttons->addWidget(import);
  buttons->addStretch(1);
  buttons->addWidget(applyButton_);
  buttons->addWidget(resetButton_);
  buttons->addWidget(close);
  v->addLayout(buttons);
  applyButton_->setToolTip(tr("Применение изменений приведет к очистке журнала отката в редакторе топологии"));
  connect(import, &QPushButton::clicked, this, &DesignParamsDialog::importRules);
  connect(applyButton_, &QPushButton::clicked, this, &DesignParamsDialog::apply);
  connect(resetButton_, &QPushButton::clicked, this, [this] {
    load();
    rebuildPages();
  });
  connect(close, &QPushButton::clicked, this, [this] {
    if (dirty_) {
      auto r = QMessageBox::question(this, windowTitle(), tr("Применить изменения?"),
                                     QMessageBox::Yes | QMessageBox::No | QMessageBox::Cancel);
      if (r == QMessageBox::Cancel || (r == QMessageBox::Yes && !apply())) return;
    }
    accept();
  });

  // Navigation as in TopoR: plain pages, then the «Группы», «Правила», «High-speed правила» groups.
  auto page = [this](QTreeWidgetItem* parent, const QString& title, std::function<QWidget*()> make, const QString& help) {
    auto* it = parent ? new QTreeWidgetItem(parent, {title}) : new QTreeWidgetItem(nav_, {title});
    it->setData(0, Qt::UserRole, int(pageMakers_.size()));
    pageMakers_.push_back({title, std::move(make)});
    pageHelp_.push_back(help);
  };
  auto header = [this](const QString& title) {
    auto* it = new QTreeWidgetItem(nav_, {title});
    it->setFlags(Qt::ItemIsEnabled);
    it->setBackground(0, kHeader);
    it->setForeground(0, Qt::white);
    QFont f = it->font(0);
    f.setBold(true);
    it->setFont(0, f);
    return it;
  };
  page(nullptr, tr("Слои"), [this] { return layersPage(); }, tr("Слои дизайна: имя, сторона и тип."));
  page(nullptr, tr("Контактные площадки (КП)"), [this] { return padsPage(); }, tr("Стеки контактных площадок компонентов."));
  page(nullptr, tr("Переходные отверстия (ПО)"), [this] { return viaTypesPage(); },
       tr("Типы переходных отверстий. Изменение размеров типа меняет и переходы этого типа на плате."));
  page(nullptr, tr("Состав цепей (Netlist)"), [this] { return netlistPage(); }, tr("Цепи дизайна и число их контактов."));
  auto* groups = header(tr("Группы"));
  page(groups, tr("Группы цепей"), [this] { return netGroupsPage(); },
       tr("Группы цепей: правило, назначенное группе, действует для всех её цепей."));
  page(groups, tr("Группы компонентов"), [this] { return notSupported(tr("Группы компонентов")); }, {});
  page(groups, tr("Группы слоёв"), [this] { return notSupported(tr("Группы слоёв")); }, {});
  auto* rules = header(tr("Правила"));
  page(rules, tr("Ширина проводников"), [this] { return widthsPage(); },
       tr("Ширина проводников. Правила применяются по порядку: последующие правила имеют приоритет над "
          "предыдущими. Мин. — минимально допустимая ширина, Ном. — номинальная."));
  page(rules, tr("Зазор между проводниками"), [this] { return clearancesPage(); },
       tr("Зазоры между объектами цепей. Номинальный зазор выдерживается, где есть место, минимальный — в "
          "узких местах. Последующие правила имеют приоритет над предыдущими."));
  page(rules, tr("Зазор между компонентами"), [this] { return notSupported(tr("Зазор между компонентами")); }, {});
  page(rules, tr("Зазор до края платы"), [this] { return edgePage(); }, tr("Зазоры от проводников и компонентов до контура платы."));
  page(rules, tr("Назначение типов ПО"), [this] { return viaRulesPage(); },
       tr("Типы переходных отверстий, которые используются для цепей."));
  page(rules, tr("Цепи опорных слоёв"), [this] { return planesPage(); },
       tr("Цепь, металлизацией которой заполнен опорный слой."));
  page(rules, tr("Назначение цепей на слои"), [this] { return layerNetsPage(); },
       tr("Цепи, предназначенные для трассировки на слое (сохраняются в дизайне)."));
  auto* hs = header(tr("High-speed правила"));
  page(hs, tr("Волновое сопротивление"), [this] { return impedancesPage(); },
       tr("Ширины проводников по слоям (и зазор внутри пары для дифференциальных сигналов). Ширины и зазор "
          "застёгнутой пары проводников задаются только здесь."));
  page(hs, tr("Сигналы"), [this] { return diffSignalsPage(); }, tr("Дифференциальные сигналы: пары цепей, правило и допустимый разброс длин."));
  for (const QString& t : {tr("Выравнивание в группе"), tr("Взаимное выравнивание"), tr("Абсолютное значение")})
    page(hs, t, [this, t] { return notSupported(t); }, {});
  nav_->expandAll();
  connect(nav_, &QTreeWidget::currentItemChanged, this, [this](QTreeWidgetItem* it) {
    if (it && it->data(0, Qt::UserRole).isValid()) rebuildPages();
  });
  load();
  nav_->setCurrentItem(nav_->topLevelItem(0));
}

void DesignParamsDialog::showPage(const QString& title) {
  auto items = nav_->findItems(title, Qt::MatchExactly | Qt::MatchRecursive);
  if (!items.isEmpty()) nav_->setCurrentItem(items.front());
}

void DesignParamsDialog::load() {
  const Board& b = *doc_->board();
  rules_ = b.rules ? *b.rules : rulesFromBoard(b);
  stacks_ = b.padstacks;
  stackOrigin_.resize(stacks_.size());
  for (size_t i = 0; i < stacks_.size(); ++i) stackOrigin_[i] = int(i);
  if (hiddenPadColumns_.empty())
    for (auto& L : b.layers)
      if (L.kind == LayerKind::Silk) hiddenPadColumns_.insert(L.name);  // as TopoR shows the table at first
  viaEdits_.clear();
  dirty_ = false;
  applyButton_->setEnabled(false);
  resetButton_->setEnabled(false);
}

void DesignParamsDialog::changed() {
  dirty_ = true;
  applyButton_->setEnabled(true);
  resetButton_->setEnabled(true);
}

void DesignParamsDialog::rebuildPages() {
  QTreeWidgetItem* it = nav_->currentItem();
  if (!it || !it->data(0, Qt::UserRole).isValid()) return;
  int i = it->data(0, Qt::UserRole).toInt();
  while (pages_->count()) {
    // Deleted later (a page may be rebuilt from its own button's handler), detached right away.
    QWidget* w = pages_->widget(0);
    pages_->removeWidget(w);
    w->hide();
    w->setParent(nullptr);
    w->deleteLater();
  }
  pages_->addWidget(pageMakers_[size_t(i)].second());
  help_->setHtml(QString("<b>%1</b><br>%2").arg(pageMakers_[size_t(i)].first, pageHelp_[size_t(i)]));
}

bool DesignParamsDialog::apply() {
  Board& b = *doc_->board();
  // Resized via types: the vias of that type on the board follow.
  for (auto& [from, to] : viaEdits_)
    for (auto& v : b.vias)
      if (v.diameter == from.diameter && v.drill == from.drill) {
        v.diameter = to.diameter;
        v.drill = to.drill;
      }
  // Pad stacks: the pads follow theirs.
  setPadstacks(b, stacks_, stackOrigin_);
  for (size_t i = 0; i < stackOrigin_.size(); ++i) stackOrigin_[i] = int(i);
  b.rules = rules_;
  compileRules(b);
  // Plane layers follow their nets.
  std::erase_if(b.zones, [&](const Zone& z) { return b.layers[z.layer].plane; });
  size_t before = b.zones.size();
  addPlaneZones(b);
  ZoneFillOptions fill;
  for (size_t z = before; z < b.zones.size(); ++z) fill.only.push_back(int(z));
  if (!fill.only.empty()) fillZones(b, fill);
  doc_->invalidate();
  // As in TopoR: applying parameters clears the undo history; the design is modified.
  doc_->undoStack()->clear();
  doc_->undoStack()->resetClean();
  emit doc_->boardChanged();
  viaEdits_.clear();
  dirty_ = false;
  applyButton_->setEnabled(false);
  resetButton_->setEnabled(false);
  return true;
}

void DesignParamsDialog::importRules() {
  QString f = QFileDialog::getOpenFileName(this, tr("Импорт параметров"), QFileInfo(doc_->path()).absolutePath(),
                                           tr("Дизайны (*.fst *.kicad_pcb *.dsn *.pcb *.PCB)"));
  if (f.isEmpty()) return;
  auto r = io::loadBoard(f.toStdString());
  if (!r) {
    QMessageBox::warning(this, tr("Импорт"), QString::fromStdString(r.error()));
    return;
  }
  rules_ = (*r)->rules ? *(*r)->rules : rulesFromBoard(**r);
  changed();
  rebuildPages();
}

// ---------------------------------------------------------------- cells

QWidget* DesignParamsDialog::lengthCell(Coord value, std::function<void(Coord)> set) {
  Unit u = doc_->unit();
  auto* s = new DoubleSpinBox;
  s->setFrame(false);
  s->setDecimals(u == Unit::Mil ? 3 : 4);
  s->setRange(0, 1e6);
  s->setValue(toUnit(double(value), u));
  connect(s, &QDoubleSpinBox::valueChanged, this, [this, set, u](double v) {
    set(Coord(std::llround(fromUnit(v, u))));
    changed();
  });
  return s;
}

std::pair<QDoubleSpinBox*, QDoubleSpinBox*> DesignParamsDialog::orderedSpins(Coord low, Coord high,
                                                                       std::function<void(Coord low, Coord high)> set) {
  Unit u = doc_->unit();
  auto cell = [&](Coord value) {
    auto* s = new DoubleSpinBox;
    s->setFrame(false);
    s->setDecimals(u == Unit::Mil ? 3 : 4);
    s->setRange(0, 1e6);
    s->setValue(toUnit(double(value), u));
    // The value counts when it is entered, not at every digit: «0» on the way to «0.15» would pull the other one down.
    s->setKeyboardTracking(false);
    // «Применить» wakes up at the first digit, though: a click on it then ends the entry.
    connect(s, &QDoubleSpinBox::textChanged, this, [this] { changed(); });
    return s;
  };
  QDoubleSpinBox* lo = cell(low);
  QDoubleSpinBox* hi = cell(high);
  auto bind = [this, lo, hi, set, u](QDoubleSpinBox* edited, QDoubleSpinBox* other, bool editedIsLow) {
    connect(edited, &QDoubleSpinBox::valueChanged, this, [this, lo, hi, other, editedIsLow, set, u](double v) {
      if (editedIsLow ? v > other->value() : v < other->value()) {
        QSignalBlocker block(other);
        other->setValue(v);
      }
      set(Coord(std::llround(fromUnit(lo->value(), u))), Coord(std::llround(fromUnit(hi->value(), u))));
      changed();
    });
  };
  bind(lo, hi, true);
  bind(hi, lo, false);
  return {lo, hi};
}

void DesignParamsDialog::orderedCells(QTableWidget* t, int row, int lowColumn, int highColumn, Coord low, Coord high,
                                      std::function<void(Coord low, Coord high)> set) {
  auto [lo, hi] = orderedSpins(low, high, std::move(set));
  t->setCellWidget(row, lowColumn, lo);
  t->setCellWidget(row, highColumn, hi);
}

QWidget* DesignParamsDialog::checkCell(bool value, std::function<void(bool)> set) {
  auto* w = new QWidget;
  auto* h = new QHBoxLayout(w);
  h->setContentsMargins(4, 0, 0, 0);
  auto* c = new QCheckBox;
  c->setChecked(value);
  h->addWidget(c);
  connect(c, &QCheckBox::toggled, this, [this, set](bool on) {
    set(on);
    changed();
  });
  return w;
}

QWidget* DesignParamsDialog::netsCell(const RuleNets& value, std::function<void(RuleNets)> set) {
  const Board& b = *doc_->board();
  auto* c = new QComboBox;
  c->setFrame(false);
  std::vector<RuleNets> options{RuleNets{}};
  for (auto& g : rules_.netGroups) options.push_back({RuleNets::Kind::Group, g.name});
  for (auto& n : b.nets) options.push_back({RuleNets::Kind::Net, n.name});
  if (r::find(options, value) == options.end()) options.push_back(value);
  for (auto& o : options) c->addItem(netsText(o));
  c->setCurrentIndex(int(r::find(options, value) - options.begin()));
  connect(c, &QComboBox::activated, this, [this, set, options](int i) {
    set(options[size_t(i)]);
    changed();
  });
  return c;
}

QWidget* DesignParamsDialog::layerCell(const std::vector<std::string>& value, std::function<void(std::vector<std::string>)> set) {
  const Board& b = *doc_->board();
  auto* c = new QComboBox;
  c->setFrame(false);
  std::vector<std::vector<std::string>> options{{}};
  for (LayerId l : b.copperLayers()) options.push_back({b.layers[l].name});
  if (r::find(options, value) == options.end()) options.push_back(value);
  for (auto& o : options) {
    QStringList names;
    for (auto& n : o) names << QString::fromStdString(n);
    c->addItem(o.empty() ? tr("Все") : names.join(", "));
  }
  c->setCurrentIndex(int(r::find(options, value) - options.begin()));
  connect(c, &QComboBox::activated, this, [this, set, options](int i) {
    set(options[size_t(i)]);
    changed();
  });
  return c;
}

QWidget* DesignParamsDialog::ruleTable(const QStringList& headers, std::function<int()> count,
                                       std::function<void(QTableWidget*, int)> fillRow, std::function<void()> add,
                                       std::function<void(int)> remove, std::function<void(int, int)> swap) {
  auto* w = new QWidget;
  auto* v = new QVBoxLayout(w);
  v->setContentsMargins(0, 0, 0, 0);
  auto* t = new QTableWidget(count(), int(headers.size()), w);
  t->setHorizontalHeaderLabels(headers);
  t->verticalHeader()->hide();
  t->setSelectionBehavior(QAbstractItemView::SelectRows);
  t->setSelectionMode(QAbstractItemView::SingleSelection);
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);

  for (int r = 0; r < t->rowCount(); ++r) {
    t->setItem(r, 0, new QTableWidgetItem(QString::number(r)));
    fillRow(t, r);
  }
  stretchColumns(t);  // the columns fill the table's width
  v->addWidget(t, 1);
  auto* bar = new QHBoxLayout;
  auto button = [&](const QString& text, const QString& tip) {
    auto* b = new QToolButton(w);
    b->setText(text);
    b->setToolTip(tip);
    bar->addWidget(b);
    return b;
  };
  auto* plus = button("+", tr("Добавить"));
  auto* minus = button("−", tr("Удалить"));
  auto* up = button("▲", tr("Выше (меньший приоритет)"));
  auto* down = button("▼", tr("Ниже (больший приоритет)"));
  bar->addStretch(1);
  v->addLayout(bar);
  auto structural = [this] {
    changed();
    rebuildPages();
  };
  connect(plus, &QToolButton::clicked, this, [add, structural] {
    add();
    structural();
  });
  connect(minus, &QToolButton::clicked, this, [t, remove, structural] {
    if (int r = t->currentRow(); r >= 0) {
      remove(r);
      structural();
    }
  });
  connect(up, &QToolButton::clicked, this, [t, swap, structural] {
    if (int r = t->currentRow(); r > 0) {
      swap(r, r - 1);
      structural();
    }
  });
  connect(down, &QToolButton::clicked, this, [t, swap, count, structural] {
    if (int r = t->currentRow(); r >= 0 && r + 1 < count()) {
      swap(r, r + 1);
      structural();
    }
  });
  return w;
}

// ---------------------------------------------------------------- pages

QWidget* DesignParamsDialog::notSupported(const QString& what) {
  auto* l = new QLabel(tr("<i>%1: в XrTopoR пока не поддерживается.</i>").arg(what));
  l->setAlignment(Qt::AlignTop | Qt::AlignLeft);
  l->setMargin(8);
  return l;
}

QWidget* DesignParamsDialog::layersPage() {
  const Board& b = *doc_->board();
  auto* t = new QTableWidget(int(b.layers.size()), 4);
  t->setHorizontalHeaderLabels({tr("Имя"), tr("Сторона"), tr("Тип"), tr("Цепь опорного слоя")});
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  for (int l = 0; l < int(b.layers.size()); ++l) {
    const Layer& L = b.layers[size_t(l)];
    t->setItem(l, 0, new QTableWidgetItem(QString::fromStdString(L.name)));
    t->setItem(l, 1, new QTableWidgetItem(L.side == Side::Top ? "Top" : L.side == Side::Bottom ? "Bottom" : QString()));
    t->setItem(l, 2, new QTableWidgetItem(QString::fromStdString(layerTypeName(b, LayerId(l)))));
    t->setItem(l, 3, new QTableWidgetItem(L.planeNet >= 0 ? QString::fromStdString(b.nets[L.planeNet].name) : QString()));
  }
  stretchColumns(t);
  return t;
}

QWidget* DesignParamsDialog::padsPage() {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  auto* w = new QWidget;
  auto* v = new QVBoxLayout(w);
  v->setContentsMargins(0, 0, 0, 0);
  auto* top = new QHBoxLayout;
  auto* count = new QLabel;
  auto* search = new QLineEdit;
  search->setPlaceholderText(tr("Поиск"));
  search->setClearButtonEnabled(true);
  search->setMaximumWidth(200);
  top->addWidget(count);
  top->addStretch(1);
  top->addWidget(search);
  v->addLayout(top);
  auto* split = new QSplitter(Qt::Horizontal, w);
  auto* t = new QTableWidget(split);
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  t->setSelectionBehavior(QAbstractItemView::SelectRows);
  t->setSelectionMode(QAbstractItemView::ExtendedSelection);
  t->setContextMenuPolicy(Qt::CustomContextMenu);
  t->setObjectName("padstacks");
  // «Выбор столбцов»: the layers by group, as the visibility panel groups them.
  auto* columns = new QTreeWidget(split);
  columns->setHeaderLabel(tr("Выбор столбцов"));
  columns->setRootIsDecorated(false);
  split->addWidget(t);
  split->addWidget(columns);
  split->setSizes({640, 220});
  v->addWidget(split, 1);
  // The layers a stack can have details on, top to bottom.
  std::vector<LayerId> layers;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    LayerKind k = b.layers[l].kind;
    if (k == LayerKind::Mask || k == LayerKind::Silk || k == LayerKind::Paste || k == LayerKind::Copper) layers.push_back(l);
  }
  auto rank = [&](LayerId l) {
    const Layer& L = b.layers[l];
    if (L.kind == LayerKind::Copper) return 100 + L.copperIndex;
    return L.side == Side::Bottom ? 1000 + int(l) : int(l);  // each side's mask outermost, as the file lists them
  };
  r::stable_sort(layers, {}, rank);
  {
    QSignalBlocker block(columns);
    const QString groups[] = {tr("Верхние механические"), tr("Металлические"), tr("Нижние механические")};
    for (int g = 0; g < 3; ++g) {
      auto* head = new QTreeWidgetItem(columns, {groups[g]});
      head->setBackground(0, kHeader);
      head->setForeground(0, Qt::white);
      head->setFlags(Qt::ItemIsEnabled);
      for (LayerId l : layers) {
        const Layer& L = b.layers[l];
        if ((L.kind == LayerKind::Copper ? 1 : L.side == Side::Bottom ? 2 : 0) != g) continue;
        auto* it = new QTreeWidgetItem(columns, {QString("%1 (%2)").arg(QString::fromStdString(L.name), layerClassName(layerClassOf(b, l)))});
        it->setFlags(Qt::ItemIsEnabled | Qt::ItemIsUserCheckable);
        it->setCheckState(0, hiddenPadColumns_.contains(L.name) ? Qt::Unchecked : Qt::Checked);
        it->setData(0, Qt::UserRole, QString::fromStdString(L.name));
      }
    }
  }
  auto* bar = new QHBoxLayout;
  auto button = [&](const QString& text, const QString& tip) {
    auto* bt = new QToolButton(w);
    bt->setText(text);
    bt->setToolTip(tip);
    bar->addWidget(bt);
    return bt;
  };
  auto* plus = button("+", tr("Создать новый стек КП"));
  auto* minus = button(QString::fromUtf8("−"), tr("Удалить выбранный стек КП"));
  auto* edit = button(QString::fromUtf8("✎"), tr("Изменить"));
  auto* more = new QPushButton(tr("Дополнительно"), w);
  bar->addWidget(more);
  bar->addStretch(1);
  v->addLayout(bar);

  // How many pads use each stack being edited.
  auto uses = [this, &b] {
    auto onBoard = padstackUse(b);
    std::vector<int> n(stacks_.size(), 0);
    for (size_t i = 0; i < stacks_.size(); ++i)
      if (stackOrigin_[i] >= 0 && size_t(stackOrigin_[i]) < onBoard.size()) n[i] = onBoard[size_t(stackOrigin_[i])];
    return n;
  };
  auto selected = [t] {
    std::set<int> s;
    for (auto* it : t->selectedItems()) s.insert(it->data(Qt::UserRole).toInt());
    return std::vector<int>(s.begin(), s.end());
  };
  auto fill = [this, t, count, search, layers, uses, u, &b] {
    QSignalBlocker block(t);
    std::vector<LayerId> shown;
    for (LayerId l : layers)
      if (!hiddenPadColumns_.contains(b.layers[l].name)) shown.push_back(l);
    QStringList headers{tr("Стек КП"), tr("Отверстие %1").arg(unitName(u))};
    for (LayerId l : shown) headers << QString::fromStdString(b.layers[l].name);
    t->clear();
    t->setColumnCount(int(headers.size()));
    t->setHorizontalHeaderLabels(headers);
    for (size_t c = 0; c < shown.size(); ++c) {
      LayerKind k = b.layers[shown[c]].kind;
      QColor bg = k == LayerKind::Copper ? QColor(0xf4, 0xb8, 0x60) : k == LayerKind::Mask ? QColor(0x98, 0xd8, 0xa8)
                : k == LayerKind::Paste ? QColor(0xd8, 0xd8, 0xd8) : QColor(0xf8, 0xc8, 0xd8);
      t->horizontalHeaderItem(int(c) + 2)->setBackground(bg);
    }
    auto n = uses();
    std::vector<int> order(stacks_.size());
    for (size_t i = 0; i < order.size(); ++i) order[i] = int(i);
    // Natural order, as TopoR sorts: C35 before C140.
    QCollator coll;
    coll.setNumericMode(true);
    r::sort(order, [&](const QString& x, const QString& y) { return coll.compare(x, y) < 0; },
            [&](int i) { return QString::fromStdString(stacks_[size_t(i)].name); });
    QString f = search->text();
    t->setRowCount(0);
    for (int i : order) {
      const Padstack& ps = stacks_[size_t(i)];
      QString name = QString::fromStdString(ps.name);
      if (!f.isEmpty() && !name.contains(f, Qt::CaseInsensitive)) continue;
      int r = t->rowCount();
      t->insertRow(r);
      auto item = [&](int col, const QString& text) {
        auto* it = new QTableWidgetItem(text);
        it->setData(Qt::UserRole, i);
        if (n[size_t(i)] == 0) it->setForeground(Qt::gray);  // not used
        t->setItem(r, col, it);
        return it;
      };
      item(0, name)->setToolTip(tr("Контактов: %1").arg(n[size_t(i)]));
      item(1, ps.type == PadstackType::SMD ? QString() : QString::number(toUnit(double(ps.drill), u), 'f', 2));
      for (size_t c = 0; c < shown.size(); ++c) {
        const PadDetail* d = detailOn(b, ps, shown[c], false);
        auto* it = item(int(c) + 2, d ? detailSize(*d, u) : QString());
        if (d) {
          it->setIcon(detailIcon(*d));
          it->setToolTip(detailFormName(*d));
        }
      }
      if (r::contains(selectedStacks_, i))
        t->selectionModel()->select(t->model()->index(r, 0), QItemSelectionModel::Select | QItemSelectionModel::Rows);
    }
    int unused = int(r::count(n, 0));
    count->setText(tr("<i>Всего стеков КП: %1 (%2 не используется)</i>").arg(stacks_.size()).arg(unused));
    stretchColumns(t);
  };
  fill();
  connect(search, &QLineEdit::textChanged, this, fill);
  connect(t, &QTableWidget::itemSelectionChanged, this, [this, selected] { selectedStacks_ = selected(); });
  connect(columns, &QTreeWidget::itemChanged, this, [this, fill](QTreeWidgetItem* it) {
    std::string name = it->data(0, Qt::UserRole).toString().toStdString();
    if (name.empty()) return;
    if (it->checkState(0) == Qt::Checked) hiddenPadColumns_.erase(name);
    else hiddenPadColumns_.insert(name);
    fill();
  });
  connect(t, &QTableWidget::cellDoubleClicked, this, [this, t](int r) {
    if (auto* it = t->item(r, 0)) editStack(it->data(Qt::UserRole).toInt());
  });
  connect(edit, &QToolButton::clicked, this, [this, selected] {
    auto s = selected();
    if (!s.empty()) editStack(s.front());
  });
  connect(plus, &QToolButton::clicked, this, [this] { newStack(); });
  auto removeStacks = [this, uses, fill](std::vector<int> which) {
    auto n = uses();
    std::vector<int> busy;
    for (int i : which)
      if (n[size_t(i)] > 0) busy.push_back(i);
    if (!busy.empty()) {
      QStringList names;
      for (int i : busy) names << QString::fromStdString(stacks_[size_t(i)].name);
      QMessageBox::warning(this, windowTitle(), tr("Стеки КП используются контактами и не удаляются: %1").arg(names.join(", ")));
    }
    r::sort(which, std::greater{});
    bool any = false;
    for (int i : which)
      if (n[size_t(i)] == 0) {
        stacks_.erase(stacks_.begin() + i);
        stackOrigin_.erase(stackOrigin_.begin() + i);
        any = true;
      }
    if (!any) return;
    selectedStacks_.clear();
    changed();
    fill();
  };
  connect(minus, &QToolButton::clicked, this, [selected, removeStacks] { removeStacks(selected()); });
  auto createMenu = [this, selected](QMenu* m) {
    auto* sub = m->addMenu(tr("Создать детали на слоях"));
    sub->addAction(tr("Маски..."), this, [this, selected] { createDetails(LayerKind::Mask, selected()); });
    sub->addAction(tr("Пасты..."), this, [this, selected] { createDetails(LayerKind::Paste, selected()); });
  };
  auto* moreMenu = new QMenu(more);
  moreMenu->addAction(tr("Удалить неиспользуемые стеки"), this, [this, uses, removeStacks] {
    auto n = uses();
    std::vector<int> unused;
    for (size_t i = 0; i < n.size(); ++i)
      if (n[i] == 0) unused.push_back(int(i));
    removeStacks(unused);
  });
  createMenu(moreMenu);
  more->setMenu(moreMenu);
  connect(t, &QTableWidget::customContextMenuRequested, this, [this, t, &b, selected, createMenu, removeStacks, fill](QPoint at) {
    auto s = selected();
    if (s.empty()) return;
    QMenu m(t);
    m.addAction(tr("Изменить..."), this, [this, s] { editStack(s.front()); });
    createMenu(&m);
    auto* del = m.addMenu(tr("Удалить детали на слое"));
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (b.layers[l].kind == LayerKind::Mask || b.layers[l].kind == LayerKind::Paste)
        del->addAction(QString::fromStdString(b.layers[l].name), this, [this, s, l, &b, fill] {
          deleteLayerDetails(b, stacks_, s, l);
          changed();
          fill();
        });
    m.addAction(tr("Переименовать"), this, [this, s, fill] {
      Padstack& ps = stacks_[size_t(s.front())];
      bool ok = false;
      QString name = QInputDialog::getText(this, tr("Переименовать"), tr("Имя стека КП:"), QLineEdit::Normal,
                                           QString::fromStdString(ps.name), &ok).trimmed();
      if (!ok || name.isEmpty() || name.toStdString() == ps.name) return;
      if (r::contains(stacks_, name.toStdString(), &Padstack::name)) {
        QMessageBox::warning(this, windowTitle(), tr("Стек КП с таким именем уже существует."));
        return;
      }
      ps.name = name.toStdString();
      changed();
      fill();
    });
    m.addAction(tr("Удалить"), this, [s, removeStacks] { removeStacks(s); });
    m.exec(t->viewport()->mapToGlobal(at));
  });
  return w;
}

void DesignParamsDialog::editStack(int i) {
  if (i < 0 || size_t(i) >= stacks_.size()) return;
  std::vector<std::string> others;
  for (size_t k = 0; k < stacks_.size(); ++k)
    if (int(k) != i) others.push_back(stacks_[k].name);
  PadstackEditor dlg(*doc_->board(), stacks_[size_t(i)], doc_->unit(), others, false, this);
  connect(&dlg, &PadstackEditor::applied, this, [this, i](const Padstack& ps) {
    stacks_[size_t(i)] = ps;
    changed();
  });
  dlg.exec();
  rebuildPages();
}

void DesignParamsDialog::newStack() {
  const Board& b = *doc_->board();
  bool ok = false;
  QStringList types{tr("Сквозной"), tr("Планарный"), tr("Монтажное отверстие")};
  QString type = QInputDialog::getItem(this, tr("Создать новый стек КП"), tr("Тип стека:"), types, 0, false, &ok);
  if (!ok) return;
  Padstack ps;
  ps.type = PadstackType(types.indexOf(type));
  ps.name = uniquePadstackName(stacks_, "PAD");
  PadDetail d;
  d.form = PadDetail::Form::Circle;
  d.w = d.h = mmToNm(1.5);
  switch (ps.type) {
    case PadstackType::Through:
      ps.drill = mmToNm(0.8);
      d.layerClass = "Signal";
      ps.details.push_back(d);
      d.layerClass = "Plane";
      ps.details.push_back(d);
      break;
    case PadstackType::SMD:
      d.form = PadDetail::Form::Rect;
      d.h = mmToNm(1);
      d.layer = b.layers[b.topCopper()].name;
      ps.details.push_back(d);
      break;
    case PadstackType::MountHole:
      ps.drill = mmToNm(3);
      ps.plated = false;
      break;
  }
  std::vector<std::string> others;
  for (auto& s : stacks_) others.push_back(s.name);
  PadstackEditor dlg(b, ps, doc_->unit(), others, true, this);
  connect(&dlg, &PadstackEditor::applied, this, [this](const Padstack& made) {
    stacks_.push_back(made);
    stackOrigin_.push_back(-1);
    selectedStacks_ = {int(stacks_.size() - 1)};
    changed();
  });
  dlg.exec();
  rebuildPages();
}

void DesignParamsDialog::createDetails(LayerKind kind, std::vector<int> which) {
  const Board& b = *doc_->board();
  bool layer = r::contains(b.layers, kind, &Layer::kind);
  if (!layer) {
    QMessageBox::information(this, windowTitle(), kind == LayerKind::Mask ? tr("В дизайне нет слоёв маски.")
                                                                          : tr("В дизайне нет слоёв пасты."));
    return;
  }
  CreateDetailsDialog dlg(b, stacks_, std::move(which), kind, doc_->unit(), this);
  if (dlg.exec() != QDialog::Accepted) return;
  if (dlg.stacks() == stacks_) return;
  stacks_ = dlg.stacks();
  changed();
  rebuildPages();
}

QWidget* DesignParamsDialog::viaTypesPage() {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  auto* w = new QWidget;
  auto* v = new QVBoxLayout(w);
  v->setContentsMargins(0, 0, 0, 0);
  auto* head = new QLabel(tr("<b>Типы переходных отверстий</b>"));
  head->setStyleSheet("background:#9d8fbf; color:white; padding:2px;");
  v->addWidget(head);
  auto* diagram = new ViaStackDiagram(b, rules_.viaTypes, w);
  auto* scroll = new QScrollArea(w);
  // The full width of the page, scrolled when the types need more.
  scroll->setWidgetResizable(true);
  diagram->setMinimumSize(110 + 140 * int(rules_.viaTypes.size()), diagram->sizeHint().height());
  scroll->setWidget(diagram);
  scroll->setMinimumHeight(std::min(260, diagram->sizeHint().height() + 20));
  v->addWidget(scroll);
  auto copper = b.copperLayers();
  auto refresh = [this, diagram] {
    diagram->setTypes(rules_.viaTypes);
  };
  auto* table = ruleTable(
      {"#", tr("Имя"), tr("Сквозной"), tr("Начальный слой"), tr("Конечный слой"), tr("Диам. площадки, %1").arg(unitName(u)),
       tr("Диам. отверстия, %1").arg(unitName(u)), tr("ПО на контакте")},
      [this] { return int(rules_.viaTypes.size()); },
      [this, &b, u, copper, refresh](QTableWidget* t, int r) {
        ViaType& vt = rules_.viaTypes[size_t(r)];
        auto* name = new QLineEdit(QString::fromStdString(vt.name));
        name->setFrame(false);
        connect(name, &QLineEdit::editingFinished, this, [this, name, r, refresh] {
          std::string old = rules_.viaTypes[size_t(r)].name, now = name->text().toStdString();
          if (old == now || now.empty()) return;
          for (auto& v : rules_.vias)
            if (v.viaType == old) v.viaType = now;
          rules_.viaTypes[size_t(r)].name = now;
          changed();
          refresh();
        });
        t->setCellWidget(r, 1, name);
        // The copper range: «сквозной» from the top to the bottom, «глухой» from an outer layer, else «скрытый».
        auto index = [&](const std::string& n, int def) {
          LayerId l = b.findLayer(n);
          return l >= 0 && b.layers[l].copperIndex >= 0 ? b.layers[l].copperIndex : def;
        };
        int last = int(copper.size()) - 1;
        int from = vt.from.empty() ? 0 : index(vt.from, 0), to = vt.to.empty() ? last : index(vt.to, last);
        if (from > to) std::swap(from, to);
        auto* kind = new QTableWidgetItem(from == 0 && to == last ? tr("сквозной") : from == 0 || to == last ? tr("глухой") : tr("скрытый"));
        kind->setForeground(Qt::gray);
        t->setItem(r, 2, kind);
        auto layerCombo = [&](int current) {
          auto* cb = new QComboBox;
          cb->setFrame(false);
          for (LayerId l : copper) cb->addItem(QString::fromStdString(b.layers[l].name));
          cb->setCurrentIndex(current);
          return cb;
        };
        auto* fromBox = layerCombo(from);
        auto* toBox = layerCombo(to);
        // Start above (or on) the end: one moved past the other takes it along.
        auto range = [this, r, fromBox, toBox, kind, last, refresh](bool fromEdited) {
          int a = fromBox->currentIndex(), c = toBox->currentIndex();
          if (a > c) {
            QSignalBlocker b1(fromBox), b2(toBox);
            if (fromEdited) toBox->setCurrentIndex(c = a);
            else fromBox->setCurrentIndex(a = c);
          }
          ViaType& vt = rules_.viaTypes[size_t(r)];
          bool through = a == 0 && c == last;
          vt.from = through ? std::string() : fromBox->currentText().toStdString();
          vt.to = through ? std::string() : toBox->currentText().toStdString();
          kind->setText(through ? tr("сквозной") : a == 0 || c == last ? tr("глухой") : tr("скрытый"));
          changed();
          refresh();
        };
        connect(fromBox, &QComboBox::activated, this, [range] { range(true); });
        connect(toBox, &QComboBox::activated, this, [range] { range(false); });
        t->setCellWidget(r, 3, fromBox);
        t->setCellWidget(r, 4, toBox);
        // The hole never exceeds the pad: one of them edited past the other takes it along, as one resize.
        auto [hole, pad] = orderedSpins(vt.drill, vt.diameter, [this, r, refresh](Coord drill, Coord diameter) {
          ViaType before = rules_.viaTypes[size_t(r)];
          rules_.viaTypes[size_t(r)].drill = drill;
          rules_.viaTypes[size_t(r)].diameter = diameter;
          viaEdits_.push_back({before, rules_.viaTypes[size_t(r)]});
          refresh();
        });
        // The pad: the signal diameter, the others listed, «...» for them layer by layer.
        auto* padCell = new QWidget;
        auto* ph = new QHBoxLayout(padCell);
        ph->setContentsMargins(0, 0, 0, 0);
        ph->setSpacing(2);
        auto* others = new QLabel;
        auto showOthers = [this, r, others, &b, u] {
          const ViaType& vt = rules_.viaTypes[size_t(r)];
          QString all = viaDiameters(b, vt, u);
          QString first = formatLength(double(vt.diameter), u, 4);
          others->setText(all == first ? QString() : all.mid(first.size()));
          others->setToolTip(all);
        };
        showOthers();
        auto* dots = new QToolButton;
        dots->setText("...");
        dots->setToolTip(tr("Диаметр площадки переходного отверстия"));
        ph->addWidget(pad, 1);
        ph->addWidget(others);
        ph->addWidget(dots);
        connect(dots, &QToolButton::clicked, this, [this, r, &b, u, pad, hole, showOthers, refresh] {
          ViaPadsDialog dlg(b, rules_.viaTypes[size_t(r)], u, this);
          if (dlg.exec() != QDialog::Accepted) return;
          ViaType before = rules_.viaTypes[size_t(r)];
          ViaType now = dlg.type();
          if (now.drill > now.diameter) now.drill = now.diameter;
          rules_.viaTypes[size_t(r)] = now;
          if (now.diameter != before.diameter || now.drill != before.drill) viaEdits_.push_back({before, now});
          {
            QSignalBlocker b1(pad), b2(hole);
            pad->setValue(toUnit(double(now.diameter), u));
            hole->setValue(toUnit(double(now.drill), u));
          }
          showOthers();
          changed();
          refresh();
        });
        t->setCellWidget(r, 5, padCell);
        t->setCellWidget(r, 6, hole);
        t->setCellWidget(r, 7, checkCell(vt.viaOnPin, [this, r](bool on) { rules_.viaTypes[size_t(r)].viaOnPin = on; }));
      },
      [this] {
        ViaType t = rules_.viaTypes.empty() ? ViaType{"", mmToNm(0.6), mmToNm(0.3)} : rules_.viaTypes.back();
        t.name = std::format("ПО{}", rules_.viaTypes.size() + 1);
        rules_.viaTypes.push_back(t);
      },
      [this](int r) { rules_.viaTypes.erase(rules_.viaTypes.begin() + r); },
      [this](int a, int b) { std::swap(rules_.viaTypes[size_t(a)], rules_.viaTypes[size_t(b)]); });
  v->addWidget(table, 1);
  if (auto* t = table->findChild<QTableWidget*>()) {
    connect(diagram, &ViaStackDiagram::picked, t, [t](int i) { t->selectRow(i); });
    connect(t, &QTableWidget::currentCellChanged, diagram, [diagram](int r) { diagram->setCurrent(r); });
  }
  return w;
}

QWidget* DesignParamsDialog::netlistPage() {
  const Board& b = *doc_->board();
  std::vector<int> pins(b.nets.size(), 0);
  for (auto& p : b.pads)
    if (p.net >= 0) pins[size_t(p.net)]++;
  auto* t = new QTableWidget(int(b.nets.size()), 3);
  t->setHorizontalHeaderLabels({tr("Цепь"), tr("Контактов"), tr("Класс")});
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  t->setSortingEnabled(false);
  for (int n = 0; n < int(b.nets.size()); ++n) {
    t->setItem(n, 0, new QTableWidgetItem(QString::fromStdString(b.nets[size_t(n)].name)));
    auto* count = new QTableWidgetItem;
    count->setData(Qt::DisplayRole, pins[size_t(n)]);
    t->setItem(n, 1, count);
    t->setItem(n, 2, new QTableWidgetItem(QString::fromStdString(b.classOf(n).name)));
  }
  t->setSortingEnabled(true);
  stretchColumns(t);
  return t;
}

QWidget* DesignParamsDialog::netGroupsPage() {
  const Board& b = *doc_->board();
  auto* w = new QWidget;
  auto* h = new QHBoxLayout(w);
  // Groups on the left, their nets in the middle, the other nets on the right.
  auto* left = new QVBoxLayout;
  auto* groups = new QListWidget;
  for (auto& g : rules_.netGroups) groups->addItem(QString::fromStdString(g.name));
  left->addWidget(new QLabel(tr("Группы цепей")));
  left->addWidget(groups, 1);
  auto* gbar = new QHBoxLayout;
  auto* add = new QToolButton;
  add->setText("+");
  auto* del = new QToolButton;
  del->setText("−");
  auto* ren = new QToolButton;
  ren->setText(tr("Переименовать"));
  gbar->addWidget(add);
  gbar->addWidget(del);
  gbar->addWidget(ren);
  gbar->addStretch(1);
  left->addLayout(gbar);
  h->addLayout(left, 1);
  auto* mid = new QVBoxLayout;
  auto* members = new QListWidget;
  members->setSelectionMode(QAbstractItemView::ExtendedSelection);
  mid->addWidget(new QLabel(tr("Цепи группы")));
  mid->addWidget(members, 1);
  h->addLayout(mid, 1);
  auto* arrows = new QVBoxLayout;
  auto* toGroup = new QToolButton;
  toGroup->setText("◀");
  auto* fromGroup = new QToolButton;
  fromGroup->setText("▶");
  arrows->addStretch(1);
  arrows->addWidget(toGroup);
  arrows->addWidget(fromGroup);
  arrows->addStretch(1);
  h->addLayout(arrows);
  auto* right = new QVBoxLayout;
  auto* others = new QListWidget;
  others->setSelectionMode(QAbstractItemView::ExtendedSelection);
  right->addWidget(new QLabel(tr("Остальные цепи")));
  right->addWidget(others, 1);
  h->addLayout(right, 1);

  auto fill = [this, &b, groups, members, others] {
    members->clear();
    others->clear();
    int g = groups->currentRow();
    if (g < 0 || g >= int(rules_.netGroups.size())) return;
    auto& nets = rules_.netGroups[size_t(g)].nets;
    for (auto& n : nets) members->addItem(QString::fromStdString(n));
    for (auto& n : b.nets)
      if (!r::contains(nets, n.name)) others->addItem(QString::fromStdString(n.name));
  };
  connect(groups, &QListWidget::currentRowChanged, w, fill);
  connect(add, &QToolButton::clicked, this, [this, groups] {
    bool ok = false;
    QString name = QInputDialog::getText(this, tr("Группа цепей"), tr("Имя группы:"), QLineEdit::Normal, {}, &ok);
    if (!ok || name.trimmed().isEmpty()) return;
    rules_.netGroups.push_back({name.trimmed().toStdString(), {}});
    groups->addItem(name.trimmed());
    groups->setCurrentRow(groups->count() - 1);
    changed();
  });
  connect(del, &QToolButton::clicked, this, [this, groups] {
    int g = groups->currentRow();
    if (g < 0) return;
    rules_.netGroups.erase(rules_.netGroups.begin() + g);
    delete groups->takeItem(g);
    changed();
  });
  connect(ren, &QToolButton::clicked, this, [this, groups] {
    int g = groups->currentRow();
    if (g < 0) return;
    bool ok = false;
    QString old = groups->item(g)->text();
    QString name = QInputDialog::getText(this, tr("Группа цепей"), tr("Имя группы:"), QLineEdit::Normal, old, &ok).trimmed();
    if (!ok || name.isEmpty() || name == old) return;
    rules_.netGroups[size_t(g)].name = name.toStdString();
    // Rules naming the group follow it.
    auto follow = [&](RuleNets& r) {
      if (r.kind == RuleNets::Kind::Group && r.name == old.toStdString()) r.name = name.toStdString();
    };
    for (auto& r : rules_.widths) follow(r.nets);
    for (auto& r : rules_.clearances) follow(r.a), follow(r.b);
    for (auto& r : rules_.vias) follow(r.nets);
    groups->item(g)->setText(name);
    changed();
  });
  connect(toGroup, &QToolButton::clicked, this, [this, groups, others, fill] {
    int g = groups->currentRow();
    if (g < 0) return;
    for (auto* it : others->selectedItems()) rules_.netGroups[size_t(g)].nets.push_back(it->text().toStdString());
    fill();
    changed();
  });
  connect(fromGroup, &QToolButton::clicked, this, [this, groups, members, fill] {
    int g = groups->currentRow();
    if (g < 0) return;
    for (auto* it : members->selectedItems()) std::erase(rules_.netGroups[size_t(g)].nets, it->text().toStdString());
    fill();
    changed();
  });
  if (groups->count()) groups->setCurrentRow(0);
  return w;
}

QWidget* DesignParamsDialog::widthsPage() {
  QString u = unitName(doc_->unit());
  return ruleTable(
      {"#", "", tr("Слой"), tr("Применяется к"), tr("Мин., %1").arg(u), tr("Ном., %1").arg(u)},
      [this] { return int(rules_.widths.size()); },
      [this](QTableWidget* t, int r) {
        auto& w = rules_.widths[size_t(r)];
        t->setCellWidget(r, 1, checkCell(w.enabled, [this, r](bool on) { rules_.widths[size_t(r)].enabled = on; }));
        t->setCellWidget(r, 2, layerCell(w.layers, [this, r](auto v) { rules_.widths[size_t(r)].layers = v; }));
        t->setCellWidget(r, 3, netsCell(w.nets, [this, r](RuleNets v) { rules_.widths[size_t(r)].nets = v; }));
        orderedCells(t, r, 4, 5, w.min, w.nom, [this, r](Coord min, Coord nom) {
          rules_.widths[size_t(r)].min = min;
          rules_.widths[size_t(r)].nom = nom;
        });
      },
      [this] {
        WidthRule w = rules_.widths.empty() ? WidthRule{true, {}, {}, mmToNm(0.25), mmToNm(0.25)} : rules_.widths.back();
        rules_.widths.push_back(w);
      },
      [this](int r) { rules_.widths.erase(rules_.widths.begin() + r); },
      [this](int a, int b) { std::swap(rules_.widths[size_t(a)], rules_.widths[size_t(b)]); });
}

QWidget* DesignParamsDialog::clearancesPage() {
  QString u = unitName(doc_->unit());
  return ruleTable(
      {"#", "", tr("Слой"), tr("Объект 1"), tr("Объект 2"), tr("Мин., %1").arg(u), tr("Ном., %1").arg(u)},
      [this] { return int(rules_.clearances.size()); },
      [this](QTableWidget* t, int r) {
        auto& c = rules_.clearances[size_t(r)];
        t->setCellWidget(r, 1, checkCell(c.enabled, [this, r](bool on) { rules_.clearances[size_t(r)].enabled = on; }));
        t->setCellWidget(r, 2, layerCell(c.layers, [this, r](auto v) { rules_.clearances[size_t(r)].layers = v; }));
        t->setCellWidget(r, 3, netsCell(c.a, [this, r](RuleNets v) { rules_.clearances[size_t(r)].a = v; }));
        t->setCellWidget(r, 4, netsCell(c.b, [this, r](RuleNets v) { rules_.clearances[size_t(r)].b = v; }));
        orderedCells(t, r, 5, 6, c.min, c.nom, [this, r](Coord min, Coord nom) {
          rules_.clearances[size_t(r)].min = min;
          rules_.clearances[size_t(r)].nom = nom;
        });
      },
      [this] {
        ClearanceRule c = rules_.clearances.empty() ? ClearanceRule{true, {}, {}, {}, mmToNm(0.2), mmToNm(0.25)}
                                                    : rules_.clearances.back();
        rules_.clearances.push_back(c);
      },
      [this](int r) { rules_.clearances.erase(rules_.clearances.begin() + r); },
      [this](int a, int b) { std::swap(rules_.clearances[size_t(a)], rules_.clearances[size_t(b)]); });
}

// The impedance rules as the file has them (read only): a row per rule and layer.
QWidget* DesignParamsDialog::impedancesPage() {
  const Board& b = *doc_->board();
  auto* t = new QTableWidget;
  t->setColumnCount(5);
  t->setHorizontalHeaderLabels({tr("Имя"), tr("Z0, Ом"), tr("Слой"), tr("Ширина"), tr("Зазор")});
  int row = 0;
  for (const Impedance& z : b.hispeed.impedances)
    for (const ImpedanceLayerRule& r : z.rules) {
      t->insertRow(row);
      auto cell = [&](int c, const QString& v) {
        auto* it = new QTableWidgetItem(v);
        it->setFlags(it->flags() & ~Qt::ItemIsEditable);
        t->setItem(row, c, it);
      };
      cell(0, QString::fromStdString(z.name) + (z.diff ? tr(" (дифф.)") : QString()));
      cell(1, QString::number(z.z0));
      cell(2, QString::fromStdString(r.layer));
      cell(3, formatLength(double(r.width), doc_->unit(), 3));
      cell(4, z.diff ? formatLength(double(r.gap), doc_->unit(), 3) : QString());
      ++row;
    }
  t->resizeColumnsToContents();
  return t;
}

// The differential signals (read only): the pair's nets, its rule and the allowed difference of lengths.
QWidget* DesignParamsDialog::diffSignalsPage() {
  const Board& b = *doc_->board();
  auto* t = new QTableWidget;
  t->setColumnCount(4);
  t->setHorizontalHeaderLabels({tr("Дифф. сигнал"), tr("Цепи"), tr("Волновое сопротивление"), tr("Допустимый разброс")});
  for (const DiffSignal& d : b.hispeed.diffSignals) {
    const int row = t->rowCount();
    t->insertRow(row);
    QStringList nets;
    for (const std::string& n : b.hispeed.netsOf({ObjectSignal::Kind::DiffSignal, d.name})) nets << QString::fromStdString(n);
    const QString v[4] = {QString::fromStdString(d.name), nets.join(", "), QString::fromStdString(d.impedance),
                          formatLength(double(d.mismatch), doc_->unit(), 3)};
    for (int c = 0; c < 4; ++c) {
      auto* it = new QTableWidgetItem(v[c]);
      it->setFlags(it->flags() & ~Qt::ItemIsEditable);
      t->setItem(row, c, it);
    }
  }
  t->resizeColumnsToContents();
  return t;
}

QWidget* DesignParamsDialog::edgePage() {
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  if (rules_.edgeWires <= 0) rules_.edgeWires = doc_->board()->edgeClearance;
  if (rules_.edgeComps <= 0) rules_.edgeComps = rules_.edgeWires;
  f->addRow(tr("Зазор от проводников до края платы:"), lengthCell(rules_.edgeWires, [this](Coord v) { rules_.edgeWires = v; }));
  f->addRow(tr("Зазор от компонентов до края платы:"), lengthCell(rules_.edgeComps, [this](Coord v) { rules_.edgeComps = v; }));
  return w;
}

QWidget* DesignParamsDialog::viaRulesPage() {
  return ruleTable(
      {"#", "", tr("Применяется к"), tr("Тип ПО")},
      [this] { return int(rules_.vias.size()); },
      [this](QTableWidget* t, int r) {
        auto& v = rules_.vias[size_t(r)];
        t->setCellWidget(r, 1, checkCell(v.enabled, [this, r](bool on) { rules_.vias[size_t(r)].enabled = on; }));
        t->setCellWidget(r, 2, netsCell(v.nets, [this, r](RuleNets n) { rules_.vias[size_t(r)].nets = n; }));
        auto* c = new QComboBox;
        c->setFrame(false);
        c->addItem(tr("Все типы"));
        for (auto& vt : rules_.viaTypes) c->addItem(QString::fromStdString(vt.name));
        c->setCurrentText(v.viaType.empty() ? tr("Все типы") : QString::fromStdString(v.viaType));
        connect(c, &QComboBox::activated, this, [this, r, c](int i) {
          rules_.vias[size_t(r)].viaType = i == 0 ? std::string() : c->itemText(i).toStdString();
          changed();
        });
        t->setCellWidget(r, 3, c);
      },
      [this] { rules_.vias.push_back({true, {}, rules_.viaTypes.empty() ? std::string() : rules_.viaTypes.front().name}); },
      [this](int r) { rules_.vias.erase(rules_.vias.begin() + r); },
      [this](int a, int b) { std::swap(rules_.vias[size_t(a)], rules_.vias[size_t(b)]); });
}

QWidget* DesignParamsDialog::planesPage() {
  const Board& b = *doc_->board();
  return ruleTable(
      {"#", "", tr("Слой"), tr("Цепь")},
      [this] { return int(rules_.planes.size()); },
      [this, &b](QTableWidget* t, int r) {
        auto& p = rules_.planes[size_t(r)];
        t->setCellWidget(r, 1, checkCell(p.enabled, [this, r](bool on) { rules_.planes[size_t(r)].enabled = on; }));
        auto* layer = new QComboBox;
        layer->setFrame(false);
        for (LayerId l : b.copperLayers()) layer->addItem(QString::fromStdString(b.layers[l].name));
        layer->setCurrentText(QString::fromStdString(p.layer));
        connect(layer, &QComboBox::activated, this, [this, r, layer](int i) {
          rules_.planes[size_t(r)].layer = layer->itemText(i).toStdString();
          changed();
        });
        t->setCellWidget(r, 2, layer);
        auto* net = new QComboBox;
        net->setFrame(false);
        for (auto& n : b.nets) net->addItem(QString::fromStdString(n.name));
        net->setCurrentText(QString::fromStdString(p.net));
        connect(net, &QComboBox::activated, this, [this, r, net](int i) {
          rules_.planes[size_t(r)].net = net->itemText(i).toStdString();
          changed();
        });
        t->setCellWidget(r, 3, net);
      },
      [this, &b] {
        // Plane layers are those TopoR marks as planes; else the first inner layer.
        std::string layer;
        for (LayerId l : b.copperLayers())
          if (b.layers[l].plane || layer.empty()) layer = b.layers[l].name;
        rules_.planes.push_back({true, layer, b.nets.empty() ? std::string() : b.nets.front().name});
      },
      [this](int r) { rules_.planes.erase(rules_.planes.begin() + r); },
      [this](int a, int b) { std::swap(rules_.planes[size_t(a)], rules_.planes[size_t(b)]); });
}

QWidget* DesignParamsDialog::layerNetsPage() {
  return ruleTable(
      {"#", "", tr("Слой"), tr("Цепи")},
      [this] { return int(rules_.layerNets.size()); },
      [this](QTableWidget* t, int r) {
        auto& rule = rules_.layerNets[size_t(r)];
        t->setCellWidget(r, 1, checkCell(rule.enabled, [this, r](bool on) { rules_.layerNets[size_t(r)].enabled = on; }));
        t->setItem(r, 2, new QTableWidgetItem(QString::fromStdString(rule.layer)));
        QStringList nets;
        for (auto& n : rule.nets) nets << netsText(n);
        t->setItem(r, 3, new QTableWidgetItem(nets.join(", ")));
      },
      [] {}, [this](int r) { rules_.layerNets.erase(rules_.layerNets.begin() + r); },
      [this](int a, int b) { std::swap(rules_.layerNets[size_t(a)], rules_.layerNets[size_t(b)]); });
}

}  // namespace xr::gui
