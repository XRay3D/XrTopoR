#include "gui/mcp/McpTools.h"

#include <QBuffer>
#include <QCheckBox>
#include <QDoubleSpinBox>
#include <QFileInfo>
#include <QImage>
#include <QLabel>
#include <QProgressBar>
#include <QRadioButton>
#include <QRegularExpression>
#include <QSpinBox>
#include <QTimer>
#include <QTreeWidget>
#include <QUndoStack>
#include <algorithm>
#include <cmath>
#include <map>
#include <optional>
#include <set>

#include "core/Edit.h"
#include "drc/Drc.h"
#include "gui/AutorouteWindow.h"
#include "gui/BoardView.h"
#include "gui/Commands.h"
#include "gui/DrcDialog.h"
#include "gui/MainWindow.h"
#include "gui/MessagesPanel.h"
#include "io/BoardIO.h"
#include "router/topo/ModelTools.h"
#include "topo/Topology.h"

namespace xr::gui::mcp {

namespace {

// ---------------------------------------------------------------- units and names

double mm(double nm) { return std::round(nm / 1e3) / 1e3; }  // to the micrometre
QJsonArray xy(Vec2 p) { return {mm(p.x), mm(p.y)}; }
Vec2 nmAt(double xMm, double yMm) { return {xMm * kNmPerMm, yMm * kNmPerMm}; }
QString qs(const std::string& s) { return QString::fromStdString(s); }

QString padRef(const Board& b, int i) {
  const Pad& p = b.pads[size_t(i)];
  if (p.component < 0) return QString("pad:%1").arg(i);
  return qs(b.components[size_t(p.component)].ref) + "." + qs(p.number);
}

QString layerName(const Board& b, LayerId l) { return l >= 0 && l < LayerId(b.layers.size()) ? qs(b.layers[size_t(l)].name) : QString(); }

QString netName(const Board& b, int net) { return net >= 0 && net < int(b.nets.size()) ? qs(b.nets[size_t(net)].name) : QString(); }

QJsonArray layerNames(const Board& b, LayerMask m) {
  QJsonArray out;
  for (LayerId l : b.copperLayers())
    if ((m >> l) & 1) out.append(layerName(b, l));
  return out;
}

QString describe(const Board& b, ItemRef r) {
  switch (r.type) {
    case ItemType::Pad: return padRef(b, r.index);
    case ItemType::Track: return QString("track:%1").arg(b.tracks[size_t(r.index)].id);
    case ItemType::Via: return QString("via:%1").arg(b.vias[size_t(r.index)].id);
    case ItemType::Zone: return QString("zone:%1").arg(r.index);
    case ItemType::Keepout: return QString("keepout:%1").arg(r.index);
    case ItemType::Text: return QString("text:%1").arg(r.index);
    case ItemType::Detail: return QString("detail:%1").arg(r.index);
  }
  return {};
}

// A copper layer by its name (any case), or "top" / "bottom"; -1: none such.
LayerId copperLayer(const Board& b, const QString& name) {
  if (name.compare("top", Qt::CaseInsensitive) == 0) return b.topCopper();
  if (name.compare("bottom", Qt::CaseInsensitive) == 0) return b.bottomCopper();
  for (LayerId l : b.copperLayers())
    if (layerName(b, l).compare(name, Qt::CaseInsensitive) == 0) return l;
  return -1;
}

int findPad(const Board& b, const QString& ref) {
  const qsizetype dot = ref.lastIndexOf('.');
  if (dot <= 0) return -1;
  const int c = b.findComponent(ref.left(dot).toStdString());
  if (c < 0) return -1;
  const std::string number = ref.mid(dot + 1).toStdString();
  for (int p : b.components[size_t(c)].pads)
    if (b.pads[size_t(p)].number == number) return p;
  return -1;
}

int trackById(const Board& b, uint32_t id) {
  auto it = r::find(b.tracks, id, &Track::id);
  return it == b.tracks.end() ? -1 : int(it - b.tracks.begin());
}
int viaById(const Board& b, uint32_t id) {
  auto it = r::find(b.vias, id, &Via::id);
  return it == b.vias.end() ? -1 : int(it - b.vias.begin());
}

// A filter: a wildcard pattern when it has * or ?, else a part of the name; any case.
std::function<bool(const QString&)> matcher(const QString& f) {
  if (f.isEmpty()) return [](const QString&) { return true; };
  if (f.contains('*') || f.contains('?')) {
    QRegularExpression re(QRegularExpression::wildcardToRegularExpression(f), QRegularExpression::CaseInsensitiveOption);
    return [re](const QString& s) { return re.match(s).hasMatch(); };
  }
  return [f](const QString& s) { return s.contains(f, Qt::CaseInsensitive); };
}

std::vector<int> unroutedByNet(const Board& b, const Connectivity& c) {
  std::vector<int> n(b.nets.size(), 0);
  for (const RatsLine& l : c.ratsnest)
    if (l.net >= 0) ++n[size_t(l.net)];
  return n;
}

QJsonObject violationJson(const Board& b, const DrcViolation& v) {
  QJsonObject o{{"type", drcTypeName(v.type)}, {"message", qs(v.message)}, {"at", xy(v.pos)}};
  if (v.layer >= 0) o["layer"] = layerName(b, v.layer);
  QJsonArray items;
  if (v.a.index >= 0) items.append(describe(b, v.a));
  if (v.hasB && v.b.index >= 0) items.append(describe(b, v.b));
  if (!items.isEmpty()) o["items"] = items;
  if (v.required > 0) {
    o["actual_mm"] = mm(v.actual);
    o["required_mm"] = mm(v.required);
  }
  return o;
}

// Modal dialogs and the cursor's tools: a call would wait for the user. The tools of this server do these.
const QStringList kBlocked{"Cmd_NewProject",   "Accel_FileOpen",  "Cmd_ImportDesign", "Cmd_OpenExamples", "Cmd_CloseProject",
                           "Accel_FileSave",   "Cmd_SaveAs",      "Cmd_ImportSes",    "Cmd_ExportDesign", "Cmd_ExportSvg",
                           "Cmd_ExportBom",    "Cmd_Gerber",      "Cmd_Drill",        "Cmd_Exit",         "Accel_ChangeNet",
                           "Accel_Width",      "Cmd_RotateAngle", "Accel_ShowDPE",    "Cmd_TextStyles",   "Accel_DRC",
                           "Cmd_HotkeysHelp",  "Cmd_Settings",    "Cmd_About",        "Accel_Layer",      "Accel_Paste",
                           "Cmd_Summary",      "Cmd_CopperArea",  "Cmd_WiresToCopper"};

int intArg(const QJsonObject& a, const char* k, int def) { return a.contains(k) ? a.value(k).toInt(def) : def; }

}  // namespace

// ---------------------------------------------------------------- the server's instructions

QString Tools::instructions() {
  return QStringLiteral(
      "XrTopoR: a topological PCB editor and router (a TopoR 7 clone) with the design open in its window. Tools act on "
      "that design as the user does: the user sees every change, and every edit is one step of the editor's undo.\n"
      "Units: mm, the board's frame (Y grows down). References: a net by name, a component by designator, a pad as "
      "\"U1.3\", tracks and vias by their stable ids (\"track:12\", \"via:5\" in listings; ids, not indices, survive "
      "edits).\n"
      "Typical routing: info -> ratsnest / nets(unrouted_only) -> autoroute (variants, then the best opens) -> drc -> "
      "screenshot of the problem spots -> route / delete / move_component -> reshape (F5), refine (F6), optimize (F7) "
      "-> drc -> save. Procedures run one at a time; a call waits up to wait_s seconds and else returns the state: "
      "poll with job.\n"
      "route lays one connection the way the editor's routing tool does: over the topological model, pushing other "
      "nets' wires aside. A connection between pads on different layers needs a via: route to a point, add_via there, "
      "route on from it.");
}

// ---------------------------------------------------------------- jobs

bool Tools::startJob(const QString& name, Reply& reply) {
  if (job_.running) {
    reply(Result::fail(QString("Busy: %1 is running (job to wait for it, job(stop=true) to stop it)").arg(job_.name)));
    return false;
  }
  for (auto& l : job_.links) disconnect(l);
  job_ = {};
  job_.name = name;
  job_.running = true;
  job_.clock.start();
  return true;
}

void Tools::finishJob(QJsonObject result) {
  if (!job_.running) return;
  job_.running = false;
  for (auto& l : job_.links) disconnect(l);
  job_.links.clear();
  result["job"] = job_.name;
  result["seconds"] = std::round(job_.clock.elapsed() / 100.0) / 10.0;
  if (!job_.summary.isEmpty()) result["summary"] = job_.summary.join("\n");
  job_.result = result;
  auto waiters = std::move(job_.waiters);
  job_.waiters.clear();
  for (auto& wt : waiters)
    if (!std::exchange(wt->done, true)) wt->reply(Result::json(result));
}

QJsonObject Tools::jobState() const {
  if (!job_.running) {
    if (job_.name.isEmpty()) return {{"running", false}};
    QJsonObject o = job_.result;
    o["running"] = false;
    return o;
  }
  QJsonObject o{{"job", job_.name}, {"running", true}, {"seconds", std::round(job_.clock.elapsed() / 100.0) / 10.0}};
  if (job_.name == "autoroute" && w_->autoroute_) {
    o["stage"] = w_->autoroute_->operation_->text();
    o["percent"] = w_->autoroute_->progress_->value();
    o["variants"] = int(w_->autoroute_->variants().size());
  }
  return o;
}

void Tools::await(int waitS, Reply reply) {
  if (!job_.running || waitS <= 0) {
    reply(Result::json(jobState()));
    return;
  }
  auto wt = std::make_shared<Waiter>(Waiter{std::move(reply)});
  job_.waiters.push_back(wt);
  QTimer::singleShot(std::min(waitS, 3600) * 1000, this, [this, wt] {
    if (std::exchange(wt->done, true)) return;
    std::erase(job_.waiters, wt);
    wt->reply(Result::json(jobState()));
  });
}

// ---------------------------------------------------------------- the tools

Tools::Tools(MainWindow* w, Server* server) : QObject(server), w_(w), server_(server) {
  addDocumentTools();
  addQueryTools();
  addEditTools();
  addProcedureTools();
  addViewTools();
  // F6 and F7 say when they are done (a chain of them: when the last one is).
  connect(w_, &MainWindow::procedureFinished, this, [this](const QString& title, const QString& summary, bool more) {
    if (!job_.running || job_.name == "autoroute") return;
    job_.summary << title + ": " + summary;
    if (!more) finishJob();
  });
  // A design replaced under a procedure ends it.
  connect(w_->document(), &Document::boardReplaced, this, [this] {
    if (job_.running && job_.name != "autoroute") finishJob({{"stopped", "the design was replaced"}});
  });
}

#define NEED_BOARD                                                            \
  if (!w_->document()->hasBoard()) {                                          \
    reply(Result::fail("No design is open: open(path) first"));             \
    return;                                                                   \
  }                                                                           \
  Board& b = *w_->document()->board();                                       \
  (void)b

void Tools::addDocumentTools() {
  server_->add({"info",
                "The open design: file, project, copper layers, counts, routed length, vias, unrouted connections, the "
                "last DRC, the procedure running, the undo history.",
                schemaOf({}),
                [this](const QJsonObject&, Reply reply) {
                  Document* doc = w_->document();
                  QJsonObject o{{"job", jobState()}};
                  if (!doc->hasBoard()) {
                    o["open"] = false;
                    reply(Result::json(o));
                    return;
                  }
                  Board& b = *doc->board();
                  topo::Topology::assignIds(b);
                  const Connectivity& c = doc->connectivity();
                  o["open"] = true;
                  o["file"] = doc->path();
                  if (w_->project()) o["project"] = w_->project()->path();
                  o["modified"] = !doc->undoStack()->isClean();
                  BBox bb = b.bbox();
                  if (bb.valid()) o["bbox"] = QJsonArray{mm(bb.minX), mm(bb.minY), mm(bb.maxX), mm(bb.maxY)};
                  QJsonArray layers;
                  for (LayerId l : b.copperLayers()) {
                    QJsonObject lo{{"name", layerName(b, l)}, {"index", b.layers[size_t(l)].copperIndex}};
                    if (b.layers[size_t(l)].plane) lo["plane_net"] = netName(b, b.layers[size_t(l)].planeNet);
                    layers.append(lo);
                  }
                  o["copper_layers"] = layers;
                  o["active_layer"] = layerName(b, doc->activeCopper());
                  o["counts"] = QJsonObject{{"components", int(b.components.size())}, {"pads", int(b.pads.size())},
                                            {"nets", int(b.nets.size())},             {"tracks", int(b.tracks.size())},
                                            {"vias", int(b.vias.size())},             {"zones", int(b.zones.size())}};
                  o["length_mm"] = std::round(b.tracksLength() / 1e5) / 10.0;
                  o["unrouted_connections"] = int(c.ratsnest.size());
                  o["unrouted_nets"] = c.unroutedNets;
                  o["drc"] = doc->drcRun() ? QJsonObject{{"violations", int(doc->drc().size())}} : QJsonObject{{"run", false}};
                  QUndoStack* u = doc->undoStack();
                  o["undo"] = QJsonObject{{"index", u->index()}, {"count", u->count()}, {"next_undo", u->undoText()}};
                  reply(Result::json(o));
                },
                true});

  server_->add({"open",
                "Opens a design (.fst, .kicad_pcb, .dsn, P-CAD ASCII .pcb) or a TopoR project (.fsproj) in the editor. "
                "Refuses when the open design has unsaved changes, unless discard is true.",
                schemaOf({{"path", "string", "Absolute path of the file", true},
                          {"discard", "boolean", "Drop unsaved changes of the open design"}}),
                [this](const QJsonObject& a, Reply reply) {
                  const QString path = a.value("path").toString();
                  QFileInfo fi(path);
                  if (!fi.isFile()) {
                    reply(Result::fail(QString("No such file: %1").arg(path)));
                    return;
                  }
                  Document* doc = w_->document();
                  if (doc->hasBoard() && !doc->undoStack()->isClean() && !a.value("discard").toBool()) {
                    reply(Result::fail("The open design has unsaved changes: save first, or open with discard=true"));
                    return;
                  }
                  if (job_.running) {
                    reply(Result::fail(QString("Busy: %1 is running (job(stop=true) first)").arg(job_.name)));
                    return;
                  }
                  QString error;
                  w_->quietError_ = &error;
                  bool ok = w_->openFile(fi.absoluteFilePath());
                  w_->quietError_ = nullptr;
                  if (!ok) {
                    reply(Result::fail(error.isEmpty() ? QString("Could not open %1").arg(path) : error));
                    return;
                  }
                  doc->undoStack()->setClean();
                  reply(Result::json(QJsonObject{{"opened", doc->path()}, {"project", w_->project() ? w_->project()->path() : QString()}}));
                }});

  server_->add({"save",
                "Saves the design: to its own file, or to `path` (Save As: the file joins the project; the format by its "
                "extension: .fst, .kicad_pcb, .dsn, .pcb as read).",
                schemaOf({{"path", "string", "Absolute path to save as; empty: the design's own file"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  QString path = a.value("path").toString();
                  QString error;
                  w_->quietError_ = &error;
                  bool ok;
                  if (path.isEmpty()) {
                    const QString own = w_->document()->path();
                    if (own.isEmpty() || io::detectFormat(own.toStdString()) == io::Format::Unknown) {
                      w_->quietError_ = nullptr;
                      reply(Result::fail("The design has no file of a writable format: give path"));
                      return;
                    }
                    ok = w_->save();
                  } else {
                    ok = w_->saveAs(QFileInfo(path).absoluteFilePath());
                  }
                  w_->quietError_ = nullptr;
                  if (!ok) reply(Result::fail(error.isEmpty() ? QString("Not saved") : error));
                  else reply(Result::json(QJsonObject{{"saved", w_->document()->path()}}));
                }});
}

void Tools::addQueryTools() {
  server_->add({"nets",
                "The nets: pads, tracks, vias, routed length, unrouted connections, class, fixation. Sorted by name.",
                schemaOf({{"filter", "string", "Part of the name, or a wildcard pattern (* ?)"},
                          {"unrouted_only", "boolean", "Only the nets with unrouted connections"},
                          {"limit", "integer", "At most this many (default 200)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const Connectivity& c = w_->document()->connectivity();
                  auto open = unroutedByNet(b, c);
                  auto match = matcher(a.value("filter").toString());
                  const bool onlyOpen = a.value("unrouted_only").toBool();
                  const int limit = intArg(a, "limit", 200);
                  std::vector<int> pads(b.nets.size()), tracks(b.nets.size()), vias(b.nets.size());
                  std::vector<double> length(b.nets.size());
                  for (const Pad& p : b.pads)
                    if (p.net >= 0) ++pads[size_t(p.net)];
                  for (const Track& t : b.tracks)
                    if (t.net >= 0) ++tracks[size_t(t.net)], length[size_t(t.net)] += t.length();
                  for (const Via& v : b.vias)
                    if (v.net >= 0) ++vias[size_t(v.net)];
                  std::vector<int> order(b.nets.size());
                  for (size_t i = 0; i < order.size(); ++i) order[i] = int(i);
                  r::sort(order, [&](int x, int y) { return b.nets[size_t(x)].name < b.nets[size_t(y)].name; });
                  QJsonArray list;
                  int total = 0;
                  for (int n : order) {
                    const Net& net = b.nets[size_t(n)];
                    if (!match(qs(net.name)) || (onlyOpen && open[size_t(n)] == 0)) continue;
                    if (++total > limit) continue;
                    QJsonObject o{{"name", qs(net.name)}, {"pads", pads[size_t(n)]}, {"tracks", tracks[size_t(n)]},
                                  {"vias", vias[size_t(n)]}, {"length_mm", std::round(length[size_t(n)] / 1e4) / 100.0},
                                  {"unrouted", open[size_t(n)]}, {"class", qs(b.classOf(n).name)}};
                    if (net.flexFixed) o["flex_fixed"] = true;
                    if (!net.route) o["route"] = false;
                    list.append(o);
                  }
                  reply(Result::json(QJsonObject{{"nets", list}, {"matched", total}}));
                },
                true});

  server_->add({"net",
                "One net in detail: its pads (with layers), vias, tracks by layer, unrouted connections, the width and "
                "clearance its rules give on each copper layer. geometry=true adds every track (id, layer, ends, arc "
                "middle, width).",
                schemaOf({{"name", "string", "Net name", true}, {"geometry", "boolean", "List the tracks one by one"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int n = b.findNet(a.value("name").toString().toStdString());
                  if (n < 0) {
                    reply(Result::fail(QString("No net %1").arg(a.value("name").toString())));
                    return;
                  }
                  topo::Topology::assignIds(b);
                  const Connectivity& c = w_->document()->connectivity();
                  QJsonArray pads, vias, tracks, open, rules;
                  for (int i = 0; i < int(b.pads.size()); ++i)
                    if (b.pads[size_t(i)].net == n)
                      pads.append(QJsonObject{{"pad", padRef(b, i)}, {"at", xy(b.pads[size_t(i)].pos.v())},
                                              {"layers", layerNames(b, b.pads[size_t(i)].copper)},
                                              {"through", b.pads[size_t(i)].isThrough()}});
                  for (const Via& v : b.vias)
                    if (v.net == n)
                      vias.append(QJsonObject{{"id", int(v.id)}, {"at", xy(v.pos.v())}, {"diameter_mm", mm(v.diameter)},
                                              {"drill_mm", mm(v.drill)}, {"locked", v.locked}});
                  std::map<LayerId, double> byLayer;
                  for (const Track& t : b.tracks) {
                    if (t.net != n) continue;
                    byLayer[t.layer] += t.length();
                    if (!a.value("geometry").toBool()) continue;
                    QJsonObject o{{"id", int(t.id)}, {"layer", layerName(b, t.layer)}, {"a", xy(t.a.v())}, {"b", xy(t.b.v())},
                                  {"width_mm", mm(t.width)}};
                    if (t.mid) o["mid"] = xy(t.mid->v());
                    if (t.locked) o["locked"] = true;
                    tracks.append(o);
                  }
                  QJsonObject lengths;
                  for (auto [l, len] : byLayer) lengths[layerName(b, l)] = std::round(len / 1e4) / 100.0;
                  for (const RatsLine& l : c.ratsnest)
                    if (l.net == n) open.append(QJsonObject{{"from", describe(b, l.from)}, {"to", describe(b, l.to)}, {"a", xy(l.a)}, {"b", xy(l.b)}});
                  for (LayerId l : b.copperLayers())
                    rules.append(QJsonObject{{"layer", layerName(b, l)}, {"width_mm", mm(b.trackWidth(n, l))},
                                             {"min_width_mm", mm(b.minTrackWidth(n, l))}, {"clearance_mm", mm(b.clearance(n, l))}});
                  const NetClass& nc = b.classOf(n);
                  QJsonObject o{{"name", qs(b.nets[size_t(n)].name)}, {"class", qs(nc.name)}, {"pads", pads}, {"vias", vias},
                                {"length_mm_by_layer", lengths}, {"unrouted", open}, {"rules", rules},
                                {"via_mm", QJsonArray{mm(nc.viaDiameter), mm(nc.viaDrill)}}};
                  if (LayerMask m = b.assignedLayers(n)) o["assigned_layers"] = layerNames(b, m);
                  if (b.nets[size_t(n)].flexFixed) o["flex_fixed"] = true;
                  if (a.value("geometry").toBool()) o["tracks"] = tracks;
                  reply(Result::json(o));
                },
                true});

  server_->add({"components",
                "The components: designator, value, footprint, position, angle, side, fixation, pad count.",
                schemaOf({{"filter", "string", "Part of the designator, value or footprint, or a wildcard pattern"},
                          {"limit", "integer", "At most this many (default 300)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  auto match = matcher(a.value("filter").toString());
                  const int limit = intArg(a, "limit", 300);
                  QJsonArray list;
                  int total = 0;
                  for (const Component& c : b.components) {
                    if (!match(qs(c.ref)) && !match(qs(c.value)) && !match(qs(c.footprint))) continue;
                    if (++total > limit) continue;
                    QJsonObject o{{"ref", qs(c.ref)}, {"value", qs(c.value)}, {"footprint", qs(c.footprint)}, {"at", xy(c.pos.v())},
                                  {"angle", c.angle}, {"side", c.side == Side::Bottom ? "bottom" : "top"}, {"pads", int(c.pads.size())}};
                    if (c.locked) o["locked"] = true;
                    list.append(o);
                  }
                  reply(Result::json(QJsonObject{{"components", list}, {"matched", total}}));
                },
                true});

  server_->add({"component",
                "One component with its pads: number, net, position, size, drill, copper layers.",
                schemaOf({{"ref", "string", "Designator", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int ci = b.findComponent(a.value("ref").toString().toStdString());
                  if (ci < 0) {
                    reply(Result::fail(QString("No component %1").arg(a.value("ref").toString())));
                    return;
                  }
                  const Component& c = b.components[size_t(ci)];
                  QJsonArray pads;
                  for (int p : c.pads) {
                    const Pad& pad = b.pads[size_t(p)];
                    QJsonObject o{{"pad", padRef(b, p)}, {"net", netName(b, pad.net)}, {"at", xy(pad.pos.v())},
                                  {"size_mm", QJsonArray{mm(double(pad.shape.w)), mm(double(pad.shape.h))}}, {"angle", pad.angle},
                                  {"layers", layerNames(b, pad.copper)}};
                    if (pad.drill > 0) o["drill_mm"] = mm(double(pad.drill));
                    if (pad.pinEqual) o["pin_equal"] = pad.pinEqual;  // (swappable with the pins of its gate of the same value)
                    if (pad.gateEqual) {  // (its gate swappable with the gates of the same value)
                      o["gate"] = pad.gate;
                      o["gate_equal"] = pad.gateEqual;
                    }
                    pads.append(o);
                  }
                  reply(Result::json(QJsonObject{{"ref", qs(c.ref)}, {"value", qs(c.value)}, {"footprint", qs(c.footprint)},
                                                 {"at", xy(c.pos.v())}, {"angle", c.angle},
                                                 {"side", c.side == Side::Bottom ? "bottom" : "top"}, {"locked", c.locked},
                                                 {"pads", pads}}));
                },
                true});

  server_->add({"ratsnest",
                "Unrouted connections (the net lines): net, the items they join, their ends, their straight length. "
                "Shortest first.",
                schemaOf({{"net", "string", "Only this net"}, {"limit", "integer", "At most this many (default 100)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  const Connectivity& c = w_->document()->connectivity();
                  const QString only = a.value("net").toString();
                  std::vector<const RatsLine*> lines;
                  for (const RatsLine& l : c.ratsnest)
                    if (only.isEmpty() || netName(b, l.net) == only) lines.push_back(&l);
                  r::sort(lines, {}, [](const RatsLine* l) { return (l->b - l->a).len(); });
                  const int limit = intArg(a, "limit", 100);
                  QJsonArray list;
                  for (int i = 0; i < int(lines.size()) && i < limit; ++i) {
                    const RatsLine& l = *lines[size_t(i)];
                    list.append(QJsonObject{{"net", netName(b, l.net)}, {"from", describe(b, l.from)}, {"to", describe(b, l.to)},
                                            {"a", xy(l.a)}, {"b", xy(l.b)}, {"length_mm", mm((l.b - l.a).len())}});
                  }
                  reply(Result::json(QJsonObject{{"connections", list}, {"total", int(lines.size())}}));
                },
                true});

  server_->add({"region",
                "The copper items in a window of the board: pads, tracks, vias, zones, with their nets and layers.",
                schemaOf({{"x1", "number", "", true}, {"y1", "number", "", true}, {"x2", "number", "", true}, {"y2", "number", "", true},
                          {"layer", "string", "Only this copper layer"}, {"limit", "integer", "At most this many (default 200)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  BBox box;
                  box.add(nmAt(a.value("x1").toDouble(), a.value("y1").toDouble()));
                  box.add(nmAt(a.value("x2").toDouble(), a.value("y2").toDouble()));
                  LayerMask mask = ~LayerMask(0);
                  if (a.contains("layer")) {
                    LayerId l = copperLayer(b, a.value("layer").toString());
                    if (l < 0) {
                      reply(Result::fail(QString("No copper layer %1").arg(a.value("layer").toString())));
                      return;
                    }
                    mask = LayerMask(1) << l;
                  }
                  auto items = w_->document()->index().query(box, mask);
                  const int limit = intArg(a, "limit", 200);
                  QJsonArray list;
                  for (int i = 0; i < int(items.size()) && i < limit; ++i) {
                    ItemRef r = items[size_t(i)];
                    QJsonObject o{{"item", describe(b, r)}, {"net", netName(b, itemNet(b, r))}};
                    if (r.type == ItemType::Track) {
                      const Track& t = b.tracks[size_t(r.index)];
                      o["layer"] = layerName(b, t.layer);
                      o["a"] = xy(t.a.v());
                      o["b"] = xy(t.b.v());
                      o["width_mm"] = mm(t.width);
                    } else if (r.type == ItemType::Via) {
                      o["at"] = xy(b.vias[size_t(r.index)].pos.v());
                    } else if (r.type == ItemType::Pad) {
                      o["at"] = xy(b.pads[size_t(r.index)].pos.v());
                      o["layers"] = layerNames(b, b.pads[size_t(r.index)].copper);
                    } else if (r.type == ItemType::Zone) {
                      o["layer"] = layerName(b, b.zones[size_t(r.index)].layer);
                    }
                    list.append(o);
                  }
                  reply(Result::json(QJsonObject{{"items", list}, {"total", int(items.size())}}));
                },
                true});

  server_->add({"rules",
                "The design rules: net classes (width, clearance, via), the board edge clearance, and for a net its width "
                "and clearance on every copper layer.",
                schemaOf({{"net", "string", "A net to resolve the rules for"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  QJsonArray classes;
                  for (const NetClass& c : b.netClasses)
                    classes.append(QJsonObject{{"name", qs(c.name)}, {"width_mm", mm(c.trackWidth)}, {"clearance_mm", mm(c.clearance)},
                                               {"via_mm", QJsonArray{mm(c.viaDiameter), mm(c.viaDrill)}}});
                  QJsonObject o{{"classes", classes}, {"edge_clearance_mm", mm(b.edgeClearance)}};
                  if (a.contains("net")) {
                    const int n = b.findNet(a.value("net").toString().toStdString());
                    if (n < 0) {
                      reply(Result::fail(QString("No net %1").arg(a.value("net").toString())));
                      return;
                    }
                    QJsonArray layers;
                    for (LayerId l : b.copperLayers())
                      layers.append(QJsonObject{{"layer", layerName(b, l)}, {"width_mm", mm(b.trackWidth(n, l))},
                                                {"min_width_mm", mm(b.minTrackWidth(n, l))}, {"clearance_mm", mm(b.clearance(n, l))}});
                    o["net"] = QJsonObject{{"name", qs(b.nets[size_t(n)].name)}, {"class", qs(b.classOf(n).name)}, {"layers", layers}};
                  }
                  reply(Result::json(o));
                },
                true});

  server_->add({"log",
                "The editor's message window: what the procedures reported (load, autorouting, F5-F7 ...).",
                schemaOf({{"group", "string", "Only this group"}, {"limit", "integer", "The last this many (default 50)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  const auto& log = w_->document()->log();
                  const QString g = a.value("group").toString();
                  const int limit = intArg(a, "limit", 50);
                  QJsonArray list;
                  int shown = 0;
                  for (auto it = log.rbegin(); it != log.rend() && shown < limit; ++it) {
                    if (!g.isEmpty() && it->group != g) continue;
                    ++shown;
                    list.prepend(QJsonObject{{"group", it->group}, {"text", it->text},
                                             {"kind", it->kind == LogMessage::Kind::Error     ? "error"
                                                      : it->kind == LogMessage::Kind::Warning ? "warning"
                                                                                              : "info"}});
                  }
                  reply(Result::json(QJsonObject{{"messages", list}}));
                },
                true});
}

namespace {

// An end of a connection: a pad ("U1.3"), a via ("via:5") or a point ([x, y]).
struct End {
  Vec2 at;
  int net = kNoNet;
  LayerMask layers = ~LayerMask(0);
  QString name;
};

std::optional<End> endOf(const Board& b, const QJsonValue& v, QString& error) {
  if (v.isArray()) {
    QJsonArray p = v.toArray();
    if (p.size() != 2) {
      error = "A point is [x, y]";
      return {};
    }
    End e;
    e.at = nmAt(p[0].toDouble(), p[1].toDouble());
    e.name = QString("(%1, %2)").arg(p[0].toDouble()).arg(p[1].toDouble());
    return e;
  }
  const QString s = v.toString();
  if (s.startsWith("via:")) {
    int i = viaById(b, s.mid(4).toUInt());
    if (i < 0) {
      error = QString("No %1").arg(s);
      return {};
    }
    return End{b.vias[size_t(i)].pos.v(), b.vias[size_t(i)].net, b.vias[size_t(i)].layers, s};
  }
  int p = findPad(b, s);
  if (p < 0) {
    error = QString("No pad %1 (a pad is \"REF.NUMBER\")").arg(s);
    return {};
  }
  return End{b.pads[size_t(p)].pos.v(), b.pads[size_t(p)].net, b.pads[size_t(p)].copper, s};
}

}  // namespace

void Tools::addEditTools() {
  server_->add({"route",
                "Lays one connection as the editor's routing tool does: over the topological model from `from` to `to` on "
                "one copper layer, the shortest way with room, other nets' wires pushed aside. Ends: a pad \"U1.3\", a "
                "via \"via:5\", or a point [x, y] (a free end). Without `layer` every layer both ends reach is tried. "
                "One undo step.",
                schemaOf({{"from", "string", "Pad \"U1.3\", via \"via:5\", or [x, y]", true, {{"type", QJsonArray{"string", "array"}}}},
                          {"to", "string", "Pad, via or [x, y]", true, {{"type", QJsonArray{"string", "array"}}}},
                          {"layer", "string", "Copper layer name (or top / bottom)"},
                          {"net", "string", "The net, when neither end is a pad or a via"},
                          {"width", "number", "Track width, mm (default: the rules')"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  QString error;
                  auto from = endOf(b, a.value("from"), error), to = from ? endOf(b, a.value("to"), error) : std::nullopt;
                  if (!from || !to) {
                    reply(Result::fail(error));
                    return;
                  }
                  int net = a.contains("net") ? b.findNet(a.value("net").toString().toStdString()) : from->net >= 0 ? from->net : to->net;
                  if (net < 0) {
                    reply(Result::fail("No net: give `net` or end at a pad or via of one"));
                    return;
                  }
                  if ((from->net >= 0 && from->net != net) || (to->net >= 0 && to->net != net)) {
                    reply(Result::fail(QString("The ends are of different nets (%1, %2)").arg(netName(b, from->net), netName(b, to->net))));
                    return;
                  }
                  std::vector<LayerId> layers;
                  if (a.contains("layer")) {
                    LayerId l = copperLayer(b, a.value("layer").toString());
                    if (l < 0) {
                      reply(Result::fail(QString("No copper layer %1").arg(a.value("layer").toString())));
                      return;
                    }
                    layers.push_back(l);
                  } else {
                    const LayerMask assigned = b.assignedLayers(net);
                    for (LayerId l : b.copperLayers())
                      if (((from->layers & to->layers) >> l & 1) && !b.layers[size_t(l)].plane && (!assigned || (assigned >> l & 1)))
                        layers.push_back(l);
                  }
                  if (layers.empty()) {
                    reply(Result::fail("The ends share no routing layer: route to a point, add_via there, route on"));
                    return;
                  }
                  const topo::Topology& model = w_->document()->topology();
                  std::optional<topo::ModelConnection> best;
                  LayerId bestLayer = -1;
                  for (LayerId l : layers) {
                    const Coord width = a.contains("width") ? Coord(a.value("width").toDouble() * kNmPerMm) : b.trackWidth(net, l);
                    const Coord widthMin = std::min(width, b.minTrackWidth(net, l));
                    auto way = topo::connectionOnModel(model, from->at, to->at, l, net, width, widthMin, b.clearance(net, l));
                    if (way && (!best || std::pair(int(way->squeezed), way->length) < std::pair(int(best->squeezed), best->length))) {
                      best = std::move(way);
                      bestLayer = l;
                    }
                  }
                  if (!best) {
                    QString why = "No way between the ends on the layer(s) tried";
                    for (const Zone& z : b.zones)  // a pour of another net walls a layer off
                      if (z.net != net && !z.filled.empty() && r::contains(layers, z.layer))
                        why += QString("; the copper area of %1 is poured on %2 (fill action=clear, or another layer)")
                                   .arg(netName(b, z.net), layerName(b, z.layer));
                    reply(Result::fail(why));
                    return;
                  }
                  const bool squeezed = best->squeezed;
                  topo::DrawnConnection drawn = topo::drawConnection(b, std::move(*best));
                  if (drawn.tracks.empty()) {
                    reply(Result::fail("The way was found but could not be drawn"));
                    return;
                  }
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  double length = 0;
                  for (const Track& t : drawn.tracks) length += t.length();
                  // The other nets' tracks that made room: not on the board as they were.
                  std::set<std::tuple<uint32_t, Coord, Coord, Coord, Coord>> kept;
                  for (const Track& t : drawn.board) kept.insert({t.id, t.a.x, t.a.y, t.b.x, t.b.y});
                  const auto moved = r::count_if(b.tracks, [&](const Track& t) {
                    return t.net != net && !kept.contains({t.id, t.a.x, t.a.y, t.b.x, t.b.y});
                  });
                  const int segments = int(drawn.tracks.size());
                  b.tracks = std::move(drawn.board);
                  for (Track& t : drawn.tracks) b.tracks.push_back(std::move(t));
                  doc->commitEdit(before, tr("Прокладка проводника"));
                  const int left = unroutedByNet(b, doc->connectivity())[size_t(net)];
                  reply(Result::json(QJsonObject{{"net", netName(b, net)}, {"layer", layerName(b, bestLayer)}, {"segments", segments},
                                                 {"length_mm", mm(length)}, {"squeezed", squeezed}, {"other_tracks_moved", int(moved)},
                                                 {"net_unrouted_left", left}}));
                }});

  server_->add({"add_track",
                "Adds copper as given: a polyline of straight tracks on one layer. Answers the worst clearance margin to "
                "other nets (negative: a violation). One undo step.",
                schemaOf({{"net", "string", "Net name", true},
                          {"layer", "string", "Copper layer", true},
                          {"points", "array<array<number>>", "[[x, y], ...], at least two", true},
                          {"width", "number", "mm (default: the rules')"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int net = b.findNet(a.value("net").toString().toStdString());
                  const LayerId l = copperLayer(b, a.value("layer").toString());
                  const QJsonArray pts = a.value("points").toArray();
                  if (net < 0 || l < 0 || pts.size() < 2) {
                    reply(Result::fail(net < 0 ? "No such net" : l < 0 ? "No such copper layer" : "Two points at least"));
                    return;
                  }
                  const Coord width = a.contains("width") ? Coord(a.value("width").toDouble() * kNmPerMm) : b.trackWidth(net, l);
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  const size_t first = b.tracks.size();
                  for (qsizetype i = 1; i < pts.size(); ++i) {
                    Track t;
                    t.a = Point(nmAt(pts[i - 1].toArray()[0].toDouble(), pts[i - 1].toArray()[1].toDouble()));
                    t.b = Point(nmAt(pts[i].toArray()[0].toDouble(), pts[i].toArray()[1].toDouble()));
                    if (t.a == t.b) continue;
                    t.width = width;
                    t.layer = l;
                    t.net = net;
                    b.tracks.push_back(t);
                  }
                  doc->commitEdit(before, tr("Прокладка проводника"));
                  double worst = 1e300;
                  QString hitName;
                  const SpatialIndex& idx = doc->index();
                  for (size_t i = first; i < b.tracks.size(); ++i)
                    for (const Shape& s : itemShapes(b, {ItemType::Track, int(i)})) {
                      ItemRef hit;
                      double m = shapeMargin(b, idx, s, LayerMask(1) << l, net, &hit);
                      if (m < worst) worst = m, hitName = hit.index >= 0 ? describe(b, hit) : QString();
                    }
                  topo::Topology::assignIds(b);
                  QJsonArray ids;
                  for (size_t i = first; i < b.tracks.size(); ++i) ids.append(int(b.tracks[i].id));
                  QJsonObject o{{"tracks", ids}, {"width_mm", mm(width)}};
                  if (worst < 1e299) {
                    o["clearance_margin_mm"] = mm(worst);
                    if (worst < 0 && !hitName.isEmpty()) o["violates"] = hitName;
                  }
                  reply(Result::json(o));
                }});

  server_->add({"add_via",
                "Adds a through via of the net's class at a point. One undo step.",
                schemaOf({{"net", "string", "Net name", true}, {"x", "number", "", true}, {"y", "number", "", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int net = b.findNet(a.value("net").toString().toStdString());
                  if (net < 0) {
                    reply(Result::fail("No such net"));
                    return;
                  }
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  Via v;
                  v.pos = Point(nmAt(a.value("x").toDouble(), a.value("y").toDouble()));
                  v.net = net;
                  v.diameter = b.classOf(net).viaDiameter;
                  v.drill = b.classOf(net).viaDrill;
                  v.layers = b.allCopperMask();
                  b.vias.push_back(v);
                  doc->commitEdit(before, tr("Добавить переход"));
                  topo::Topology::assignIds(b);
                  const Via& made = b.vias.back();
                  double worst = 1e300;
                  for (const Shape& s : itemShapes(b, {ItemType::Via, int(b.vias.size()) - 1}))
                    worst = std::min(worst, shapeMargin(b, doc->index(), s, made.layers, net));
                  QJsonObject o{{"via", QString("via:%1").arg(made.id)}, {"diameter_mm", mm(made.diameter)}};
                  if (worst < 1e299) o["clearance_margin_mm"] = mm(worst);
                  reply(Result::json(o));
                }});

  server_->add({"delete",
                "Deletes tracks and vias by id, or all the routing of nets (their unlocked tracks and vias). One undo step.",
                schemaOf({{"tracks", "array<integer>", "Track ids"}, {"vias", "array<integer>", "Via ids"},
                          {"nets", "array<string>", "Nets whose routing goes"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  edit::Fragment f;
                  QStringList missing;
                  for (auto v : a.value("tracks").toArray())
                    if (int i = trackById(b, uint32_t(v.toInt())); i >= 0) f.tracks.push_back(i);
                    else missing << QString("track:%1").arg(v.toInt());
                  for (auto v : a.value("vias").toArray())
                    if (int i = viaById(b, uint32_t(v.toInt())); i >= 0) f.vias.push_back(i);
                    else missing << QString("via:%1").arg(v.toInt());
                  std::set<int> nets;
                  for (auto v : a.value("nets").toArray())
                    if (int n = b.findNet(v.toString().toStdString()); n >= 0) nets.insert(n);
                    else missing << v.toString();
                  for (int i = 0; i < int(b.tracks.size()); ++i)
                    if (nets.contains(b.tracks[size_t(i)].net) && !b.tracks[size_t(i)].locked) f.tracks.push_back(i);
                  for (int i = 0; i < int(b.vias.size()); ++i)
                    if (nets.contains(b.vias[size_t(i)].net) && !b.vias[size_t(i)].locked) f.vias.push_back(i);
                  r::sort(f.tracks);
                  f.tracks.erase(r::unique(f.tracks).begin(), f.tracks.end());
                  r::sort(f.vias);
                  f.vias.erase(r::unique(f.vias).begin(), f.vias.end());
                  if (f.empty()) {
                    reply(Result::fail(missing.isEmpty() ? QString("Nothing to delete") : "Not found: " + missing.join(", ")));
                    return;
                  }
                  Document* doc = w_->document();
                  doc->clearSelection();
                  auto before = doc->beginEdit();
                  edit::erase(b, f);
                  doc->commitEdit(before, tr("Удалить"));
                  QJsonObject o{{"tracks_deleted", int(f.tracks.size())}, {"vias_deleted", int(f.vias.size())}};
                  if (!missing.isEmpty()) o["not_found"] = QJsonArray::fromStringList(missing);
                  reply(Result::json(o));
                }});

  server_->add({"unroute",
                "Clears the routing: of the given nets, or of the whole board (locked tracks and vias stay). One undo step.",
                schemaOf({{"nets", "array<string>", "Only these nets"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  Document* doc = w_->document();
                  doc->clearSelection();
                  const size_t tracks = b.tracks.size(), vias = b.vias.size();
                  if (!a.contains("nets")) {
                    w_->clearRouting();
                  } else {
                    std::set<int> nets;
                    for (auto v : a.value("nets").toArray())
                      if (int n = b.findNet(v.toString().toStdString()); n >= 0) nets.insert(n);
                    edit::Fragment f;
                    for (int i = 0; i < int(b.tracks.size()); ++i)
                      if (nets.contains(b.tracks[size_t(i)].net) && !b.tracks[size_t(i)].locked) f.tracks.push_back(i);
                    for (int i = 0; i < int(b.vias.size()); ++i)
                      if (nets.contains(b.vias[size_t(i)].net) && !b.vias[size_t(i)].locked) f.vias.push_back(i);
                    if (!f.empty()) {
                      auto before = doc->beginEdit();
                      edit::erase(b, f);
                      doc->commitEdit(before, tr("Удалить разводку"));
                    }
                  }
                  reply(Result::json(QJsonObject{{"tracks_deleted", int(tracks - b.tracks.size())},
                                                 {"vias_deleted", int(vias - b.vias.size())}}));
                }});

  server_->add({"move_component",
                "Moves and/or turns a component (its wires stay joined, as when dragged). A locked component does not move. "
                "One undo step.",
                schemaOf({{"ref", "string", "Designator", true}, {"x", "number", "New origin x, mm"}, {"y", "number", "New origin y, mm"},
                          {"angle", "number", "New angle, degrees counter-clockwise"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int ci = b.findComponent(a.value("ref").toString().toStdString());
                  if (ci < 0) {
                    reply(Result::fail("No such component"));
                    return;
                  }
                  const Component& c = b.components[size_t(ci)];
                  const Vec2 was = c.pos.v();
                  const Vec2 to{a.contains("x") ? a.value("x").toDouble() * kNmPerMm : was.x, a.contains("y") ? a.value("y").toDouble() * kNmPerMm : was.y};
                  edit::Motion m;
                  m.pivot = was;
                  m.rotate = a.contains("angle") ? a.value("angle").toDouble() - c.angle : 0;
                  m.shift = to - was;
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  if (!edit::move(b, edit::Fragment{.components = {ci}}, m)) {
                    reply(Result::fail("Not moved: the component (or something with it) is locked"));
                    return;
                  }
                  doc->commitEdit(before, tr("Перемещение"));
                  const Component& now = b.components[size_t(ci)];
                  reply(Result::json(QJsonObject{{"ref", qs(now.ref)}, {"at", xy(now.pos.v())}, {"angle", now.angle}}));
                }});

  server_->add({"fix",
                "Fixes (locks) or frees tracks, vias and components: fixed ones stay as they are under every procedure. "
                "One undo step.",
                schemaOf({{"on", "boolean", "true: fix, false: free", true}, {"tracks", "array<integer>", "Track ids"},
                          {"vias", "array<integer>", "Via ids"}, {"components", "array<string>", "Designators"},
                          {"nets", "array<string>", "All tracks and vias of these nets"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  const bool on = a.value("on").toBool();
                  std::set<int> nets;
                  for (auto v : a.value("nets").toArray())
                    if (int n = b.findNet(v.toString().toStdString()); n >= 0) nets.insert(n);
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  int count = 0;
                  for (auto v : a.value("tracks").toArray())
                    if (int i = trackById(b, uint32_t(v.toInt())); i >= 0) b.tracks[size_t(i)].locked = on, ++count;
                  for (auto v : a.value("vias").toArray())
                    if (int i = viaById(b, uint32_t(v.toInt())); i >= 0) b.vias[size_t(i)].locked = on, ++count;
                  for (auto v : a.value("components").toArray())
                    if (int i = b.findComponent(v.toString().toStdString()); i >= 0) b.components[size_t(i)].locked = on, ++count;
                  for (Track& t : b.tracks)
                    if (nets.contains(t.net)) t.locked = on, ++count;
                  for (Via& v : b.vias)
                    if (nets.contains(v.net)) v.locked = on, ++count;
                  doc->commitEdit(before, on ? tr("Фиксировать") : tr("Расфиксировать"), false);
                  reply(Result::json(QJsonObject{{"changed", count}}));
                }});

  server_->add({"flex_fix",
                "TopoR's flexible fixation of nets: their topology stays under the autorouter, F6 and F7, the shape of "
                "their wires does not. One undo step.",
                schemaOf({{"nets", "array<string>", "Net names", true}, {"on", "boolean", "", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const bool on = a.value("on").toBool();
                  Document* doc = w_->document();
                  auto before = doc->beginEdit();
                  QStringList missing;
                  int count = 0;
                  for (auto v : a.value("nets").toArray())
                    if (int n = b.findNet(v.toString().toStdString()); n >= 0) {
                      b.nets[size_t(n)].flexFixed = on;
                      b.nets[size_t(n)].route = !on;
                      ++count;
                    } else {
                      missing << v.toString();
                    }
                  doc->commitEdit(before, on ? tr("Гибкая фиксация") : tr("Снять гибкую фиксацию"), false);
                  QJsonObject o{{"changed", count}};
                  if (!missing.isEmpty()) o["not_found"] = QJsonArray::fromStringList(missing);
                  reply(Result::json(o));
                }});

  for (bool undo : {true, false})
    server_->add({undo ? "undo" : "redo", undo ? "Undoes the last edits (the user's and this server's alike)." : "Redoes undone edits.",
                  schemaOf({{"steps", "integer", "How many (default 1)"}}),
                  [this, undo](const QJsonObject& a, Reply reply) {
                    NEED_BOARD;
                    if (job_.running && job_.name != "autoroute") {
                      reply(Result::fail(QString("Wait for %1 first").arg(job_.name)));
                      return;
                    }
                    QUndoStack* u = w_->document()->undoStack();
                    QStringList done;
                    for (int i = 0; i < std::max(1, intArg(a, "steps", 1)); ++i) {
                      if (undo ? !u->canUndo() : !u->canRedo()) break;
                      done << (undo ? u->undoText() : u->redoText());
                      undo ? u->undo() : u->redo();
                    }
                    w_->document()->validateSelection();
                    reply(Result::json(QJsonObject{{undo ? "undone" : "redone", QJsonArray::fromStringList(done)},
                                                   {"next_undo", u->undoText()}, {"next_redo", u->redoText()}}));
                  }});
}

void Tools::addProcedureTools() {
  server_->add({"autoroute",
                "The autorouter (F11): searches routing variants, each from the board as it is, and opens the best one in "
                "the editor (fewest violations + unrouted, then length + vias). The user sees the window and the progress. "
                "Waits up to wait_s seconds; else poll with job.",
                schemaOf({{"nets", "array<string>", "Route only these nets (default: all)"},
                          {"variants", "integer", "Stop after this many variants (default 1, at most 12)"},
                          {"via_cost", "number", "Cost of a via, mm of wire"},
                          {"passes", "integer", "Rip-up and re-route passes"},
                          {"optimize", "integer", "F7 iterations after each variant"},
                          {"keep_routing", "boolean", "Keep the existing routing (default false: it is ripped up)"},
                          {"single_layer", "string", "Route on one layer only, no vias: top or bottom"},
                          {"fill", "boolean", "Pour the copper areas after each variant"},
                          {"open_best", "boolean", "Open the best variant in the editor when done (default true)"},
                          {"wait_s", "integer", "Seconds to wait for the result (default 120)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  if (!startJob("autoroute", reply)) return;
                  AutorouteWindow* ar = w_->autorouteWindow();
                  ar->stop();
                  ar->resetVariants();
                  ar->fillNets();
                  if (a.contains("passes")) ar->passes_->setValue(a.value("passes").toInt());
                  if (a.contains("via_cost")) ar->viaCost_->setValue(a.value("via_cost").toDouble());
                  if (a.contains("optimize")) ar->optimize_->setValue(a.value("optimize").toInt());
                  if (a.contains("fill")) ar->pour_->setChecked(a.value("fill").toBool());
                  ar->keepRouting_->setChecked(a.value("keep_routing").toBool());
                  const QString single = a.value("single_layer").toString();
                  ar->singleLayer_->setChecked(!single.isEmpty());
                  if (!single.isEmpty()) ar->singleTop_->setChecked(single.compare("bottom", Qt::CaseInsensitive) != 0);
                  if (QTreeWidgetItem* all = ar->nets_->topLevelItem(0)) {
                    QSignalBlocker block(ar->nets_);
                    QSet<QString> only;
                    for (auto v : a.value("nets").toArray()) only.insert(v.toString());
                    int checked = 0;
                    for (int i = 0; i < all->childCount(); ++i) {
                      bool on = only.isEmpty() || only.contains(all->child(i)->text(0));
                      all->child(i)->setCheckState(1, on ? Qt::Checked : Qt::Unchecked);
                      checked += on;
                    }
                    all->setCheckState(1, only.isEmpty() ? Qt::Checked : checked ? Qt::PartiallyChecked : Qt::Unchecked);
                    if (!checked) {
                      job_.running = false;
                      reply(Result::fail("None of the given nets is in the list"));
                      return;
                    }
                  }
                  const int wanted = std::clamp(intArg(a, "variants", 1), 1, 12);
                  const bool openBest = !a.contains("open_best") || a.value("open_best").toBool();
                  job_.links.push_back(connect(ar, &AutorouteWindow::variantFound, this, [ar, wanted](int i) {
                    if (i + 1 >= wanted) ar->stop();
                  }));
                  job_.links.push_back(connect(ar, &AutorouteWindow::finished, this, [this, ar, openBest] {
                    const auto& vs = ar->variants();
                    int best = -1;
                    auto key = [&](int k) {
                      const RoutingVariant& v = vs[size_t(k)];
                      return std::pair(v.violations + v.unrouted, v.length / kNmPerMm + v.viaCount * ar->viaWeight_->value());
                    };
                    QJsonArray list;
                    for (int i = 0; i < int(vs.size()); ++i) {
                      if (best < 0 || key(i) < key(best)) best = i;
                      const RoutingVariant& v = vs[size_t(i)];
                      list.append(QJsonObject{{"variant", i}, {"length_mm", std::round(v.length / 1e5) / 10.0}, {"vias", v.viaCount},
                                              {"violations", v.violations}, {"unrouted", v.unrouted}, {"seconds", std::round(v.seconds * 10) / 10}});
                    }
                    QJsonObject o{{"variants", list}};
                    if (best >= 0) {
                      o["best"] = best;
                      if (openBest) {
                        ar->openInEditor(best);
                        o["opened"] = best;
                      }
                    }
                    finishJob(o);
                  }));
                  ar->show();
                  ar->raise();
                  ar->start();
                  if (!ar->running()) {
                    finishJob({{"error", "the autorouter did not start"}});
                  }
                  await(intArg(a, "wait_s", 120), reply);
                }});

  server_->add({"autoroute_variants", "The variants of the last autorouting: length, vias, violations, unrouted.", schemaOf({}),
                [this](const QJsonObject&, Reply reply) {
                  QJsonArray list;
                  if (w_->autoroute_)
                    for (int i = 0; i < int(w_->autoroute_->variants().size()); ++i) {
                      const RoutingVariant& v = w_->autoroute_->variants()[size_t(i)];
                      list.append(QJsonObject{{"variant", i}, {"length_mm", std::round(v.length / 1e5) / 10.0}, {"vias", v.viaCount},
                                              {"violations", v.violations}, {"unrouted", v.unrouted}});
                    }
                  reply(Result::json(QJsonObject{{"variants", list}}));
                },
                true});

  server_->add({"autoroute_open", "Opens a variant of the last autorouting in the editor (one undo step).",
                schemaOf({{"variant", "integer", "Its number in autoroute_variants", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const int i = a.value("variant").toInt(-1);
                  if (!w_->autoroute_ || i < 0 || i >= int(w_->autoroute_->variants().size())) {
                    reply(Result::fail("No such variant"));
                    return;
                  }
                  if (w_->autoroute_->running()) {
                    reply(Result::fail("The autorouter runs: job(stop=true) first"));
                    return;
                  }
                  w_->autoroute_->openInEditor(i);
                  reply(Result::json(QJsonObject{{"opened", i}}));
                }});

  server_->add({"reshape",
                "F5, «Расчёт формы проводников»: every unlocked wire drawn anew from the topological model (arcs, room "
                "shared out). Stops on a topological violation (crossing wires), nothing changed and the violations given.",
                schemaOf({{"edited_only", "boolean", "Only the wires edited since the last computation"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  if (job_.running) {
                    reply(Result::fail(QString("Busy: %1 is running").arg(job_.name)));
                    return;
                  }
                  QString message;
                  auto link = connect(w_->view(), &BoardView::status, this, [&message](const QString& s) { message = s; });
                  const bool drawn = w_->view()->recomputeShapesModel(a.value("edited_only").toBool());
                  disconnect(link);
                  QJsonObject o{{"drawn", drawn}, {"summary", message}};
                  if (!drawn) {
                    QJsonArray vs;
                    for (const DrcViolation& v : w_->document()->drc()) vs.append(violationJson(b, v));
                    o["violations"] = vs;
                  }
                  reply(drawn ? Result::json(o) : Result::json(o).add("Stopped: see violations"));
                }});

  server_->add({"refine",
                "F6, «Перекладка проводников»: wires re-laid by cheaper ways over the model (between other wires if need "
                "be); with layers=true then moved between layers where that drops vias. Waits up to wait_s seconds.",
                schemaOf({{"layers", "boolean", "Then change layers too"}, {"wait_s", "integer", "Seconds to wait (default 300)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  if (!startJob("refine", reply)) return;
                  w_->document()->clearSelection();  // the whole board, not the selected wires
                  w_->refine(a.value("layers").toBool());
                  await(intArg(a, "wait_s", 300), reply);
                }});

  server_->add({"optimize",
                "F7, «Подвижка»: vias and branch points (and with components=true the components) move to shorten the "
                "wires and share out the room; refine_after runs F6 next. Waits up to wait_s seconds.",
                schemaOf({{"components", "boolean", "Move the components too"}, {"refine_after", "boolean", "Then F6 with layer changes"},
                          {"wait_s", "integer", "Seconds to wait (default 300)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  if (!startJob("optimize", reply)) return;
                  w_->document()->clearSelection();
                  w_->optimize(a.value("components").toBool(), a.value("refine_after").toBool());
                  await(intArg(a, "wait_s", 300), reply);
                }});

  server_->add({"drc",
                "Design rule check with the user's DRC settings; the violations also go to the editor's message window. "
                "Answers counts by type and the first `limit` violations.",
                schemaOf({{"limit", "integer", "At most this many listed (default 50)"},
                          {"types", "array<string>", "Only these: Clearance, Short, Edge, Unconnected, Width, Keepout, Topology"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  DrcDialog::run(w_->document(), w_);
                  QSet<QString> only;
                  for (auto v : a.value("types").toArray()) only.insert(v.toString().toLower());
                  QJsonObject byType;
                  QJsonArray list;
                  const int limit = intArg(a, "limit", 50);
                  for (const DrcViolation& v : w_->document()->drc()) {
                    const QString type = drcTypeName(v.type);
                    byType[type] = byType.value(type).toInt() + 1;
                    if ((only.isEmpty() || only.contains(type.toLower())) && list.size() < limit) list.append(violationJson(b, v));
                  }
                  reply(Result::json(QJsonObject{{"total", int(w_->document()->drc().size())}, {"by_type", byType}, {"violations", list}}));
                }});

  server_->add({"fill", "The copper areas (pours): pour, clear or re-pour all of them. One undo step.",
                schemaOf({{"action", "string", "", true, {{"enum", QJsonArray{"pour", "clear", "repour"}}}}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  const QString act = a.value("action").toString();
                  if (act == "pour") w_->pour(true, false, tr("Залить"));
                  else if (act == "clear") w_->pour(false, true, tr("Удалить заливку"));
                  else if (act == "repour") w_->pour(true, true, tr("Перезалить"));
                  else {
                    reply(Result::fail("action: pour, clear or repour"));
                    return;
                  }
                  size_t polys = 0;
                  for (const Zone& z : b.zones) polys += z.filled.size();
                  reply(Result::json(QJsonObject{{"zones", int(b.zones.size())}, {"polygons", int(polys)}}));
                }});

  server_->add({"job",
                "The procedure running (autoroute, refine, optimize): waits up to wait_s seconds for it and answers its "
                "result, or its state while it runs; stop=true stops it (the autorouter keeps the variants found).",
                schemaOf({{"wait_s", "integer", "Seconds to wait (default 0)"}, {"stop", "boolean", ""}}),
                [this](const QJsonObject& a, Reply reply) {
                  if (a.value("stop").toBool() && job_.running) {
                    if (job_.name == "autoroute" && w_->autoroute_) w_->autoroute_->stop();
                    else if (w_->cancel_) w_->cancel_->store(true);
                  }
                  await(intArg(a, "wait_s", a.value("stop").toBool() ? 60 : 0), reply);
                },
                true});
}

void Tools::addViewTools() {
  server_->add({"screenshot",
                "A picture of the board as the editor shows it (the layers and display settings the user has). With x, y "
                "(and width) the view is moved there first; fit=true shows the whole board.",
                schemaOf({{"x", "number", "Centre x, mm"}, {"y", "number", "Centre y, mm"},
                          {"width", "number", "Width of the view, mm"}, {"fit", "boolean", "The whole board"},
                          {"px", "integer", "Longest side of the picture, pixels (default 1024)"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  BoardView* view = w_->view();
                  if (a.value("fit").toBool()) view->fitBoard();
                  else if (a.contains("x") && a.contains("y"))
                    view->centerOn(nmAt(a.value("x").toDouble(), a.value("y").toDouble()), a.value("width").toDouble());
                  QImage img = view->picture();
                  if (img.isNull() || !view->drawable()) {
                    reply(Result::fail("No picture: the board view has no OpenGL 3.3 context"));
                    return;
                  }
                  const int px = std::clamp(intArg(a, "px", 1024), 64, 4096);
                  if (std::max(img.width(), img.height()) > px) img = img.scaled(px, px, Qt::KeepAspectRatio, Qt::SmoothTransformation);
                  QByteArray png;
                  QBuffer buf(&png);
                  buf.open(QIODevice::WriteOnly);
                  img.save(&buf, "PNG");
                  Result r = Result::text(QString("%1x%2 px").arg(img.width()).arg(img.height()));
                  r.image(png);
                  reply(r);
                },
                true});

  server_->add({"view", "Moves the editor's view: to a point and width, or the whole board.",
                schemaOf({{"x", "number", "Centre x, mm"}, {"y", "number", "Centre y, mm"}, {"width", "number", "Width of the view, mm"},
                          {"fit", "boolean", "The whole board"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  if (a.value("fit").toBool() || !a.contains("x")) w_->view()->fitBoard();
                  else w_->view()->centerOn(nmAt(a.value("x").toDouble(), a.value("y").toDouble()), a.value("width").toDouble());
                  reply(Result::text("ok"));
                }});

  server_->add({"select",
                "Selects objects in the editor (what the user's next command acts on) and highlights a net. Empty: clears.",
                schemaOf({{"tracks", "array<integer>", "Track ids"}, {"vias", "array<integer>", "Via ids"},
                          {"components", "array<string>", "Designators"}, {"net", "string", "Select its tracks and vias, and highlight it"}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  topo::Topology::assignIds(b);
                  std::vector<ItemRef> items;
                  std::vector<int> comps;
                  for (auto v : a.value("tracks").toArray())
                    if (int i = trackById(b, uint32_t(v.toInt())); i >= 0) items.push_back({ItemType::Track, i});
                  for (auto v : a.value("vias").toArray())
                    if (int i = viaById(b, uint32_t(v.toInt())); i >= 0) items.push_back({ItemType::Via, i});
                  for (auto v : a.value("components").toArray())
                    if (int i = b.findComponent(v.toString().toStdString()); i >= 0) comps.push_back(i);
                  int net = kNoNet;
                  if (a.contains("net")) {
                    net = b.findNet(a.value("net").toString().toStdString());
                    for (int i = 0; i < int(b.tracks.size()); ++i)
                      if (net >= 0 && b.tracks[size_t(i)].net == net) items.push_back({ItemType::Track, i});
                    for (int i = 0; i < int(b.vias.size()); ++i)
                      if (net >= 0 && b.vias[size_t(i)].net == net) items.push_back({ItemType::Via, i});
                  }
                  w_->document()->setHighlightedNet(net);
                  w_->document()->setSelection(items, comps);
                  reply(Result::json(QJsonObject{{"selected", int(items.size() + comps.size())}}));
                }});

  server_->add({"set_layer", "Makes a copper layer the active one (what the user routes on next).",
                schemaOf({{"layer", "string", "Copper layer name (or top / bottom)", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  NEED_BOARD;
                  LayerId l = copperLayer(b, a.value("layer").toString());
                  if (l < 0) {
                    reply(Result::fail("No such copper layer"));
                    return;
                  }
                  w_->document()->setActiveLayer(l);
                  reply(Result::text(layerName(b, l)));
                }});

  server_->add({"commands",
                "The editor's commands (TopoR's ids, as in its hotkey settings) that can be run with `command`: id, text, "
                "enabled, checked. Commands that open a dialog are left out (other tools do their work).",
                schemaOf({{"filter", "string", "Part of the id or text"}}),
                [this](const QJsonObject& a, Reply reply) {
                  auto match = matcher(a.value("filter").toString());
                  QJsonArray list;
                  Commands* c = w_->commands();
                  for (const auto& i : c->all()) {
                    if (kBlocked.contains(i.id)) continue;
                    QAction* act = (*c)[i.id];
                    const QString text = act->text().remove('&');
                    if (!match(i.id) && !match(text)) continue;
                    QJsonObject o{{"id", i.id}, {"text", text}, {"enabled", act->isEnabled()}};
                    if (act->isCheckable()) o["checked"] = act->isChecked();
                    list.append(o);
                  }
                  reply(Result::json(QJsonObject{{"commands", list}}));
                },
                true});

  server_->add({"command",
                "Runs an editor command by its id (see commands), as its menu item or hotkey would: toggles of the view, "
                "edits of the selection (Accel_Delete, Accel_Fix, Accel_Reduce ...), modes.",
                schemaOf({{"id", "string", "Command id", true}}),
                [this](const QJsonObject& a, Reply reply) {
                  const QString id = a.value("id").toString();
                  Commands* c = w_->commands();
                  if (!c->contains(id)) {
                    reply(Result::fail(QString("No command %1").arg(id)));
                    return;
                  }
                  if (kBlocked.contains(id)) {
                    reply(Result::fail(QString("%1 opens a dialog; use this server's tools (open, save, drc ...)").arg(id)));
                    return;
                  }
                  QAction* act = (*c)[id];
                  if (!act->isEnabled()) {
                    reply(Result::fail(QString("%1 is disabled now").arg(id)));
                    return;
                  }
                  act->trigger();
                  QJsonObject o{{"done", id}};
                  if (act->isCheckable()) o["checked"] = act->isChecked();
                  reply(Result::json(o));
                }});
}

#undef NEED_BOARD

}  // namespace xr::gui::mcp
