#pragma once
// Editable board document: the Board, per-layer view state, selection and the undo stack.
#include <QColor>
#include <QObject>
#include <QUndoStack>
#include <memory>
#include <optional>
#include <vector>

#include "core/Connectivity.h"
#include "drc/Drc.h"
#include "gui/Units.h"

namespace xr::gui {

struct LayerView {
  bool visible = true;
  QColor color;
};

// Everything the user can edit, copied whole for undo (boards of this class are small enough).
struct EditSnapshot {
  std::vector<Component> components;
  std::vector<Pad> pads;
  std::vector<Track> tracks;
  std::vector<Via> vias;
  std::vector<Zone> zones;
  static EditSnapshot take(const Board& b) { return {b.components, b.pads, b.tracks, b.vias, b.zones}; }
  void apply(Board& b) const {
    b.components = components;
    b.pads = pads;
    b.tracks = tracks;
    b.vias = vias;
    b.zones = zones;
  }
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

  std::vector<LayerView>& layerViews() { return layerViews_; }
  LayerId activeLayer() const { return activeLayer_; }
  void setActiveLayer(LayerId l);

  // Derived data, rebuilt lazily after edits.
  const SpatialIndex& index();
  const Connectivity& connectivity();
  void invalidate();  // call after any board edit

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

  // Edits: snapshot-based undo. Call begin, edit the board, then commit with a title.
  EditSnapshot beginEdit() { return EditSnapshot::take(*board_); }
  void commitEdit(const EditSnapshot& before, const QString& title);

 signals:
  void boardReplaced();
  void boardChanged();
  void selectionChanged();
  void layersChanged();
  void drcChanged();
  void unitChanged();

 private:
  std::unique_ptr<Board> board_;
  QString path_;
  QUndoStack undo_;
  std::vector<LayerView> layerViews_;
  LayerId activeLayer_ = 0;
  Unit unit_ = Unit::Mm;
  std::optional<SpatialIndex> index_;
  std::optional<Connectivity> conn_;
  std::vector<ItemRef> selection_;
  std::vector<int> selComponents_;
  int highlightNet_ = kNoNet;
  std::vector<DrcViolation> drc_;
};

}  // namespace xr::gui
