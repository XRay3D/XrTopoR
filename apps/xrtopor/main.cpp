#include <QApplication>
#include <QSettings>
#include <QStyleFactory>
#include <QTemporaryDir>
#include <QTimer>

#include <cstdio>

#include "gui/AppSettings.h"
#include "gui/BoardView.h"
#include "gui/MainWindow.h"
#include "gui/ToporConfig.h"

int main(int argc, char** argv) {
  QApplication app(argc, argv);
  QApplication::setStyle(QStyleFactory::create("Fusion"));
  QApplication::setApplicationName("XrTopoR");
  QApplication::setOrganizationName("XrTopoR");
  // A screenshot or benchmark run must not touch the user's settings: they go to a throw-away directory.
  QTemporaryDir scratchSettings;
  for (int i = 1; i < argc; ++i)
    if (QString::fromLocal8Bit(argv[i]) == "--screenshot" || QString::fromLocal8Bit(argv[i]) == "--render-bench") {
      QSettings::setDefaultFormat(QSettings::IniFormat);
      QSettings::setPath(QSettings::IniFormat, QSettings::UserScope, scratchSettings.path());
    }
  xr::gui::MainWindow w;
  w.show();
  QString shot;
  int bench = 0;
  bool opened = false, drc = false;
  for (int i = 1; i < argc; ++i) {
    QString a = QString::fromLocal8Bit(argv[i]);
    // The MCP server for agents (gui/mcp): `--mcp [port]` on 127.0.0.1 for this run, whatever the setting;
    // `--mcp-stdio` on stdin/stdout for a client that started the editor (stdout is then the protocol's alone).
    if (a == "--mcp") {
      quint16 port = quint16(xr::gui::AppSettings::mcpPort());
      if (i + 1 < argc && QString::fromLocal8Bit(argv[i + 1]).toUShort() > 0) port = QString::fromLocal8Bit(argv[++i]).toUShort();
      w.keepMcpForRun();
      QString error;
      if (w.startMcpHttp(port, &error)) std::fprintf(stderr, "MCP: %s\n", w.mcpUrl().toUtf8().constData());
      else std::fprintf(stderr, "MCP: port %u: %s\n", unsigned(port), error.toUtf8().constData());
      continue;
    }
    if (a == "--mcp-stdio") {
      w.startMcpStdio();
      continue;
    }
    if (a == "--screenshot" && i + 1 < argc) shot = QString::fromLocal8Bit(argv[++i]);
    else if (a == "--drc") drc = true;
    else if (a == "--render-bench" && i + 1 < argc) bench = QString::fromLocal8Bit(argv[++i]).toInt();  // frames per series  // runs DRC after loading (for checks of the messages window)
    else opened = w.openFile(a) || opened;
  }
  // TopoR's settings are taken over the first time an installed TopoR is found.
  if (!xr::gui::AppSettings::toporImported())
    if (QString cfg = xr::gui::findToporConfig(); !cfg.isEmpty()) w.importToporSettings(cfg, false);
  if (!opened) w.openLastFile();
  if (drc) (*w.commands())["Accel_DRC"]->trigger();
  if (bench > 0) {  // frame times of the board's rendering, the window maximised; then quit
    w.showMaximized();
    QTimer::singleShot(1500, &app, [&] {
      std::fprintf(stderr, "%dx%d px, dpr %.2f\n%s", w.view()->width(), w.view()->height(), w.view()->devicePixelRatioF(),
                   w.view()->benchmark(bench).toUtf8().constData());
      app.quit();
    });
  }
  if (!shot.isEmpty()) {  // headless check: render once and save the window
    QTimer::singleShot(300, &app, [&] {
      w.grab().save(shot);
      app.quit();
    });
  }
  return app.exec();
}
