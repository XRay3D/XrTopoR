#include "gui/ToporConfig.h"

#include <QDate>
#include <QDir>
#include <QDirIterator>
#include <QFileInfo>

#include "io/BoardIO.h"
#include "io/topor/FsProj.h"
#include "io/xml/Xml.h"

namespace xr::gui {

QKeySequence keyFromWindows(int vk, int fVirt) {
  int key = 0;
  if ((vk >= '0' && vk <= '9') || (vk >= 'A' && vk <= 'Z')) key = vk;
  else if (vk >= 112 && vk <= 135) key = Qt::Key_F1 + (vk - 112);
  else if (vk >= 96 && vk <= 105) key = (Qt::Key_0 + (vk - 96)) | Qt::KeypadModifier;
  else
    switch (vk) {
      case 8: key = Qt::Key_Backspace; break;
      case 9: key = Qt::Key_Tab; break;
      case 13: key = Qt::Key_Return; break;
      case 27: key = Qt::Key_Escape; break;
      case 32: key = Qt::Key_Space; break;
      case 33: key = Qt::Key_PageUp; break;
      case 34: key = Qt::Key_PageDown; break;
      case 35: key = Qt::Key_End; break;
      case 36: key = Qt::Key_Home; break;
      case 37: key = Qt::Key_Left; break;
      case 38: key = Qt::Key_Up; break;
      case 39: key = Qt::Key_Right; break;
      case 40: key = Qt::Key_Down; break;
      case 45: key = Qt::Key_Insert; break;
      case 46: key = Qt::Key_Delete; break;
      case 106: key = Qt::Key_Asterisk | Qt::KeypadModifier; break;
      case 107: key = Qt::Key_Plus | Qt::KeypadModifier; break;
      case 109: key = Qt::Key_Minus | Qt::KeypadModifier; break;
      case 110: key = Qt::Key_Period | Qt::KeypadModifier; break;
      case 111: key = Qt::Key_Slash | Qt::KeypadModifier; break;
      case 186: key = Qt::Key_Semicolon; break;
      case 187: key = Qt::Key_Equal; break;
      case 188: key = Qt::Key_Comma; break;
      case 189: key = Qt::Key_Minus; break;
      case 190: key = Qt::Key_Period; break;
      case 191: key = Qt::Key_Slash; break;
      case 192: key = Qt::Key_QuoteLeft; break;
      case 219: key = Qt::Key_BracketLeft; break;
      case 220: key = Qt::Key_Backslash; break;
      case 221: key = Qt::Key_BracketRight; break;
      case 222: key = Qt::Key_Apostrophe; break;
      default: return {};
    }
  if (fVirt & 4) key |= Qt::ShiftModifier;
  if (fVirt & 8) key |= Qt::ControlModifier;
  if (fVirt & 16) key |= Qt::AltModifier;
  return QKeySequence(key);
}

QString findToporConfig() {
  QStringList prefixes;
  if (QString p = qEnvironmentVariable("WINEPREFIX"); !p.isEmpty()) prefixes << p;
  prefixes << QDir::home().filePath(".wine");
  for (const QFileInfo& fi : QDir(QDir::home().filePath(".local/share/wineprefixes")).entryInfoList(QDir::Dirs | QDir::NoDotAndDotDot))
    prefixes << fi.absoluteFilePath();
  QString best;
  QDateTime bestTime;
  for (const QString& prefix : prefixes) {
    QDir users(prefix + "/drive_c/users");
    for (const QString& user : users.entryList(QDir::Dirs | QDir::NoDotAndDotDot)) {
      QDir dir(users.filePath(user + "/AppData/Roaming/Eremex/TopoR"));
      for (const QFileInfo& cfg : dir.entryInfoList({"TopoR_*.cfg"}, QDir::Files))
        if (best.isEmpty() || cfg.lastModified() > bestTime) {
          best = cfg.absoluteFilePath();
          bestTime = cfg.lastModified();
        }
    }
  }
  return best;
}

std::optional<ToporSettings> readToporConfig(const QString& path, QString* error) {
  auto text = io::readFile(path.toStdString());
  if (!text) {
    if (error) *error = QString::fromStdString(text.error());
    return std::nullopt;
  }
  auto doc = xml::parse(*text);
  if (!doc) {
    if (error) *error = QString::fromStdString(doc.error());
    return std::nullopt;
  }
  ToporSettings s;
  s.path = path;
  // Paths in the configuration are Windows paths of the Wine prefix.
  QString prefix = QFileInfo(path).absoluteFilePath();
  prefix = prefix.left(prefix.indexOf("/drive_c/"));
  auto posix = [&](std::string_view win) {
    QString p = QString::fromStdString(io::resolveProjectPath("/", std::string(win), prefix.toStdString()));
    QFileInfo fi(p);
    return fi.exists() ? fi.canonicalFilePath() : p;
  };

  // Sections are nested differently between TopoR versions: found wherever they are.
  std::function<const xml::Element*(const xml::Element&, std::string_view)> findTag =
      [&](const xml::Element& e, std::string_view tag) -> const xml::Element* {
    if (e.is(tag)) return &e;
    for (auto& k : e.kids)
      if (auto* r = findTag(k, tag)) return r;
    return nullptr;
  };
  if (auto* acc = findTag(*doc, "accelerators"))
    for (auto* a : acc->findAll("accelCmd")) {
      QString id = QString::fromStdString(std::string(a->attr("cmdID")));
      QKeySequence k = keyFromWindows(int(a->num("key")), int(a->num("fVirt")));
      auto& list = s.accelerators[id];
      if (!k.isEmpty()) list << k;
    }
  if (auto* fw = findTag(*doc, "framework")) {
    if (auto* panels = fw->find("panels"))
      for (auto* p : panels->findAll("panel")) {
        ToporPanel tp;
        tp.name = QString::fromStdString(std::string(p->attr("name")));
        tp.state = QString::fromStdString(std::string(p->attr("state")));
        tp.posHor = int(p->num("posHor"));
        tp.posVert = int(p->num("posVert"));
        tp.widthDocked = int(p->num("widthDocked"));
        tp.heightDocked = int(p->num("heightDocked"));
        tp.spaceScale = p->num("spaceScale");
        s.panels.push_back(tp);
      }
  }
  // Panel visibility lives in another section.
  if (auto* vis = findTag(*doc, "panelsvisibility"))
    for (auto* p : vis->findAll("panel"))
      for (auto& tp : s.panels)
        if (tp.name.toStdString() == p->attr("name")) tp.visible = p->flag("visible", true);
  if (auto* rp = findTag(*doc, "recentprojects")) {
    if (rp->has("last_opened")) s.openLastProject = rp->flag("last_opened");
    for (auto* f : rp->findAll("recentfile")) {
      QDate d = QDate::fromString(QString::fromStdString(std::string(f->attr("fdate"))), "yyyyMMdd");
      s.recentProjects.push_back({posix(f->attr("fname")), QDateTime(d.isValid() ? d : QDate::currentDate(), QTime(12, 0))});
    }
  }
  return s;
}

}  // namespace xr::gui
