#pragma once
// The numeric fields of the application: a step of 0.01, of 0.1 with Ctrl held — by the wheel, the arrow keys
// and the arrow buttons alike (Qt's own Ctrl multiplier, the wheel and the keys only, is replaced by this one).
#include <QDoubleSpinBox>
#include <optional>

namespace xr::gui {

class DoubleSpinBox : public QDoubleSpinBox {
 public:
  static constexpr double kStep = 0.01;
  explicit DoubleSpinBox(QWidget* parent = nullptr);
  void stepBy(int steps) override;

 protected:
  void wheelEvent(QWheelEvent* e) override;
  void keyPressEvent(QKeyEvent* e) override;

 private:
  std::optional<bool> ctrl_;  // Ctrl of the event being handled; else the keyboard's
};

}  // namespace xr::gui
