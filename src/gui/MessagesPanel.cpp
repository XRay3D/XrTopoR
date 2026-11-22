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
    case DrcViolation::Type::Component: {
      auto ref = [&](ItemRef r) {
        const int c = r.type == ItemType::Pad ? b.pads[size_t(r.index)].component : -1;
        return c >= 0 ? QString::fromStdString(b.components[size_t(c)].ref) : QString();
      };
      if (!v.hasB) return QObject::tr("Зазор от компонента до края платы %1 < %2: %3").arg(len(v.actual), len(v.required), ref(v.a)) + at;
      if (v.actual <= 0) return QObject::tr("Компоненты пересекаются: %1 / %2").arg(ref(v.a), ref(v.b)) + at;
      return QObject::tr("Зазор между компонентами %1 < %2: %3 / %4").arg(len(v.actual), len(v.required), ref(v.a), ref(v.b)) + at;
    }
    case DrcViolation::Type::Topology: return QObject::tr("Топология: %1").arg(QString::fromStdString(v.message)) + where + at;
  }
  return QString::fromStdString(v.message);
}

namespace {

// By how much a delay rule is not kept, as TopoR tells it: «0.08 пс (0.012 мм)» — the time and the length that
// makes it (on an inner layer: the rule does not say where the wire is to be made longer); a rule in units of
// length the other way round.
QString delayExcess(const DelayViolation& v, Unit u) {
  double over = 0;
  switch (v.kind) {
    case DelayViolation::Kind::Equal:
    case DelayViolation::Kind::Mismatch: over = v.value - v.high; break;
    default: over = std::max(v.value - v.high, v.low - v.value); break;
  }
  over = std::max(over, 0.0);
  const double ps = v.time ? over : over / kNmPerMm * kDelayInnerPsPerMm, nm = v.time ? over / kDelayInnerPsPerMm * kNmPerMm : over;
  const QString time = QObject::tr("%1 пс").arg(ps, 0, 'f', 2), length = QString("%1 %2").arg(formatLength(nm, u, 3), unitName(u));
  return v.time ? QString("%1 (%2)").arg(time, length) : QString("%1 (%2)").arg(length, time);
}

// The rule's name as TopoR names it: «Выравнивание_Группы_#N» for a group's, «Взаимное_Выравнивание_#N» for the
// others, numbered from one in the order of their pages.
QString delayRuleName(const Board& b, const DelayViolation& v) {
  const auto& rules = b.hispeed.delays;
  if (v.rule < 0 || v.rule >= int(rules.size())) return {};
  const bool group = rules[size_t(v.rule)].kind == DelayRule::Kind::Equal;
  int number = 1;
  for (int i = 0; i < v.rule; ++i) number += (rules[size_t(i)].kind == DelayRule::Kind::Equal) == group;
  return (group ? QObject::tr("Выравнивание_Группы_#%1") : QObject::tr("Взаимное_Выравнивание_#%1")).arg(number);
}

}  // namespace

// As TopoR's: «Предупреждение 2003: Правило 'Взаимное_Выравнивание_#1' не выполняется для сигналов 'A8' и
// 'SDCLK_U2' на 0.08 пс (0.012 мм)».
QString describeDelayViolation(const Board& b, Unit u, const DelayViolation& v) {
  auto q = [](const std::string& s) { return QString::fromStdString(s); };
  const QString by = delayExcess(v, u);
  switch (v.kind) {
    case DelayViolation::Kind::Equal:
      return QObject::tr("Предупреждение 2003: Правило '%1' не выполняется для сигналов '%2' и '%3' на %4").arg(delayRuleName(b, v), q(v.shorter), q(v.longer), by);
    case DelayViolation::Kind::Relation:
      return QObject::tr("Предупреждение 2003: Правило '%1' не выполняется для сигналов '%2' и '%3' на %4").arg(delayRuleName(b, v), q(v.left), q(v.right), by);
    case DelayViolation::Kind::Constant:
      return QObject::tr("Предупреждение 2003: Правило '%1' не выполняется для сигнала '%2' на %3").arg(delayRuleName(b, v), q(v.shorter), by);
    case DelayViolation::Kind::Mismatch:
      return QObject::tr("Предупреждение 2003: Допустимый разброс длин дифф. сигнала '%1' не выполняется для сигналов '%2' и '%3' на %4")
          .arg(v.rule >= 0 && v.rule < int(b.hispeed.diffSignals.size()) ? q(b.hispeed.diffSignals[size_t(v.rule)].name) : QString(), q(v.shorter), q(v.longer), by);
  }
  return {};
}

// TopoR's advice under the message: which signal to make longer, which shorter, by how much.
QStringList delayAdvice(const Board&, Unit u, const DelayViolation& v) {
  auto q = [](const std::string& s) { return QString::fromStdString(s); };
  const QString by = delayExcess(v, u);
  auto more = [&](const std::string& s) { return QObject::tr("Совет: Увеличить задержку на сигнале '%1' на %2.").arg(q(s), by); };
  auto less = [&](const std::string& s) { return QObject::tr("Совет: Уменьшить задержку на сигнале '%1' на %2.").arg(q(s), by); };
  switch (v.kind) {
    case DelayViolation::Kind::Equal:
    case DelayViolation::Kind::Mismatch: return {more(v.shorter), less(v.longer)};
    case DelayViolation::Kind::Relation:  // (left − right is to be within the span)
      return v.value < v.low ? QStringList{more(v.left), less(v.right)} : QStringList{more(v.right), less(v.left)};
    case DelayViolation::Kind::Constant: return {v.value < v.low ? more(v.shorter) : less(v.shorter)};
  }
  return {};
}

QString describeSerpentConflict(const Board& b, const SerpentConflict& c) {
  auto net = [&](int n) { return n >= 0 && n < int(b.nets.size()) ? QString::fromStdString(b.nets[size_t(n)].name) : QString(); };
  const QString layer = c.layer >= 0 && c.layer < LayerId(b.layers.size()) ? QString::fromStdString(b.layers[size_t(c.layer)].name) : QString();
  const QString mine = net(c.net), other = net(c.otherNet);
  switch (c.code) {
    case 5042: return QObject::tr("Ошибка 5042! На слое '%1' проводник цепи '%2' пересекается со змейкой цепи '%3'.").arg(layer, other, mine);
    case 5043: {
      QString pin;
      if (c.other.type == ItemType::Pad && c.other.index >= 0 && c.other.index < int(b.pads.size())) {
        const Pad& p = b.pads[size_t(c.other.index)];
        pin = (p.component >= 0 ? QString::fromStdString(b.components[size_t(p.component)].ref) + "-" : QString()) + QString::fromStdString(p.number);
      }
      return QObject::tr("Ошибка 5043! На слое '%1' контакт %2 (цепь '%3') пересекается со змейкой цепи '%4'.").arg(layer, pin, other, mine);
    }
    case 5045: return QObject::tr("Ошибка 5045! На слое '%1' переход цепи '%2' пересекается со змейкой цепи '%3'.").arg(layer, other, mine);
    case 5049: return QObject::tr("Ошибка 5049! На слое '%1' зафиксированный проводник цепи '%2' пересекается со змейкой цепи '%3'.").arg(layer, other, mine);
    case 5050: return QObject::tr("Ошибка 5050! На слое '%1' змейка цепи '%2' пересекает запрет трассировки.").arg(layer, mine);
    case 5051:
      return c.otherNet >= 0 ? QObject::tr("Ошибка 5051! На слое '%1' змейка цепи '%2' пересекает область металлизации цепи '%3'.").arg(layer, mine, other)
                             : QObject::tr("Ошибка 5051! На слое '%1' змейка цепи '%2' пересекает неподключённую область металлизации.").arg(layer, mine);
    case 5052: return QObject::tr("Ошибка 5052! На слое '%1' змейка цепи '%2' пересекает контур платы.").arg(layer, mine);
    case 5053: return QObject::tr("Ошибка 5053! На слое '%1' пересекаются змейки цепей '%2' и '%3'.").arg(layer, mine, other);
  }
  return {};
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
    // «Фильтр сообщений»: the warnings it switches off are not shown (they stay in the check's result).
    const MessageFilter& filter = b.settings.messages;
    auto shown = [&](const DrcViolation& v) { return filter.shows(messageCode(b, v)); };
    const int hidden = int(r::count_if(drc, [&](const DrcViolation& v) { return !shown(v); }));
    if (drc.size() == size_t(hidden) && doc_->delayViolations().empty())
      group(hidden ? tr("DRC: нарушений нет (скрыто фильтром сообщений: %1)").arg(hidden) : tr("DRC: нарушений нет"), kInfo, -1);
    struct Kind {
      DrcViolation::Type type;
      QString title;
    };
    for (auto& [type, title] : {Kind{DrcViolation::Type::Short, tr("Нарушение DRC: замыкание")},
                                Kind{DrcViolation::Type::Clearance, tr("Нарушение DRC: зазор")},
                                Kind{DrcViolation::Type::Edge, tr("Нарушение DRC: зазор до края платы")},
                                Kind{DrcViolation::Type::Width, tr("Нарушение DRC: ширина проводника")},
                                Kind{DrcViolation::Type::Keepout, tr("Нарушение DRC: объект в запрете")},
                                Kind{DrcViolation::Type::Component, tr("Нарушение DRC: зазор между компонентами")},
                                Kind{DrcViolation::Type::Unconnected, tr("Нарушение DRC: несоединённые объекты")},
                                Kind{DrcViolation::Type::Topology, tr("Топологическое нарушение (команда прервана)")}}) {
      int n = int(r::count_if(drc, [&](const DrcViolation& v) { return v.type == type && shown(v); }));
      if (!n) continue;
      auto* g = group(title, kDrc, n);
      for (int i = 0; i < int(drc.size()); ++i)
        if (drc[size_t(i)].type == type && shown(drc[size_t(i)])) child(g, describeViolation(b, doc_->unit(), drc[size_t(i)]), kDrc, drc[size_t(i)].pos)->setData(0, DrcIndex, i);
    }
    // The delay rules the board does not keep, as TopoR shows them: the message with the two signals furthest
    // apart and by how much, the advice under it.
    for (const DelayViolation& v : doc_->delayViolations()) {
      const QStringList advice = delayAdvice(b, doc_->unit(), v);
      auto* g = group(describeDelayViolation(b, doc_->unit(), v), kDrc, int(advice.size()));
      g->setData(0, HasPos, true);
      g->setData(0, PosX, v.at.x);
      g->setData(0, PosY, v.at.y);
      const int net = b.findNet(v.netShorter);
      if (net >= 0) g->setData(0, NetIndex, net);
      for (const QString& a : advice) {
        auto* it = child(g, a, kInfo, v.at);
        if (net >= 0) it->setData(0, NetIndex, net);
      }
    }
    // What the serpents' areas meet (TopoR's topological errors 5042–5053).
    if (const auto& met = doc_->serpentConflicts(); !met.empty()) {
      auto* g = group(tr("Топологическая ошибка: пересечение со змейкой"), kDrc, int(met.size()));
      for (const SerpentConflict& c : met) {
        auto* it = child(g, describeSerpentConflict(b, c), kDrc, c.at);
        if (c.net >= 0) it->setData(0, NetIndex, c.net);
      }
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
