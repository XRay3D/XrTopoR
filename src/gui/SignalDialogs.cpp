#include "gui/SignalDialogs.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDialogButtonBox>
#include <QFormLayout>
#include <QFrame>
#include <QGroupBox>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QInputDialog>
#include <QLabel>
#include <QLineEdit>
#include <QListView>
#include <QMenu>
#include <QMessageBox>
#include <QMouseEvent>
#include <QPainter>
#include <QPushButton>
#include <QScrollArea>
#include <QSpinBox>
#include <QSplitter>
#include <QStyle>
#include <QStandardItemModel>
#include <QTabWidget>
#include <QTableView>
#include <QToolButton>
#include <QVBoxLayout>
#include <map>

#include "gui/GroupExplorer.h"

namespace xr::gui {

namespace {

QString pinText(const PinRef& p) { return QString::fromStdString(p.comp + "-" + p.pin); }

PinRef pinFrom(const QString& text) {
  const int dash = text.lastIndexOf('-');
  return dash < 0 ? PinRef{} : PinRef{text.left(dash).toStdString(), text.mid(dash + 1).toStdString()};
}

QDialogButtonBox* buttons(QDialog* dlg, QBoxLayout* into, const QString& ok = {}) {
  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel, dlg);
  if (!ok.isEmpty()) box->button(QDialogButtonBox::Ok)->setText(ok);
  box->button(QDialogButtonBox::Cancel)->setText(QObject::tr("Отмена"));
  QObject::connect(box, &QDialogButtonBox::accepted, dlg, &QDialog::accept);
  QObject::connect(box, &QDialogButtonBox::rejected, dlg, &QDialog::reject);
  into->addWidget(box);
  return box;
}

void clearLayout(QLayout* l) {
  while (QLayoutItem* it = l->takeAt(0)) {
    if (it->widget()) it->widget()->deleteLater();
    delete it;
  }
}

QPushButton* link(const QString& text, const char* name) {
  auto* b = new QPushButton(text);
  b->setObjectName(name);
  b->setFlat(true);
  b->setCursor(Qt::PointingHandCursor);
  b->setStyleSheet("QPushButton { color: palette(link); text-decoration: underline; border: none; text-align: left; padding: 0; }");
  return b;
}

QTableView* compactTable(QWidget* parent = nullptr) {
  auto* t = new QTableView(parent);
  t->verticalHeader()->hide();
  t->verticalHeader()->setDefaultSectionSize(t->fontMetrics().height() + 8);
  t->setSelectionBehavior(QAbstractItemView::SelectRows);
  t->setSelectionMode(QAbstractItemView::SingleSelection);
  t->setEditTriggers(QAbstractItemView::AllEditTriggers);
  return t;
}

// A plain list of the names given, to tick (the nets to exclude, the groups of nets).
std::vector<std::string> pickNames(QWidget* parent, const QString& title, const std::vector<std::string>& names) {
  QDialog dlg(parent);
  dlg.setWindowTitle(title);
  dlg.resize(320, 420);
  auto* v = new QVBoxLayout(&dlg);
  auto* search = new QLineEdit;
  search->setPlaceholderText(QObject::tr("Поиск"));
  search->setClearButtonEnabled(true);
  v->addWidget(search);
  auto* model = new QStandardItemModel(&dlg);
  for (auto& n : names) {
    auto* it = new QStandardItem(QString::fromStdString(n));
    it->setCheckable(true);
    it->setEditable(false);
    model->appendRow(it);
  }
  auto* filter = new WordsFilter(&dlg);
  filter->setSourceModel(model);
  auto* view = new QListView;
  view->setObjectName("names");
  view->setModel(filter);
  v->addWidget(view, 1);
  QObject::connect(search, &QLineEdit::textChanged, filter, &WordsFilter::setWords);
  buttons(&dlg, v);
  std::vector<std::string> out;
  if (dlg.exec() != QDialog::Accepted) return out;
  for (int r = 0; r < model->rowCount(); ++r)
    if (model->item(r)->checkState() == Qt::Checked) out.push_back(model->item(r)->text().toStdString());
  return out;
}

}  // namespace

// ---------------------------------------------------------------- the source

SourcePickerDialog::SourcePickerDialog(Document* doc, const HiSpeed& h, QWidget* parent) : QDialog(parent), doc_(doc), h_(h) {
  setWindowTitle(tr("Выбор источника сигнала"));
  resize(460, 420);
  auto* v = new QVBoxLayout(this);
  v->addWidget(new QLabel(tr("Выберите контакт источника сигнала")));
  auto* search = new QLineEdit;
  search->setObjectName("search");
  search->setPlaceholderText(tr("Поиск (компонент, контакт, цепь; слова через пробел)"));
  search->setClearButtonEnabled(true);
  v->addWidget(search);
  model_ = new QStandardItemModel(this);
  filter_ = new WordsFilter(this);
  filter_->setSourceModel(model_);
  filter_->setFilterKeyColumn(-1);
  view_ = new QTableView;
  view_->setObjectName("pins");
  view_->setModel(filter_);
  view_->verticalHeader()->hide();
  view_->setSelectionBehavior(QAbstractItemView::SelectRows);
  view_->setSelectionMode(QAbstractItemView::SingleSelection);
  view_->setEditTriggers(QAbstractItemView::NoEditTriggers);
  view_->setSortingEnabled(true);
  view_->horizontalHeader()->setStretchLastSection(true);
  v->addWidget(view_, 1);
  passive_ = new QCheckBox(tr("Скрывать пассивные компоненты"));
  excluded_ = new QCheckBox(tr("Скрывать цепи, исключённые из поиска сигналов"));
  used_ = new QCheckBox(tr("Скрывать цепи, включённые в сигналы"));
  passive_->setChecked(true);
  excluded_->setChecked(true);
  for (QCheckBox* c : {passive_, excluded_, used_}) {
    v->addWidget(c);
    connect(c, &QCheckBox::toggled, this, &SourcePickerDialog::fill);
  }
  ok_ = buttons(this, v)->button(QDialogButtonBox::Ok);
  connect(search, &QLineEdit::textChanged, this, &SourcePickerDialog::setFilter);
  connect(view_, &QTableView::doubleClicked, this, [this] {
    if (pad()) accept();
  });
  fill();
  connect(view_->selectionModel(), &QItemSelectionModel::currentChanged, this, [this] { ok_->setEnabled(pad().has_value()); });
  ok_->setEnabled(false);
}

void SourcePickerDialog::fill() {
  const Board& b = *doc_->board();
  const SignalSearch s = sig::searchOf(h_);
  model_->clear();
  model_->setHorizontalHeaderLabels({tr("Контакт"), tr("Цепь")});
  // The nets in signals, by the signal.
  std::map<std::string, std::string> used;
  for (const SignalCluster& c : h_.clusters)
    for (auto& n : c.nets) used[n] = c.signalList.empty() ? std::string() : c.signalList[0].name;
  for (size_t i = 0; i < b.pads.size(); ++i) {
    const Pad& p = b.pads[i];
    if (p.net < 0 || p.component < 0) continue;
    const std::string& net = b.nets[size_t(p.net)].name;
    if (passive_->isChecked() && sig::isPassive(b, p.component)) continue;
    if (excluded_->isChecked() && r::contains(s.excludedNets, net)) continue;
    const bool taken = used.contains(net);
    if (used_->isChecked() && taken) continue;
    auto* pin = new QStandardItem(pinText(sig::pinOf(b, int(i))));
    auto* netItem = new QStandardItem(QString::fromStdString(net) + (taken ? tr(" (цепь сигнала %1)").arg(QString::fromStdString(used[net])) : QString()));
    pin->setData(int(i), Qt::UserRole);
    // (a net in a signal is shown greyed: it cannot be a new one's source)
    pin->setData(!taken, Qt::UserRole + 1);
    if (taken)
      for (QStandardItem* it : {pin, netItem}) it->setForeground(palette().brush(QPalette::Disabled, QPalette::Text));
    model_->appendRow({pin, netItem});
  }
  view_->sortByColumn(0, Qt::AscendingOrder);
  view_->resizeColumnToContents(0);
}

std::optional<int> SourcePickerDialog::pad() const {
  const QModelIndex i = view_->currentIndex();
  if (!i.isValid()) return std::nullopt;
  const QModelIndex pin = filter_->index(i.row(), 0);
  if (!pin.data(Qt::UserRole + 1).toBool()) return std::nullopt;
  return pin.data(Qt::UserRole).toInt();
}

void SourcePickerDialog::setFilter(const QString& words) { filter_->setWords(words); }
int SourcePickerDialog::rows() const { return filter_->rowCount(); }
QString SourcePickerDialog::rowText(int row, int column) const { return filter_->index(row, column).data().toString(); }
void SourcePickerDialog::choose(int row) { view_->setCurrentIndex(filter_->index(row, 0)); }

std::optional<int> pickSignalSource(QWidget* parent, Document* doc, const HiSpeed& h) {
  SourcePickerDialog dlg(doc, h, parent);
  if (dlg.exec() != QDialog::Accepted) return std::nullopt;
  return dlg.pad();
}

// ---------------------------------------------------------------- links and signals

LinksModel::LinksModel(const Board& b, SignalCluster& c, std::string net, bool readOnly, QObject* parent)
    : QAbstractTableModel(parent), b_(b), c_(c), net_(std::move(net)), readOnly_(readOnly) {
  rows_ = sig::linksOfNet(b_, c_, net_);
}

void LinksModel::reload() {
  beginResetModel();
  rows_ = sig::linksOfNet(b_, c_, net_);
  endResetModel();
}

int LinksModel::rowCount(const QModelIndex& parent) const { return parent.isValid() ? 0 : int(rows_.size()); }

QVariant LinksModel::data(const QModelIndex& index, int role) const {
  if (!index.isValid()) return {};
  const auto& pp = c_.pinPairs[size_t(rows_[size_t(index.row())])];
  if (index.column() == 2) return role == Qt::ToolTipRole ? QVariant(tr("Удалить связь")) : QVariant();
  const PinRef& p = index.column() == 0 ? pp.first : pp.second;
  switch (role) {
    case Qt::DisplayRole:
    case Qt::EditRole: return pinText(p);
    case ChoicesRole: {
      QStringList out;
      for (const PinRef& q : sig::pinsOfNet(b_, net_)) out << pinText(q);
      return out;
    }
    default: return {};
  }
}

bool LinksModel::setData(const QModelIndex& index, const QVariant& value, int role) {
  if (role != Qt::EditRole || index.column() > 1 || readOnly_) return false;
  auto& pp = c_.pinPairs[size_t(rows_[size_t(index.row())])];
  PinRef& p = index.column() == 0 ? pp.first : pp.second;
  const PinRef v = pinFrom(value.toString());
  if (v == p || v.comp.empty()) return false;
  p = v;
  emit dataChanged(index, index);
  emit edited();
  return true;
}

Qt::ItemFlags LinksModel::flags(const QModelIndex& index) const {
  if (!index.isValid()) return Qt::NoItemFlags;
  Qt::ItemFlags f = Qt::ItemIsEnabled;
  if (!readOnly_ && index.column() < 2) f |= Qt::ItemIsEditable | Qt::ItemIsSelectable;
  return f;
}

void LinksModel::addLink() {
  const auto pins = sig::pinsOfNet(b_, net_);
  if (pins.size() < 2 || readOnly_) return;
  beginResetModel();
  c_.pinPairs.push_back({pins[0], pins[1]});
  rows_ = sig::linksOfNet(b_, c_, net_);
  endResetModel();
  emit edited();
}

void LinksModel::removeLink(int row) {
  if (readOnly_ || row < 0 || row >= int(rows_.size())) return;
  beginResetModel();
  c_.pinPairs.erase(c_.pinPairs.begin() + rows_[size_t(row)]);
  rows_ = sig::linksOfNet(b_, c_, net_);
  endResetModel();
  emit edited();
}

ClusterSignalsModel::ClusterSignalsModel(const Board& b, const HiSpeed& h, SignalCluster& c, QObject* parent)
    : QAbstractTableModel(parent), b_(b), h_(h), c_(c) {}

void ClusterSignalsModel::reload() {
  beginResetModel();
  endResetModel();
}

int ClusterSignalsModel::rowCount(const QModelIndex& parent) const { return parent.isValid() ? 0 : int(c_.signalList.size()); }

std::vector<PinRef> ClusterSignalsModel::freePins() const {
  std::vector<PinRef> out;
  for (auto& n : c_.nets)
    for (const PinRef& p : sig::pinsOfNet(b_, n))
      if (!(p == c_.source) && !r::contains(c_.signalList, p, &Signal::receiver)) out.push_back(p);
  return out;
}

QVariant ClusterSignalsModel::data(const QModelIndex& index, int role) const {
  if (!index.isValid()) return {};
  const Signal& s = c_.signalList[size_t(index.row())];
  if (role == ChoicesRole && index.column() == 2) {
    QStringList out{pinText(s.receiver)};
    for (const PinRef& p : freePins()) out << pinText(p);
    return out;
  }
  if (role == Qt::ToolTipRole && index.column() == 3) return tr("Удалить сигнал");
  if (role != Qt::DisplayRole && role != Qt::EditRole) return {};
  switch (index.column()) {
    case 0: return QString::fromStdString(s.name);
    case 1: return pinText(c_.source);
    case 2: return pinText(s.receiver);
    default: return {};
  }
}

QVariant ClusterSignalsModel::headerData(int section, Qt::Orientation o, int role) const {
  if (o != Qt::Horizontal || role != Qt::DisplayRole) return {};
  const QString h[] = {tr("Имя"), tr("Источник"), tr("Приёмник"), {}};
  return section < 4 ? h[section] : QString();
}

bool ClusterSignalsModel::setData(const QModelIndex& index, const QVariant& value, int role) {
  if (role != Qt::EditRole) return false;
  Signal& s = c_.signalList[size_t(index.row())];
  if (index.column() == 0) {
    // Names are not repeated: among the signals of the design and of the cluster.
    const std::string name = value.toString().trimmed().toStdString();
    if (name.empty() || name == s.name) return false;
    HiSpeed others = h_;
    std::erase_if(others.clusters, [&](const SignalCluster& x) { return x.source == c_.source; });
    std::vector<std::string> own;
    for (const Signal& x : c_.signalList)
      if (&x != &s) own.push_back(x.name);
    if (sig::uniqueName(others, name, own) != name) return false;
    s.name = name;
  } else if (index.column() == 2) {
    const PinRef p = pinFrom(value.toString());
    if (p == s.receiver || p.comp.empty()) return false;
    s.receiver = p;
    if (s.components.empty() || s.components.back() != p.comp) {
      if (!s.components.empty()) s.components.back() = p.comp;
      else s.components = {c_.source.comp, p.comp};
    }
  } else
    return false;
  emit dataChanged(index, index);
  emit edited();
  return true;
}

Qt::ItemFlags ClusterSignalsModel::flags(const QModelIndex& index) const {
  if (!index.isValid()) return Qt::NoItemFlags;
  Qt::ItemFlags f = Qt::ItemIsEnabled | Qt::ItemIsSelectable;
  if (index.column() == 0 || index.column() == 2) f |= Qt::ItemIsEditable;
  return f;
}

bool ClusterSignalsModel::addSignal() {
  const auto free = freePins();
  if (free.empty()) return false;
  beginResetModel();
  Signal s;
  s.receiver = free.front();
  s.components = {c_.source.comp, s.receiver.comp};
  HiSpeed others = h_;
  std::erase_if(others.clusters, [&](const SignalCluster& x) { return x.source == c_.source; });
  std::vector<std::string> own;
  for (const Signal& x : c_.signalList) own.push_back(x.name);
  s.name = sig::uniqueName(others, (c_.nets.empty() ? std::string() : c_.nets[0]) + "_" + s.receiver.comp, own);
  c_.signalList.push_back(std::move(s));
  endResetModel();
  emit edited();
  return true;
}

void ClusterSignalsModel::removeSignal(int row) {
  if (row < 0 || row >= int(c_.signalList.size())) return;
  beginResetModel();
  c_.signalList.erase(c_.signalList.begin() + row);
  endResetModel();
  emit edited();
}

QWidget* ChoiceDelegate::createEditor(QWidget* parent, const QStyleOptionViewItem& option, const QModelIndex& index) const {
  const QVariant choices = index.data(LinksModel::ChoicesRole);
  if (!choices.isValid()) return QStyledItemDelegate::createEditor(parent, option, index);
  auto* c = new QComboBox(parent);
  c->addItems(choices.toStringList());
  return c;
}

void ChoiceDelegate::setEditorData(QWidget* editor, const QModelIndex& index) const {
  if (auto* c = qobject_cast<QComboBox*>(editor)) c->setCurrentText(index.data(Qt::EditRole).toString());
  else QStyledItemDelegate::setEditorData(editor, index);
}

void ChoiceDelegate::setModelData(QWidget* editor, QAbstractItemModel* model, const QModelIndex& index) const {
  if (auto* c = qobject_cast<QComboBox*>(editor)) model->setData(index, c->currentText(), Qt::EditRole);
  else QStyledItemDelegate::setModelData(editor, model, index);
}

void ChoiceDelegate::paint(QPainter* p, const QStyleOptionViewItem& option, const QModelIndex& index) const {
  if (index.column() != remove_ || !(index.flags() & Qt::ItemIsEnabled) || !index.model()->data(index.model()->index(index.row(), 0)).isValid()) {
    QStyledItemDelegate::paint(p, option, index);
    return;
  }
  // The red cross that removes the row.
  p->save();
  p->setRenderHint(QPainter::Antialiasing);
  p->setPen(QPen(QColor(0xd0, 0x20, 0x20), 2));
  const int s = std::min(option.rect.width(), option.rect.height()) / 2 - 2;
  const QPoint c = option.rect.center();
  p->drawLine(c + QPoint(-s / 2, -s / 2), c + QPoint(s / 2, s / 2));
  p->drawLine(c + QPoint(s / 2, -s / 2), c + QPoint(-s / 2, s / 2));
  p->restore();
}

bool ChoiceDelegate::editorEvent(QEvent* e, QAbstractItemModel* model, const QStyleOptionViewItem& option, const QModelIndex& index) {
  if (index.column() == remove_ && e->type() == QEvent::MouseButtonRelease) {
    emit removeRequested(index.row());
    return true;
  }
  if (index.column() == remove_ && (e->type() == QEvent::MouseButtonPress || e->type() == QEvent::MouseButtonDblClick)) return true;
  return QStyledItemDelegate::editorEvent(e, model, option, index);
}

// ---------------------------------------------------------------- the cards of nets

NetCards::NetCards(const Board& b, SignalCluster& c, bool editable, bool sourceChangeable, QWidget* parent)
    : QWidget(parent), b_(b), c_(c), editable_(editable), sourceChangeable_(sourceChangeable) {
  v_ = new QVBoxLayout(this);
  v_->setContentsMargins(0, 0, 0, 0);
  rebuild();
}

LinksModel* NetCards::links(const std::string& net) const {
  for (auto& [n, m] : links_)
    if (n == net) return m;
  return nullptr;
}

void NetCards::rebuild() {
  while (QLayoutItem* it = v_->takeAt(0)) {
    if (it->widget()) it->widget()->deleteLater();
    delete it;
  }
  links_.clear();
  for (const std::string& net : c_.nets) {
    auto* card = new QFrame;
    card->setObjectName("netCard");
    card->setFrameShape(QFrame::StyledPanel);
    auto* h = new QHBoxLayout(card);
    h->setContentsMargins(0, 0, 4, 4);
    // Left: the net, its pins, the source.
    auto* left = new QWidget;
    left->setFixedWidth(170);
    auto* lv = new QVBoxLayout(left);
    lv->setContentsMargins(0, 0, 0, 0);
    auto* head = new QLabel(QString::fromStdString(net));
    head->setStyleSheet("QLabel { background: #6d86d8; color: white; font-weight: bold; padding: 3px 6px; }");
    lv->addWidget(head);
    auto* info = new QVBoxLayout;
    info->setContentsMargins(6, 2, 2, 2);
    info->addWidget(new QLabel(tr("Контактов: %1").arg(sig::pinsOfNet(b_, net).size())));
    const bool source = !c_.nets.empty() && net == c_.nets[0];
    if (source) info->addWidget(new QLabel(tr("<b>Источник: %1</b>").arg(pinText(c_.source))));
    if (source && sourceChangeable_) {
      auto* change = link(tr("Изменить источник"), "changeSource");
      connect(change, &QPushButton::clicked, this, &NetCards::sourceChangeRequested);
      info->addWidget(change);
    }
    if (!source && editable_) {
      auto* remove = link(tr("Удалить"), "removeNet");
      connect(remove, &QPushButton::clicked, this, [this, net] { emit netRemoveRequested(net); });
      info->addWidget(remove, 0, Qt::AlignRight);
    }
    info->addStretch(1);
    lv->addLayout(info);
    h->addWidget(left);
    // Right: the links set on the net.
    auto* right = new QVBoxLayout;
    right->setContentsMargins(0, 4, 0, 0);
    right->addWidget(new QLabel(tr("Заданные связи:")));
    auto* model = new LinksModel(b_, c_, net, !editable_, card);
    links_.emplace_back(net, model);
    auto* t = compactTable();
    t->setObjectName("links");
    t->horizontalHeader()->hide();
    t->setModel(model);
    auto* delegate = new ChoiceDelegate(2, t);
    t->setItemDelegate(delegate);
    t->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
    t->horizontalHeader()->setSectionResizeMode(1, QHeaderView::Stretch);
    t->horizontalHeader()->setSectionResizeMode(2, QHeaderView::Fixed);
    t->setColumnWidth(2, 22);
    if (!editable_) t->setColumnHidden(2, true);
    t->setFixedHeight(std::max(1, model->rowCount() + 1) * t->verticalHeader()->defaultSectionSize() + 4);
    connect(delegate, &ChoiceDelegate::removeRequested, model, &LinksModel::removeLink);
    connect(model, &LinksModel::edited, this, &NetCards::edited);
    connect(model, &QAbstractItemModel::modelReset, t, [t, model] {
      t->setFixedHeight(std::max(1, model->rowCount() + 1) * t->verticalHeader()->defaultSectionSize() + 4);
    });
    right->addWidget(t);
    if (editable_) {
      auto* plus = new QToolButton;
      plus->setObjectName("addLink");
      plus->setText("+");
      plus->setToolTip(tr("Добавить связь"));
      plus->setAutoRaise(true);
      connect(plus, &QToolButton::clicked, model, &LinksModel::addLink);
      right->addWidget(plus, 0, Qt::AlignLeft);
    }
    h->addLayout(right, 1);
    v_->addWidget(card);
  }
  v_->addStretch(1);
}

// ---------------------------------------------------------------- «Создание сигналов»

ClusterDialog::ClusterDialog(Document* doc, const HiSpeed& h, SignalCluster cluster, Mode mode, QWidget* parent)
    : QDialog(parent), doc_(doc), h_(h), c_(std::move(cluster)), mode_(mode) {
  const Board& b = *doc_->board();
  setWindowTitle(mode == Mode::Create ? tr("Создание сигналов") : tr("Задать топологию"));
  resize(720, mode == Mode::Create ? 640 : 460);
  auto* v = new QVBoxLayout(this);

  auto* netsBox = new QGroupBox(tr("Цепи сигнального кластера"));
  auto* nh = new QHBoxLayout(netsBox);
  auto* nv = new QVBoxLayout;
  auto* scroll = new QScrollArea;
  scroll->setWidgetResizable(true);
  cards_ = new NetCards(b, c_, true, mode == Mode::Create);
  scroll->setWidget(cards_);
  nv->addWidget(scroll, 1);
  if (mode == Mode::Create) {
    auto* addNet = link(tr("Добавить цепь"), "addNet");
    connect(addNet, &QPushButton::clicked, this, [this, &b] {
      // The nets joined to the cluster's through a component, not in it.
      QStringList nets;
      for (const std::string& n : c_.nets)
        for (const PinRef& p : sig::pinsOfNet(b, n))
          if (auto pad = sig::padOf(b, p); pad && b.pads[size_t(*pad)].component >= 0)
            for (int q : b.components[size_t(b.pads[size_t(*pad)].component)].pads)
              if (const int m = b.pads[size_t(q)].net; m >= 0 && !r::contains(c_.nets, b.nets[size_t(m)].name) && !nets.contains(QString::fromStdString(b.nets[size_t(m)].name)))
                nets << QString::fromStdString(b.nets[size_t(m)].name);
      nets.sort();
      if (nets.isEmpty()) return;
      bool ok = false;
      const QString net = QInputDialog::getItem(this, tr("Добавить цепь"), tr("Цепь:"), nets, 0, false, &ok);
      if (!ok) return;
      if (std::string why = this->addNet(net.toStdString()); !why.empty())
        QMessageBox::information(this, tr("Добавить цепь"), QString::fromStdString(why));
    });
    nv->addWidget(addNet, 0, Qt::AlignLeft);
  }
  nh->addLayout(nv, 1);
  note_ = new QLabel(mode == Mode::Create ? tr("Сигнальный кластер – набор цепей, посредством которых передаётся сигнал.\n\n"
                                                "Набор цепей строится автоматически, затем его можно скорректировать.")
                                             : tr("Связи между контактами цепей сигнала."));
  note_->setObjectName("note");
  note_->setWordWrap(true);
  note_->setFixedWidth(220);
  note_->setAlignment(Qt::AlignTop | Qt::AlignLeft);
  nh->addWidget(note_);
  v->addWidget(netsBox, 1);
  connect(cards_, &NetCards::netRemoveRequested, this, [this](const std::string& net) {
    if (std::string why = removeNet(net); !why.empty()) QMessageBox::information(this, tr("Удалить цепь"), QString::fromStdString(why));
  });
  connect(cards_, &NetCards::sourceChangeRequested, this, &ClusterDialog::changeSource);
  connect(cards_, &NetCards::edited, this, [this] { note_->setText(cycleMessage().isEmpty() ? note_->text() : cycleMessage()); });

  if (mode == Mode::Create) {
    auto* sigBox = new QGroupBox(tr("Сигналы кластера"));
    auto* sh = new QHBoxLayout(sigBox);
    auto* sv = new QVBoxLayout;
    signals_ = new ClusterSignalsModel(b, h_, c_, this);
    auto* t = compactTable();
    t->setObjectName("clusterSignals");
    t->setModel(signals_);
    auto* delegate = new ChoiceDelegate(3, t);
    t->setItemDelegate(delegate);
    t->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
    t->horizontalHeader()->setSectionResizeMode(3, QHeaderView::Fixed);
    t->setColumnWidth(3, 22);
    t->setEditTriggers(QAbstractItemView::DoubleClicked | QAbstractItemView::SelectedClicked | QAbstractItemView::EditKeyPressed);
    connect(delegate, &ChoiceDelegate::removeRequested, signals_, &ClusterSignalsModel::removeSignal);
    sv->addWidget(t, 1);
    auto* plus = new QToolButton;
    plus->setObjectName("addSignal");
    plus->setText("+");
    plus->setToolTip(tr("Добавить сигнал"));
    plus->setAutoRaise(true);
    connect(plus, &QToolButton::clicked, signals_, &ClusterSignalsModel::addSignal);
    sv->addWidget(plus, 0, Qt::AlignLeft);
    auto* updateRow = new QHBoxLayout;
    auto* update = new QPushButton(tr("Обновить"));
    update->setObjectName("update");
    auto_ = new QCheckBox(tr("Обновлять автоматически при изменении списка цепей"));
    auto_->setChecked(true);
    update->setEnabled(false);
    connect(auto_, &QCheckBox::toggled, update, [update](bool on) { update->setEnabled(!on); });
    connect(update, &QPushButton::clicked, this, &ClusterDialog::update);
    updateRow->addWidget(update);
    updateRow->addWidget(auto_);
    updateRow->addStretch(1);
    sv->addLayout(updateRow);
    sh->addLayout(sv, 1);
    auto* zv = new QVBoxLayout;
    zv->addWidget(new QLabel(tr("Волновое сопротивление:")));
    impedance_ = new QComboBox;
    impedance_->setObjectName("impedance");
    for (const Impedance& z : h_.impedances)
      if (!z.diff) impedance_->addItem(QString::fromStdString(z.name));
    impedance_->setCurrentText(QString::fromStdString(c_.impedance));
    connect(impedance_, &QComboBox::currentTextChanged, this, [this](const QString& z) { c_.impedance = z.toStdString(); });
    zv->addWidget(impedance_);
    auto* zw = new QWidget;
    zw->setLayout(zv);
    zw->setFixedWidth(220);
    sh->addWidget(zw, 0, Qt::AlignTop);
    v->addWidget(sigBox);
    connect(signals_, &ClusterSignalsModel::edited, this, [this] {
      findExtras();
      showExtras();
    });

    // «Дополнительно»: the buses and pairs found.
    auto* extra = new QGroupBox(tr("Дополнительно"));
    auto* ev = new QVBoxLayout(extra);
    auto row = [&](QLabel*& info, const char* name, QCheckBox*& all, const QString& allText, auto open) {
      auto* h = new QHBoxLayout;
      info = new QLabel;
      info->setObjectName(name);
      auto* openList = link(tr("Открыть список"), (std::string(name) + "Open").c_str());
      connect(openList, &QPushButton::clicked, this, open);
      h->addWidget(info);
      h->addWidget(openList);
      h->addStretch(1);
      ev->addLayout(h);
      all = new QCheckBox(allText);
      all->setChecked(true);
      ev->addWidget(all);
      connect(all, &QCheckBox::toggled, this, &ClusterDialog::showExtras);
    };
    row(busInfo_, "buses", convertBuses_, tr("Преобразовать все найденные шины сигналов в группы сигналов"), [this] {
      BusesDialog dlg(doc_, h_, buses_, this);
      if (dlg.exec() != QDialog::Accepted) return;
      chosenBuses_ = dlg.chosen();
      convertBuses_->setChecked(false);
      showExtras();
    });
    row(pairInfo_, "pairs", joinPairs_, tr("Объединить все найденные парные сигналы в дифф. сигналы"), [this] {
      DiffPairsDialog dlg(doc_, h_, pairs_, this);
      if (dlg.exec() != QDialog::Accepted) return;
      chosenPairs_ = dlg.chosen();
      joinPairs_->setChecked(false);
      showExtras();
    });
    v->addWidget(extra);
    findExtras();
    showExtras();
  }
  buttons(this, v, mode == Mode::Create ? tr("Создать") : tr("OK"));
}

QString ClusterDialog::cycleMessage() const {
  for (const std::string& n : c_.nets)
    if (sig::linksHaveCycle(*doc_->board(), c_, n))
      return tr("В цепи '%1' имеется контур, необходимо исправить заданные связи").arg(QString::fromStdString(n));
  return {};
}

std::string ClusterDialog::addNet(const std::string& net) {
  const SignalSearch s = sig::searchOf(h_);
  std::vector<Signal> was = c_.signalList;
  const std::string why = sig::addNet(*doc_->board(), h_, c_, net, s);
  if (!why.empty()) return why;
  if (auto_ && !auto_->isChecked()) c_.signalList = std::move(was);  // (the signals made anew on «Обновить»)
  netsChanged();
  return {};
}

std::string ClusterDialog::removeNet(const std::string& net) {
  const std::string why = sig::removeNet(*doc_->board(), c_, net);
  if (!why.empty()) return why;
  if (!auto_ || auto_->isChecked()) sig::refreshSignals(*doc_->board(), h_, c_, sig::searchOf(h_));
  netsChanged();
  return {};
}

void ClusterDialog::setAutoUpdate(bool on) {
  if (auto_) auto_->setChecked(on);
}

void ClusterDialog::update() {
  sig::refreshSignals(*doc_->board(), h_, c_, sig::searchOf(h_));
  netsChanged();
}

void ClusterDialog::netsChanged() {
  cards_->rebuild();
  if (signals_) signals_->reload();
  findExtras();
  showExtras();
}

void ClusterDialog::changeSource() {
  const auto source = pickSignalSource(this, doc_, h_);
  if (!source) return;
  auto r = sig::buildCluster(*doc_->board(), h_, *source, sig::searchOf(h_));
  if (!r.cluster) {
    QMessageBox::information(this, tr("Изменить источник"), QString::fromStdString(r.error));
    return;
  }
  const std::string impedance = c_.impedance;
  c_ = std::move(*r.cluster);
  if (!impedance.empty()) c_.impedance = impedance;
  netsChanged();
}

void ClusterDialog::findExtras() {
  if (mode_ != Mode::Create) return;
  // Among the design's signals with this cluster's, those that take in one of its signals.
  HiSpeed with = h_;
  with.clusters.push_back(c_);
  std::vector<std::string> own;
  for (const Signal& s : c_.signalList) own.push_back(s.name);
  auto mine = [&](const std::vector<std::string>& names) { return r::any_of(names, [&](const std::string& n) { return r::contains(own, n); }); };
  buses_.clear();
  for (auto& bus : sig::findBuses(with))
    if (mine(bus.members)) buses_.push_back(std::move(bus));
  pairs_.clear();
  for (auto& p : sig::findDiffPairs(*doc_->board(), with, sig::searchOf(h_)))
    if (mine({p.positive, p.negative})) pairs_.push_back(std::move(p));
  chosenBuses_ = buses_;
  chosenPairs_ = pairs_;
}

void ClusterDialog::showExtras() {
  if (!busInfo_) return;
  const auto buses = convertBuses_->isChecked() ? buses_ : chosenBuses_;
  const auto pairs = joinPairs_->isChecked() ? pairs_ : chosenPairs_;
  busInfo_->setText(buses_.empty() ? tr("Шины сигналов не найдены.")
                                   : tr("Найдено: %1 шины сигналов. <b>Будет создано: %2 группы сигналов</b>").arg(buses_.size()).arg(buses.size()));
  pairInfo_->setText(pairs_.empty() ? tr("Парные сигналы не найдены.")
                                    : tr("Найдено: %1 парных сигналов. <b>Будет создано: %2 дифф. сигналов</b>").arg(pairs_.size()).arg(pairs.size()));
  for (QWidget* w : std::initializer_list<QWidget*>{convertBuses_, findChild<QPushButton*>("busesOpen")}) w->setVisible(!buses_.empty());
  for (QWidget* w : std::initializer_list<QWidget*>{joinPairs_, findChild<QPushButton*>("pairsOpen")}) w->setVisible(!pairs_.empty());
}

void ClusterDialog::setConvertBuses(bool on) {
  if (convertBuses_) convertBuses_->setChecked(on);
  if (!on) chosenBuses_.clear();
  showExtras();
}

void ClusterDialog::setJoinPairs(bool on) {
  if (joinPairs_) joinPairs_->setChecked(on);
  if (!on) chosenPairs_.clear();
  showExtras();
}

void ClusterDialog::applyTo(HiSpeed& h) const {
  sig::addCluster(h, c_);
  if (mode_ != Mode::Create) return;
  for (const sig::Bus& bus : convertBuses_->isChecked() ? buses_ : chosenBuses_) sig::addBusGroup(h, bus);
  for (const sig::DiffCandidate& p : joinPairs_->isChecked() ? pairs_ : chosenPairs_) sig::joinDiff(*doc_->board(), h, p.positive, p.negative, p.name);
}

// ---------------------------------------------------------------- the buses found

BusesDialog::BusesDialog(Document* doc, const HiSpeed& h, std::vector<sig::Bus> buses, QWidget* parent)
    : QDialog(parent), doc_(doc), h_(h), buses_(buses), found_(std::move(buses)) {
  setWindowTitle(tr("Поиск шин"));
  resize(680, 560);
  auto* v = new QVBoxLayout(this);
  auto* head = new QLabel(tr("Будут созданы группы сигналов для шин, отмеченных в списке"));
  QFont f = head->font();
  f.setPointSizeF(f.pointSizeF() * 1.2);
  head->setFont(f);
  v->addWidget(head);
  auto* split = new QSplitter(Qt::Horizontal);
  auto* left = new QWidget;
  auto* lv = new QVBoxLayout(left);
  lv->setContentsMargins(0, 0, 0, 0);
  lv->addWidget(new QLabel(tr("Найденные шины")));
  list_ = new QStandardItemModel(this);
  for (auto& bus : buses_) {
    auto* it = new QStandardItem(QString::fromStdString(bus.name));
    it->setCheckable(true);
    it->setCheckState(Qt::Checked);
    it->setEditable(false);
    list_->appendRow(it);
  }
  auto* listView = new QListView;
  listView->setObjectName("buses");
  listView->setModel(list_);
  lv->addWidget(listView, 1);
  auto* settings = new QPushButton(tr("Настройки поиска"));
  settings->setObjectName("searchSettings");
  lv->addWidget(settings);
  split->addWidget(left);
  auto* right = new QWidget;
  auto* rv = new QVBoxLayout(right);
  rv->setContentsMargins(0, 0, 0, 0);
  auto* titleRow = new QHBoxLayout;
  busTitle_ = new QLabel;
  auto* restore = new QToolButton;
  restore->setObjectName("restore");
  restore->setIcon(style()->standardIcon(QStyle::SP_BrowserReload));
  restore->setToolTip(tr("Вернуть удалённые сигналы шины"));
  restore->setAutoRaise(true);
  titleRow->addWidget(busTitle_, 1);
  titleRow->addWidget(restore);
  rv->addLayout(titleRow);
  table_ = new QStandardItemModel(this);
  auto* t = compactTable();
  t->setObjectName("busSignals");
  t->setModel(table_);
  t->setEditTriggers(QAbstractItemView::NoEditTriggers);
  auto* delegate = new ChoiceDelegate(3, t);
  t->setItemDelegate(delegate);
  rv->addWidget(t, 1);
  cardsHolder_ = new QWidget;
  new QVBoxLayout(cardsHolder_);
  cardsHolder_->layout()->setContentsMargins(0, 0, 0, 0);
  rv->addWidget(cardsHolder_, 1);
  split->addWidget(right);
  split->setSizes({200, 480});
  v->addWidget(split, 1);
  if (buses_.empty()) {
    auto* none = new QLabel(tr("Шины сигналов не найдены."));
    none->setObjectName("none");
    v->addWidget(none);
  }
  buttons(this, v);
  connect(listView->selectionModel(), &QItemSelectionModel::currentChanged, this, [this](const QModelIndex& i) { showBus(i.row()); });
  connect(delegate, &ChoiceDelegate::removeRequested, this, [this, listView](int row) { removeSignal(listView->currentIndex().row(), row); });
  connect(restore, &QToolButton::clicked, this, [this, listView] {
    const int i = listView->currentIndex().row();
    if (i >= 0) buses_[size_t(i)] = found_[size_t(i)];
    showBus(i);
  });
  connect(t->selectionModel(), &QItemSelectionModel::currentChanged, this, [this](const QModelIndex& i) {
    // The signal's cluster, its nets and links.
    clearLayout(cardsHolder_->layout());
    if (!i.isValid()) return;
    const std::string name = table_->item(i.row(), 0)->text().toStdString();
    const SignalCluster* c = h_.clusterOf(name);
    if (!c) return;
    auto* copy = new SignalCluster(*c);
    auto* title = new QLabel(tr("Сигнал \"%1\"").arg(QString::fromStdString(name)));
    auto* cards = new NetCards(*doc_->board(), *copy, false, false);
    connect(cards, &QObject::destroyed, [copy] { delete copy; });
    cardsHolder_->layout()->addWidget(title);
    cardsHolder_->layout()->addWidget(cards);
  });
  connect(settings, &QPushButton::clicked, this, [this] {
    HiSpeed h = h_;
    if (SearchSettingsDialog::run(this, doc_, h)) {
      // (the search is the design's: it is kept by the caller; here the list shows what it finds now)
      found_ = buses_ = sig::findBuses(h);
      list_->clear();
      for (auto& bus : buses_) {
        auto* it = new QStandardItem(QString::fromStdString(bus.name));
        it->setCheckable(true);
        it->setCheckState(Qt::Checked);
        list_->appendRow(it);
      }
      showBus(-1);
    }
  });
  if (!buses_.empty()) listView->setCurrentIndex(list_->index(0, 0));
}

void BusesDialog::showBus(int i) {
  table_->clear();
  table_->setHorizontalHeaderLabels({tr("Имя сигнала"), tr("Источник"), tr("Приёмник"), {}});
  if (i < 0 || i >= int(buses_.size())) {
    busTitle_->clear();
    return;
  }
  busTitle_->setText(tr("Шина сигналов \"%1\"").arg(QString::fromStdString(buses_[size_t(i)].name)));
  for (const std::string& s : buses_[size_t(i)].members) {
    const SignalCluster* c = h_.clusterOf(s);
    const Signal* sg = c ? &*r::find(c->signalList, s, &Signal::name) : nullptr;
    QList<QStandardItem*> row{new QStandardItem(QString::fromStdString(s)), new QStandardItem(c ? pinText(c->source) : QString()),
                              new QStandardItem(sg ? pinText(sg->receiver) : QString()), new QStandardItem};
    table_->appendRow(row);
  }
  if (auto* t = findChild<QTableView*>("busSignals")) {
    t->horizontalHeader()->setSectionResizeMode(0, QHeaderView::Stretch);
    t->setColumnWidth(3, 22);
  }
}

void BusesDialog::setChecked(int bus, bool on) { list_->item(bus)->setCheckState(on ? Qt::Checked : Qt::Unchecked); }

void BusesDialog::removeSignal(int bus, int row) {
  if (bus < 0 || bus >= int(buses_.size()) || row < 0 || row >= int(buses_[size_t(bus)].members.size())) return;
  buses_[size_t(bus)].members.erase(buses_[size_t(bus)].members.begin() + row);
  showBus(bus);
}

std::vector<sig::Bus> BusesDialog::chosen() const {
  std::vector<sig::Bus> out;
  for (size_t i = 0; i < buses_.size(); ++i)
    if (list_->item(int(i))->checkState() == Qt::Checked && buses_[i].members.size() >= 2) out.push_back(buses_[i]);
  return out;
}

bool BusesDialog::run(QWidget* parent, Document* doc, HiSpeed& h, std::vector<sig::Bus> buses) {
  BusesDialog dlg(doc, h, std::move(buses), parent);
  if (dlg.exec() != QDialog::Accepted) return false;
  const auto chosen = dlg.chosen();
  for (const sig::Bus& bus : chosen) sig::addBusGroup(h, bus);
  return !chosen.empty();
}

// ---------------------------------------------------------------- the pairs found

DiffPairsDialog::DiffPairsDialog(Document* doc, const HiSpeed& h, std::vector<sig::DiffCandidate> pairs, QWidget* parent)
    : QDialog(parent), doc_(doc), h_(h), pairs_(std::move(pairs)) {
  setWindowTitle(tr("Поиск дифф. сигналов"));
  resize(680, 600);
  auto* v = new QVBoxLayout(this);
  auto* head = new QLabel(tr("Будут созданы дифф. сигналы, отмеченные в списке"));
  QFont f = head->font();
  f.setPointSizeF(f.pointSizeF() * 1.2);
  head->setFont(f);
  v->addWidget(head);
  auto* split = new QSplitter(Qt::Horizontal);
  auto* left = new QWidget;
  auto* lv = new QVBoxLayout(left);
  lv->setContentsMargins(0, 0, 0, 0);
  lv->addWidget(new QLabel(tr("Возможные дифф. сигналы")));
  list_ = new QStandardItemModel(this);
  for (auto& p : pairs_) {
    auto* it = new QStandardItem(QString::fromStdString(p.name));
    it->setCheckable(true);
    it->setCheckState(Qt::Checked);
    it->setEditable(false);
    list_->appendRow(it);
  }
  auto* listView = new QListView;
  listView->setObjectName("pairs");
  listView->setModel(list_);
  lv->addWidget(listView, 1);
  auto* settings = new QPushButton(tr("Настройки поиска"));
  settings->setObjectName("searchSettings");
  lv->addWidget(settings);
  split->addWidget(left);
  holder_ = new QWidget;
  new QVBoxLayout(holder_);
  holder_->layout()->setContentsMargins(0, 0, 0, 0);
  auto* scroll = new QScrollArea;
  scroll->setWidgetResizable(true);
  scroll->setWidget(holder_);
  split->addWidget(scroll);
  split->setSizes({200, 480});
  v->addWidget(split, 1);
  if (pairs_.empty()) {
    auto* none = new QLabel(tr("Дифференциальные сигналы не найдены."));
    none->setObjectName("none");
    v->addWidget(none);
  }
  buttons(this, v);
  connect(listView->selectionModel(), &QItemSelectionModel::currentChanged, this, [this](const QModelIndex& i) { showPair(i.row()); });
  connect(settings, &QPushButton::clicked, this, [this] {
    HiSpeed h = h_;
    SearchSettingsDialog::run(this, doc_, h);
  });
  if (!pairs_.empty()) listView->setCurrentIndex(list_->index(0, 0));
}

void DiffPairsDialog::showPair(int i) {
  clearLayout(holder_->layout());
  if (i < 0 || i >= int(pairs_.size())) return;
  for (const std::string& s : {pairs_[size_t(i)].positive, pairs_[size_t(i)].negative}) {
    const SignalCluster* c = h_.clusterOf(s);
    if (!c) continue;
    const Signal& sg = *r::find(c->signalList, s, &Signal::name);
    auto* title = new QLabel(tr("Сигнал \"%1\"    Источник %2, Приёмник %3").arg(QString::fromStdString(s), pinText(c->source), pinText(sg.receiver)));
    auto* copy = new SignalCluster(*c);
    auto* cards = new NetCards(*doc_->board(), *copy, false, false);
    connect(cards, &QObject::destroyed, [copy] { delete copy; });
    holder_->layout()->addWidget(title);
    holder_->layout()->addWidget(cards);
  }
}

void DiffPairsDialog::setChecked(int pair, bool on) { list_->item(pair)->setCheckState(on ? Qt::Checked : Qt::Unchecked); }

std::vector<sig::DiffCandidate> DiffPairsDialog::chosen() const {
  std::vector<sig::DiffCandidate> out;
  for (size_t i = 0; i < pairs_.size(); ++i)
    if (list_->item(int(i))->checkState() == Qt::Checked) out.push_back(pairs_[i]);
  return out;
}

bool DiffPairsDialog::run(QWidget* parent, Document* doc, HiSpeed& h, std::vector<sig::DiffCandidate> pairs) {
  DiffPairsDialog dlg(doc, h, std::move(pairs), parent);
  if (dlg.exec() != QDialog::Accepted) return false;
  bool any = false;
  for (const sig::DiffCandidate& p : dlg.chosen()) any |= sig::joinDiff(*doc->board(), h, p.positive, p.negative, p.name) >= 0;
  return any;
}

// ---------------------------------------------------------------- the search's settings

SearchSettingsDialog::SearchSettingsDialog(Document* doc, const SignalSearch& s, const DesignRules* rules, QWidget* parent)
    : QDialog(parent), doc_(doc), s_(s), rules_(rules) {
  setWindowTitle(tr("Настройки поиска сигналов"));
  resize(420, 520);
  if (s_.names.empty()) s_.names = sig::defaultDiffNames();
  auto* v = new QVBoxLayout(this);
  tabs_ = new QTabWidget;
  v->addWidget(tabs_, 1);

  // «Общие».
  auto* general = new QWidget;
  auto* gv = new QVBoxLayout(general);
  auto* maxRow = new QHBoxLayout;
  auto* maxLabel = new QLabel(tr("Максимальное количество цепей в сигнальном кластере"));
  maxLabel->setWordWrap(true);
  maxNets_ = new QSpinBox;
  maxNets_->setObjectName("maxNets");
  maxNets_->setRange(1, 1000);
  maxNets_->setValue(s_.maxNetsInCluster);
  maxRow->addWidget(maxLabel, 1);
  maxRow->addWidget(maxNets_);
  gv->addLayout(maxRow);
  gv->addWidget(new QLabel(tr("Цепи, исключённые из поиска сигналов")));
  excluded_ = new QStandardItemModel(this);
  auto* exView = new QListView;
  exView->setObjectName("excluded");
  exView->setModel(excluded_);
  exView->setSelectionMode(QAbstractItemView::ExtendedSelection);
  exView->setEditTriggers(QAbstractItemView::NoEditTriggers);
  gv->addWidget(exView, 1);
  auto* exBar = new QHBoxLayout;
  auto* plus = new QToolButton;
  plus->setObjectName("addExcluded");
  plus->setText("+");
  plus->setPopupMode(QToolButton::InstantPopup);
  auto* menu = new QMenu(plus);
  const Board& b = *doc_->board();
  menu->addAction(tr("Цепи..."), this, [this, &b] {
    std::vector<std::string> nets;
    for (auto& n : b.nets)
      if (!r::contains(s_.excludedNets, n.name)) nets.push_back(n.name);
    addNets(pickNames(this, tr("Цепи"), nets));
  });
  menu->addAction(tr("Группы цепей..."), this, [this] {
    if (!rules_) return;
    std::vector<std::string> groups;
    for (auto& g : rules_->netGroups) groups.push_back(g.name);
    for (auto& g : pickNames(this, tr("Группы цепей"), groups)) addNets(rules_->netsOf(g));
  });
  menu->addAction(tr("Все цепи"), this, [this, &b] {
    std::vector<std::string> nets;
    for (auto& n : b.nets) nets.push_back(n.name);
    addNets(nets);
  });
  plus->setMenu(menu);
  auto* minus = new QToolButton;
  minus->setObjectName("removeExcluded");
  minus->setText("−");
  connect(minus, &QToolButton::clicked, this, [this, exView] {
    QModelIndexList sel = exView->selectionModel()->selectedIndexes();
    for (const QModelIndex& i : sel) std::erase(s_.excludedNets, i.data().toString().toStdString());
    fillExcluded();
  });
  auto* autoFill = new QPushButton(tr("Автозаполнение"));
  autoFill->setObjectName("autofill");
  connect(autoFill, &QPushButton::clicked, this, &SearchSettingsDialog::autofill);
  exBar->addWidget(plus);
  exBar->addWidget(minus);
  exBar->addWidget(autoFill, 1);
  gv->addLayout(exBar);
  auto* minRow = new QHBoxLayout;
  auto* minLabel = new QLabel(tr("Мин. количество контактов в исключаемой цепи"));
  minLabel->setWordWrap(true);
  minPins_ = new QSpinBox;
  minPins_->setObjectName("minPins");
  minPins_->setRange(2, 100000);
  minPins_->setValue(s_.minPinsNumber);
  minRow->addWidget(minLabel, 1);
  minRow->addWidget(minPins_);
  gv->addLayout(minRow);
  auto* note = new QLabel(tr("При автозаполнении в список попадают цепи с соответствующим количеством контактов, а также цепи, "
                             "назначенные на опорные слои"));
  note->setWordWrap(true);
  gv->addWidget(note);
  links_ = new QCheckBox(tr("Автоматически задавать связи"));
  links_->setObjectName("autoLinks");
  links_->setChecked(s_.createPinPairs);
  gv->addWidget(links_);
  tabs_->addTab(general, tr("Общие"));

  // «Дифф. сигналы».
  auto* diff = new QWidget;
  auto* dv = new QVBoxLayout(diff);
  dv->addWidget(new QLabel(tr("Правила именования цепей дифф. сигналов")));
  names_ = new QStandardItemModel(this);
  auto* t = new QTableView;
  t->setObjectName("names");
  t->setModel(names_);
  t->verticalHeader()->hide();
  t->setSelectionBehavior(QAbstractItemView::SelectRows);
  t->setSelectionMode(QAbstractItemView::SingleSelection);
  t->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);
  t->horizontalHeader()->setSectionResizeMode(0, QHeaderView::ResizeToContents);
  dv->addWidget(t, 1);
  auto* nBar = new QHBoxLayout;
  auto tool = [&](const QString& text, const char* name) {
    auto* b = new QToolButton;
    b->setText(text);
    b->setObjectName(name);
    nBar->addWidget(b);
    return b;
  };
  auto* add = tool("+", "addName");
  auto* del = tool("−", "removeName");
  auto* up = tool("▲", "nameUp");
  auto* down = tool("▼", "nameDown");
  nBar->addStretch(1);
  auto* defaults = new QPushButton(tr("По умолчанию"));
  defaults->setObjectName("defaults");
  nBar->addWidget(defaults);
  dv->addLayout(nBar);
  auto* order = new QLabel(tr("Правила применяются в соответствии с приоритетом, определяемым порядком нахождения в таблице "
                              "(наивысший приоритет вверху таблицы)"));
  order->setWordWrap(true);
  dv->addWidget(order);
  tabs_->addTab(diff, tr("Дифф. сигналы"));
  auto move = [this, t](int by) {
    readNames();
    const int r = t->currentIndex().row(), to = r + by;
    if (r < 0 || to < 0 || to >= int(s_.names.size())) return;
    std::swap(s_.names[size_t(r)], s_.names[size_t(to)]);
    fillNames();
    t->setCurrentIndex(names_->index(to, 1));
  };
  connect(add, &QToolButton::clicked, this, [this] {
    readNames();
    s_.names.push_back({true, "", ""});
    fillNames();
  });
  connect(del, &QToolButton::clicked, this, [this, t] {
    readNames();
    if (int r = t->currentIndex().row(); r >= 0) s_.names.erase(s_.names.begin() + r);
    fillNames();
  });
  connect(up, &QToolButton::clicked, this, [move] { move(-1); });
  connect(down, &QToolButton::clicked, this, [move] { move(1); });
  connect(defaults, &QPushButton::clicked, this, &SearchSettingsDialog::restoreDefaultNames);
  buttons(this, v);
  fillExcluded();
  fillNames();
}

void SearchSettingsDialog::fillExcluded() {
  excluded_->clear();
  for (auto& n : s_.excludedNets) excluded_->appendRow(new QStandardItem(QString::fromStdString(n)));
}

void SearchSettingsDialog::fillNames() {
  names_->clear();
  names_->setHorizontalHeaderLabels({{}, tr("Прямой сигнал"), tr("Инверсный")});
  for (const DiffNamesRule& r : s_.names) {
    auto* on = new QStandardItem;
    on->setCheckable(true);
    on->setCheckState(r.enabled ? Qt::Checked : Qt::Unchecked);
    on->setEditable(false);
    auto* pos = new QStandardItem(QString::fromStdString(r.pos));
    auto* neg = new QStandardItem(QString::fromStdString(r.neg));
    pos->setTextAlignment(Qt::AlignCenter);
    neg->setTextAlignment(Qt::AlignCenter);
    names_->appendRow({on, pos, neg});
  }
}

void SearchSettingsDialog::readNames() {
  s_.names.clear();
  for (int r = 0; r < names_->rowCount(); ++r)
    s_.names.push_back({names_->item(r, 0)->checkState() == Qt::Checked, names_->item(r, 1)->text().toStdString(), names_->item(r, 2)->text().toStdString()});
}

void SearchSettingsDialog::autofill() {
  addNets(sig::autoExcludedNets(*doc_->board(), minPins_->value()));
}

void SearchSettingsDialog::addNets(const std::vector<std::string>& nets) {
  for (auto& n : nets)
    if (!r::contains(s_.excludedNets, n)) s_.excludedNets.push_back(n);
  fillExcluded();
}

void SearchSettingsDialog::restoreDefaultNames() {
  s_.names = sig::defaultDiffNames();
  fillNames();
}

SignalSearch SearchSettingsDialog::settings() const {
  SignalSearch s = s_;
  s.present = true;
  s.maxNetsInCluster = maxNets_->value();
  s.minPinsNumber = minPins_->value();
  s.createPinPairs = links_->isChecked();
  s.names.clear();
  for (int r = 0; r < names_->rowCount(); ++r)
    s.names.push_back({names_->item(r, 0)->checkState() == Qt::Checked, names_->item(r, 1)->text().toStdString(), names_->item(r, 2)->text().toStdString()});
  return s;
}

bool SearchSettingsDialog::run(QWidget* parent, Document* doc, HiSpeed& h, const DesignRules* rules) {
  SearchSettingsDialog dlg(doc, sig::searchOf(h), rules, parent);
  if (dlg.exec() != QDialog::Accepted) return false;
  SignalSearch s = dlg.settings();
  const SignalSearch was = sig::searchOf(h);
  const bool same = s.maxNetsInCluster == was.maxNetsInCluster && s.minPinsNumber == was.minPinsNumber && s.createPinPairs == was.createPinPairs &&
                    s.excludedNets == was.excludedNets &&
                    r::equal(s.names, was.names, [](const DiffNamesRule& a, const DiffNamesRule& b) { return a.enabled == b.enabled && a.pos == b.pos && a.neg == b.neg; });
  if (same && h.search.present) return false;
  h.search = std::move(s);
  return true;
}

}  // namespace xr::gui
