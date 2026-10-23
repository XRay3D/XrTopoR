#include "gui/Theme.h"

namespace xr::gui {

QColor Theme::layerColor(const Board& b, LayerId l) {
  static const QColor copper[] = {QColor(0xd3, 0x3a, 0x2c), QColor(0x2f, 0x6f, 0xd6), QColor(0xc9, 0xa2, 0x27),
                                  QColor(0x2a, 0xa8, 0x76), QColor(0x9b, 0x59, 0xb6), QColor(0xe6, 0x7e, 0x22),
                                  QColor(0x1a, 0xbc, 0x9c), QColor(0xe8, 0x4e, 0x8a)};
  const Layer& L = b.layers[l];
  switch (L.kind) {
    case LayerKind::Copper: return copper[L.copperIndex % 8];
    case LayerKind::Silk: return L.side == Side::Bottom ? QColor(0xc8, 0xb0, 0xe0) : QColor(0xe8, 0xe8, 0xe8);
    case LayerKind::Mask: return L.side == Side::Bottom ? QColor(0x60, 0x30, 0x80) : QColor(0x80, 0x20, 0x60);
    case LayerKind::Paste: return QColor(0x90, 0x90, 0x90);
    case LayerKind::Fab: return QColor(0x80, 0x80, 0x60);
    case LayerKind::Courtyard: return QColor(0xff, 0x40, 0xff);
    case LayerKind::Edge: return outline();
    default: return QColor(0x70, 0x70, 0x70);
  }
}

}  // namespace xr::gui
