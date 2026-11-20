#include "gui/GroupExplorer.h"

#include <QApplication>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QIODevice>
#include <QLabel>
#include <QLineEdit>
#include <QListView>
#include <QMenu>
#include <QMimeData>
#include <QPainter>
#include <QSplitter>
#include <QStyle>
#include <QToolButton>
#include <QTreeView>
#include <QVBoxLayout>
#include <algorithm>
#include <format>

#include "core/Board.h"

namespace xr::gui {

namespace {

constexpr const char* kMime = "application/x-xrtopor-group-items";

// The drag's content: the group it came from, then "o <id>" / "g <name>" lines.
QByteArray encode(const std::string& from, const std::vector<std::string>& ids, const std::vector<std::string>& groups) {
  QByteArray out = QByteArray::fromStdString(from) + '\n';
  for (auto& i : ids) out += "o " + QByteArray::fromStdString(i) + '\n';
  for (auto& g : groups) out += "g " + QByteArray::fromStdString(g) + '\n';
  return out;
}

void decode(const QByteArray& data, std::string& from, std::vector<std::string>& ids, std::vector<std::string>& groups) {
  const QList<QByteArray> lines = data.split('\n');
  if (lines.isEmpty()) return;
  from = lines[0].toStdString();
  for (int i = 1; i < lines.size(); ++i) {
    if (lines[i].size() < 2) continue;
    (lines[i][0] == 'o' ? ids : groups).push_back(lines[i].mid(2).toStdString());
  }
}

std::string uniqueGroup(const GroupSource& s, const std::string& base) {
  const auto all = s.groups();
  if (!r::contains(all, base)) return base;
  for (int k = 1;; ++k)
    if (std::string n = std::format("{}_{}", base, k); !r::contains(all, n)) return n;
}

QIcon drawn(const std::function<void(QPainter&)>& paint) {
  QPixmap pm(16, 16);
  pm.fill(Qt::transparent);
  QPainter p(&pm);
  p.setRenderHint(QPainter::Antialiasing);
  paint(p);
  return QIcon(pm);
}

}  // namespace

QIcon netIcon() {
  return drawn([](QPainter& p) {
    p.setPen(QPen(QColor(0x30, 0x60, 0xb0), 2));
    p.drawLine(2, 8, 14, 8);
    p.setBrush(QColor(0x30, 0x60, 0xb0));
    p.drawEllipse(QPointF(2.5, 8), 2, 2);
    p.drawEllipse(QPointF(13.5, 8), 2, 2);
  });
}
QIcon componentIcon() {
  return drawn([](QPainter& p) {
    p.setPen(QPen(QColor(0x40, 0x40, 0x40), 1.2));
    p.setBrush(QColor(0xe8, 0xe8, 0xe8));
    p.drawRect(QRectF(3.5, 2.5, 9, 11));
    p.drawLine(1, 5, 3, 5), p.drawLine(1, 11, 3, 11), p.drawLine(13, 5, 15, 5), p.drawLine(13, 11, 15, 11);
  });
}
QIcon layerIcon() {
  return drawn([](QPainter& p) {
    for (int i = 0; i < 3; ++i) {
      p.setPen(QPen(QColor(0x50 + i * 50, 0x80, 0x40), 2));
      p.drawLine(2, 4 + i * 4, 14, 4 + i * 4);
    }
  });
}
QIcon signalIcon() {
  return drawn([](QPainter& p) {
    p.setPen(QPen(QColor(0x30, 0x50, 0x90), 1.8));
    p.drawLine(3, 13, 13, 3);
  });
}
QIcon diffSignalIcon() {
  return drawn([](QPainter& p) {
    p.setPen(QPen(QColor(0x30, 0x50, 0x90), 1.6));
    p.drawLine(2, 12, 11, 3);
    p.drawLine(5, 14, 14, 5);
  });
}
QIcon folderIcon() { return QApplication::style()->standardIcon(QStyle::SP_DirIcon); }

std::string GroupSource::parentOf(const std::string& group) const {
  for (auto& g : groups())
    if (r::contains(subgroups(g), group)) return g;
  return {};
}

bool GroupSource::inAnyGroup(const std::string& id) const {
  for (auto& g : groups())
    if (r::contains(members(g), id)) return true;
  return false;
}

bool applyMove(GroupSource& s, const std::string& to, const std::string& from, const std::vector<std::string>& ids,
               const std::vector<std::string>& groups, bool add) {
  // A group goes into a group not its own nor one in it; it leaves the group it was in (one at most).
  for (auto& g : groups)
    for (std::string up = to; !up.empty(); up = s.parentOf(up))
      if (up == g) return false;
  bool changed = false;
  if (!to.empty()) {
    auto m = s.members(to);
    for (auto& i : ids)
      if (!r::contains(m, i)) m.push_back(i), changed = true;
    s.setMembers(to, m);
  }
  if (!add && !from.empty() && from != to) {
    auto m = s.members(from);
    const size_t was = m.size();
    std::erase_if(m, [&](const std::string& i) { return r::contains(ids, i); });
    if (m.size() != was) s.setMembers(from, m), changed = true;
  }
  for (auto& g : groups) {
    const std::string parent = s.parentOf(g);
    if (parent == to) continue;
    if (!parent.empty()) {
      auto sub = s.subgroups(parent);
      std::erase(sub, g);
      s.setSubgroups(parent, sub);
    }
    if (!to.empty()) {
      auto sub = s.subgroups(to);
      sub.push_back(g);
      s.setSubgroups(to, sub);
    }
    changed = true;
  }
  return changed;
}

// ---------------------------------------------------------------- the tree

GroupTreeModel::GroupTreeModel(GroupSource& source, QObject* parent) : QStandardItemModel(parent), s_(source) { rebuild(); }

void GroupTreeModel::rebuild() {
  clear();
  const auto objects = s_.objects();
  int ungrouped = 0;
  for (auto& o : objects) ungrouped += !s_.inAnyGroup(o.id);
  auto root = [&](const QString& text, GroupNode::Kind kind) {
    auto* it = new QStandardItem(text);
    it->setData(int(kind), KindRole);
    QFont f = it->font();
    f.setBold(true);
    it->setFont(f);
    it->setEditable(false);
    appendRow(it);
    return it;
  };
  root(QString("%1 (%2)").arg(s_.allTitle()).arg(objects.size()), GroupNode::Kind::All);
  root(tr("Несгруппированные (%1)").arg(ungrouped), GroupNode::Kind::Ungrouped);
  auto* groups = root(tr("Группы"), GroupNode::Kind::Groups);
  auto add = [&](this auto& self, QStandardItem* under, const std::string& g, int depth) -> void {
    auto* it = new QStandardItem(QString::fromStdString(g));
    it->setData(int(GroupNode::Kind::Group), KindRole);
    it->setData(QString::fromStdString(g), NameRole);
    const auto sub = s_.subgroups(g);
    // (TopoR marks a group that holds groups)
    if (!sub.empty()) {
      QPixmap pm(8, 8);
      pm.fill(QColor(0xe0, 0x20, 0xc0));
      it->setIcon(QIcon(pm));
    }
    it->setToolTip(QString::fromStdString(g));
    under->appendRow(it);
    if (depth < 32)
      for (auto& k : sub) self(it, k, depth + 1);
  };
  for (auto& g : s_.groups())
    if (s_.parentOf(g).empty()) add(groups, g, 0);
}

QModelIndex GroupTreeModel::indexOf(const GroupNode& node) const {
  if (node.kind != GroupNode::Kind::Group) return index(int(node.kind), 0);
  const QModelIndexList found = match(index(int(GroupNode::Kind::Groups), 0), NameRole, QString::fromStdString(node.group), 1,
                                      Qt::MatchExactly | Qt::MatchRecursive);
  return found.isEmpty() ? QModelIndex() : found.front();
}

GroupNode GroupTreeModel::nodeOf(const QModelIndex& index) const {
  if (!index.isValid()) return {};
  GroupNode n;
  n.kind = GroupNode::Kind(index.data(KindRole).toInt());
  n.group = index.data(NameRole).toString().toStdString();
  return n;
}

Qt::ItemFlags GroupTreeModel::flags(const QModelIndex& index) const {
  Qt::ItemFlags f = QStandardItemModel::flags(index) & ~Qt::ItemIsDragEnabled & ~Qt::ItemIsDropEnabled;
  const GroupNode n = nodeOf(index);
  if (n.kind == GroupNode::Kind::Group) f |= Qt::ItemIsEditable | Qt::ItemIsDragEnabled | Qt::ItemIsDropEnabled;
  else f &= ~Qt::ItemIsEditable;
  if (n.kind == GroupNode::Kind::Groups || n.kind == GroupNode::Kind::Ungrouped) f |= Qt::ItemIsDropEnabled;
  return f;
}

bool GroupTreeModel::setData(const QModelIndex& index, const QVariant& value, int role) {
  const GroupNode n = nodeOf(index);
  if (role != Qt::EditRole || n.kind != GroupNode::Kind::Group) return QStandardItemModel::setData(index, value, role);
  const std::string name = value.toString().trimmed().toStdString();
  if (name.empty() || name == n.group || r::contains(s_.groups(), name) || !s_.renameGroup(n.group, name)) return false;
  QStandardItemModel::setData(index, QString::fromStdString(name), Qt::DisplayRole);
  QStandardItemModel::setData(index, QString::fromStdString(name), NameRole);
  emit edited();
  return true;
}

QStringList GroupTreeModel::mimeTypes() const { return {kMime}; }

QMimeData* GroupTreeModel::mimeData(const QModelIndexList& indexes) const {
  std::vector<std::string> groups;
  std::string from;
  for (const QModelIndex& i : indexes)
    if (nodeOf(i).kind == GroupNode::Kind::Group) {
      groups.push_back(nodeOf(i).group);
      from = s_.parentOf(groups.back());
    }
  auto* m = new QMimeData;
  m->setData(kMime, encode(from, {}, groups));
  return m;
}

bool GroupTreeModel::canDropMimeData(const QMimeData* data, Qt::DropAction, int, int, const QModelIndex& parent) const {
  if (!data->hasFormat(kMime)) return false;
  const GroupNode n = nodeOf(parent);
  return n.kind == GroupNode::Kind::Group || n.kind == GroupNode::Kind::Groups || n.kind == GroupNode::Kind::Ungrouped;
}

bool GroupTreeModel::dropMimeData(const QMimeData* data, Qt::DropAction action, int row, int column, const QModelIndex& parent) {
  if (!canDropMimeData(data, action, row, column, parent)) return false;
  std::string from;
  std::vector<std::string> ids, groups;
  decode(data->data(kMime), from, ids, groups);
  const GroupNode n = nodeOf(parent);
  // Onto «Группы»: the groups to the top; onto «Несгруппированные»: the objects out of the group they came from.
  const std::string to = n.kind == GroupNode::Kind::Group ? n.group : std::string();
  if (n.kind == GroupNode::Kind::Ungrouped) groups.clear();
  if (n.kind == GroupNode::Kind::Groups) ids.clear();
  const bool add = action == Qt::CopyAction;
  if (!applyMove(s_, to, from, ids, groups, add)) return false;
  emit edited();
  return false;  // (the view must not remove what was dragged: the explorer rebuilds itself)
}

// ---------------------------------------------------------------- the list

MemberListModel::MemberListModel(GroupSource& source, QObject* parent) : QAbstractListModel(parent), s_(source) {}

void MemberListModel::show(const GroupNode& node) {
  beginResetModel();
  node_ = node;
  rows_.clear();
  std::vector<std::string> ids;
  std::vector<std::string> folders;
  switch (node.kind) {
    case GroupNode::Kind::All:
      for (auto& o : s_.objects()) ids.push_back(o.id);
      break;
    case GroupNode::Kind::Ungrouped:
      for (auto& o : s_.objects())
        if (!s_.inAnyGroup(o.id)) ids.push_back(o.id);
      break;
    case GroupNode::Kind::Groups:
      for (auto& g : s_.groups())
        if (s_.parentOf(g).empty()) folders.push_back(g);
      break;
    case GroupNode::Kind::Group:
      folders = s_.subgroups(node.group);
      ids = s_.members(node.group);
      break;
  }
  for (auto& g : folders) rows_.push_back({g, true, QString::fromStdString(g), QString::fromStdString(g), folderIcon()});
  const auto objects = s_.objects();
  for (auto& id : ids)
    if (auto o = r::find(objects, id, &GroupSource::Object::id); o != objects.end()) rows_.push_back({id, false, o->text, o->tip, o->icon});
  endResetModel();
}

int MemberListModel::rowCount(const QModelIndex& parent) const { return parent.isValid() ? 0 : int(rows_.size()); }

QVariant MemberListModel::data(const QModelIndex& index, int role) const {
  if (!index.isValid() || index.row() >= int(rows_.size())) return {};
  const Row& r = rows_[size_t(index.row())];
  switch (role) {
    case Qt::DisplayRole:
    case Qt::EditRole: return r.text;
    case Qt::ToolTipRole: return r.tip;
    case Qt::DecorationRole: return r.icon;
    case IdRole: return QString::fromStdString(r.id);
    case IsGroupRole: return r.group;
    default: return {};
  }
}

bool MemberListModel::setData(const QModelIndex& index, const QVariant& value, int role) {
  if (role != Qt::EditRole || !index.isValid()) return false;
  Row& r = rows_[size_t(index.row())];
  const std::string name = value.toString().trimmed().toStdString();
  if (name.empty() || name == r.text.toStdString()) return false;
  if (r.group ? (r::contains(s_.groups(), name) || !s_.renameGroup(r.id, name)) : !s_.renameObject(r.id, name)) return false;
  emit edited();
  return true;
}

Qt::ItemFlags MemberListModel::flags(const QModelIndex& index) const {
  if (!index.isValid()) return Qt::NoItemFlags;
  Qt::ItemFlags f = Qt::ItemIsEnabled | Qt::ItemIsSelectable | Qt::ItemIsDragEnabled;
  if (rows_[size_t(index.row())].group || s_.renamable()) f |= Qt::ItemIsEditable;
  return f;
}

QStringList MemberListModel::mimeTypes() const { return {kMime}; }

QMimeData* MemberListModel::mimeData(const QModelIndexList& indexes) const {
  std::vector<std::string> ids, groups;
  for (const QModelIndex& i : indexes) {
    const Row& r = rows_[size_t(i.row())];
    (r.group ? groups : ids).push_back(r.id);
  }
  auto* m = new QMimeData;
  m->setData(kMime, encode(node_.kind == GroupNode::Kind::Group ? node_.group : std::string(), ids, groups));
  return m;
}

void WordsFilter::setWords(const QString& text) {
  words_ = text.split(' ', Qt::SkipEmptyParts);
  invalidateFilter();
}

bool WordsFilter::filterAcceptsRow(int row, const QModelIndex& parent) const {
  const QString text = sourceModel()->index(row, 0, parent).data().toString();
  return r::all_of(words_, [&](const QString& w) { return text.contains(w, Qt::CaseInsensitive); });
}

// ---------------------------------------------------------------- the explorer

GroupExplorer::GroupExplorer(std::unique_ptr<GroupSource> source, QWidget* parent) : QWidget(parent), s_(std::move(source)) {
  auto* h = new QHBoxLayout(this);
  h->setContentsMargins(0, 0, 0, 0);
  auto* split = new QSplitter(Qt::Horizontal, this);
  h->addWidget(split);

  // The tree, with «new group» and «remove group» over it.
  auto* left = new QWidget(split);
  auto* lv = new QVBoxLayout(left);
  lv->setContentsMargins(0, 0, 0, 0);
  auto* tbar = new QHBoxLayout;
  auto tool = [](const QString& text, const QString& tip, const char* name, QIcon icon = {}) {
    auto* b = new QToolButton;
    b->setText(text);
    b->setToolTip(tip);
    b->setObjectName(name);
    if (!icon.isNull()) {
      b->setIcon(icon);
      b->setToolButtonStyle(Qt::ToolButtonIconOnly);
    }
    b->setAutoRaise(true);
    return b;
  };
  auto* newGroup = tool(tr("Новая группа"), tr("Создать группу"), "newGroup", QApplication::style()->standardIcon(QStyle::SP_FileDialogNewFolder));
  removeGroupButton_ = tool(tr("Удалить группу"), tr("Удалить группу (объекты остаются)"), "removeGroup",
                            QApplication::style()->standardIcon(QStyle::SP_DialogDiscardButton));
  tbar->addWidget(newGroup);
  tbar->addStretch(1);
  tbar->addWidget(removeGroupButton_);
  lv->addLayout(tbar);
  tree_ = new GroupTreeModel(*s_, this);
  treeView_ = new QTreeView(left);
  treeView_->setObjectName("groupTree");
  treeView_->setModel(tree_);
  treeView_->setHeaderHidden(true);
  treeView_->setDragDropMode(QAbstractItemView::DragDrop);
  treeView_->setDefaultDropAction(Qt::MoveAction);
  treeView_->setEditTriggers(QAbstractItemView::EditKeyPressed | QAbstractItemView::SelectedClicked);
  treeView_->expandAll();
  lv->addWidget(treeView_, 1);

  // The list, with its title, search, tools and count.
  auto* mid = new QWidget(split);
  auto* mv = new QVBoxLayout(mid);
  mv->setContentsMargins(0, 0, 0, 0);
  auto* mbar = new QHBoxLayout;
  moveButton_ = tool(tr("В группу"), tr("Переместить выделенное в группу"), "moveToGroup");
  addButton_ = tool(tr("Добавить в группу"), tr("Добавить выделенное в группу (объект может быть в нескольких группах)"), "addToGroup");
  for (QToolButton* b : {moveButton_, addButton_}) {
    b->setPopupMode(QToolButton::InstantPopup);
    b->setMenu(new QMenu(b));
  }
  excludeButton_ = tool(tr("Исключить"), tr("Исключить выделенное из группы"), "exclude");
  excludeAllButton_ = tool(tr("Исключить из всех"), tr("Исключить выделенное из всех групп"), "excludeAll");
  for (QToolButton* b : {moveButton_, addButton_, excludeButton_, excludeAllButton_}) mbar->addWidget(b);
  mbar->addStretch(1);
  search_ = new QLineEdit;
  search_->setObjectName("search");
  search_->setPlaceholderText(tr("Поиск"));
  search_->setClearButtonEnabled(true);
  search_->setMaximumWidth(220);
  mbar->addWidget(search_);
  mv->addLayout(mbar);
  title_ = new QLabel;
  title_->setObjectName("title");
  QFont it = title_->font();
  it.setItalic(true);
  title_->setFont(it);
  mv->addWidget(title_);
  list_ = new MemberListModel(*s_, this);
  filter_ = new WordsFilter(this);
  filter_->setSourceModel(list_);
  listView_ = new QListView(mid);
  listView_->setObjectName("members");
  listView_->setModel(filter_);
  listView_->setFlow(QListView::TopToBottom);
  listView_->setWrapping(true);
  listView_->setResizeMode(QListView::Adjust);
  listView_->setUniformItemSizes(true);
  listView_->setSelectionMode(QAbstractItemView::ExtendedSelection);
  listView_->setDragDropMode(QAbstractItemView::DragOnly);
  listView_->setDefaultDropAction(Qt::MoveAction);
  listView_->setEditTriggers(QAbstractItemView::EditKeyPressed | QAbstractItemView::SelectedClicked);
  mv->addWidget(listView_, 1);
  count_ = new QLabel;
  count_->setObjectName("count");
  count_->setFont(it);
  mv->addWidget(count_);

  auto* right = new QWidget(split);
  side_ = new QVBoxLayout(right);
  side_->setContentsMargins(0, 0, 0, 0);
  split->setStretchFactor(0, 0);
  split->setStretchFactor(1, 1);
  split->setStretchFactor(2, 0);
  split->setSizes({200, 600, 200});
  split_ = split;
  right->hide();  // until the page puts its panels there (showSide)

  auto changed = [this] {
    refresh();
    emit edited();
  };
  connect(tree_, &GroupTreeModel::edited, this, [this, changed] {
    // (a drop: the view finishes its drag first)
    QMetaObject::invokeMethod(this, changed, Qt::QueuedConnection);
  });
  connect(list_, &MemberListModel::edited, this, [this, changed] { QMetaObject::invokeMethod(this, changed, Qt::QueuedConnection); });
  connect(treeView_->selectionModel(), &QItemSelectionModel::currentChanged, this, [this] { showChosen(); });
  connect(listView_->selectionModel(), &QItemSelectionModel::selectionChanged, this, [this] {
    updateCount();
    emit selectionChanged();
  });
  connect(listView_, &QListView::doubleClicked, this, [this](const QModelIndex& i) {
    if (i.data(MemberListModel::IsGroupRole).toBool()) choose({GroupNode::Kind::Group, i.data(MemberListModel::IdRole).toString().toStdString()});
  });
  connect(search_, &QLineEdit::textChanged, this, [this](const QString& t) {
    filter_->setWords(t);
    updateCount();
  });
  connect(newGroup, &QToolButton::clicked, this, &GroupExplorer::newGroup);
  connect(removeGroupButton_, &QToolButton::clicked, this, &GroupExplorer::removeChosenGroup);
  connect(excludeButton_, &QToolButton::clicked, this, &GroupExplorer::excludeFromGroup);
  connect(excludeAllButton_, &QToolButton::clicked, this, &GroupExplorer::excludeFromAllGroups);
  // The menus of groups to move or add to, made when opened.
  for (bool add : {false, true}) {
    QToolButton* b = add ? addButton_ : moveButton_;
    connect(b->menu(), &QMenu::aboutToShow, this, [this, b, add] {
      b->menu()->clear();
      for (auto& g : s_->groups())
        b->menu()->addAction(QString::fromStdString(g), this, [this, g, add] {
          std::vector<std::string> groups;
          for (const QModelIndex& i : listView_->selectionModel()->selectedIndexes())
            if (i.data(MemberListModel::IsGroupRole).toBool()) groups.push_back(i.data(MemberListModel::IdRole).toString().toStdString());
          moveTo(g, selectedIds(), groups, add);
        });
    });
  }
  choose({});
}

void GroupExplorer::showSide(int width) {
  split_->widget(2)->show();
  const QList<int> was = split_->sizes();
  split_->setSizes({was[0], std::max(100, was[1] + was[2] - width), width});
}

void GroupExplorer::refresh() {
  const GroupNode was = chosen();
  const std::vector<std::string> selected = selectedIds();
  tree_->rebuild();
  treeView_->expandAll();
  choose(tree_->indexOf(was).isValid() ? was : GroupNode{});
  selectIds(selected);
}

void GroupExplorer::choose(const GroupNode& node) {
  const QModelIndex i = tree_->indexOf(node);
  treeView_->setCurrentIndex(i);
  showChosen();
}

GroupNode GroupExplorer::chosen() const { return tree_->nodeOf(treeView_->currentIndex()); }

void GroupExplorer::showChosen() {
  const GroupNode n = chosen();
  list_->show(n);
  // Columns as wide as the widest name (TopoR's list: names in columns, none cut).
  const QFontMetrics fm(listView_->font());
  int w = 60;
  for (int row = 0; row < list_->rowCount(); ++row) w = std::max(w, fm.horizontalAdvance(list_->index(row).data().toString()));
  listView_->setGridSize(QSize(std::min(w, 320) + 16 + 16, fm.height() + 6));
  switch (n.kind) {
    case GroupNode::Kind::All: title_->setText(s_->allTitle()); break;
    case GroupNode::Kind::Ungrouped: title_->setText(tr("Несгруппированные")); break;
    case GroupNode::Kind::Groups: title_->setText(tr("Группы")); break;
    case GroupNode::Kind::Group: title_->setText(s_->groupTitle(QString::fromStdString(n.group))); break;
  }
  const bool group = n.kind == GroupNode::Kind::Group;
  removeGroupButton_->setEnabled(group);
  excludeButton_->setEnabled(group);
  updateCount();
  emit selectionChanged();
}

void GroupExplorer::updateCount() {
  const int selected = int(listView_->selectionModel()->selectedIndexes().size());
  count_->setText(selected ? tr("Выбрано элементов: %1").arg(selected) : tr("Элементов: %1").arg(filter_->rowCount()));
  const bool any = !selectedIds().empty() || selected > 0;
  moveButton_->setEnabled(any);
  addButton_->setEnabled(!selectedIds().empty());
  excludeAllButton_->setEnabled(!selectedIds().empty());
}

std::vector<std::string> GroupExplorer::selectedIds() const {
  std::vector<std::string> out;
  QModelIndexList sel = listView_->selectionModel()->selectedIndexes();
  r::sort(sel, {}, &QModelIndex::row);
  for (const QModelIndex& i : sel)
    if (!i.data(MemberListModel::IsGroupRole).toBool()) out.push_back(i.data(MemberListModel::IdRole).toString().toStdString());
  return out;
}

void GroupExplorer::selectIds(const std::vector<std::string>& ids) {
  QItemSelection sel;
  for (int row = 0; row < filter_->rowCount(); ++row) {
    const QModelIndex i = filter_->index(row, 0);
    if (!i.data(MemberListModel::IsGroupRole).toBool() && r::contains(ids, i.data(MemberListModel::IdRole).toString().toStdString())) sel.select(i, i);
  }
  listView_->selectionModel()->select(sel, QItemSelectionModel::ClearAndSelect);
}

void GroupExplorer::newGroup() {
  // Under the chosen group, else at the top; «NewGroup», «NewGroup_1»...
  const GroupNode n = chosen();
  const std::string name = uniqueGroup(*s_, "NewGroup");
  s_->addGroup(name);
  if (n.kind == GroupNode::Kind::Group) {
    auto sub = s_->subgroups(n.group);
    sub.push_back(name);
    s_->setSubgroups(n.group, sub);
  }
  tree_->rebuild();
  treeView_->expandAll();
  choose({GroupNode::Kind::Group, name});
  emit edited();
  if (isVisible()) treeView_->edit(treeView_->currentIndex());
}

void GroupExplorer::removeChosenGroup() {
  const GroupNode n = chosen();
  if (n.kind != GroupNode::Kind::Group) return;
  // The groups in it go up to where it was.
  const std::string parent = s_->parentOf(n.group);
  const auto sub = s_->subgroups(n.group);
  s_->setSubgroups(n.group, {});
  if (!parent.empty()) {
    auto up = s_->subgroups(parent);
    std::erase(up, n.group);
    up.insert(up.end(), sub.begin(), sub.end());
    s_->setSubgroups(parent, up);
  }
  s_->removeGroup(n.group);
  tree_->rebuild();
  treeView_->expandAll();
  choose(parent.empty() ? GroupNode{GroupNode::Kind::Groups, {}} : GroupNode{GroupNode::Kind::Group, parent});
  emit edited();
}

void GroupExplorer::moveTo(const std::string& group, const std::vector<std::string>& ids, const std::vector<std::string>& groups, bool add) {
  const GroupNode n = chosen();
  if (!applyMove(*s_, group, n.kind == GroupNode::Kind::Group ? n.group : std::string(), ids, groups, add)) return;
  refresh();
  emit edited();
}

void GroupExplorer::excludeFromGroup() {
  const GroupNode n = chosen();
  if (n.kind != GroupNode::Kind::Group) return;
  std::vector<std::string> groups;
  for (const QModelIndex& i : listView_->selectionModel()->selectedIndexes())
    if (i.data(MemberListModel::IsGroupRole).toBool()) groups.push_back(i.data(MemberListModel::IdRole).toString().toStdString());
  applyMove(*s_, {}, n.group, selectedIds(), groups, false);
  refresh();
  emit edited();
}

void GroupExplorer::excludeFromAllGroups() {
  const auto ids = selectedIds();
  for (auto& g : s_->groups()) {
    auto m = s_->members(g);
    std::erase_if(m, [&](const std::string& i) { return r::contains(ids, i); });
    s_->setMembers(g, m);
  }
  refresh();
  emit edited();
}

}  // namespace xr::gui
