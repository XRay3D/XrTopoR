#include "gui/Panels.h"

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

}  // namespace xr::gui
