#include "gui/TextStylesDialog.h"

#include <QComboBox>
#include <QDialogButtonBox>
#include <QFontDatabase>
#include <QFormLayout>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QLabel>
#include <QPushButton>
#include <QTableWidget>
#include <QToolButton>
#include <QVBoxLayout>

#include "gui/SpinBox.h"
#include "gui/TextFont.h"

namespace xr::gui {

QString describeTextStyle(const TextStyle& st, Unit u) {
  QString s = QString::fromStdString(st.font) + ", " + formatLength(double(st.height), u, 4) + " " + unitName(u);
  if (st.bold) s += ", Bold";
  if (st.italic) s += ", Italic";
  return s;
}

QStringList textFontNames(const std::string& own) {
  QStringList names = QFontDatabase::families();
  QString o = QString::fromStdString(own);
  if (!o.isEmpty() && !names.contains(o)) names.prepend(o);
  return names;
}

namespace {

QToolButton* toggle(const QString& text, bool bold, bool italic) {
  auto* b = new QToolButton;
  b->setText(text);
  b->setCheckable(true);
  QFont f = b->font();
  f.setBold(bold);
  f.setItalic(italic);
  b->setFont(f);
  return b;
}

}  // namespace

TextStylesDialog::TextStylesDialog(const Board& b, Unit u, int current, QWidget* parent)
    : QDialog(parent), b_(b), u_(u), styles_(b.textStyles), use_(textStyleUse(b)) {
  setWindowTitle(tr("Редактор стилей надписей"));
  for (int i = 0; i < int(styles_.size()); ++i) origin_.push_back(i);

  table_ = new QTableWidget(0, 2);
  table_->setObjectName("styles");
  table_->setHorizontalHeaderLabels({tr("Имя"), tr("Свойства")});
  table_->verticalHeader()->hide();
  table_->setSelectionBehavior(QAbstractItemView::SelectRows);
  table_->setSelectionMode(QAbstractItemView::SingleSelection);
  table_->setEditTriggers(QAbstractItemView::DoubleClicked | QAbstractItemView::EditKeyPressed);
  table_->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
  add_ = new QPushButton("+");
  remove_ = new QPushButton("−");
  add_->setObjectName("add");
  remove_->setObjectName("remove");
  for (auto* pb : {add_, remove_}) pb->setFixedWidth(32);
  auto* left = new QVBoxLayout;
  left->addWidget(table_, 1);
  auto* pm = new QHBoxLayout;
  pm->addWidget(add_);
  pm->addWidget(remove_);
  pm->addStretch(1);
  left->addLayout(pm);

  font_ = new QComboBox;
  font_->setObjectName("font");
  height_ = new DoubleSpinBox;
  height_->setObjectName("height");
  height_->setDecimals(u == Unit::Mil ? 2 : 4);
  height_->setRange(toUnit(1000, u), toUnit(100e6, u));
  height_->setSuffix(" " + unitName(u));
  height_->setKeyboardTracking(false);
  bold_ = toggle("B", true, false);
  italic_ = toggle("I", false, true);
  underline_ = toggle("U", false, false);
  underline_->setEnabled(false);  // TopoR's too: the vector fonts have none
  bold_->setObjectName("bold");
  italic_->setObjectName("italic");
  auto* hRow = new QHBoxLayout;
  hRow->addWidget(height_, 1);
  hRow->addWidget(bold_);
  hRow->addWidget(italic_);
  hRow->addWidget(underline_);
  example_ = new QLabel("Example");
  example_->setAlignment(Qt::AlignCenter);
  example_->setFrameShape(QFrame::Box);
  example_->setMinimumHeight(56);
  auto* right = new QFormLayout;
  right->addRow(tr("Шрифт:"), font_);
  right->addRow(tr("Высота:"), hRow);
  right->addRow(example_);

  auto* top = new QHBoxLayout;
  top->addLayout(left, 3);
  top->addLayout(right, 2);
  apply_ = new QPushButton(tr("Применить"));
  apply_->setObjectName("apply");
  auto* close = new QPushButton(tr("Закрыть"));
  auto* buttons = new QHBoxLayout;
  buttons->addStretch(1);
  buttons->addWidget(apply_);
  buttons->addWidget(close);
  auto* lay = new QVBoxLayout(this);
  lay->addLayout(top, 1);
  lay->addLayout(buttons);
  resize(640, 420);

  fillTable();
  table_->selectRow(std::clamp(current, 0, int(styles_.size()) - 1));
  showStyle();
  markChanged(false);

  connect(table_, &QTableWidget::itemSelectionChanged, this, &TextStylesDialog::showStyle);
  connect(table_, &QTableWidget::itemChanged, this, [this](QTableWidgetItem* it) {
    if (updating_ || it->column() != 0) return;
    // A name of its own: an empty or taken one is put back.
    QString name = it->text().trimmed();
    bool taken = r::any_of(v::iota(0, int(styles_.size())), [&](int i) {
      return i != it->row() && QString::fromStdString(styles_[size_t(i)].name) == name;
    });
    if (name.isEmpty() || taken) {
      QSignalBlocker block(table_);
      it->setText(QString::fromStdString(styles_[size_t(it->row())].name));
      return;
    }
    styles_[size_t(it->row())].name = name.toStdString();
    markChanged(true);
  });
  connect(font_, &QComboBox::activated, this, &TextStylesDialog::edited);
  connect(height_, &QDoubleSpinBox::valueChanged, this, &TextStylesDialog::edited);
  connect(bold_, &QToolButton::toggled, this, &TextStylesDialog::edited);
  connect(italic_, &QToolButton::toggled, this, &TextStylesDialog::edited);
  connect(add_, &QPushButton::clicked, this, [this] {
    // A copy of the selected style (TopoR: the new one takes the selected one's parameters).
    TextStyle st = styles_[size_t(std::max(0, this->current()))];
    std::string base = QString::fromStdString(st.font).remove(' ').toStdString() + "_" +
                       formatLength(double(st.height), u_, 2).toStdString();
    st.name = base;
    for (int k = 2; r::contains(styles_, st.name, &TextStyle::name); ++k) st.name = base + "_" + std::to_string(k);
    styles_.push_back(st);
    origin_.push_back(-1);
    use_.push_back(0);
    fillTable();
    table_->selectRow(int(styles_.size()) - 1);
    markChanged(true);
  });
  connect(remove_, &QPushButton::clicked, this, [this] {
    int i = this->current();
    if (i <= 0 || use_[size_t(i)] > 0) return;
    styles_.erase(styles_.begin() + i);
    origin_.erase(origin_.begin() + i);
    use_.erase(use_.begin() + i);
    fillTable();
    table_->selectRow(std::min(i, int(styles_.size()) - 1));
    markChanged(true);
  });
  connect(apply_, &QPushButton::clicked, this, [this] {
    emit applied(styles_, origin_);
    for (int i = 0; i < int(styles_.size()); ++i) origin_[size_t(i)] = i;
    markChanged(false);
  });
  connect(close, &QPushButton::clicked, this, &QDialog::accept);
}

int TextStylesDialog::current() const {
  auto rows = table_->selectionModel()->selectedRows();
  return rows.isEmpty() ? -1 : rows.front().row();
}

void TextStylesDialog::fillTable() {
  updating_ = true;
  QSignalBlocker block(table_);
  table_->setRowCount(int(styles_.size()));
  for (auto [i, st] : v::enumerate(styles_)) {
    auto* name = new QTableWidgetItem(QString::fromStdString(st.name));
    if (i == 0) name->setFlags(name->flags() & ~Qt::ItemIsEditable);  // «(Default)» keeps its name
    auto* props = new QTableWidgetItem(describeTextStyle(st, u_));
    props->setFlags(props->flags() & ~Qt::ItemIsEditable);
    table_->setItem(int(i), 0, name);
    table_->setItem(int(i), 1, props);
  }
  updating_ = false;
}

void TextStylesDialog::showStyle() {
  int i = current();
  bool any = i >= 0;
  for (QWidget* w : std::initializer_list<QWidget*>{font_, height_, bold_, italic_}) w->setEnabled(any);
  remove_->setEnabled(any && i > 0 && use_[size_t(i)] == 0);
  if (!any) return;
  const TextStyle& st = styles_[size_t(i)];
  updating_ = true;
  font_->clear();
  font_->addItems(textFontNames(st.font));
  font_->setCurrentText(QString::fromStdString(st.font));
  height_->setValue(toUnit(double(st.height), u_));
  bold_->setChecked(st.bold);
  italic_->setChecked(st.italic);
  updating_ = false;
  QFont f = textFont(st);
  f.setPixelSize(32);
  example_->setFont(f);
}

void TextStylesDialog::edited() {
  int i = current();
  if (updating_ || i < 0) return;
  TextStyle& st = styles_[size_t(i)];
  TextStyle was = st;
  st.font = font_->currentText().toStdString();
  st.height = Coord(std::llround(fromUnit(height_->value(), u_)));
  st.bold = bold_->isChecked();
  st.italic = italic_->isChecked();
  if (st == was) return;
  {
    QSignalBlocker block(table_);
    table_->item(i, 1)->setText(describeTextStyle(st, u_));
  }
  QFont f = textFont(st);
  f.setPixelSize(32);
  example_->setFont(f);
  markChanged(true);
}

void TextStylesDialog::markChanged(bool on) { apply_->setEnabled(on); }

}  // namespace xr::gui
