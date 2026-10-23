#pragma once
// Command registry: every menu item, toolbar button and hotkey of the editor is a QAction keyed by the
// TopoR command name (its Accel_* id where TopoR has one, Cmd_* otherwise), so menus, toolbars, the
// hotkey settings and the import of TopoR settings all address the same objects. Texts, tooltips,
// status tips and default keys follow TopoR 7.0.
#include <QAction>
#include <QHash>
#include <QKeySequence>
#include <QList>
#include <QObject>
#include <functional>
#include <vector>

class QMenu;
class QToolBar;

namespace xr::gui {

// A button with sub-modes (TopoR's mode and autoprocedure toolbars): the group action runs the
// current sub-mode, which the user picks from the button's menu.
struct CommandGroup {
  QString id;           // group command (carries the hotkey)
  QStringList subs;     // sub-mode commands
  QString current;      // default / last chosen sub-mode
};

class Commands : public QObject {
  Q_OBJECT
 public:
  struct Info {
    QString id;
    QString group;  // hotkey group, as in TopoR's settings
    QList<QKeySequence> defaults;
  };

  // Creates all commands disabled; shortcuts are window-wide (actions are added to `window`).
  explicit Commands(QWidget* window);

  QAction* operator[](const QString& id) const;
  bool contains(const QString& id) const { return actions_.contains(id); }
  const std::vector<Info>& all() const { return info_; }

  // Connects a handler and enables the command; `needsBoard` commands are disabled with no board open.
  QAction* bind(const QString& id, std::function<void()> fn, bool needsBoard = true);
  void setBoardOpen(bool open);

  // Sub-mode groups (mode toolbar, autoprocedures): triggering the group runs the current sub-mode.
  const CommandGroup* group(const QString& id) const;
  void setCurrent(const QString& groupId, const QString& sub);

  // Hotkeys: defaults, user overrides (only differences are stored) and reset.
  QList<QKeySequence> defaults(const QString& id) const;
  void setShortcuts(const QString& id, const QList<QKeySequence>& keys);
  QHash<QString, QList<QKeySequence>> overrides() const;
  void applyOverrides(const QHash<QString, QList<QKeySequence>>& o);
  void resetShortcuts();

  // Fills a menu / toolbar from ids; "-" is a separator.
  void fill(QMenu* menu, const QStringList& ids) const;
  void fill(QToolBar* bar, const QStringList& ids) const;

 signals:
  void currentChanged(const QString& groupId);

 private:
  QAction* add(const QString& id, const QString& text, const QString& tip, const QString& group,
               QList<QKeySequence> keys = {}, const QString& icon = {});
  void addGroup(const QString& id, const QStringList& subs, const QString& current);

  QWidget* window_;
  QHash<QString, QAction*> actions_;
  std::vector<Info> info_;
  QHash<QString, bool> needsBoard_;
  QHash<QString, bool> bound_;
  std::vector<CommandGroup> groups_;
  bool boardOpen_ = false;
};

}  // namespace xr::gui
