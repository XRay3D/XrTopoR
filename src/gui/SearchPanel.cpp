#include "gui/SearchPanel.h"

#include <QHBoxLayout>
#include <QLabel>
#include <QToolButton>
#include <QVBoxLayout>

#include "gui/BoardView.h"

namespace xr::gui {

namespace {
enum Kind { KComponent, KNet, KPin, KVia };
enum Role { KindRole = Qt::UserRole, IndexRole };
constexpr int kMaxShown = 1000;  // per category
}  // namespace

SearchPanel::SearchPanel(Document* doc, BoardView* view, QWidget* parent) : QWidget(parent), doc_(doc), view_(view) {
  auto* v = new QVBoxLayout(this);
  v->setContentsMargins(2, 2, 2, 2);
  auto* row = new QHBoxLayout;
  auto* icon = new QLabel(QString::fromUtf8("🔍"));
  filter_ = new QLineEdit(this);
  auto* clear = new QToolButton(this);
  clear->setText("✕");
  clear->setToolTip(tr("Очистить"));
  clear->setStyleSheet("color: #c00000; font-weight: bold;");
  row->addWidget(icon);
  row->addWidget(filter_, 1);
  row->addWidget(clear);
  v->addLayout(row);
  v->addWidget(new QLabel(tr("Результат поиска:")));
  tree_ = new QTreeWidget(this);
  tree_->setHeaderHidden(true);
  v->addWidget(tree_, 1);
  connect(clear, &QToolButton::clicked, filter_, &QLineEdit::clear);
  connect(filter_, &QLineEdit::textChanged, this, &SearchPanel::rebuild);
  connect(doc_, &Document::boardReplaced, this, &SearchPanel::rebuild);
  connect(tree_, &QTreeWidget::itemClicked, this, [this](QTreeWidgetItem* it) { select(it, false); });
  connect(tree_, &QTreeWidget::itemDoubleClicked, this, [this](QTreeWidgetItem* it) { select(it, true); });
  rebuild();
}

void SearchPanel::focusSearch() {
  filter_->setFocus();
  filter_->selectAll();
}

void SearchPanel::rebuild() {
  tree_->clear();
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  QString f = filter_->text().trimmed();
  auto match = [&](const std::string& s) { return f.isEmpty() || QString::fromStdString(s).contains(f, Qt::CaseInsensitive); };
  auto category = [&](const QString& title) {
    auto* c = new QTreeWidgetItem(tree_, {title});
    QFont font = c->font(0);
    font.setUnderline(false);
    c->setForeground(0, QColor(0x10, 0x30, 0x90));
    return c;
  };
  auto add = [&](QTreeWidgetItem* parent, const QString& text, Kind k, int index) {
    if (parent->childCount() >= kMaxShown) return;
    auto* it = new QTreeWidgetItem(parent, {text});
    it->setData(0, KindRole, int(k));
    it->setData(0, IndexRole, index);
  };
  auto* comps = category(tr("Компоненты"));
  for (int i = 0; i < int(b.components.size()); ++i)
    if (match(b.components[i].ref) || match(b.components[i].value))
      add(comps, QString::fromStdString(b.components[i].ref + "  " + b.components[i].value), KComponent, i);
  auto* nets = category(tr("Цепи"));
  for (int i = 0; i < int(b.nets.size()); ++i)
    if (match(b.nets[i].name)) add(nets, QString::fromStdString(b.nets[i].name), KNet, i);
  auto* pins = category(tr("Контакты"));
  for (int i = 0; i < int(b.pads.size()); ++i) {
    const Pad& p = b.pads[i];
    std::string name = (p.component >= 0 ? b.components[p.component].ref + "-" : std::string()) + p.number;
    if (match(name) || (p.net >= 0 && !f.isEmpty() && match(b.nets[p.net].name)))
      add(pins, QString::fromStdString(name + (p.net >= 0 ? "  [" + b.nets[p.net].name + "]" : "")), KPin, i);
  }
  auto* vias = category(tr("Переходные отверстия"));
  for (int i = 0; i < int(b.vias.size()); ++i) {
    const Via& v = b.vias[i];
    std::string net = v.net >= 0 ? b.nets[v.net].name : std::string();
    if (f.isEmpty() || match(net)) add(vias, QString::fromStdString("#" + std::to_string(i + 1) + "  " + net), KVia, i);
  }
  for (auto* c : {comps, nets, pins, vias}) c->setText(0, QString("%1 (%2)").arg(c->text(0)).arg(c->childCount()));
  if (!f.isEmpty()) tree_->expandAll();
}

void SearchPanel::select(QTreeWidgetItem* it, bool show) {
  if (!it || !it->data(0, KindRole).isValid() || !doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  int i = it->data(0, IndexRole).toInt();
  std::optional<Vec2> at;
  switch (Kind(it->data(0, KindRole).toInt())) {
    case KComponent:
      doc_->setSelection({}, {i});
      at = b.components[i].pos.v();
      break;
    case KNet: {
      doc_->setHighlightedNet(i);
      std::vector<ItemRef> items;
      for (int p = 0; p < int(b.pads.size()); ++p)
        if (b.pads[p].net == i) {
          items.push_back({ItemType::Pad, p});
          if (!at) at = b.pads[p].pos.v();
        }
      doc_->setSelection(std::move(items), {});
      break;
    }
    case KPin:
      doc_->setSelection({{ItemType::Pad, i}}, {});
      at = b.pads[i].pos.v();
      break;
    case KVia:
      doc_->setSelection({{ItemType::Via, i}}, {});
      at = b.vias[i].pos.v();
      break;
  }
  if (show && at) view_->centerOn(*at, 15);
}

}  // namespace xr::gui
