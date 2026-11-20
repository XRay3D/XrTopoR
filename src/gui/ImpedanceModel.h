#pragma once
// «Волновое сопротивление» of the design parameters as TopoR shows it: the copper layers down the rows, the
// impedance rules across the columns — a single conductor's one column of widths, a differential pair's two, of
// widths and gaps — with the rules' names and impedances in two rows above. A model over HiSpeed::impedances (the
// editor's copy) and the delegate that edits its cells and draws the «remove» mark at a rule's name.
#include <QAbstractTableModel>
#include <QStyledItemDelegate>

#include "gui/Units.h"

namespace xr::gui {

class ImpedanceModel : public QAbstractTableModel {
  Q_OBJECT
 public:
  enum Row { NameRow, ZRow, HeadRow, FirstLayerRow };
  enum Column { LayerCol, TypeCol, ThicknessCol, FirstRuleCol };
  // What a cell is.
  enum class Kind { Label, Name, Z, Head, Length, Blank };
  // The rule of a column and whether the column is its gaps; rule < 0: one of the layer's own columns.
  struct Part {
    int rule = -1;
    bool gap = false;
  };

  ImpedanceModel(const Board& b, HiSpeed& rules, Unit unit, QObject* parent = nullptr);

  int rowCount(const QModelIndex& parent = {}) const override;
  int columnCount(const QModelIndex& parent = {}) const override;
  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
  bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
  Qt::ItemFlags flags(const QModelIndex& index) const override;

  int ruleCount() const { return int(h_.impedances.size()); }
  int firstColumn(int rule) const;
  int columnsOf(int rule) const { return h_.impedances[size_t(rule)].diff ? 2 : 1; }
  Part partOf(int column) const;
  Kind kindOf(const QModelIndex& index) const;
  Unit unit() const { return unit_; }
  // A signal or a differential signal refers to the rule: it cannot be removed.
  bool used(int rule) const;
  // A new rule with the design's default width (and clearance, as a pair's gap) on every signal layer, named
  // «Z0_n» / «Diff_n» by the first free n; its number.
  int addRule(bool diff);
  // False: the rule is used and stays.
  bool removeRule(int rule);

 private:
  bool plane(int row) const;
  const Board& b_;
  HiSpeed& h_;
  Unit unit_;
  std::vector<LayerId> layers_;  // the copper layers, top to bottom: the rows from FirstLayerRow
};

class ImpedanceDelegate : public QStyledItemDelegate {
  Q_OBJECT
 public:
  using QStyledItemDelegate::QStyledItemDelegate;
  // Where the «remove» mark of a rule's name cell is.
  static QRect removeRect(const QRect& cell);

  void paint(QPainter* p, const QStyleOptionViewItem& option, const QModelIndex& index) const override;
  QWidget* createEditor(QWidget* parent, const QStyleOptionViewItem& option, const QModelIndex& index) const override;
  void setEditorData(QWidget* editor, const QModelIndex& index) const override;
  void setModelData(QWidget* editor, QAbstractItemModel* model, const QModelIndex& index) const override;
  void updateEditorGeometry(QWidget* editor, const QStyleOptionViewItem& option, const QModelIndex& index) const override;
  bool editorEvent(QEvent* e, QAbstractItemModel* model, const QStyleOptionViewItem& option, const QModelIndex& index) override;

 signals:
  void removeRequested(int rule);
};

}  // namespace xr::gui
