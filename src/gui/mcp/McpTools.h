#pragma once
// The MCP server's tools: the open design read, edited and routed as the user does it — the same procedures
// (autorouter F11, F5/F6/F7, DRC, pours), the board the user sees, every edit one step of «Отменить». Lengths and
// coordinates in mm, the board's frame (Y down); a net by its name, a component by its designator, a pad as
// "U1.3", a track or a via by its stable id (indices change with every edit).
#include <QElapsedTimer>
#include <QJsonObject>
#include <QMetaObject>
#include <QObject>
#include <memory>
#include <vector>

#include "gui/mcp/McpServer.h"

namespace xr::gui {
class MainWindow;
}

namespace xr::gui::mcp {

class Tools : public QObject {
  Q_OBJECT
 public:
  Tools(MainWindow* w, Server* server);
  static QString instructions();

 private:
  void addDocumentTools();
  void addQueryTools();
  void addEditTools();
  void addProcedureTools();
  void addViewTools();

  // The procedure running (one at a time): the autorouter, F6, F7. A call waits for it up to wait_s seconds; it
  // answers with the result, or with the state when it still runs.
  struct Waiter {
    Reply reply;
    bool done = false;
  };
  struct Job {
    QString name;
    bool running = false;
    QElapsedTimer clock;
    QStringList summary;
    QJsonObject result;
    std::vector<std::shared_ptr<Waiter>> waiters;
    std::vector<QMetaObject::Connection> links;
  };
  bool startJob(const QString& name, Reply& reply);  // false: another one runs (answered)
  void finishJob(QJsonObject result = {});
  void await(int waitS, Reply reply);
  QJsonObject jobState() const;

  MainWindow* w_;
  Server* server_;
  Job job_;
};

}  // namespace xr::gui::mcp
