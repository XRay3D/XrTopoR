#pragma once
// The windows of «High-speed правила > Сигналы», as TopoR has them:
// - «Выбор источника сигнала»: the pins with their nets, found by words, with the passive components, the nets
//   excluded from the search and the nets of signals hidden or shown;
// - «Создание сигналов» (and «Задать топологию», the same cards of nets alone): the nets of the cluster as cards
//   — pins, the source, the links set on the net —, the signals of the cluster, the impedance, the buses and
//   pairs found among the signals;
// - «Найденные шины сигналов», «Возможные дифференциальные сигналы»: what the searches found, to be ticked;
// - «Настройки поиска сигналов»: «Общие» (the limit of nets, the nets excluded, the links set automatically) and
//   «Дифф. сигналы» (the naming rules of a pair's nets).
// All on models: the tables and lists are QAbstractItemModel over the cluster and the settings.
#include <QAbstractTableModel>
#include <QDialog>
#include <QStyledItemDelegate>
#include <optional>

#include "core/Signals.h"
#include "gui/Document.h"

class QCheckBox;
class QComboBox;
class QLabel;
class QPushButton;
class QSpinBox;
class QStandardItemModel;
class QTabWidget;
class QTableView;
class QVBoxLayout;

namespace xr::gui {

class WordsFilter;

// «Выбор источника сигнала»: the pad chosen, or none.
std::optional<int> pickSignalSource(QWidget* parent, Document* doc, const HiSpeed& h);

class SourcePickerDialog : public QDialog {
  Q_OBJECT
 public:
  SourcePickerDialog(Document* doc, const HiSpeed& h, QWidget* parent = nullptr);
  std::optional<int> pad() const;
  // (test hooks)
  void setFilter(const QString& words);
  int rows() const;
  QString rowText(int row, int column) const;
  void choose(int row);

 private:
  void fill();
  Document* doc_;
  const HiSpeed& h_;
  QStandardItemModel* model_;
  WordsFilter* filter_;
  QTableView* view_;
  QCheckBox *passive_, *excluded_, *used_;
  QPushButton* ok_;
};

// The links set on one net of a cluster: a row a pair of the net's pins (chosen from them), the last column
// removes it.
class LinksModel : public QAbstractTableModel {
  Q_OBJECT
 public:
  static constexpr int ChoicesRole = Qt::UserRole + 1;
  LinksModel(const Board& b, SignalCluster& c, std::string net, bool readOnly, QObject* parent = nullptr);
  int rowCount(const QModelIndex& parent = {}) const override;
  int columnCount(const QModelIndex& parent = {}) const override { return parent.isValid() ? 0 : 3; }
  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
  bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
  Qt::ItemFlags flags(const QModelIndex& index) const override;
  void addLink();
  void removeLink(int row);
  void reload();

 signals:
  void edited();

 private:
  const Board& b_;
  SignalCluster& c_;
  std::string net_;
  bool readOnly_;
  std::vector<int> rows_;  // into SignalCluster::pinPairs
};

// The signals of a cluster: name (edited), source, receiver (chosen among the cluster's pins), remove.
class ClusterSignalsModel : public QAbstractTableModel {
  Q_OBJECT
 public:
  static constexpr int ChoicesRole = Qt::UserRole + 1;
  ClusterSignalsModel(const Board& b, const HiSpeed& h, SignalCluster& c, QObject* parent = nullptr);
  int rowCount(const QModelIndex& parent = {}) const override;
  int columnCount(const QModelIndex& parent = {}) const override { return parent.isValid() ? 0 : 4; }
  QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
  QVariant headerData(int section, Qt::Orientation o, int role = Qt::DisplayRole) const override;
  bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;
  Qt::ItemFlags flags(const QModelIndex& index) const override;
  // A signal to a pin of the cluster no signal ends at; false: none is left.
  bool addSignal();
  void removeSignal(int row);
  void reload();
  std::vector<PinRef> freePins() const;

 signals:
  void edited();

 private:
  const Board& b_;
  const HiSpeed& h_;
  SignalCluster& c_;
};

// The delegate of those tables: a list of choices (ChoicesRole) for the pins, the ✕ of the last column.
class ChoiceDelegate : public QStyledItemDelegate {
  Q_OBJECT
 public:
  ChoiceDelegate(int removeColumn, QObject* parent = nullptr) : QStyledItemDelegate(parent), remove_(removeColumn) {}
  QWidget* createEditor(QWidget* parent, const QStyleOptionViewItem& option, const QModelIndex& index) const override;
  void setEditorData(QWidget* editor, const QModelIndex& index) const override;
  void setModelData(QWidget* editor, QAbstractItemModel* model, const QModelIndex& index) const override;
  void paint(QPainter* p, const QStyleOptionViewItem& option, const QModelIndex& index) const override;
  bool editorEvent(QEvent* e, QAbstractItemModel* model, const QStyleOptionViewItem& option, const QModelIndex& index) override;

 signals:
  void removeRequested(int row);

 private:
  int remove_;
};

// The cards of a cluster's nets (pins, the source, the links), one under another.
class NetCards : public QWidget {
  Q_OBJECT
 public:
  NetCards(const Board& b, SignalCluster& c, bool editable, bool sourceChangeable, QWidget* parent = nullptr);
  void rebuild();
  LinksModel* links(const std::string& net) const;

 signals:
  void edited();
  void netRemoveRequested(const std::string& net);
  void sourceChangeRequested();

 private:
  const Board& b_;
  SignalCluster& c_;
  bool editable_, sourceChangeable_;
  QVBoxLayout* v_;
  std::vector<std::pair<std::string, LinksModel*>> links_;
};

// «Создание сигналов» (Mode::Create) and «Задать топологию» (Mode::Links).
class ClusterDialog : public QDialog {
  Q_OBJECT
 public:
  enum class Mode { Create, Links };
  ClusterDialog(Document* doc, const HiSpeed& h, SignalCluster cluster, Mode mode, QWidget* parent = nullptr);
  const SignalCluster& cluster() const { return c_; }
  // The cluster added to the rules, with the groups of the buses and the pairs chosen (Mode::Create).
  void applyTo(HiSpeed& h) const;

  // (test hooks)
  std::string addNet(const std::string& net);
  std::string removeNet(const std::string& net);
  void setAutoUpdate(bool on);
  void update();
  ClusterSignalsModel* signalsModel() const { return signals_; }
  NetCards* cards() const { return cards_; }
  const std::vector<sig::Bus>& buses() const { return buses_; }
  const std::vector<sig::DiffCandidate>& pairs() const { return pairs_; }
  void setConvertBuses(bool on);
  void setJoinPairs(bool on);
  QString cycleMessage() const;

 private:
  void netsChanged();
  void findExtras();
  void showExtras();
  void changeSource();
  Document* doc_;
  const HiSpeed& h_;
  SignalCluster c_;
  Mode mode_;
  NetCards* cards_;
  ClusterSignalsModel* signals_ = nullptr;
  QCheckBox* auto_ = nullptr;
  QComboBox* impedance_ = nullptr;
  QLabel *note_, *busInfo_ = nullptr, *pairInfo_ = nullptr;
  QCheckBox *convertBuses_ = nullptr, *joinPairs_ = nullptr;
  std::vector<sig::Bus> buses_, chosenBuses_;
  std::vector<sig::DiffCandidate> pairs_, chosenPairs_;
};

// «Найденные шины сигналов»: the buses ticked (each with the signals left in it), or nothing when cancelled.
class BusesDialog : public QDialog {
  Q_OBJECT
 public:
  BusesDialog(Document* doc, const HiSpeed& h, std::vector<sig::Bus> buses, QWidget* parent = nullptr);
  std::vector<sig::Bus> chosen() const;
  // The groups made of the buses ticked; true: some.
  static bool run(QWidget* parent, Document* doc, HiSpeed& h, std::vector<sig::Bus> buses);
  // (test hooks)
  void setChecked(int bus, bool on);
  void removeSignal(int bus, int row);

 private:
  void showBus(int i);
  Document* doc_;
  const HiSpeed& h_;
  std::vector<sig::Bus> buses_, found_;
  QStandardItemModel* list_;
  QStandardItemModel* table_;
  QLabel* busTitle_;
  QWidget* cardsHolder_;
};

// «Возможные дифференциальные сигналы».
class DiffPairsDialog : public QDialog {
  Q_OBJECT
 public:
  DiffPairsDialog(Document* doc, const HiSpeed& h, std::vector<sig::DiffCandidate> pairs, QWidget* parent = nullptr);
  std::vector<sig::DiffCandidate> chosen() const;
  static bool run(QWidget* parent, Document* doc, HiSpeed& h, std::vector<sig::DiffCandidate> pairs);
  void setChecked(int pair, bool on);

 private:
  void showPair(int i);
  Document* doc_;
  const HiSpeed& h_;
  std::vector<sig::DiffCandidate> pairs_;
  QStandardItemModel* list_;
  QWidget* holder_;
};

// «Настройки поиска сигналов».
class SearchSettingsDialog : public QDialog {
  Q_OBJECT
 public:
  SearchSettingsDialog(Document* doc, const SignalSearch& s, const DesignRules* rules, QWidget* parent = nullptr);
  SignalSearch settings() const;
  // The design's settings edited; true: changed.
  static bool run(QWidget* parent, Document* doc, HiSpeed& h, const DesignRules* rules = nullptr);
  // (test hooks)
  void autofill();
  void addNets(const std::vector<std::string>& nets);
  void restoreDefaultNames();
  QTabWidget* tabs() const { return tabs_; }

 private:
  void fillExcluded();
  Document* doc_;
  SignalSearch s_;
  const DesignRules* rules_;
  QTabWidget* tabs_;
  QSpinBox *maxNets_, *minPins_;
  QCheckBox* links_;
  QStandardItemModel* excluded_;
  QStandardItemModel* names_;
  void fillNames();
  void readNames();
};

}  // namespace xr::gui
