#pragma once
// The editor's MCP server (Model Context Protocol, JSON-RPC 2.0): the tools an agent drives the open design with.
// No sockets here — a transport (McpTransports.h: HTTP on 127.0.0.1, stdio) hands every message to handle(); the
// tools (McpTools.h) run in the GUI thread, on the board the user sees, each edit one step of the undo history.
#include <QJsonArray>
#include <QJsonObject>
#include <QObject>
#include <QString>
#include <functional>
#include <initializer_list>
#include <vector>

namespace xr::gui::mcp {

// What a tool returns: MCP content items (text, images) and whether it failed (the agent reads why).
struct Result {
  QJsonArray content;
  bool error = false;
  static Result text(const QString& s, bool error = false);
  static Result json(const QJsonValue& v);  // compact JSON as text
  static Result fail(const QString& s) { return text(s, true); }
  Result& add(const QString& s);
  Result& image(const QByteArray& png);
};
using Reply = std::function<void(Result)>;

// A parameter of a tool's input schema. `type`: string, number, integer, boolean, object, or array<item type>
// ("array<number>", "array<array<number>>", ...).
struct Param {
  QString name, type, description;
  bool required = false;
  QJsonObject extra = {};  // enum, minimum, default ...
};
QJsonObject schemaOf(std::initializer_list<Param> params);

struct Tool {
  QString name, description;
  QJsonObject schema;  // inputSchema
  // Answers through `reply`, now or later (a procedure waited for), exactly once.
  std::function<void(const QJsonObject& args, Reply reply)> run;
  bool readOnly = false;
};

class Server : public QObject {
  Q_OBJECT
 public:
  explicit Server(QString instructions, QObject* parent = nullptr);
  void add(Tool t);
  const std::vector<Tool>& tools() const { return tools_; }

  // A request or a notification; `respond` gets the response, an empty object for a notification (nothing to send).
  // It may be called later, when a tool that waits answers.
  void handle(const QJsonObject& msg, std::function<void(QJsonObject)> respond);
  // A message as received: a JSON error is answered as JSON-RPC says. Empty bytes: nothing to send.
  void handleText(const QByteArray& body, std::function<void(QByteArray)> respond);

  static constexpr const char* kName = "xrtopor";

 signals:
  void called(const QString& tool);  // a tool started (the status bar says so)

 private:
  QString instructions_;
  std::vector<Tool> tools_;
};

}  // namespace xr::gui::mcp
