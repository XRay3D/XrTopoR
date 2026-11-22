#pragma once
// «Создание ECO-файла для обратной синхронизации» (Инструменты): the design against a base design — the file it
// came from, the schematic's state of it — as a P-CAD ECO file (io/eco/PcadEco.h). The base file is chosen (the
// design's own file as it is on the disk by default; the choice is remembered per design), the changes found
// are listed with ticks, the ticked ones are written.
#include <QDialog>

#include "gui/Document.h"
#include "io/eco/PcadEco.h"

class QLabel;
class QLineEdit;
class QListWidget;
class QPushButton;

namespace xr::gui {

class EcoDialog : public QDialog {
  Q_OBJECT
 public:
  explicit EcoDialog(Document* doc, QWidget* parent = nullptr);
  // The base design by its file: read and compared. False: not read (the reason is shown).
  bool setBase(const QString& file);
  void setOutput(const QString& file);
  QString output() const;
  const std::vector<io::EcoChange>& changes() const { return changes_; }
  // The ticked changes written to the output file. False: not written (the reason is shown).
  bool write();
  // A change as the list shows it.
  static QString describe(const io::EcoChange& c);

  static void run(Document* doc, QWidget* parent);

 private:
  void sync();
  Document* doc_;
  QLineEdit *base_, *out_;
  QListWidget* list_;
  QLabel *state_, *written_;
  QPushButton* create_;
  std::vector<io::EcoChange> changes_;
};

}  // namespace xr::gui
