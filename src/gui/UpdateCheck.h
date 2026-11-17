#pragma once
// Is there a newer XrTopoR? GitHub is asked for the latest release (pre-releases such as `continuous` are not
// counted); its tag is compared with the version built. Used at start-up (a message with a link, once per release)
// and by «О программе».
#include <QObject>
#include <QString>

class QNetworkAccessManager;

namespace xr::gui {

// Is release `tag` ("0.3", "v1.2.1") newer than version `current` ("0.2.0")? Missing parts count as 0.
bool isNewerVersion(const QString& tag, const QString& current);

// The page of all releases.
QString releasesUrl();

class UpdateCheck : public QObject {
  Q_OBJECT
 public:
  struct Result {
    bool ok = false;     // GitHub answered
    bool newer = false;  // its latest release is newer than this build
    QString tag;         // the latest release's tag
    QString url;         // its page
    QString error;       // why the check failed
  };

  explicit UpdateCheck(QObject* parent = nullptr);
  // Asks once; finished() follows. XR_UPDATE_URL replaces the address (tests: a file:// with the answer).
  void start();

 signals:
  void finished(const xr::gui::UpdateCheck::Result& result);

 private:
  QNetworkAccessManager* net_;
};

}  // namespace xr::gui
