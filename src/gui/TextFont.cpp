#include "gui/TextFont.h"

#include <QFontDatabase>
#include <QFontMetricsF>
#include <mutex>

namespace xr::gui {

QFont textFont(const TextStyle& st) {
  QString family = QString::fromStdString(st.font);
  QFont f(QFontDatabase::hasFamily(family) ? family : QStringLiteral("Sans"));
  f.setPixelSize(100);
  f.setBold(st.bold);
  f.setItalic(st.italic);
  return f;
}

void installTextMeasure() {
  static std::once_flag once;
  std::call_once(once, [] {
    setTextMeasure([](const TextStyle& st, std::string_view line) {
      static std::mutex m;  // the board's layout may be asked from worker threads
      std::lock_guard lock(m);
      QFontMetricsF fm(textFont(st));
      QString s = QString::fromUtf8(line.data(), qsizetype(line.size()));
      double k = double(st.height) / (fm.ascent() + fm.descent());  // nm per font pixel
      return TextExtent{fm.horizontalAdvance(s) * k, std::max(0.0, -fm.tightBoundingRect(s).top() - fm.capHeight()) * k};
    });
  });
}

}  // namespace xr::gui
