#include "gui/MessagesPanel.h"

#include <QMenu>
#include <QPainter>
#include <QPixmap>
#include <QVBoxLayout>
#include <map>

#include "gui/BoardView.h"

namespace xr::gui {

namespace {

// TopoR's message colours.
const QColor kWarning(0x00, 0x00, 0xd0);
const QColor kError(0xd0, 0x00, 0x00);
const QColor kDrc(0xc0, 0x00, 0xc0);
const QColor kInfo(0x20, 0x50, 0x90);

enum Role { PosX = Qt::UserRole, PosY, HasPos, DrcIndex, NetIndex };

QIcon bullet() {
  QPixmap pm(10, 10);
  pm.fill(Qt::transparent);
  QPainter p(&pm);
  p.fillRect(1, 1, 8, 8, QColor(0xe0, 0x00, 0xe0));
  return QIcon(pm);
}

}  // namespace

QString describeViolation(const Board& b, Unit u, const DrcViolation& v) {
  auto len = [&](double nm) { return formatLength(nm, u, 3); };
  auto name = [&](ItemRef r) {
    QString net = itemNet(b, r) >= 0 ? QString::fromStdString(b.nets[itemNet(b, r)].name) : QObject::tr("без цепи");
    switch (r.type) {
      case ItemType::Track: return QObject::tr("проводник [%1]").arg(net);
      case ItemType::Via: return QObject::tr("переход [%1]").arg(net);
      case ItemType::Pad: {
        const Pad& p = b.pads[r.index];
        QString ref = p.component >= 0 ? QString::fromStdString(b.components[p.component].ref) + "-" : QString();
        return QObject::tr("контакт %1%2 [%3]").arg(ref, QString::fromStdString(p.number), net);
      }
      case ItemType::Zone: return QObject::tr("область металлизации [%1]").arg(net);
      case ItemType::Keepout: return QObject::tr("запрет");
      case ItemType::Text: return QObject::tr("надпись");
      case ItemType::Detail: return QObject::tr("деталь");
    }
    return QString();
  };
  QString where = v.layer >= 0 ? QObject::tr(" на слое '%1'").arg(QString::fromStdString(b.layers[v.layer].name)) : QString();
  QString at = QString(" (%1, %2)[%3]").arg(len(v.pos.x), len(-v.pos.y), unitName(u));
  switch (v.type) {
    case DrcViolation::Type::Clearance:
      return QObject::tr("Зазор %1 < %2: %3 / %4").arg(len(v.actual), len(v.required), name(v.a), name(v.b)) + where + at;
    case DrcViolation::Type::Short: return QObject::tr("Замыкание: %1 / %2").arg(name(v.a), name(v.b)) + where + at;
    case DrcViolation::Type::Edge:
      return QObject::tr("Зазор до края платы %1 < %2: %3").arg(len(v.actual), len(v.required), name(v.a)) + at;
    case DrcViolation::Type::Unconnected: return QObject::tr("Не соединено: %1").arg(QString::fromStdString(v.message)) + at;
    case DrcViolation::Type::Width:
      return QObject::tr("Ширина %1 < %2: %3").arg(len(v.actual), len(v.required), name(v.a)) + where + at;
    case DrcViolation::Type::Keepout: return QObject::tr("Объект в запрете: %1").arg(name(v.a)) + where + at;
    case DrcViolation::Type::Topology: return QObject::tr("Топология: %1").arg(QString::fromStdString(v.message)) + where + at;
  }
  return QString::fromStdString(v.message);
}

MessagesPanel::MessagesPanel(Document* doc, BoardView* view, QWidget* parent) : QWidget(parent), doc_(doc), view_(view) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  tree_ = new QTreeWidget(this);
  tree_->setHeaderHidden(true);
  tree_->setRootIsDecorated(true);
  tree_->setContextMenuPolicy(Qt::CustomContextMenu);
  lay->addWidget(tree_);
  connect(doc_, &Document::boardReplaced, this, &MessagesPanel::rebuild);
  connect(doc_, &Document::boardChanged, this, &MessagesPanel::rebuild);
  connect(doc_, &Document::drcChanged, this, &MessagesPanel::rebuild);
  connect(doc_, &Document::logChanged, this, &MessagesPanel::rebuild);
  connect(tree_, &QTreeWidget::itemDoubleClicked, this, &MessagesPanel::activate);
  connect(tree_, &QWidget::customContextMenuRequested, this, [this](QPoint p) {
    QMenu m(this);
    m.addAction(tr("Удалить DRC сообщения"), doc_, &Document::clearDrc);
    m.addAction(tr("Удалить остальные сообщения"), this, [this] { doc_->clearLog(); });
    m.addSeparator();
    m.addAction(tr("Настройки DRC"), this, &MessagesPanel::drcSettingsRequested);
    m.exec(tree_->viewport()->mapToGlobal(p));
  });
  rebuild();
}

void MessagesPanel::rebuild() {
  tree_->clear();
  if (!doc_->hasBoard()) return;
  const Board& b = *doc_->board();
  QIcon icon = bullet();
  auto group = [&](const QString& text, const QColor& c, int count) {
    auto* g = new QTreeWidgetItem(tree_, {count >= 0 ? QString("%1 (%2)").arg(text).arg(count) : text});
    g->setForeground(0, c);
    g->setIcon(0, icon);
    g->setToolTip(0, text);
    return g;
  };
  auto child = [&](QTreeWidgetItem* g, const QString& text, const QColor& c, std::optional<Vec2> pos) {
    auto* it = new QTreeWidgetItem(g, {text});
    it->setForeground(0, c);
    it->setToolTip(0, text);
    if (pos) {
      it->setData(0, HasPos, true);
      it->setData(0, PosX, pos->x);
      it->setData(0, PosY, pos->y);
    }
    return it;
  };

  // Procedure output, by group.
  std::map<QString, std::vector<const LogMessage*>> logs;
  for (auto& m : doc_->log()) logs[m.group].push_back(&m);
  for (auto& [name, list] : logs) {
    LogMessage::Kind k = list.front()->kind;
    QColor c = k == LogMessage::Kind::Error ? kError : k == LogMessage::Kind::Warning ? kWarning : kInfo;
    if (list.size() == 1) {
      group(list.front()->text, c, -1);
      continue;
    }
    auto* g = group(name, c, int(list.size()));
    for (auto* m : list) child(g, m->text, c, std::nullopt);
  }

  // Unrouted nets (TopoR's warning 5007), one entry per net with its open connections.
  const auto& rats = doc_->connectivity().ratsnest;
  std::map<int, std::vector<const RatsLine*>> byNet;
  for (auto& r : rats) byNet[r.net].push_back(&r);
  for (auto& [net, list] : byNet) {
    QString name = QString::fromStdString(b.nets[net].name);
    auto* g = group(tr("Предупреждение 5007: Не разведена цепь '%1'.").arg(name), kError, int(list.size()));
    g->setData(0, NetIndex, net);
    g->setData(0, HasPos, true);
    g->setData(0, PosX, list.front()->a.x);
    g->setData(0, PosY, list.front()->a.y);
    for (auto* r : list) {
      Unit u = doc_->unit();
      child(g, tr("Связь (%1, %2) – (%3, %4)")
                   .arg(formatLength(r->a.x, u, 2), formatLength(-r->a.y, u, 2), formatLength(r->b.x, u, 2),
                        formatLength(-r->b.y, u, 2)),
            kError, (r->a + r->b) * 0.5);
    }
  }

  // DRC, by kind of violation.
  if (doc_->drcRun()) {
    const auto& drc = doc_->drc();
    if (drc.empty()) group(tr("DRC: нарушений нет"), kInfo, -1);
    struct Kind {
      DrcViolation::Type type;
      QString title;
    };
    for (auto& [type, title] : {Kind{DrcViolation::Type::Short, tr("Нарушение DRC: замыкание")},
                                Kind{DrcViolation::Type::Clearance, tr("Нарушение DRC: зазор")},
                                Kind{DrcViolation::Type::Edge, tr("Нарушение DRC: зазор до края платы")},
                                Kind{DrcViolation::Type::Width, tr("Нарушение DRC: ширина проводника")},
                                Kind{DrcViolation::Type::Keepout, tr("Нарушение DRC: объект в запрете")},
                                Kind{DrcViolation::Type::Unconnected, tr("Нарушение DRC: несоединённые объекты")},
                                Kind{DrcViolation::Type::Topology, tr("Топологическое нарушение (команда прервана)")}}) {
      int n = int(r::count(drc, type, &DrcViolation::type));
      if (!n) continue;
      auto* g = group(title, kDrc, n);
      for (int i = 0; i < int(drc.size()); ++i)
        if (drc[size_t(i)].type == type) child(g, describeViolation(b, doc_->unit(), drc[size_t(i)]), kDrc, drc[size_t(i)].pos)->setData(0, DrcIndex, i);
    }
  }
}

void MessagesPanel::activate(QTreeWidgetItem* it) {
  if (!it || !it->data(0, HasPos).toBool()) return;
  Vec2 pos{it->data(0, PosX).toDouble(), it->data(0, PosY).toDouble()};
  view_->centerOn(pos, 10);
  // The objects of the message are highlighted.
  if (QVariant d = it->data(0, DrcIndex); d.isValid()) {
    const DrcViolation& v = doc_->drc()[size_t(d.toInt())];
    std::vector<ItemRef> items{v.a};
    if (v.hasB) items.push_back(v.b);
    std::erase_if(items, [](ItemRef r) { return r.index < 0; });
    doc_->setSelection(std::move(items), {});
  } else if (QVariant n = it->data(0, NetIndex); n.isValid()) {
    doc_->setHighlightedNet(n.toInt());
  }
}

}  // namespace xr::gui
