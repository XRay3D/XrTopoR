#include "gui/SmallDialogs.h"
#include "gui/SpinBox.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDialog>
#include <QDialogButtonBox>
#include <QDoubleSpinBox>
#include <QFormLayout>
#include <QHeaderView>
#include <QInputDialog>
#include <QHBoxLayout>
#include <QMessageBox>
#include <QToolButton>
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QPushButton>
#include <QTableWidget>
#include <QVBoxLayout>
#include <algorithm>

#include "core/Edit.h"
#include <cmath>
#include <map>

namespace xr::gui {

namespace {

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

std::optional<Coord> askTrackWidth(QWidget* parent, Document* doc, const std::vector<int>& nets, LayerId layer, Coord current) {
  const Board& b = *doc->board();
  Unit u = doc->unit();
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Ширина проводника"));
  auto* v = new QVBoxLayout(&dlg);
  auto* f = new QFormLayout;
  auto* width = new DoubleSpinBox;
  width->setDecimals(u == Unit::Mil ? 2 : 4);
  width->setRange(0.0001, 1e5);
  width->setSuffix(" " + unitName(u));
  width->setValue(toUnit(double(current), u));
  f->addRow(QObject::tr("Ширина:"), width);
  v->addLayout(f);
  // «Активные ширины»: the minimum and the nominal of the rule that holds for each of these nets (filled below).
  v->addWidget(new QLabel(QObject::tr("Активные ширины")));
  auto* active = new QListWidget;
  active->setObjectName("widths");
  v->addWidget(active);
  // A width clicked is the answer.
  auto pick = [&](Coord w) {
    width->setValue(toUnit(double(w), u));
    dlg.accept();
  };
  // «Действующие правила»: the width rules that apply to these wires, later ones winning.
  v->addWidget(new QLabel(QObject::tr("Действующие правила")));
  auto* t = new QTableWidget(0, 5);
  t->setHorizontalHeaderLabels({"#", QObject::tr("Слой"), QObject::tr("Применяется к"),
                                QObject::tr("Мин., %1").arg(unitName(u)), QObject::tr("Ном., %1").arg(unitName(u))});
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  t->horizontalHeader()->setStretchLastSection(true);
  DesignRules rules = b.rules ? *b.rules : rulesFromBoard(b);
  auto groupHas = [&](const std::string& g, const std::string& net) {
    for (auto& grp : rules.netGroups)
      if (grp.name == g && r::contains(grp.nets, net)) return true;
    return false;
  };
  auto holdsFor = [&](const WidthRule& w, int n) {
    if (w.nets.kind == RuleNets::Kind::All) return true;
    if (n < 0) return false;
    const std::string& name = b.nets[size_t(n)].name;
    return (w.nets.kind == RuleNets::Kind::Net && w.nets.name == name) || (w.nets.kind == RuleNets::Kind::Group && groupHas(w.nets.name, name));
  };
  auto onLayer = [&](const WidthRule& w) { return w.enabled && (w.layers.empty() || (layer >= 0 && r::contains(w.layers, b.layers[layer].name))); };
  // The rule in force for a net is the last that holds for it; wires of no net: those for all nets.
  std::map<Coord, QStringList> widths;
  for (int n : nets.empty() ? std::vector<int>{-1} : nets) {
    auto held = rules.widths | v::filter([&](const WidthRule& w) { return onLayer(w) && holdsFor(w, n); });
    auto last = r::find_last_if(held, [](const WidthRule&) { return true; }).begin();
    if (last == held.end()) continue;
    widths[(*last).min] << QObject::tr("мин.");
    widths[(*last).nom] << QObject::tr("ном.");
  }
  for (auto& [w, what] : widths) {
    what.removeDuplicates();
    auto* item = new QListWidgetItem(QString("%1 %2  (%3)").arg(formatLength(double(w), u, 4), unitName(u), what.join(", ")));
    item->setData(Qt::UserRole, qlonglong(w));
    active->addItem(item);
    if (w == current) active->setCurrentItem(item);
  }
  active->setFixedHeight(active->sizeHintForRow(0) * std::max(active->count(), 1) + 2 * active->frameWidth() + 2);
  QObject::connect(active, &QListWidget::itemClicked, &dlg, [&](QListWidgetItem* item) { pick(Coord(item->data(Qt::UserRole).toLongLong())); });
  for (int i = 0; i < int(rules.widths.size()); ++i) {
    const WidthRule& w = rules.widths[size_t(i)];
    if (!onLayer(w) || !(nets.empty() ? holdsFor(w, -1) : r::any_of(nets, [&](int n) { return holdsFor(w, n); }))) continue;
    int r = t->rowCount();
    t->insertRow(r);
    QStringList layers;
    for (auto& l : w.layers) layers << QString::fromStdString(l);
    QStringList cells{QString::number(i), layers.isEmpty() ? QObject::tr("Все") : layers.join(", "), netsText(w.nets),
                      formatLength(w.min, u, 4), formatLength(w.nom, u, 4)};
    for (int c = 0; c < cells.size(); ++c) t->setItem(r, c, new QTableWidgetItem(cells[c]));
    t->item(r, 3)->setData(Qt::UserRole, qlonglong(w.min));
    t->item(r, 4)->setData(Qt::UserRole, qlonglong(w.nom));
  }
  QObject::connect(t, &QTableWidget::itemClicked, &dlg, [&](QTableWidgetItem* item) {
    if (item->column() >= 3) pick(Coord(item->data(Qt::UserRole).toLongLong()));
  });
  t->resizeColumnsToContents();
  v->addWidget(t, 1);
  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
  QObject::connect(box, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  QObject::connect(box, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  v->addWidget(box);
  dlg.resize(560, 320);
  if (dlg.exec() != QDialog::Accepted) return std::nullopt;
  return Coord(std::llround(fromUnit(width->value(), u)));
}

std::optional<double> askRotationAngle(QWidget* parent) {
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Повернуть на угол"));
  auto* f = new QFormLayout(&dlg);
  auto* angle = new DoubleSpinBox;
  angle->setRange(-360, 360);
  angle->setDecimals(3);
  angle->setValue(45);
  f->addRow(QObject::tr("Угол поворота, °:"), angle);
  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
  QObject::connect(box, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  QObject::connect(box, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  f->addRow(box);
  if (dlg.exec() != QDialog::Accepted) return std::nullopt;
  return angle->value();
}

bool askText(QWidget* parent, Document* doc, Text& t) {
  const Board& b = *doc->board();
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Надпись"));
  auto* f = new QFormLayout(&dlg);
  auto* text = new QLineEdit(QString::fromStdString(t.text.empty() ? "Text" : t.text));
  f->addRow(QObject::tr("Текст:"), text);
  auto* layer = new QComboBox;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind != LayerKind::Edge) layer->addItem(QString::fromStdString(b.layers[l].name), int(l));
  layer->setCurrentIndex(std::max(0, layer->findData(int(t.layer))));
  f->addRow(QObject::tr("Слой:"), layer);
  auto* style = new QComboBox;
  Unit u = doc->unit();
  for (int i = 0; i < int(b.textStyles.size()); ++i)
    style->addItem(QObject::tr("%1 (высота %2 %3)")
                       .arg(QString::fromStdString(b.textStyles[size_t(i)].name),
                            formatLength(double(b.textStyles[size_t(i)].height), u, 3), unitName(u)),
                   i);
  style->setCurrentIndex(std::max(0, style->findData(t.style)));
  f->addRow(QObject::tr("Стиль:"), style);
  auto* angle = new DoubleSpinBox;
  angle->setRange(-360, 360);
  angle->setDecimals(2);
  angle->setSuffix("°");
  angle->setValue(t.angle);
  f->addRow(QObject::tr("Поворот:"), angle);
  auto* align = new QComboBox;
  for (const char* a : {"Слева сверху", "По центру сверху", "Справа сверху", "Слева по центру", "По центру", "Справа по центру",
                        "Слева снизу", "По центру снизу", "Справа снизу"})
    align->addItem(QObject::tr(a));
  align->setCurrentIndex(int(t.align));
  f->addRow(QObject::tr("Точка привязки:"), align);
  auto* mirror = new QCheckBox(QObject::tr("Зеркальность"));
  mirror->setChecked(t.mirror);
  f->addRow(mirror);
  auto* bb = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
  f->addRow(bb);
  QObject::connect(bb, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  QObject::connect(bb, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  text->selectAll();
  text->setFocus();
  if (dlg.exec() != QDialog::Accepted || text->text().isEmpty()) return false;
  t.text = text->text().toStdString();
  t.layer = LayerId(layer->currentData().toInt());
  t.style = style->currentData().toInt();
  t.angle = angle->value();
  t.align = TextAlign(align->currentIndex());
  t.mirror = mirror->isChecked();
  return true;
}

std::optional<int> askNet(QWidget* parent, Document* doc, std::optional<int> current, const QString& what) {
  const Board& b = *doc->board();
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Изменение цепи"));
  auto netName = [&](int n) { return n == kNoNet ? QObject::tr("(без цепи)") : QString::fromStdString(b.nets[size_t(n)].name); };
  auto* v = new QVBoxLayout(&dlg);
  auto* head = new QFormLayout;
  head->addRow(QObject::tr("Выделено:"), new QLabel(what));
  head->addRow(QObject::tr("Текущая цепь:"), new QLabel(current ? netName(*current) : QString()));
  v->addLayout(head);
  v->addWidget(new QLabel(QObject::tr("Список цепей")));
  auto* filter = new QLineEdit;
  filter->setPlaceholderText(QObject::tr("Поиск"));
  filter->setClearButtonEnabled(true);
  v->addWidget(filter);
  auto* list = new QListWidget;
  list->setObjectName("nets");
  auto add = [&](int n) {
    auto* it = new QListWidgetItem(netName(n), list);
    it->setData(Qt::UserRole, n);
    if (current && n == *current) list->setCurrentItem(it);
  };
  // The list filled anew after a net is made, named or taken out; `select`: the net to stand on.
  auto fill = [&](std::optional<int> select) {
    list->clear();
    auto* none = new QListWidgetItem(netName(kNoNet), list);
    none->setData(Qt::UserRole, kNoNet);
    std::vector<int> order(b.nets.size());
    r::iota(order, 0);
    r::sort(order, {}, [&](int n) { return b.nets[size_t(n)].name; });
    for (int n : order) add(n);
    if (current && *current == kNoNet) list->setCurrentItem(none);
    if (select)
      for (int i = 0; i < list->count(); ++i)
        if (list->item(i)->data(Qt::UserRole).toInt() == *select) list->setCurrentItem(list->item(i));
  };
  // TopoR's three buttons over the list: a new net, the chosen one named anew, the chosen one taken out.
  auto* tools = new QHBoxLayout;
  auto tool = [&](const char* name, const QString& text, const QString& tip) {
    auto* t = new QToolButton;
    t->setObjectName(name);
    t->setText(text);
    t->setToolTip(tip);
    tools->addWidget(t);
    return t;
  };
  QToolButton* newNet = tool("newNet", QStringLiteral("＋"), QObject::tr("Новая цепь"));
  QToolButton* renNet = tool("renameNet", QStringLiteral("✎"), QObject::tr("Переименовать"));
  QToolButton* delNet = tool("deleteNet", QStringLiteral("✕"), QObject::tr("Удалить цепь"));
  tools->addStretch();
  v->addLayout(tools);
  fill({});
  v->addWidget(list);
  auto chosen = [&]() -> int { return list->currentItem() ? list->currentItem()->data(Qt::UserRole).toInt() : kNoNet; };
  auto refuse = [&](const std::string& why) {
    const QString text = why == "the name is taken"                           ? QObject::tr("Цепь с таким именем уже есть")
                         : why == "the design's rules name the net"           ? QObject::tr("Цепь названа в правилах проекта: сначала измените правила")
                         : why == "the net of a plane layer"                  ? QObject::tr("Это цепь экранного слоя")
                         : why == "the design's rules name nets by number"    ? QObject::tr("Правила проекта ссылаются на цепи: удалить нельзя")
                                                                              : QString::fromStdString(why);
    QMessageBox::warning(&dlg, dlg.windowTitle(), text);
  };
  QObject::connect(newNet, &QToolButton::clicked, &dlg, [&] {
    bool ok = false;
    const QString name = QInputDialog::getText(&dlg, QObject::tr("Новая цепь"), QObject::tr("Имя цепи:"), QLineEdit::Normal, {}, &ok).trimmed();
    if (!ok || name.isEmpty()) return;
    if (r::contains(b.nets, name.toStdString(), &Net::name)) return refuse("the name is taken");
    auto before = doc->beginEdit();
    const int n = doc->board()->addNet(name.toStdString());
    doc->commitEdit(before, QObject::tr("Новая цепь"), false);
    fill(n);
  });
  QObject::connect(renNet, &QToolButton::clicked, &dlg, [&] {
    const int n = chosen();
    if (n == kNoNet) return;
    bool ok = false;
    const QString name = QInputDialog::getText(&dlg, QObject::tr("Переименовать"), QObject::tr("Имя цепи:"), QLineEdit::Normal, netName(n), &ok).trimmed();
    if (!ok || name.isEmpty()) return;
    auto before = doc->beginEdit();
    if (const std::string why = edit::renameNet(*doc->board(), n, name.toStdString()); !why.empty()) return refuse(why);
    doc->commitEdit(before, QObject::tr("Переименовать цепь"), false);
    fill(n);
  });
  QObject::connect(delNet, &QToolButton::clicked, &dlg, [&] {
    const int n = chosen();
    if (n == kNoNet) return;
    size_t used = 0;
    for (const Pad& p : b.pads) used += p.net == n;
    for (const Track& t : b.tracks) used += t.net == n;
    for (const Via& x : b.vias) used += x.net == n;
    for (const Zone& z : b.zones) used += z.net == n;
    if (used > 0 && QMessageBox::question(&dlg, QObject::tr("Удалить цепь"),
                                          QObject::tr("К цепи %1 относится объектов: %2. Они останутся без цепи. Удалить?").arg(netName(n)).arg(used)) != QMessageBox::Yes)
      return;
    auto before = doc->beginEdit();
    if (const std::string why = edit::removeNet(*doc->board(), n); !why.empty()) return refuse(why);
    doc->invalidateModel();
    doc->commitEdit(before, QObject::tr("Удалить цепь"), false);
    if (current) current = *current == n ? kNoNet : *current > n ? *current - 1 : *current;
    fill({});
  });
  QObject::connect(filter, &QLineEdit::textChanged, list, [list](const QString& t) {
    for (int i = 0; i < list->count(); ++i) list->item(i)->setHidden(!t.isEmpty() && !list->item(i)->text().contains(t, Qt::CaseInsensitive));
  });
  auto* bb = new QDialogButtonBox;
  auto* assign = bb->addButton(QObject::tr("Назначить"), QDialogButtonBox::AcceptRole);
  assign->setObjectName("assign");
  bb->addButton(QObject::tr("Отмена"), QDialogButtonBox::RejectRole);
  v->addWidget(bb);
  auto refresh = [&] {
    QListWidgetItem* it = list->currentItem();
    assign->setEnabled(it && (!current || it->data(Qt::UserRole).toInt() != *current));
  };
  refresh();
  QObject::connect(list, &QListWidget::currentItemChanged, &dlg, refresh);
  QObject::connect(bb, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  QObject::connect(bb, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  QObject::connect(list, &QListWidget::itemDoubleClicked, &dlg, [&] {
    if (assign->isEnabled()) dlg.accept();
  });
  filter->setFocus();
  if (dlg.exec() != QDialog::Accepted || !list->currentItem()) return std::nullopt;
  return list->currentItem()->data(Qt::UserRole).toInt();
}

void showCopperArea(QWidget* parent, Document* doc) {
  const Board& b = *doc->board();
  Unit u = doc->unit();
  double unit2 = u == Unit::Mil ? double(kNmPerMil) * kNmPerMil : double(kNmPerMm) * kNmPerMm;
  QString uname = u == Unit::Mil ? QObject::tr("мил²") : QObject::tr("мм²");
  double board = 0;
  if (!b.outline.empty()) {
    board = std::abs(polygonArea(b.outline[0]));
    for (size_t i = 1; i < b.outline.size(); ++i) board -= std::abs(polygonArea(b.outline[i]));
  }
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Площадь металлизации"));
  auto* v = new QVBoxLayout(&dlg);
  auto cu = b.copperLayers();
  auto* t = new QTableWidget(int(cu.size()), 6);
  t->setHorizontalHeaderLabels({QObject::tr("Слой"), QObject::tr("Области металлизации"), QObject::tr("Проводники"),
                                QObject::tr("Контакты"), QObject::tr("Итого, %1").arg(uname), QObject::tr("% площади платы")});
  t->verticalHeader()->hide();
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  for (int i = 0; i < int(cu.size()); ++i) {
    LayerId l = cu[size_t(i)];
    double zones = 0, wires = 0, pads = 0;
    for (auto& z : b.zones)
      if (z.layer == l)
        for (auto& f : z.filled) zones += std::abs(polygonArea(f));
    for (auto& tr : b.tracks)
      if (tr.layer == l) {
        double len = tr.length();
        wires += len * double(tr.width) + kPi * tr.width * tr.width / 4;
      }
    for (auto& p : b.pads)
      if (p.onLayer(l)) pads += std::abs(polygonArea(p.shapeGeom().outline(2000)));
    double total = zones + wires + pads;
    QStringList cells{QString::fromStdString(b.layers[l].name), QString::number(zones / unit2, 'f', 2),
                      QString::number(wires / unit2, 'f', 2), QString::number(pads / unit2, 'f', 2),
                      QString::number(total / unit2, 'f', 2),
                      board > 0 ? QString::number(100 * total / board, 'f', 1) : QString("-")};
    for (int c = 0; c < cells.size(); ++c) t->setItem(i, c, new QTableWidgetItem(cells[c]));
  }
  t->resizeColumnsToContents();
  v->addWidget(t, 1);
  v->addWidget(new QLabel(QObject::tr("<i>Оценка: перекрытия объектов не вычитаются.</i>")));
  auto* box = new QDialogButtonBox(QDialogButtonBox::Close);
  QObject::connect(box, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  v->addWidget(box);
  dlg.resize(700, 300);
  dlg.exec();
}

}  // namespace xr::gui
