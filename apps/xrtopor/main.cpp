#include <QApplication>
#include <QTimer>

#include "gui/MainWindow.h"

int main(int argc, char** argv) {
  QApplication app(argc, argv);
  QApplication::setApplicationName("XrTopoR");
  QApplication::setOrganizationName("XrTopoR");
  xr::gui::MainWindow w;
  w.show();
  QString shot;
  bool opened = false;
  for (int i = 1; i < argc; ++i) {
    QString a = QString::fromLocal8Bit(argv[i]);
    if (a == "--screenshot" && i + 1 < argc) shot = QString::fromLocal8Bit(argv[++i]);
    else opened = w.openFile(a) || opened;
  }
  if (!opened) w.openLastFile();
  if (!shot.isEmpty()) {  // headless check: render once and save the window
    QTimer::singleShot(300, &app, [&] {
      w.grab().save(shot);
      app.quit();
    });
  }
  return app.exec();
}
