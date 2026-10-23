#include "gui/Document.h"

#include "gui/Theme.h"

namespace xr::gui {

namespace {

class SnapshotCommand : public QUndoCommand {
 public:
  SnapshotCommand(Document* doc, EditSnapshot before, EditSnapshot after, const QString& title)
      : QUndoCommand(title), doc_(doc), before_(std::move(before)), after_(std::move(after)) {}
  void undo() override { apply(before_); }
  void redo() override {
    if (first_) {  // the edit is already applied when the command is pushed
      first_ = false;
      return;
    }
    apply(after_);
  }

 private:
  void apply(const EditSnapshot& s) {
    if (!doc_->hasBoard()) return;
    s.apply(*doc_->board());
    doc_->invalidate();
    doc_->validateSelection();
    emit doc_->boardChanged();
  }
  Document* doc_;
  EditSnapshot before_, after_;
  bool first_ = true;
};

}  // namespace

Document::Document(QObject* parent) : QObject(parent) {}

void Document::setBoard(std::unique_ptr<Board> b, const QString& path) {
  board_ = std::move(b);
  path_ = path;
  undo_.clear();
  selection_.clear();
  selComponents_.clear();
  highlightNet_ = kNoNet;
  drc_.clear();
  layerViews_.clear();
  if (board_) {
    for (LayerId l = 0; l < LayerId(board_->layers.size()); ++l) {
      LayerView v;
      v.color = Theme::layerColor(*board_, l);
      v.visible = board_->layers[l].kind != LayerKind::Other && board_->layers[l].kind != LayerKind::Mask &&
                  board_->layers[l].kind != LayerKind::Paste && board_->layers[l].kind != LayerKind::Fab;
      layerViews_.push_back(v);
    }
    activeLayer_ = board_->topCopper();
    unit_ = designUnit(*board_);
  }
  invalidate();
  emit boardReplaced();
  emit layersChanged();
  emit selectionChanged();
  emit drcChanged();
}

void Document::setActiveLayer(LayerId l) {
  if (l < 0 || !board_ || l >= LayerId(board_->layers.size()) || l == activeLayer_) return;
  activeLayer_ = l;
  emit layersChanged();
}

const SpatialIndex& Document::index() {
  if (!index_) {
    index_.emplace();
    index_->build(*board_);
  }
  return *index_;
}

const Connectivity& Document::connectivity() {
  if (!conn_) conn_ = Connectivity::compute(*board_, index());
  return *conn_;
}

void Document::invalidate() {
  index_.reset();
  conn_.reset();
}

void Document::setSelection(std::vector<ItemRef> items, std::vector<int> comps) {
  selection_ = std::move(items);
  selComponents_ = std::move(comps);
  emit selectionChanged();
}

void Document::validateSelection() {
  if (!board_) return;
  auto valid = [&](ItemRef r) {
    switch (r.type) {
      case ItemType::Track: return r.index < int(board_->tracks.size());
      case ItemType::Via: return r.index < int(board_->vias.size());
      case ItemType::Pad: return r.index < int(board_->pads.size());
      case ItemType::Zone: return r.index < int(board_->zones.size());
    }
    return false;
  };
  size_t n = selection_.size() + selComponents_.size();
  std::erase_if(selection_, [&](ItemRef r) { return r.index < 0 || !valid(r); });
  std::erase_if(selComponents_, [&](int c) { return c < 0 || c >= int(board_->components.size()); });
  if (selection_.size() + selComponents_.size() != n) emit selectionChanged();
}

void Document::setUnit(Unit u) {
  if (u == unit_) return;
  unit_ = u;
  emit unitChanged();
}

void Document::setHighlightedNet(int net) {
  if (net == highlightNet_) return;
  highlightNet_ = net;
  emit selectionChanged();
}

void Document::setDrc(std::vector<DrcViolation> v) {
  drc_ = std::move(v);
  emit drcChanged();
}

void Document::commitEdit(const EditSnapshot& before, const QString& title) {
  invalidate();
  undo_.push(new SnapshotCommand(this, before, EditSnapshot::take(*board_), title));
  emit boardChanged();
}

}  // namespace xr::gui
