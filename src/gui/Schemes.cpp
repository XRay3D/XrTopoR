#include "gui/Schemes.h"

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QSettings>
#include <algorithm>

namespace xr::gui {

LayerRole roleOf(const Board& b, LayerId l) {
  const Layer& L = b.layers[l];
  bool top = L.side != Side::Bottom;
  switch (L.kind) {
    case LayerKind::Copper:
      if (L.copperIndex == 0) return LayerRole::MetalTop;
      if (L.copperIndex == b.copperCount() - 1) return LayerRole::MetalBottom;
      return LayerRole::MetalInner;
    case LayerKind::Mask: return top ? LayerRole::MaskTop : LayerRole::MaskBottom;
    case LayerKind::Silk: return top ? LayerRole::SilkTop : LayerRole::SilkBottom;
    case LayerKind::Paste: return top ? LayerRole::PasteTop : LayerRole::PasteBottom;
    case LayerKind::Fab:
    case LayerKind::Courtyard: return top ? LayerRole::OutlineTop : LayerRole::OutlineBottom;
    case LayerKind::Edge: return LayerRole::Board;
    case LayerKind::Other:
      if (L.side == Side::None) return LayerRole::Doc;
      return top ? LayerRole::MechTop : LayerRole::MechBottom;
  }
  return LayerRole::Doc;
}

int layerGroup(const Board& b, LayerId l) {
  switch (roleOf(b, l)) {
    case LayerRole::MetalTop:
    case LayerRole::MetalBottom:
    case LayerRole::MetalInner: return 1;
    case LayerRole::MaskTop:
    case LayerRole::SilkTop:
    case LayerRole::PasteTop:
    case LayerRole::OutlineTop:
    case LayerRole::MechTop: return 0;
    case LayerRole::Doc: return 3;
    case LayerRole::Board: return -1;
    default: return 2;
  }
}

std::string layerTypeName(const Board& b, LayerId l) {
  const Layer& L = b.layers[l];
  switch (L.kind) {
    case LayerKind::Copper: return L.plane ? "Опорный" : "Сигнальный";
    case LayerKind::Mask: return "Маска";
    case LayerKind::Silk: return "Шелкография";
    case LayerKind::Paste: return "Паяльная паста";
    case LayerKind::Fab:
    case LayerKind::Courtyard: return "Очертания";
    case LayerKind::Edge: return "Контур платы";
    case LayerKind::Other: return L.side == Side::None ? "Документирующий" : "Механический";
  }
  return {};
}

namespace {

// Colours of one layer under a scheme.
RoleColors roleColors(const Board& b, LayerId l, const ColorScheme& s) {
  LayerRole r = roleOf(b, l);
  if (r == LayerRole::MetalInner) {
    if (s.inner.empty()) return s.roles[0];
    return s.inner[size_t(b.layers[l].copperIndex - 1) % s.inner.size()];
  }
  if (r == LayerRole::Board) {
    uint32_t c = 0xd4d4d4;
    for (auto& [k, v] : s.colors)
      if (k == "board") c = v;
    return {c, c, c};
  }
  return s.roles[size_t(r)];
}

bool roleVisible(const Board& b, LayerId l, const ViewScheme& s) {
  LayerRole r = roleOf(b, l);
  if (r == LayerRole::MetalInner) return s.innerVisible;
  if (r == LayerRole::Board) return true;
  return s.roleVisible[size_t(r)];
}

}  // namespace

void applyColorScheme(DisplayControl& d, const Board& b, const ColorScheme& s) {
  d.colorScheme = s.name;
  d.hilightRate = s.hilightRate;
  d.darkRate = s.darkRate;
  d.gridColor = s.gridColor;
  for (auto& [k, v] : s.colors) d.colors[k] = v;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (LayerDisplay* ld = d.layer(b.layers[l].name)) {
      RoleColors c = roleColors(b, l, s);
      ld->details = c.details;
      ld->pads = c.pads;
      ld->fix = c.fix;
    }
}

void applyViewScheme(DisplayControl& d, const Board& b, const ViewScheme& s) {
  d.displayScheme = s.name;
  for (auto& [k, v] : s.show) d.show[k] = v;
  d.gridShow = s.gridShow;
  d.alignToGrid = s.alignToGrid;
  d.snapToAngle = s.snapToAngle;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (LayerDisplay* ld = d.layer(b.layers[l].name)) ld->visible = roleVisible(b, l, s);
}

void completeDisplay(DisplayControl& d, const Board& b, const ColorScheme& colors, const ViewScheme& view) {
  bool fresh = d.layers.empty() && d.colors.empty();
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    if (d.layer(b.layers[l].name)) continue;
    LayerDisplay ld;
    ld.layer = b.layers[l].name;
    RoleColors c = roleColors(b, l, colors);
    ld.details = c.details;
    ld.pads = c.pads;
    ld.fix = c.fix;
    ld.visible = roleVisible(b, l, view);
    d.layers.push_back(std::move(ld));
  }
  if (fresh) {
    applyColorScheme(d, b, colors);
    applyViewScheme(d, b, view);
  }
  // Colours a saved display may lack (older files, other programs) come from the scheme.
  for (auto& [k, v] : colors.colors) d.colors.try_emplace(k, v);
}

ColorScheme colorSchemeOf(const DisplayControl& d, const Board& b, const std::string& name) {
  ColorScheme s = colorSchemeByName(builtinColorSchemes(), d.colorScheme);
  s.name = name;
  s.hilightRate = d.hilightRate;
  s.darkRate = d.darkRate;
  s.gridColor = d.gridColor;
  s.colors.assign(d.colors.begin(), d.colors.end());
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    const LayerDisplay* ld = d.layer(b.layers[l].name);
    if (!ld) continue;
    RoleColors c{ld->details, ld->pads, ld->fix};
    LayerRole r = roleOf(b, l);
    if (r == LayerRole::MetalInner) {
      size_t i = size_t(b.layers[l].copperIndex - 1);
      if (s.inner.size() <= i) s.inner.resize(i + 1, c);
      s.inner[i] = c;
    } else if (r != LayerRole::Board) {
      s.roles[size_t(r)] = c;
    }
  }
  return s;
}

ViewScheme viewSchemeOf(const DisplayControl& d, const Board& b, const std::string& name) {
  ViewScheme s = viewSchemeByName(builtinViewSchemes(), d.displayScheme);
  s.name = name;
  s.show.assign(d.show.begin(), d.show.end());
  s.gridShow = d.gridShow;
  s.alignToGrid = d.alignToGrid;
  s.snapToAngle = d.snapToAngle;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
    const LayerDisplay* ld = d.layer(b.layers[l].name);
    if (!ld) continue;
    LayerRole r = roleOf(b, l);
    if (r == LayerRole::MetalInner) s.innerVisible = ld->visible;
    else if (r != LayerRole::Board) s.roleVisible[size_t(r)] = ld->visible;
  }
  return s;
}

// ---------------------------------------------------------------- persistence

namespace {

QJsonArray rgb(const RoleColors& c) { return {qint64(c.details), qint64(c.pads), qint64(c.fix)}; }
RoleColors rgb(const QJsonValue& v) {
  QJsonArray a = v.toArray();
  return {uint32_t(a.at(0).toInteger()), uint32_t(a.at(1).toInteger()), uint32_t(a.at(2).toInteger())};
}

QString toJson(const ColorScheme& s) {
  QJsonObject o;
  o["name"] = QString::fromStdString(s.name);
  o["hilightRate"] = s.hilightRate;
  o["darkRate"] = s.darkRate;
  o["gridColor"] = qint64(s.gridColor);
  QJsonObject colors;
  for (auto& [k, v] : s.colors) colors[QString::fromStdString(k)] = qint64(v);
  o["colors"] = colors;
  QJsonArray roles, inner;
  for (auto& r : s.roles) roles.append(rgb(r));
  for (auto& r : s.inner) inner.append(rgb(r));
  o["roles"] = roles;
  o["inner"] = inner;
  return QString::fromUtf8(QJsonDocument(o).toJson(QJsonDocument::Compact));
}

ColorScheme colorFromJson(const QString& text) {
  QJsonObject o = QJsonDocument::fromJson(text.toUtf8()).object();
  ColorScheme s = builtinColorSchemes().front();
  s.name = o["name"].toString().toStdString();
  s.hilightRate = o["hilightRate"].toInt(42);
  s.darkRate = o["darkRate"].toInt();
  s.gridColor = uint32_t(o["gridColor"].toInteger(0xf2f2f2));
  s.colors.clear();
  QJsonObject colors = o["colors"].toObject();
  for (auto it = colors.begin(); it != colors.end(); ++it)
    s.colors.emplace_back(it.key().toStdString(), uint32_t(it.value().toInteger()));
  QJsonArray roles = o["roles"].toArray();
  for (int i = 0; i < kRoleCount && i < roles.size(); ++i) s.roles[size_t(i)] = rgb(roles[i]);
  s.inner.clear();
  for (auto v : o["inner"].toArray()) s.inner.push_back(rgb(v));
  return s;
}

QString toJson(const ViewScheme& s) {
  QJsonObject o;
  o["name"] = QString::fromStdString(s.name);
  QJsonObject show;
  for (auto& [k, v] : s.show) show[QString::fromStdString(k)] = v;
  o["show"] = show;
  o["gridShow"] = s.gridShow;
  o["alignToGrid"] = s.alignToGrid;
  o["snapToAngle"] = s.snapToAngle;
  QJsonArray vis;
  for (bool v : s.roleVisible) vis.append(v);
  o["roleVisible"] = vis;
  o["innerVisible"] = s.innerVisible;
  return QString::fromUtf8(QJsonDocument(o).toJson(QJsonDocument::Compact));
}

ViewScheme viewFromJson(const QString& text) {
  QJsonObject o = QJsonDocument::fromJson(text.toUtf8()).object();
  ViewScheme s = builtinViewSchemes().front();
  s.name = o["name"].toString().toStdString();
  s.show.clear();
  QJsonObject show = o["show"].toObject();
  for (auto it = show.begin(); it != show.end(); ++it) s.show.emplace_back(it.key().toStdString(), it.value().toBool());
  s.gridShow = o["gridShow"].toBool();
  s.alignToGrid = o["alignToGrid"].toBool();
  s.snapToAngle = o["snapToAngle"].toBool();
  QJsonArray vis = o["roleVisible"].toArray();
  for (int i = 0; i < kRoleCount && i < vis.size(); ++i) s.roleVisible[size_t(i)] = vis[i].toBool();
  s.innerVisible = o["innerVisible"].toBool(true);
  return s;
}

template <class Scheme, class FromJson>
std::vector<Scheme> userSchemes(const char* key, FromJson&& fromJson) {
  std::vector<Scheme> out;
  for (const QString& j : QSettings().value(key).toStringList()) out.push_back(fromJson(j));
  return out;
}

template <class Scheme>
void storeUser(const char* key, const std::vector<Scheme>& list) {
  QStringList out;
  for (auto& s : list) out << toJson(s);
  QSettings().setValue(key, out);
}

}  // namespace

std::vector<ColorScheme> allColorSchemes() {
  auto all = builtinColorSchemes();
  for (auto& s : userSchemes<ColorScheme>("schemes/color", colorFromJson)) all.push_back(s);
  return all;
}

std::vector<ViewScheme> allViewSchemes() {
  auto all = builtinViewSchemes();
  for (auto& s : userSchemes<ViewScheme>("schemes/view", viewFromJson)) all.push_back(s);
  return all;
}

void saveUserColorScheme(const ColorScheme& s) {
  auto list = userSchemes<ColorScheme>("schemes/color", colorFromJson);
  std::erase_if(list, [&](const ColorScheme& o) { return o.name == s.name; });
  list.push_back(s);
  storeUser("schemes/color", list);
}

void saveUserViewScheme(const ViewScheme& s) {
  auto list = userSchemes<ViewScheme>("schemes/view", viewFromJson);
  std::erase_if(list, [&](const ViewScheme& o) { return o.name == s.name; });
  list.push_back(s);
  storeUser("schemes/view", list);
}

void removeUserColorScheme(const std::string& name) {
  auto list = userSchemes<ColorScheme>("schemes/color", colorFromJson);
  std::erase_if(list, [&](const ColorScheme& o) { return o.name == name; });
  storeUser("schemes/color", list);
}

void removeUserViewScheme(const std::string& name) {
  auto list = userSchemes<ViewScheme>("schemes/view", viewFromJson);
  std::erase_if(list, [&](const ViewScheme& o) { return o.name == name; });
  storeUser("schemes/view", list);
}

bool isBuiltinColorScheme(const std::string& name) {
  return r::contains(builtinColorSchemes(), name, &ColorScheme::name);
}

bool isBuiltinViewScheme(const std::string& name) {
  return r::contains(builtinViewSchemes(), name, &ViewScheme::name);
}

std::string defaultColorScheme() {
  return QSettings().value("schemes/defaultColor", "TopoR 6.0").toString().toStdString();
}

std::string defaultViewScheme() {
  return QSettings().value("schemes/defaultView", QString::fromUtf8("Трассировка")).toString().toStdString();
}

const ColorScheme& colorSchemeByName(const std::vector<ColorScheme>& all, const std::string& name) {
  for (auto& s : all)
    if (s.name == name) return s;
  return all.front();
}

const ViewScheme& viewSchemeByName(const std::vector<ViewScheme>& all, const std::string& name) {
  for (auto& s : all)
    if (s.name == name) return s;
  return all.front();
}

}  // namespace xr::gui
