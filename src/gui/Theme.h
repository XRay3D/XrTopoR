#pragma once
#include <QColor>

#include "core/Board.h"

namespace xr::gui {

struct Theme {
  static QColor background() { return QColor(0x10, 0x14, 0x1a); }
  static QColor boardFill() { return QColor(0x1b, 0x24, 0x30); }
  static QColor outline() { return QColor(0xe8, 0xe0, 0xa0); }
  static QColor ratsnest() { return QColor(0xff, 0xff, 0xff, 0xa0); }
  static QColor selection() { return QColor(0xff, 0xff, 0x40); }
  static QColor highlight() { return QColor(0x40, 0xff, 0xff); }
  static QColor drcMarker() { return QColor(0xff, 0x30, 0x30); }
  static QColor drill() { return QColor(0x10, 0x14, 0x1a); }
  static QColor viaRing() { return QColor(0xb8, 0xb8, 0xb8); }
  static QColor layerColor(const Board& b, LayerId l);
};

}  // namespace xr::gui
