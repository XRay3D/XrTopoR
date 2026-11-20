#include "gui/SettingsDialogs.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDialog>
#include <QDialogButtonBox>
#include <QGroupBox>
#include <QLabel>
#include <QListWidget>
#include <QPushButton>
#include <QRadioButton>
#include <QVBoxLayout>

namespace xr::gui {

namespace {

QDialogButtonBox* okCancel(QDialog* dlg, QBoxLayout* into) {
  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel, dlg);
  box->button(QDialogButtonBox::Cancel)->setText(QObject::tr("Отмена"));
  QObject::connect(box, &QDialogButtonBox::accepted, dlg, &QDialog::accept);
  QObject::connect(box, &QDialogButtonBox::rejected, dlg, &QDialog::reject);
  into->addWidget(box);
  return box;
}

// What each warning the filter switches is, and whether this program finds it.
struct Warning {
  int code;
  const char* text;
  bool found;
};
const Warning kWarnings[] = {
    {5003, QT_TRANSLATE_NOOP("QObject", "5003: цепь содержит контур (петлю)"), false},
    {5012, QT_TRANSLATE_NOOP("QObject", "5012: переход лежит на контуре платы"), true},
    {5013, QT_TRANSLATE_NOOP("QObject", "5013: контакт пересекает область металлизации"), true},
    {5014, QT_TRANSLATE_NOOP("QObject", "5014: переход лежит на области металлизации"), true},
    {5015, QT_TRANSLATE_NOOP("QObject", "5015: область металлизации пересекает контур платы"), false},
    {5016, QT_TRANSLATE_NOOP("QObject", "5016: области металлизации пересекаются"), false},
    {5017, QT_TRANSLATE_NOOP("QObject", "5017: зафиксированный проводник пересекает контакт"), true},
    {5018, QT_TRANSLATE_NOOP("QObject", "5018: зафиксированный проводник пересекает переход"), true},
    {5023, QT_TRANSLATE_NOOP("QObject", "5023: контакт пересекает запрет трассировки"), false},
    {5024, QT_TRANSLATE_NOOP("QObject", "5024: переход лежит на запрете трассировки"), true},
    {5026, QT_TRANSLATE_NOOP("QObject", "5026: область металлизации пересекает запрет трассировки"), true},
    {5034, QT_TRANSLATE_NOOP("QObject", "5034: незакреплённый компонент пересекает контур платы"), true},
    {5036, QT_TRANSLATE_NOOP("QObject", "5036: незакреплённые компоненты пересекаются"), true},
    {5037, QT_TRANSLATE_NOOP("QObject", "5037: цепь содержит избыточный переход"), false},
};

}  // namespace

bool editMessageFilter(QWidget* parent, Document* doc) {
  if (!doc->hasBoard()) return false;
  MessageFilter f = doc->board()->settings.messages;
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Фильтр сообщений"));
  auto* v = new QVBoxLayout(&dlg);
  auto* all = new QRadioButton(QObject::tr("Проверять все"));
  auto* nothing = new QRadioButton(QObject::tr("Ничего не проверять"));
  auto* checked = new QRadioButton(QObject::tr("Проверять отмеченные"));
  all->setObjectName("all");
  nothing->setObjectName("nothing");
  checked->setObjectName("checked");
  (f.mode == MessageFilter::Mode::All ? all : f.mode == MessageFilter::Mode::Nothing ? nothing : checked)->setChecked(true);
  v->addWidget(all);
  v->addWidget(nothing);
  v->addWidget(checked);
  auto* box = new QGroupBox(QObject::tr("Предупреждения"));
  auto* bv = new QVBoxLayout(box);
  std::vector<QCheckBox*> checks;
  for (size_t i = 0; i < std::size(kWarnings); ++i) {
    const Warning& w = kWarnings[i];
    auto* c = new QCheckBox(QObject::tr(w.text));
    c->setObjectName(QString("W%1").arg(w.code));
    c->setChecked(f.on[i]);
    if (!w.found) c->setToolTip(QObject::tr("Эту проверку XrTopoR пока не выполняет: флажок хранится в дизайне для TopoR."));
    bv->addWidget(c);
    checks.push_back(c);
  }
  v->addWidget(box);
  auto* online = new QGroupBox(QObject::tr("Быстрая проверка зазоров (Online DRC)"));
  auto* ov = new QVBoxLayout(online);
  auto* comps = new QCheckBox(QObject::tr("Зазоры между компонентами"));
  auto* inNet = new QCheckBox(QObject::tr("Зазоры между объектами одной цепи"));
  comps->setChecked(f.clearanceBetweenComps);
  inNet->setChecked(f.clearanceInNet);
  for (QCheckBox* c : {comps, inNet}) {
    c->setToolTip(QObject::tr("Быстрой проверки зазоров в XrTopoR пока нет: флажок хранится в дизайне для TopoR.\n"
                              "Зазоры между компонентами проверяет DRC."));
    ov->addWidget(c);
  }
  v->addWidget(online);
  auto sync = [&] { box->setEnabled(checked->isChecked()); };
  for (QRadioButton* r : {all, nothing, checked}) QObject::connect(r, &QRadioButton::toggled, &dlg, sync);
  sync();
  okCancel(&dlg, v);
  if (dlg.exec() != QDialog::Accepted) return false;
  f.mode = all->isChecked() ? MessageFilter::Mode::All : nothing->isChecked() ? MessageFilter::Mode::Nothing : MessageFilter::Mode::Checked;
  for (size_t i = 0; i < checks.size(); ++i) f.on[i] = checks[i]->isChecked();
  f.clearanceBetweenComps = comps->isChecked();
  f.clearanceInNet = inNet->isChecked();
  if (f == doc->board()->settings.messages) return false;
  auto before = doc->beginEdit();
  doc->board()->settings.messages = f;
  doc->commitEdit(before, QObject::tr("Фильтр сообщений"));
  return true;
}

bool editLabelSettings(QWidget*, Document*) { return false; }
bool editPadConnect(QWidget*, Document*) { return false; }

}  // namespace xr::gui
