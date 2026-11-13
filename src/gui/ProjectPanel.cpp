#include "gui/ProjectPanel.h"

#include <QComboBox>
#include <QDate>
#include <QDesktopServices>
#include <QDir>
#include <QFileDialog>
#include <QFileInfo>
#include <QHBoxLayout>
#include <QInputDialog>
#include <QLabel>
#include <QLocale>
#include <QMenu>
#include <QMessageBox>
#include <QTabWidget>
#include <QToolButton>
#include <QUrl>
#include <QVBoxLayout>
#include <algorithm>

#include "gui/AppSettings.h"

namespace xr::gui {

namespace {

enum Role { PathRole = Qt::UserRole, KindRole, FolderRole };
enum Kind { KRoot, KSection, KFolder, KFile };

QToolButton* toolButton(const QString& icon, const QString& tip, QWidget* parent) {
  auto* b = new QToolButton(parent);
  b->setIcon(QIcon(":/icons/" + icon + ".svg"));
  b->setToolTip(tip);
  b->setAutoRaise(true);
  return b;
}

QString fileInfoText(const QString& path) {
  QFileInfo fi(path);
  QLocale ru(QLocale::Russian);
  QString size = fi.size() >= 1024 * 1024 ? QObject::tr("%1 МБ").arg(fi.size() / 1048576.0, 0, 'f', 1)
                                          : QObject::tr("%1 КБ").arg(fi.size() / 1024.0, 0, 'f', 1);
  return QObject::tr("<b><font color=\"#3060a0\">Свойства файла</font></b><br>"
                     "Имя файла: %1<br>Изменён: %2<br>Размер: %3")
      .arg(QDir::toNativeSeparators(fi.absoluteFilePath()).toHtmlEscaped(),
           ru.toString(fi.lastModified(), "dddd, d MMMM yyyy г. HH:mm:ss"), size);
}

// TopoR's history groups.
QString historyGroup(const QDate& d) {
  QDate today = QDate::currentDate();
  qint64 days = d.daysTo(today);
  if (days <= 0) return QObject::tr("Сегодня");
  if (days == 1) return QObject::tr("Вчера");
  QDate weekStart = today.addDays(1 - today.dayOfWeek());
  if (d >= weekStart) return QLocale(QLocale::Russian).standaloneDayName(d.dayOfWeek());
  if (d >= weekStart.addDays(-7)) return QObject::tr("На прошлой неделе");
  if (d.year() == today.year() && d.month() == today.month()) return QObject::tr("Ранее в этом месяце");
  if (d >= today.addMonths(-1).addDays(1 - today.addMonths(-1).day())) return QObject::tr("В прошлом месяце");
  if (d >= today.addMonths(-6)) return QObject::tr("Ранее в этом полугодии");
  return QObject::tr("Старше чем 6 месяцев");
}

}  // namespace

ProjectPanel::ProjectPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  auto* tabs = new QTabWidget(this);
  lay->addWidget(tabs);

  // «Проект»
  auto* page = new QWidget;
  auto* v = new QVBoxLayout(page);
  v->setContentsMargins(2, 2, 2, 2);
  auto* bar = new QHBoxLayout;
  auto* folder = toolButton("new_project", tr("Создать папку"), page);
  auto* addFile = toolButton("import", tr("Добавить файл в проект"), page);
  auto* props = toolButton("design_params", tr("Свойства"), page);
  sort_ = new QComboBox(page);
  sort_->addItems({tr("По имени"), tr("По дате")});
  sort_->setToolTip(tr("Сортировать"));
  auto* del = toolButton("delete", tr("Удалить с диска"), page);
  for (QWidget* w : {static_cast<QWidget*>(folder), static_cast<QWidget*>(addFile), static_cast<QWidget*>(props)})
    bar->addWidget(w);
  bar->addStretch(1);
  bar->addWidget(sort_);
  bar->addWidget(del);
  v->addLayout(bar);
  tree_ = new QTreeWidget(page);
  tree_->setHeaderHidden(true);
  tree_->setContextMenuPolicy(Qt::CustomContextMenu);
  v->addWidget(tree_, 1);
  info_ = new QLabel(page);
  info_->setWordWrap(true);
  info_->setTextInteractionFlags(Qt::TextSelectableByMouse);
  v->addWidget(info_);
  tabs->addTab(page, tr("Проект"));

  // «История»
  auto* hpage = new QWidget;
  auto* hv = new QVBoxLayout(hpage);
  hv->setContentsMargins(2, 2, 2, 2);
  auto* hbar = new QHBoxLayout;
  auto* clear = toolButton("delete", tr("Очистить историю"), hpage);
  auto* hprops = toolButton("design_params", tr("Свойства"), hpage);
  hbar->addWidget(clear);
  hbar->addWidget(hprops);
  hbar->addStretch(1);
  hv->addLayout(hbar);
  history_ = new QTreeWidget(hpage);
  history_->setHeaderHidden(true);
  history_->setContextMenuPolicy(Qt::CustomContextMenu);
  hv->addWidget(history_, 1);
  tabs->addTab(hpage, tr("История"));

  connect(folder, &QToolButton::clicked, this, [this] { createFolder(tree_->currentItem()); });
  connect(addFile, &QToolButton::clicked, this, [this] { addFiles(tree_->currentItem()); });
  connect(props, &QToolButton::clicked, this, [this] { showProperties(pathOf(tree_->currentItem())); });
  connect(del, &QToolButton::clicked, this, [this] { deleteFromDisk(pathOf(tree_->currentItem())); });
  connect(sort_, &QComboBox::currentIndexChanged, this, &ProjectPanel::refresh);
  connect(tree_, &QTreeWidget::itemDoubleClicked, this, [this](QTreeWidgetItem* it) {
    if (QString p = pathOf(it); !p.isEmpty()) emit openRequested(p);
  });
  connect(tree_, &QTreeWidget::currentItemChanged, this, &ProjectPanel::updateFileInfo);
  connect(tree_, &QWidget::customContextMenuRequested, this, &ProjectPanel::contextMenu);
  connect(tree_, &QTreeWidget::itemExpanded, this, [this](QTreeWidgetItem* it) {
    if (auto* f = folderOf(it); f && it->data(0, KindRole).toInt() != KRoot && !f->expanded) {
      f->expanded = true;
      emit projectEdited();
    }
  });
  connect(tree_, &QTreeWidget::itemCollapsed, this, [this](QTreeWidgetItem* it) {
    if (auto* f = folderOf(it); f && it->data(0, KindRole).toInt() != KRoot && f->expanded) {
      f->expanded = false;
      emit projectEdited();
    }
  });
  connect(history_, &QTreeWidget::itemDoubleClicked, this, [this](QTreeWidgetItem* it) {
    if (QString p = it->data(0, PathRole).toString(); !p.isEmpty()) emit openRequested(p);
  });
  connect(history_, &QWidget::customContextMenuRequested, this, &ProjectPanel::historyMenu);
  connect(clear, &QToolButton::clicked, this, [this] {
    AppSettings::clearRecentFiles();
    refreshHistory();
  });
  connect(hprops, &QToolButton::clicked, this, [this] {
    if (auto* it = history_->currentItem()) showProperties(it->data(0, PathRole).toString());
  });
  connect(doc_, &Document::boardReplaced, this, &ProjectPanel::refresh);
  refresh();
  refreshHistory();
}

void ProjectPanel::setProject(Project* p) {
  project_ = p;
  refresh();
}

QString ProjectPanel::pathOf(QTreeWidgetItem* it) const { return it ? it->data(0, PathRole).toString() : QString(); }

io::FsProjFolder* ProjectPanel::folderOf(QTreeWidgetItem* it) {
  if (!project_ || !it) return nullptr;
  // Walk up to the section, then down the recorded folder indices.
  std::vector<int> chain;
  QTreeWidgetItem* cur = it;
  while (cur && cur->data(0, KindRole).toInt() != KSection) {
    if (cur->data(0, KindRole).toInt() == KFolder) chain.push_back(cur->data(0, FolderRole).toInt());
    if (cur->data(0, KindRole).toInt() == KRoot) return &project_->data().documents;
    cur = cur->parent();
  }
  if (!cur) return &project_->data().documents;
  io::FsProjFolder* f = cur->data(0, FolderRole).toInt() == 1 ? &project_->data().autorouting : &project_->data().documents;
  for (int idx : chain | v::reverse) f = &f->folders[size_t(idx)];
  return f;
}

void ProjectPanel::refresh() {
  tree_->clear();
  QString current = doc_->hasBoard() ? doc_->path() : QString();
  auto boldIfCurrent = [&](QTreeWidgetItem* it, const QString& path) {
    if (path.isEmpty() || (path != current && openableFile(path) != current)) return;
    QFont f = it->font(0);
    f.setBold(true);
    it->setFont(0, f);
  };
  QIcon folderIcon(":/icons/open.svg"), fileIcon(":/icons/design_params.svg"), rootIcon(":/icons/new_project.svg");
  if (!project_) return;
  auto* root = new QTreeWidgetItem(tree_, {project_->name()});
  root->setIcon(0, rootIcon);
  root->setData(0, KindRole, KRoot);
  root->setData(0, PathRole, project_->path());
  bool byDate = sort_->currentIndex() == 1;
  auto fill = [&](auto& self, QTreeWidgetItem* parent, const io::FsProjFolder& f) -> void {
    for (int i = 0; i < int(f.folders.size()); ++i) {
      auto* it = new QTreeWidgetItem(parent, {QString::fromStdString(f.folders[size_t(i)].name)});
      it->setIcon(0, folderIcon);
      it->setData(0, KindRole, KFolder);
      it->setData(0, FolderRole, i);
      self(self, it, f.folders[size_t(i)]);
      it->setExpanded(f.folders[size_t(i)].expanded);
    }
    // Files, sorted by name or date; entries naming the same file once.
    std::vector<std::pair<QString, QDateTime>> files;
    for (auto& file : f.files) {
      QString p = project_->resolve(file);
      if (!r::contains(files, p, &std::pair<QString, QDateTime>::first))
        files.push_back({p, QFileInfo(p).lastModified()});
    }
    if (byDate) r::sort(files, std::greater{}, &std::pair<QString, QDateTime>::second);
    else
      r::sort(files, [](const QString& a, const QString& b) { return a.compare(b, Qt::CaseInsensitive) < 0; },
              [](auto& e) { return QFileInfo(e.first).fileName(); });
    for (auto& [p, date] : files) {
      auto* it = new QTreeWidgetItem(parent, {QFileInfo(p).fileName()});
      it->setIcon(0, fileIcon);
      it->setData(0, PathRole, p);
      it->setData(0, KindRole, KFile);
      if (!QFileInfo::exists(p)) it->setForeground(0, QColor(0x90, 0x90, 0x90));
      boldIfCurrent(it, p);
    }
  };
  int section = 0;
  for (auto* sec : {&project_->data().documents, &project_->data().autorouting}) {
    auto* s = new QTreeWidgetItem(root, {section == 0 ? tr("Документы") : tr("Варианты автотрассировки")});
    QFont f = s->font(0);
    f.setItalic(true);
    s->setFont(0, f);
    s->setIcon(0, folderIcon);
    s->setData(0, KindRole, KSection);
    s->setData(0, FolderRole, section++);
    fill(fill, s, *sec);
    s->setExpanded(sec->expanded);
  }
  root->setExpanded(true);
  updateFileInfo();
}

void ProjectPanel::updateFileInfo() {
  QString p = pathOf(tree_->currentItem());
  if (p.isEmpty() && doc_->hasBoard()) p = doc_->path();
  info_->setText(p.isEmpty() || !QFileInfo::exists(p) ? QString() : fileInfoText(p));
}

void ProjectPanel::refreshHistory() {
  history_->clear();
  QTreeWidgetItem* group = nullptr;
  QString groupName;
  for (const RecentFile& r : AppSettings::recentFiles()) {
    QString g = historyGroup(r.opened.date());
    if (g != groupName || !group) {
      group = new QTreeWidgetItem(history_, {g});
      groupName = g;
    }
    auto* it = new QTreeWidgetItem(group, {QFileInfo(r.path).fileName()});
    it->setData(0, PathRole, r.path);
    it->setToolTip(0, QDir::toNativeSeparators(r.path));
    if (!QFileInfo::exists(r.path)) it->setForeground(0, QColor(0x90, 0x90, 0x90));
  }
  history_->expandAll();
}

void ProjectPanel::showProperties(const QString& path) {
  if (path.isEmpty() || !QFileInfo::exists(path)) return;
  QMessageBox box(QMessageBox::Information, tr("Свойства"), fileInfoText(path), QMessageBox::Ok, this);
  box.setTextFormat(Qt::RichText);
  box.exec();
}

io::FsProjFolder* ProjectPanel::targetFolder(QTreeWidgetItem* at) {
  if (!project_) return nullptr;
  io::FsProjFolder* f = folderOf(at);
  return f ? f : &project_->data().documents;
}

void ProjectPanel::createFolder(QTreeWidgetItem* at) {
  io::FsProjFolder* parent = targetFolder(at);
  if (!parent) return;
  bool ok = false;
  QString name = QInputDialog::getText(this, tr("Создать папку"), tr("Имя папки:"), QLineEdit::Normal, tr("Новая папка"), &ok);
  if (!ok || name.trimmed().isEmpty()) return;
  parent->folders.push_back({name.trimmed().toStdString()});
  emit projectEdited();
  refresh();
}

void ProjectPanel::addFiles(QTreeWidgetItem* at) {
  io::FsProjFolder* target = targetFolder(at);
  if (!target) return;
  QStringList files = QFileDialog::getOpenFileNames(
      this, tr("Добавить файл в проект"), project_->dir(),
      tr("Все файлы (*);;Дизайны (*.fst *.fsx *.kicad_pcb *.dsn *.pcb *.PCB)"));
  if (files.isEmpty()) return;
  for (auto& f : files) project_->add(QFileInfo(f).absoluteFilePath(), false, target);
  emit projectEdited();
  refresh();
}

void ProjectPanel::deleteFromDisk(const QString& path) {
  if (path.isEmpty() || !QFileInfo(path).isFile()) return;
  if (doc_->hasBoard() && doc_->path() == path) {
    QMessageBox::warning(this, tr("Удалить с диска"), tr("Файл открыт в редакторе."));
    return;
  }
  if (QMessageBox::question(this, tr("Удалить с диска"), tr("Удалить файл «%1» с диска?").arg(QFileInfo(path).fileName())) !=
      QMessageBox::Yes)
    return;
  QFile::remove(path);
  if (project_) {
    project_->remove(path);
    emit projectEdited();
  }
  refresh();
}

void ProjectPanel::renameFile(const QString& path) {
  QFileInfo fi(path);
  bool ok = false;
  QString name = QInputDialog::getText(this, tr("Переименовать"), tr("Новое имя:"), QLineEdit::Normal, fi.fileName(), &ok);
  if (!ok || name.isEmpty() || name == fi.fileName()) return;
  QString target = fi.absolutePath() + "/" + name;
  if (!QFile::rename(path, target)) {
    QMessageBox::warning(this, tr("Переименовать"), tr("Не удалось переименовать файл."));
    return;
  }
  if (doc_->hasBoard() && doc_->path() == path) doc_->setPath(target);
  if (project_) {
    project_->rename(path, target);
    emit projectEdited();
  }
  refresh();
}

void ProjectPanel::contextMenu(QPoint pos) {
  QTreeWidgetItem* it = tree_->itemAt(pos);
  if (!it) return;
  int kind = it->data(0, KindRole).toInt();
  QString path = pathOf(it);
  QMenu m(this);
  auto showInFolder = [path] { QDesktopServices::openUrl(QUrl::fromLocalFile(QFileInfo(path).absolutePath())); };
  if (kind == KFile) {
    m.addAction(tr("Открыть"), this, [this, path] { emit openRequested(path); });
    m.addAction(tr("Открыть в текстовом редакторе"), this, [path] { QDesktopServices::openUrl(QUrl::fromLocalFile(path)); });
    m.addSeparator();
    if (project_)
      m.addAction(tr("Исключить из проекта"), this, [this, path] {
        project_->remove(path);
        emit projectEdited();
        refresh();
      });
    m.addAction(tr("Удалить с диска"), this, [this, path] { deleteFromDisk(path); });
    m.addSeparator();
    m.addAction(tr("Показать в папке"), this, showInFolder);
    m.addAction(tr("Переименовать"), this, [this, path] { renameFile(path); });
    m.addAction(tr("Свойства"), this, [this, path] { showProperties(path); });
  } else if (kind == KRoot) {
    if (!project_) return;
    m.addAction(tr("Скопировать проект..."), this, &ProjectPanel::copyProjectRequested);
    m.addAction(QIcon(":/icons/import.svg"), tr("Добавить файл в проект..."), this, [this, it] { addFiles(it); });
    m.addAction(QIcon(":/icons/new_project.svg"), tr("Создать папку"), this, [this, it] { createFolder(it); });
    m.addSeparator();
    m.addAction(tr("Показать в папке"), this, showInFolder);
    m.addAction(tr("Свойства"), this, [this, path] { showProperties(path); });
  } else {  // a section or a folder, as in TopoR
    m.addAction(QIcon(":/icons/new_project.svg"), tr("Создать папку"), this, [this, it] { createFolder(it); });
    m.addAction(QIcon(":/icons/import.svg"), tr("Добавить файл в проект..."), this, [this, it] { addFiles(it); });
    if (kind == KFolder)
      m.addAction(tr("Удалить папку из проекта"), this, [this, it] {
        QTreeWidgetItem* parent = it->parent();
        io::FsProjFolder* owner = folderOf(parent);
        if (!owner) return;
        owner->folders.erase(owner->folders.begin() + it->data(0, FolderRole).toInt());
        emit projectEdited();
        refresh();
      });
  }
  if (!m.isEmpty()) m.exec(tree_->viewport()->mapToGlobal(pos));
}

void ProjectPanel::historyMenu(QPoint pos) {
  QTreeWidgetItem* it = history_->itemAt(pos);
  if (!it) return;
  QString path = it->data(0, PathRole).toString();
  if (path.isEmpty()) return;
  QMenu m(this);
  m.addAction(tr("Открыть"), this, [this, path] { emit openRequested(path); });
  m.addAction(tr("Удалить из истории"), this, [this, path] {
    AppSettings::removeRecentFile(path);
    refreshHistory();
  });
  m.addAction(tr("Показать в папке"), this, [path] {
    QDesktopServices::openUrl(QUrl::fromLocalFile(QFileInfo(path).absolutePath()));
  });
  m.addAction(tr("Свойства"), this, [this, path] { showProperties(path); });
  m.exec(history_->viewport()->mapToGlobal(pos));
}

}  // namespace xr::gui
