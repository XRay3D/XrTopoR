#include "gui/UpdateCheck.h"

#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QRegularExpression>
#include <QUrl>
#include <algorithm>
#include <vector>

#include "xr/Version.h"

namespace xr::gui {

namespace {

// "v1.2.3-rc" → {1, 2, 3}: the leading digits of each dot-separated part.
std::vector<int> parts(QString v) {
  v = v.trimmed();
  if (v.startsWith('v') || v.startsWith('V')) v.remove(0, 1);
  std::vector<int> out;
  static const QRegularExpression lead("^\\d+");
  for (const QString& p : v.split('.')) {
    auto m = lead.match(p);
    if (!m.hasMatch()) break;
    out.push_back(m.captured().toInt());
  }
  return out;
}

}  // namespace

bool isNewerVersion(const QString& tag, const QString& current) {
  std::vector<int> a = parts(tag), b = parts(current);
  if (a.empty()) return false;
  const size_t n = std::max(a.size(), b.size());
  a.resize(n, 0);
  b.resize(n, 0);
  return a > b;
}

QString releasesUrl() { return QStringLiteral(XR_REPOSITORY "/releases"); }

UpdateCheck::UpdateCheck(QObject* parent) : QObject(parent), net_(new QNetworkAccessManager(this)) {}

void UpdateCheck::start() {
  QString address = qEnvironmentVariable("XR_UPDATE_URL");
  if (address.isEmpty()) {
    address = QStringLiteral(XR_REPOSITORY "/releases/latest");
    address.replace("https://github.com/", "https://api.github.com/repos/");
  }
  QNetworkRequest req{QUrl(address)};
  req.setRawHeader("Accept", "application/vnd.github+json");
  req.setHeader(QNetworkRequest::UserAgentHeader, QStringLiteral("XrTopoR/" XR_VERSION));
  req.setTransferTimeout(15000);
  QNetworkReply* reply = net_->get(req);
  connect(reply, &QNetworkReply::finished, this, [this, reply] {
    reply->deleteLater();
    Result r;
    const QByteArray body = reply->readAll();
    if (reply->error() != QNetworkReply::NoError) {
      r.error = reply->errorString();
      // GitHub explains a refusal (the hourly limit) in the body.
      if (QString msg = QJsonDocument::fromJson(body).object().value("message").toString(); !msg.isEmpty())
        r.error = msg;
    } else {
      const QJsonObject o = QJsonDocument::fromJson(body).object();
      r.tag = o.value("tag_name").toString();
      r.url = o.value("html_url").toString();
      if (r.url.isEmpty()) r.url = releasesUrl();
      r.ok = !r.tag.isEmpty();
      if (!r.ok) r.error = tr("в ответе нет выпуска");
      r.newer = r.ok && isNewerVersion(r.tag, QStringLiteral(XR_VERSION));
    }
    emit finished(r);
  });
}

}  // namespace xr::gui
