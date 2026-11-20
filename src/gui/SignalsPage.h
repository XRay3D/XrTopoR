#pragma once
// «High-speed правила > Сигналы» as TopoR has it: the explorer of the signals and their groups (GroupExplorer) —
// a signal of a differential pair shown as the pair — with three panels on the right: «Задачи» (create a signal,
// search buses, search pairs, the search's settings), «Действия» on what is selected (set the links, light it on
// the board, delete, join two signals into a pair, split a pair) and «Свойства» (source, receiver, the
// impedance — of the whole cluster —, a pair's allowed difference of lengths).
//
// It edits the dialog's copies of the high-speed rules and of the rules (what names a signal follows it);
// `changed` is the dialog's.
#include <QWidget>
#include <functional>

#include "gui/Document.h"

class QFormLayout;
class QToolButton;
class QVBoxLayout;

namespace xr::gui {

class GroupExplorer;

class SignalsPage : public QWidget {
  Q_OBJECT
 public:
  SignalsPage(Document* doc, HiSpeed& hispeed, DesignRules& rules, std::function<void()> changed, QWidget* parent = nullptr);
  GroupExplorer* explorer() const { return explorer_; }
  // The selected objects (as the explorer holds them: "s:<signal>", "d:<pair>").
  std::vector<ObjectSignal> selected() const;

  // The actions (test hooks too).
  void highlight();
  void removeSelected();
  void joinSelected();
  void splitSelected();
  void setLinks();
  void createSignal();
  void searchBuses();
  void searchDiffPairs();
  void searchSettings();

 private:
  void selectionChanged();
  void edited();  // the rules changed here: the explorer follows, the dialog knows
  QWidget* section(const QString& title, QVBoxLayout* into);
  Document* doc_;
  HiSpeed& h_;
  DesignRules& rules_;
  std::function<void()> changed_;
  GroupExplorer* explorer_;
  QToolButton *links_, *light_, *remove_, *join_, *split_;
  QWidget* props_;
  QFormLayout* form_;
};

// An object of the signals' explorer by its id, and back.
std::string signalId(const ObjectSignal& o);
ObjectSignal signalOf(const std::string& id);

}  // namespace xr::gui
