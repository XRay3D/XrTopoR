#include "gui/PadstackDialogs.h"

#include <QButtonGroup>
#include <QCheckBox>
#include <QCollator>
#include <QComboBox>
#include <QDialogButtonBox>
#include <QDoubleSpinBox>
#include <QFormLayout>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QMessageBox>
#include <QMouseEvent>
#include <QPainter>
#include <QPainterPath>
#include <QPushButton>
#include <QSpinBox>
#include <QSplitter>
#include <QStackedWidget>
#include <QTabWidget>
#include <QTableWidget>
#include <QToolButton>
#include <QTreeWidget>
#include <QVBoxLayout>
#include <algorithm>
#include <cmath>
#include <set>

#include "core/Padstack.h"

namespace xr::gui {

namespace {

// TopoR's row colours in the pad editor.
const QColor kStackRow(0xff, 0xb8, 0xb8), kThermalRow(0xa8, 0xf0, 0xa8), kClassRow(0xf4, 0xb4, 0xf4),
    kLayerRow(0xf8, 0xf5, 0xa8);

// The classes of layers the editor shows (TopoR's violet rows), in its order.
const char* const kClasses[] = {"Signal", "Plane", "Mechanical", "Silk", "Paste", "Mask"};

QDoubleSpinBox* lengthSpin(Unit u, bool signedValue = false) {
  auto* s = new QDoubleSpinBox;
  s->setDecimals(u == Unit::Mil ? 2 : 4);
  s->setRange(signedValue ? -1e5 : 0, 1e5);
  s->setSuffix(" " + unitName(u));
  s->setKeyboardTracking(false);
  return s;
}

// The outline of a detail around its anchor (board frame, nm).
Polyline detailOutline(const PadDetail& d) {
  Pad p;
  p.shape = detailShape(d, false);
  p.pos = Point(d.shift);
  return p.shapeGeom().outline(std::max(1000.0, double(std::max(d.w, d.h)) / 200));
}

BBox detailBox(const PadDetail& d) {
  BBox bb;
  for (auto& v : detailOutline(d)) bb.add(v);
  return bb;
}

// The detail the thermal is drawn around: the signal one, else any copper one.
const PadDetail* copperDetail(const Padstack& ps) {
  for (auto& d : ps.details)
    if (d.layerClass == "Signal") return &d;
  for (auto& d : ps.details)
    if (d.layerClass == "Plane" || d.layer == "Top" || d.layer == "Bottom") return &d;
  return ps.details.empty() ? nullptr : &ps.details.front();
}

}  // namespace

QString layerClassName(const std::string& cls) {
  if (cls == "Signal") return QObject::tr("Сигнальный");
  if (cls == "Plane") return QObject::tr("Опорный");
  if (cls == "Mechanical") return QObject::tr("Механический");
  if (cls == "Silk") return QObject::tr("Шелкография");
  if (cls == "Paste") return QObject::tr("Паяльная паста");
  if (cls == "Mask") return QObject::tr("Маска");
  if (cls == "Assy") return QObject::tr("Сборочный");
  if (cls == "Doc") return QObject::tr("Документирующий");
  return QString::fromStdString(cls);
}

QString detailSize(const PadDetail& d, Unit u) {
  auto n = [&](double nm) { return QString::number(toUnit(nm, u), 'f', 2); };
  if (d.form == PadDetail::Form::Circle) return n(double(d.w));
  if (d.form == PadDetail::Form::Oval)
    return n(double(d.w) + std::abs(d.stretch.x)) + QString::fromUtf8("×") + n(double(d.w) + std::abs(d.stretch.y));
  BBox bb = detailBox(d);
  double w = d.form == PadDetail::Form::Polygon ? bb.width() : double(d.w);
  double h = d.form == PadDetail::Form::Polygon ? bb.height() : double(d.h);
  return n(w) + QString::fromUtf8("×") + n(h);
}

QString detailFormName(const PadDetail& d) {
  switch (d.form) {
    case PadDetail::Form::Circle: return QObject::tr("Круг");
    case PadDetail::Form::Oval: return QObject::tr("Овал");
    case PadDetail::Form::Rect:
      if (d.handling == CornerHandling::Rounding) return QObject::tr("Прямоугольник со скруглёнными углами");
      if (d.handling == CornerHandling::Chamfer) return QObject::tr("Прямоугольник со срезанными углами");
      return QObject::tr("Прямоугольник");
    case PadDetail::Form::Polygon: return QObject::tr("Многоугольник");
  }
  return {};
}

QIcon detailIcon(const PadDetail& d) {
  QPixmap pm(16, 12);
  pm.fill(Qt::transparent);
  QPainter p(&pm);
  p.setRenderHint(QPainter::Antialiasing);
  p.setPen(QPen(QColor(0x70, 0x68, 0x98), 1));
  p.setBrush(QColor(0xc8, 0xc0, 0xe0));
  BBox bb = detailBox(d);
  if (!bb.valid() || bb.width() <= 0 || bb.height() <= 0) return QIcon(pm);
  double k = std::min(13.0 / bb.width(), 9.0 / bb.height());
  QPolygonF poly;
  for (auto& v : detailOutline(d)) poly << QPointF(8 + (v.x - bb.center().x) * k, 6 + (v.y - bb.center().y) * k);
  p.drawPolygon(poly);
  return QIcon(pm);
}

// ---------------------------------------------------------------- preview

void PadPreview::show(const Padstack& ps, const PadDetail* detail, bool thermal) {
  ps_ = ps;
  detail_ = detail ? std::optional<PadDetail>(*detail) : std::nullopt;
  thermal_ = thermal;
  update();
}

void PadPreview::paintEvent(QPaintEvent*) {
  QPainter p(this);
  p.setRenderHint(QPainter::Antialiasing);
  const QColor green(0x24, 0x5a, 0x2a), blue(0x20, 0x40, 0xff);
  p.fillRect(rect(), green);
  const PadDetail* cu = thermal_ ? copperDetail(ps_) : nullptr;
  BBox bb;
  double hole = double(ps_.type == PadstackType::SMD ? 0 : ps_.drill);
  if (hole > 0) {
    bb.add(Vec2{-hole / 2, -hole / 2});
    bb.add(Vec2{hole / 2, hole / 2});
  }
  if (detail_) bb.add(detailBox(*detail_));
  if (cu) bb.add(detailBox(*cu).inflated(double(ps_.thermal.backoff)));
  if (!bb.valid()) bb = BBox{-500'000, -500'000, 500'000, 500'000};
  double span = std::max({bb.width(), bb.height(), 1.0});
  double k = 0.8 * std::min(width(), height()) / span;
  QPointF c(width() / 2.0, height() / 2.0);
  Vec2 mid = bb.center();
  auto map = [&](Vec2 v) { return c + QPointF((v.x - mid.x) * k, (v.y - mid.y) * k); };
  auto polygon = [&](const Polyline& pl) {
    QPolygonF q;
    for (auto& v : pl) q << map(v);
    return q;
  };
  p.setPen(Qt::NoPen);
  if (thermal_ && cu) {
    // Plane copper, the barrier ring round the pad, the spokes across it.
    p.fillRect(rect(), blue);
    Pad pad;
    pad.shape = detailShape(*cu, false);
    pad.pos = Point(cu->shift);
    p.setBrush(green);
    p.drawPolygon(polygon(pad.shapeGeom(double(ps_.thermal.backoff)).outline(2000)));
    p.setBrush(blue);
    p.drawPolygon(polygon(pad.shapeGeom().outline(2000)));
    double reach = span;
    for (int i = 0; i < std::max(1, ps_.thermal.spokes); ++i) {
      double a = degToRad(ps_.thermal.angle + 360.0 * i / std::max(1, ps_.thermal.spokes));
      Vec2 dir{std::cos(a), -std::sin(a)};
      Shape spoke = Shape::capsule(cu->shift, cu->shift + dir * reach, double(ps_.thermal.spokeWidth) / 2);
      p.drawPolygon(polygon(spoke.outline(2000)));
    }
  } else if (detail_) {
    p.setBrush(blue);
    p.drawPolygon(polygon(detailOutline(*detail_)));
  }
  if (hole > 0) {
    p.setBrush(Qt::black);
    double r = hole / 2 * k;
    p.drawEllipse(map({0, 0}), r, r);
  }
  // The anchor point.
  p.setPen(QPen(QColor(0xe0, 0xe0, 0xe0), 1));
  QPointF o = map({0, 0});
  p.drawLine(QPointF(o.x(), 0), QPointF(o.x(), height()));
  p.drawLine(QPointF(0, o.y()), QPointF(width(), o.y()));
}

// ---------------------------------------------------------------- pad stack editor

PadstackEditor::PadstackEditor(const Board& b, Padstack ps, Unit u, std::vector<std::string> others, bool isNew,
                               QWidget* parent)
    : QDialog(parent), b_(b), ps_(std::move(ps)), original_(ps_), u_(u), others_(std::move(others)), isNew_(isNew) {
  setWindowTitle(tr("Редактор контактных площадок"));
  resize(920, 600);
  auto* v = new QVBoxLayout(this);
  auto* split = new QSplitter(Qt::Horizontal, this);
  auto* left = new QWidget(split);
  auto* lv = new QVBoxLayout(left);
  lv->setContentsMargins(0, 0, 0, 0);
  tree_ = new QTreeWidget(left);
  tree_->setColumnCount(2);
  tree_->setHeaderLabels({tr("Имя"), tr("Свойства")});
  tree_->setRootIsDecorated(false);
  tree_->setIndentation(10);
  tree_->header()->setSectionResizeMode(0, QHeaderView::Interactive);
  tree_->setColumnWidth(0, 150);
  lv->addWidget(tree_, 1);
  auto* buttons = new QHBoxLayout;
  addDetail_ = new QPushButton(tr("Добавить деталь"), left);
  delDetail_ = new QPushButton(tr("Удалить деталь"), left);
  undo_ = new QPushButton(tr("Отменить изменения"), left);
  buttons->addWidget(addDetail_);
  buttons->addWidget(delDetail_);
  buttons->addWidget(undo_);
  lv->addLayout(buttons);
  props_ = new QStackedWidget(left);
  props_->addWidget(stackPage());
  props_->addWidget(thermalPage());
  props_->addWidget(layerPage());
  props_->addWidget(detailPage());
  lv->addWidget(props_);
  preview_ = new PadPreview(split);
  split->addWidget(left);
  split->addWidget(preview_);
  split->setSizes({480, 440});
  v->addWidget(split, 1);
  auto* bottom = new QHBoxLayout;
  bottom->addStretch(1);
  apply_ = new QPushButton(tr("Применить"), this);
  apply_->setObjectName("apply");
  auto* close = new QPushButton(tr("Закрыть"), this);
  bottom->addWidget(apply_);
  bottom->addWidget(close);
  v->addLayout(bottom);
  apply_->setEnabled(isNew_);
  undo_->setEnabled(false);

  connect(tree_, &QTreeWidget::currentItemChanged, this, [this](QTreeWidgetItem* it) { select(it); });
  connect(addDetail_, &QPushButton::clicked, this, [this] {
    QTreeWidgetItem* it = tree_->currentItem();
    if (!it || detailOf(it)) return;
    auto row = Row(it->data(0, Qt::UserRole).toInt());
    std::string key = it->data(0, Qt::UserRole + 1).toString().toStdString();
    // A new detail is like the signal one (or a 1 mm circle), on this class or layer.
    PadDetail d;
    if (const PadDetail* cu = copperDetail(ps_)) d = *cu;
    else {
      d.form = PadDetail::Form::Circle;
      d.w = d.h = mmToNm(1);
    }
    d.layer.clear();
    d.layerClass.clear();
    (row == Row::Class ? d.layerClass : d.layer) = key;
    ps_.details.push_back(d);
    edited();
    fillTree();
  });
  connect(delDetail_, &QPushButton::clicked, this, [this] {
    QTreeWidgetItem* it = tree_->currentItem();
    PadDetail* d = it ? detailOf(it) : nullptr;
    if (!d) return;
    ps_.details.erase(ps_.details.begin() + (d - ps_.details.data()));
    edited();
    fillTree();
  });
  connect(undo_, &QPushButton::clicked, this, [this] {
    ps_ = original_;
    undo_->setEnabled(false);
    apply_->setEnabled(isNew_);
    fillTree();
  });
  connect(apply_, &QPushButton::clicked, this, [this] {
    std::string name = name_->text().trimmed().toStdString();
    if (name.empty() || std::ranges::contains(others_, name)) {
      QMessageBox::warning(this, windowTitle(), tr("Стек КП с таким именем уже существует."));
      return;
    }
    ps_.name = name;
    original_ = ps_;
    isNew_ = false;
    name_->setReadOnly(true);
    apply_->setEnabled(false);
    undo_->setEnabled(false);
    emit applied(ps_);
  });
  connect(close, &QPushButton::clicked, this, [this] {
    if (apply_->isEnabled()) {
      auto r = QMessageBox::question(this, windowTitle(), tr("Применить изменения?"),
                                     QMessageBox::Yes | QMessageBox::No | QMessageBox::Cancel);
      if (r == QMessageBox::Cancel) return;
      if (r == QMessageBox::Yes) {
        apply_->click();
        if (apply_->isEnabled()) return;  // refused
      }
    }
    accept();
  });
  fillTree();
}

void PadstackEditor::edited() {
  apply_->setEnabled(true);
  undo_->setEnabled(true);
}

PadDetail* PadstackEditor::detailOf(QTreeWidgetItem* it) {
  auto row = Row(it->data(0, Qt::UserRole).toInt());
  if (row == Row::Detail) {
    int i = it->data(0, Qt::UserRole + 1).toInt();
    return i >= 0 && size_t(i) < ps_.details.size() ? &ps_.details[size_t(i)] : nullptr;
  }
  std::string key = it->data(0, Qt::UserRole + 1).toString().toStdString();
  for (auto& d : ps_.details) {
    if (row == Row::Class && d.layer.empty() && d.layerClass == key) return &d;
    if (row == Row::Layer && d.layer == key) return &d;
  }
  return nullptr;
}

void PadstackEditor::fillTree() {
  updating_ = true;
  // Keep the selection: by row kind and key.
  QString keepKind, keepKey;
  if (auto* it = tree_->currentItem()) {
    keepKind = it->data(0, Qt::UserRole).toString();
    keepKey = it->data(0, Qt::UserRole + 1).toString();
    if (Row(it->data(0, Qt::UserRole).toInt()) == Row::Detail)
      if (QTreeWidgetItem* above = tree_->itemAbove(it)) {
        keepKind = above->data(0, Qt::UserRole).toString();
        keepKey = above->data(0, Qt::UserRole + 1).toString();
      }
  }
  tree_->clear();
  auto row = [&](Row r, const QString& name, const QString& props, const QColor& bg, const QString& key) {
    auto* it = new QTreeWidgetItem(tree_, {name, props});
    it->setData(0, Qt::UserRole, int(r));
    it->setData(0, Qt::UserRole + 1, key);
    for (int c = 0; c < 2; ++c) it->setBackground(c, bg);
    return it;
  };
  auto detailRow = [&](QTreeWidgetItem* parent, size_t i) {
    const PadDetail& d = ps_.details[i];
    auto n = [&](Coord c) { return formatLength(double(c), u_, 4) + unitName(u_); };
    QString props;
    switch (d.form) {
      case PadDetail::Form::Circle: props = tr("Диаметр: %1").arg(n(d.w)); break;
      case PadDetail::Form::Oval: props = tr("Диаметр: %1, Вытягивание: %2").arg(n(d.w), detailSize(d, u_)); break;
      case PadDetail::Form::Rect: props = tr("Ширина: %1, Высота: %2").arg(n(d.w), n(d.h)); break;
      case PadDetail::Form::Polygon: props = tr("Вершин: %1").arg(d.poly.size()); break;
    }
    auto* it = new QTreeWidgetItem(tree_, {"   " + detailFormName(d), props});
    it->setIcon(0, detailIcon(d));
    it->setData(0, Qt::UserRole, int(Row::Detail));
    it->setData(0, Qt::UserRole + 1, int(i));
    (void)parent;
    return it;
  };
  QString types[] = {tr("Сквозной"), tr("Планарный"), tr("Монтажное отверстие")};
  row(Row::Stack, QString::fromStdString(ps_.name.empty() ? std::string("?") : ps_.name),
      "[" + types[int(ps_.type)] + "]", kStackRow, {});
  const PadThermal& t = ps_.thermal;
  row(Row::Thermal, tr("Термобарьер"),
      tr("Зазор: %1%3, Спица: %2%3, Число спиц: %4")
          .arg(formatLength(double(t.backoff), u_, 4), formatLength(double(t.spokeWidth), u_, 4), unitName(u_))
          .arg(t.spokes),
      kThermalRow, {});
  std::vector<std::string> classes(std::begin(kClasses), std::end(kClasses));
  for (auto& d : ps_.details)
    if (d.layer.empty() && !std::ranges::contains(classes, d.layerClass)) classes.push_back(d.layerClass);
  auto kindText = [&](const std::string& cls) {
    return cls == "Signal" || cls == "Plane" ? tr("[Сигнальный слой]") : tr("[Механический слой]");
  };
  for (auto& cls : classes) {
    auto* it = row(Row::Class, " : " + layerClassName(cls), kindText(cls), kClassRow, QString::fromStdString(cls));
    for (size_t i = 0; i < ps_.details.size(); ++i)
      if (ps_.details[i].layer.empty() && ps_.details[i].layerClass == cls) detailRow(it, i);
  }
  std::vector<std::string> layers;
  for (auto& L : b_.layers)
    if (L.kind != LayerKind::Edge) layers.push_back(L.name);
  for (auto& d : ps_.details)
    if (!d.layer.empty() && !std::ranges::contains(layers, d.layer)) layers.push_back(d.layer);
  for (auto& name : layers) {
    LayerId l = b_.findLayer(name);
    std::string cls = l >= 0 ? layerClassOf(b_, l) : std::string("Signal");
    auto* it = row(Row::Layer, QString::fromStdString(name) + " : " + layerClassName(cls), kindText(cls), kLayerRow,
                   QString::fromStdString(name));
    for (size_t i = 0; i < ps_.details.size(); ++i)
      if (ps_.details[i].layer == name) detailRow(it, i);
  }
  QTreeWidgetItem* current = tree_->topLevelItem(0);
  for (int i = 0; i < tree_->topLevelItemCount(); ++i) {
    auto* it = tree_->topLevelItem(i);
    if (it->data(0, Qt::UserRole).toString() == keepKind && it->data(0, Qt::UserRole + 1).toString() == keepKey) {
      current = it;
      // The detail under its class/layer row, if there is one.
      if (i + 1 < tree_->topLevelItemCount() && Row(tree_->topLevelItem(i + 1)->data(0, Qt::UserRole).toInt()) == Row::Detail)
        current = tree_->topLevelItem(i + 1);
      break;
    }
  }
  updating_ = false;
  tree_->setCurrentItem(current);
  select(current);
}

void PadstackEditor::select(QTreeWidgetItem* it) {
  if (updating_ || !it) return;
  updating_ = true;
  auto row = Row(it->data(0, Qt::UserRole).toInt());
  PadDetail* d = detailOf(it);
  addDetail_->setEnabled((row == Row::Class || row == Row::Layer) && !d);
  delDetail_->setEnabled(d != nullptr);
  switch (row) {
    case Row::Stack:
      props_->setCurrentIndex(0);
      name_->setText(QString::fromStdString(ps_.name));
      name_->setReadOnly(!isNew_);
      type_->setCurrentIndex(int(ps_.type));
      drill_->setValue(toUnit(double(ps_.drill), u_));
      drill_->setEnabled(ps_.type != PadstackType::SMD);
      plated_->setChecked(ps_.plated);
      break;
    case Row::Thermal: {
      props_->setCurrentIndex(1);
      connect_->setCurrentIndex(int(ps_.connect));
      backoff_->setValue(toUnit(double(ps_.thermal.backoff), u_));
      spokeWidth_->setValue(toUnit(double(ps_.thermal.spokeWidth), u_));
      spokes_->setValue(ps_.thermal.spokes);
      spokeAngle_->setValue(ps_.thermal.angle);
      bool thermal = ps_.connect == PadConnect::Thermal;
      for (QWidget* w : std::initializer_list<QWidget*>{backoff_, spokeWidth_, spokes_, spokeAngle_}) w->setEnabled(thermal);
      break;
    }
    case Row::Class:
    case Row::Layer:
      if (d) {
        props_->setCurrentIndex(3);
        showDetail(*d);
      } else {
        props_->setCurrentIndex(2);
        std::string key = it->data(0, Qt::UserRole + 1).toString().toStdString();
        layerName_->setText(row == Row::Class ? layerClassName(key) : QString::fromStdString(key));
        layerIsClass_->setChecked(row == Row::Class);
        layerType_->setText(it->text(1));
      }
      break;
    case Row::Detail:
      props_->setCurrentIndex(3);
      if (d) showDetail(*d);
      break;
  }
  preview_->show(ps_, d, row == Row::Thermal);
  updating_ = false;
}

void PadstackEditor::showDetail(const PadDetail& d) {
  int form = 0;
  switch (d.form) {
    case PadDetail::Form::Circle: form = 0; break;
    case PadDetail::Form::Oval: form = 1; break;
    case PadDetail::Form::Rect:
      form = d.handling == CornerHandling::Rounding ? 3 : d.handling == CornerHandling::Chamfer ? 4 : 2;
      break;
    case PadDetail::Form::Polygon: form = 5; break;
  }
  for (size_t i = 0; i < forms_.size(); ++i) forms_[i]->setChecked(int(i) == form);
  bool round = form <= 1, rect = form >= 2 && form <= 4, poly = form == 5;
  widthLabel_->setText(round ? tr("Диаметр:") : tr("Ширина:"));
  width_->setValue(toUnit(double(d.w), u_));
  height_->setValue(toUnit(double(d.h), u_));
  stretchX_->setValue(toUnit(d.stretch.x, u_));
  stretchY_->setValue(toUnit(-d.stretch.y, u_));
  shiftX_->setValue(toUnit(d.shift.x, u_));
  shiftY_->setValue(toUnit(-d.shift.y, u_));
  corner_->setValue(toUnit(double(d.handlingValue), u_));
  cornerLabel_->setText(form == 4 ? tr("Срез:") : tr("Радиус:"));
  custom_->setChecked(d.custom);
  for (size_t i = 0; i < cornerChecks_.size(); ++i) {
    cornerChecks_[i]->setChecked(d.corners & (1u << i));
    cornerChecks_[i]->setEnabled(d.custom);
  }
  detailForm_->setRowVisible(width_, !poly);
  detailForm_->setRowVisible(heightRow_, rect);
  detailForm_->setRowVisible(stretchRow_, form == 1);
  detailForm_->setRowVisible(cornerRow_, form == 3 || form == 4);
  polyBox_->setVisible(poly);
  poly_->setRowCount(int(d.poly.size()));
  for (int r = 0; r < int(d.poly.size()); ++r) {
    poly_->setItem(r, 0, new QTableWidgetItem(QString::number(toUnit(d.poly[size_t(r)].x, u_), 'f', 4)));
    poly_->setItem(r, 1, new QTableWidgetItem(QString::number(toUnit(-d.poly[size_t(r)].y, u_), 'f', 4)));
  }
}

void PadstackEditor::detailChanged() {
  QTreeWidgetItem* it = tree_->currentItem();
  if (!it) return;
  edited();
  // The row's text and the preview; the tree keeps its rows.
  PadDetail* d = detailOf(it);
  if (!d) return;
  QTreeWidgetItem* dr = Row(it->data(0, Qt::UserRole).toInt()) == Row::Detail ? it : nullptr;
  if (dr) {
    dr->setText(0, "   " + detailFormName(*d));
    dr->setIcon(0, detailIcon(*d));
    auto n = [&](Coord c) { return formatLength(double(c), u_, 4) + unitName(u_); };
    switch (d->form) {
      case PadDetail::Form::Circle: dr->setText(1, tr("Диаметр: %1").arg(n(d->w))); break;
      case PadDetail::Form::Oval: dr->setText(1, tr("Диаметр: %1, Вытягивание: %2").arg(n(d->w), detailSize(*d, u_))); break;
      case PadDetail::Form::Rect: dr->setText(1, tr("Ширина: %1, Высота: %2").arg(n(d->w), n(d->h))); break;
      case PadDetail::Form::Polygon: dr->setText(1, tr("Вершин: %1").arg(d->poly.size())); break;
    }
  }
  preview_->show(ps_, d, false);
}

QWidget* PadstackEditor::stackPage() {
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  auto* title = new QLabel(tr("<b>Свойства стека контактных площадок</b>"));
  f->addRow(title);
  name_ = new QLineEdit;
  type_ = new QComboBox;
  type_->addItems({tr("Сквозной"), tr("Планарный"), tr("Монтажное отверстие")});
  drill_ = lengthSpin(u_);
  plated_ = new QCheckBox(tr("Металлизированное"));
  auto* drillRow = new QWidget;
  auto* dh = new QHBoxLayout(drillRow);
  dh->setContentsMargins(0, 0, 0, 0);
  dh->addWidget(drill_);
  dh->addWidget(plated_);
  f->addRow(tr("Имя:"), name_);
  f->addRow(tr("Тип:"), type_);
  f->addRow(tr("Диаметр:"), drillRow);
  connect(name_, &QLineEdit::textEdited, this, [this] { edited(); });
  connect(type_, &QComboBox::currentIndexChanged, this, [this](int i) {
    if (updating_) return;
    ps_.type = PadstackType(i);
    if (ps_.type == PadstackType::MountHole) ps_.plated = false;
    if (ps_.type == PadstackType::SMD) ps_.drill = 0;
    edited();
    fillTree();
  });
  connect(drill_, &QDoubleSpinBox::valueChanged, this, [this](double v) {
    if (updating_) return;
    ps_.drill = Coord(std::llround(fromUnit(v, u_)));
    edited();
    preview_->show(ps_, nullptr, false);
  });
  connect(plated_, &QCheckBox::toggled, this, [this](bool on) {
    if (updating_) return;
    ps_.plated = on;
    edited();
  });
  return w;
}

QWidget* PadstackEditor::thermalPage() {
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(new QLabel(tr("<b>Способ подключения к металлизированной области</b>")));
  connect_ = new QComboBox;
  connect_->addItems({tr("Не задано"), tr("Нет подключения"), tr("Напрямую"), tr("Термобарьер")});
  f->addRow(connect_);
  f->addRow(new QLabel(tr("<b>Свойства термобарьера</b>")));
  backoff_ = lengthSpin(u_);
  spokeWidth_ = lengthSpin(u_);
  spokes_ = new QSpinBox;
  spokes_->setRange(1, 8);
  spokeAngle_ = new QDoubleSpinBox;
  spokeAngle_->setRange(-360, 360);
  spokeAngle_->setDecimals(1);
  spokeAngle_->setSuffix(QString::fromUtf8("°"));
  spokeAngle_->setKeyboardTracking(false);
  f->addRow(tr("Зазор:"), backoff_);
  f->addRow(tr("Ширина:"), spokeWidth_);
  f->addRow(tr("Количество:"), spokes_);
  f->addRow(tr("Поворот:"), spokeAngle_);
  auto thermalEdited = [this] {
    if (updating_) return;
    ps_.connect = PadConnect(connect_->currentIndex());
    ps_.thermal.backoff = Coord(std::llround(fromUnit(backoff_->value(), u_)));
    ps_.thermal.spokeWidth = Coord(std::llround(fromUnit(spokeWidth_->value(), u_)));
    ps_.thermal.spokes = spokes_->value();
    ps_.thermal.minSpokes = std::min(ps_.thermal.minSpokes, ps_.thermal.spokes);
    ps_.thermal.angle = spokeAngle_->value();
    edited();
    fillTree();
  };
  connect(connect_, &QComboBox::currentIndexChanged, this, thermalEdited);
  connect(backoff_, &QDoubleSpinBox::valueChanged, this, thermalEdited);
  connect(spokeWidth_, &QDoubleSpinBox::valueChanged, this, thermalEdited);
  connect(spokes_, &QSpinBox::valueChanged, this, thermalEdited);
  connect(spokeAngle_, &QDoubleSpinBox::valueChanged, this, thermalEdited);
  return w;
}

QWidget* PadstackEditor::layerPage() {
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(new QLabel(tr("<b>Свойства слоя</b>")));
  layerName_ = new QLineEdit;
  layerName_->setReadOnly(true);
  layerIsClass_ = new QCheckBox(tr("Класс слоя"));
  layerIsClass_->setEnabled(false);
  layerType_ = new QLineEdit;
  layerType_->setReadOnly(true);
  f->addRow(tr("Имя:"), layerName_);
  f->addRow({}, layerIsClass_);
  f->addRow(tr("Тип:"), layerType_);
  f->addRow(new QLabel(tr("<i>Деталей нет: «Добавить деталь» создаёт её на этой строке.</i>")));
  return w;
}

QWidget* PadstackEditor::detailPage() {
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(new QLabel(tr("<b>Свойства детали</b>")));
  // The six forms, as TopoR's buttons.
  auto* formRow = new QWidget;
  auto* fh = new QHBoxLayout(formRow);
  fh->setContentsMargins(0, 0, 0, 0);
  auto* group = new QButtonGroup(this);
  const char* tips[] = {"Круг", "Овал", "Прямоугольник", "Прямоугольник со скруглёнными углами",
                        "Прямоугольник со срезанными углами", "Многоугольник"};
  for (int i = 0; i < 6; ++i) {
    PadDetail sample;
    sample.w = sample.h = 1000;
    switch (i) {
      case 1: sample.form = PadDetail::Form::Oval; sample.stretch = {0, 1000}; break;
      case 2: sample.form = PadDetail::Form::Rect; sample.h = 1300; break;
      case 3: sample.form = PadDetail::Form::Rect; sample.h = 1300; sample.handling = CornerHandling::Rounding; sample.handlingValue = 300; break;
      case 4: sample.form = PadDetail::Form::Rect; sample.h = 1300; sample.handling = CornerHandling::Chamfer; sample.handlingValue = 300;
        sample.custom = true; sample.corners = kCornerRT; break;
      case 5: sample.form = PadDetail::Form::Polygon; sample.poly = {{-500, 600}, {500, 600}, {500, -200}, {0, -600}, {-500, -200}}; break;
      default: break;
    }
    auto* b = new QToolButton;
    b->setCheckable(true);
    b->setIcon(detailIcon(sample));
    b->setIconSize(QSize(24, 18));
    b->setToolTip(tr(tips[i]));
    b->setObjectName(QString("form%1").arg(i));
    group->addButton(b, i);
    forms_.push_back(b);
    fh->addWidget(b);
  }
  fh->addStretch(1);
  f->addRow(tr("Форма:"), formRow);
  auto pair = [&](QDoubleSpinBox*& a, QDoubleSpinBox*& c, bool signedValue, const QString& la, const QString& lc) {
    auto* row = new QWidget;
    auto* h = new QHBoxLayout(row);
    h->setContentsMargins(0, 0, 0, 0);
    a = lengthSpin(u_, signedValue);
    c = lengthSpin(u_, signedValue);
    h->addWidget(new QLabel(la));
    h->addWidget(a);
    h->addWidget(new QLabel(lc));
    h->addWidget(c);
    return row;
  };
  width_ = lengthSpin(u_);
  width_->setObjectName("width");
  widthLabel_ = new QLabel(tr("Ширина:"));
  f->addRow(widthLabel_, width_);
  height_ = lengthSpin(u_);
  height_->setObjectName("height");
  heightLabel_ = new QLabel(tr("Высота:"));
  heightRow_ = height_;
  f->addRow(heightLabel_, height_);
  stretchRow_ = pair(stretchX_, stretchY_, true, tr("X:"), tr("Y:"));
  stretchLabel_ = new QLabel(tr("Вытягивание:"));
  f->addRow(stretchLabel_, stretchRow_);
  cornerRow_ = new QWidget;
  auto* ch = new QHBoxLayout(cornerRow_);
  ch->setContentsMargins(0, 0, 0, 0);
  cornerLabel_ = new QLabel(tr("Радиус:"));
  corner_ = lengthSpin(u_);
  custom_ = new QCheckBox("custom");
  ch->addWidget(corner_);
  ch->addWidget(custom_);
  for (const char* name : {"LB", "RB", "RT", "LT"}) {
    auto* c = new QCheckBox(name);
    cornerChecks_.push_back(c);
    ch->addWidget(c);
  }
  f->addRow(cornerLabel_, cornerRow_);
  f->addRow(tr("Смещение:"), pair(shiftX_, shiftY_, true, tr("X:"), tr("Y:")));
  detailForm_ = f;
  polyBox_ = new QWidget;
  auto* pv = new QVBoxLayout(polyBox_);
  pv->setContentsMargins(0, 0, 0, 0);
  poly_ = new QTableWidget(0, 2);
  poly_->setHorizontalHeaderLabels({"X, " + unitName(u_), "Y, " + unitName(u_)});
  poly_->verticalHeader()->setDefaultSectionSize(20);
  poly_->setMinimumHeight(120);
  pv->addWidget(poly_);
  auto* pb = new QHBoxLayout;
  auto* plus = new QToolButton;
  plus->setText("+");
  plus->setToolTip(tr("Добавить вершину"));
  auto* minus = new QToolButton;
  minus->setText(QString::fromUtf8("−"));
  minus->setToolTip(tr("Удалить вершину"));
  pb->addWidget(plus);
  pb->addWidget(minus);
  pb->addStretch(1);
  pv->addLayout(pb);
  f->addRow(polyBox_);

  auto current = [this]() -> PadDetail* {
    QTreeWidgetItem* it = tree_->currentItem();
    return it ? detailOf(it) : nullptr;
  };
  connect(group, &QButtonGroup::idClicked, this, [this, current](int form) {
    PadDetail* d = current();
    if (!d || updating_) return;
    BBox bb = detailBox(*d);
    Coord w = Coord(std::llround(bb.width())), h = Coord(std::llround(bb.height()));
    PadDetail n;
    n.layer = d->layer;
    n.layerClass = d->layerClass;
    n.shift = d->shift;
    switch (form) {
      case 0: n.form = PadDetail::Form::Circle; n.w = n.h = std::min(w, h); break;
      case 1: {
        n.form = PadDetail::Form::Oval;
        Coord dia = std::min(w, h);
        n.w = n.h = dia;
        n.stretch = {double(w - dia), double(h - dia)};
        if (n.stretch.len() < 1) n.stretch = {double(dia) / 2, 0};
        break;
      }
      case 2: case 3: case 4:
        n.form = PadDetail::Form::Rect;
        n.w = w;
        n.h = h;
        n.handling = form == 3 ? CornerHandling::Rounding : form == 4 ? CornerHandling::Chamfer : CornerHandling::None;
        n.handlingValue = form == 2 ? 0 : std::min(w, h) / 4;
        break;
      case 5: {
        n.form = PadDetail::Form::Polygon;
        // The outline it had, about its centre.
        for (auto& v : detailOutline(*d)) n.poly.push_back(v - d->shift);
        if (n.poly.size() > 16) {
          Polyline thin;
          for (size_t i = 0; i < n.poly.size(); i += n.poly.size() / 16) thin.push_back(n.poly[i]);
          n.poly = thin;
        }
        n.w = w;
        n.h = h;
        break;
      }
    }
    *d = n;
    updating_ = true;
    showDetail(*d);
    updating_ = false;
    detailChanged();
  });
  auto spinEdited = [this, current] {
    PadDetail* d = current();
    if (!d || updating_) return;
    auto nm = [&](QDoubleSpinBox* s) { return fromUnit(s->value(), u_); };
    d->w = Coord(std::llround(nm(width_)));
    if (d->form == PadDetail::Form::Circle || d->form == PadDetail::Form::Oval) d->h = d->w;
    else d->h = Coord(std::llround(nm(height_)));
    d->stretch = {nm(stretchX_), -nm(stretchY_)};
    d->shift = {nm(shiftX_), -nm(shiftY_)};
    d->handlingValue = Coord(std::llround(nm(corner_)));
    // The rounding never exceeds half the shorter side.
    if (d->form == PadDetail::Form::Rect && d->handlingValue * 2 > std::min(d->w, d->h)) {
      d->handlingValue = std::min(d->w, d->h) / 2;
      QSignalBlocker block(corner_);
      corner_->setValue(toUnit(double(d->handlingValue), u_));
    }
    d->custom = custom_->isChecked();
    d->corners = 0;
    for (size_t i = 0; i < cornerChecks_.size(); ++i) {
      cornerChecks_[i]->setEnabled(d->custom);
      if (cornerChecks_[i]->isChecked()) d->corners |= std::uint8_t(1u << i);
    }
    detailChanged();
  };
  for (QDoubleSpinBox* s : {width_, height_, stretchX_, stretchY_, shiftX_, shiftY_, corner_})
    connect(s, &QDoubleSpinBox::valueChanged, this, spinEdited);
  connect(custom_, &QCheckBox::toggled, this, spinEdited);
  for (QCheckBox* c : cornerChecks_) connect(c, &QCheckBox::toggled, this, spinEdited);
  auto polyEdited = [this, current] {
    PadDetail* d = current();
    if (!d || updating_ || d->form != PadDetail::Form::Polygon) return;
    Polyline pts;
    for (int r = 0; r < poly_->rowCount(); ++r) {
      auto* x = poly_->item(r, 0);
      auto* y = poly_->item(r, 1);
      pts.push_back({fromUnit(x ? x->text().toDouble() : 0, u_), -fromUnit(y ? y->text().toDouble() : 0, u_)});
    }
    d->poly = pts;
    BBox bb;
    for (auto& v : pts) bb.add(v);
    d->w = Coord(std::llround(bb.valid() ? bb.width() : 0));
    d->h = Coord(std::llround(bb.valid() ? bb.height() : 0));
    detailChanged();
  };
  connect(poly_, &QTableWidget::itemChanged, this, polyEdited);
  connect(plus, &QToolButton::clicked, this, [this, current, polyEdited] {
    PadDetail* d = current();
    if (!d) return;
    // Between the selected vertex and the next one.
    int r = std::max(0, poly_->currentRow());
    Vec2 at = d->poly.empty() ? Vec2{} : d->poly.size() == 1 ? d->poly[0]
                                                            : (d->poly[size_t(r)] + d->poly[(size_t(r) + 1) % d->poly.size()]) * 0.5;
    d->poly.insert(d->poly.begin() + std::min<size_t>(d->poly.size(), size_t(r) + 1), at);
    updating_ = true;
    showDetail(*d);
    updating_ = false;
    poly_->setCurrentCell(r + 1, 0);
    polyEdited();
  });
  connect(minus, &QToolButton::clicked, this, [this, current, polyEdited] {
    PadDetail* d = current();
    int r = poly_->currentRow();
    if (!d || r < 0 || d->poly.size() <= 3) return;
    d->poly.erase(d->poly.begin() + r);
    updating_ = true;
    showDetail(*d);
    updating_ = false;
    polyEdited();
  });
  return w;
}

// ---------------------------------------------------------------- mask / paste details

CreateDetailsDialog::CreateDetailsDialog(const Board& b, std::vector<Padstack> stacks, std::vector<int> selected,
                                         LayerKind kind, Unit u, QWidget* parent)
    : QDialog(parent), b_(b), current_(std::move(stacks)), before_(current_), list_(std::move(selected)), kind_(kind), u_(u) {
  setWindowTitle(tr("Создать детали в стеках контактных площадок"));
  resize(820, 520);
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind == kind) {
      int side = b.layers[l].side == Side::Bottom ? 1 : 0;
      if (layers_[side] < 0) layers_[side] = l;
    }
  QString tm = kind == LayerKind::Mask ? "TM" : "TP", bm = kind == LayerKind::Mask ? "BM" : "BP";
  auto* v = new QVBoxLayout(this);
  pages_ = new QStackedWidget(this);
  v->addWidget(pages_);

  // Page 1: the settings.
  auto* p1 = new QWidget;
  auto* v1 = new QVBoxLayout(p1);
  v1->addWidget(new QLabel(tr("<b>Настройки создания деталей</b><br>Добавьте в список стеки КП, в которые хотите "
                              "добавить детали и выберите слои, на которых эти детали будут созданы")));
  auto* h1 = new QHBoxLayout;
  auto* left = new QVBoxLayout;
  left->addWidget(new QLabel(tr("Стеки КП, в которые будут добавлены детали:")));
  list_t_ = new QTableWidget(0, 5);
  list_t_->setHorizontalHeaderLabels({tr("Стек КП"), tm, "T", "B", bm});
  list_t_->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
  for (int c = 1; c < 5; ++c) list_t_->setColumnWidth(c, 40);
  list_t_->verticalHeader()->hide();
  list_t_->setEditTriggers(QAbstractItemView::NoEditTriggers);
  list_t_->setSelectionBehavior(QAbstractItemView::SelectRows);
  left->addWidget(list_t_, 1);
  auto* lb = new QHBoxLayout;
  auto* add = new QToolButton;
  add->setText("+");
  add->setToolTip(tr("Добавить стеки КП"));
  auto* del = new QToolButton;
  del->setText(QString::fromUtf8("−"));
  del->setToolTip(tr("Удалить выбранные стеки КП"));
  filter_ = new QLineEdit;
  filter_->setPlaceholderText(tr("Поиск"));
  filter_->setClearButtonEnabled(true);
  lb->addWidget(add);
  lb->addWidget(del);
  lb->addStretch(1);
  lb->addWidget(filter_);
  left->addLayout(lb);
  h1->addLayout(left, 1);
  auto* right = new QVBoxLayout;
  right->addWidget(new QLabel(tr("Слои, на которые будут добавлены детали:")));
  auto* grid = new QGridLayout;
  grid->addWidget(new QLabel(tr("Добавить на слой")), 0, 0, 1, 2);
  grid->addWidget(new QLabel(tr("Если существует")), 0, 2);
  grid->addWidget(new QLabel(tr("Отступ(%1)").arg(unitName(u))), 0, 3);
  for (int side = 0; side < 2; ++side) {
    use_[side] = new QCheckBox;
    use_[side]->setChecked(layers_[side] >= 0);
    use_[side]->setEnabled(layers_[side] >= 0);
    replace_[side] = new QComboBox;
    replace_[side]->addItems({tr("Заменить"), tr("Пропустить")});
    offset_[side] = lengthSpin(u);
    offset_[side]->setSuffix({});
    offset_[side]->setValue(toUnit(double(mmToNm(0.1)), u));
    grid->addWidget(use_[side], side + 1, 0);
    grid->addWidget(new QLabel(layers_[side] >= 0 ? QString::fromStdString(b.layers[layers_[side]].name) : QString("—")), side + 1, 1);
    grid->addWidget(replace_[side], side + 1, 2);
    grid->addWidget(offset_[side], side + 1, 3);
    connect(use_[side], &QCheckBox::toggled, this, [this] { fillList(); });
    connect(replace_[side], &QComboBox::currentIndexChanged, this, [this] { fillList(); });
  }
  right->addLayout(grid);
  auto* note = new QLabel(tr("Форма добавляемой детали определяется площадкой на наружном сигнальном слое "
                             "соответствующей стороны"));
  note->setWordWrap(true);
  right->addWidget(note);
  // «Отступ»: outward for the mask, inward for the paste.
  auto* picture = new QLabel;
  {
    QPixmap pm(220, 90);
    pm.fill(Qt::transparent);
    QPainter p(&pm);
    p.setRenderHint(QPainter::Antialiasing);
    QColor pad(0xf8, 0xb0, 0x50), hatch(0x90, 0x90, 0x90);
    bool out = kind == LayerKind::Mask;
    QRectF r(20, 10, 50, 60), c(120, 10, 60, 60);
    QRectF ro = out ? r.adjusted(-8, -8, 8, 8) : r.adjusted(8, 8, -8, -8);
    QRectF co = out ? c.adjusted(-8, -8, 8, 8) : c.adjusted(8, 8, -8, -8);
    p.setPen(Qt::NoPen);
    p.setBrush(QBrush(hatch, Qt::BDiagPattern));
    if (out) {
      p.drawRect(ro);
      p.drawEllipse(co);
    }
    p.setBrush(pad);
    p.drawRect(r);
    p.drawEllipse(c);
    if (!out) {
      p.setBrush(QBrush(hatch.darker(), Qt::BDiagPattern));
      p.drawRect(ro);
      p.drawEllipse(co);
    }
    p.setBrush(Qt::white);
    p.drawEllipse(c.center(), 10, 10);
    p.setPen(Qt::black);
    p.drawText(QRectF(70, 72, 100, 16), Qt::AlignCenter, tr("Отступ"));
    picture->setPixmap(pm);
  }
  right->addWidget(picture);
  right->addWidget(new QLabel(tr("<i>Обозначения:</i><br>■ Существующая деталь<br>+ Деталь будет добавлена<br>"
                                 "⟳ Деталь будет перезаписана")));
  right->addStretch(1);
  h1->addLayout(right);
  v1->addLayout(h1, 1);
  auto* b1 = new QHBoxLayout;
  b1->addStretch(1);
  auto* createB = new QPushButton(tr("Создать"));
  auto* cancel1 = new QPushButton(tr("Отмена"));
  b1->addWidget(createB);
  b1->addWidget(cancel1);
  v1->addLayout(b1);
  pages_->addWidget(p1);

  // Page 2: the report.
  auto* p2 = new QWidget;
  auto* v2 = new QVBoxLayout(p2);
  v2->addWidget(new QLabel(tr("<b>Отчёт о выполнении</b>")));
  summary_ = new QLabel;
  summary_->setObjectName("summary");
  failed_ = new QLabel;
  failed_->setWordWrap(true);
  v2->addWidget(summary_);
  v2->addWidget(failed_);
  reportFilter_ = new QLineEdit;
  reportFilter_->setPlaceholderText(tr("Поиск"));
  reportFilter_->setClearButtonEnabled(true);
  auto* rf = new QHBoxLayout;
  rf->addStretch(1);
  rf->addWidget(reportFilter_);
  v2->addLayout(rf);
  report_ = new QTableWidget(0, 6);
  report_->verticalHeader()->hide();
  report_->setEditTriggers(QAbstractItemView::NoEditTriggers);
  report_->horizontalHeader()->setSectionResizeMode(1, QHeaderView::Stretch);
  v2->addWidget(report_, 1);
  auto* b2 = new QHBoxLayout;
  repeat_ = new QPushButton(tr("Изменить параметры для выбранных стеков КП"));
  repeat_->setEnabled(false);
  auto* back = new QPushButton(tr("Назад"));
  auto* done = new QPushButton(tr("Готово"));
  auto* cancel2 = new QPushButton(tr("Отмена"));
  cancel2->setEnabled(false);
  b2->addWidget(repeat_);
  b2->addStretch(1);
  b2->addWidget(back);
  b2->addWidget(done);
  b2->addWidget(cancel2);
  v2->addLayout(b2);
  pages_->addWidget(p2);

  connect(add, &QToolButton::clicked, this, [this] {
    // «Выберите стеки контактных площадок»: those not listed yet.
    QDialog pick(this);
    pick.setWindowTitle(tr("Выберите стеки контактных площадок"));
    auto* pv = new QVBoxLayout(&pick);
    auto* lw = new QListWidget;
    lw->setSelectionMode(QAbstractItemView::ExtendedSelection);
    for (size_t i = 0; i < current_.size(); ++i)
      if (!std::ranges::contains(list_, int(i))) {
        auto* it = new QListWidgetItem(QString::fromStdString(current_[i].name), lw);
        it->setData(Qt::UserRole, int(i));
      }
    pv->addWidget(lw);
    auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
    connect(box, &QDialogButtonBox::accepted, &pick, &QDialog::accept);
    connect(box, &QDialogButtonBox::rejected, &pick, &QDialog::reject);
    pv->addWidget(box);
    if (pick.exec() != QDialog::Accepted) return;
    for (auto* it : lw->selectedItems()) list_.push_back(it->data(Qt::UserRole).toInt());
    fillList();
  });
  connect(del, &QToolButton::clicked, this, [this] {
    std::set<int> rows;
    for (auto* it : list_t_->selectedItems()) rows.insert(it->data(Qt::UserRole).toInt());
    std::erase_if(list_, [&](int s) { return rows.contains(s); });
    fillList();
  });
  connect(filter_, &QLineEdit::textChanged, this, [this] { fillList(); });
  connect(createB, &QPushButton::clicked, this, &CreateDetailsDialog::create);
  connect(cancel1, &QPushButton::clicked, this, &QDialog::reject);
  connect(back, &QPushButton::clicked, this, [this] {
    current_ = before_;
    pages_->setCurrentIndex(0);
    fillList();
  });
  connect(done, &QPushButton::clicked, this, &QDialog::accept);
  connect(repeat_, &QPushButton::clicked, this, [this] {
    std::vector<int> checked;
    for (int r = 0; r < report_->rowCount(); ++r)
      if (auto* it = report_->item(r, 0); it && it->checkState() == Qt::Checked) checked.push_back(it->data(Qt::UserRole).toInt());
    changeChecked(checked);
  });
  connect(report_, &QTableWidget::itemChanged, this, [this] {
    bool any = false;
    for (int r = 0; r < report_->rowCount(); ++r)
      if (auto* it = report_->item(r, 0); it && it->checkState() == Qt::Checked) any = true;
    repeat_->setEnabled(any);
  });
  connect(reportFilter_, &QLineEdit::textChanged, this, [this](const QString& s) {
    for (int r = 0; r < report_->rowCount(); ++r)
      report_->setRowHidden(r, !s.isEmpty() && !report_->item(r, 1)->text().contains(s, Qt::CaseInsensitive));
  });
  fillList();
}

void CreateDetailsDialog::setOffset(int side, Coord offset) { offset_[side]->setValue(toUnit(double(offset), u_)); }

QString CreateDetailsDialog::mark(int stack, LayerId l) const {
  if (l < 0) return {};
  const Padstack& ps = current_[size_t(stack)];
  bool exists = detailOn(b_, ps, l, false) != nullptr;
  int side = b_.layers[l].side == Side::Bottom ? 1 : 0;
  LayerId outer = side ? b_.bottomCopper() : b_.topCopper();
  bool source = detailOn(b_, ps, outer, false) != nullptr;
  if (!use_[side]->isChecked() || !source) return exists ? QString::fromUtf8("■") : QString();
  if (!exists) return "+";
  return replace_[side]->currentIndex() == 0 ? QString::fromUtf8("⟳") : QString::fromUtf8("■");
}

void CreateDetailsDialog::fillList() {
  list_t_->setRowCount(0);
  QString f = filter_->text();
  std::vector<int> order = list_;
  QCollator coll;
  coll.setNumericMode(true);
  std::ranges::sort(order, [&](int x, int y) {
    return coll.compare(QString::fromStdString(current_[size_t(x)].name), QString::fromStdString(current_[size_t(y)].name)) < 0;
  });
  for (int s : order) {
    const Padstack& ps = current_[size_t(s)];
    QString name = QString::fromStdString(ps.name);
    if (!f.isEmpty() && !name.contains(f, Qt::CaseInsensitive)) continue;
    int r = list_t_->rowCount();
    list_t_->insertRow(r);
    auto* n = new QTableWidgetItem(name);
    n->setData(Qt::UserRole, s);
    list_t_->setItem(r, 0, n);
    auto copper = [&](int col, LayerId l) {
      auto* it = new QTableWidgetItem;
      if (const PadDetail* d = detailOn(b_, ps, l, false)) {
        it->setIcon(detailIcon(*d));
        it->setToolTip(detailSize(*d, u_));
      }
      it->setData(Qt::UserRole, s);
      list_t_->setItem(r, col, it);
    };
    copper(2, b_.topCopper());
    copper(3, b_.bottomCopper());
    for (int side = 0; side < 2; ++side) {
      auto* it = new QTableWidgetItem(mark(s, layers_[side]));
      it->setTextAlignment(Qt::AlignCenter);
      it->setData(Qt::UserRole, s);
      list_t_->setItem(r, side ? 4 : 1, it);
    }
  }
}

void CreateDetailsDialog::create() {
  before_ = current_;
  std::map<int, std::vector<LayerDetailsResult::Kind>> by;
  for (int side = 0; side < 2; ++side) {
    if (!use_[side]->isChecked() || layers_[side] < 0) continue;
    Coord off = Coord(std::llround(fromUnit(offset_[side]->value(), u_)));
    if (kind_ != LayerKind::Mask) off = -off;  // the paste goes in
    auto res = createLayerDetails(b_, current_, list_, layers_[side], off, replace_[side]->currentIndex() == 0);
    for (auto& [s, k] : res.stacks) by[s].push_back(k);
  }
  std::vector<std::pair<int, int>> result;
  for (int s : list_) {
    auto& ks = by[s];
    bool made = std::ranges::any_of(ks, [](auto k) { return k == LayerDetailsResult::Kind::Added || k == LayerDetailsResult::Kind::Replaced; });
    bool failed = std::ranges::any_of(ks, [](auto k) { return k == LayerDetailsResult::Kind::Failed; });
    result.push_back({s, made ? 1 : failed ? -1 : 0});
  }
  fillReport(result);
  pages_->setCurrentIndex(1);
}

void CreateDetailsDialog::fillReport(const std::vector<std::pair<int, int>>& result) {
  int made = int(std::ranges::count_if(result, [](auto& r) { return r.second > 0; }));
  summary_->setText(QString::fromUtf8("✔ ") + tr("Добавлены детали в %1 из %2 стеков КП").arg(made).arg(result.size()));
  QStringList failed;
  for (auto& [s, k] : result)
    if (k < 0) failed << QString::fromStdString(current_[size_t(s)].name);
  failed_->setText(failed.isEmpty() ? QString() : tr("Не удалось добавить детали в %1").arg(failed.join(", ")));
  failed_->setVisible(!failed.isEmpty());
  QSignalBlocker block(report_);
  report_->clear();
  report_->setRowCount(0);
  std::vector<LayerId> cols{layers_[0], b_.topCopper(), b_.bottomCopper(), layers_[1]};
  QStringList headers{"", tr("Стек КП")};
  for (LayerId l : cols) headers << (l >= 0 ? QString::fromStdString(b_.layers[l].name) : QString("—"));
  report_->setHorizontalHeaderLabels(headers);
  report_->setColumnWidth(0, 24);
  for (auto& [s, k] : result) {
    const Padstack& ps = current_[size_t(s)];
    int r = report_->rowCount();
    report_->insertRow(r);
    auto* check = new QTableWidgetItem;
    check->setFlags(Qt::ItemIsEnabled | Qt::ItemIsUserCheckable);
    check->setCheckState(Qt::Unchecked);
    check->setData(Qt::UserRole, s);
    report_->setItem(r, 0, check);
    report_->setItem(r, 1, new QTableWidgetItem(QString::fromStdString(ps.name)));
    for (int c = 0; c < 4; ++c) {
      auto* it = new QTableWidgetItem;
      if (cols[size_t(c)] >= 0)
        if (const PadDetail* d = detailOn(b_, ps, cols[size_t(c)], false)) {
          it->setIcon(detailIcon(*d));
          it->setText(detailSize(*d, u_));
          const PadDetail* old = detailOn(b_, before_[size_t(s)], cols[size_t(c)], false);
          if (!old || !(*old == *d)) it->setBackground(QColor(0xd8, 0xf0, 0xd8));  // new or rewritten
        }
      report_->setItem(r, c + 2, it);
    }
  }
  repeat_->setEnabled(false);
}

void CreateDetailsDialog::changeChecked(const std::vector<int>& stacks) {
  // The checked stacks go back to what they were and to the settings; the others keep their new details.
  for (int s : stacks) current_[size_t(s)] = before_[size_t(s)];
  before_ = current_;
  list_ = stacks;
  pages_->setCurrentIndex(0);
  fillList();
}

// ---------------------------------------------------------------- via pads

QString viaDiameters(const Board& b, const ViaType& t, Unit u) {
  (void)b;
  std::vector<Coord> ds{t.diameter};
  for (auto& p : t.pads)
    if (p.diameter > 0 && !std::ranges::contains(ds, p.diameter)) ds.push_back(p.diameter);
  QStringList s;
  for (Coord d : ds) s << formatLength(double(d), u, 4);
  return s.join(", ");
}

ViaPadsDialog::ViaPadsDialog(const Board& b, ViaType t, Unit u, QWidget* parent) : QDialog(parent), b_(b), t_(std::move(t)), u_(u) {
  setWindowTitle(tr("Диаметр площадки переходного отверстия"));
  resize(380, 420);
  auto* v = new QVBoxLayout(this);
  auto* tabs = new QTabWidget(this);
  auto table = [&](const QString& first) {
    auto* t = new QTableWidget(0, 2);
    t->setHorizontalHeaderLabels({first, tr("Диаметр, %1").arg(unitName(u))});
    t->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
    t->verticalHeader()->hide();
    return t;
  };
  auto tab = [&](QTableWidget*& classes, QTableWidget*& layers, const QString& title) {
    auto* w = new QWidget;
    auto* tv = new QVBoxLayout(w);
    classes = table(tr("Тип слоёв"));
    layers = table(tr("Слой"));
    tv->addWidget(classes);
    tv->addWidget(layers);
    tabs->addTab(w, title);
  };
  tab(metalClasses_, metalLayers_, tr("Металлические"));
  tab(mechClasses_, mechLayers_, tr("Механические"));
  v->addWidget(tabs, 1);
  auto* reset = new QPushButton(tr("Сбросить"));
  auto* rh = new QHBoxLayout;
  rh->addStretch(1);
  rh->addWidget(reset);
  v->addLayout(rh);
  auto* box = new QDialogButtonBox;
  box->addButton(tr("ОК"), QDialogButtonBox::AcceptRole);
  box->addButton(tr("Отмена"), QDialogButtonBox::RejectRole);
  v->addWidget(box);
  connect(box, &QDialogButtonBox::accepted, this, &QDialog::accept);
  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  ViaType original = t_;
  connect(reset, &QPushButton::clicked, this, [this, original] {
    t_ = original;
    fill();
  });
  for (QTableWidget* tw : {metalClasses_, metalLayers_, mechClasses_, mechLayers_})
    connect(tw, &QTableWidget::itemChanged, this, [this](QTableWidgetItem* it) {
      if (updating_ || it->column() != 1) return;
      std::string cls = it->data(Qt::UserRole).toString().toStdString();
      std::string layer = it->data(Qt::UserRole + 1).toString().toStdString();
      QString text = it->text().trimmed();
      text.remove(unitName(u_));
      bool ok = false;
      double val = text.trimmed().toDouble(&ok);
      Coord d = ok && val > 0 ? Coord(std::llround(fromUnit(val, u_))) : 0;
      if (layer.empty() && cls == "Signal") {
        if (d > 0) t_.diameter = d;  // the type's diameter
      } else {
        std::erase_if(t_.pads, [&](const ViaPadSize& p) { return layer.empty() ? p.layer.empty() && p.layerClass == cls : p.layer == layer; });
        // A layer's own size only where it differs from its class's.
        Coord inherited = layer.empty() ? 0 : viaPadDiameter(t_, cls, "");
        if (d > 0 && d != inherited) t_.pads.push_back({layer.empty() ? cls : std::string(), layer, d});
      }
      fill();
    });
  fill();
}

void ViaPadsDialog::fill() {
  updating_ = true;
  auto row = [&](QTableWidget* t, const QString& name, const std::string& cls, const std::string& layer) {
    int r = t->rowCount();
    t->insertRow(r);
    auto* n = new QTableWidgetItem(name);
    n->setFlags(Qt::ItemIsEnabled);
    t->setItem(r, 0, n);
    Coord own = 0;
    for (auto& p : t_.pads)
      if (layer.empty() ? (p.layer.empty() && p.layerClass == cls) : p.layer == layer) own = p.diameter;
    if (layer.empty() && cls == "Signal") own = t_.diameter;
    Coord shown = own ? own : viaPadDiameter(t_, cls, layer);
    auto* it = new QTableWidgetItem(shown ? formatLength(double(shown), u_, 4) + " " + unitName(u_) : QString());
    if (!own) it->setForeground(Qt::gray);  // from the class
    it->setData(Qt::UserRole, QString::fromStdString(cls));
    it->setData(Qt::UserRole + 1, QString::fromStdString(layer));
    t->setItem(r, 1, it);
  };
  for (QTableWidget* t : {metalClasses_, metalLayers_, mechClasses_, mechLayers_}) t->setRowCount(0);
  row(metalClasses_, layerClassName("Signal"), "Signal", "");
  row(metalClasses_, layerClassName("Plane"), "Plane", "");
  for (const char* c : {"Mechanical", "Silk", "Paste", "Mask"}) row(mechClasses_, layerClassName(c), c, "");
  for (LayerId l = 0; l < LayerId(b_.layers.size()); ++l) {
    const Layer& L = b_.layers[l];
    if (L.kind == LayerKind::Edge) continue;
    std::string cls = layerClassOf(b_, l);
    row(L.kind == LayerKind::Copper ? metalLayers_ : mechLayers_, QString::fromStdString(L.name), cls, L.name);
  }
  updating_ = false;
}

// ---------------------------------------------------------------- via stack diagram

ViaStackDiagram::ViaStackDiagram(const Board& b, std::vector<ViaType> types, QWidget* parent)
    : QWidget(parent), b_(b), types_(std::move(types)) {
  setMinimumHeight(120);
}

std::vector<LayerId> ViaStackDiagram::rows() const {
  std::vector<LayerId> out;
  for (LayerId l = 0; l < LayerId(b_.layers.size()); ++l)
    if (b_.layers[l].kind != LayerKind::Edge && (b_.layers[l].kind != LayerKind::Other || b_.layers[l].side != Side::None))
      out.push_back(l);
  // Top to bottom: the top side's layers, the copper, the bottom side's.
  auto rank = [&](LayerId l) {
    const Layer& L = b_.layers[l];
    if (L.kind == LayerKind::Copper) return 100 + L.copperIndex;
    return L.side == Side::Bottom ? 1000 : 0;
  };
  std::ranges::stable_sort(out, {}, rank);
  // The bottom side's layers mirror the top's: the mask outermost.
  return out;
}

QSize ViaStackDiagram::sizeHint() const { return QSize(600, 30 + 14 * int(rows().size())); }

void ViaStackDiagram::paintEvent(QPaintEvent*) {
  QPainter p(this);
  p.fillRect(rect(), QColor(0xfa, 0xf6, 0xd0));
  auto rs = rows();
  const int rowH = 14, top = 6, labelW = 90, colW = 140;
  auto colour = [&](LayerId l) {
    switch (b_.layers[l].kind) {
      case LayerKind::Copper: return QColor(0xf4, 0xb8, 0x60);
      case LayerKind::Mask: return QColor(0x98, 0xd8, 0xa8);
      case LayerKind::Paste: return QColor(0xd8, 0xd8, 0xd8);
      case LayerKind::Silk: return QColor(0xf8, 0xc8, 0xd8);
      default: return QColor(0xf0, 0xec, 0xc0);
    }
  };
  QFont f = font();
  f.setPointSizeF(f.pointSizeF() * 0.85);
  p.setFont(f);
  Coord maxD = 1;
  for (auto& t : types_) {
    maxD = std::max(maxD, t.diameter);
    for (auto& pd : t.pads) maxD = std::max(maxD, pd.diameter);
  }
  for (size_t i = 0; i < rs.size(); ++i) {
    int y = top + int(i) * rowH;
    p.fillRect(QRect(labelW, y + 1, width() - labelW, rowH - 2), colour(rs[i]).lighter(115));
    p.setPen(Qt::black);
    p.drawText(QRect(0, y, labelW - 6, rowH), Qt::AlignRight | Qt::AlignVCenter, QString::fromStdString(b_.layers[rs[i]].name));
  }
  for (size_t t = 0; t < types_.size(); ++t) {
    const ViaType& vt = types_[t];
    int x0 = labelW + 10 + int(t) * colW, cx = x0 + colW / 2;
    double k = (colW - 20) / double(maxD);
    // The copper range of the type.
    int from = 0, to = b_.copperCount() - 1;
    if (!vt.from.empty() && !vt.to.empty()) {
      LayerId a = b_.findLayer(vt.from), c = b_.findLayer(vt.to);
      if (a >= 0 && c >= 0 && b_.layers[a].copperIndex >= 0 && b_.layers[c].copperIndex >= 0) {
        from = std::min(b_.layers[a].copperIndex, b_.layers[c].copperIndex);
        to = std::max(b_.layers[a].copperIndex, b_.layers[c].copperIndex);
      }
    }
    int yFirst = -1, yLast = -1;
    for (size_t i = 0; i < rs.size(); ++i) {
      const Layer& L = b_.layers[rs[i]];
      Coord d = 0;
      if (L.kind == LayerKind::Copper) {
        if (L.copperIndex < from || L.copperIndex > to) continue;
        d = viaPadDiameter(vt, layerClassOf(b_, rs[i]), L.name);
      } else {
        if ((L.side == Side::Top && from != 0) || (L.side == Side::Bottom && to != b_.copperCount() - 1)) continue;
        d = viaPadDiameter(vt, layerClassOf(b_, rs[i]), L.name);
      }
      if (d <= 0) continue;
      int y = top + int(i) * rowH;
      int w = int(double(d) * k);
      p.fillRect(QRect(cx - w / 2, y + 1, w, rowH - 2), colour(rs[i]).darker(L.kind == LayerKind::Copper ? 100 : 105));
      if (L.kind == LayerKind::Copper) {
        if (yFirst < 0) yFirst = y;
        yLast = y + rowH;
      }
    }
    if (yFirst >= 0) {
      int hw = std::max(2, int(double(vt.drill) * k / 2));
      p.fillRect(QRect(cx - hw, yFirst, 2 * hw, yLast - yFirst), QColor(0xfa, 0xf6, 0xd0));
    }
    int yName = top + int(rs.size()) * rowH;
    QFont bf = f;
    bf.setBold(true);
    p.setFont(bf);
    p.setPen(Qt::black);
    p.drawText(QRect(x0, yName, colW, 16), Qt::AlignCenter, QString::fromStdString(vt.name));
    p.setFont(f);
    if (int(t) == current_) {
      p.setPen(QPen(QColor(0xe0, 0x20, 0x20), 2));
      p.setBrush(Qt::NoBrush);
      p.drawRect(QRect(x0 + 2, top - 2, colW - 4, yName + 18 - top));
    }
  }
}

void ViaStackDiagram::mousePressEvent(QMouseEvent* e) {
  const int labelW = 90, colW = 140;
  int t = int(std::floor((e->position().x() - labelW - 10) / colW));
  if (t >= 0 && t < int(types_.size())) emit picked(t);
}

}  // namespace xr::gui
