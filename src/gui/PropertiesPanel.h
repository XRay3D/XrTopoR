#pragma once
// «Свойства» (Alt+Enter), as in TopoR: a page for the kind of the selected objects — component, pin,
// wire, via, copper area — with the editable values; several objects of one kind show what they have
// in common and are edited together.
#include <QWidget>
#include <functional>

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
  // A length in display units; the callback gets nm, on Enter or focus out.
  QWidget* length(std::optional<double> nm, std::function<void(double)> set, double min = 0);

  Document* doc_;
  QScrollArea* area_;
  bool committing_ = false;
};

}  // namespace xr::gui
