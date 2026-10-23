#include "gui/Units.h"

#include <QObject>
#include <cmath>

namespace xr::gui {

Unit designUnit(const Board& b) {
  // Imperial designs (mil, inch) show in mils, everything else in millimetres.
  double u = b.designUnitNm;
  bool imperial = std::abs(u - kNmPerMil) < 1 || std::abs(u - 1000.0 * kNmPerMil) < 1;
  return imperial ? Unit::Mil : Unit::Mm;
}

QString unitName(Unit u) { return u == Unit::Mil ? QObject::tr("мил") : QObject::tr("мм"); }

double toUnit(double nm, Unit u) { return nm / (u == Unit::Mil ? double(kNmPerMil) : double(kNmPerMm)); }
double fromUnit(double v, Unit u) { return v * (u == Unit::Mil ? double(kNmPerMil) : double(kNmPerMm)); }

QString formatLength(double nm, Unit u, int decimals) {
  QString s = QString::number(toUnit(nm, u), 'f', decimals);
  if (s.contains('.')) {
    while (s.endsWith('0')) s.chop(1);
    if (s.endsWith('.')) s.chop(1);
  }
  return s == "-0" ? "0" : s;
}

}  // namespace xr::gui
