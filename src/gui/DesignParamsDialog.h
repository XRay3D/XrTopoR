#pragma once
// «Редактор параметров дизайна» (F4), as in TopoR: layers, pads, via types, netlist, net groups and the
// rule lists (wire widths, clearances, board edge, via types of nets, plane layer nets, nets on
// layers). Edits a copy of the rules; «Применить» compiles them into the design and, as in TopoR,
// clears the undo history.
#include <QDialog>
#include <functional>
#include <set>

#include "gui/Document.h"

class QDoubleSpinBox;
class QPushButton;
class QStackedWidget;
class QTableWidget;
class QTextBrowser;
class QTreeWidget;

namespace xr::gui {

class DesignParamsDialog : public QDialog {
  Q_OBJECT
 public:
  explicit DesignParamsDialog(Document* doc, QWidget* parent = nullptr);
  void showPage(const QString& title);
  // The pad stacks being edited (test hook).
  const std::vector<Padstack>& stacks() const { return stacks_; }

 private:
  void load();      // rules of the design → editor
  void rebuildPages();
  void changed();   // something was edited: «Применить»/«Сбросить» become available
  bool apply();
  void importRules();

  // Pages.
  QWidget* layersPage();
  QWidget* padsPage();
  QWidget* viaTypesPage();
  QWidget* netlistPage();
  QWidget* netGroupsPage();
  QWidget* widthsPage();
  QWidget* clearancesPage();
  QWidget* edgePage();
  QWidget* impedancesPage();
  QWidget* diffSignalsPage();
  QWidget* viaRulesPage();
  QWidget* planesPage();
  QWidget* layerNetsPage();
  QWidget* notSupported(const QString& what);

  // A rule table: rows rebuilt from the list, with + − ▲ ▼ under it.
  QWidget* ruleTable(const QStringList& headers, std::function<int()> count,
                     std::function<void(QTableWidget*, int row)> fillRow, std::function<void()> add,
                     std::function<void(int)> remove, std::function<void(int, int)> swap);
  // Cells bound to rule values.
  QWidget* lengthCell(Coord value, std::function<void(Coord)> set);
  // Two length cells of one row that stay ordered, low ≤ high («Мин.» ≤ «Ном.», hole ≤ pad): raising the low
  // one over the high one takes the high one along, lowering the high one under the low one takes that along.
  void orderedCells(QTableWidget* t, int row, int lowColumn, int highColumn, Coord low, Coord high,
                    std::function<void(Coord low, Coord high)> set);
  std::pair<QDoubleSpinBox*, QDoubleSpinBox*> orderedSpins(Coord low, Coord high, std::function<void(Coord low, Coord high)> set);
  QWidget* netsCell(const RuleNets& value, std::function<void(RuleNets)> set);
  QWidget* layerCell(const std::vector<std::string>& value, std::function<void(std::vector<std::string>)> set);
  QWidget* checkCell(bool value, std::function<void(bool)> set);

  // Pad stacks: the editor, «Создать детали на слоях», the stacks of the selected rows.
  void editStack(int i);
  void newStack();
  void createDetails(LayerKind kind, std::vector<int> stacks);

  Document* doc_;
  DesignRules rules_;
  std::vector<Padstack> stacks_;           // the design's pad stacks, edited
  std::vector<int> stackOrigin_;           // the board's index of each (-1: new)
  std::set<std::string> hiddenPadColumns_;  // «Выбор столбцов»: layers not shown in the stacks' table
  std::vector<int> selectedStacks_;        // rows selected in the stacks' table (kept across rebuilds)
  std::vector<std::pair<ViaType, ViaType>> viaEdits_;  // via types resized: vias on the board follow
  QTreeWidget* nav_;
  QStackedWidget* pages_;
  QTextBrowser* help_;
  QPushButton* applyButton_;
  QPushButton* resetButton_;
  std::vector<std::pair<QString, std::function<QWidget*()>>> pageMakers_;
  std::vector<QString> pageHelp_;
  bool dirty_ = false;
};

}  // namespace xr::gui
