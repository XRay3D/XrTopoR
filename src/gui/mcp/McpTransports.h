#pragma once
// How the MCP server is reached. HTTP: MCP's «Streamable HTTP» without sessions or streams, on 127.0.0.1 only —
// POST /mcp with a JSON-RPC message, answered with JSON (202 for a notification); a browser's page from elsewhere
// is refused by its Origin. Stdio: one JSON message per line on stdin, the answers on stdout (a client that starts
// the editor itself: `xrtopor --mcp-stdio`).
#include <QByteArray>
#include <QHash>
#include <QObject>
#include <QPointer>

class QSocketNotifier;
class QTcpServer;
class QTcpSocket;

namespace xr::gui::mcp {

class Server;

class HttpTransport : public QObject {
  Q_OBJECT
 public:
  HttpTransport(Server* server, QObject* parent = nullptr);
  bool listen(quint16 port);  // 0: any free port
  bool listening() const;
  quint16 port() const;
  QString url() const;  // http://127.0.0.1:<port>/mcp
  QString error() const { return error_; }

 private:
  void readFrom(QTcpSocket* s);
  void reply(QTcpSocket* s, int status, const QByteArray& body, const QByteArray& type = "application/json");

  Server* server_;
  QTcpServer* tcp_;
  QString error_;
  QHash<QTcpSocket*, QByteArray> buffers_;
};

class StdioTransport : public QObject {
  Q_OBJECT
 public:
  explicit StdioTransport(Server* server, QObject* parent = nullptr);

 signals:
  void closed();  // stdin ended: the client is gone

 private:
  void readIn();
  Server* server_;
  QSocketNotifier* notifier_ = nullptr;
  QByteArray buffer_;
};

}  // namespace xr::gui::mcp
