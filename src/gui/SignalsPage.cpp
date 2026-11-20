#include "gui/SignalsPage.h"

#include <QComboBox>
#include <QFormLayout>
#include <QLabel>
#include <QMessageBox>
#include <QToolButton>
#include <QVBoxLayout>

#include "core/Signals.h"
#include "gui/GroupExplorer.h"
#include "gui/SignalDialogs.h"
#include "gui/SpinBox.h"

namespace xr::gui {

namespace sg = xr::sig;

std::string signalId(const ObjectSignal& o) {
  return (o.kind == ObjectSignal::Kind::DiffSignal ? "d:" : o.kind == ObjectSignal::Kind::SignalGroup ? "g:" : "s:") + o.name;
}

ObjectSignal signalOf(const std::string& id) {
  const ObjectSignal::Kind k = id.starts_with("d:") ? ObjectSignal::Kind::DiffSignal : id.starts_with("g:") ? ObjectSignal::Kind::SignalGroup
                                                                                                           : ObjectSignal::Kind::Signal;
  return {k, id.size() > 2 ? id.substr(2) : std::string()};
}

namespace {

// The signals and their groups (HiSpeed::groups: a group's members are signals, pairs and groups).
class SignalSource : public GroupSource {
 public:
  SignalSource(const Board& b, HiSpeed& h, DesignRules& rules) : b_(b), h_(h), rules_(rules) {}
  QString allTitle() const override { return QObject::tr("Все сигналы"); }
  QString groupTitle(const QString& name) const override { return QObject::tr("Группа сигналов %1").arg(name); }
  std::vector<Object> objects() const override {
    std::vector<Object> out;
    for (const ObjectSignal& o : sg::listedObjects(h_)) {
      Object x{signalId(o), QString::fromStdString(o.name), {}, o.kind == ObjectSignal::Kind::DiffSignal ? diffSignalIcon() : signalIcon()};
      if (o.kind == ObjectSignal::Kind::DiffSignal) {
        const DiffSignal& d = h_.diffSignals[size_t(h_.diffSignal(o.name))];
        x.tip = QObject::tr("Дифф. сигнал %1: %2, %3").arg(x.text, QString::fromStdString(d.signalA), QString::fromStdString(d.signalB));
      } else if (const SignalCluster* c = h_.clusterOf(o.name)) {
        auto s = r::find(c->signalList, o.name, &Signal::name);
        x.tip = QObject::tr("Сигнал %1: %2-%3 → %4-%5")
                    .arg(x.text, QString::fromStdString(c->source.comp), QString::fromStdString(c->source.pin), QString::fromStdString(s->receiver.comp),
                         QString::fromStdString(s->receiver.pin));
      }
      out.push_back(std::move(x));
    }
    return out;
  }
  std::vector<std::string> groups() const override {
    std::vector<std::string> out;
    for (const SignalGroup& g : h_.groups) out.push_back(g.name);
    return out;
  }
  std::vector<std::string> members(const std::string& g) const override {
    std::vector<std::string> out;
    if (const SignalGroup* x = find(g))
      for (const ObjectSignal& o : x->members)
        if (o.kind != ObjectSignal::Kind::SignalGroup) out.push_back(signalId(o));
    return out;
  }
  std::vector<std::string> subgroups(const std::string& g) const override {
    std::vector<std::string> out;
    if (const SignalGroup* x = find(g))
      for (const ObjectSignal& o : x->members)
        if (o.kind == ObjectSignal::Kind::SignalGroup) out.push_back(o.name);
    return out;
  }
  void addGroup(const std::string& name) override { h_.groups.push_back({name, {}}); }
  bool renameGroup(const std::string& old, const std::string& name) override {
    return sg::renameObject(h_, &rules_, {ObjectSignal::Kind::SignalGroup, old}, name).empty();
  }
  void removeGroup(const std::string& name) override { sg::removeObjects(h_, &rules_, {{ObjectSignal::Kind::SignalGroup, name}}); }
  void setMembers(const std::string& g, const std::vector<std::string>& ids) override {
    SignalGroup* x = find(g);
    if (!x) return;
    std::erase_if(x->members, [](const ObjectSignal& o) { return o.kind != ObjectSignal::Kind::SignalGroup; });
    for (auto& id : ids) x->members.push_back(signalOf(id));
  }
  void setSubgroups(const std::string& g, const std::vector<std::string>& names) override {
    SignalGroup* x = find(g);
    if (!x) return;
    std::erase_if(x->members, [](const ObjectSignal& o) { return o.kind == ObjectSignal::Kind::SignalGroup; });
    for (auto& n : names) x->members.push_back({ObjectSignal::Kind::SignalGroup, n});
  }
  bool renamable() const override { return true; }
  bool renameObject(const std::string& id, const std::string& name) override { return sg::renameObject(h_, &rules_, signalOf(id), name).empty(); }

 private:
  SignalGroup* find(const std::string& g) const {
    auto it = r::find(h_.groups, g, &SignalGroup::name);
    return it == h_.groups.end() ? nullptr : &*it;
  }
  [[maybe_unused]] const Board& b_;
  HiSpeed& h_;
  DesignRules& rules_;
};

QToolButton* taskButton(const QString& text, QIcon icon, const char* name) {
  auto* b = new QToolButton;
  b->setText(text);
  b->setIcon(icon);
  b->setObjectName(name);
  b->setToolButtonStyle(Qt::ToolButtonTextBesideIcon);
  b->setAutoRaise(true);
  b->setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
  return b;
}

}  // namespace

SignalsPage::SignalsPage(Document* doc, HiSpeed& hispeed, DesignRules& rules, std::function<void()> changed, QWidget* parent)
    : QWidget(parent), doc_(doc), h_(hispeed), rules_(rules), changed_(std::move(changed)) {
  auto* v = new QVBoxLayout(this);
  v->setContentsMargins(0, 0, 0, 0);
  explorer_ = new GroupExplorer(std::make_unique<SignalSource>(*doc_->board(), h_, rules_), this);
  v->addWidget(explorer_);
  connect(explorer_, &GroupExplorer::edited, this, [this] { changed_(); });
  connect(explorer_, &GroupExplorer::selectionChanged, this, &SignalsPage::selectionChanged);

  QVBoxLayout* side = explorer_->side();
  // «Задачи».
  auto* tasks = section(tr("Задачи"), side);
  auto* tv = new QVBoxLayout(tasks);
  tv->setContentsMargins(2, 2, 2, 2);
  tv->setSpacing(0);
  auto* create = taskButton(tr("Создать сигнал"), signalIcon(), "createSignal");
  auto* buses = taskButton(tr("Поиск шин"), folderIcon(), "searchBuses");
  auto* pairs = taskButton(tr("Поиск дифф. сигналов"), diffSignalIcon(), "searchPairs");
  auto* settings = taskButton(tr("Настройки поиска"), style()->standardIcon(QStyle::SP_FileDialogDetailedView), "searchSettings");
  for (auto* b : {create, buses, pairs, settings}) tv->addWidget(b);
  connect(create, &QToolButton::clicked, this, &SignalsPage::createSignal);
  connect(buses, &QToolButton::clicked, this, &SignalsPage::searchBuses);
  connect(pairs, &QToolButton::clicked, this, &SignalsPage::searchDiffPairs);
  connect(settings, &QToolButton::clicked, this, &SignalsPage::searchSettings);
  // «Действия».
  auto* actions = section(tr("Действия"), side);
  auto* av = new QVBoxLayout(actions);
  av->setContentsMargins(2, 2, 2, 2);
  av->setSpacing(0);
  links_ = taskButton(tr("Задать топологию"), style()->standardIcon(QStyle::SP_FileDialogListView), "setLinks");
  light_ = taskButton(tr("Подсветить"), style()->standardIcon(QStyle::SP_DialogYesButton), "highlight");
  remove_ = taskButton(tr("Удалить"), style()->standardIcon(QStyle::SP_DialogDiscardButton), "remove");
  join_ = taskButton(tr("Объединить в дифф. сигнал"), diffSignalIcon(), "join");
  split_ = taskButton(tr("Разделить"), signalIcon(), "split");
  for (auto* b : {links_, light_, remove_, join_, split_}) av->addWidget(b);
  connect(links_, &QToolButton::clicked, this, &SignalsPage::setLinks);
  connect(light_, &QToolButton::clicked, this, &SignalsPage::highlight);
  connect(remove_, &QToolButton::clicked, this, &SignalsPage::removeSelected);
  connect(join_, &QToolButton::clicked, this, &SignalsPage::joinSelected);
  connect(split_, &QToolButton::clicked, this, &SignalsPage::splitSelected);
  // «Свойства».
  props_ = section(tr("Свойства"), side);
  form_ = new QFormLayout(props_);
  form_->setContentsMargins(4, 4, 4, 4);
  form_->setRowWrapPolicy(QFormLayout::DontWrapRows);
  form_->setVerticalSpacing(2);
  side->addStretch(1);
  explorer_->showSide(230);
  selectionChanged();
}

QWidget* SignalsPage::section(const QString& title, QVBoxLayout* into) {
  // TopoR's panel: a bar with the title, the content under it.
  auto* bar = new QLabel(title);
  bar->setObjectName("section");
  bar->setStyleSheet("QLabel { background: #6d86d8; color: white; font-weight: bold; padding: 2px 6px; }");
  into->addWidget(bar);
  auto* body = new QWidget;
  into->addWidget(body);
  return body;
}

std::vector<ObjectSignal> SignalsPage::selected() const {
  std::vector<ObjectSignal> out;
  for (auto& id : explorer_->selectedIds()) out.push_back(signalOf(id));
  return out;
}

void SignalsPage::edited() {
  explorer_->refresh();
  changed_();
  selectionChanged();
}

void SignalsPage::selectionChanged() {
  const auto sel = selected();
  const auto count = [&](ObjectSignal::Kind k) { return r::count(sel, k, &ObjectSignal::kind); };
  const auto signals_ = count(ObjectSignal::Kind::Signal), pairs = count(ObjectSignal::Kind::DiffSignal);
  links_->setEnabled(sel.size() == 1);
  light_->setEnabled(!sel.empty());
  remove_->setEnabled(!sel.empty());
  join_->setVisible(signals_ == 2 && sel.size() == 2);
  split_->setVisible(pairs == 1 && sel.size() == 1);
  links_->setVisible(!sel.empty());
  light_->setVisible(!sel.empty());
  remove_->setVisible(!sel.empty());

  // «Свойства».
  while (form_->rowCount()) form_->removeRow(0);
  if (sel.empty() || (signals_ && pairs)) return;
  const Board& b = *doc_->board();
  const bool one = sel.size() == 1;
  auto value = [](const QString& text) {
    auto* l = new QLabel(text);
    l->setTextInteractionFlags(Qt::TextSelectableByMouse);
    return l;
  };
  auto netOf = [&](const PinRef& p) {
    auto pad = sg::padOf(b, p);
    return pad && b.pads[size_t(*pad)].net >= 0 ? QString::fromStdString(b.nets[size_t(b.pads[size_t(*pad)].net)].name) : QString("-");
  };
  // The impedance: the rules of the kind; what the selection shares, else none chosen.
  auto impedance = [&](bool diff) {
    auto* c = new QComboBox;
    c->setObjectName("impedance");
    std::string common = sg::impedanceOf(h_, sel[0]);
    for (auto& o : sel)
      if (sg::impedanceOf(h_, o) != common) common.clear();
    for (const Impedance& z : h_.impedances)
      if (z.diff == diff) c->addItem(QString::fromStdString(z.name));
    if (!common.empty() && c->findText(QString::fromStdString(common)) < 0) c->addItem(QString::fromStdString(common));
    c->setCurrentIndex(c->findText(QString::fromStdString(common)));
    connect(c, &QComboBox::activated, this, [this, c] {
      for (auto& o : selected()) sg::setImpedance(h_, o, c->currentText().toStdString());
      changed_();
    });
    return c;
  };
  if (signals_) {
    const SignalCluster* c = one ? h_.clusterOf(sel[0].name) : nullptr;
    const Signal* s = c ? &*r::find(c->signalList, sel[0].name, &Signal::name) : nullptr;
    form_->addRow(new QLabel(tr("<b>Источник</b>")));
    form_->addRow(tr("цепь:"), value(c ? netOf(c->source) : "-"));
    form_->addRow(tr("контакт:"), value(c ? QString::fromStdString(c->source.comp + "-" + c->source.pin) : "-"));
    form_->addRow(new QLabel(tr("<b>Приёмник</b>")));
    form_->addRow(tr("цепь:"), value(s ? netOf(s->receiver) : "-"));
    form_->addRow(tr("контакт:"), value(s ? QString::fromStdString(s->receiver.comp + "-" + s->receiver.pin) : "-"));
    form_->addRow(new QLabel(tr("Волновое сопротивление:")));
    form_->addRow(impedance(false));
    return;
  }
  // Pairs.
  if (one) {
    const DiffSignal& d = h_.diffSignals[size_t(h_.diffSignal(sel[0].name))];
    form_->addRow(new QLabel(tr("<b>Сигналы</b>")));
    form_->addRow(value(QString::fromStdString(d.signalA + "\n" + d.signalB)));
  }
  form_->addRow(new QLabel(tr("Волновое сопротивление:")));
  form_->addRow(impedance(true));
  auto* mismatch = new DoubleSpinBox;
  mismatch->setObjectName("mismatch");
  const Unit u = doc_->unit();
  mismatch->setDecimals(u == Unit::Mil ? 3 : 4);
  mismatch->setRange(0, 1e6);
  mismatch->setSuffix(" " + unitName(u));
  const Coord common = h_.diffSignals[size_t(h_.diffSignal(sel[0].name))].mismatch;
  mismatch->setValue(toUnit(double(common), u));
  connect(mismatch, &QDoubleSpinBox::valueChanged, this, [this, u](double v) {
    for (auto& o : selected())
      if (int i = h_.diffSignal(o.name); i >= 0) h_.diffSignals[size_t(i)].mismatch = Coord(std::llround(fromUnit(v, u)));
    changed_();
  });
  form_->addRow(new QLabel(tr("Допустимый разброс:")));
  form_->addRow(mismatch);
}

void SignalsPage::highlight() {
  const Board& b = *doc_->board();
  std::vector<int> nets;
  for (auto& o : selected())
    for (auto& n : h_.netsOf(o))
      if (int i = b.findNet(n); i >= 0 && !r::contains(nets, i)) nets.push_back(i);
  doc_->setHighlightedNets(std::move(nets));
}

void SignalsPage::removeSelected() {
  const auto sel = selected();
  if (sel.empty()) return;
  sg::removeObjects(h_, &rules_, sel);
  edited();
}

void SignalsPage::joinSelected() {
  const auto sel = selected();
  if (sel.size() != 2) return;
  const std::string why = sg::canJoinDiff(*doc_->board(), h_, sel[0].name, sel[1].name);
  if (!why.empty()) {
    QMessageBox::information(this, tr("Объединить в дифф. сигнал"), tr("Нельзя объединить сигналы: %1.").arg(QString::fromStdString(why)));
    return;
  }
  const int d = sg::joinDiff(*doc_->board(), h_, sel[0].name, sel[1].name);
  edited();
  if (d >= 0) explorer_->selectIds({signalId({ObjectSignal::Kind::DiffSignal, h_.diffSignals[size_t(d)].name})});
}

void SignalsPage::splitSelected() {
  const auto sel = selected();
  if (sel.size() != 1 || sel[0].kind != ObjectSignal::Kind::DiffSignal) return;
  const DiffSignal d = h_.diffSignals[size_t(h_.diffSignal(sel[0].name))];
  sg::splitDiff(h_, &rules_, sel[0].name);
  edited();
  explorer_->selectIds({signalId({ObjectSignal::Kind::Signal, d.signalA}), signalId({ObjectSignal::Kind::Signal, d.signalB})});
}

void SignalsPage::setLinks() {
  const auto sel = selected();
  if (sel.size() != 1) return;
  // The cluster of the signal (of a pair: of its positive signal).
  std::string signal = sel[0].name;
  if (sel[0].kind == ObjectSignal::Kind::DiffSignal) signal = h_.diffSignals[size_t(h_.diffSignal(signal))].signalA;
  auto it = r::find_if(h_.clusters, [&](const SignalCluster& c) { return r::contains(c.signalList, signal, &Signal::name); });
  if (it == h_.clusters.end()) return;
  SignalCluster c = *it;
  ClusterDialog dlg(doc_, h_, c, ClusterDialog::Mode::Links, this);
  if (dlg.exec() != QDialog::Accepted) return;
  *it = dlg.cluster();
  edited();
}

void SignalsPage::createSignal() {
  const auto source = pickSignalSource(this, doc_, h_);
  if (!source) return;
  const SignalSearch s = sg::searchOf(h_);
  auto r = sg::buildCluster(*doc_->board(), h_, *source, s);
  if (!r.cluster) {
    QMessageBox::information(this, tr("Создание сигналов"), QString::fromStdString(r.error));
    return;
  }
  ClusterDialog dlg(doc_, h_, *r.cluster, ClusterDialog::Mode::Create, this);
  if (dlg.exec() != QDialog::Accepted) return;
  dlg.applyTo(h_);
  edited();
}

void SignalsPage::searchBuses() {
  if (BusesDialog::run(this, doc_, h_, sg::findBuses(h_))) edited();
}

void SignalsPage::searchDiffPairs() {
  if (DiffPairsDialog::run(this, doc_, h_, sg::findDiffPairs(*doc_->board(), h_, sg::searchOf(h_)))) edited();
}

void SignalsPage::searchSettings() {
  if (SearchSettingsDialog::run(this, doc_, h_, &rules_)) changed_();
}

}  // namespace xr::gui
