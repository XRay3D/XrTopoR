#pragma once
// TopoR's explorer of groups («Группы цепей», «Группы компонентов», «Группы слоёв», «Сигналы» of the design
// parameters): on the left a tree — «Все …(N)», «Несгруппированные (N)», «Группы» with the groups in it, a group
// in a group; in the middle what the chosen node holds — its groups as folders, then its objects in columns —
// with a search, the count and the tools to put objects into groups and take them out; on the right the page's
// own panels. Objects and groups are dragged onto a group of the tree: moved, with Ctrl added (an object may be
// in several groups, a group in one at most).
//
// What it shows and edits comes from a GroupSource: the page's objects and groups, kept by the dialog's copy of
// the rules.
#include <QIcon>
#include <QSortFilterProxyModel>
#include <QStandardItemModel>
#include <QWidget>
#include <functional>
#include <memory>
#include <string>
#include <vector>

class QLabel;
class QSplitter;
class QLineEdit;
class QListView;
class QToolButton;
class QTreeView;
class QVBoxLayout;

namespace xr::gui {

class GroupSource {
 public:
  struct Object {
    std::string id;  // what the groups hold it by
    QString text, tip;
    QIcon icon;
  };
  virtual ~GroupSource() = default;

  virtual QString allTitle() const = 0;                   // «Все сигналы»
  virtual QString groupTitle(const QString& name) const = 0;  // «Группа сигналов %1»
  virtual std::vector<Object> objects() const = 0;
  virtual std::vector<std::string> groups() const = 0;  // in their order
  virtual std::vector<std::string> members(const std::string& group) const = 0;    // object ids
  virtual std::vector<std::string> subgroups(const std::string& group) const = 0;  // the groups in it
  virtual void addGroup(const std::string& name) = 0;
  // False: the name is taken; else the group and what names it follow.
  virtual bool renameGroup(const std::string& old, const std::string& name) = 0;
  virtual void removeGroup(const std::string& name) = 0;
  virtual void setMembers(const std::string& group, const std::vector<std::string>& ids) = 0;
  virtual void setSubgroups(const std::string& group, const std::vector<std::string>& names) = 0;
  // An object renamed in the list (the signals); false: it cannot be or the name is taken.
  virtual bool renamable() const { return false; }
  virtual bool renameObject(const std::string&, const std::string&) { return false; }

  // Derived.
  std::string parentOf(const std::string& group) const;
  bool inAnyGroup(const std::string& id) const;
};

// A node of the tree, as the explorer remembers the chosen one.
struct GroupNode {
  enum class Kind { All, Ungrouped, Groups, Group } kind = Kind::All;
  std::string group;
  bool operator==(const GroupNode&) const = default;
};

// The tree: the three roots and the groups; a group is renamed in place; objects and groups dropped on a node.
class GroupTreeModel : public QStandardItemModel {
  Q_OBJECT
 public:
  static constexpr int KindRole = Qt::UserRole + 1, NameRole = Qt::UserRole + 2;
  explicit GroupTreeModel(GroupSource& source, QObject* parent = nullptr);
  void rebuild();
  QModelIndex indexOf(const GroupNode& node) const;
  GroupNode nodeOf(const QModelIndex& index) const;

  Qt::ItemFlags flags(const QModelIndex& index) const override;
  bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
  QStringList mimeTypes() const override;
  QMimeData* mimeData(const QModelIndexList& indexes) const override;
  bool canDropMimeData(const QMimeData* data, Qt::DropAction action, int row, int column, const QModelIndex& parent) const override;
  bool dropMimeData(const QMimeData* data, Qt::DropAction action, int row, int column, const QModelIndex& parent) override;
  Qt::DropActions supportedDropActions() const override { return Qt::MoveAction | Qt::CopyAction; }
  Qt::DropActions supportedDragActions() const override { return Qt::MoveAction; }

 signals:
  void edited();  // the source was changed

 private:
  GroupSource& s_;
};

// What a node holds: its groups (folders) and objects.
class MemberListModel : public QAbstractListModel {
  Q_OBJECT
 public:
  static constexpr int IdRole = Qt::UserRole + 1, IsGroupRole = Qt::UserRole + 2;
  MemberListModel(GroupSource& source, QObject* parent = nullptr);
  void show(const GroupNode& node);
  const GroupNode& node() const { return node_; }

  int rowCount(const QModelIndex& parent = {}) const override;
  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
  bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
  Qt::ItemFlags flags(const QModelIndex& index) const override;
  QStringList mimeTypes() const override;
  QMimeData* mimeData(const QModelIndexList& indexes) const override;
  Qt::DropActions supportedDragActions() const override { return Qt::MoveAction | Qt::CopyAction; }

 signals:
  void edited();

 private:
  struct Row {
    std::string id;
    bool group = false;
    QString text, tip;
    QIcon icon;
  };
  GroupSource& s_;
  GroupNode node_;
  std::vector<Row> rows_;
};

// The rows that hold every word of the search (spaces part the words).
class WordsFilter : public QSortFilterProxyModel {
 public:
  using QSortFilterProxyModel::QSortFilterProxyModel;
  void setWords(const QString& text);

 protected:
  bool filterAcceptsRow(int row, const QModelIndex& parent) const override;

 private:
  QStringList words_;
};

class GroupExplorer : public QWidget {
  Q_OBJECT
 public:
  GroupExplorer(std::unique_ptr<GroupSource> source, QWidget* parent = nullptr);
  GroupSource& source() { return *s_; }
  // The column of the page's own panels, right of the list.
  QVBoxLayout* side() { return side_; }
  void showSide(int width);
  // The source changed outside: the views follow (the chosen node kept).
  void refresh();
  void choose(const GroupNode& node);
  GroupNode chosen() const;
  // The selected objects' ids (not the folders).
  std::vector<std::string> selectedIds() const;
  void selectIds(const std::vector<std::string>& ids);

  // The edits the tools make (test hooks too). `ids` objects, `groups` groups.
  void newGroup();
  void removeChosenGroup();
  void moveTo(const std::string& group, const std::vector<std::string>& ids, const std::vector<std::string>& groups, bool add);
  void excludeFromGroup();
  void excludeFromAllGroups();

 signals:
  void edited();             // the source was changed
  void selectionChanged();  // the objects selected in the list

 private:
  void showChosen();
  void updateCount();
  std::unique_ptr<GroupSource> s_;
  GroupTreeModel* tree_;
  MemberListModel* list_;
  WordsFilter* filter_;
  QTreeView* treeView_;
  QListView* listView_;
  QLabel* title_;
  QLabel* count_;
  QLineEdit* search_;
  QVBoxLayout* side_;
  QSplitter* split_ = nullptr;
  QToolButton *moveButton_, *addButton_, *excludeButton_, *excludeAllButton_, *removeGroupButton_;
};

// Applies a move or an add of objects and groups onto a group (empty: no group — out of the one they came from)
// through the source; `from`: the group they were shown in (a move takes them out of it). False: nothing done
// (a group into itself or into one in it).
bool applyMove(GroupSource& s, const std::string& to, const std::string& from, const std::vector<std::string>& ids,
               const std::vector<std::string>& groups, bool add);

// Icons drawn for the objects of the pages.
QIcon netIcon();
QIcon componentIcon();
QIcon layerIcon();
QIcon signalIcon();
QIcon diffSignalIcon();
QIcon folderIcon();

}  // namespace xr::gui
