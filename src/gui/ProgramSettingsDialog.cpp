#include "gui/ProgramSettingsDialog.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDialogButtonBox>
#include <QDir>
#include <QFileDialog>
#include <QFormLayout>
#include <QGroupBox>
#include <QHBoxLayout>
#include <QHeaderView>
#include <QKeySequenceEdit>
#include <QLabel>
#include <QLineEdit>
#include <QMessageBox>
#include <QPushButton>
#include <QSettings>
#include <QTabWidget>
#include <QTreeWidget>
#include <QVBoxLayout>

#include "gui/AppSettings.h"
#include "gui/Schemes.h"
#include "gui/ToporConfig.h"

namespace xr::gui {

namespace {
// TopoR's order of the hotkey groups.
const char* kGroups[] = {"Общие", "Автопроцедуры", "Вид", "Редактирование", "Действия с объектами", "Выделение",
                         "Ручная прокладка проводников", "Выбор активного слоя", "Схемы отображения", "Цветовые схемы"};
}  // namespace

ProgramSettingsDialog::ProgramSettingsDialog(Commands* cmds, QWidget* parent) : QDialog(parent), cmds_(cmds) {
  setWindowTitle(tr("Настройки программы"));
  resize(720, 620);
  for (auto& i : cmds_->all()) keys_[i.id] = (*cmds_)[i.id]->shortcuts();
  auto* v = new QVBoxLayout(this);
  auto* tabs = new QTabWidget(this);
  v->addWidget(tabs, 1);

  // «Общие»
  auto* general = new QWidget;
  auto* gv = new QVBoxLayout(general);
  auto* start = new QGroupBox(tr("Запуск"));
  auto* sv = new QVBoxLayout(start);
  openLast_ = new QCheckBox(tr("Открывать последний проект"));
  openLast_->setChecked(AppSettings::openLastProject());
  sv->addWidget(openLast_);
  gv->addWidget(start);
  auto* defaults = new QGroupBox(tr("Параметры по умолчанию для импортируемых дизайнов"));
  auto* df = new QFormLayout(defaults);
  colorScheme_ = new QComboBox;
  viewScheme_ = new QComboBox;
  for (auto& s : allColorSchemes()) colorScheme_->addItem(QString::fromStdString(s.name));
  for (auto& s : allViewSchemes()) viewScheme_->addItem(QString::fromStdString(s.name));
  colorScheme_->setCurrentText(QString::fromStdString(defaultColorScheme()));
  viewScheme_->setCurrentText(QString::fromStdString(defaultViewScheme()));
  df->addRow(tr("Цветовая схема:"), colorScheme_);
  df->addRow(tr("Схема отображения:"), viewScheme_);
  gv->addWidget(defaults);
  auto* topor = new QGroupBox(tr("Настройки TopoR"));
  auto* tv = new QVBoxLayout(topor);
  QString cfg = findToporConfig();
  auto* found = new QLabel(cfg.isEmpty() ? tr("Установленный TopoR не найден.")
                                         : tr("Найдены настройки TopoR:<br>%1").arg(QDir::toNativeSeparators(cfg).toHtmlEscaped()));
  found->setWordWrap(true);
  tv->addWidget(found);
  auto* row = new QHBoxLayout;
  auto* importFound = new QPushButton(tr("Импорт настроек TopoR"));
  importFound->setEnabled(!cfg.isEmpty());
  auto* importFile = new QPushButton(tr("Из файла..."));
  row->addWidget(importFound);
  row->addWidget(importFile);
  row->addStretch(1);
  tv->addLayout(row);
  tv->addWidget(new QLabel(tr("<i>Горячие клавиши, расположение панелей, недавние проекты и запуск.</i>")));
  gv->addWidget(topor);
  connect(importFound, &QPushButton::clicked, this, [this, cfg] {
    emit importToporRequested(cfg);
    for (auto& i : cmds_->all()) keys_[i.id] = (*cmds_)[i.id]->shortcuts();
    openLast_->setChecked(AppSettings::openLastProject());
    fillKeys();
  });
  connect(importFile, &QPushButton::clicked, this, [this] {
    QString f = QFileDialog::getOpenFileName(this, tr("Настройки TopoR"), QDir::homePath(), tr("Настройки TopoR (TopoR_*.cfg *.cfg)"));
    if (f.isEmpty()) return;
    emit importToporRequested(f);
    for (auto& i : cmds_->all()) keys_[i.id] = (*cmds_)[i.id]->shortcuts();
    openLast_->setChecked(AppSettings::openLastProject());
    fillKeys();
  });
  auto* reset = new QGroupBox(tr("Сброс настроек"));
  auto* rv = new QVBoxLayout(reset);
  auto* warn = new QLabel(tr("Все настройки программы (горячие клавиши, панели, схемы пользователя, история) будут "
                             "сброшены к значениям по умолчанию."));
  warn->setWordWrap(true);
  rv->addWidget(warn);
  auto* resetNow = new QPushButton(tr("Сбросить сейчас"));
  auto* rrow = new QHBoxLayout;
  rrow->addWidget(resetNow);
  rrow->addStretch(1);
  rv->addLayout(rrow);
  gv->addWidget(reset);
  gv->addStretch(1);
  connect(resetNow, &QPushButton::clicked, this, [this] {
    if (QMessageBox::question(this, windowTitle(), tr("Сбросить все настройки программы?")) != QMessageBox::Yes) return;
    emit resetRequested();
    reject();
  });
  tabs->addTab(general, tr("Общие"));

  // «Горячие клавиши»
  auto* hot = new QWidget;
  auto* hv = new QVBoxLayout(hot);
  search_ = new QLineEdit;
  search_->setPlaceholderText(tr("Поиск"));
  search_->setClearButtonEnabled(true);
  hv->addWidget(search_);
  tree_ = new QTreeWidget;
  tree_->setHeaderLabels({tr("Имя команды"), tr("Назначено")});
  tree_->header()->setSectionResizeMode(0, QHeaderView::Stretch);
  hv->addWidget(tree_, 1);
  auto* erow = new QHBoxLayout;
  erow->addWidget(new QLabel(tr("Сочетание клавиш:")));
  edit_ = new QKeySequenceEdit;
  edit_->setMaximumSequenceLength(1);
  erow->addWidget(edit_, 1);
  auto* set = new QPushButton(tr("Назначить"));
  auto* clear = new QPushButton(tr("Очистить"));
  auto* byDefault = new QPushButton(tr("По умолчанию"));
  erow->addWidget(set);
  erow->addWidget(clear);
  erow->addWidget(byDefault);
  hv->addLayout(erow);
  tabs->addTab(hot, tr("Горячие клавиши"));
  connect(search_, &QLineEdit::textChanged, this, &ProgramSettingsDialog::fillKeys);
  connect(set, &QPushButton::clicked, this, [this] { assign(edit_->keySequence()); });
  connect(clear, &QPushButton::clicked, this, [this] { assign({}); });
  connect(byDefault, &QPushButton::clicked, this, [this] {
    if (QMessageBox::question(this, tr("Сбросить назначение клавиш"),
                              tr("Текущее назначение клавиш будет сброшено. Вернуться к значениям по умолчанию?")) !=
        QMessageBox::Yes)
      return;
    for (auto& i : cmds_->all()) keys_[i.id] = i.defaults;
    fillKeys();
  });
  connect(tree_, &QTreeWidget::currentItemChanged, this, [this](QTreeWidgetItem* it) {
    QString id = it ? it->data(0, Qt::UserRole).toString() : QString();
    edit_->setKeySequence(id.isEmpty() || keys_[id].isEmpty() ? QKeySequence() : keys_[id].front());
  });
  fillKeys();

  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel);
  box->button(QDialogButtonBox::Ok)->setText(tr("OK"));
  box->button(QDialogButtonBox::Cancel)->setText(tr("Отмена"));
  connect(box, &QDialogButtonBox::accepted, this, [this] {
    if (applyAndClose()) accept();
  });
  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  v->addWidget(box);
}

QString ProgramSettingsDialog::keysText(const QString& id) const {
  QStringList out;
  for (auto& k : keys_.value(id)) out << k.toString(QKeySequence::NativeText);
  return out.join(", ");
}

void ProgramSettingsDialog::fillKeys() {
  QString current = tree_->currentItem() ? tree_->currentItem()->data(0, Qt::UserRole).toString() : QString();
  tree_->clear();
  QString f = search_->text();
  for (const char* g : kGroups) {
    QString group = tr(g);
    QTreeWidgetItem* gi = nullptr;
    for (auto& i : cmds_->all()) {
      if (i.group != group) continue;
      QString name = QString((*cmds_)[i.id]->text()).remove('&');
      if (!f.isEmpty() && !name.contains(f, Qt::CaseInsensitive) && !keysText(i.id).contains(f, Qt::CaseInsensitive)) continue;
      if (!gi) {
        gi = new QTreeWidgetItem(tree_, {group});
        QFont font = gi->font(0);
        font.setBold(true);
        gi->setFont(0, font);
        gi->setFirstColumnSpanned(true);
      }
      auto* it = new QTreeWidgetItem(gi, {name, keysText(i.id)});
      it->setData(0, Qt::UserRole, i.id);
      if (i.id == current) tree_->setCurrentItem(it);
    }
  }
  tree_->expandAll();
}

void ProgramSettingsDialog::assign(const QKeySequence& k) {
  QTreeWidgetItem* it = tree_->currentItem();
  QString id = it ? it->data(0, Qt::UserRole).toString() : QString();
  if (id.isEmpty()) return;
  if (!k.isEmpty())
    for (auto& i : cmds_->all())
      if (i.id != id && keys_[i.id].contains(k)) {
        QMessageBox box(QMessageBox::Warning, windowTitle(),
                        tr("Сочетание «%1» уже назначено команде «%2».")
                            .arg(k.toString(QKeySequence::NativeText), QString((*cmds_)[i.id]->text()).remove('&')),
                        QMessageBox::NoButton, this);
        auto* accept = box.addButton(tr("Принять и перейти к конфликту"), QMessageBox::AcceptRole);
        box.addButton(tr("Отменить изменение"), QMessageBox::RejectRole);
        box.exec();
        if (box.clickedButton() != accept) return;
        keys_[id] = {k};
        // The other command keeps the key until it is changed: it is shown to be fixed.
        fillKeys();
        for (auto* found : tree_->findItems(QString((*cmds_)[i.id]->text()).remove('&'), Qt::MatchExactly | Qt::MatchRecursive, 0))
          if (found->data(0, Qt::UserRole).toString() == i.id) tree_->setCurrentItem(found);
        return;
      }
  keys_[id] = k.isEmpty() ? QList<QKeySequence>{} : QList<QKeySequence>{k};
  fillKeys();
}

bool ProgramSettingsDialog::applyAndClose() {
  // Every key belongs to one command.
  QHash<QString, QString> owner;
  for (auto& i : cmds_->all())
    for (auto& k : keys_[i.id]) {
      QString s = k.toString(QKeySequence::PortableText);
      if (owner.contains(s)) {
        QMessageBox::warning(this, windowTitle(),
                             tr("Сочетание «%1» назначено нескольким командам: «%2» и «%3».")
                                 .arg(k.toString(QKeySequence::NativeText), QString((*cmds_)[owner[s]]->text()).remove('&'),
                                      QString((*cmds_)[i.id]->text()).remove('&')));
        return false;
      }
      owner[s] = i.id;
    }
  for (auto& i : cmds_->all()) cmds_->setShortcuts(i.id, keys_[i.id]);
  AppSettings::setShortcuts(cmds_->overrides());
  AppSettings::setOpenLastProject(openLast_->isChecked());
  QSettings s;
  s.setValue("schemes/defaultColor", colorScheme_->currentText());
  s.setValue("schemes/defaultView", viewScheme_->currentText());
  return true;
}

}  // namespace xr::gui
