#include "gui/SettingsDialogs.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDialog>
#include <QDialogButtonBox>
#include <QGridLayout>
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

bool editLabelSettings(QWidget* parent, Document* doc) {
  if (!doc->hasBoard()) return false;
  LabelSettings s = doc->board()->settings.labels;
  QDialog dlg(parent);
  dlg.setWindowTitle(QObject::tr("Настройки редактирования"));
  auto* v = new QVBoxLayout(&dlg);
  auto* turning = new QGroupBox(QObject::tr("Ярлыки: при вращении компонента"));
  auto* tv = new QVBoxLayout(turning);
  auto* with = new QRadioButton(QObject::tr("Вращать с компонентом"));
  auto* keep = new QRadioButton(QObject::tr("Сохранять угол поворота"));
  with->setObjectName("rotateWithComp");
  keep->setObjectName("keepAngle");
  (s.rotateWithComp ? with : keep)->setChecked(true);
  tv->addWidget(with);
  tv->addWidget(keep);
  v->addWidget(turning);
  auto* rules = new QGroupBox(QObject::tr("Использовать правила ориентации"));
  rules->setObjectName("useOrientRules");
  rules->setCheckable(true);
  rules->setChecked(s.useOrientRules);
  rules->setToolTip(QObject::tr("После поворота компонента или переноса на другую сторону его ярлык, оказавшийся горизонтальным\n"
                                "или вертикальным, ставится под заданным для стороны углом. Ярлык под произвольным углом не меняется."));
  auto* grid = new QGridLayout(rules);
  grid->addWidget(new QLabel(QObject::tr("Горизонтальная")), 0, 1);
  grid->addWidget(new QLabel(QObject::tr("Вертикальная")), 0, 2);
  auto combo = [&](const char* name, bool turned, bool vertical, int row, int col) {
    auto* c = new QComboBox;
    c->setObjectName(name);
    c->addItems(vertical ? QStringList{"90°", "270°"} : QStringList{"0°", "180°"});
    c->setCurrentIndex(turned ? 1 : 0);
    grid->addWidget(c, row, col);
    return c;
  };
  grid->addWidget(new QLabel(QObject::tr("Верхняя сторона")), 1, 0);
  auto* topHorz = combo("topHorz", s.topHorzRotate, false, 1, 1);
  auto* topVert = combo("topVert", s.topVertRotate, true, 1, 2);
  grid->addWidget(new QLabel(QObject::tr("Нижняя сторона")), 2, 0);
  auto* bottomHorz = combo("bottomHorz", s.bottomHorzRotate, false, 2, 1);
  auto* bottomVert = combo("bottomVert", s.bottomVertRotate, true, 2, 2);
  v->addWidget(rules);
  okCancel(&dlg, v);
  if (dlg.exec() != QDialog::Accepted) return false;
  s.rotateWithComp = with->isChecked();
  s.useOrientRules = rules->isChecked();
  s.topHorzRotate = topHorz->currentIndex() == 1;
  s.topVertRotate = topVert->currentIndex() == 1;
  s.bottomHorzRotate = bottomHorz->currentIndex() == 1;
  s.bottomVertRotate = bottomVert->currentIndex() == 1;
  if (s == doc->board()->settings.labels) return false;
  auto before = doc->beginEdit();
  doc->board()->settings.labels = s;
  doc->commitEdit(before, QObject::tr("Настройки редактирования"));
  return true;
}
bool editPadConnect(QWidget*, Document*) { return false; }

}  // namespace xr::gui
