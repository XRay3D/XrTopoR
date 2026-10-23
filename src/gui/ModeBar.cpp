#include "gui/ModeBar.h"

#include <QMenu>
#include <QMouseEvent>
#include <QPainter>
#include <QPolygonF>

namespace xr::gui {

ModeButton::ModeButton(Commands* cmds, const QString& id, QWidget* parent) : QToolButton(parent), cmds_(cmds), id_(id) {
  setAutoRaise(true);
  setIconSize({22, 22});
  setFixedSize(34, 32);
  setCheckable(true);
  connect(this, &QToolButton::clicked, this, [this] {
    setChecked(!isChecked());  // undo the click's toggle: the editor reports which mode is active
    (*cmds_)[id_]->trigger();
  });
  connect(cmds_, &Commands::currentChanged, this, [this](const QString& g) {
    if (g == id_) refresh();
  });
  connect((*cmds_)[id_], &QAction::changed, this, &ModeButton::refresh);
  if (const CommandGroup* g = cmds_->group(id_))
    for (auto& s : g->subs) connect((*cmds_)[s], &QAction::changed, this, &ModeButton::refresh);
  refresh();
}

void ModeButton::refresh() {
  QAction* group = (*cmds_)[id_];
  const CommandGroup* g = cmds_->group(id_);
  QAction* cur = g ? (*cmds_)[g->current] : group;
  setIcon(cur->icon().isNull() ? group->icon() : cur->icon());
  QString tip = g ? group->toolTip() + " — " + QString(cur->text()).remove('&') : group->toolTip();
  if (!group->shortcut().isEmpty()) tip += " (" + group->shortcut().toString(QKeySequence::NativeText) + ")";
  setToolTip(tip);
  setEnabled(group->isEnabled());
}

void ModeButton::setActive(bool on) {
  setChecked(on);
  update();
}

void ModeButton::popup() {
  const CommandGroup* g = cmds_->group(id_);
  if (!g) return;
  QMenu menu(this);
  for (auto& s : g->subs) {
    QAction* sub = (*cmds_)[s];
    QAction* item = menu.addAction(sub->icon(), QString(sub->text()).remove('&'));
    item->setEnabled(sub->isEnabled());
    item->setCheckable(true);
    item->setChecked(s == g->current);
    connect(item, &QAction::triggered, this, [this, s] {
      cmds_->setCurrent(id_, s);
      (*cmds_)[s]->trigger();
    });
  }
  menu.exec(mapToGlobal(QPoint(width(), 0)));
}

void ModeButton::mousePressEvent(QMouseEvent* e) {
  bool corner = e->position().x() > width() - 9 && e->position().y() > height() - 9;
  if (cmds_->group(id_) && (e->button() == Qt::RightButton || (e->button() == Qt::LeftButton && corner))) {
    popup();
    return;
  }
  QToolButton::mousePressEvent(e);
}

void ModeButton::paintEvent(QPaintEvent* e) {
  QToolButton::paintEvent(e);
  if (!cmds_->group(id_)) return;
  // Small corner triangle: the button has sub-modes.
  QPainter p(this);
  p.setRenderHint(QPainter::Antialiasing);
  p.setPen(Qt::NoPen);
  p.setBrush(isEnabled() ? palette().color(QPalette::ButtonText) : palette().color(QPalette::Mid));
  QPointF c(width() - 3, height() - 3);
  p.drawPolygon(QPolygonF{c, c + QPointF(-5, 0), c + QPointF(0, -5)});
}

ModeBar::ModeBar(const QString& title, const QString& objectName, Commands* cmds, const QStringList& ids, QWidget* parent)
    : QToolBar(title, parent) {
  setObjectName(objectName);
  setOrientation(Qt::Vertical);
  setMovable(false);
  setIconSize({22, 22});
  for (auto& id : ids) {
    if (id == "-") {
      addSeparator();
      continue;
    }
    auto* b = new ModeButton(cmds, id, this);
    addWidget(b);
    buttons_.push_back(b);
  }
}

void ModeBar::setActiveMode(const QString& id) {
  for (auto* b : buttons_) b->setActive(b->id() == id);
}

}  // namespace xr::gui
