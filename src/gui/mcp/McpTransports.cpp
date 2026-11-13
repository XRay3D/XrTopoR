#include "gui/mcp/McpTransports.h"

#include <QHostAddress>
#include <QSocketNotifier>
#include <QTcpServer>
#include <QTcpSocket>
#include <QUrl>
#include <cstdio>

#ifdef Q_OS_UNIX
#include <unistd.h>
#endif

#include "gui/mcp/McpServer.h"

namespace xr::gui::mcp {

namespace {

constexpr qsizetype kMaxRequest = 16 * 1024 * 1024;

const char* reason(int status) {
  switch (status) {
    case 200: return "OK";
    case 202: return "Accepted";
    case 400: return "Bad Request";
    case 403: return "Forbidden";
    case 404: return "Not Found";
    case 405: return "Method Not Allowed";
    case 413: return "Payload Too Large";
    default: return "Error";
  }
}

// A page of another site (DNS rebinding) must not reach the editor: only a local origin, or none (not a browser).
bool localOrigin(const QByteArray& origin) {
  if (origin.isEmpty() || origin == "null") return origin.isEmpty();
  QString host = QUrl(QString::fromLatin1(origin)).host();
  return host == "localhost" || host == "127.0.0.1" || host == "::1" || host == "[::1]";
}

}  // namespace

HttpTransport::HttpTransport(Server* server, QObject* parent) : QObject(parent), server_(server), tcp_(new QTcpServer(this)) {
  connect(tcp_, &QTcpServer::newConnection, this, [this] {
    while (QTcpSocket* s = tcp_->nextPendingConnection()) {
      buffers_[s] = {};
      connect(s, &QTcpSocket::readyRead, this, [this, s] { readFrom(s); });
      connect(s, &QTcpSocket::disconnected, this, [this, s] {
        buffers_.remove(s);
        s->deleteLater();
      });
    }
  });
}

bool HttpTransport::listen(quint16 port) {
  if (tcp_->isListening()) tcp_->close();
  if (tcp_->listen(QHostAddress::LocalHost, port)) {
    error_.clear();
    return true;
  }
  error_ = tcp_->errorString();
  return false;
}

bool HttpTransport::listening() const { return tcp_->isListening(); }
quint16 HttpTransport::port() const { return tcp_->serverPort(); }
QString HttpTransport::url() const { return QString("http://127.0.0.1:%1/mcp").arg(port()); }

void HttpTransport::readFrom(QTcpSocket* s) {
  QByteArray& buf = buffers_[s];
  buf += s->readAll();
  if (buf.size() > kMaxRequest) {
    reply(s, 413, {});
    return;
  }
  const qsizetype headEnd = buf.indexOf("\r\n\r\n");
  if (headEnd < 0) return;
  const QList<QByteArray> lines = buf.left(headEnd).split('\n');
  const QList<QByteArray> request = lines.value(0).trimmed().split(' ');
  QHash<QByteArray, QByteArray> headers;
  for (qsizetype i = 1; i < lines.size(); ++i)
    if (qsizetype c = lines[i].indexOf(':'); c > 0) headers[lines[i].left(c).trimmed().toLower()] = lines[i].mid(c + 1).trimmed();
  const qsizetype length = headers.value("content-length", "0").toLongLong();
  if (buf.size() < headEnd + 4 + length) return;  // the body is still coming
  const QByteArray body = buf.mid(headEnd + 4, length);
  buf.clear();
  const QByteArray method = request.value(0), path = request.value(1).split('?').value(0);
  if (!localOrigin(headers.value("origin"))) {
    reply(s, 403, R"({"error":"origin not allowed"})");
    return;
  }
  if (path != "/mcp" && path != "/") {
    reply(s, 404, {});
    return;
  }
  if (method != "POST") {  // no server-sent stream: GET (and DELETE of a session) are not offered
    reply(s, 405, {});
    return;
  }
  QPointer<QTcpSocket> alive(s);
  server_->handleText(body, [this, alive](const QByteArray& out) {
    if (!alive) return;  // the client gave up while a tool worked
    if (out.isEmpty()) reply(alive, 202, {});
    else reply(alive, 200, out);
  });
}

void HttpTransport::reply(QTcpSocket* s, int status, const QByteArray& body, const QByteArray& type) {
  QByteArray head = "HTTP/1.1 " + QByteArray::number(status) + ' ' + reason(status) + "\r\n";
  if (status == 405) head += "Allow: POST\r\n";
  if (!body.isEmpty()) head += "Content-Type: " + type + "\r\n";
  head += "Content-Length: " + QByteArray::number(body.size()) + "\r\nConnection: close\r\n\r\n";
  s->write(head + body);
  s->disconnectFromHost();  // after what is written
}

StdioTransport::StdioTransport(Server* server, QObject* parent) : QObject(parent), server_(server) {
#ifdef Q_OS_UNIX
  notifier_ = new QSocketNotifier(0, QSocketNotifier::Read, this);
  connect(notifier_, &QSocketNotifier::activated, this, &StdioTransport::readIn);
#endif
}

void StdioTransport::readIn() {
#ifdef Q_OS_UNIX
  char chunk[65536];
  const ssize_t n = ::read(0, chunk, sizeof chunk);
  if (n <= 0) {
    notifier_->setEnabled(false);
    emit closed();
    return;
  }
  buffer_.append(chunk, n);
  for (qsizetype nl; (nl = buffer_.indexOf('\n')) >= 0;) {
    const QByteArray line = buffer_.left(nl).trimmed();
    buffer_.remove(0, nl + 1);
    if (line.isEmpty()) continue;
    server_->handleText(line, [](const QByteArray& out) {
      if (out.isEmpty()) return;
      std::fwrite(out.constData(), 1, size_t(out.size()), stdout);
      std::fputc('\n', stdout);
      std::fflush(stdout);
    });
  }
#endif
}

}  // namespace xr::gui::mcp
