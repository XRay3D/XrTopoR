#pragma once
// «Редактор стилей надписей», as in TopoR: the styles of the design in a table (name, properties), the selected
// one's font, height, bold and italic at the right with an example; «+» adds a copy of the selected style, «−»
// removes one no text uses (never the first, «(Default)»); «Применить» gives the styles to the design.
#include <QDialog>
#include <vector>

#include "core/Board.h"
#include "gui/Units.h"

class QComboBox;
class QDoubleSpinBox;
class QLabel;
class QPushButton;
class QTableWidget;
class QToolButton;

namespace xr::gui {

// «GOST type B, 2.5 мм, Bold».
QString describeTextStyle(const TextStyle& st, Unit u);
// The fonts a style can take: the system's and the style's own if the system has no such.
QStringList textFontNames(const std::string& own = {});

class TextStylesDialog : public QDialog {
  Q_OBJECT
 public:
  TextStylesDialog(const Board& b, Unit u, int current, QWidget* parent = nullptr);

 signals:
  // The styles and, for each, the index it had on the board (-1: new) — for setTextStyles.
  void applied(const std::vector<TextStyle>& styles, const std::vector<int>& origin);

 private:
  void fillTable();
  void showStyle();  // the selected style in the fields at the right
  void edited();     // a field changed: the selected style, its row, the example
  void markChanged(bool on);
  int current() const;

  const Board& b_;
  Unit u_;
  std::vector<TextStyle> styles_;
  std::vector<int> origin_, use_;
  bool updating_ = false;
  QTableWidget* table_;
  QComboBox* font_;
  QDoubleSpinBox* height_;
  QToolButton *bold_, *italic_, *underline_;
  QLabel* example_;
  QPushButton *add_, *remove_, *apply_;
};

}  // namespace xr::gui
