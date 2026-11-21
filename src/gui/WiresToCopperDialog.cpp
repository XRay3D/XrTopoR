#include "gui/WiresToCopperDialog.h"

#include <QApplication>
#include <QDialogButtonBox>
#include <QGridLayout>
#include <QListView>
#include <QMenu>
#include <QPushButton>
#include <QRadioButton>
#include <QStringListModel>
#include <QToolButton>
#include <QVBoxLayout>

#include "gui/SignalDialogs.h"

namespace xr::gui {

WiresToCopperDialog::WiresToCopperDialog(Document* doc, QWidget* parent) : QDialog(parent), doc_(doc) {
  setWindowTitle(tr("Преобразование проводников в полигоны"));
  resize(420, 460);
  const Board& b = *doc_->board();
  auto* v = new QVBoxLayout(this);
  auto list = [&](const char* name, QStringListModel*& model) {
    model = new QStringListModel(this);
    auto* view = new QListView;
    view->setObjectName(name);
    view->setModel(model);
    view->setEditTriggers(QAbstractItemView::NoEditTriggers);
    view->setSelectionMode(QAbstractItemView::ExtendedSelection);
    return view;
  };
  auto tool = [&](const char* name, const QString& text) {
    auto* t = new QToolButton;
    t->setObjectName(name);
    t->setText(text);
    return t;
  };
  auto block = [&](QRadioButton* radio, QListView* view, QToolButton* plus, QToolButton* minus) {
    auto* g = new QGridLayout;
    g->addWidget(radio, 0, 0);
    g->addWidget(plus, 0, 1);
    g->addWidget(minus, 0, 2);
    g->addWidget(view, 1, 0, 1, 3);
    g->setColumnStretch(0, 1);
    v->addLayout(g, 1);
  };

  byNets_ = new QRadioButton(tr("Цепи:"));
  byNets_->setObjectName("byNets");
  byNets_->setChecked(true);
  netsView_ = list("nets", nets_);
  addNet_ = tool("addNet", "+");
  addNet_->setPopupMode(QToolButton::InstantPopup);
  auto* netMenu = new QMenu(addNet_);
  netMenu->addAction(tr("Цепи..."), this, [this, &b] {
    std::vector<std::string> rest;
    for (const Net& n : b.nets)
      if (!nets_->stringList().contains(QString::fromStdString(n.name))) rest.push_back(n.name);
    add(nets_, pickNamesToTick(this, tr("Цепи"), rest));
  });
  netMenu->addAction(tr("Группы цепей..."), this, [this, &b] {
    if (!b.rules) return;
    std::vector<std::string> groups;
    for (const NetGroup& g : b.rules->netGroups) groups.push_back(g.name);
    for (const std::string& g : pickNamesToTick(this, tr("Группы цепей"), groups)) add(nets_, b.rules->netsOf(g));
  });
  netMenu->addAction(tr("Все цепи"), this, [this, &b] {
    std::vector<std::string> names;
    for (const Net& n : b.nets) names.push_back(n.name);
    add(nets_, names);
  });
  addNet_->setMenu(netMenu);
  removeNet_ = tool("removeNet", QString::fromUtf8("\u2212"));
  connect(removeNet_, &QToolButton::clicked, this, [this] { removeSelected(netsView_, nets_); });
  block(byNets_, netsView_, addNet_, removeNet_);

  byLayers_ = new QRadioButton(tr("Все проводники на слое:"));
  byLayers_->setObjectName("byLayers");
  layersView_ = list("layers", layers_);
  addLayer_ = tool("addLayer", "+");
  addLayer_->setPopupMode(QToolButton::InstantPopup);
  auto* layerMenu = new QMenu(addLayer_);
  for (LayerId l : b.copperLayers()) {
    const std::string name = b.layers[size_t(l)].name;
    layerMenu->addAction(QString::fromStdString(name), this, [this, name] { add(layers_, {name}); });
  }
  addLayer_->setMenu(layerMenu);
  removeLayer_ = tool("removeLayer", QString::fromUtf8("\u2212"));
  connect(removeLayer_, &QToolButton::clicked, this, [this] { removeSelected(layersView_, layers_); });
  block(byLayers_, layersView_, addLayer_, removeLayer_);

  auto* box = new QDialogButtonBox;
  QPushButton* go = box->addButton(tr("Преобразовать"), QDialogButtonBox::AcceptRole);
  go->setObjectName("convert");
  box->addButton(tr("Отмена"), QDialogButtonBox::RejectRole);
  connect(box, &QDialogButtonBox::accepted, this, &QDialog::accept);
  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  v->addWidget(box);
  connect(byNets_, &QRadioButton::toggled, this, &WiresToCopperDialog::sync);
  sync();
}

void WiresToCopperDialog::sync() {
  const bool layers = byLayers_->isChecked();
  for (QWidget* w : std::initializer_list<QWidget*>{netsView_, addNet_, removeNet_}) w->setEnabled(!layers);
  for (QWidget* w : std::initializer_list<QWidget*>{layersView_, addLayer_, removeLayer_}) w->setEnabled(layers);
}

void WiresToCopperDialog::add(QStringListModel* m, const std::vector<std::string>& names) {
  QStringList have = m->stringList();
  for (const std::string& n : names)
    if (const QString q = QString::fromStdString(n); !have.contains(q)) have << q;
  m->setStringList(have);
}

void WiresToCopperDialog::removeSelected(QListView* v, QStringListModel* m) {
  QStringList have = m->stringList(), gone;
  for (const QModelIndex& i : v->selectionModel()->selectedIndexes()) gone << i.data().toString();
  for (const QString& g : gone) have.removeAll(g);
  m->setStringList(have);
}

void WiresToCopperDialog::setByLayers(bool on) { (on ? byLayers_ : byNets_)->setChecked(true); }
void WiresToCopperDialog::setNets(const QStringList& names) { nets_->setStringList(names); }
void WiresToCopperDialog::setLayers(const QStringList& names) { layers_->setStringList(names); }
QStringList WiresToCopperDialog::nets() const { return nets_->stringList(); }
QStringList WiresToCopperDialog::layers() const { return layers_->stringList(); }

WiresToCopper WiresToCopperDialog::what() const {
  WiresToCopper w;
  const Board& b = *doc_->board();
  if (byLayers_->isChecked()) {
    for (const QString& n : layers_->stringList())
      if (LayerId l = b.findLayer(n.toStdString()); l >= 0) w.layers.push_back(l);
  } else {
    for (const QString& n : nets_->stringList())
      if (int net = b.findNet(n.toStdString()); net >= 0) w.nets.push_back(net);
  }
  return w;
}

bool WiresToCopperDialog::convert() {
  const WiresToCopper w = what();
  if (w.nets.empty() && w.layers.empty()) return false;
  const QString group = tr("Проводники в полигоны");
  QApplication::setOverrideCursor(Qt::WaitCursor);
  auto before = doc_->beginEdit();
  const WiresToCopperResult r = wiresToCopper(*doc_->board(), w);
  QApplication::restoreOverrideCursor();
  doc_->clearLog(group);
  if (!r.wires && r.kept.empty()) {
    doc_->addLog({LogMessage::Kind::Info, group, tr("У выбранных цепей и слоёв нет проводников для преобразования")});
    return false;
  }
  doc_->addLog({LogMessage::Kind::Info, group, tr("Преобразовано проводников: %1, областей металлизации: %2").arg(r.wires).arg(r.areas)});
  if (!r.kept.empty()) {
    QStringList names;
    for (int n : r.kept) names << QString::fromStdString(doc_->board()->nets[size_t(n)].name);
    doc_->addLog({LogMessage::Kind::Warning, group,
                  tr("Оставлены проводниками (область не удержала бы соединение): %1").arg(names.join(", "))});
  }
  if (!r.wires) return false;
  doc_->clearSelection();
  doc_->invalidateModel();
  doc_->commitEdit(before, tr("Преобразовать проводники в области металлизации"), false);
  return true;
}

void WiresToCopperDialog::run(Document* doc, QWidget* parent) {
  if (!doc->hasBoard()) return;
  WiresToCopperDialog d(doc, parent);
  // The nets of the wires selected are offered.
  QStringList names;
  for (const ItemRef& r : doc->selectedItems())
    if (r.type == ItemType::Track)
      if (int net = doc->board()->tracks[size_t(r.index)].net; net >= 0)
        if (const QString n = QString::fromStdString(doc->board()->nets[size_t(net)].name); !names.contains(n)) names << n;
  d.setNets(names);
  if (d.exec() == QDialog::Accepted) d.convert();
}

}  // namespace xr::gui
