#include "gui/mcp/McpServer.h"

#include <QCoreApplication>
#include <QJsonDocument>
#include <QStringList>
#include <memory>

namespace xr::gui::mcp {

namespace {

// The protocol versions answered with themselves; any other gets the newest.
const QStringList kVersions{"2025-06-18", "2025-03-26", "2024-11-05"};

QJsonObject response(const QJsonValue& id, const QJsonObject& result) {
  return {{"jsonrpc", "2.0"}, {"id", id}, {"result", result}};
}

QJsonObject errorResponse(const QJsonValue& id, int code, const QString& message) {
  return {{"jsonrpc", "2.0"}, {"id", id}, {"error", QJsonObject{{"code", code}, {"message", message}}}};
}

QJsonObject typeSchema(QString type) {
  if (type.startsWith("array<") && type.endsWith('>'))
    return {{"type", "array"}, {"items", typeSchema(type.mid(6, type.size() - 7))}};
  return {{"type", type}};
}

}  // namespace

Result Result::text(const QString& s, bool error) {
  Result r;
  r.error = error;
  r.add(s);
  return r;
}

Result Result::json(const QJsonValue& v) {
  QByteArray bytes = v.isObject()  ? QJsonDocument(v.toObject()).toJson(QJsonDocument::Compact)
                     : v.isArray() ? QJsonDocument(v.toArray()).toJson(QJsonDocument::Compact)
                                   : v.toVariant().toString().toUtf8();
  return text(QString::fromUtf8(bytes));
}

Result& Result::add(const QString& s) {
  content.append(QJsonObject{{"type", "text"}, {"text", s}});
  return *this;
}

Result& Result::image(const QByteArray& png) {
  content.append(QJsonObject{{"type", "image"}, {"data", QString::fromLatin1(png.toBase64())}, {"mimeType", "image/png"}});
  return *this;
}

QJsonObject schemaOf(std::initializer_list<Param> params) {
  QJsonObject props;
  QJsonArray required;
  for (const Param& p : params) {
    QJsonObject s = typeSchema(p.type);
    if (!p.description.isEmpty()) s["description"] = p.description;
    for (auto it = p.extra.begin(); it != p.extra.end(); ++it) s[it.key()] = it.value();
    props[p.name] = s;
    if (p.required) required.append(p.name);
  }
  QJsonObject out{{"type", "object"}, {"properties", props}};
  if (!required.isEmpty()) out["required"] = required;
  return out;
}

Server::Server(QString instructions, QObject* parent) : QObject(parent), instructions_(std::move(instructions)) {}

void Server::add(Tool t) { tools_.push_back(std::move(t)); }

void Server::handle(const QJsonObject& msg, std::function<void(QJsonObject)> respond) {
  const QString method = msg.value("method").toString();
  const bool notification = !msg.contains("id");
  const QJsonValue id = msg.value("id");
  if (notification) {  // notifications/initialized, cancelled ...: nothing to answer
    respond({});
    return;
  }
  if (msg.value("jsonrpc").toString() != "2.0" || method.isEmpty()) {
    respond(errorResponse(id, -32600, "Invalid Request"));
    return;
  }
  const QJsonObject params = msg.value("params").toObject();
  if (method == "initialize") {
    QString asked = params.value("protocolVersion").toString();
    respond(response(id, {{"protocolVersion", kVersions.contains(asked) ? asked : kVersions.front()},
                          {"capabilities", QJsonObject{{"tools", QJsonObject{{"listChanged", false}}}}},
                          {"serverInfo", QJsonObject{{"name", kName}, {"title", "XrTopoR"},
                                                     {"version", QCoreApplication::applicationVersion().isEmpty()
                                                                     ? QStringLiteral("0.1")
                                                                     : QCoreApplication::applicationVersion()}}},
                          {"instructions", instructions_}}));
    return;
  }
  if (method == "ping") {
    respond(response(id, {}));
    return;
  }
  if (method == "tools/list") {
    QJsonArray list;
    for (const Tool& t : tools_) {
      QJsonObject o{{"name", t.name}, {"description", t.description}, {"inputSchema", t.schema}};
      if (t.readOnly) o["annotations"] = QJsonObject{{"readOnlyHint", true}};
      list.append(o);
    }
    respond(response(id, {{"tools", list}}));
    return;
  }
  if (method == "tools/call") {
    const QString name = params.value("name").toString();
    auto it = std::find_if(tools_.begin(), tools_.end(), [&](const Tool& t) { return t.name == name; });
    if (it == tools_.end()) {
      respond(errorResponse(id, -32602, QString("Unknown tool: %1").arg(name)));
      return;
    }
    emit called(name);
    // Exactly one answer, whatever the tool does.
    auto answered = std::make_shared<bool>(false);
    Reply reply = [id, respond, answered](Result r) {
      if (std::exchange(*answered, true)) return;
      respond(response(id, {{"content", r.content}, {"isError", r.error}}));
    };
    try {
      it->run(params.value("arguments").toObject(), reply);
    } catch (const std::exception& e) {
      reply(Result::fail(QString("Internal error: %1").arg(e.what())));
    }
    return;
  }
  respond(errorResponse(id, -32601, QString("Method not found: %1").arg(method)));
}

void Server::handleText(const QByteArray& body, std::function<void(QByteArray)> respond) {
  QJsonParseError err;
  QJsonDocument doc = QJsonDocument::fromJson(body, &err);
  if (err.error != QJsonParseError::NoError || !doc.isObject()) {
    respond(QJsonDocument(errorResponse(QJsonValue::Null, err.error != QJsonParseError::NoError ? -32700 : -32600,
                                        err.error != QJsonParseError::NoError ? "Parse error" : "Invalid Request"))
                .toJson(QJsonDocument::Compact));
    return;
  }
  handle(doc.object(), [respond](const QJsonObject& r) {
    respond(r.isEmpty() ? QByteArray() : QJsonDocument(r).toJson(QJsonDocument::Compact));
  });
}

}  // namespace xr::gui::mcp
