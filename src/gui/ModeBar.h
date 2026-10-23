#pragma once
// TopoR's vertical editor toolbars: «Режимы редактора» and «Действия редактора топологии». Buttons with
// sub-modes run the current sub-mode on a left click and offer the others on a right click or on
// the corner arrow; the chosen one becomes current.
#include <QToolBar>
#include <QToolButton>

#include "gui/Commands.h"

namespace xr::gui {

class ModeButton : public QToolButton {
  Q_OBJECT
 public:
  ModeButton(Commands* cmds, const QString& groupOrCommand, QWidget* parent = nullptr);
  const QString& id() const { return id_; }
  void setActive(bool on);  // the editor is in this mode

 protected:
  void mousePressEvent(QMouseEvent* e) override;
  void paintEvent(QPaintEvent* e) override;

 private:
  void refresh();
  void popup();
  Commands* cmds_;
  QString id_;
};

class ModeBar : public QToolBar {
  Q_OBJECT
 public:
  ModeBar(const QString& title, const QString& objectName, Commands* cmds, const QStringList& ids,
          QWidget* parent = nullptr);
  // Highlights the button of a mode (group or command id); empty = none.
  void setActiveMode(const QString& id);

 private:
  std::vector<ModeButton*> buttons_;
};

}  // namespace xr::gui
