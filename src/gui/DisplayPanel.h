#pragma once
// «Управление отображением» (Alt+D), as in TopoR: the selection filter, the visibility tabs «Слои»,
// «Объекты», «Цепи», «Настройки» and the colour / display schemes. Everything edits the design's
// DisplayControl.
#include <QWidget>
#include <functional>
#include <vector>

#include "gui/Document.h"

class QComboBox;
class QLabel;
class QTabWidget;
class QVBoxLayout;

namespace xr::gui {

class DisplayPanel : public QWidget {
  Q_OBJECT
 public:
  explicit DisplayPanel(Document* doc, QWidget* parent = nullptr);

  void applyColorScheme(int index);  // index in allColorSchemes()
  void applyViewScheme(int index);   // index in allViewSchemes()

 protected:
  bool eventFilter(QObject* o, QEvent* e) override;  // a click on a metal layer makes it active

 private:
  void rebuild();  // board replaced
  void refresh();  // display settings changed elsewhere
  void edited();   // a control changed the display settings
  QWidget* selectionFilter();
  QWidget* layersTab();
  QWidget* objectsTab();
  QWidget* netsTab();
  QWidget* settingsTab();
  QWidget* schemesBlock();
  void fillSchemes();
  void saveScheme(bool color);
  void addNets(bool netlineFilter);

  // Controls bound to a display value: `refreshers_` re-read the values after outside changes.
  QWidget* flagRow(const QString& text, const std::string& flag, const std::string& colorKey = {}, bool def = true);
  QWidget* colorRow(const QString& text, const std::string& colorKey);
  QWidget* boolRow(const QString& text, std::function<bool()> get, std::function<void(bool)> set);
  QWidget* swatch(std::function<uint32_t()> get, std::function<void(uint32_t)> set);

  Document* doc_;
  QTabWidget* tabs_ = nullptr;
  QWidget* tabPages_[4] = {};
  QLabel* schemesTitle_ = nullptr;
  QComboBox* colorCombo_ = nullptr;
  QComboBox* viewCombo_ = nullptr;
  std::vector<std::function<void()>> refreshers_;
  bool updating_ = false;
  bool modified_ = false;  // display edited since the schemes were applied («Схемы*»)
};

}  // namespace xr::gui
