#include "gui/WiresToCopperDialog.h"

#include <QApplication>
#include <QDialogButtonBox>
#include <QHBoxLayout>
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
  resize(420, 400);
  const Board& b = *doc_->board();
  auto* v = new QVBoxLayout(this);
  // The two choices on top, one list under them for the one in force (each keeps its own names), and one row of
  // buttons at the bottom: «+» with the menu of that choice, «−», «Преобразовать», «Отмена».
  byNets_ = new QRadioButton(tr("Цепи:"));
  byNets_->setObjectName("byNets");
  byNets_->setChecked(true);
  byLayers_ = new QRadioButton(tr("Все проводники на слое:"));
  byLayers_->setObjectName("byLayers");
  auto* choice = new QHBoxLayout;
  choice->addWidget(byNets_);
  choice->addWidget(byLayers_);
  choice->addStretch(1);
  v->addLayout(choice);
  nets_ = new QStringListModel(this);
  layers_ = new QStringListModel(this);
  list_ = new QListView;
  list_->setObjectName("items");
  list_->setEditTriggers(QAbstractItemView::NoEditTriggers);
  list_->setSelectionMode(QAbstractItemView::ExtendedSelection);
  v->addWidget(list_, 1);
  add_ = new QToolButton;
  add_->setObjectName("add");
  add_->setText("+");
  add_->setPopupMode(QToolButton::InstantPopup);
  remove_ = new QToolButton;
  remove_->setObjectName("remove");
  remove_->setText(QString::fromUtf8("\u2212"));
  connect(remove_, &QToolButton::clicked, this, [this] { removeSelected(list_, current()); });

  netMenu_ = new QMenu(add_);
  netMenu_->setObjectName("netMenu");
  netMenu_->addAction(tr("Цепи..."), this, [this, &b] {
    std::vector<std::string> rest;
    for (const Net& n : b.nets)
      if (!nets_->stringList().contains(QString::fromStdString(n.name))) rest.push_back(n.name);
    add(nets_, pickNamesToTick(this, tr("Выберите цепи"), rest));
  });
  netMenu_->addAction(tr("Группы цепей..."), this, [this, &b] {
    if (!b.rules) return;
    std::vector<std::string> groups;
    for (const NetGroup& g : b.rules->netGroups) groups.push_back(g.name);
    for (const std::string& g : pickNamesToTick(this, tr("Выберите группы цепей"), groups)) add(nets_, b.rules->netsOf(g));
  });
  netMenu_->addAction(tr("Все цепи"), this, [this, &b] {
    std::vector<std::string> names;
    for (const Net& n : b.nets) names.push_back(n.name);
    add(nets_, names);
  });

  layerMenu_ = new QMenu(add_);
  layerMenu_->setObjectName("layerMenu");
  std::vector<std::string> copper;
  for (LayerId l : b.copperLayers()) copper.push_back(b.layers[size_t(l)].name);
  layerMenu_->addAction(tr("Все слои"), this, [this, copper] { add(layers_, copper); });
  layerMenu_->addAction(tr("Внешние слои"), this, [this, copper] {
    if (!copper.empty()) add(layers_, copper.size() > 1 ? std::vector<std::string>{copper.front(), copper.back()} : copper);
  });
  layerMenu_->addSeparator();
  for (const std::string& name : copper) layerMenu_->addAction(QString::fromStdString(name), this, [this, name] { add(layers_, {name}); });
  layerMenu_->addSeparator();
  layerMenu_->addAction(tr("Набор слоев..."), this, [this, copper] {
    std::vector<std::string> rest;
    for (const std::string& n : copper)
      if (!layers_->stringList().contains(QString::fromStdString(n))) rest.push_back(n);
    add(layers_, pickNamesToTick(this, tr("Выберите слои"), rest, false));
  });

  // One row at the bottom: «+» and «−» of the list, then «Преобразовать» and «Отмена».
  auto* box = new QDialogButtonBox;
  convert_ = box->addButton(tr("Преобразовать"), QDialogButtonBox::AcceptRole);
  convert_->setObjectName("convert");
  box->addButton(tr("Отмена"), QDialogButtonBox::RejectRole);
  connect(box, &QDialogButtonBox::accepted, this, &QDialog::accept);
  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  auto* bar = new QHBoxLayout;
  bar->addWidget(add_);
  bar->addWidget(remove_);
  bar->addStretch(1);
  bar->addWidget(box);
  v->addLayout(bar);
  connect(byNets_, &QRadioButton::toggled, this, &WiresToCopperDialog::sync);
  for (QStringListModel* m : {nets_, layers_}) {
    connect(m, &QAbstractItemModel::modelReset, this, &WiresToCopperDialog::sync);
    connect(m, &QAbstractItemModel::rowsInserted, this, &WiresToCopperDialog::sync);
    connect(m, &QAbstractItemModel::rowsRemoved, this, &WiresToCopperDialog::sync);
  }
  sync();
}

QStringListModel* WiresToCopperDialog::current() const { return byLayers_->isChecked() ? layers_ : nets_; }

void WiresToCopperDialog::sync() {
  if (list_->model() != current()) list_->setModel(current());
  add_->setMenu(byLayers_->isChecked() ? layerMenu_ : netMenu_);
  remove_->setEnabled(current()->rowCount() > 0);
  convert_->setEnabled(current()->rowCount() > 0);  // (nothing chosen: nothing to convert)
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
  if (!r.areas) {
    doc_->addLog({LogMessage::Kind::Info, group, tr("У выбранных цепей и слоёв нет проводников, вокруг которых есть место для области")});
    return false;
  }
  doc_->addLog({LogMessage::Kind::Info, group, tr("Создано областей металлизации: %1, для цепей: %2").arg(r.areas).arg(r.nets)});
  doc_->clearSelection();
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
