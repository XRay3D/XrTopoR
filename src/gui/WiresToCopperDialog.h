#pragma once
// TopoR's «Преобразование проводников в полигоны» («Инструменты > Преобразовать проводники в обл. металлизации»):
// the nets that get copper areas round their wires, or — «Все проводники на слое» — the layers; core/WiresToCopper.h
// does it. TopoR's has a list with «+» / «−» for each choice; here (the user's wish) the two choices are on top
// and one list serves the one in force — each keeps its own names —; the buttons are one row at the bottom: a «+»
// whose menu is that choice's («Цепи...», «Группы цепей...», «Все цепи», or «Все слои», «Внешние слои», each layer,
// «Набор слоев...»), one «−», «Преобразовать» and «Отмена».
#include <QDialog>

#include "core/WiresToCopper.h"
#include "gui/Document.h"

class QListView;
class QMenu;
class QPushButton;
class QRadioButton;
class QStringListModel;
class QToolButton;

namespace xr::gui {

class WiresToCopperDialog : public QDialog {
  Q_OBJECT
 public:
  explicit WiresToCopperDialog(Document* doc, QWidget* parent = nullptr);
  void setByLayers(bool on);
  void setNets(const QStringList& names);
  void setLayers(const QStringList& names);
  QStringList nets() const;
  QStringList layers() const;
  // What is asked for, as the core takes it.
  WiresToCopper what() const;
  // «Преобразовать»: one step of undo; what came of it goes to the message window. False: nothing made.
  bool convert();

  // The window, then the conversion.
  static void run(Document* doc, QWidget* parent);

 private:
  void add(QStringListModel* m, const std::vector<std::string>& names);
  void removeSelected(QListView* v, QStringListModel* m);
  void sync();
  Document* doc_;
  QRadioButton *byNets_, *byLayers_;
  QStringListModel* current() const;  // the names of the choice in force
  QListView* list_ = nullptr;
  QStringListModel *nets_, *layers_;
  QToolButton *add_ = nullptr, *remove_ = nullptr;
  QMenu *netMenu_ = nullptr, *layerMenu_ = nullptr;
  QPushButton* convert_ = nullptr;
};

}  // namespace xr::gui
