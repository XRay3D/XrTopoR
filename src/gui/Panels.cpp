#include "gui/Panels.h"

#include <QColorDialog>
#include <QHeaderView>
#include <QPushButton>
#include <QVBoxLayout>
#include <format>

#include "gui/BoardView.h"

namespace xr::gui {

// ---------------------------------------------------------------- layers

LayersPanel::LayersPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  tree_ = new QTreeWidget(this);
  tree_->setColumnCount(2);
  tree_->setHeaderLabels({tr("Layer"), tr("Color")});
  tree_->header()->setStretchLastSection(false);
  tree_->header()->setSectionResizeMode(0, QHeaderView::Stretch);
  tree_->setRootIsDecorated(false);
  lay->addWidget(tree_);
  connect(doc_, &Document::boardReplaced, this, &LayersPanel::rebuild);
  connect(doc_, &Document::layersChanged, this, [this] {
    if (building_) return;
    building_ = true;
    for (int i = 0; i < tree_->topLevelItemCount(); ++i) {
      auto* it = tree_->topLevelItem(i);
      LayerId l = it->data(0, Qt::UserRole).toInt();
      it->setCheckState(0, doc_->layerViews()[l].visible ? Qt::Checked : Qt::Unchecked);
      QFont f = it->font(0);
      f.setBold(l == doc_->activeLayer());
      it->setFont(0, f);
    }
    building_ = false;
  });
  connect(tree_, &QTreeWidget::itemChanged, this, [this](QTreeWidgetItem* it, int col) {
    if (building_ || col != 0) return;
    LayerId l = it->data(0, Qt::UserRole).toInt();
    doc_->layerViews()[l].visible = it->checkState(0) == Qt::Checked;
    emit doc_->layersChanged();
  });
  connect(tree_, &QTreeWidget::itemClicked, this, [this](QTreeWidgetItem* it, int col) {
    LayerId l = it->data(0, Qt::UserRole).toInt();
    if (col == 1) {
      QColor c = QColorDialog::getColor(doc_->layerViews()[l].color, this, tr("Layer color"));
      if (c.isValid()) {
        doc_->layerViews()[l].color = c;
        it->setBackground(1, c);
        emit doc_->layersChanged();
      }
      return;
    }
    if (doc_->board()->layers[l].kind == LayerKind::Copper) doc_->setActiveLayer(l);
  });
}

void LayersPanel::rebuild() {
  building_ = true;
  tree_->clear();
  if (doc_->hasBoard()) {
    const Board& b = *doc_->board();
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
      auto* it = new QTreeWidgetItem(tree_);
      it->setText(0, QString::fromStdString(b.layers[l].name));
      it->setData(0, Qt::UserRole, int(l));
      it->setFlags(it->flags() | Qt::ItemIsUserCheckable);
      it->setCheckState(0, doc_->layerViews()[l].visible ? Qt::Checked : Qt::Unchecked);
      it->setBackground(1, doc_->layerViews()[l].color);
      QFont f = it->font(0);
      f.setBold(l == doc_->activeLayer());
      it->setFont(0, f);
    }
  }
  building_ = false;
}

// ---------------------------------------------------------------- nets

NetsPanel::NetsPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  filter_ = new QLineEdit(this);
  filter_->setPlaceholderText(tr("Filter nets"));
  list_ = new QListWidget(this);
  lay->addWidget(filter_);
  lay->addWidget(list_);
  connect(doc_, &Document::boardReplaced, this, &NetsPanel::rebuild);
  connect(doc_, &Document::boardChanged, this, &NetsPanel::rebuild);
  connect(filter_, &QLineEdit::textChanged, this, &NetsPanel::rebuild);
  connect(list_, &QListWidget::currentItemChanged, this, [this](QListWidgetItem* it) {
    doc_->setHighlightedNet(it ? it->data(Qt::UserRole).toInt() : kNoNet);
  });
}

void NetsPanel::rebuild() {
  list_->clear();
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  std::vector<int> unrouted(b.nets.size(), 0);
  for (auto& r : doc_->connectivity().ratsnest) unrouted[r.net]++;
  QString f = filter_->text();
  for (int i = 0; i < int(b.nets.size()); ++i) {
    QString name = QString::fromStdString(b.nets[i].name);
    if (!f.isEmpty() && !name.contains(f, Qt::CaseInsensitive)) continue;
    auto* it = new QListWidgetItem(unrouted[i] ? QString("%1  (%2)").arg(name).arg(unrouted[i]) : name, list_);
    it->setData(Qt::UserRole, i);
    if (unrouted[i]) it->setForeground(QColor(0xff, 0xa0, 0x40));
  }
}

// ---------------------------------------------------------------- drc

DrcPanel::DrcPanel(Document* doc, BoardView* view, QWidget* parent) : QWidget(parent), doc_(doc), view_(view) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  auto* run = new QPushButton(tr("Run DRC"), this);
  list_ = new QListWidget(this);
  lay->addWidget(run);
  lay->addWidget(list_);
  connect(run, &QPushButton::clicked, this, &DrcPanel::runRequested);
  connect(doc_, &Document::drcChanged, this, &DrcPanel::rebuild);
  connect(list_, &QListWidget::itemClicked, this, [this](QListWidgetItem* it) {
    int i = it->data(Qt::UserRole).toInt();
    if (i >= 0 && i < int(doc_->drc().size())) view_->centerOn(doc_->drc()[i].pos, 10);
  });
}

void DrcPanel::rebuild() {
  list_->clear();
  for (int i = 0; i < int(doc_->drc().size()); ++i) {
    const auto& v = doc_->drc()[i];
    auto* it = new QListWidgetItem(QString("[%1] %2").arg(drcTypeName(v.type)).arg(QString::fromStdString(v.message)), list_);
    it->setData(Qt::UserRole, i);
  }
  if (doc_->drc().empty() && doc_->hasBoard()) list_->addItem(tr("No violations"));
}

// ---------------------------------------------------------------- properties

PropertiesPanel::PropertiesPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  text_ = new QTextBrowser(this);
  lay->addWidget(text_);
  connect(doc_, &Document::selectionChanged, this, &PropertiesPanel::rebuild);
  connect(doc_, &Document::boardChanged, this, &PropertiesPanel::rebuild);
}

void PropertiesPanel::rebuild() {
  if (!doc_->hasBoard()) { text_->clear(); return; }
  const Board& b = *doc_->board();
  std::string s;
  auto net = [&](int n) { return n >= 0 ? b.nets[n].name : std::string("-"); };
  for (int ci : doc_->selectedComponents()) {
    const Component& c = b.components[ci];
    s += std::format("<b>{}</b> {}<br>footprint: {}<br>at ({:.3f}, {:.3f}) mm, {:.1f}°, {}<br>pads: {}<br><br>", c.ref, c.value,
                     c.footprint, c.pos.x / 1e6, c.pos.y / 1e6, c.angle, c.side == Side::Bottom ? "bottom" : "top",
                     c.pads.size());
  }
  for (ItemRef r : doc_->selectedItems()) {
    switch (r.type) {
      case ItemType::Track: {
        const Track& t = b.tracks[r.index];
        double len = t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : (t.b.v() - t.a.v()).len();
        s += std::format("<b>{}</b> net {}<br>layer {}, width {:.3f} mm, length {:.3f} mm<br>({:.3f}, {:.3f}) - ({:.3f}, {:.3f})<br><br>",
                         t.isArc() ? "Arc" : "Track", net(t.net), b.layers[t.layer].name, t.width / 1e6, len / 1e6,
                         t.a.x / 1e6, t.a.y / 1e6, t.b.x / 1e6, t.b.y / 1e6);
        break;
      }
      case ItemType::Via: {
        const Via& v = b.vias[r.index];
        s += std::format("<b>Via</b> net {}<br>at ({:.3f}, {:.3f}) mm, {:.3f}/{:.3f} mm<br><br>", net(v.net), v.pos.x / 1e6,
                         v.pos.y / 1e6, v.diameter / 1e6, v.drill / 1e6);
        break;
      }
      case ItemType::Pad: {
        const Pad& p = b.pads[r.index];
        s += std::format("<b>Pad {}</b> net {}<br>at ({:.3f}, {:.3f}) mm, {:.3f} x {:.3f} mm, drill {:.3f}<br><br>", p.number,
                         net(p.net), p.pos.x / 1e6, p.pos.y / 1e6, p.shape.w / 1e6, p.shape.h / 1e6, p.drill / 1e6);
        break;
      }
      default: break;
    }
  }
  if (s.empty()) {
    const auto& c = doc_->connectivity();
    s = std::format("<b>{}</b><br>{} components, {} pads, {} nets<br>{} tracks, {} vias<br>{} unrouted connection(s)",
                    b.name, b.components.size(), b.pads.size(), b.nets.size(), b.tracks.size(), b.vias.size(),
                    c.ratsnest.size());
  }
  text_->setHtml(QString::fromStdString(s));
}

}  // namespace xr::gui
