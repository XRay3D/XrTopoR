#include "gui/SpinBox.h"

#include <QGuiApplication>
#include <QKeyEvent>
#include <QWheelEvent>

namespace xr::gui {

DoubleSpinBox::DoubleSpinBox(QWidget* parent) : QDoubleSpinBox(parent) { setSingleStep(kStep); }

void DoubleSpinBox::stepBy(int steps) {
  bool ctrl = ctrl_ ? *ctrl_ : bool(QGuiApplication::keyboardModifiers() & Qt::ControlModifier);
  QDoubleSpinBox::stepBy(ctrl ? steps * 10 : steps);
}

void DoubleSpinBox::wheelEvent(QWheelEvent* e) {
  ctrl_ = bool(e->modifiers() & Qt::ControlModifier);
  QWheelEvent plain(e->position(), e->globalPosition(), e->pixelDelta(), e->angleDelta(), e->buttons(),
                    e->modifiers() & ~Qt::ControlModifier, e->phase(), e->inverted(), e->source());
  QDoubleSpinBox::wheelEvent(&plain);
  e->setAccepted(plain.isAccepted());
  ctrl_.reset();
}

void DoubleSpinBox::keyPressEvent(QKeyEvent* e) {
  int k = e->key();
  if (k != Qt::Key_Up && k != Qt::Key_Down && k != Qt::Key_PageUp && k != Qt::Key_PageDown) {
    QDoubleSpinBox::keyPressEvent(e);
    return;
  }
  ctrl_ = bool(e->modifiers() & Qt::ControlModifier);
  QKeyEvent plain(e->type(), k, e->modifiers() & ~Qt::ControlModifier, e->text(), e->isAutoRepeat(), ushort(e->count()));
  QDoubleSpinBox::keyPressEvent(&plain);
  e->setAccepted(plain.isAccepted());
  ctrl_.reset();
}

}  // namespace xr::gui
