#include "gui/EcoDialog.h"

#include <QDesktopServices>
#include <QDialogButtonBox>
#include <QDir>
#include <QFileDialog>
#include <QFileInfo>
#include <QFormLayout>
#include <QHBoxLayout>
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QPushButton>
#include <QSettings>
#include <QToolButton>
#include <QUrl>
#include <QVBoxLayout>

#include "io/BoardIO.h"
#include "xr/Version.h"

namespace xr::gui {

namespace {

QString qs(const std::string& s) { return QString::fromStdString(s); }
QString netOr(const std::string& net) { return net.empty() ? EcoDialog::tr("без цепи") : QString("‘%1’").arg(qs(net)); }
// The base chosen for a design is remembered by the design's file.
QString baseKey(const QString& design) { return "eco/base/" + QString::fromLatin1(design.toUtf8().toHex()); }

}  // namespace

QString EcoDialog::describe(const io::EcoChange& c) {
  using Kind = io::EcoChange::Kind;
  switch (c.kind) {
    case Kind::RenameNet: return tr("Переименовать цепь ‘%1’ в ‘%2’").arg(qs(c.a), qs(c.b));
    case Kind::AddNet: return tr("Добавить цепь ‘%1’").arg(qs(c.a));
    case Kind::PinSwap: return tr("Переназначить эквивалентные контакты ‘%1’ и ‘%2’. Цепи: %3, %4").arg(qs(c.a), qs(c.b), netOr(c.netA), netOr(c.netB));
    case Kind::GateSwap: return tr("Переназначить эквивалентные вентили: контакты %1 и %2").arg(qs(c.a), qs(c.b));
    case Kind::PinNet: return tr("Изменить цепь контакта ‘%1’ с %2 на %3").arg(qs(c.a), netOr(c.netA), netOr(c.netB));
    case Kind::RemoveNet: return tr("Удалить цепь ‘%1’").arg(qs(c.a));
    case Kind::CompAttr:
      return c.netA.empty() ? tr("Компонент ‘%1’: атрибут ‘%2’ = ‘%3’").arg(qs(c.a), qs(c.b), qs(c.netB))
                            : tr("Компонент ‘%1’: атрибут ‘%2’ изменён с ‘%3’ на ‘%4’").arg(qs(c.a), qs(c.b), qs(c.netA), qs(c.netB));
  }
  return {};
}

EcoDialog::EcoDialog(Document* doc, QWidget* parent) : QDialog(parent), doc_(doc) {
  setWindowTitle(tr("Создание ECO-файла для обратной синхронизации"));
  resize(720, 520);
  auto* v = new QVBoxLayout(this);
  auto row = [&](QLineEdit*& edit, const char* name, const QString& tip) {
    auto* w = new QWidget;
    auto* h = new QHBoxLayout(w);
    h->setContentsMargins(0, 0, 0, 0);
    edit = new QLineEdit;
    edit->setObjectName(name);
    auto* pick = new QToolButton;
    pick->setObjectName(QString(name) + "Pick");
    pick->setText("...");
    pick->setToolTip(tip);
    h->addWidget(edit, 1);
    h->addWidget(pick);
    return std::pair{w, pick};
  };
  auto* form = new QFormLayout;
  auto [baseRow, basePick] = row(base_, "base", tr("Выбрать базовый файл"));
  auto [outRow, outPick] = row(out_, "output", tr("Сохранить как"));
  form->addRow(tr("Базовый файл:"), baseRow);
  form->addRow(tr("Файл:"), outRow);
  v->addLayout(form);
  state_ = new QLabel;
  state_->setObjectName("state");
  state_->setWordWrap(true);
  v->addWidget(state_);
  list_ = new QListWidget;
  list_->setObjectName("changes");
  v->addWidget(list_, 1);
  written_ = new QLabel;
  written_->setObjectName("written");
  written_->setTextFormat(Qt::RichText);
  written_->hide();
  v->addWidget(written_);
  auto* box = new QDialogButtonBox;
  create_ = box->addButton(tr("Создать ECO-файл"), QDialogButtonBox::ActionRole);
  create_->setObjectName("create");
  box->addButton(tr("Закрыть"), QDialogButtonBox::RejectRole);
  v->addWidget(box);

  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  connect(create_, &QPushButton::clicked, this, &EcoDialog::write);
  connect(base_, &QLineEdit::editingFinished, this, [this] { setBase(base_->text()); });
  connect(out_, &QLineEdit::textChanged, this, &EcoDialog::sync);
  connect(list_, &QListWidget::itemChanged, this, &EcoDialog::sync);
  connect(basePick, &QToolButton::clicked, this, [this] {
    const QString start = base_->text().isEmpty() ? QFileInfo(doc_->path()).absolutePath() : QFileInfo(base_->text()).absolutePath();
    const QString f = QFileDialog::getOpenFileName(this, tr("Базовый файл"), start, tr("Дизайны (*.fst *.pcb *.PCB *.kicad_pcb *.dsn);;Все файлы (*)"));
    if (!f.isEmpty()) setBase(f);
  });
  connect(outPick, &QToolButton::clicked, this, [this] {
    const QString f = QFileDialog::getSaveFileName(this, tr("Сохранить как"), out_->text(), tr("ECO-файл (*.eco);;Все файлы (*)"));
    if (!f.isEmpty()) out_->setText(f);
  });
  connect(written_, &QLabel::linkActivated, this, [](const QString& dir) { QDesktopServices::openUrl(QUrl::fromLocalFile(dir)); });

  const QFileInfo design(doc_->path());
  out_->setText(design.absolutePath() + "/" + design.completeBaseName() + ".eco");
  // The base: the one chosen for this design before, else the design's own file as it is on the disk.
  const QString remembered = QSettings().value(baseKey(design.absoluteFilePath())).toString();
  setBase(!remembered.isEmpty() && QFileInfo::exists(remembered) ? remembered : design.absoluteFilePath());
}

bool EcoDialog::setBase(const QString& file) {
  base_->setText(QDir::toNativeSeparators(file));
  changes_.clear();
  list_->clear();
  written_->hide();
  auto fail = [&](const QString& why) {
    state_->setText(why);
    sync();
    return false;
  };
  if (file.isEmpty() || !QFileInfo::exists(file)) return fail(tr("Базовый файл не найден: укажите дизайн, с которым сравнивать"));
  auto base = io::loadBoard(QDir::fromNativeSeparators(file).toStdString());
  if (!base) return fail(tr("Базовый файл не прочитан: %1").arg(qs(base.error())));
  changes_ = io::netlistDiff(**base, *doc_->board());
  QSettings().setValue(baseKey(QFileInfo(doc_->path()).absoluteFilePath()), QFileInfo(file).absoluteFilePath());
  {
    const QSignalBlocker quiet(list_);
    for (const io::EcoChange& c : changes_) {
      auto* it = new QListWidgetItem(describe(c), list_);
      it->setFlags(it->flags() | Qt::ItemIsUserCheckable);
      it->setCheckState(Qt::Checked);
      QStringList lines;
      for (const std::string& l : c.lines) lines << qs(l);
      it->setToolTip(lines.join('\n'));
    }
  }
  state_->setText(changes_.empty() ? tr("Изменений относительно базового файла нет") : tr("Найдено изменений: %1. Выбранные изменения будут записаны в ECO-файл").arg(changes_.size()));
  sync();
  return true;
}

void EcoDialog::setOutput(const QString& file) { out_->setText(file); }
QString EcoDialog::output() const { return out_->text(); }

void EcoDialog::sync() {
  bool any = false;
  for (int i = 0; i < list_->count(); ++i) any = any || list_->item(i)->checkState() == Qt::Checked;
  create_->setEnabled(any && !out_->text().trimmed().isEmpty());
}

bool EcoDialog::write() {
  std::vector<io::EcoChange> chosen;
  for (int i = 0; i < list_->count() && i < int(changes_.size()); ++i)
    if (list_->item(i)->checkState() == Qt::Checked) chosen.push_back(changes_[size_t(i)]);
  if (chosen.empty() || out_->text().trimmed().isEmpty()) return false;
  const QString file = QDir::cleanPath(QDir::fromNativeSeparators(out_->text().trimmed()));
  const auto r = io::writePcadEco(file.toStdString(), chosen, std::string("XrTopoR ") + XR_VERSION_FULL, QDir::toNativeSeparators(doc_->path()).toStdString());
  written_->show();
  if (!r) {
    written_->setText(tr("Не удалось записать файл: %1").arg(qs(r.error())));
    return false;
  }
  size_t lines = 0;
  for (const io::EcoChange& c : chosen) lines += c.lines.size();
  written_->setText(tr("Записано изменений: %1, строк: %2. <a href=\"%3\">Показать в папке</a>").arg(chosen.size()).arg(lines).arg(QFileInfo(file).absolutePath().toHtmlEscaped()));
  const QString group = tr("ECO-файл");
  doc_->clearLog(group);
  doc_->addLog({LogMessage::Kind::Info, group, tr("ECO-файл %1: изменений %2, строк %3").arg(QDir::toNativeSeparators(file)).arg(chosen.size()).arg(lines)});
  return true;
}

void EcoDialog::run(Document* doc, QWidget* parent) {
  if (!doc->hasBoard()) return;
  EcoDialog d(doc, parent);
  d.exec();
}

}  // namespace xr::gui
