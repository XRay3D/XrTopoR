#include "gui/DrcDialog.h"

#include <QCheckBox>
#include <QDialogButtonBox>
#include <QDoubleSpinBox>
#include <QFileDialog>
#include <QGridLayout>
#include <QGroupBox>
#include <QHBoxLayout>
#include <QLabel>
#include <QLineEdit>
#include <QMessageBox>
#include <QPushButton>
#include <QSettings>
#include <QSpinBox>
#include <QTabWidget>
#include <QToolButton>
#include <QVBoxLayout>

#include "gui/MessagesPanel.h"
#include "io/BoardIO.h"

namespace xr::gui {

namespace {

const char* kKindNames[] = {"КП", "ПО", "Проводники", "Запреты", "Металлизация", "Надписи", "Контур ПП"};
// Kinds the checks cover (texts are not checked yet).
bool modelled(int k) { return k != 5; }

int kindOf(ItemType t) {
  switch (t) {
    case ItemType::Pad: return 0;
    case ItemType::Via: return 1;
    case ItemType::Track: return 2;
    case ItemType::Zone: return 4;
    case ItemType::Keepout: return 3;
    case ItemType::Text: return 5;
    case ItemType::Detail: return 6;
  }
  return 2;
}

QString pairKey(int a, int b) { return QString("drc/pair%1%2").arg(std::min(a, b)).arg(std::max(a, b)); }

}  // namespace

DrcDialog::DrcDialog(Document* doc, QWidget* parent) : QDialog(parent), doc_(doc) {
  setWindowTitle(tr("Проверка соблюдения проектных норм"));
  QSettings s;
  auto* v = new QVBoxLayout(this);
  auto* tabs = new QTabWidget(this);
  v->addWidget(tabs);

  // «Объекты»: the upper triangle of the pair matrix.
  auto* objects = new QWidget;
  auto* ov = new QVBoxLayout(objects);
  auto* grid = new QGridLayout;
  for (int k = 0; k < kKinds; ++k) {
    auto* col = new QLabel(tr(kKindNames[k]));
    col->setAlignment(Qt::AlignCenter);
    grid->addWidget(col, 0, k + 1);
    grid->addWidget(new QLabel(tr(kKindNames[k])), k + 1, 0);
  }
  for (int a = 0; a < kKinds; ++a)
    for (int b = a; b < kKinds; ++b) {
      if (a == 6 && b == 6) continue;  // outline to outline
      auto* c = new QCheckBox;
      bool on = modelled(a) && modelled(b);
      c->setEnabled(on);
      c->setChecked(on && s.value(pairKey(a, b), true).toBool());
      pairs_[a][b] = pairs_[b][a] = c;
      grid->addWidget(c, a + 1, b + 1, Qt::AlignCenter);
    }
  ov->addLayout(grid);
  auto* links = new QHBoxLayout;
  auto* all = new QPushButton(tr("Отметить все"));
  auto* none = new QPushButton(tr("Очистить все"));
  for (auto* b : {all, none}) {
    b->setFlat(true);
    links->addWidget(b);
  }
  links->addStretch(1);
  ov->addLayout(links);
  auto setAll = [this](bool on) {
    for (int a = 0; a < kKinds; ++a)
      for (int b = a; b < kKinds; ++b)
        if (pairs_[a][b] && pairs_[a][b]->isEnabled()) pairs_[a][b]->setChecked(on);
  };
  connect(all, &QPushButton::clicked, this, [setAll] { setAll(true); });
  connect(none, &QPushButton::clicked, this, [setAll] { setAll(false); });
  auto* checks = new QGroupBox(tr("Проверки"));
  auto* cv = new QVBoxLayout(checks);
  integrity_ = new QCheckBox(tr("Целостность цепей"));
  widths_ = new QCheckBox(tr("Ширины проводников"));
  clearances_ = new QCheckBox(tr("Зазоры"));
  integrity_->setChecked(s.value("drc/integrity", true).toBool());
  widths_->setChecked(s.value("drc/widths", true).toBool());
  clearances_->setChecked(s.value("drc/clearances", true).toBool());
  for (auto* c : {integrity_, widths_, clearances_}) cv->addWidget(c);
  ov->addWidget(checks);
  auto* tol = new QHBoxLayout;
  tol->addWidget(new QLabel(tr("Допуск:")));
  Unit u = doc_->unit();
  tolerance_ = new QDoubleSpinBox;
  tolerance_->setDecimals(4);
  tolerance_->setRange(0, 1000);
  tolerance_->setSuffix(" " + unitName(u));
  tolerance_->setValue(toUnit(s.value("drc/tolerance", 2000.0).toDouble(), u));
  tol->addWidget(tolerance_);
  tol->addStretch(1);
  ov->addLayout(tol);
  tabs->addTab(objects, tr("Объекты"));

  // «Отчет»
  auto* report = new QWidget;
  auto* rv = new QVBoxLayout(report);
  auto* lim = new QHBoxLayout;
  limit_ = new QCheckBox(tr("Ограничить число сообщений о нарушениях:"));
  limit_->setChecked(s.value("drc/limit", true).toBool());
  limitCount_ = new QSpinBox;
  limitCount_->setRange(1, 1000000);
  limitCount_->setValue(s.value("drc/limitCount", 5000).toInt());
  lim->addWidget(limit_);
  lim->addWidget(limitCount_);
  lim->addStretch(1);
  rv->addLayout(lim);
  report_ = new QCheckBox(tr("Выводить отчет в файл"));
  report_->setChecked(s.value("drc/report", false).toBool());
  rv->addWidget(report_);
  auto* path = new QHBoxLayout;
  reportPath_ = new QLineEdit(s.value("drc/reportPath").toString());
  auto* browse = new QToolButton;
  browse->setText("...");
  connect(browse, &QToolButton::clicked, this, [this] {
    QString f = QFileDialog::getSaveFileName(this, tr("Отчет DRC"), reportPath_->text(), tr("Текст (*.txt)"));
    if (!f.isEmpty()) reportPath_->setText(f);
  });
  path->addWidget(reportPath_, 1);
  path->addWidget(browse);
  rv->addLayout(path);
  rv->addStretch(1);
  tabs->addTab(report, tr("Отчет"));

  auto* box = new QDialogButtonBox;
  box->addButton(tr("Пуск"), QDialogButtonBox::AcceptRole);
  box->addButton(tr("Отмена"), QDialogButtonBox::RejectRole);
  connect(box, &QDialogButtonBox::accepted, this, [this] {
    save();
    accept();
  });
  connect(box, &QDialogButtonBox::rejected, this, &QDialog::reject);
  v->addWidget(box);
}

void DrcDialog::save() const {
  QSettings s;
  for (int a = 0; a < kKinds; ++a)
    for (int b = a; b < kKinds; ++b)
      if (pairs_[a][b] && pairs_[a][b]->isEnabled()) s.setValue(pairKey(a, b), pairs_[a][b]->isChecked());
  s.setValue("drc/integrity", integrity_->isChecked());
  s.setValue("drc/widths", widths_->isChecked());
  s.setValue("drc/clearances", clearances_->isChecked());
  s.setValue("drc/tolerance", fromUnit(tolerance_->value(), doc_->unit()));
  s.setValue("drc/limit", limit_->isChecked());
  s.setValue("drc/limitCount", limitCount_->value());
  s.setValue("drc/report", report_->isChecked());
  s.setValue("drc/reportPath", reportPath_->text());
}

int DrcDialog::run(Document* doc, QWidget* parent) {
  if (!doc->hasBoard()) return 0;
  QSettings s;
  DrcOptions o;
  o.unconnected = s.value("drc/integrity", true).toBool();
  o.widths = s.value("drc/widths", true).toBool();
  o.clearance = s.value("drc/clearances", true).toBool();
  o.edge = o.clearance && s.value(pairKey(6, 2), true).toBool();
  o.tolerance = s.value("drc/tolerance", 2000.0).toDouble();
  o.maxViolations = s.value("drc/limit", true).toBool() ? size_t(s.value("drc/limitCount", 5000).toInt()) : size_t(-1);
  auto v = runDrc(*doc->board(), o);
  // Pairs switched off in the matrix are dropped.
  std::erase_if(v, [&](const DrcViolation& x) {
    if (x.type == DrcViolation::Type::Clearance || x.type == DrcViolation::Type::Short)
      return !s.value(pairKey(kindOf(x.a.type), kindOf(x.b.type)), true).toBool();
    if (x.type == DrcViolation::Type::Edge) return !s.value(pairKey(kindOf(x.a.type), 6), true).toBool();
    if (x.type == DrcViolation::Type::Keepout) return !s.value(pairKey(kindOf(x.a.type), 3), true).toBool();
    return false;
  });
  if (s.value("drc/report", false).toBool() && !s.value("drc/reportPath").toString().isEmpty()) {
    QString text = QObject::tr("Проверка соблюдения проектных норм: %1\nНарушений: %2\n\n")
                       .arg(QFileInfo(doc->path()).fileName())
                       .arg(v.size());
    for (auto& x : v) text += describeViolation(*doc->board(), doc->unit(), x) + "\n";
    if (auto r = io::writeFile(s.value("drc/reportPath").toString().toStdString(), text.toStdString()); !r)
      QMessageBox::warning(parent, QObject::tr("Отчет DRC"), QString::fromStdString(r.error()));
  }
  int n = int(v.size());
  doc->setDrc(std::move(v));
  return n;
}

}  // namespace xr::gui
