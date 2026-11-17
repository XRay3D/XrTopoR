#pragma once
// «О программе»: what XrTopoR is, its version and where the build came from (branch or tag, commit, date,
// compiler, the libraries' versions, the system it runs on) — copied whole for a report of a fault; whether a newer
// release is out.
#include <QDialog>
#include <QString>

class QLabel;

namespace xr::gui {

// The build's particulars, one per line (`html`: a table for the dialog, with links).
QString buildInfo(bool html = false);

class AboutDialog : public QDialog {
  Q_OBJECT
 public:
  explicit AboutDialog(QWidget* parent = nullptr);

 private:
  QLabel* updates_;  // the latest release: newer, the same, or why it is not known
};

}  // namespace xr::gui
