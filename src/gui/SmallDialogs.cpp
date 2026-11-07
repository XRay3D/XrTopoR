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
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QTableWidget>
#include <QVBoxLayout>
#include <algorithm>
#include <cmath>

namespace xr::gui {

namespace {

QString netsText(const RuleNets& n) {
  switch (n.kind) {
    case RuleNets::Kind::All: return QObject::tr("Все цепи");
    case RuleNets::Kind::Net: return QString::fromStdString(n.name);
    case RuleNets::Kind::Group: return QObject::tr("Группа: %1").arg(QString::fromStdString(n.name));
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
  for (int i = 0; i < int(rules.widths.size()); ++i) {
    const WidthRule& w = rules.widths[size_t(i)];
    if (!w.enabled) continue;
    bool layerOk = w.layers.empty() || (layer >= 0 && r::contains(w.layers, b.layers[layer].name));
    bool netOk = w.nets.kind == RuleNets::Kind::All;
    for (int n : nets) {
      const std::string& name = b.nets[n].name;
      netOk = netOk || (w.nets.kind == RuleNets::Kind::Net && w.nets.name == name) ||
              (w.nets.kind == RuleNets::Kind::Group && groupHas(w.nets.name, name));
    }
    if (!layerOk || !netOk) continue;
    int r = t->rowCount();
    t->insertRow(r);
    QStringList layers;
    for (auto& l : w.layers) layers << QString::fromStdString(l);
    QStringList cells{QString::number(i), layers.isEmpty() ? QObject::tr("Все") : layers.join(", "), netsText(w.nets),
                      formatLength(w.min, u, 4), formatLength(w.nom, u, 4)};
    for (int c = 0; c < cells.size(); ++c) t->setItem(r, c, new QTableWidgetItem(cells[c]));
  }
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

std::optional<int> askNet(QWidget* parent, Document* doc, int current) {
  const Board& b = *doc->board();
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Изменение цепи"));
  auto* v = new QVBoxLayout(&dlg);
  v->addWidget(new QLabel(QObject::tr("Новая цепь выделенных объектов:")));
  auto* filter = new QLineEdit;
  filter->setPlaceholderText(QObject::tr("Фильтр"));
  filter->setClearButtonEnabled(true);
  v->addWidget(filter);
  auto* list = new QListWidget;
  auto* none = new QListWidgetItem(QObject::tr("(без цепи)"), list);
  none->setData(Qt::UserRole, kNoNet);
  std::vector<int> order(b.nets.size());
  for (int i = 0; i < int(order.size()); ++i) order[size_t(i)] = i;
  r::sort(order, {}, [&](int n) { return b.nets[size_t(n)].name; });
  for (int n : order) {
    auto* it = new QListWidgetItem(QString::fromStdString(b.nets[size_t(n)].name), list);
    it->setData(Qt::UserRole, n);
    if (n == current) list->setCurrentItem(it);
  }
  v->addWidget(list);
  QObject::connect(filter, &QLineEdit::textChanged, list, [list](const QString& t) {
    for (int i = 0; i < list->count(); ++i) list->item(i)->setHidden(!t.isEmpty() && !list->item(i)->text().contains(t, Qt::CaseInsensitive));
  });
  auto* bb = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
  v->addWidget(bb);
  QObject::connect(bb, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  QObject::connect(bb, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  QObject::connect(list, &QListWidget::itemDoubleClicked, &dlg, &QDialog::accept);
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
