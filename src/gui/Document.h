#pragma once
// Editable board document: the Board, its display settings, selection and the undo stack.
#include <QColor>
#include <QObject>
#include <QUndoStack>
#include <expected>
#include <memory>
#include <optional>
#include <vector>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "gui/Units.h"
#include "topo/Topology.h"

namespace xr::gui {

// «Фильтр выделения»: kinds of objects a click may select.
enum SelFilter : uint32_t {
  SelComponents = 1 << 0,
  SelPins = 1 << 1,
  SelCompDetails = 1 << 2,
  SelCoppers = 1 << 3,
  SelWires = 1 << 4,
  SelVias = 1 << 5,
  SelNetlines = 1 << 6,
  SelViolations = 1 << 7,
  SelTexts = 1 << 8,
  SelKeepouts = 1 << 9,
  SelBoard = 1 << 10,
  SelMechDetails = 1 << 11,
  SelAll = (1 << 12) - 1,
};

// Everything the user can edit, copied whole for undo (boards of this class are small enough).
struct EditSnapshot {
  std::vector<Component> components;
  std::vector<Pad> pads;
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  std::vector<Keepout> keepouts;
  std::vector<Text> texts;
  std::vector<Graphic> graphics;
  std::vector<std::vector<Vec2>> outline;
  std::vector<Net> nets;  // their flags (the flexible fixation) are edited too
  std::vector<Padstack> padstacks;
  static EditSnapshot take(const Board& b) {
    return {b.components, b.pads, b.tracks, b.vias, b.zones, b.keepouts, b.texts, b.graphics, b.outline, b.nets,
            b.padstacks};
  }
  void apply(Board& b) const {
    b.components = components;
    b.pads = pads;
    b.tracks = tracks;
    b.vias = vias;
    b.zones = zones;
    b.keepouts = keepouts;
    b.texts = texts;
    b.graphics = graphics;
    b.outline = outline;
    b.nets = nets;
    b.padstacks = padstacks;
  }
};

// A line of the «Окно сообщений» besides the DRC and unrouted nets (program and procedure output).
struct LogMessage {
  enum class Kind { Info, Warning, Error } kind = Kind::Info;
  QString group;  // messages of one group are listed under one entry
  QString text;
};

class Document : public QObject {
  Q_OBJECT
 public:
  explicit Document(QObject* parent = nullptr);

  Board* board() const { return board_.get(); }
  bool hasBoard() const { return board_ != nullptr; }
  const QString& path() const { return path_; }
  void setPath(const QString& p) { path_ = p; }
  void setBoard(std::unique_ptr<Board> b, const QString& path);
  QUndoStack* undoStack() { return &undo_; }

  Unit unit() const { return unit_; }
  void setUnit(Unit u);

  // Display settings of the board (saved with it in .fst). Call displayChanged() after editing them.
  DisplayControl& display() { return board_->display.value(); }
  const DisplayControl& display() const { return board_->display.value(); }
  void displayChanged() { emit layersChanged(); }
  // Visible copper/technical layer, with «Только активный слой» and the layer groups applied.
  bool layerVisible(LayerId l) const;
  QColor color(const std::string& name, uint32_t def) const;
  QColor layerColor(LayerId l) const;  // details colour of a layer

  uint32_t selectionFilter() const { return selFilter_; }
  void setSelectionFilter(uint32_t f);

  LayerId activeLayer() const { return activeLayer_; }
  void setActiveLayer(LayerId l);

  // Derived data, rebuilt lazily after edits.
  const SpatialIndex& index();
  const Connectivity& connectivity();
  void invalidate();  // call after any board edit

  // The topological model of the board as it is (F5 and F7 work in it): the one a tool left when the
  // board has not changed since, else the file next to the board when that is fresh, else built from
  // the tracks. Gives the tracks and vias their ids.
  topo::Topology& topology();
  // A tool drew the board from this model: it is the board's now.
  void setTopology(std::unique_ptr<topo::Topology> t);
  void markTopologyFresh();  // the model matches the board as the tool left it
  // Writes the model next to the board file (the board's model: a tool's, the file's, or built).
  std::expected<void, std::string> saveTopologyFile(const QString& boardPath);

  // Selection
  std::vector<ItemRef> selectedItems() const { return selection_; }
  std::vector<int> selectedComponents() const { return selComponents_; }
  void setSelection(std::vector<ItemRef> items, std::vector<int> comps);
  void clearSelection() { setSelection({}, {}); }
  void validateSelection();  // drops references to items that no longer exist (after undo/redo)
  int highlightedNet() const { return highlightNet_; }
  void setHighlightedNet(int net);

  // DRC results
  const std::vector<DrcViolation>& drc() const { return drc_; }
  void setDrc(std::vector<DrcViolation> v);
  bool drcRun() const { return drcRun_; }  // DRC was run on this board (an empty result means «no violations»)
  void clearDrc();

  // Messages of procedures (load, autoroute, optimiser, …).
  const std::vector<LogMessage>& log() const { return log_; }
  void addLog(LogMessage m);
  void clearLog(const QString& group = {});  // empty: all

  // Edits: snapshot-based undo. Call begin, edit the board, then commit with a title.
  EditSnapshot beginEdit() { return EditSnapshot::take(*board_); }
  // `markEdited`: tracks that are new or changed since `before` get Track::edited (F5 re-lays those
  // first); the shape computation itself commits without it.
  void commitEdit(const EditSnapshot& before, const QString& title, bool markEdited = true);

 signals:
  void boardReplaced();
  void boardChanged();
  void selectionChanged();
  void layersChanged();
  void drcChanged();
  void unitChanged();
  void selectionFilterChanged();
  void logChanged();

 private:
  std::unique_ptr<Board> board_;
  QString path_;
  QUndoStack undo_;
  uint32_t selFilter_ = SelAll;
  LayerId activeLayer_ = 0;
  Unit unit_ = Unit::Mm;
  std::optional<SpatialIndex> index_;
  std::optional<Connectivity> conn_;
  std::unique_ptr<topo::Topology> topo_;
  bool topoStale_ = true;  // the board was edited since the model was the board's (the hash is too coarse for a drag)
  std::vector<ItemRef> selection_;
  std::vector<int> selComponents_;
  int highlightNet_ = kNoNet;
  std::vector<DrcViolation> drc_;
  bool drcRun_ = false;
  std::vector<LogMessage> log_;
};

}  // namespace xr::gui
