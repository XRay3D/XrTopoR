#pragma once
// «Автотрассировка» (F11), as in TopoR: the search for routing variants runs until stopped, each
// variant listed with its length, vias, violations and cost; one opens in the editor, any can be added
// to the project. Tabs «Цепи» (what to route) and «Настройки».
#include <QDialog>
#include <QFutureWatcher>
#include <atomic>
#include <functional>
#include <memory>

#include "gui/Document.h"
#include "router/topo/TopoRouter.h"

class QCheckBox;
class QDoubleSpinBox;
class QLabel;
class QProgressBar;
class QPushButton;
class QRadioButton;
class QSpinBox;
class QTableWidget;
class QTreeWidget;

namespace xr::gui {

struct RoutingVariant {
  QString name;
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  double length = 0;  // nm
  int viaCount = 0, violations = 0, unrouted = 0, level = 0;
  double seconds = 0;
};

class AutorouteWindow : public QDialog {
  Q_OBJECT
 public:
  explicit AutorouteWindow(Document* doc, QWidget* parent = nullptr);
  ~AutorouteWindow() override;

  // The project the variants are added to: its folder, and how to add a file.
  void setProjectHooks(std::function<QString()> dir, std::function<void(const QString&)> add);
  const std::vector<RoutingVariant>& variants() const { return variants_; }
  bool running() const { return running_; }

 public slots:
  void start();
  void stop();
  void openInEditor(int variant);

 signals:
  void variantFound(int index);
  void finished();

 private:
  void resetVariants();  // the design changed: earlier variants no longer apply
  void addVariant(RoutingVariant v);
  void refreshTable();
  void fillNets();
  void setDefaults();
  topo::RouterOptions options(int strategy) const;
  QString saveVariant(const RoutingVariant& v);  // as a .fst next to the project; empty on failure
  void setRunning(bool on);

  Document* doc_;
  std::function<QString()> projectDir_;
  std::function<void(const QString&)> addToProject_;
  std::vector<RoutingVariant> variants_;
  bool running_ = false;
  std::shared_ptr<std::atomic<bool>> cancel_;
  QFutureWatcher<void>* watcher_ = nullptr;

  // «Варианты»
  QLabel* hint_;
  QTableWidget* table_;
  QCheckBox* addOpened_;
  QDoubleSpinBox* viaWeight_;
  QLabel* operation_;
  QProgressBar* progress_;
  QPushButton* startButton_;
  QPushButton* stopButton_;
  QPushButton* openButton_;
  // «Цепи»
  QTreeWidget* nets_;
  // «Настройки»
  QRadioButton* shapeArcs_;
  QCheckBox* singleLayer_;
  QRadioButton* singleTop_;
  QCheckBox* keepRouting_;
  QSpinBox* passes_;
  QDoubleSpinBox* viaCost_;
  QSpinBox* optimize_;
  QCheckBox* pour_;
};

}  // namespace xr::gui
