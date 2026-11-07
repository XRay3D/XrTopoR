#include "gui/DisplayPanel.h"

#include <QButtonGroup>
#include <QCheckBox>
#include <QColorDialog>
#include <QComboBox>
#include <QDialog>
#include <QDialogButtonBox>
#include <QDoubleSpinBox>
#include <QGridLayout>
#include <QHBoxLayout>
#include <QInputDialog>
#include <QLabel>
#include <QLineEdit>
#include <QListWidget>
#include <QMenu>
#include <QMessageBox>
#include <QMouseEvent>
#include <QPainter>
#include <QPushButton>
#include <QRadioButton>
#include <QScrollArea>
#include <QSlider>
#include <QTabWidget>
#include <QToolButton>
#include <QVBoxLayout>

#include "gui/Schemes.h"
#include "gui/SpinBox.h"

namespace xr::gui {

namespace {

const QColor kHeader(0x9d, 0x8f, 0xbf);  // TopoR's lavender section headers

QColor rgb(uint32_t c) { return QColor::fromRgb(QRgb(c)); }
uint32_t rgb(const QColor& c) { return uint32_t(c.rgb() & 0xffffff); }

// Collapsible section with a lavender header: [▼] [☑] Title …extra widgets.
class Section : public QWidget {
 public:
  Section(const QString& title, QWidget* parent, bool collapsed = false) : QWidget(parent) {
    auto* v = new QVBoxLayout(this);
    v->setContentsMargins(0, 0, 0, 2);
    v->setSpacing(1);
    header_ = new QWidget(this);
    header_->setAutoFillBackground(true);
    QPalette pal = header_->palette();
    pal.setColor(QPalette::Window, kHeader);
    pal.setColor(QPalette::WindowText, Qt::white);
    pal.setColor(QPalette::Text, Qt::white);
    header_->setPalette(pal);
    head_ = new QHBoxLayout(header_);
    head_->setContentsMargins(2, 1, 4, 1);
    head_->setSpacing(4);
    arrow_ = new QToolButton(header_);
    arrow_->setAutoRaise(true);
    arrow_->setFixedSize(14, 14);
    head_->addWidget(arrow_);
    title_ = new QLabel(title, header_);
    QFont f = title_->font();
    f.setBold(true);
    title_->setFont(f);
    head_->addWidget(title_, 1);
    v->addWidget(header_);
    content_ = new QWidget(this);
    body_ = new QVBoxLayout(content_);
    body_->setContentsMargins(6, 0, 2, 0);
    body_->setSpacing(1);
    v->addWidget(content_);
    QObject::connect(arrow_, &QToolButton::clicked, this, [this] { setCollapsed(content_->isVisible()); });
    setCollapsed(collapsed);
  }
  QVBoxLayout* body() { return body_; }
  QLabel* title() { return title_; }
  // A checkbox in front of the title.
  QCheckBox* addCheck() {
    auto* c = new QCheckBox(header_);
    head_->insertWidget(1, c);
    return c;
  }
  void addRight(QWidget* w) { head_->addWidget(w); }
  void setCollapsed(bool c) {
    content_->setVisible(!c);
    arrow_->setArrowType(c ? Qt::RightArrow : Qt::DownArrow);
  }

 private:
  QWidget* header_;
  QHBoxLayout* head_;
  QToolButton* arrow_;
  QLabel* title_;
  QWidget* content_;
  QVBoxLayout* body_;
};

// Colour sample; a click opens the colour dialog.
class Swatch : public QToolButton {
 public:
  explicit Swatch(QWidget* parent) : QToolButton(parent) {
    setFixedSize(14, 14);
    setAutoRaise(true);
    setCursor(Qt::PointingHandCursor);
  }
  QColor color;

 protected:
  void paintEvent(QPaintEvent*) override {
    QPainter p(this);
    p.fillRect(rect().adjusted(1, 1, -1, -1), color);
    p.setPen(palette().color(QPalette::Mid));
    p.drawRect(rect().adjusted(1, 1, -2, -2));
  }
};

// Item of the selection filter: a flat toggle; the right button keeps only this one.
class FilterButton : public QToolButton {
 public:
  FilterButton(const QString& text, uint32_t bit, Document* doc, QWidget* parent)
      : QToolButton(parent), bit_(bit), doc_(doc) {
    setText(text);
    setToolTip(text);
    setCheckable(true);
    setToolButtonStyle(Qt::ToolButtonTextOnly);
    setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
    connect(this, &QToolButton::toggled, this, [this](bool on) {
      uint32_t f = doc_->selectionFilter();
      doc_->setSelectionFilter(on ? f | bit_ : f & ~bit_);
    });
    restyle();
  }

 protected:
  // A filter that is on: filled with the panel's violet, bold; off: no fill, a faint frame. The text keeps the
  // theme's colour either way.
  void restyle() {
    if (restyling_) return;
    restyling_ = true;
    // The parent's palette: the button's own is the style sheet's once it has one.
    QPalette pal = parentWidget() ? parentWidget()->palette() : palette();
    QColor text = pal.color(QPalette::WindowText), bg = pal.color(QPalette::Window);
    auto mix = [&](double k) {
      return QColor::fromRgbF(text.redF() * k + bg.redF() * (1 - k), text.greenF() * k + bg.greenF() * (1 - k),
                              text.blueF() * k + bg.blueF() * (1 - k));
    };
    setStyleSheet(QString("QToolButton { border: 1px solid %1; border-radius: 3px; padding: 3px 4px; background: transparent;"
                          " color: %2; }"
                          "QToolButton:hover { border-color: %3; }"
                          "QToolButton:checked { background: #7a68a8; border-color: #5b4b8a; font-weight: bold; }"
                          "QToolButton:checked:hover { background: #8a78b8; }")
                      .arg(mix(0.3).name(), text.name(), pal.color(QPalette::Highlight).name()));
    restyling_ = false;
  }
  void changeEvent(QEvent* e) override {
    if (e->type() == QEvent::PaletteChange || e->type() == QEvent::ParentChange) restyle();
    QToolButton::changeEvent(e);
  }

  void mousePressEvent(QMouseEvent* e) override {
    if (e->button() == Qt::RightButton) {
      doc_->setSelectionFilter(bit_);
      return;
    }
    QToolButton::mousePressEvent(e);
  }

 private:
  uint32_t bit_;
  Document* doc_;
  bool restyling_ = false;
};

QWidget* scrollPage(QWidget* content) {
  auto* sa = new QScrollArea;
  sa->setWidgetResizable(true);
  sa->setFrameShape(QFrame::NoFrame);
  sa->setWidget(content);
  return sa;
}

}  // namespace

DisplayPanel::DisplayPanel(Document* doc, QWidget* parent) : QWidget(parent), doc_(doc) {
  auto* v = new QVBoxLayout(this);
  v->setContentsMargins(2, 2, 2, 2);
  v->setSpacing(4);
  v->addWidget(selectionFilter());

  auto* title = new QLabel(tr("Управление видимостью"), this);
  title->setAlignment(Qt::AlignCenter);
  title->setAutoFillBackground(true);
  QPalette pal = title->palette();
  pal.setColor(QPalette::Window, QColor(0x77, 0x64, 0x95));
  pal.setColor(QPalette::WindowText, Qt::white);
  title->setPalette(pal);
  QFont f = title->font();
  f.setBold(true);
  title->setFont(f);
  title->setMinimumHeight(20);
  v->addWidget(title);

  tabs_ = new QTabWidget(this);
  tabs_->setDocumentMode(true);
  for (const QString& t : {tr("Слои"), tr("Объекты"), tr("Цепи"), tr("Настройки")}) {
    auto* page = new QWidget;
    auto* l = new QVBoxLayout(page);
    l->setContentsMargins(0, 0, 0, 0);
    tabPages_[tabs_->count()] = page;
    tabs_->addTab(page, t);
  }
  v->addWidget(tabs_, 1);
  v->addWidget(schemesBlock());

  connect(doc_, &Document::boardReplaced, this, &DisplayPanel::rebuild);
  connect(doc_, &Document::layersChanged, this, &DisplayPanel::refresh);
  connect(doc_, &Document::unitChanged, this, &DisplayPanel::refresh);
  rebuild();
}

// ---------------------------------------------------------------- bound controls

void DisplayPanel::edited() {
  if (updating_) return;
  modified_ = true;
  updating_ = true;
  doc_->displayChanged();
  updating_ = false;
  if (schemesTitle_) schemesTitle_->setText(tr("Схемы*"));
}

void DisplayPanel::refresh() {
  if (updating_ || !doc_->hasBoard()) return;
  updating_ = true;
  for (auto& r : refreshers_) r();
  updating_ = false;
}

QWidget* DisplayPanel::swatch(std::function<uint32_t()> get, std::function<void(uint32_t)> set) {
  auto* s = new Swatch(nullptr);
  auto read = [s, get] {
    s->color = rgb(get());
    s->update();
  };
  read();
  refreshers_.push_back(read);
  connect(s, &QToolButton::clicked, this, [this, s, set] {
    QColor c = QColorDialog::getColor(s->color, this, tr("Выбор цвета"));
    if (!c.isValid()) return;
    s->color = c;
    s->update();
    set(rgb(c));
    edited();
  });
  return s;
}

QWidget* DisplayPanel::boolRow(const QString& text, std::function<bool()> get, std::function<void(bool)> set) {
  auto* c = new QCheckBox(text);
  auto read = [c, get] { c->setChecked(get()); };
  read();
  refreshers_.push_back(read);
  connect(c, &QCheckBox::toggled, this, [this, set](bool on) {
    if (updating_) return;
    set(on);
    edited();
  });
  return c;
}

QWidget* DisplayPanel::flagRow(const QString& text, const std::string& flag, const std::string& colorKey, bool def) {
  auto* row = new QWidget;
  auto* h = new QHBoxLayout(row);
  h->setContentsMargins(0, 0, 0, 0);
  h->setSpacing(4);
  auto* check = boolRow({}, [this, flag, def] { return doc_->display().flag(flag, def); },
                        [this, flag](bool on) { doc_->display().show[flag] = on; });
  h->addWidget(check);
  if (!colorKey.empty())
    h->addWidget(swatch([this, colorKey] { return doc_->display().color(colorKey, 0xc0c0c0); },
                        [this, colorKey](uint32_t c) { doc_->display().colors[colorKey] = c; }));
  else h->addSpacing(18);
  auto* label = new QLabel(text);
  h->addWidget(label, 1);
  return row;
}

QWidget* DisplayPanel::colorRow(const QString& text, const std::string& colorKey) {
  auto* row = new QWidget;
  auto* h = new QHBoxLayout(row);
  h->setContentsMargins(0, 0, 0, 0);
  h->setSpacing(4);
  h->addSpacing(18);
  h->addWidget(swatch([this, colorKey] { return doc_->display().color(colorKey, 0); },
                      [this, colorKey](uint32_t c) { doc_->display().colors[colorKey] = c; }));
  h->addWidget(new QLabel(text), 1);
  return row;
}

// ---------------------------------------------------------------- selection filter

QWidget* DisplayPanel::selectionFilter() {
  auto* sec = new Section(tr("Фильтр выделения"), this);
  auto* grid = new QGridLayout;
  grid->setSpacing(2);
  struct Item {
    const char* text;
    uint32_t bit;
    int col, row;
  };
  // TopoR's three columns.
  const Item items[] = {{"Компоненты", SelComponents, 0, 0}, {"Контакты", SelPins, 0, 1},
                        {"Детали комп.", SelCompDetails, 0, 2}, {"Обл.металл.", SelCoppers, 1, 0},
                        {"Проводники", SelWires, 1, 1},         {"Переходы", SelVias, 1, 2},
                        {"Связи", SelNetlines, 1, 3},           {"Нарушения", SelViolations, 2, 0},
                        {"Надписи", SelTexts, 2, 1},            {"Запреты", SelKeepouts, 2, 2},
                        {"Контур платы", SelBoard, 2, 3},       {"Детали мех.", SelMechDetails, 2, 4}};
  std::vector<FilterButton*> buttons;
  for (auto& it : items) {
    auto* b = new FilterButton(tr(it.text), it.bit, doc_, this);
    b->setChecked(doc_->selectionFilter() & it.bit);
    grid->addWidget(b, it.row, it.col);
    buttons.push_back(b);
  }
  connect(doc_, &Document::selectionFilterChanged, this, [this, buttons, items] {
    for (size_t i = 0; i < buttons.size(); ++i) {
      QSignalBlocker block(buttons[i]);
      buttons[i]->setChecked(doc_->selectionFilter() & items[i].bit);
    }
  });
  sec->body()->addLayout(grid);
  auto* links = new QHBoxLayout;
  auto* all = new QPushButton(tr("Выбрать все"), this);
  auto* none = new QPushButton(tr("Снять все"), this);
  for (auto* b : {all, none}) b->setFlat(true);
  connect(all, &QPushButton::clicked, this, [this] { doc_->setSelectionFilter(SelAll); });
  connect(none, &QPushButton::clicked, this, [this] { doc_->setSelectionFilter(0); });
  links->addWidget(all);
  links->addWidget(none);
  sec->body()->addLayout(links);
  return sec;
}

// ---------------------------------------------------------------- tabs

void DisplayPanel::rebuild() {
  refreshers_.clear();
  for (QWidget* page : tabPages_) {
    QLayout* l = page->layout();
    while (QLayoutItem* it = l->takeAt(0)) {
      delete it->widget();
      delete it;
    }
  }
  setEnabled(doc_->hasBoard());
  fillSchemes();
  modified_ = false;
  if (schemesTitle_) schemesTitle_->setText(tr("Схемы"));
  if (!doc_->hasBoard()) return;
  tabPages_[0]->layout()->addWidget(scrollPage(layersTab()));
  tabPages_[1]->layout()->addWidget(scrollPage(objectsTab()));
  tabPages_[2]->layout()->addWidget(scrollPage(netsTab()));
  tabPages_[3]->layout()->addWidget(scrollPage(settingsTab()));
}

QWidget* DisplayPanel::layersTab() {
  const Board& b = *doc_->board();
  auto* page = new QWidget;
  auto* v = new QVBoxLayout(page);
  v->setContentsMargins(2, 4, 2, 2);
  v->setSpacing(2);
  v->addWidget(boolRow(tr("Только активный слой"), [this] { return doc_->display().flag("showActiveLayerOnly", false); },
                       [this](bool on) { doc_->display().show["showActiveLayerOnly"] = on; }));
  auto* cols = new QLabel(tr("КП П/Д"));
  cols->setAlignment(Qt::AlignRight);
  v->addWidget(cols);

  struct Group {
    const char* title;
    int id;
    const char* show;
    const char* pads;     // group-level «КП» flag
    const char* details;  // group-level «П/Д» flag
  };
  const Group groups[] = {{"Верхние механические", 0, "showTopMechLayers", "showTopMechPads", "showTopMechDetails"},
                          {"Металлические", 1, "showSignalLayers", "showMetalPads", "showWires"},
                          {"Нижние механические", 2, "showBotMechLayers", "showBotMechPads", "showBotMechDetails"},
                          {"Документирующие", 3, "showDocLayers", nullptr, nullptr}};
  auto cu = b.copperLayers();
  for (auto& g : groups) {
    auto* sec = new Section(tr(g.title), page);
    QCheckBox* show = sec->addCheck();
    std::string key = g.show;
    bool def = g.id != 3;
    auto readShow = [this, show, key, def] { show->setChecked(doc_->display().flag(key, def)); };
    readShow();
    refreshers_.push_back(readShow);
    connect(show, &QCheckBox::toggled, this, [this, key](bool on) {
      if (updating_) return;
      doc_->display().show[key] = on;
      edited();
    });
    for (const char* flag : {g.pads, g.details}) {
      if (!flag) continue;
      std::string fk = flag;
      auto* c = new QCheckBox;
      auto read = [this, c, fk] { c->setChecked(doc_->display().flag(fk)); };
      read();
      refreshers_.push_back(read);
      connect(c, &QCheckBox::toggled, this, [this, fk](bool on) {
        if (updating_) return;
        doc_->display().show[fk] = on;
        edited();
      });
      sec->addRight(c);
    }
    for (LayerId l = 0; l < LayerId(b.layers.size()); ++l) {
      if (layerGroup(b, l) != g.id) continue;
      std::string name = b.layers[l].name;
      auto ld = [this, name] { return doc_->display().layer(name); };
      auto* row = new QWidget;
      row->setAutoFillBackground(true);
      auto* h = new QHBoxLayout(row);
      h->setContentsMargins(0, 0, 0, 0);
      h->setSpacing(4);
      h->addWidget(boolRow({}, [ld] { return ld() && ld()->visible; }, [ld](bool on) {
        if (auto* x = ld()) x->visible = on;
      }));
      h->addWidget(swatch([ld] { return ld() ? ld()->details : 0xc0c0c0u; }, [ld](uint32_t c) {
        if (auto* x = ld()) x->details = c;
      }));
      QString text = QString("%1 <i>(%2)</i>")
                         .arg(QString::fromStdString(name).toHtmlEscaped(), QString::fromStdString(layerTypeName(b, l)));
      if (b.layers[l].kind == LayerKind::Copper) {
        // TopoR's layer keys: 1 = top, 0 = bottom, 2… = inner layers.
        int idx = b.layers[l].copperIndex;
        int keyNum = idx == 0 ? 1 : idx == b.copperCount() - 1 ? 0 : idx + 1;
        if (keyNum <= 9) text += QString(" [%1]").arg(keyNum);
      }
      auto* label = new QLabel(text);
      label->setTextFormat(Qt::RichText);
      h->addWidget(label, 1);
      h->addWidget(boolRow({}, [ld] { return ld() && ld()->showPads; }, [ld](bool on) {
        if (auto* x = ld()) x->showPads = on;
      }));
      h->addWidget(boolRow({}, [ld] { return ld() && ld()->showDetails; }, [ld](bool on) {
        if (auto* x = ld()) x->showDetails = on;
      }));
      if (b.layers[l].kind == LayerKind::Copper) {
        // A click on a metal layer makes it active; the active one is highlighted.
        label->setCursor(Qt::PointingHandCursor);
        label->installEventFilter(this);
        label->setProperty("layer", int(l));
        auto mark = [this, row, l] {
          row->setBackgroundRole(doc_->activeLayer() == l ? QPalette::Highlight : QPalette::Window);
          row->setForegroundRole(doc_->activeLayer() == l ? QPalette::HighlightedText : QPalette::WindowText);
        };
        mark();
        refreshers_.push_back(mark);
      }
      sec->body()->addWidget(row);
    }
    v->addWidget(sec);
  }
  v->addStretch(1);
  return page;
}

QWidget* DisplayPanel::objectsTab() {
  auto* page = new QWidget;
  auto* v = new QVBoxLayout(page);
  v->setContentsMargins(2, 4, 2, 2);
  v->setSpacing(2);
  v->addWidget(flagRow(tr("Металлизация"), "showCoppers"));
  v->addWidget(flagRow(tr("Монтажные отверстия"), "showMountingHoles"));
  {
    auto* row = flagRow(tr("Связи"), "showNetLines", "netLines");
    auto* link = new QLabel(QString("<a href=\"#\">[%1]</a>").arg(tr("Фильтр")));
    connect(link, &QLabel::linkActivated, this, [this] { tabs_->setCurrentIndex(2); });
    auto readLink = [this, link] {
      link->setText(QString("<a href=\"#\">[%1]</a>")
                        .arg(doc_->display().filterNetlines ? tr("Фильтр (активен)") : tr("Фильтр")));
    };
    readLink();
    refreshers_.push_back(readLink);
    static_cast<QHBoxLayout*>(row->layout())->addWidget(link);
    v->addWidget(row);
  }
  auto group = [&](const QString& title, const std::string& flag, bool collapsed = false) {
    auto* sec = new Section(title, page, collapsed);
    QCheckBox* c = sec->addCheck();
    auto read = [this, c, flag] { c->setChecked(doc_->display().flag(flag)); };
    read();
    refreshers_.push_back(read);
    connect(c, &QCheckBox::toggled, this, [this, flag](bool on) {
      if (updating_) return;
      doc_->display().show[flag] = on;
      edited();
    });
    v->addWidget(sec);
    return sec->body();
  };
  auto* vias = group(tr("Переходы"), "showVias", true);
  vias->addWidget(flagRow(tr("Сквозные"), "throughVia", "clrThroughVias"));
  vias->addWidget(flagRow(tr("Скрытые"), "burriedVia", "clrBurriedVias"));
  vias->addWidget(flagRow(tr("Глухие"), "blindVia", "clrBlindVias"));
  vias->addWidget(flagRow(tr("Фиксированные (спец. цветом)"), "fixedVia", "clrFixedVias"));
  auto* comps = group(tr("Компоненты"), "showComponents");
  comps->addWidget(flagRow(tr("На верхней стороне"), "showCompTop"));
  comps->addWidget(flagRow(tr("На нижней стороне"), "showCompBot"));
  comps->addWidget(flagRow(tr("Позиционные обозначения"), "showCompsDes", "compsName"));
  comps->addWidget(flagRow(tr("Имена контактов"), "showPinsName", "pinsName"));
  comps->addWidget(flagRow(tr("Цепи контактов"), "showPinsNet", "pinsNet"));
  comps->addWidget(flagRow(tr("Габариты"), "showCompsBound", "compsBound", false));
  comps->addWidget(flagRow(tr("Сквозные контакты (спец. цветом)"), "throughPad", "clrThroughPads", false));
  auto* labels = group(tr("Ярлыки/Надписи"), "showTexts");
  labels->addWidget(flagRow(tr("Ref Des"), "showLabelRefDes"));
  labels->addWidget(flagRow(tr("Part Name"), "showLabelPartName"));
  labels->addWidget(flagRow(tr("Пользовательские"), "showLabelOther"));
  auto* keepouts = group(tr("Запреты"), "showKeepouts");
  keepouts->addWidget(flagRow(tr("Трассировка"), "showRouteKeepouts"));
  keepouts->addWidget(colorRow(tr("На всех слоях"), "keepoutWireAll"));
  keepouts->addWidget(flagRow(tr("Размещение компонентов"), "showPlaceKeepouts"));
  keepouts->addWidget(colorRow(tr("На обеих сторонах"), "keepoutPlaceBoth"));
  keepouts->addWidget(colorRow(tr("На верхней стороне"), "keepoutPlaceTop"));
  keepouts->addWidget(colorRow(tr("На нижней стороне"), "keepoutPlaceBot"));
  auto* viol = group(tr("Нарушения"), "showViolations");
  viol->addWidget(flagRow(tr("Уменьшение ном. зазора"), "showNarrow", "narrow", false));
  viol->addWidget(flagRow(tr("Уменьшение ширины проводника"), "showTrimmed", "trimmed"));
  viol->addWidget(flagRow(tr("Нарушение DRC"), "showDRCViolations", "drcViolation"));
  v->addStretch(1);
  return page;
}

QWidget* DisplayPanel::netsTab() {
  auto* page = new QWidget;
  auto* v = new QVBoxLayout(page);
  v->setContentsMargins(2, 4, 2, 2);
  v->setSpacing(2);

  // «Использовать особый цвет»
  auto* colorSec = new Section(tr("Использовать особый цвет"), page);
  QCheckBox* colorOn = colorSec->addCheck();
  auto readOn = [this, colorOn] { colorOn->setChecked(doc_->display().colorNets); };
  readOn();
  refreshers_.push_back(readOn);
  connect(colorOn, &QCheckBox::toggled, this, [this](bool on) {
    if (updating_) return;
    doc_->display().colorNets = on;
    edited();
  });
  auto* colorList = new QWidget;
  auto* colorRows = new QVBoxLayout(colorList);
  colorRows->setContentsMargins(0, 0, 0, 0);
  colorRows->setSpacing(1);
  colorSec->body()->addWidget(colorList);
  auto fillColors = [this, colorRows] {
    while (QLayoutItem* it = colorRows->takeAt(0)) {
      delete it->widget();
      delete it;
    }
    auto& list = doc_->display().netColors;
    for (size_t i = 0; i < list.size(); ++i) {
      auto* row = new QWidget;
      auto* h = new QHBoxLayout(row);
      h->setContentsMargins(0, 0, 0, 0);
      std::string net = list[i].net;
      auto find = [this, net]() -> NetColor* {
        for (auto& nc : doc_->display().netColors)
          if (nc.net == net) return &nc;
        return nullptr;
      };
      h->addWidget(swatch([find] { return find() ? find()->color : 0u; }, [find](uint32_t c) {
        if (auto* nc = find()) nc->color = c;
      }));
      h->addWidget(new QLabel(QString::fromStdString(net)), 1);
      auto* del = new QToolButton;
      del->setText("✕");
      del->setAutoRaise(true);
      connect(del, &QToolButton::clicked, this, [this, net] {
        std::erase_if(doc_->display().netColors, [&](const NetColor& nc) { return nc.net == net; });
        edited();
        rebuild();
        tabs_->setCurrentIndex(2);
      });
      h->addWidget(del);
      colorRows->addWidget(row);
    }
  };
  fillColors();
  auto* colorButtons = new QHBoxLayout;
  auto* add = new QPushButton(tr("+ Добавить"));
  auto* clear = new QPushButton(tr("Очистить ✕"));
  for (auto* b : {add, clear}) {
    b->setFlat(true);
    colorButtons->addWidget(b);
  }
  connect(add, &QPushButton::clicked, this, [this] { addNets(false); });
  connect(clear, &QPushButton::clicked, this, [this] {
    doc_->display().netColors.clear();
    edited();
    rebuild();
    tabs_->setCurrentIndex(2);
  });
  colorSec->body()->addLayout(colorButtons);
  auto* forSec = new Section(tr("Использовать цвет для:"), colorSec, true);
  auto bind = [this](bool DisplayControl::* m) {
    return std::pair{std::function<bool()>([this, m] { return doc_->display().*m; }),
                     std::function<void(bool)>([this, m](bool on) { doc_->display().*m = on; })};
  };
  for (auto [text, member] : {std::pair{tr("Проводник"), &DisplayControl::colorizeWire},
                              std::pair{tr("Переход"), &DisplayControl::colorizeVia},
                              std::pair{tr("Контакт"), &DisplayControl::colorizePad},
                              std::pair{tr("Связь"), &DisplayControl::colorizeNetline},
                              std::pair{tr("Область металлизации"), &DisplayControl::colorizeCopper}}) {
    auto [get, set] = bind(member);
    forSec->body()->addWidget(boolRow(text, get, set));
  }
  colorSec->body()->addWidget(forSec);
  v->addWidget(colorSec);

  // «Показывать / Скрывать связи цепей»
  auto* lineSec = new Section(tr("Показывать связи цепей"), page);
  QCheckBox* lineOn = lineSec->addCheck();
  auto readLines = [this, lineOn, lineSec] {
    lineOn->setChecked(doc_->display().filterNetlines);
    lineSec->title()->setText(doc_->display().hideFilteredNetlines ? tr("Скрывать связи цепей") : tr("Показывать связи цепей"));
  };
  readLines();
  refreshers_.push_back(readLines);
  connect(lineOn, &QCheckBox::toggled, this, [this](bool on) {
    if (updating_) return;
    doc_->display().filterNetlines = on;
    edited();
  });
  auto* mode = new QToolButton;
  mode->setArrowType(Qt::DownArrow);
  mode->setAutoRaise(true);
  mode->setPopupMode(QToolButton::InstantPopup);
  auto* modeMenu = new QMenu(mode);
  modeMenu->addAction(tr("Показывать связи"), this, [this] {
    doc_->display().hideFilteredNetlines = false;
    edited();
  });
  modeMenu->addAction(tr("Скрывать связи"), this, [this] {
    doc_->display().hideFilteredNetlines = true;
    edited();
  });
  mode->setMenu(modeMenu);
  lineSec->addRight(mode);
  auto& nets = doc_->display().netlineNets;
  if (nets.empty()) {
    auto* hint = new QLabel(tr("<i>Добавьте в список группы, цепи или сигналы, для которых будут отображаться "
                               "неразведённые связи</i>"));
    hint->setWordWrap(true);
    hint->setForegroundRole(QPalette::PlaceholderText);
    lineSec->body()->addWidget(hint);
  }
  for (const std::string& net : nets) {
    auto* row = new QWidget;
    auto* h = new QHBoxLayout(row);
    h->setContentsMargins(0, 0, 0, 0);
    h->addWidget(new QLabel(QString::fromStdString(net)), 1);
    auto* del = new QToolButton;
    del->setText("✕");
    del->setAutoRaise(true);
    connect(del, &QToolButton::clicked, this, [this, net] {
      std::erase(doc_->display().netlineNets, net);
      edited();
      rebuild();
      tabs_->setCurrentIndex(2);
    });
    h->addWidget(del);
    lineSec->body()->addWidget(row);
  }
  auto* lineButtons = new QHBoxLayout;
  auto* addLine = new QPushButton(tr("+ Добавить"));
  auto* clearLine = new QPushButton(tr("Очистить ✕"));
  for (auto* b : {addLine, clearLine}) {
    b->setFlat(true);
    lineButtons->addWidget(b);
  }
  connect(addLine, &QPushButton::clicked, this, [this] { addNets(true); });
  connect(clearLine, &QPushButton::clicked, this, [this] {
    doc_->display().netlineNets.clear();
    edited();
    rebuild();
    tabs_->setCurrentIndex(2);
  });
  lineSec->body()->addLayout(lineButtons);
  v->addWidget(lineSec);
  v->addStretch(1);
  return page;
}

void DisplayPanel::addNets(bool netlineFilter) {
  const Board& b = *doc_->board();
  QDialog dlg(this);
  dlg.setWindowTitle(netlineFilter ? tr("Связи цепей") : tr("Особый цвет цепей"));
  auto* v = new QVBoxLayout(&dlg);
  auto* filter = new QLineEdit(&dlg);
  filter->setPlaceholderText(tr("Фильтр"));
  auto* list = new QListWidget(&dlg);
  list->setSelectionMode(QAbstractItemView::ExtendedSelection);
  for (auto& n : b.nets) list->addItem(QString::fromStdString(n.name));
  list->sortItems();
  connect(filter, &QLineEdit::textChanged, list, [list](const QString& t) {
    for (int i = 0; i < list->count(); ++i) list->item(i)->setHidden(!list->item(i)->text().contains(t, Qt::CaseInsensitive));
  });
  auto* box = new QDialogButtonBox(QDialogButtonBox::Ok | QDialogButtonBox::Cancel, &dlg);
  connect(box, &QDialogButtonBox::accepted, &dlg, &QDialog::accept);
  connect(box, &QDialogButtonBox::rejected, &dlg, &QDialog::reject);
  connect(list, &QListWidget::itemDoubleClicked, &dlg, &QDialog::accept);
  v->addWidget(filter);
  v->addWidget(list);
  v->addWidget(box);
  dlg.resize(320, 480);
  if (dlg.exec() != QDialog::Accepted) return;
  DisplayControl& d = doc_->display();
  // New special colours cycle through distinct hues.
  static const uint32_t palette[] = {0xff0000, 0x00c0ff, 0xffd800, 0xff00ff, 0x00ff60, 0xff8000, 0x8080ff, 0xffffff};
  for (auto* it : list->selectedItems()) {
    std::string name = it->text().toStdString();
    if (netlineFilter) {
      if (!std::ranges::contains(d.netlineNets, name)) d.netlineNets.push_back(name);
    } else if (std::ranges::none_of(d.netColors, [&](const NetColor& nc) { return nc.net == name; })) {
      d.netColors.push_back({name, palette[d.netColors.size() % std::size(palette)]});
    }
  }
  if (netlineFilter) d.filterNetlines = true;
  edited();
  rebuild();
  tabs_->setCurrentIndex(2);
}

QWidget* DisplayPanel::settingsTab() {
  auto* page = new QWidget;
  auto* v = new QVBoxLayout(page);
  v->setContentsMargins(2, 4, 2, 2);
  v->setSpacing(2);

  auto* general = new Section(tr("Общие"), page);
  general->body()->addWidget(colorRow(tr("Фон"), "background"));
  general->body()->addWidget(flagRow(tr("Контур платы"), "showBoardOutline", "board"));
  general->body()->addWidget(flagRow(tr("Проводники тонкими линиями"), "showThinWires", {}, false));
  general->body()->addWidget(flagRow(tr("Области змеек"), "showSerpentArea"));
  v->addWidget(general);

  auto* bright = new Section(tr("Яркость"), page);
  auto slider = [&](const QString& text, int DisplayControl::* m) {
    bright->body()->addWidget(new QLabel(text));
    auto* row = new QHBoxLayout;
    auto* s = new QSlider(Qt::Horizontal);
    s->setRange(0, 100);
    auto* pct = new QLabel;
    pct->setMinimumWidth(36);
    auto read = [this, s, pct, m] {
      s->setValue(doc_->display().*m);
      pct->setText(QString("%1%").arg(doc_->display().*m));
    };
    read();
    refreshers_.push_back(read);
    connect(s, &QSlider::valueChanged, this, [this, pct, m](int value) {
      pct->setText(QString("%1%").arg(value));
      if (updating_) return;
      doc_->display().*m = value;
      edited();
    });
    row->addWidget(s, 1);
    row->addWidget(pct);
    bright->body()->addLayout(row);
  };
  slider(tr("Выделенные объекты"), &DisplayControl::hilightRate);
  slider(tr("Затемнение объектов"), &DisplayControl::darkRate);
  v->addWidget(bright);

  auto* units = new Section(tr("Единицы измерения"), page);
  auto* metric = new QRadioButton(tr("Метрические"));
  auto* imperial = new QRadioButton(tr("Английские"));
  auto readUnits = [this, metric, imperial] {
    metric->setChecked(doc_->unit() == Unit::Mm);
    imperial->setChecked(doc_->unit() == Unit::Mil);
  };
  readUnits();
  refreshers_.push_back(readUnits);
  connect(metric, &QRadioButton::toggled, this, [this](bool on) {
    if (on && !updating_) doc_->setUnit(Unit::Mm);
  });
  connect(imperial, &QRadioButton::toggled, this, [this](bool on) {
    if (on && !updating_) doc_->setUnit(Unit::Mil);
  });
  units->body()->addWidget(metric);
  units->body()->addWidget(imperial);
  v->addWidget(units);

  auto* grid = new Section(tr("Выравнивание/Сетка"), page);
  {
    auto* row = new QWidget;
    auto* h = new QHBoxLayout(row);
    h->setContentsMargins(0, 0, 0, 0);
    h->setSpacing(4);
    h->addWidget(boolRow({}, [this] { return doc_->display().gridShow; }, [this](bool on) { doc_->display().gridShow = on; }));
    h->addWidget(swatch([this] { return doc_->display().gridColor; }, [this](uint32_t c) { doc_->display().gridColor = c; }));
    h->addWidget(new QLabel(tr("Сетка")), 1);
    grid->body()->addWidget(row);
  }
  grid->body()->addWidget(boolRow(tr("Сохранять пропорции"), [this] { return doc_->display().saveProportion; },
                                  [this](bool on) { doc_->display().saveProportion = on; }));
  // The two step boxes show each other's change: with «Сохранять пропорции» one step edited scales the other.
  auto readSteps = std::make_shared<std::vector<std::function<void()>>>();
  auto step = [&](const QString& symbol, double DisplayControl::* m) {
    auto* row = new QHBoxLayout;
    row->addWidget(new QLabel(symbol));
    auto* spin = new DoubleSpinBox;
    spin->setDecimals(4);
    spin->setRange(0.0001, 100000);
    spin->setKeyboardTracking(false);  // Enter takes the step, as in TopoR, not every digit typed
    auto read = [this, spin, m] {
      Unit u = doc_->unit();
      spin->setSuffix(" " + unitName(u));
      spin->setValue(toUnit(doc_->display().*m, u));
    };
    read();
    refreshers_.push_back(read);
    readSteps->push_back(read);
    connect(spin, &QDoubleSpinBox::valueChanged, this, [this, m, readSteps](double value) {
      if (updating_) return;
      DisplayControl& d = doc_->display();
      double nm = fromUnit(value, doc_->unit());
      // «Сохранять пропорции»: both steps follow.
      if (d.saveProportion && d.*m > 0) {
        double k = nm / (d.*m);
        d.gridX *= k;
        d.gridY *= k;
      } else {
        d.*m = nm;
      }
      edited();
      updating_ = true;
      for (auto& r : *readSteps) r();
      updating_ = false;
    });
    row->addWidget(spin, 1);
    grid->body()->addLayout(row);
  };
  step(QString::fromUtf8("↔"), &DisplayControl::gridX);
  step(QString::fromUtf8("↕"), &DisplayControl::gridY);
  {
    auto* row = new QHBoxLayout;
    row->addWidget(new QLabel(tr("Тип")));
    auto* kind = new QComboBox;
    kind->addItems({tr("Точки"), tr("Линии")});
    auto read = [this, kind] { kind->setCurrentIndex(doc_->display().gridDots ? 0 : 1); };
    read();
    refreshers_.push_back(read);
    connect(kind, &QComboBox::currentIndexChanged, this, [this](int i) {
      if (updating_) return;
      doc_->display().gridDots = i == 0;
      edited();
    });
    row->addWidget(kind, 1);
    grid->body()->addLayout(row);
  }
  grid->body()->addWidget(boolRow(tr("Привязка к сетке"), [this] { return doc_->display().alignToGrid; },
                                  [this](bool on) { doc_->display().alignToGrid = on; }));
  grid->body()->addWidget(boolRow(tr("Привязка к углу"), [this] { return doc_->display().snapToAngle; },
                                  [this](bool on) { doc_->display().snapToAngle = on; }));
  v->addWidget(grid);
  v->addStretch(1);
  return page;
}

bool DisplayPanel::eventFilter(QObject* o, QEvent* e) {
  if (e->type() == QEvent::MouseButtonPress)
    if (QVariant l = o->property("layer"); l.isValid()) {
      doc_->setActiveLayer(LayerId(l.toInt()));
      return true;
    }
  return QWidget::eventFilter(o, e);
}

// ---------------------------------------------------------------- schemes

QWidget* DisplayPanel::schemesBlock() {
  auto* sec = new Section(tr("Схемы"), this);
  schemesTitle_ = sec->title();
  auto row = [&](const QString& tip, QComboBox*& combo, bool color) {
    auto* h = new QHBoxLayout;
    auto* icon = new QLabel(color ? QString::fromUtf8("🎨") : QString::fromUtf8("👁"));
    icon->setToolTip(tip);
    combo = new QComboBox;
    combo->setEditable(true);
    combo->setInsertPolicy(QComboBox::NoInsert);
    combo->setToolTip(tip);
    auto* save = new QToolButton;
    save->setIcon(QIcon(":/icons/save.svg"));
    save->setAutoRaise(true);
    save->setToolTip(tr("Сохранить схему"));
    auto* del = new QToolButton;
    del->setText("✕");
    del->setAutoRaise(true);
    del->setToolTip(tr("Удалить схему"));
    connect(save, &QToolButton::clicked, this, [this, color] { saveScheme(color); });
    connect(del, &QToolButton::clicked, this, [this, color, combo] {
      std::string name = combo->currentText().toStdString();
      if (color ? isBuiltinColorScheme(name) : isBuiltinViewScheme(name)) return;
      if (color) removeUserColorScheme(name);
      else removeUserViewScheme(name);
      fillSchemes();
    });
    connect(combo, &QComboBox::activated, this, [this, color](int i) {
      if (color) applyColorScheme(i);
      else applyViewScheme(i);
    });
    h->addWidget(icon);
    h->addWidget(combo, 1);
    h->addWidget(save);
    h->addWidget(del);
    sec->body()->addLayout(h);
  };
  row(tr("Цветовая схема"), colorCombo_, true);
  row(tr("Схема отображения"), viewCombo_, false);
  return sec;
}

void DisplayPanel::fillSchemes() {
  if (!colorCombo_) return;
  QSignalBlocker b1(colorCombo_), b2(viewCombo_);
  colorCombo_->clear();
  viewCombo_->clear();
  for (auto& s : allColorSchemes()) colorCombo_->addItem(QString::fromStdString(s.name));
  for (auto& s : allViewSchemes()) viewCombo_->addItem(QString::fromStdString(s.name));
  if (doc_->hasBoard()) {
    colorCombo_->setCurrentText(QString::fromStdString(doc_->display().colorScheme));
    viewCombo_->setCurrentText(QString::fromStdString(doc_->display().displayScheme));
  }
}

void DisplayPanel::applyColorScheme(int index) {
  auto all = allColorSchemes();
  if (!doc_->hasBoard() || index < 0 || index >= int(all.size())) return;
  gui::applyColorScheme(doc_->display(), *doc_->board(), all[size_t(index)]);
  modified_ = false;
  schemesTitle_->setText(tr("Схемы"));
  colorCombo_->setCurrentIndex(index);
  updating_ = true;
  doc_->displayChanged();
  updating_ = false;
  refresh();
}

void DisplayPanel::applyViewScheme(int index) {
  auto all = allViewSchemes();
  if (!doc_->hasBoard() || index < 0 || index >= int(all.size())) return;
  gui::applyViewScheme(doc_->display(), *doc_->board(), all[size_t(index)]);
  modified_ = false;
  schemesTitle_->setText(tr("Схемы"));
  viewCombo_->setCurrentIndex(index);
  updating_ = true;
  doc_->displayChanged();
  updating_ = false;
  refresh();
}

void DisplayPanel::saveScheme(bool color) {
  if (!doc_->hasBoard()) return;
  QComboBox* combo = color ? colorCombo_ : viewCombo_;
  QString name = combo->currentText().trimmed();
  bool builtin = color ? isBuiltinColorScheme(name.toStdString()) : isBuiltinViewScheme(name.toStdString());
  if (name.isEmpty() || builtin) {
    bool ok = false;
    name = QInputDialog::getText(this, tr("Сохранить схему"), tr("Имя схемы:"), QLineEdit::Normal,
                                 builtin ? name + tr(" (моя)") : name, &ok)
               .trimmed();
    if (!ok || name.isEmpty()) return;
    if (color ? isBuiltinColorScheme(name.toStdString()) : isBuiltinViewScheme(name.toStdString())) {
      QMessageBox::warning(this, tr("Сохранить схему"), tr("Встроенную схему изменить нельзя."));
      return;
    }
  }
  DisplayControl& d = doc_->display();
  if (color) {
    saveUserColorScheme(colorSchemeOf(d, *doc_->board(), name.toStdString()));
    d.colorScheme = name.toStdString();
  } else {
    saveUserViewScheme(viewSchemeOf(d, *doc_->board(), name.toStdString()));
    d.displayScheme = name.toStdString();
  }
  modified_ = false;
  schemesTitle_->setText(tr("Схемы"));
  fillSchemes();
}

}  // namespace xr::gui
