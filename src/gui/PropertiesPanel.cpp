#include "gui/PropertiesPanel.h"

#include <QCheckBox>
#include <QComboBox>
#include <QDoubleSpinBox>
#include <QFormLayout>
#include <QHeaderView>
#include <QLabel>
#include <QScrollArea>
#include <QSpinBox>
#include <QTabWidget>
#include <QTableWidget>
#include <QVBoxLayout>

#include "core/ZoneFill.h"

namespace xr::gui {

namespace {

double trackLength(const Track& t) {
  return t.isArc() ? ArcGeom::fromThreePoints(t.a.v(), t.mid->v(), t.b.v()).length() : (t.b.v() - t.a.v()).len();
}

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

QWidget* PropertiesPanel::length(std::optional<double> nm, std::function<void(double)> set, double min) {
  Unit u = doc_->unit();
  auto* s = new QDoubleSpinBox;
  s->setDecimals(u == Unit::Mil ? 2 : 4);
  s->setRange(toUnit(min, u), 1e6);
  if (min < 0) s->setRange(-1e6, 1e6);
  s->setSuffix(" " + unitName(u));
  s->setKeyboardTracking(false);
  if (nm) s->setValue(toUnit(*nm, u));
  else s->setSpecialValueText(" "), s->setValue(s->minimum());
  double start = s->value();
  connect(s, &QDoubleSpinBox::editingFinished, this, [s, set, u, start] {
    if (s->value() != start) set(fromUnit(s->value(), u));
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
    std::vector<int> tracks, vias, pads, zones;
    for (ItemRef r : items) {
      if (r.index < 0) continue;
      switch (r.type) {
        case ItemType::Track: tracks.push_back(r.index); break;
        case ItemType::Via: vias.push_back(r.index); break;
        case ItemType::Pad: pads.push_back(r.index); break;
        case ItemType::Zone: zones.push_back(r.index); break;
      }
    }
    int kinds = !tracks.empty() + !vias.empty() + !zones.empty() + !comps.empty() + (comps.empty() && !pads.empty());
    if (kinds == 0) page = message(tr("Нет выделенных объектов"));
    else if (kinds > 1) page = message(tr("Выделены объекты разных типов (%1)").arg(items.size() + comps.size()));
    else if (!comps.empty()) page = componentPage(comps);
    else if (!tracks.empty()) page = wirePage(tracks);
    else if (!vias.empty()) page = viaPage(vias);
    else if (!zones.empty()) page = zones.size() == 1 ? zonePage(zones[0]) : message(tr("Области металлизации (%1)").arg(zones.size()));
    else page = pads.size() == 1 ? padPage(pads[0]) : message(tr("Контакты (%1)").arg(pads.size()));
    (void)b;
  }
  area_->setWidget(page);
}

// ---------------------------------------------------------------- pages

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
  auto* angle = new QDoubleSpinBox;
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
  double total = 0;
  for (int t : tracks) total += trackLength(b.tracks[t]);
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
  f->addRow(tr("Площадка:"), length(common<double>(vias, [&](int v) { return double(b.vias[v].diameter); }),
                                    [this, vias](double d) {
                                      edit(tr("Изменить переход"), [&](Board& bd) {
                                        for (int v : vias) bd.vias[v].diameter = Coord(std::llround(d));
                                      });
                                    },
                                    1000));
  f->addRow(tr("Отверстие:"), length(common<double>(vias, [&](int v) { return double(b.vias[v].drill); }),
                                     [this, vias](double d) {
                                       edit(tr("Изменить переход"), [&](Board& bd) {
                                         for (int v : vias) bd.vias[v].drill = Coord(std::llround(d));
                                       });
                                     },
                                     1000));
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
  return tabs;
}

}  // namespace xr::gui
