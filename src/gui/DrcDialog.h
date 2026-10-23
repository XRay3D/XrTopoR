#pragma once
// «Проверка соблюдения проектных норм» (DRC, F9), as in TopoR: tab «Объекты» with the matrix of object
// pairs to check, the checks (net integrity, wire widths, clearances) and the tolerance; tab «Отчет»
// with the message limit and a report file. Results go to the messages window.
#include <QDialog>

#include "gui/Document.h"

class QCheckBox;
class QDoubleSpinBox;
class QLineEdit;
class QSpinBox;

namespace xr::gui {

class DrcDialog : public QDialog {
  Q_OBJECT
 public:
  explicit DrcDialog(Document* doc, QWidget* parent = nullptr);
  // Runs the checks with the dialog's settings (also used for F9 without the dialog).
  static int run(Document* doc, QWidget* parent = nullptr);

 private:
  void save() const;
  Document* doc_;
  static constexpr int kKinds = 7;  // КП, ПО, Проводники, Запреты, Металлизация, Надписи, Контур ПП
  QCheckBox* pairs_[kKinds][kKinds] = {};
  QCheckBox* integrity_;
  QCheckBox* widths_;
  QCheckBox* clearances_;
  QDoubleSpinBox* tolerance_;
  QCheckBox* limit_;
  QSpinBox* limitCount_;
  QCheckBox* report_;
  QLineEdit* reportPath_;
};

}  // namespace xr::gui
