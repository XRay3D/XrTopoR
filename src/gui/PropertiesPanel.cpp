#include "gui/PropertiesPanel.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDoubleSpinBox>
#include <QFormLayout>
#include <QHBoxLayout>
#include <QPushButton>
#include <QHeaderView>
#include <QLabel>
#include <QLineEdit>
#include <QScrollArea>
#include <QSpinBox>
#include <QTabWidget>
#include <QTableWidget>
#include <QVBoxLayout>

#include "core/Edit.h"
#include "core/Padstack.h"
#include "core/ZoneFill.h"
#include "gui/PadstackDialogs.h"
#include "gui/SpinBox.h"
#include "io/BoardIO.h"

namespace xr::gui {

namespace {

// The value all objects share, if any.
template <class T, class F>
std::optional<T> common(const std::vector<int>& idx, F&& get) {
  std::optional<T> v;
  for (int i : idx) {
    T x = get(i);
    if (v && *v != x) return std::nullopt;
    v = x;
  }
  return v;
}

QLabel* title(const QString& text) {
  auto* l = new QLabel(QString("<b><font color=\"#3060a0\">%1</font></b>").arg(text.toHtmlEscaped()));
  return l;
}

// The cells of «Форма»: a name and up to three values (x, y in the unit — y up, as the board is shown — a length,
// an angle).
enum class Val { X, Y, Len, Deg, None };

// The point a row of the shape table stands for.
Vec2 rowPoint(const Graphic& f, int row) {
  switch (f.kind) {
    case GraphicKind::Line:
    case GraphicKind::Arc:
    case GraphicKind::Rect: return row == 0 ? f.a : f.b;
    case GraphicKind::Circle: return f.a;
    case GraphicKind::Poly: return row < int(f.pts.size()) ? f.pts[row] : Vec2{};
  }
  return {};
}

QString cellText(const Graphic& g, int row, Val val, Unit u) {
  switch (val) {
    case Val::X: return formatLength(rowPoint(g, row).x, u);
    case Val::Y: return formatLength(-rowPoint(g, row).y, u);
    case Val::Len: return formatLength((g.b - g.a).len(), u);
    case Val::Deg: {
      double deg = g.kind == GraphicKind::Arc ? arcAngle(g.a, g.m, g.b) : g.arcOf(size_t(row));
      return deg == 0 && g.kind == GraphicKind::Poly ? QString() : QString::number(deg, 'g', 8);
    }
    case Val::None: return {};
  }
  return {};
}

}  // namespace

PropertiesPanel::PropertiesPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* lay = new QVBoxLayout(this);
  lay->setContentsMargins(0, 0, 0, 0);
  area_ = new QScrollArea(this);
  area_->setWidgetResizable(true);
  area_->setFrameShape(QFrame::NoFrame);
  lay->addWidget(area_);
  connect(doc_, &Document::selectionChanged, this, &PropertiesPanel::rebuild);
  connect(doc_, &Document::boardChanged, this, [this] {
    if (!committing_) rebuild();
  });
  connect(doc_, &Document::unitChanged, this, &PropertiesPanel::rebuild);
  connect(doc_, &Document::boardReplaced, this, &PropertiesPanel::rebuild);
  rebuild();
}

void PropertiesPanel::edit(const QString& t, const std::function<void(Board&)>& fn) {
  if (!doc_->hasBoard()) return;
  auto before = doc_->beginEdit();
  fn(*doc_->board());
  committing_ = true;
  doc_->commitEdit(before, t);
  committing_ = false;
}

QWidget* PropertiesPanel::message(const QString& text) {
  auto* w = new QWidget;
  auto* v = new QVBoxLayout(w);
  v->addWidget(title(text));
  v->addStretch(1);
  return w;
}

// Puts a value (none: the objects differ) into a length box without it counting as an edit.
static void showLength(QDoubleSpinBox* s, std::optional<double> nm, Unit u) {
  QSignalBlocker block(s);
  s->setSpecialValueText(nm ? QString() : QString(" "));
  s->setValue(nm ? toUnit(*nm, u) : s->minimum());
  s->setProperty("shown", s->value());
}

QWidget* PropertiesPanel::length(std::optional<double> nm, std::function<void(double)> set, double min) {
  Unit u = doc_->unit();
  auto* s = new DoubleSpinBox;
  s->setDecimals(u == Unit::Mil ? 2 : 4);
  s->setRange(toUnit(min, u), 1e6);
  if (min < 0) s->setRange(-1e6, 1e6);
  s->setSuffix(" " + unitName(u));
  s->setKeyboardTracking(false);
  showLength(s, nm, u);
  // An edit is a value other than the one shown last (not the first one: a value put back is an edit too).
  connect(s, &QDoubleSpinBox::editingFinished, this, [s, set, u] {
    if (s->value() == s->property("shown").toDouble()) return;
    s->setProperty("shown", s->value());
    set(fromUnit(s->value(), u));
  });
  return s;
}

void PropertiesPanel::rebuild() {
  QWidget* page = nullptr;
  if (!doc_->hasBoard()) {
    page = message({});
  } else {
    const Board& b = *doc_->board();
    auto items = doc_->selectedItems();
    auto comps = doc_->selectedComponents();
    std::vector<int> tracks, vias, pads, zones, keepouts, texts, details;
    for (ItemRef r : items) {
      if (r.index < 0) continue;
      switch (r.type) {
        case ItemType::Track: tracks.push_back(r.index); break;
        case ItemType::Via: vias.push_back(r.index); break;
        case ItemType::Pad: pads.push_back(r.index); break;
        case ItemType::Zone: zones.push_back(r.index); break;
        case ItemType::Keepout: keepouts.push_back(r.index); break;
        case ItemType::Text: texts.push_back(r.index); break;
        case ItemType::Detail: details.push_back(r.index); break;
      }
    }
    int kinds = !tracks.empty() + !vias.empty() + !zones.empty() + !comps.empty() + (comps.empty() && !pads.empty()) +
                !keepouts.empty() + !texts.empty() + !details.empty();
    if (kinds == 0) page = message(tr("Нет выделенных объектов"));
    else if (kinds > 1) page = message(tr("Выделены объекты разных типов (%1)").arg(items.size() + comps.size()));
    else if (!comps.empty()) page = componentPage(comps);
    else if (!tracks.empty()) page = wirePage(tracks);
    else if (!vias.empty()) page = viaPage(vias);
    else if (!zones.empty()) page = zones.size() == 1 ? zonePage(zones[0]) : message(tr("Области металлизации (%1)").arg(zones.size()));
    else if (!keepouts.empty()) page = keepouts.size() == 1 ? keepoutPage(keepouts[0]) : message(tr("Запреты (%1)").arg(keepouts.size()));
    else if (!texts.empty()) page = texts.size() == 1 ? textPage(texts[0]) : message(tr("Надписи (%1)").arg(texts.size()));
    else if (!details.empty()) page = detailPage(details);
    else page = pads.size() == 1 ? padPage(pads[0]) : message(tr("Контакты (%1)").arg(pads.size()));
    (void)b;
  }
  // The same objects again (a value edited, a vertex added): the same tab.
  auto* before = qobject_cast<QTabWidget*>(area_->widget());
  auto* now = qobject_cast<QTabWidget*>(page);
  auto items = doc_->hasBoard() ? doc_->selectedItems() : std::vector<ItemRef>{};
  auto comps = doc_->hasBoard() ? doc_->selectedComponents() : std::vector<int>{};
  if (before && now && items == shownItems_ && comps == shownComps_ && before->currentIndex() < now->count())
    now->setCurrentIndex(before->currentIndex());
  shownItems_ = std::move(items);
  shownComps_ = std::move(comps);
  area_->setWidget(page);
}

// ---------------------------------------------------------------- pages

QWidget* PropertiesPanel::keepoutPage(int ki) {
  const Board& b = *doc_->board();
  const Keepout& k = b.keepouts[ki];
  auto* tabs = new QTabWidget;
  auto* w = new QWidget;
  tabs->addTab(w, tr("Общие"));
  for (int i = 0; i < int(k.shape.size()); ++i) {
    QString name = shapeTitle(k.shape[i]);
    if (k.shape.size() > 1) name.insert(name.indexOf(' '), QString(" %1").arg(i + 1));
    tabs->addTab(shapePage({ItemType::Keepout, ki}, i), name);
  }
  auto* f = new QFormLayout(w);
  f->addRow(title(tr("Запрет")));
  auto* role = new QComboBox;
  role->addItems({tr("Запрет трассировки"), tr("Запрет размещения")});
  role->setCurrentIndex(k.role == Keepout::Role::Place);
  connect(role, &QComboBox::activated, this, [this, ki](int i) {
    edit(tr("Роль запрета"), [&](Board& bd) { bd.keepouts[ki].role = i ? Keepout::Role::Place : Keepout::Role::Route; });
  });
  f->addRow(tr("Роль:"), role);
  if (k.role == Keepout::Role::Route) {
    auto* what = new QComboBox;
    what->addItems({tr("Проводники"), tr("Переходные отверстия"), tr("Проводники и переходные отверстия")});
    what->setCurrentIndex(k.wires && k.vias ? 2 : k.vias ? 1 : 0);
    connect(what, &QComboBox::activated, this, [this, ki](int i) {
      edit(tr("Запрет трассировки"), [&](Board& bd) {
        bd.keepouts[ki].wires = i != 1;
        bd.keepouts[ki].vias = i != 0;
      });
    });
    f->addRow(tr("Распространяется на:"), what);
    // Layers: «Все слои» or a set of copper layers.
    auto* all = new QCheckBox(tr("Все слои"));
    all->setChecked(!k.layers);
    connect(all, &QCheckBox::toggled, this, [this, ki](bool on) {
      const Board& bd = *doc_->board();
      edit(tr("Слои запрета"), [&](Board& x) { x.keepouts[ki].layers = on ? 0 : LayerMask(1) << bd.topCopper(); });
    });
    f->addRow(tr("Слои:"), all);
    for (LayerId l : b.copperLayers()) {
      auto* cb = new QCheckBox(QString::fromStdString(b.layers[l].name));
      cb->setChecked(!k.layers || ((k.layers >> l) & 1));
      cb->setEnabled(k.layers != 0);
      connect(cb, &QCheckBox::toggled, this, [this, ki, l](bool on) {
        edit(tr("Слои запрета"), [&](Board& x) {
          LayerMask& m = x.keepouts[ki].layers;
          m = on ? m | (LayerMask(1) << l) : m & ~(LayerMask(1) << l);
          if (!m) m = LayerMask(1) << l;  // at least one layer
        });
      });
      f->addRow(QString(), cb);
    }
  } else {
    auto* side = new QComboBox;
    side->addItems({tr("Верхняя сторона"), tr("Нижняя сторона"), tr("Обе стороны")});
    side->setCurrentIndex(k.side == Side::Top ? 0 : k.side == Side::Bottom ? 1 : 2);
    connect(side, &QComboBox::activated, this, [this, ki](int i) {
      edit(tr("Сторона запрета"), [&](Board& bd) { bd.keepouts[ki].side = i == 0 ? Side::Top : i == 1 ? Side::Bottom : Side::None; });
    });
    f->addRow(tr("Сторона:"), side);
  }
  return tabs;
}

QWidget* PropertiesPanel::textPage(int ti) {
  const Board& b = *doc_->board();
  const Text& t = b.texts[ti];
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(title(tr("Надпись")));
  auto* text = new QLineEdit(QString::fromStdString(t.text));
  connect(text, &QLineEdit::returnPressed, this, [this, text, ti] {
    if (text->text().isEmpty()) return;
    edit(tr("Изменить надпись"), [&](Board& bd) { bd.texts[ti].text = text->text().toStdString(); });
  });
  f->addRow(tr("Текст:"), text);
  auto* layer = new QComboBox;
  for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
    if (b.layers[l].kind != LayerKind::Edge) layer->addItem(QString::fromStdString(b.layers[l].name), int(l));
  layer->setCurrentIndex(layer->findData(int(t.layer)));
  connect(layer, &QComboBox::activated, this, [this, layer, ti](int i) {
    edit(tr("Слой надписи"), [&](Board& bd) { bd.texts[ti].layer = LayerId(layer->itemData(i).toInt()); });
  });
  f->addRow(tr("Слой:"), layer);
  auto* style = new QComboBox;
  for (auto& st : b.textStyles) style->addItem(QString::fromStdString(st.name));
  style->setCurrentIndex(t.style);
  connect(style, &QComboBox::activated, this, [this, ti](int i) {
    edit(tr("Стиль надписи"), [&](Board& bd) { bd.texts[ti].style = i; });
  });
  f->addRow(tr("Стиль:"), style);
  auto* angle = new DoubleSpinBox;
  angle->setRange(-360, 360);
  angle->setSuffix("°");
  angle->setValue(t.angle);
  angle->setKeyboardTracking(false);
  connect(angle, &QDoubleSpinBox::editingFinished, this, [this, angle, ti] {
    if (angle->value() == doc_->board()->texts[ti].angle) return;
    edit(tr("Поворот надписи"), [&](Board& bd) { bd.texts[ti].angle = angle->value(); });
  });
  f->addRow(tr("Поворот:"), angle);
  auto* mirror = new QCheckBox(tr("Зеркальность"));
  mirror->setChecked(t.mirror);
  connect(mirror, &QCheckBox::toggled, this, [this, ti](bool on) {
    edit(tr("Зеркальность надписи"), [&](Board& bd) { bd.texts[ti].mirror = on; });
  });
  f->addRow(mirror);
  return w;
}

QWidget* PropertiesPanel::detailPage(const std::vector<int>& details) {
  const Board& b = *doc_->board();
  bool outline = r::all_of(details, [&](int i) { return b.isEdge(b.graphics[i].layer); });
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(title(outline ? tr("Контур платы") : tr("Деталь")));
  if (!outline) {
    auto* layer = new QComboBox;
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l)
      if (b.layers[l].kind != LayerKind::Copper && b.layers[l].kind != LayerKind::Edge)
        layer->addItem(QString::fromStdString(b.layers[l].name), int(l));
    auto cur = common<LayerId>(details, [&](int i) { return b.graphics[i].layer; });
    layer->setCurrentIndex(cur ? layer->findData(int(*cur)) : -1);
    connect(layer, &QComboBox::activated, this, [this, layer, details](int i) {
      edit(tr("Слой детали"), [&](Board& bd) {
        for (int d : details) bd.graphics[d].layer = LayerId(layer->itemData(i).toInt());
      });
    });
    f->addRow(tr("Слой:"), layer);
  }
  auto wid = common<Coord>(details, [&](int i) { return b.graphics[i].width; });
  f->addRow(tr("Толщина линии:"), length(wid ? std::optional<double>(double(*wid)) : std::nullopt, [this, details](double nm) {
              edit(tr("Толщина линии"), [&](Board& bd) {
                for (int d : details) bd.graphics[d].width = Coord(std::llround(nm));
              });
            }));
  if (details.size() != 1) return w;
  auto* tabs = new QTabWidget;
  tabs->addTab(w, tr("Общие"));
  tabs->addTab(shapePage({ItemType::Detail, details[0]}, 0), shapeTitle(b.graphics[details[0]]));
  return tabs;
}

QString PropertiesPanel::shapeTitle(const Graphic& g) {
  switch (g.kind) {
    case GraphicKind::Line: return tr("Форма (Линия)");
    case GraphicKind::Arc: return tr("Форма (Дуга)");
    case GraphicKind::Circle: return g.filled ? tr("Форма (Круг)") : tr("Форма (Окружность)");
    case GraphicKind::Rect: return tr("Форма (Прямоугольник)");
    case GraphicKind::Poly: return tr("Форма (Многоугольник)");
  }
  return tr("Форма");
}

void PropertiesPanel::editShape(ItemRef r, int part, const QString& t, const std::function<void(Graphic&)>& fn) {
  edit(t, [&](Board& bd) {
    edit::editFigure(bd, r, part, [&](std::vector<Graphic>& list, int i) { fn(list[i]); });
    if (r.type == ItemType::Detail && bd.isEdge(bd.graphics[r.index].layer)) io::rebuildOutline(bd);
    if (r.type == ItemType::Zone && !bd.zones[r.index].filled.empty()) {
      bd.zones[r.index].filled.clear();
      ZoneFillOptions o;
      o.only = {r.index};
      fillZones(bd, o);
    }
  });
}

QWidget* PropertiesPanel::shapePage(ItemRef r, int part) {
  auto fig = edit::figureOf(*doc_->board(), r, part);
  auto* w = new QWidget;
  auto* v = new QVBoxLayout(w);
  if (!fig) return w;
  const Graphic g = *fig;
  Unit u = doc_->unit();
  QString un = unitName(u);
  struct Row {
    QString name;
    Val c1, c2, c3 = Val::None;
  };
  std::vector<Row> rows;
  QStringList head{"#", QString("X (%1)").arg(un), QString("Y (%1)").arg(un)};
  bool poly = g.kind == GraphicKind::Poly;
  switch (g.kind) {
    case GraphicKind::Line: rows = {{tr("Начало"), Val::X, Val::Y}, {tr("Конец"), Val::X, Val::Y}}; break;
    case GraphicKind::Arc:
      rows = {{tr("Начало"), Val::X, Val::Y}, {tr("Конец"), Val::X, Val::Y}, {tr("Угол дуги"), Val::Deg, Val::None}};
      break;
    case GraphicKind::Circle: rows = {{tr("Центр"), Val::X, Val::Y}, {tr("Радиус"), Val::Len, Val::None}}; break;
    case GraphicKind::Rect: rows = {{tr("Угол 1"), Val::X, Val::Y}, {tr("Угол 2"), Val::X, Val::Y}}; break;
    case GraphicKind::Poly:
      head << tr("Угол дуги (− по часовой)");
      for (size_t k = 0; k < g.pts.size(); ++k) rows.push_back({QString::number(k + 1), Val::X, Val::Y, Val::Deg});
      break;
  }
  auto* t = new QTableWidget(int(rows.size()), int(head.size()));
  t->setObjectName("shape");
  t->setHorizontalHeaderLabels(head);
  t->verticalHeader()->hide();
  t->setSelectionBehavior(QAbstractItemView::SelectRows);
  t->setSelectionMode(QAbstractItemView::SingleSelection);
  t->horizontalHeader()->setStretchLastSection(true);
  for (int i = 0; i < int(rows.size()); ++i) {
    auto* name = new QTableWidgetItem(rows[i].name);
    name->setFlags(Qt::ItemIsEnabled | Qt::ItemIsSelectable);
    t->setItem(i, 0, name);
    Val vals[] = {rows[i].c1, rows[i].c2, rows[i].c3};
    for (int c = 0; c < int(head.size()) - 1; ++c) {
      auto* it = new QTableWidgetItem(cellText(g, i, vals[c], u));
      it->setData(Qt::UserRole, int(vals[c]));
      if (vals[c] == Val::None) it->setFlags(Qt::ItemIsEnabled);
      t->setItem(i, c + 1, it);
    }
  }
  t->resizeColumnsToContents();
  v->addWidget(t, 1);
  // An edited cell changes the figure and shows what it came to; what cannot be read is put back.
  connect(t, &QTableWidget::itemChanged, this, [this, t, r, part, u](QTableWidgetItem* it) {
    if (it->column() == 0) return;
    Val val = Val(it->data(Qt::UserRole).toInt());
    int row = it->row();
    QString s = it->text().trimmed().replace(',', '.');
    bool ok = true;
    double x = s.isEmpty() && val == Val::Deg ? 0 : s.toDouble(&ok);
    auto shown = [&] {
      QSignalBlocker block(t);
      if (auto f = edit::figureOf(*doc_->board(), r, part)) it->setText(cellText(*f, row, val, u));
    };
    if (!ok || (val == Val::Len && x <= 0)) {
      shown();
      return;
    }
    editShape(r, part, tr("Изменить форму"), [&](Graphic& f) {
      Vec2 p = rowPoint(f, row);
      if (val == Val::X) p.x = fromUnit(x, u);
      if (val == Val::Y) p.y = -fromUnit(x, u);
      switch (val) {
        case Val::X:
        case Val::Y:
          switch (f.kind) {
            case GraphicKind::Line: (row == 0 ? f.a : f.b) = p; break;
            case GraphicKind::Arc: {
              // The arc keeps its angle.
              double deg = arcAngle(f.a, f.m, f.b);
              (row == 0 ? f.a : f.b) = p;
              f.m = arcMiddle(f.a, f.b, deg);
              break;
            }
            case GraphicKind::Circle: f.b += p - f.a; f.a = p; break;
            case GraphicKind::Rect: (row == 0 ? f.a : f.b) = p; break;
            case GraphicKind::Poly: f.pts[row] = p; break;
          }
          break;
        case Val::Len: f.b = f.a + Vec2{fromUnit(x, u), 0}; break;
        case Val::Deg:
          if (f.kind == GraphicKind::Arc) {
            if (x == 0) f.kind = GraphicKind::Line;
            else f.m = arcMiddle(f.a, f.b, x);
          } else if (f.kind == GraphicKind::Poly) {
            f.arcs.resize(f.pts.size(), 0);
            f.arcs[row] = std::clamp(x, -359.0, 359.0);
            if (!f.hasArcs()) f.arcs.clear();
          }
          break;
        case Val::None: break;
      }
    });
    shown();
  });
  if (poly) {
    // «Добавить»: a vertex in the middle of the side from the current one (on its arc); «Удалить»: the current one.
    auto* buttons = new QHBoxLayout;
    auto* add = new QPushButton(tr("Добавить"));
    auto* del = new QPushButton(tr("Удалить"));
    add->setObjectName("addVertex");
    del->setObjectName("deleteVertex");
    buttons->addWidget(add);
    buttons->addWidget(del);
    buttons->addStretch(1);
    v->addLayout(buttons);
    del->setEnabled(g.pts.size() > 3);
    connect(add, &QPushButton::clicked, this, [this, t, r, part] {
      int row = t->currentRow();
      editShape(r, part, tr("Добавить вершину"), [&](Graphic& f) {
        int n = int(f.pts.size());
        int k = row >= 0 && row < n ? row : n - 1;
        Vec2 p = f.pts[k], q = f.pts[(k + 1) % n];
        double deg = f.arcOf(k);
        f.pts.insert(f.pts.begin() + k + 1, deg != 0 ? arcMiddle(p, q, deg) : (p + q) * 0.5);
        if (!f.arcs.empty()) {
          f.arcs.resize(n, 0);
          f.arcs[k] = deg / 2;  // an arc splits into two halves
          f.arcs.insert(f.arcs.begin() + k + 1, deg / 2);
        }
      });
      QMetaObject::invokeMethod(this, &PropertiesPanel::rebuild, Qt::QueuedConnection);  // not from the button itself
    });
    connect(del, &QPushButton::clicked, this, [this, t, r, part] {
      int row = t->currentRow();
      if (row < 0) return;
      editShape(r, part, tr("Удалить вершину"), [&](Graphic& f) {
        if (f.pts.size() <= 3 || row >= int(f.pts.size())) return;
        f.pts.erase(f.pts.begin() + row);
        if (!f.arcs.empty()) {
          f.arcs.resize(f.pts.size() + 1, 0);
          f.arcs.erase(f.arcs.begin() + row);
        }
      });
      QMetaObject::invokeMethod(this, &PropertiesPanel::rebuild, Qt::QueuedConnection);
    });
  }
  return w;
}

QWidget* PropertiesPanel::componentPage(const std::vector<int>& comps) {
  const Board& b = *doc_->board();
  auto* tabs = new QTabWidget;
  auto* general = new QWidget;
  auto* f = new QFormLayout(general);
  f->addRow(title(comps.size() == 1 ? tr("Компонент %1").arg(QString::fromStdString(b.components[comps[0]].ref))
                                    : tr("Компоненты (%1)").arg(comps.size())));
  auto side = common<Side>(comps, [&](int c) { return b.components[c].side; });
  f->addRow(tr("Сторона:"), new QLabel(!side ? QString() : *side == Side::Bottom ? "Bottom" : "Top"));
  auto x = common<double>(comps, [&](int c) { return double(b.components[c].pos.x); });
  auto y = common<double>(comps, [&](int c) { return -double(b.components[c].pos.y); });
  f->addRow("x:", length(x, [this, comps](double v) {
              edit(tr("Переместить компонент"), [&](Board& bd) {
                for (int c : comps) bd.moveComponent(c, Point(Vec2{v, double(bd.components[c].pos.y)}));
              });
            }, -1));
  f->addRow("y:", length(y, [this, comps](double v) {
              edit(tr("Переместить компонент"), [&](Board& bd) {
                for (int c : comps) bd.moveComponent(c, Point(Vec2{double(bd.components[c].pos.x), -v}));
              });
            }, -1));
  auto* angle = new DoubleSpinBox;
  angle->setRange(-360, 360);
  angle->setSuffix("°");
  angle->setKeyboardTracking(false);
  if (auto a = common<double>(comps, [&](int c) { return b.components[c].angle; })) angle->setValue(*a);
  double start = angle->value();
  connect(angle, &QDoubleSpinBox::editingFinished, this, [this, angle, comps, start] {
    if (angle->value() == start) return;
    edit(tr("Повернуть"), [&](Board& bd) {
      for (int c : comps) bd.rotateComponent(c, angle->value() - bd.components[c].angle);
    });
  });
  f->addRow(tr("Угол:"), angle);
  auto* fixed = new QCheckBox;
  auto lock = common<bool>(comps, [&](int c) { return b.components[c].locked; });
  fixed->setTristate(!lock);
  fixed->setCheckState(!lock ? Qt::PartiallyChecked : *lock ? Qt::Checked : Qt::Unchecked);
  connect(fixed, &QCheckBox::clicked, this, [this, comps](bool on) {
    edit(on ? tr("Фиксировать") : tr("Расфиксировать"), [&](Board& bd) {
      for (int c : comps) bd.components[c].locked = on;
    });
  });
  f->addRow(tr("Фиксация:"), fixed);
  if (comps.size() == 1) {
    const Component& c = b.components[comps[0]];
    f->addRow(tr("Схемный компонент:"), new QLabel(QString::fromStdString(c.value)));
    f->addRow(tr("Посадочное место:"), new QLabel(QString::fromStdString(c.footprint)));
  }
  tabs->addTab(general, tr("Общие"));
  if (comps.size() == 1) {
    const Component& c = b.components[comps[0]];
    auto* pins = new QTableWidget(int(c.pads.size()), 3);
    pins->setHorizontalHeaderLabels({"#", tr("Имя"), tr("Цепь")});
    pins->verticalHeader()->hide();
    pins->setEditTriggers(QAbstractItemView::NoEditTriggers);
    pins->horizontalHeader()->setStretchLastSection(true);
    for (int i = 0; i < int(c.pads.size()); ++i) {
      const Pad& p = b.pads[c.pads[i]];
      pins->setItem(i, 0, new QTableWidgetItem(QString::number(i + 1)));
      pins->setItem(i, 1, new QTableWidgetItem(QString::fromStdString(p.number)));
      pins->setItem(i, 2, new QTableWidgetItem(p.net >= 0 ? QString::fromStdString(b.nets[p.net].name) : QString()));
    }
    tabs->addTab(pins, tr("Контакты"));
    auto* attrs = new QTableWidget(2, 2);
    attrs->setHorizontalHeaderLabels({tr("Имя"), tr("Значение")});
    attrs->verticalHeader()->hide();
    attrs->setEditTriggers(QAbstractItemView::NoEditTriggers);
    attrs->horizontalHeader()->setStretchLastSection(true);
    attrs->setItem(0, 0, new QTableWidgetItem("RefDes"));
    attrs->setItem(0, 1, new QTableWidgetItem(QString::fromStdString(c.ref)));
    attrs->setItem(1, 0, new QTableWidgetItem("PartName"));
    attrs->setItem(1, 1, new QTableWidgetItem(QString::fromStdString(c.value)));
    tabs->addTab(attrs, tr("Атрибуты"));
  }
  return tabs;
}

QWidget* PropertiesPanel::padPage(int pi) {
  const Board& b = *doc_->board();
  const Pad& p = b.pads[pi];
  Unit u = doc_->unit();
  auto len = [&](double nm) { return formatLength(nm, u, 3) + " " + unitName(u); };
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  QString owner = p.component >= 0 ? QString::fromStdString(b.components[p.component].ref) + "-" : QString();
  f->addRow(title(tr("Контакт %1%2").arg(owner, QString::fromStdString(p.number))));
  f->addRow(tr("Цепь:"), new QLabel(p.net >= 0 ? QString::fromStdString(b.nets[p.net].name) : tr("(без цепи)")));
  f->addRow(tr("Положение:"), new QLabel(QString("(%1; %2)").arg(len(p.pos.x), len(-double(p.pos.y)))));
  f->addRow(tr("Угол:"), new QLabel(QString("%1°").arg(p.angle)));
  f->addRow(tr("Размер:"), new QLabel(QString("%1 x %2").arg(len(p.shape.w), len(p.shape.h))));
  if (p.drill > 0) f->addRow(tr("Отверстие:"), new QLabel(len(p.drill)));
  // «Стек КП» and the way to its editor: the change applies to every pad of the stack and is undone in one step.
  if (p.padstack >= 0 && size_t(p.padstack) < b.padstacks.size()) {
    auto* row = new QWidget;
    auto* h = new QHBoxLayout(row);
    h->setContentsMargins(0, 0, 0, 0);
    h->addWidget(new QLabel(QString::fromStdString(b.padstacks[size_t(p.padstack)].name)), 1);
    auto* editStack = new QPushButton(tr("Изменить..."));
    h->addWidget(editStack);
    f->addRow(tr("Стек КП:"), row);
    int si = p.padstack;
    connect(editStack, &QPushButton::clicked, this, [this, si] {
      const Board& b = *doc_->board();
      std::vector<std::string> others;
      for (size_t k = 0; k < b.padstacks.size(); ++k)
        if (int(k) != si) others.push_back(b.padstacks[k].name);
      PadstackEditor dlg(b, b.padstacks[size_t(si)], doc_->unit(), others, false, this);
      connect(&dlg, &PadstackEditor::applied, this, [this, si](const Padstack& ps) {
        edit(tr("Изменить стек КП"), [&](Board& bd) {
          std::vector<Padstack> stacks = bd.padstacks;
          stacks[size_t(si)] = ps;
          std::vector<int> origin(stacks.size());
          for (size_t i = 0; i < origin.size(); ++i) origin[i] = int(i);
          setPadstacks(bd, std::move(stacks), origin);
        });
      });
      dlg.exec();
    });
  }
  return w;
}

QWidget* PropertiesPanel::wirePage(const std::vector<int>& tracks) {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(title(tracks.size() == 1 ? tr("Проводник") : tr("Участки проводников (%1)").arg(tracks.size())));
  auto net = common<int>(tracks, [&](int t) { return b.tracks[t].net; });
  f->addRow(tr("Цепь:"), new QLabel(net && *net >= 0 ? QString::fromStdString(b.nets[*net].name) : QString()));
  if (net && b.flexFixed(*net)) f->addRow(tr("Гибкая фиксация цепи:"), new QLabel(tr("включена")));
  double total = 0;
  for (int t : tracks) total += b.tracks[t].length();
  f->addRow(tr("Длина:"), new QLabel(formatLength(total, u, 3) + " " + unitName(u)));
  auto* layer = new QComboBox;
  auto cu = b.copperLayers();
  for (LayerId l : cu) layer->addItem(QString::fromStdString(b.layers[l].name), int(l));
  auto cl = common<LayerId>(tracks, [&](int t) { return b.tracks[t].layer; });
  layer->setCurrentIndex(cl ? layer->findData(int(*cl)) : -1);
  connect(layer, &QComboBox::activated, this, [this, layer, tracks](int i) {
    LayerId l = LayerId(layer->itemData(i).toInt());
    edit(tr("Изменить слой"), [&](Board& bd) {
      for (int t : tracks) bd.tracks[t].layer = l;
    });
  });
  f->addRow(tr("Слой:"), layer);
  f->addRow(tr("Ширина:"), length(common<double>(tracks, [&](int t) { return double(b.tracks[t].width); }),
                                  [this, tracks](double v) {
                                    edit(tr("Изменить ширину"), [&](Board& bd) {
                                      for (int t : tracks) bd.tracks[t].width = Coord(std::llround(v));
                                    });
                                  },
                                  1000));
  auto* fixed = new QCheckBox;
  auto lock = common<bool>(tracks, [&](int t) { return b.tracks[t].locked; });
  fixed->setTristate(!lock);
  fixed->setCheckState(!lock ? Qt::PartiallyChecked : *lock ? Qt::Checked : Qt::Unchecked);
  connect(fixed, &QCheckBox::clicked, this, [this, tracks](bool on) {
    edit(on ? tr("Фиксировать") : tr("Расфиксировать"), [&](Board& bd) {
      for (int t : tracks) bd.tracks[t].locked = on;
    });
  });
  f->addRow(tr("Фиксация:"), fixed);
  if (net && cl) {
    double clr = double(b.clearance(*net, *cl));
    f->addRow(tr("Зазор:"), new QLabel(formatLength(clr, u, 3) + " " + unitName(u)));
  }
  return w;
}

QWidget* PropertiesPanel::viaPage(const std::vector<int>& vias) {
  const Board& b = *doc_->board();
  Unit u = doc_->unit();
  auto* w = new QWidget;
  auto* f = new QFormLayout(w);
  f->addRow(title(vias.size() == 1 ? tr("Переход") : tr("Переходы (%1)").arg(vias.size())));
  auto net = common<int>(vias, [&](int v) { return b.vias[v].net; });
  f->addRow(tr("Цепь:"), new QLabel(net && *net >= 0 ? QString::fromStdString(b.nets[*net].name) : QString()));
  if (net && b.flexFixed(*net)) f->addRow(tr("Гибкая фиксация цепи:"), new QLabel(tr("включена")));
  if (vias.size() == 1) {
    const Via& v = b.vias[vias[0]];
    f->addRow("x:", length(double(v.pos.x), [this, vi = vias[0]](double x) {
                edit(tr("Переместить переход"), [&](Board& bd) { bd.vias[vi].pos.x = Coord(std::llround(x)); });
              }, -1));
    f->addRow("y:", length(-double(v.pos.y), [this, vi = vias[0]](double y) {
                edit(tr("Переместить переход"), [&](Board& bd) { bd.vias[vi].pos.y = Coord(std::llround(-y)); });
              }, -1));
    // «Диапазон слоев»: first to last copper layer the via spans.
    QStringList span;
    for (LayerId l : b.copperLayers())
      if ((v.layers >> l) & 1) span << QString::fromStdString(b.layers[l].name);
    f->addRow(tr("Диапазон слоев:"), new QLabel(span.isEmpty() ? QString() : span.front() + " – " + span.back()));
  }
  // The hole never exceeds the pad: one of them edited past the other takes it along, and its box shows it.
  auto size = [vias](const Board& bd, Coord Via::* m) {
    return common<double>(vias, [&](int v) { return double(bd.vias[v].*m); });
  };
  auto boxes = std::make_shared<std::pair<QDoubleSpinBox*, QDoubleSpinBox*>>();  // pad, hole
  auto resize = [this, vias, boxes, size, u](bool pad) {
    return [this, vias, boxes, size, u, pad](double d) {
      edit(tr("Изменить переход"), [&](Board& bd) {
        for (int v : vias) {
          Via& via = bd.vias[v];
          (pad ? via.diameter : via.drill) = Coord(std::llround(d));
          if (via.drill > via.diameter) (pad ? via.drill : via.diameter) = Coord(std::llround(d));
        }
      });
      showLength(pad ? boxes->second : boxes->first, size(*doc_->board(), pad ? &Via::drill : &Via::diameter), u);
    };
  };
  boxes->first = static_cast<QDoubleSpinBox*>(length(size(b, &Via::diameter), resize(true), 1000));
  boxes->second = static_cast<QDoubleSpinBox*>(length(size(b, &Via::drill), resize(false), 1000));
  f->addRow(tr("Площадка:"), boxes->first);
  f->addRow(tr("Отверстие:"), boxes->second);
  auto* fixed = new QCheckBox;
  auto lock = common<bool>(vias, [&](int v) { return b.vias[v].locked; });
  fixed->setTristate(!lock);
  fixed->setCheckState(!lock ? Qt::PartiallyChecked : *lock ? Qt::Checked : Qt::Unchecked);
  connect(fixed, &QCheckBox::clicked, this, [this, vias](bool on) {
    edit(on ? tr("Фиксировать") : tr("Расфиксировать"), [&](Board& bd) {
      for (int v : vias) bd.vias[v].locked = on;
    });
  });
  f->addRow(tr("Фиксация:"), fixed);
  return w;
}

QWidget* PropertiesPanel::zonePage(int zi) {
  const Board& b = *doc_->board();
  const Zone& z = b.zones[zi];
  auto* tabs = new QTabWidget;
  auto refill = [this, zi](Board& bd) {
    if (bd.zones[zi].filled.empty()) return;
    bd.zones[zi].filled.clear();
    ZoneFillOptions o;
    o.only = {zi};
    fillZones(bd, o);
  };

  auto* general = new QWidget;
  auto* f = new QFormLayout(general);
  f->addRow(title(tr("Область металлизации")));
  auto* net = new QComboBox;
  net->addItem(tr("(без цепи)"), kNoNet);
  for (int n = 0; n < int(b.nets.size()); ++n) net->addItem(QString::fromStdString(b.nets[n].name), n);
  net->setCurrentIndex(net->findData(z.net));
  connect(net, &QComboBox::activated, this, [this, net, zi, refill](int i) {
    edit(tr("Изменить цепь"), [&](Board& bd) {
      bd.zones[zi].net = net->itemData(i).toInt();
      refill(bd);
    });
  });
  f->addRow(tr("Цепь:"), net);
  auto* layer = new QComboBox;
  for (LayerId l : b.copperLayers()) layer->addItem(QString::fromStdString(b.layers[l].name), int(l));
  layer->setCurrentIndex(layer->findData(int(z.layer)));
  connect(layer, &QComboBox::activated, this, [this, layer, zi, refill](int i) {
    edit(tr("Изменить слой"), [&](Board& bd) {
      bd.zones[zi].layer = LayerId(layer->itemData(i).toInt());
      refill(bd);
    });
  });
  f->addRow(tr("Слой:"), layer);
  auto* state = new QComboBox;
  state->addItems({tr("Без заливки"), tr("Залита")});
  state->setCurrentIndex(z.filled.empty() ? 0 : 1);
  connect(state, &QComboBox::activated, this, [this, zi](int i) {
    edit(i ? tr("Залить") : tr("Удалить заливку"), [&](Board& bd) {
      bd.zones[zi].filled.clear();
      if (i) {
        ZoneFillOptions o;
        o.only = {zi};
        fillZones(bd, o);
      }
    });
  });
  f->addRow(tr("Состояние заливки:"), state);
  auto* prio = new QSpinBox;
  prio->setRange(0, 1000);
  prio->setValue(z.priority);
  prio->setKeyboardTracking(false);
  connect(prio, &QSpinBox::editingFinished, this, [this, prio, zi, refill] {
    if (prio->value() == doc_->board()->zones[zi].priority) return;
    edit(tr("Приоритет"), [&](Board& bd) {
      bd.zones[zi].priority = prio->value();
      refill(bd);
    });
  });
  f->addRow(tr("Приоритет:"), prio);
  tabs->addTab(general, tr("Общие"));

  auto* thermal = new QWidget;
  auto* t = new QFormLayout(thermal);
  auto* conn = new QComboBox;
  conn->addItems({tr("Термобарьер"), tr("Сплошное"), tr("Нет")});
  conn->setCurrentIndex(int(z.padConnection));
  connect(conn, &QComboBox::activated, this, [this, zi, refill](int i) {
    edit(tr("Подключение КП"), [&](Board& bd) {
      bd.zones[zi].padConnection = PadConnection(i);
      refill(bd);
    });
  });
  t->addRow(tr("Подключение КП/ПО:"), conn);
  auto zoneLength = [&](Coord Zone::* m, const QString& name) {
    double v = double(z.*m);
    return length(v > 0 ? std::optional<double>(v) : std::nullopt, [this, zi, m, name, refill](double nm) {
      edit(name, [&](Board& bd) {
        bd.zones[zi].*m = Coord(std::llround(nm));
        refill(bd);
      });
    });
  };
  t->addRow(tr("Зазор:"), zoneLength(&Zone::thermalGap, tr("Зазор термобарьера")));
  t->addRow(tr("Ширина спиц:"), zoneLength(&Zone::spokeWidth, tr("Ширина спиц")));
  auto* angle = new QComboBox;
  angle->addItems({"90°", "45°"});
  angle->setCurrentIndex(std::abs(z.spokeAngle - 45) < 1 ? 1 : 0);
  connect(angle, &QComboBox::activated, this, [this, zi, refill](int i) {
    edit(tr("Угол спиц"), [&](Board& bd) {
      bd.zones[zi].spokeAngle = i ? 45 : 0;
      refill(bd);
    });
  });
  t->addRow(tr("Угол спиц:"), angle);
  tabs->addTab(thermal, tr("Термобарьеры"));

  auto* fill = new QWidget;
  auto* fl = new QFormLayout(fill);
  fl->addRow(tr("Зазор:"), zoneLength(&Zone::clearance, tr("Зазор области")));
  fl->addRow(tr("Мин. ширина:"), zoneLength(&Zone::minWidth, tr("Минимальная ширина")));
  tabs->addTab(fill, tr("Заливка"));
  if (auto g = edit::figureOf(b, {ItemType::Zone, zi})) tabs->addTab(shapePage({ItemType::Zone, zi}, 0), shapeTitle(*g));
  return tabs;
}

}  // namespace xr::gui
