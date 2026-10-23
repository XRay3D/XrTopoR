#include "gui/Panels.h"

#include <QColorDialog>
#include <QDate>
#include <QFileInfo>
#include <QTabWidget>
#include <QHeaderView>
#include <QPushButton>
#include <QVBoxLayout>
#include <format>

#include "gui/AppSettings.h"
#include "gui/BoardView.h"

namespace xr::gui {

// ---------------------------------------------------------------- layers

LayersPanel::LayersPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  tree_ = new QTreeWidget(this);
  tree_->setColumnCount(2);
  tree_->setHeaderLabels({tr("Слой"), tr("Цвет")});
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
      QColor c = QColorDialog::getColor(doc_->layerViews()[l].color, this, tr("Цвет слоя"));
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
  filter_->setPlaceholderText(tr("Поиск цепи"));
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
  list_ = new QListWidget(this);
  lay->addWidget(list_);
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
    auto* it = new QListWidgetItem(QString::fromStdString(v.message), list_);
    it->setData(Qt::UserRole, i);
    it->setForeground(v.type == DrcViolation::Type::Unconnected ? QColor(0xd0, 0, 0) : QColor(0xc0, 0, 0xc0));
  }
  if (doc_->drc().empty() && doc_->hasBoard()) list_->addItem(tr("Нарушений нет"));
}

// ---------------------------------------------------------------- project

ProjectPanel::ProjectPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  auto* tabs = new QTabWidget(this);
  project_ = new QTreeWidget(tabs);
  history_ = new QTreeWidget(tabs);
  for (auto* t : {project_, history_}) t->setHeaderHidden(true);
  tabs->addTab(project_, tr("Проект"));
  tabs->addTab(history_, tr("История"));
  lay->addWidget(tabs);
  connect(doc_, &Document::boardReplaced, this, &ProjectPanel::rebuildProject);
  connect(history_, &QTreeWidget::itemDoubleClicked, this, [this](QTreeWidgetItem* it) {
    if (QString p = it->data(0, Qt::UserRole).toString(); !p.isEmpty()) emit openRequested(p);
  });
  rebuildProject();
  refreshHistory();
}

void ProjectPanel::rebuildProject() {
  project_->clear();
  if (!doc_->hasBoard()) return;
  QFileInfo fi(doc_->path());
  auto* root = new QTreeWidgetItem(project_, {fi.completeBaseName()});
  auto* docs = new QTreeWidgetItem(root, {tr("Документы")});
  auto* file = new QTreeWidgetItem(docs, {fi.fileName()});
  QFont f = file->font(0);
  f.setBold(true);
  file->setFont(0, f);
  file->setToolTip(0, fi.absoluteFilePath());
  new QTreeWidgetItem(root, {tr("Варианты автотрассировки")});
  project_->expandAll();
}

void ProjectPanel::refreshHistory() {
  history_->clear();
  QDate today = QDate::currentDate();
  QTreeWidgetItem* group = nullptr;
  QString groupName;
  for (const RecentFile& r : AppSettings::recentFiles()) {
    qint64 days = r.opened.date().daysTo(today);
    QString g = days <= 0 ? tr("Сегодня") : days == 1 ? tr("Вчера") : days < 7 ? tr("На этой неделе") : tr("Ранее");
    if (g != groupName) {
      group = new QTreeWidgetItem(history_, {g});
      groupName = g;
    }
    auto* it = new QTreeWidgetItem(group, {QFileInfo(r.path).fileName()});
    it->setData(0, Qt::UserRole, r.path);
    it->setToolTip(0, r.path);
  }
  history_->expandAll();
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
    s += std::format("<b>Компонент {}</b> {}<br>Посадочное место: {}<br>x: {:.3f}, y: {:.3f} мм, угол {:.1f}°, {}<br>"
                     "Контактов: {}{}<br><br>",
                     c.ref, c.value, c.footprint, c.pos.x / 1e6, -c.pos.y / 1e6, c.angle,
                     c.side == Side::Bottom ? "Bottom" : "Top", c.pads.size(), c.locked ? "<br>Зафиксирован" : "");
  }
  for (ItemRef r : doc_->selectedItems()) {
    switch (r.type) {
      case ItemType::Track: {
        const Track& t = b.tracks[r.index];
        double len = t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : (t.b.v() - t.a.v()).len();
        s += std::format("<b>Проводник</b>{}<br>Цепь: {}<br>Слой: {}<br>Ширина: {:.3f} мм, длина: {:.3f} мм<br>"
                         "({:.3f}; {:.3f}) – ({:.3f}; {:.3f}){}<br><br>",
                         t.isArc() ? " (дуга)" : "", net(t.net), b.layers[t.layer].name, t.width / 1e6, len / 1e6,
                         t.a.x / 1e6, -t.a.y / 1e6, t.b.x / 1e6, -t.b.y / 1e6, t.locked ? "<br>Зафиксирован" : "");
        break;
      }
      case ItemType::Via: {
        const Via& v = b.vias[r.index];
        s += std::format("<b>Переход</b><br>Цепь: {}<br>x: {:.3f}, y: {:.3f} мм<br>Площадка {:.3f} мм, отверстие {:.3f} мм{}<br><br>",
                         net(v.net), v.pos.x / 1e6, -v.pos.y / 1e6, v.diameter / 1e6, v.drill / 1e6,
                         v.locked ? "<br>Зафиксирован" : "");
        break;
      }
      case ItemType::Pad: {
        const Pad& p = b.pads[r.index];
        s += std::format("<b>Контакт {}</b><br>Цепь: {}<br>x: {:.3f}, y: {:.3f} мм<br>{:.3f} x {:.3f} мм, отверстие {:.3f} мм<br><br>",
                         p.number, net(p.net), p.pos.x / 1e6, -p.pos.y / 1e6, p.shape.w / 1e6, p.shape.h / 1e6, p.drill / 1e6);
        break;
      }
      default: break;
    }
  }
  if (s.empty()) s = "<b><font color=\"#3060a0\">Нет выделенных объектов</font></b>";
  text_->setHtml(QString::fromStdString(s));
}

}  // namespace xr::gui
