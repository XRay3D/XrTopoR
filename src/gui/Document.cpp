#include "gui/Document.h"

#include "core/Prof.h"

#include <set>
#include <unordered_map>
#include <unordered_set>

#include "gui/Schemes.h"
#include "gui/TextFont.h"
#include "core/Edit.h"
#include "io/BoardIO.h"
#include "topo/Move.h"
#include "topo/Sidecar.h"

namespace xr::gui {

namespace {

class SnapshotCommand : public QUndoCommand {
 public:
  SnapshotCommand(Document* doc, EditSnapshot before, EditSnapshot after, const QString& title)
      : QUndoCommand(title), doc_(doc), before_(std::move(before)), after_(std::move(after)) {}
  void undo() override { apply(before_, after_); }
  void redo() override {
    if (first_) {  // the edit is already applied when the command is pushed
      first_ = false;
      return;
    }
    apply(after_, before_);
  }

 private:
  void apply(const EditSnapshot& s, const EditSnapshot& from) {
    if (!doc_->hasBoard()) return;
    s.apply(*doc_->board());
    doc_->invalidate();
    doc_->followModel(from);
    doc_->validateSelection();
    emit doc_->boardChanged();
  }
  Document* doc_;
  EditSnapshot before_, after_;
  bool first_ = true;
};

}  // namespace

Document::Document(QObject* parent) : QObject(parent) { installTextMeasure(); }

void Document::setBoard(std::unique_ptr<Board> b, const QString& path) {
  board_ = std::move(b);
  path_ = path;
  topo_.reset();
  topoStale_ = true;
  undo_.clear();
  selection_.clear();
  selComponents_.clear();
  highlightNet_ = kNoNet;
  drc_.clear();
  drcRun_ = false;
  log_.clear();
  if (board_) {
    // Designs without saved display settings get the default schemes; saved ones are completed.
    bool saved = board_->display.has_value();
    if (!saved) board_->display.emplace();
    auto colors = allColorSchemes();
    auto views = allViewSchemes();
    DisplayControl& d = *board_->display;
    completeDisplay(d, *board_, colorSchemeByName(colors, saved ? d.colorScheme : defaultColorScheme()),
                    viewSchemeByName(views, saved ? d.displayScheme : defaultViewScheme()));
    activeLayer_ = activeCopper_ = board_->topCopper();
    if (LayerId l = board_->findLayer(d.activeLayer); l >= 0 && layerGroup(*board_, l) >= 0) {
      activeLayer_ = l;
      if (board_->layers[l].kind == LayerKind::Copper) activeCopper_ = l;
    }
    d.activeLayer = board_->layers[activeLayer_].name;
    if (saved) {
      const std::string& u = d.units;
      unit_ = (u == "Imperial" || u == "mil" || u == "inch") ? Unit::Mil : Unit::Mm;
    } else {
      unit_ = designUnit(*board_);
      d.units = unit_ == Unit::Mil ? "Imperial" : "Metric";
    }
  }
  invalidate();
  emit boardReplaced();
  emit layersChanged();
  emit selectionChanged();
  emit drcChanged();
  emit logChanged();
}

void Document::setActiveLayer(LayerId l) {
  if (l < 0 || !board_ || l >= LayerId(board_->layers.size()) || l == activeLayer_ || layerGroup(*board_, l) < 0) return;
  activeLayer_ = l;
  if (board_->layers[l].kind == LayerKind::Copper) activeCopper_ = l;
  display().activeLayer = board_->layers[l].name;
  emit layersChanged();
}

const SpatialIndex& Document::index() {
  if (!index_) {
    ProfScope ps("doc.index");
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

EditSnapshot Document::beginEdit() {
  topo::Topology::assignIds(*board_);  // (an edit is followed by the tracks' and vias' ids)
  return EditSnapshot::take(*board_);
}

void Document::followModel(const EditSnapshot& was, bool follow) {
  if (follow && topo_ && !topoStale_ && syncModelFrom(was)) markTopologyFresh();
  else topoStale_ = true;
}

bool Document::syncModelFrom(const EditSnapshot& was) {
  Board& b = *board_;
  topo::Topology::assignIds(b);
  Board old = b;  // the board as the model has it: this one with the snapshot's items (the rest is the same)
  was.apply(old);
  if (old.pads.size() != b.pads.size()) return false;
  topo::Topology& t = *topo_;
  if (topo::boardHashOf(old, false) != topo::boardHashOf(b, false)) {  // zones, keepouts, the outline, nets, pairs...
    // ... unless the board moved whole: the model moves with it (built anew from the moved tracks, it walked them
    // through a mesh of its own, and F5 laid wires out of the way and left tails).
    if (old.outline.empty() || b.outline.empty() || old.outline[0].empty() || b.outline[0].empty()) return false;
    const Vec2 d = b.outline[0][0] - old.outline[0][0];
    if (d.len2() < 1) return false;
    edit::Fragment all;
    for (int i = 0; i < int(old.components.size()); ++i) all.components.push_back(i);
    for (int i = 0; i < int(old.tracks.size()); ++i) all.tracks.push_back(i);
    for (int i = 0; i < int(old.vias.size()); ++i) all.vias.push_back(i);
    for (int i = 0; i < int(old.zones.size()); ++i) all.zones.push_back(i);
    for (int i = 0; i < int(old.keepouts.size()); ++i) all.keepouts.push_back(i);
    for (int i = 0; i < int(old.texts.size()); ++i) all.texts.push_back(i);
    for (int i = 0; i < int(old.graphics.size()); ++i) all.details.push_back(i);
    edit::Motion m;
    m.shift = d;
    edit::move(old, all, m);
    io::rebuildOutline(old);
    if (topo::boardHashOf(old, false) != topo::boardHashOf(b, false)) return false;
    t.translate(d);
  }
  // The vias and pads moved: their owners with them (the pads turned are no move: the hash has their angle); a via
  // taken away leaves the meshes, and the tracks changed, added or gone have their wires laid again
  // (Topology::follow — the tools of F6 keep their models by it too).
  return t.follow(old, b);
}

topo::Topology& Document::topology() {
  topo::Topology::assignIds(*board_);
  if (topo_ && !topoStale_) return *topo_;
  topoStale_ = false;
  if (!path_.isEmpty())
    if (auto t = topo::loadTopology(*board_, topo::sidecarPath(path_.toStdString()))) {
      topo_ = std::make_unique<topo::Topology>(std::move(*t));
      return *topo_;
    }
  topo_ = std::make_unique<topo::Topology>();
  topo_->build(*board_);
  return *topo_;
}

void Document::setTopology(std::unique_ptr<topo::Topology> t) {
  topo_ = std::move(t);
  markTopologyFresh();
}

void Document::markTopologyFresh() {
  if (topo_ && board_) topo_->boardHash = topo::boardHashOf(*board_);
  topoStale_ = false;
}

std::expected<void, std::string> Document::saveTopologyFile(const QString& boardPath) {
  if (!board_) return {};
  return topo::saveTopology(topology(), *board_, topo::sidecarPath(boardPath.toStdString()));
}

void Document::setSelection(std::vector<ItemRef> items, std::vector<int> comps) {
  selection_ = std::move(items);
  selComponents_ = std::move(comps);
  emit selectionChanged();
}

bool Document::itemExists(ItemRef r) const {
  if (!board_ || r.index < 0) return false;
  switch (r.type) {
    case ItemType::Track: return r.index < int(board_->tracks.size());
    case ItemType::Via: return r.index < int(board_->vias.size());
    case ItemType::Pad: return r.index < int(board_->pads.size());
    case ItemType::Zone: return r.index < int(board_->zones.size());
    case ItemType::Keepout: return r.index < int(board_->keepouts.size());
    case ItemType::Text: return r.index < int(board_->texts.size());
    case ItemType::Detail: return r.index < int(board_->graphics.size());
  }
  return false;
}

void Document::validateSelection() {
  if (!board_) return;
  size_t n = selection_.size() + selComponents_.size();
  std::erase_if(selection_, [&](ItemRef r) { return !itemExists(r); });
  std::erase_if(selComponents_, [&](int c) { return c < 0 || c >= int(board_->components.size()); });
  if (selection_.size() + selComponents_.size() != n) emit selectionChanged();
}

void Document::setUnit(Unit u) {
  if (u == unit_) return;
  unit_ = u;
  if (board_) display().units = u == Unit::Mil ? "Imperial" : "Metric";
  emit unitChanged();
}

bool Document::layerVisible(LayerId l) const {
  if (!board_ || l < 0 || l >= LayerId(board_->layers.size())) return false;
  const DisplayControl& d = display();
  const LayerDisplay* ld = d.layer(board_->layers[l].name);
  if (ld && !ld->visible) return false;
  int group = layerGroup(*board_, l);
  if (group >= 0 && d.flag("showActiveLayerOnly", false)) return l == activeLayer_;
  switch (group) {
    case 1: return d.flag("showSignalLayers");
    case 0: return d.flag("showTopMechLayers");
    case 2: return d.flag("showBotMechLayers");
    case 3: return d.flag("showDocLayers", false);
    default: return d.flag("showBoardOutline");
  }
}

QColor Document::color(const std::string& name, uint32_t def) const {
  return QColor::fromRgb(QRgb(display().color(name, def)));
}

QColor Document::layerColor(LayerId l) const {
  const LayerDisplay* ld = display().layer(board_->layers[l].name);
  return QColor::fromRgb(QRgb(ld ? ld->details : 0xc0c0c0));
}

void Document::setSelectionFilter(uint32_t f) {
  if (f == selFilter_) return;
  selFilter_ = f;
  emit selectionFilterChanged();
}

void Document::setHighlightedNet(int net) {
  if (net == highlightNet_) return;
  highlightNet_ = net;
  emit selectionChanged();
}

void Document::setDrc(std::vector<DrcViolation> v) {
  drc_ = std::move(v);
  drcRun_ = true;
  emit drcChanged();
}

void Document::clearDrc() {
  drc_.clear();
  drcRun_ = false;
  emit drcChanged();
}

void Document::addLog(LogMessage m) {
  log_.push_back(std::move(m));
  emit logChanged();
}

void Document::clearLog(const QString& group) {
  if (group.isEmpty()) log_.clear();
  else std::erase_if(log_, [&](const LogMessage& m) { return m.group == group; });
  emit logChanged();
}

void Document::commitEdit(const EditSnapshot& before, const QString& title, bool markEdited) {
  topo::Topology::assignIds(*board_);
  if (markEdited) {
    // By content, not by index: an edit may drop degenerate tracks and renumber the rest.
    auto key = [](const Track& t) {
      return std::tuple{t.a.x, t.a.y, t.b.x, t.b.y, t.mid ? t.mid->x : Coord(0), t.mid ? t.mid->y : Coord(0),
                        t.mid.has_value(), t.width, t.layer, t.net};
    };
    std::set<decltype(key(Track{}))> old;
    for (const Track& t : before.tracks) old.insert(key(t));
    for (Track& t : board_->tracks)
      if (!old.contains(key(t))) t.edited = true;
  }
  invalidate();
  // An edit by hand is followed by the model; a tool that draws from it (F5, F6, F7) hands it back itself.
  followModel(before, markEdited);
  undo_.push(new SnapshotCommand(this, before, EditSnapshot::take(*board_), title));
  validateSelection();  // an edit that left fewer items than the selection names
  emit boardChanged();
}

}  // namespace xr::gui
