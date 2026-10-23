#include "gui/DesignParamsDialog.h"

#include <QCheckBox>
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

#include "core/ZoneFill.h"
#include "gui/Schemes.h"
#include "io/BoardIO.h"

namespace xr::gui {

namespace {

const QColor kHeader(0x9d, 0x8f, 0xbf);

QString netsText(const RuleNets& n) {
  switch (n.kind) {
    case RuleNets::Kind::All: return QObject::tr("Все цепи");
    case RuleNets::Kind::Net: return QString::fromStdString(n.name);
    case RuleNets::Kind::Group: return QObject::tr("Группа: %1").arg(QString::fromStdString(n.name));
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
  for (const QString& t : {tr("Волновое сопротивление"), tr("Сигналы"), tr("Выравнивание в группе"),
                           tr("Взаимное выравнивание"), tr("Абсолютное значение")})
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
  auto* s = new QDoubleSpinBox;
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
  if (std::ranges::find(options, value) == options.end()) options.push_back(value);
  for (auto& o : options) c->addItem(netsText(o));
  c->setCurrentIndex(int(std::ranges::find(options, value) - options.begin()));
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
  if (std::ranges::find(options, value) == options.end()) options.push_back(value);
  for (auto& o : options) {
    QStringList names;
    for (auto& n : o) names << QString::fromStdString(n);
    c->addItem(o.empty() ? tr("Все") : names.join(", "));
  }
  c->setCurrentIndex(int(std::ranges::find(options, value) - options.begin()));
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
  t->horizontalHeader()->setSectionResizeMode(QHeaderView::Interactive);
  t->horizontalHeader()->setStretchLastSection(false);
  for (int r = 0; r < t->rowCount(); ++r) {
    t->setItem(r, 0, new QTableWidgetItem(QString::number(r)));
    fillRow(t, r);
  }
  t->resizeColumnsToContents();
  t->setColumnWidth(0, 30);
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
  t->resizeColumnsToContents();
  return t;
}

QWidget* DesignParamsDialog::padsPage() {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  // Distinct pad stacks: shape and size, hole.
  std::set<std::tuple<int, Coord, Coord, Coord>> stacks;
  for (auto& p : b.pads) stacks.insert({int(p.shape.kind), p.shape.w, p.shape.h, p.drill});
  auto* t = new QTableWidget(int(stacks.size()), 4);
  t->setHorizontalHeaderLabels({"#", tr("Форма"), tr("Размер, %1").arg(unitName(u)), tr("Отверстие, %1").arg(unitName(u))});
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  const char* shapes[] = {"Круг", "Прямоугольник", "Овал", "Скруглённый прямоугольник", "Многоугольник"};  // PadShapeKind
  int r = 0;
  for (auto& [kind, w, h, drill] : stacks) {
    t->setItem(r, 0, new QTableWidgetItem(QString::number(r)));
    t->setItem(r, 1, new QTableWidgetItem(kind >= 0 && kind < int(std::size(shapes)) ? tr(shapes[kind]) : QString::number(kind)));
    t->setItem(r, 2, new QTableWidgetItem(formatLength(w, u, 3) + " x " + formatLength(h, u, 3)));
    t->setItem(r, 3, new QTableWidgetItem(drill > 0 ? formatLength(drill, u, 3) : QString()));
    ++r;
  }
  t->resizeColumnsToContents();
  return t;
}

QWidget* DesignParamsDialog::viaTypesPage() {
  Unit u = doc_->unit();
  return ruleTable(
      {"#", tr("Имя"), tr("Сквозной"), tr("Диам. площадки, %1").arg(unitName(u)), tr("Диам. отверстия, %1").arg(unitName(u))},
      [this] { return int(rules_.viaTypes.size()); },
      [this](QTableWidget* t, int r) {
        auto* name = new QLineEdit(QString::fromStdString(rules_.viaTypes[size_t(r)].name));
        name->setFrame(false);
        connect(name, &QLineEdit::editingFinished, this, [this, name, r] {
          std::string old = rules_.viaTypes[size_t(r)].name, now = name->text().toStdString();
          if (old == now || now.empty()) return;
          for (auto& v : rules_.vias)
            if (v.viaType == old) v.viaType = now;
          rules_.viaTypes[size_t(r)].name = now;
          changed();
        });
        t->setCellWidget(r, 1, name);
        t->setItem(r, 2, new QTableWidgetItem(QString::fromUtf8("✓")));
        auto resize = [this, r](auto field) {
          return [this, r, field](Coord v) {
            ViaType before = rules_.viaTypes[size_t(r)];
            rules_.viaTypes[size_t(r)].*field = v;
            viaEdits_.push_back({before, rules_.viaTypes[size_t(r)]});
          };
        };
        t->setCellWidget(r, 3, lengthCell(rules_.viaTypes[size_t(r)].diameter, resize(&ViaType::diameter)));
        t->setCellWidget(r, 4, lengthCell(rules_.viaTypes[size_t(r)].drill, resize(&ViaType::drill)));
      },
      [this] {
        ViaType t = rules_.viaTypes.empty() ? ViaType{"", mmToNm(0.6), mmToNm(0.3)} : rules_.viaTypes.back();
        t.name = std::format("ПО{}", rules_.viaTypes.size() + 1);
        rules_.viaTypes.push_back(t);
      },
      [this](int r) { rules_.viaTypes.erase(rules_.viaTypes.begin() + r); },
      [this](int a, int b) { std::swap(rules_.viaTypes[size_t(a)], rules_.viaTypes[size_t(b)]); });
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
  t->resizeColumnsToContents();
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
      if (!std::ranges::contains(nets, n.name)) others->addItem(QString::fromStdString(n.name));
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
        t->setCellWidget(r, 4, lengthCell(w.min, [this, r](Coord v) { rules_.widths[size_t(r)].min = v; }));
        t->setCellWidget(r, 5, lengthCell(w.nom, [this, r](Coord v) { rules_.widths[size_t(r)].nom = v; }));
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
        t->setCellWidget(r, 5, lengthCell(c.min, [this, r](Coord v) { rules_.clearances[size_t(r)].min = v; }));
        t->setCellWidget(r, 6, lengthCell(c.nom, [this, r](Coord v) { rules_.clearances[size_t(r)].nom = v; }));
      },
      [this] {
        ClearanceRule c = rules_.clearances.empty() ? ClearanceRule{true, {}, {}, {}, mmToNm(0.2), mmToNm(0.25)}
                                                    : rules_.clearances.back();
        rules_.clearances.push_back(c);
      },
      [this](int r) { rules_.clearances.erase(rules_.clearances.begin() + r); },
      [this](int a, int b) { std::swap(rules_.clearances[size_t(a)], rules_.clearances[size_t(b)]); });
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
