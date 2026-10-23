#pragma once
// «Настройки программы», as in TopoR: tab «Общие» (start-up, default schemes for imported designs,
// import of an installed TopoR's settings, reset) and tab «Горячие клавиши» (commands by group, their
// keys, conflicts, defaults).
#include <QDialog>
#include <QHash>
#include <QKeySequence>

#include "gui/Commands.h"

class QCheckBox;
class QComboBox;
class QKeySequenceEdit;
class QLineEdit;
class QTreeWidget;
class QTreeWidgetItem;

namespace xr::gui {

class ProgramSettingsDialog : public QDialog {
  Q_OBJECT
 public:
  ProgramSettingsDialog(Commands* cmds, QWidget* parent = nullptr);

 signals:
  void importToporRequested(const QString& cfg);
  void resetRequested();

 private:
  void fillKeys();
  void assign(const QKeySequence& k);
  bool applyAndClose();
  QString keysText(const QString& id) const;

  Commands* cmds_;
  QHash<QString, QList<QKeySequence>> keys_;  // working copy
  QCheckBox* openLast_;
  QComboBox* colorScheme_;
  QComboBox* viewScheme_;
  QLineEdit* search_;
  QTreeWidget* tree_;
  QKeySequenceEdit* edit_;
};

}  // namespace xr::gui
