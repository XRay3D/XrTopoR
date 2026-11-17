#include "gui/AboutDialog.h"

#include <QApplication>
#include <QCheckBox>
#include <QClipboard>
#include <QDialogButtonBox>
#include <QLabel>
#include <QPushButton>
#include <QSysInfo>
#include <QVBoxLayout>
#include <boost/version.hpp>
#include <CGAL/version.h>
#include <utility>
#include <vector>

#include "gui/AppSettings.h"
#include "gui/UpdateCheck.h"
#include "xr/Version.h"

namespace xr::gui {

namespace {

std::vector<std::pair<QString, QString>> rows(bool html) {
  const QString sha = QStringLiteral(XR_GIT_SHA);
  QString commit = sha.left(12);
  if (html && !sha.isEmpty()) commit = QString("<a href=\"%1/commit/%2\">%3</a>").arg(XR_REPOSITORY, sha, sha.left(12));
  QString boost = QString("%1.%2.%3").arg(BOOST_VERSION / 100000).arg(BOOST_VERSION / 100 % 1000).arg(BOOST_VERSION % 100);
  return {
      {QObject::tr("Версия"), QStringLiteral(XR_VERSION_FULL)},
      {QObject::tr("Ветка или тег"), QStringLiteral(XR_GIT_REF)},
      {QObject::tr("Коммит"), commit},
      {QObject::tr("Собрана"), QStringLiteral(XR_BUILD_DATE)},
      {QObject::tr("Компилятор"), QStringLiteral(XR_COMPILER)},
      {QObject::tr("Qt"), QObject::tr("%1 (при сборке %2)").arg(qVersion(), QT_VERSION_STR)},
      {QObject::tr("Boost, CGAL"), QString("%1, %2").arg(boost, CGAL_VERSION_STR)},
      {QObject::tr("Система"), QString("%1, %2").arg(QSysInfo::prettyProductName(), QSysInfo::currentCpuArchitecture())},
  };
}

}  // namespace

QString buildInfo(bool html) {
  QString out;
  if (html) {
    out = "<table cellspacing=\"2\">";
    for (auto& [k, v] : rows(true)) out += QString("<tr><td><i>%1:</i></td><td>%2</td></tr>").arg(k.toHtmlEscaped(), v);
    return out + "</table>";
  }
  out = QString("XrTopoR %1\n").arg(XR_VERSION_FULL);
  for (auto& [k, v] : rows(false)) out += QString("%1: %2\n").arg(k, v);
  return out;
}

AboutDialog::AboutDialog(QWidget* parent) : QDialog(parent) {
  setWindowTitle(tr("О программе"));
  auto* v = new QVBoxLayout(this);
  auto* text = new QLabel(tr("<h2>XrTopoR %1</h2>"
                             "<p>Топологический редактор и трассировщик печатных плат.</p>"
                             "%2"
                             "<p><a href=\"%3\">%3</a></p>")
                              .arg(XR_VERSION_FULL, buildInfo(true), XR_REPOSITORY));
  text->setTextFormat(Qt::RichText);
  text->setOpenExternalLinks(true);
  text->setTextInteractionFlags(Qt::TextBrowserInteraction);
  v->addWidget(text);

  // Updates: GitHub is asked while the dialog is open; the check at start-up can be turned off here.
  updates_ = new QLabel(tr("Обновления: проверка…"));
  updates_->setObjectName("updates");
  updates_->setTextFormat(Qt::RichText);
  updates_->setOpenExternalLinks(true);
  updates_->setTextInteractionFlags(Qt::TextBrowserInteraction);
  updates_->setWordWrap(true);
  v->addWidget(updates_);
  auto* atStart = new QCheckBox(tr("Проверять обновления при запуске"));
  atStart->setChecked(AppSettings::checkUpdates());
  connect(atStart, &QCheckBox::toggled, this, [](bool on) { AppSettings::setCheckUpdates(on); });
  v->addWidget(atStart);
  auto* check = new UpdateCheck(this);
  connect(check, &UpdateCheck::finished, this, [this](const UpdateCheck::Result& r) {
    const QString all = QString("<a href=\"%1\">%2</a>").arg(releasesUrl(), tr("все выпуски"));
    if (!r.ok) updates_->setText(tr("Обновления: не удалось проверить (%1) — %2.").arg(r.error.toHtmlEscaped(), all));
    else if (r.newer)
      updates_->setText(tr("<b>Доступна версия %1</b> — <a href=\"%2\">страница выпуска</a>, %3.")
                            .arg(r.tag.toHtmlEscaped(), r.url, all));
    else updates_->setText(tr("Обновления: установлена последняя версия (%1) — %2.").arg(r.tag.toHtmlEscaped(), all));
  });
  check->start();

  auto* buttons = new QDialogButtonBox(QDialogButtonBox::Close, this);
  buttons->button(QDialogButtonBox::Close)->setText(tr("Закрыть"));
  QPushButton* copy = buttons->addButton(tr("Скопировать сведения"), QDialogButtonBox::ActionRole);
  connect(copy, &QPushButton::clicked, this, [] { QApplication::clipboard()->setText(buildInfo(false)); });
  connect(buttons, &QDialogButtonBox::rejected, this, &QDialog::reject);
  v->addWidget(buttons);
}

}  // namespace xr::gui
