#include "gui/ImpedanceModel.h"

#include <QApplication>
#include <QLineEdit>
#include <QMouseEvent>
#include <QPainter>
#include <QPalette>

#include "gui/SpinBox.h"

namespace xr::gui {

ImpedanceModel::ImpedanceModel(const Board& b, HiSpeed& rules, Unit unit, QObject* parent)
    : QAbstractTableModel(parent), b_(b), h_(rules), unit_(unit) {
  for (LayerId l : b.copperLayers()) layers_.push_back(l);
}

int ImpedanceModel::rowCount(const QModelIndex& parent) const { return parent.isValid() ? 0 : FirstLayerRow + int(layers_.size()); }

int ImpedanceModel::columnCount(const QModelIndex& parent) const {
  if (parent.isValid()) return 0;
  int n = FirstRuleCol;
  for (int r = 0; r < ruleCount(); ++r) n += columnsOf(r);
  return n;
}

int ImpedanceModel::firstColumn(int rule) const {
  int c = FirstRuleCol;
  for (int r = 0; r < rule; ++r) c += columnsOf(r);
  return c;
}

ImpedanceModel::Part ImpedanceModel::partOf(int column) const {
  int c = FirstRuleCol;
  for (int r = 0; r < ruleCount() && column >= c; ++r) {
    const int n = columnsOf(r);
    if (column < c + n) return {r, column > c};
    c += n;
  }
  return {};
}

bool ImpedanceModel::plane(int row) const { return row >= FirstLayerRow && b_.layers[size_t(layers_[size_t(row - FirstLayerRow)])].plane; }

ImpedanceModel::Kind ImpedanceModel::kindOf(const QModelIndex& index) const {
  if (!index.isValid()) return Kind::Blank;
  const Part part = partOf(index.column());
  if (index.row() == HeadRow) return Kind::Head;
  if (part.rule < 0) return Kind::Label;
  if (index.row() == NameRow) return part.gap ? Kind::Blank : Kind::Name;  // (the pair's two columns are one cell)
  if (index.row() == ZRow) return part.gap ? Kind::Blank : Kind::Z;
  return plane(index.row()) ? Kind::Blank : Kind::Length;
}

QVariant ImpedanceModel::data(const QModelIndex& index, int role) const {
  const Kind kind = kindOf(index);
  const int row = index.row(), col = index.column();
  if (role == Qt::FontRole && (kind == Kind::Head || (kind == Kind::Label && row < HeadRow))) {
    QFont f = QApplication::font();
    f.setBold(true);
    return f;
  }
  if (role == Qt::TextAlignmentRole) {
    if (kind == Kind::Head) return int(Qt::AlignCenter);
    if (kind == Kind::Label && row < HeadRow) return int(Qt::AlignRight | Qt::AlignVCenter);
    return int(Qt::AlignLeft | Qt::AlignVCenter);
  }
  if (role == Qt::BackgroundRole) {
    // A reference layer carries no wires: its row is greyed, its cells empty.
    if (plane(row)) return QApplication::palette().brush(QPalette::Disabled, QPalette::Window);
    if (kind == Kind::Head) return QApplication::palette().brush(QPalette::Button);
    return {};
  }
  if (role != Qt::DisplayRole && role != Qt::EditRole) return {};
  auto number = [](double v) { return QString::number(v, 'g', 8); };
  switch (kind) {
    case Kind::Label: {
      if (row == NameRow) return col == LayerCol ? tr("Имя:") : QVariant();
      if (row == ZRow) return col == LayerCol ? tr("Z, Ом:") : QVariant();
      const Layer& l = b_.layers[size_t(layers_[size_t(row - FirstLayerRow)])];
      if (col == LayerCol) return QString::fromStdString(l.name);
      if (col == TypeCol) return l.plane ? tr("опорный") : tr("сигнальный");
      return formatLength(double(l.thickness), unit_);
    }
    case Kind::Head: {
      if (col == LayerCol) return tr("Слой");
      if (col == TypeCol) return tr("Тип");
      if (col == ThicknessCol) return tr("Толщина, %1").arg(unitName(unit_));
      const Part part = partOf(col);
      if (part.rule < 0) return {};
      return h_.impedances[size_t(part.rule)].diff ? (part.gap ? QVariant() : tr("Ширина / Зазор, %1").arg(unitName(unit_)))
                                                   : tr("Ширина, %1").arg(unitName(unit_));
    }
    case Kind::Name: return QString::fromStdString(h_.impedances[size_t(partOf(col).rule)].name);
    case Kind::Z: {
      const double z = h_.impedances[size_t(partOf(col).rule)].z0;
      return role == Qt::EditRole ? QVariant(z) : QVariant(number(z));
    }
    case Kind::Length: {
      const Part part = partOf(col);
      const Layer& l = b_.layers[size_t(layers_[size_t(row - FirstLayerRow)])];
      const ImpedanceLayerRule* r = h_.impedances[size_t(part.rule)].on(l.name);
      if (!r) return role == Qt::EditRole ? QVariant(0.0) : QVariant();
      const double v = toUnit(double(part.gap ? r->gap : r->width), unit_);
      return role == Qt::EditRole ? QVariant(v) : QVariant(number(v));
    }
    case Kind::Blank: return {};
  }
  return {};
}

Qt::ItemFlags ImpedanceModel::flags(const QModelIndex& index) const {
  switch (kindOf(index)) {
    case Kind::Name:
    case Kind::Z:
    case Kind::Length: return Qt::ItemIsEnabled | Qt::ItemIsSelectable | Qt::ItemIsEditable;
    default: return Qt::ItemIsEnabled;
  }
}

bool ImpedanceModel::setData(const QModelIndex& index, const QVariant& value, int role) {
  if (role != Qt::EditRole) return false;
  const Part part = partOf(index.column());
  if (part.rule < 0) return false;
  Impedance& z = h_.impedances[size_t(part.rule)];
  switch (kindOf(index)) {
    case Kind::Name: {
      const std::string name = value.toString().trimmed().toStdString();
      if (name.empty() || name == z.name) return false;
      if (r::contains(h_.impedances, name, &Impedance::name)) return false;  // the signals refer to a rule by its name
      // The signals that use the rule follow its name.
      for (SignalCluster& c : h_.clusters)
        if (c.impedance == z.name) c.impedance = name;
      for (DiffSignal& d : h_.diffSignals)
        if (d.impedance == z.name) d.impedance = name;
      z.name = name;
      break;
    }
    case Kind::Z: {
      const double v = value.toDouble();
      if (v < 0 || v == z.z0) return false;
      z.z0 = v;
      break;
    }
    case Kind::Length: {
      const Coord v = Coord(std::llround(fromUnit(value.toDouble(), unit_)));
      if (v <= 0) return false;
      const std::string& layer = b_.layers[size_t(layers_[size_t(index.row() - FirstLayerRow)])].name;
      auto it = r::find(z.rules, layer, &ImpedanceLayerRule::layer);
      if (it == z.rules.end()) {
        // The rule had nothing for the layer: the other value starts as the design's default.
        z.rules.push_back({layer, b_.netClasses[0].trackWidth, z.diff ? b_.netClasses[0].clearance : 0});
        it = z.rules.end() - 1;
      }
      Coord& now = part.gap ? it->gap : it->width;
      if (now == v) return false;
      now = v;
      break;
    }
    default: return false;
  }
  emit dataChanged(index, index, {Qt::DisplayRole, Qt::EditRole});
  return true;
}

bool ImpedanceModel::used(int rule) const {
  const std::string& name = h_.impedances[size_t(rule)].name;
  return r::contains(h_.clusters, name, &SignalCluster::impedance) || r::contains(h_.diffSignals, name, &DiffSignal::impedance);
}

int ImpedanceModel::addRule(bool diff) {
  Impedance z;
  z.diff = diff;
  z.z0 = diff ? 100 : 50;
  for (int n = 1;; ++n) {
    z.name = (diff ? "Diff_" : "Z0_") + std::to_string(n);
    if (!r::contains(h_.impedances, z.name, &Impedance::name)) break;
  }
  for (LayerId l : layers_)
    if (!b_.layers[size_t(l)].plane) z.rules.push_back({b_.layers[size_t(l)].name, b_.netClasses[0].trackWidth, diff ? b_.netClasses[0].clearance : 0});
  // (a rule is one column or two, and the names' cells span them: the view lays the table out anew)
  beginResetModel();
  h_.impedances.push_back(std::move(z));
  endResetModel();
  return ruleCount() - 1;
}

bool ImpedanceModel::removeRule(int rule) {
  if (rule < 0 || rule >= ruleCount() || used(rule)) return false;
  beginResetModel();
  h_.impedances.erase(h_.impedances.begin() + rule);
  endResetModel();
  return true;
}

// ---------------------------------------------------------------- the delegate

namespace {

const ImpedanceModel* modelOf(const QModelIndex& index) { return qobject_cast<const ImpedanceModel*>(index.model()); }

}  // namespace

QRect ImpedanceDelegate::removeRect(const QRect& cell) {
  const int side = std::min(cell.height() - 4, 16);
  return {cell.right() - side - 2, cell.center().y() - side / 2, side, side};
}

void ImpedanceDelegate::paint(QPainter* p, const QStyleOptionViewItem& option, const QModelIndex& index) const {
  const ImpedanceModel* m = modelOf(index);
  if (!m || m->kindOf(index) != ImpedanceModel::Kind::Name) {
    QStyledItemDelegate::paint(p, option, index);
    return;
  }
  // The name, and the mark that removes the rule at its right.
  QStyleOptionViewItem text = option;
  const QRect mark = removeRect(option.rect);
  text.rect.setRight(mark.left() - 2);
  QStyledItemDelegate::paint(p, text, index);
  p->save();
  p->setRenderHint(QPainter::Antialiasing);
  p->setPen(QPen(QColor(0xc0, 0x20, 0x20), 1));
  p->setBrush(QColor(0xff, 0xe8, 0xe8));
  p->drawRect(mark.adjusted(0, 0, -1, -1));
  p->setPen(QPen(QColor(0xc0, 0x20, 0x20), 2));
  const QRect x = mark.adjusted(4, 4, -4, -4);
  p->drawLine(x.topLeft(), x.bottomRight());
  p->drawLine(x.topRight(), x.bottomLeft());
  p->restore();
}

QWidget* ImpedanceDelegate::createEditor(QWidget* parent, const QStyleOptionViewItem& option, const QModelIndex& index) const {
  const ImpedanceModel* m = modelOf(index);
  if (!m) return QStyledItemDelegate::createEditor(parent, option, index);
  switch (m->kindOf(index)) {
    case ImpedanceModel::Kind::Name: {
      auto* e = new QLineEdit(parent);
      e->setFrame(false);
      return e;
    }
    case ImpedanceModel::Kind::Z:
    case ImpedanceModel::Kind::Length: {
      auto* s = new DoubleSpinBox(parent);
      s->setFrame(false);
      const bool length = m->kindOf(index) == ImpedanceModel::Kind::Length;
      s->setDecimals(length ? (m->unit() == Unit::Mil ? 3 : 4) : 2);
      s->setRange(0, 1e6);
      return s;
    }
    default: return nullptr;
  }
}

void ImpedanceDelegate::setEditorData(QWidget* editor, const QModelIndex& index) const {
  if (auto* s = qobject_cast<QDoubleSpinBox*>(editor)) s->setValue(index.data(Qt::EditRole).toDouble());
  else if (auto* e = qobject_cast<QLineEdit*>(editor)) e->setText(index.data(Qt::EditRole).toString());
}

void ImpedanceDelegate::setModelData(QWidget* editor, QAbstractItemModel* model, const QModelIndex& index) const {
  if (auto* s = qobject_cast<QDoubleSpinBox*>(editor)) {
    s->interpretText();
    model->setData(index, s->value(), Qt::EditRole);
  } else if (auto* e = qobject_cast<QLineEdit*>(editor)) model->setData(index, e->text(), Qt::EditRole);
}

void ImpedanceDelegate::updateEditorGeometry(QWidget* editor, const QStyleOptionViewItem& option, const QModelIndex& index) const {
  QRect r = option.rect;
  if (const ImpedanceModel* m = modelOf(index); m && m->kindOf(index) == ImpedanceModel::Kind::Name) r.setRight(removeRect(r).left() - 2);
  editor->setGeometry(r);
}

bool ImpedanceDelegate::editorEvent(QEvent* e, QAbstractItemModel* model, const QStyleOptionViewItem& option, const QModelIndex& index) {
  const ImpedanceModel* m = modelOf(index);
  if (m && m->kindOf(index) == ImpedanceModel::Kind::Name &&
      (e->type() == QEvent::MouseButtonPress || e->type() == QEvent::MouseButtonRelease || e->type() == QEvent::MouseButtonDblClick)) {
    auto* me = static_cast<QMouseEvent*>(e);
    if (me->button() == Qt::LeftButton && removeRect(option.rect).contains(me->position().toPoint())) {
      // (the press is taken too: it must not open the name for editing)
      if (e->type() == QEvent::MouseButtonRelease) emit removeRequested(m->partOf(index.column()).rule);
      return true;
    }
  }
  return QStyledItemDelegate::editorEvent(e, model, option, index);
}

}  // namespace xr::gui
