#pragma once
// «Свойства» (Alt+Enter), as in TopoR: a page for the kind of the selected objects — component, pin,
// wire, via, copper area, keepout, text, detail or board outline — with the editable values; several objects of one kind show what they have
// in common and are edited together.
#include <QWidget>
#include <functional>

#include "core/SpatialIndex.h"
#include "gui/Document.h"

class QFormLayout;
class QScrollArea;

namespace xr::gui {

class PropertiesPanel : public QWidget {
  Q_OBJECT
 public:
  explicit PropertiesPanel(Document* doc, QWidget* parent = nullptr);

 private:
  void rebuild();
  void edit(const QString& title, const std::function<void(Board&)>& fn);
  QWidget* message(const QString& text);
  QWidget* componentPage(const std::vector<int>& comps);
  QWidget* padPage(int pad);
  QWidget* wirePage(const std::vector<int>& tracks);
  QWidget* viaPage(const std::vector<int>& vias);
  QWidget* zonePage(int zone);
  QWidget* keepoutPage(int keepout);
  // «Надпись»: «Общие» (the text, its layer, place, mirror, angle, the point it is aligned by) and «Стиль» (the
  // style, its font, height, bold, italic — saved into the style — and «Редактор стилей»); several texts are
  // edited together, but for the alignment.
  QWidget* textPage(const std::vector<int>& texts);
  QWidget* detailPage(const std::vector<int>& details);
  // «Редактор стилей надписей» with the style `current` selected; «Применить» is an undoable edit.
  void openTextStyles(int current);
  // «Форма (...)»: the figure of a drawing, a keepout (figure `part`) or a copper area, point by point, as TopoR
  // shows it: a polygon's vertices with the angles of the arcs from them, a circle's centre and radius...
  QWidget* shapePage(ItemRef r, int part);
  static QString shapeTitle(const Graphic& g);
  // An undoable change of the figure; the board outline is built again, a poured area poured again.
  void editShape(ItemRef r, int part, const QString& title, const std::function<void(Graphic&)>& fn);
  // A length in display units; the callback gets nm, on Enter or focus out.
  QWidget* length(std::optional<double> nm, std::function<void(double)> set, double min = 0);

  Document* doc_;
  QScrollArea* area_;
  bool committing_ = false;
  // The page's tab stays when the same objects are shown again (a vertex added, a value edited).
  std::vector<ItemRef> shownItems_;
  std::vector<int> shownComps_;
};

}  // namespace xr::gui
