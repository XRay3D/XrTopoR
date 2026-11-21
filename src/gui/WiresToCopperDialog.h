#pragma once
// TopoR's «Преобразование проводников в полигоны» («Инструменты > Преобразовать проводники в обл. металлизации»):
// the nets whose wires are made copper areas, or — «Все проводники на слое» — the layers; core/WiresToCopper.h
// does it.
#include <QDialog>

#include "core/WiresToCopper.h"
#include "gui/Document.h"

class QListView;
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
  // «Преобразовать»: one step of undo; what came of it goes to the message window. False: nothing to do.
  bool convert();

  // The window, then the conversion.
  static void run(Document* doc, QWidget* parent);

 private:
  void add(QStringListModel* m, const std::vector<std::string>& names);
  void removeSelected(QListView* v, QStringListModel* m);
  void sync();
  Document* doc_;
  QRadioButton *byNets_, *byLayers_;
  QListView *netsView_, *layersView_;
  QStringListModel *nets_, *layers_;
  QToolButton *addNet_, *removeNet_, *addLayer_, *removeLayer_;
};

}  // namespace xr::gui
