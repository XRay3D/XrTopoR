#include <QApplication>
#include <QSettings>
#include <QStyleFactory>
#include <QTemporaryDir>
#include <QTimer>

#include "gui/MainWindow.h"

int main(int argc, char** argv) {
  QApplication app(argc, argv);
  QApplication::setStyle(QStyleFactory::create("Fusion"));
  QApplication::setApplicationName("XrTopoR");
  QApplication::setOrganizationName("XrTopoR");
  // A screenshot run must not touch the user's settings: they go to a throw-away directory.
  QTemporaryDir scratchSettings;
  for (int i = 1; i < argc; ++i)
    if (QString::fromLocal8Bit(argv[i]) == "--screenshot") {
      QSettings::setDefaultFormat(QSettings::IniFormat);
      QSettings::setPath(QSettings::IniFormat, QSettings::UserScope, scratchSettings.path());
    }
  xr::gui::MainWindow w;
  w.show();
  QString shot;
  bool opened = false, drc = false;
  for (int i = 1; i < argc; ++i) {
    QString a = QString::fromLocal8Bit(argv[i]);
    if (a == "--screenshot" && i + 1 < argc) shot = QString::fromLocal8Bit(argv[++i]);
    else if (a == "--drc") drc = true;  // runs DRC after loading (for checks of the messages window)
    else opened = w.openFile(a) || opened;
  }
  if (!opened) w.openLastFile();
  if (drc) (*w.commands())["Accel_DRC"]->trigger();
  if (!shot.isEmpty()) {  // headless check: render once and save the window
    QTimer::singleShot(300, &app, [&] {
      w.grab().save(shot);
      app.quit();
    });
  }
  return app.exec();
}
