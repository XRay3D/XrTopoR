#pragma once
// TopoR's pad stack and via type windows of «Редактор параметров дизайна»:
//  - «Редактор контактных площадок»: a stack's details by class of layers and by layer, its type, hole and
//    thermal, with a preview;
//  - «Создать детали в стеках контактных площадок»: mask (outward) or paste (inward) details for several stacks
//    from their pads on the outer copper, with a report;
//  - «Диаметр площадки переходного отверстия»: a via type's pad by class of layers and by layer;
//  - the via types' layer stack drawn above their table.
#include <QDialog>
#include <QWidget>
#include <functional>
#include <optional>
#include <vector>

#include "core/Board.h"
#include "gui/Units.h"

class QCheckBox;
class QComboBox;
class QDoubleSpinBox;
class QFormLayout;
class QLabel;
class QLineEdit;
class QPushButton;
class QSpinBox;
class QStackedWidget;
class QTableWidget;
class QToolButton;
class QTreeWidget;
class QTreeWidgetItem;

namespace xr::gui {

// «1.50» (round), «1.50×1.50» (the rest, by its extent), in `u` without the unit.
QString detailSize(const PadDetail& d, Unit u);
// TopoR's name of a detail's form: «Круг», «Овал», «Прямоугольник»...
QString detailFormName(const PadDetail& d);
// A small picture of a detail's form, for the tables.
QIcon detailIcon(const PadDetail& d);
// TopoR's name of a layer class: «Сигнальный», «Опорный», «Маска»...
QString layerClassName(const std::string& cls);

// The details of a stack drawn to fit: the selected one filled, the hole, the anchor's cross; or the thermal.
class PadPreview : public QWidget {
 public:
  explicit PadPreview(QWidget* parent = nullptr) : QWidget(parent) { setMinimumSize(220, 220); }
  void show(const Padstack& ps, const PadDetail* detail, bool thermal);

 protected:
  void paintEvent(QPaintEvent*) override;

 private:
  Padstack ps_;
  std::optional<PadDetail> detail_;
  bool thermal_ = false;
};

class PadstackEditor : public QDialog {
  Q_OBJECT
 public:
  // `others`: the other stacks of the design (a new stack's name must differ from theirs).
  PadstackEditor(const Board& b, Padstack ps, Unit u, std::vector<std::string> others, bool isNew, QWidget* parent = nullptr);
  const Padstack& stack() const { return ps_; }

 signals:
  void applied(const Padstack& ps);

 private:
  enum class Row { Stack, Thermal, Class, Layer, Detail };
  void fillTree();
  void select(QTreeWidgetItem* it);
  PadDetail* detailOf(QTreeWidgetItem* it);  // the detail of a detail row or of its class/layer row
  void detailChanged();                     // the selected detail was edited: its row, the preview
  void edited();
  void showDetail(const PadDetail& d);
  QWidget* stackPage();
  QWidget* thermalPage();
  QWidget* layerPage();
  QWidget* detailPage();

  const Board& b_;
  Padstack ps_, original_;
  Unit u_;
  std::vector<std::string> others_;
  bool isNew_;
  bool updating_ = false;
  QTreeWidget* tree_;
  QStackedWidget* props_;
  PadPreview* preview_;
  QPushButton *addDetail_, *delDetail_, *undo_, *apply_;
  // Stack page.
  QLineEdit* name_;
  QComboBox* type_;
  QDoubleSpinBox* drill_;
  QCheckBox* plated_;
  // Thermal page.
  QComboBox* connect_;
  QDoubleSpinBox *backoff_, *spokeWidth_;
  QSpinBox* spokes_;
  QDoubleSpinBox* spokeAngle_;
  // Layer page.
  QLineEdit *layerName_, *layerType_;
  QCheckBox* layerIsClass_;
  // Detail page.
  std::vector<QToolButton*> forms_;
  QDoubleSpinBox *width_, *height_, *stretchX_, *stretchY_, *shiftX_, *shiftY_, *corner_;
  QLabel *widthLabel_, *heightLabel_, *stretchLabel_, *cornerLabel_;
  QWidget *stretchRow_, *cornerRow_, *heightRow_, *polyBox_;
  QCheckBox* custom_;
  std::vector<QCheckBox*> cornerChecks_;
  QTableWidget* poly_;
  QFormLayout* detailForm_ = nullptr;
};

// «Создать детали в стеках контактных площадок» for the mask (`kind` Mask: the offset goes outward) or the paste
// (Paste: inward). Works on a copy of the stacks; stacks() is the result after «Готово».
class CreateDetailsDialog : public QDialog {
  Q_OBJECT
 public:
  CreateDetailsDialog(const Board& b, std::vector<Padstack> stacks, std::vector<int> selected, LayerKind kind, Unit u,
                      QWidget* parent = nullptr);
  const std::vector<Padstack>& stacks() const { return current_; }
  // Test hooks: the layer rows' offsets and replace flags, «Создать», «Изменить параметры...».
  void setOffset(int side, Coord offset);
  void create();
  void changeChecked(const std::vector<int>& stacks);
  std::vector<int> listed() const { return list_; }

 private:
  void fillList();
  void fillReport(const std::vector<std::pair<int, int>>& result);  // stack, LayerDetailsResult::Kind
  QString mark(int stack, LayerId l) const;  // existing / added / replaced, for the settings table

  const Board& b_;
  std::vector<Padstack> current_, before_;
  std::vector<int> list_;
  LayerKind kind_;
  Unit u_;
  LayerId layers_[2] = {-1, -1};  // top, bottom
  QStackedWidget* pages_;
  QTableWidget *list_t_, *report_;
  QLineEdit *filter_, *reportFilter_;
  QCheckBox* use_[2];
  QComboBox* replace_[2];
  QDoubleSpinBox* offset_[2];
  QLabel *summary_, *failed_;
  QPushButton* repeat_;
};

// «Диаметр площадки переходного отверстия»: a via type's pad by class of layers and by layer, on the metal and
// on the other layers. The signal class's diameter is the type's diameter.
class ViaPadsDialog : public QDialog {
  Q_OBJECT
 public:
  ViaPadsDialog(const Board& b, ViaType t, Unit u, QWidget* parent = nullptr);
  const ViaType& type() const { return t_; }

 private:
  void fill();
  const Board& b_;
  ViaType t_;
  Unit u_;
  bool updating_ = false;
  QTableWidget *metalClasses_, *metalLayers_, *mechClasses_, *mechLayers_;
};

// The layer stack with the via types side by side: each type's pads on the layers it has them, its hole, its
// name under it. A click on a type selects it.
class ViaStackDiagram : public QWidget {
  Q_OBJECT
 public:
  ViaStackDiagram(const Board& b, std::vector<ViaType> types, QWidget* parent = nullptr);
  void setTypes(std::vector<ViaType> types) { types_ = std::move(types); update(); }
  void setCurrent(int i) { current_ = i; update(); }
  QSize sizeHint() const override;

 signals:
  void picked(int type);

 protected:
  void paintEvent(QPaintEvent*) override;
  void mousePressEvent(QMouseEvent* e) override;

 private:
  std::vector<LayerId> rows() const;
  const Board& b_;
  std::vector<ViaType> types_;
  int current_ = -1;
};

// The diameters of a via type's pads, distinct ones in order: «1.4, 1.5».
QString viaDiameters(const Board& b, const ViaType& t, Unit u);

}  // namespace xr::gui
