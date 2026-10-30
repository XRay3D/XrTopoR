#include "gui/Commands.h"

#include <QIcon>
#include <QMenu>
#include <QToolBar>
#include <QWidget>

namespace xr::gui {

namespace {

const QString kMain = QObject::tr("Общие");
const QString kAuto = QObject::tr("Автопроцедуры");
const QString kView = QObject::tr("Вид");
const QString kEdit = QObject::tr("Редактирование");
const QString kObject = QObject::tr("Действия с объектами");
const QString kSelect = QObject::tr("Выделение");
const QString kManRoute = QObject::tr("Ручная прокладка проводников");
const QString kLayer = QObject::tr("Выбор активного слоя");
const QString kVisScheme = QObject::tr("Схемы отображения");
const QString kColScheme = QObject::tr("Цветовые схемы");

QKeySequence key(const char* s) { return QKeySequence(QString::fromLatin1(s)); }
QKeySequence key(int k) { return QKeySequence(k); }
QKeySequence key(QKeyCombination k) { return QKeySequence(k); }

}  // namespace

Commands::Commands(QWidget* window) : QObject(window), window_(window) {
  // ---- Файл
  add("Cmd_NewProject", tr("&Создать проект..."), tr("Создать проект"), {}, {}, "new_project");
  add("Accel_FileOpen", tr("&Открыть..."), tr("Открыть файл"), kMain, {key("Ctrl+O")}, "open")
      ->setStatusTip(tr("Открыть существующий проект"));
  add("Cmd_OpenExamples", tr("Открыть &примеры..."), tr("Открыть примеры"), {});
  add("Cmd_CloseProject", tr("&Закрыть проект"), tr("Закрыть проект"), {});
  add("Accel_FileSave", tr("Со&хранить"), tr("Сохранить"), kMain, {key("Ctrl+S")}, "save")
      ->setStatusTip(tr("Сохранить документ"));
  add("Cmd_SaveAs", tr("Сохранить &как..."), tr("Сохранить как"), {});
  add("Cmd_ImportDesign", tr("&Импорт дизайна..."), tr("Импорт"), {}, {}, "import");
  add("Cmd_ImportSes", tr("Импорт &разводки (SES)..."), tr("Импорт разводки"), {});
  add("Cmd_ExportDesign", tr("&Экспорт дизайна..."), tr("Экспорт"), {}, {}, "export");
  add("Cmd_ExportDxf", tr("D&XF..."), tr("Экспорт DXF"), {});
  add("Cmd_ExportSvg", tr("&SVG..."), tr("Экспорт SVG"), {});
  add("Cmd_ExportBom", tr("&BOM..."), tr("Экспорт перечня элементов"), {});
  add("Cmd_Gerber", tr("&Gerber..."), tr("Файлы Gerber"), {});
  add("Cmd_Drill", tr("&Drill..."), tr("Файлы сверловки"), {});
  add("Accel_Print", tr("Пе&чать..."), tr("Печать документа"), kMain, {key("Ctrl+P")})
      ->setStatusTip(tr("Вывести активный документ на печать"));
  add("Cmd_Exit", tr("&Выход"), tr("Выход"), {});

  // ---- Правка
  add("Accel_Undo", tr("От&менить"), tr("Отменить"), kEdit, {key("Ctrl+Z"), key("Alt+Backspace")}, "undo")
      ->setStatusTip(tr("Отменить последнее действие"));
  add("Accel_Redo", tr("&Повторить"), tr("Повторить"), kEdit, {key("Ctrl+Y")}, "redo")
      ->setStatusTip(tr("Повторить отменённое действие"));
  add("Accel_Cut", tr("В&ырезать"), tr("Вырезать"), kEdit, {key("Ctrl+X"), key("Shift+Del")}, "cut")
      ->setStatusTip(tr("Удаление выделенных объектов в буфер обмена"));
  add("Accel_Copy", tr("&Копировать"), tr("Копировать"), kEdit, {key("Ctrl+C"), key("Ctrl+Ins")}, "copy")
      ->setStatusTip(tr("Копирование выделенных объектов в буфер обмена"));
  add("Accel_Duplicate", tr("&Дублировать"), tr("Дублировать"), kEdit, {key("Ctrl+D")})
      ->setStatusTip(tr("Копирование выделенных объектов и вставка в документ"));
  add("Accel_Paste", tr("В&ставить"), tr("Вставить"), kEdit, {key("Ctrl+V"), key("Shift+Ins")}, "paste")
      ->setStatusTip(tr("Вставка содержимого буфера обмена"));
  add("Accel_Delete", tr("&Удалить"), tr("Удалить"), kEdit, {key("Del")}, "delete")
      ->setStatusTip(tr("Удалить выделенные участки проводников и переходы"));
  add("Accel_SelAll", tr("Выд&елить всё"), tr("Выделить всё"), kSelect, {key("Ctrl+A")});
  add("Accel_SelInvert", tr("&Инвертировать выделение"), tr("Инвертировать выделенное"), kSelect);
  add("Accel_SelCyclic", tr("&Цикл. выделение (сегмент/проводник/цепь)"),
      tr("Циклическое выделение (сегмент/проводник/цепь)"), kSelect, {key("X")});
  add("Accel_Fix", tr("&Фиксировать"), tr("Фиксировать"), kObject, {key("F")}, "fix")
      ->setStatusTip(tr("Задать/отменить фиксацию выделенных компонентов, переходов и формы участков проводников"));
  add("Accel_Layer", tr("Изменить сло&й"), tr("Изменить слой"), kObject, {key("L")})
      ->setStatusTip(tr("Изменить слой выделенных участков проводников"));
  add("Accel_Width", tr("Изменить &ширину"), tr("Изменить ширину проводника"), kObject, {key("W")}, "width")
      ->setStatusTip(tr("Изменить ширину всех выделенных участков проводников"));
  add("Accel_Reduce", tr("Спр&ямить"), tr("Спрямить"), kObject, {key("C")}, "reduce")
      ->setStatusTip(tr("Заменить выделенные участки проводников прямолинейными сегментами"));
  add("Accel_Serpent", tr("П&реобразовать в змейку"), tr("Преобразовать в змейку"), kObject, {}, "serpent")
      ->setStatusTip(tr("Преобразовать сегмент проводника в змейку"));
  add("Accel_Pour", tr("&Залить"), tr("Изменить заливку выделенных областей металлизации"), kObject, {key("Z")});
  add("Accel_UnPourWithRestore", tr("Удалит&ь заливку и восстановить проводники"),
      tr("Удалить заливку и восстановить проводники"), kObject);
  add("Cmd_RePour", tr("Перез&алить"), tr("Перезалить выделенные области металлизации"), {});
  add("Accel_RotateLeft", tr("Повернуть на &90°"), tr("Повернуть на 90°"), kObject, {key("Shift+Space")})
      ->setStatusTip(tr("Повернуть выделенный фрагмент на 90° против часовой стрелки"));
  add("Accel_RotateRight", tr("Повернуть &-90°"), tr("Повернуть на -90°"), kObject, {key("Space")})
      ->setStatusTip(tr("Повернуть выделенный фрагмент на -90° против часовой стрелки"));
  add("Cmd_RotateAngle", tr("Повернуть на у&гол..."), tr("Повернуть на угол"), {});
  add("Accel_FlipHorizontally", tr("Перевернуть &горизонтально"), tr("Перевернуть горизонтально"), kObject, {key("S")})
      ->setStatusTip(tr("Перевернуть выделенный фрагмент относительно вертикальной оси"));
  add("Accel_FlipVertically", tr("Перевернуть &вертикально"), tr("Перевернуть вертикально"), kObject, {key("Y")})
      ->setStatusTip(tr("Перевернуть выделенный фрагмент относительно горизонтальной оси"));
  add("Accel_Unlink", tr("&Отсоединить"), tr("Отсоединить"), kObject, {key("U")})
      ->setStatusTip(tr("Отсоединить выделенный фрагмент от инцидентных ему проводников"));
  add("Accel_ChangeNet", tr("Изменить цепь"), tr("Изменить цепь"), kObject, {key("Shift+N")})
      ->setStatusTip(tr("Изменить цепь выделенных объектов"));
  add("Accel_ZipWire", tr("Зас&тегнуть проводники"), tr("Застегнуть проводники"), kObject, {}, "zip")
      ->setStatusTip(tr("Объединить проводники дифференциальных цепей"));
  add("Accel_UnZipWire", tr("Рассте&гнуть проводники"), tr("Расстегнуть проводники"), kObject, {}, "unzip")
      ->setStatusTip(tr("Разделить застегнутый проводник"));
  add("Cmd_FlexFix", tr("Гибкая фиксация цепи"), tr("Гибкая фиксация цепи"), {}, {}, "flexfix");

  // ---- Вид
  add("Accel_ViewProject", tr("&Проект"), tr("Окно проекта"), kMain, {key("Ctrl+Q")})
      ->setStatusTip(tr("Показать/скрыть окно проекта"));
  add("Accel_ViewOutput", tr("&Сообщения"), tr("Окно сообщений"), kMain, {key("Alt+Q")})
      ->setStatusTip(tr("Показать/скрыть окно сообщений"));
  add("Accel_ViewSearch", tr("П&оиск"), tr("Окно поиска"), kMain, {key("Ctrl+F")});
  add("Accel_ViewDispCtrl", tr("&Управление отображением"), tr("Управление отображением"), kMain, {key("Alt+D")})
      ->setStatusTip(tr("Показать/скрыть окно управления отображением"));
  add("Accel_ViewPropertyBar", tr("С&войства"), tr("Окно свойств"), kMain, {key("Alt+Return")})
      ->setStatusTip(tr("Показать/скрыть окно свойств"));
  add("Accel_ZoomIn", tr("&Увеличить"), tr("Увеличить"), kView, {key(Qt::KeypadModifier | Qt::Key_Plus)})
      ->setStatusTip(tr("Увеличить изображение"));
  add("Accel_ZoomOut", tr("У&меньшить"), tr("Уменьшить"), kView, {key(Qt::KeypadModifier | Qt::Key_Minus)})
      ->setStatusTip(tr("Уменьшить изображение"));
  add("Accel_ZoomBoard", tr("Показать &плату"), tr("Показать плату"), kView, {key("Ctrl+B")}, "zoom_board");
  add("Accel_ZoomAll", tr("Показать &всё"), tr("Показать всё"), kView, {}, "zoom_all");
  add("Accel_ZoomCenter", tr("Перейти в &центр"), tr("Перейти в центр"), kView)
      ->setStatusTip(tr("Перейти в центр изображения"));
  add("Accel_PrevView", tr("П&редыдущий вид"), tr("Предыдущий вид"), kView, {key("Alt+Left")}, "prev_view")
      ->setStatusTip(tr("Вернуться к предыдущему виду"));
  add("Accel_NextView", tr("&Следующий вид"), tr("Следующий вид"), kView, {key("Alt+Right")}, "next_view")
      ->setStatusTip(tr("Перейти к следующему виду"));
  add("Accel_ToggleMetalLayers", tr("Вкл/выкл все металлические слои"), {}, kView, {key(Qt::Key_QuoteLeft)});
  add("Accel_ToggleNetlines", tr("Вкл/выкл связи"), {}, kView, {key("N")})->setCheckable(true);
  add("Accel_ToggleActiveLayerOnly", tr("Вкл/выкл отображение только активного слоя"), {}, kView, {key("Shift+S")})
      ->setCheckable(true);
  add("Accel_TogglePadDetails", tr("Вкл/выкл КП"), {}, kView);
  add("Accel_ToggleWires", tr("Вкл/выкл проводники"), {}, kView);
  add("Accel_ToggleThinWires", tr("Вкл/выкл отображение проводников тонкими линиями"), {}, kView);
  add("Accel_ToggleCoppers", tr("Вкл/выкл области металлизации"), {}, kView);
  add("Accel_ToggleKeepouts", tr("Вкл/выкл запреты"), {}, kView);
  add("Accel_ToggleGrid", tr("Вкл/выкл сетку"), {}, kView);

  // ---- Дизайн
  add("Accel_ShowDPE", tr("&Редактор параметров"), tr("Параметры дизайна"), kMain, {key("F4")}, "design_params");
  add("Cmd_TextStyles", tr("Редактор &стилей надписей"), tr("Редактор стилей надписей"), {});
  add("Cmd_EditSettings", tr("&Настройки редактирования"), tr("Настройки редактирования"), {});
  add("Cmd_PadConnect", tr("Настройки подсоединения проводников к &КП"), tr("Подсоединение проводников к КП"), {});
  add("Cmd_MsgFilter", tr("&Фильтр сообщений"), tr("Фильтр сообщений"), {});
  add("Cmd_CopperArea", tr("&Площадь металлизации"), tr("Площадь металлизации"), {});
  add("Cmd_Summary", tr("Сводная &информация"), tr("Сводная информация"), {});

  // ---- Трассировка
  add("Accel_TO", tr("&Автотрассировка..."), tr("Автотрассировка"), kAuto, {key("F11")}, "autoroute")
      ->setStatusTip(tr("Начать автотрассировку"));
  add("Accel_RouteMode", tr("Ручная прокладка &проводника"), tr("Прокладывать проводники"), kEdit, {key("R")}, "route")
      ->setStatusTip(tr("Переключиться в режим ручной трассировки"));
  add("Cmd_RouteWire", tr("Прокладка проводника"), tr("Прокладка проводника"), {}, {}, "route");
  add("Cmd_RouteDiff", tr("Ручная прокладка &дифф. пары"), tr("Прокладка дифф.пары"), {}, {}, "route_diff");
  add("Cmd_Unroute", tr("&Удалить разводку"), tr("Удалить разводку"), {})
      ->setStatusTip(tr("Удалить всю разводку на плате"));

  // ---- Вставка (shape tools: board outline, keepout, copper, cutout, detail)
  struct ShapeKind {
    const char* prefix;
    const char* icon;
    bool disk;    // «Круг» (filled circle)
    bool open;    // circle/line/arcs
  };
  for (auto [prefix, icon, disk, open] : {ShapeKind{"Board", "board", false, true}, ShapeKind{"Keepout", "keepout", true, true},
                                          ShapeKind{"Copper", "copper", true, true}, ShapeKind{"Cutout", "cutout", true, false},
                                          ShapeKind{"Detail", "detail", true, true}}) {
    QString p = QString("Cmd_") + prefix;
    add(p + "Poly", tr("&Многоугольник"), tr("Многоугольник"), {}, {}, icon);
    add(p + "Rect", tr("&Прямоугольник"), tr("Прямоугольник"), {}, {}, icon);
    if (disk) add(p + "Disk", tr("&Круг"), tr("Круг"), {}, {}, icon);
    if (open) {
      add(p + "Circle", tr("&Окружность"), tr("Окружность"), {}, {}, icon);
      add(p + "Line", tr("&Линия"), tr("Линия"), {}, {}, icon);
      add(p + "ArcC", tr("Дуга (по &центру)"), tr("Дуга по центру"), {}, {}, icon);
      add(p + "ArcP", tr("Дуга (по &точкам)"), tr("Дуга по точкам"), {}, {}, icon);
    }
  }
  add("Accel_InsertText", tr("&Надпись"), tr("Создать надпись"), kEdit, {}, "text");
  add("Accel_ViaSingle", tr("&Одиночный переход"), tr("Создать переход"), kEdit, {key("V")}, "via")
      ->setStatusTip(tr("Добавить один переход"));
  add("Cmd_ViaRow", tr("&Ряд переходов"), tr("Ряд переходов"), {}, {}, "via");
  add("Cmd_ViaMatrix", tr("&Матрица переходов"), tr("Матрица переходов"), {}, {}, "via");

  // ---- Инструменты
  add("Accel_PT", tr("&Авторазмещение..."), tr("Авторазмещение"), kAuto, {key("F12")}, "autoplace");
  add("Accel_DRC", tr("&DRC..."), tr("Запустить DRC"), kAuto, {key("F9")}, "drc");
  add("Cmd_SwapPins", tr("Переназначение в&ыводов"), tr("Переназначение выводов"), {}, {}, "swap");
  add("Cmd_SwapGates", tr("Переназначение в&ентилей"), tr("Переназначение вентилей"), {}, {}, "swap");
  add("Accel_Measure", tr("Линейка"), tr("Измерение расстояний"), kMain, {key("Ctrl+M")}, "measure");
  add("Cmd_MeasureDots", tr("Расстояние между двумя &точками"), tr("Измерять расстояние между двумя точками"), {}, {},
      "measure");
  add("Cmd_MeasureObj", tr("Расстояние между двумя &объектами"), tr("Расстояние между двумя объектами"), {}, {}, "measure");
  add("Cmd_RestoreDiff", tr("&Восстановить дифф. пары проводников"), tr("Восстановить дифф. пары"), {});
  add("Cmd_Serpents", tr("&Создать змейки"), tr("Создать змейки"), {});
  add("Cmd_Fanout", tr("&Расставить фанауты"), tr("Расставить фанауты"), {});
  add("Cmd_WiresToCopper", tr("Преобразовать &проводники в обл. металлизации..."),
      tr("Преобразовать проводники в обл. металлизации"), {});
  add("Accel_PourAllPoly", tr("Залить &все"), tr("Залить области металлизации"), kObject);
  add("Accel_UnPourAllPoly", tr("У&далить заливку у всех"), tr("Удалить заливку у областей металлизации"), kObject);
  add("Accel_RePourAllPoly", tr("П&ерезалить все"), tr("Перезалить области металлизации"), kObject);
  add("Cmd_RemoveExcessVias", tr("Удалить &избыточные переходы"), tr("Удалить избыточные переходы"), {});
  add("Cmd_RemoveSinglePinNets", tr("Удалить одноконтактные &цепи"), tr("Удалить одноконтактные цепи"), {});
  add("Cmd_Sync", tr("Син&хронизация..."), tr("Синхронизация"), {});
  add("Cmd_Eco", tr("Создание ECO-&файла для обратной синхронизации..."), tr("Создание ECO-файла"), {});
  add("Cmd_Settings", tr("&Настройки программы"), tr("Настройки программы"), {}, {}, "settings");

  // ---- Справка
  add("Accel_Help", tr("&Содержание"), tr("Справка"), kMain, {key("F1")}, "help")
      ->setStatusTip(tr("Показать главную страницу документации"));
  add("Cmd_Features", tr("&Особенности работы"), tr("Особенности работы"), {});
  add("Cmd_HotkeysHelp", tr("&Горячие клавиши"), tr("Горячие клавиши"), {});
  add("Cmd_HomePage", tr("&Домашняя страница"), tr("Домашняя страница"), {});
  add("Cmd_About", tr("О &программе"), tr("О программе"), {});

  // ---- Режимы редактора (vertical mode toolbar)
  add("Cmd_ModeSelect", tr("Выделять и перемещать объекты"), tr("Выделять и перемещать объекты"), {}, {}, "select");
  add("Accel_FM", tr("Перемещение в стиле FreeStyle"), tr("Перемещать объекты в режиме \"Freestyle\""), kAuto,
      {key("F8")}, "freestyle");
  add("Cmd_FmNoPush", tr("Без подталкивания и соблюдения зазоров"), tr("Без подталкивания и соблюдения зазоров"), {}, {},
      "freestyle");
  add("Cmd_FmPushVias", tr("С подталкиванием переходов"), tr("С подталкиванием переходов"), {}, {}, "freestyle");
  add("Cmd_FmPushComps", tr("С подталкиванием компонентов и переходов"), tr("С подталкиванием компонентов и переходов"),
      {}, {}, "freestyle");
  add("Cmd_ModeBoard", tr("Контур платы"), tr("Контур платы"), {}, {}, "board");
  add("Cmd_ModeKeepout", tr("Запрет"), tr("Запрет"), {}, {}, "keepout");
  add("Cmd_ModeCopper", tr("Область металлизации"), tr("Область металлизации"), {}, {}, "copper");
  add("Cmd_ModeCutout", tr("Вырез в металлизации"), tr("Вырез в металлизации"), {}, {}, "cutout");
  add("Cmd_ModeDetail", tr("Деталь"), tr("Деталь"), {}, {}, "detail");
  add("Cmd_ModeVia", tr("Переход"), tr("Создать переход"), {}, {}, "via");
  add("Cmd_ModeSwap", tr("Переназначение"), tr("Переназначение"), {}, {}, "swap");
  addGroup("Accel_FM", {"Cmd_FmNoPush", "Cmd_FmPushVias", "Cmd_FmPushComps"}, "Cmd_FmNoPush");
  addGroup("Accel_RouteMode", {"Cmd_RouteWire", "Cmd_RouteDiff"}, "Cmd_RouteWire");
  auto shapes = [](const QString& p, bool disk, bool open) {
    QStringList l{p + "Poly", p + "Rect"};
    if (open) l << p + "ArcC" << p + "ArcP" << p + "Circle" << p + "Line";
    if (disk) l.insert(2, p + "Disk");
    return l;
  };
  addGroup("Cmd_ModeBoard", shapes("Cmd_Board", false, true), "Cmd_BoardPoly");
  addGroup("Cmd_ModeKeepout", shapes("Cmd_Keepout", true, true), "Cmd_KeepoutPoly");
  addGroup("Cmd_ModeCopper", shapes("Cmd_Copper", true, true), "Cmd_CopperPoly");
  addGroup("Cmd_ModeCutout", shapes("Cmd_Cutout", true, false), "Cmd_CutoutPoly");
  addGroup("Cmd_ModeDetail", shapes("Cmd_Detail", true, true), "Cmd_DetailPoly");
  addGroup("Cmd_ModeVia", {"Accel_ViaSingle", "Cmd_ViaRow", "Cmd_ViaMatrix"}, "Accel_ViaSingle");
  addGroup("Cmd_ModeSwap", {"Cmd_SwapPins", "Cmd_SwapGates"}, "Cmd_SwapPins");
  addGroup("Accel_Measure", {"Cmd_MeasureDots", "Cmd_MeasureObj"}, "Cmd_MeasureObj");

  // ---- Действия редактора топологии (autoprocedures)
  add("Accel_RecalcWires", tr("Расчёт формы проводников"), tr("Расчёт формы проводников"), kAuto, {key("F5")}, "recalc");
  add("Cmd_RecalcArcs", tr("Расчёт формы проводников с дугами"), tr("Расчёт формы проводников с дугами"), {}, {}, "recalc");
  add("Cmd_RecalcAny", tr("Расчёт формы проводников any-angle"), tr("Расчёт формы проводников any-angle"), {}, {}, "recalc");
  add("Cmd_Recalc45", tr("Расчёт формы проводников под 45°"), tr("Расчёт формы проводников под 45°"), {}, {}, "recalc");
  add("Accel_RefineWires", tr("Перекладка проводников"), tr("Перекладка проводников"), kAuto, {key("F6")}, "refine")
      ->setStatusTip(tr("Выполнить оптимизацию путей проводников"));
  add("Cmd_RefineLayers", tr("Перекладка проводников (с возможным переносом на другой слой)"),
      tr("Перекладка проводников (с возможным переносом на другой слой)"), {}, {}, "refine");
  add("Cmd_RefineSame", tr("Перекладка проводников без смены слоя"), tr("Перекладка проводников без смены слоя"), {}, {},
      "refine");
  add("Accel_AutoStart", tr("Выполнить подвижку"), tr("Подвижка"), kAuto, {key("F7")}, "move");
  add("Cmd_MoveVias", tr("Подвижка переходов"), tr("Подвижка переходов"), {}, {}, "move");
  add("Cmd_MoveViasRefine", tr("Подвижка переходов с перекладкой проводников"),
      tr("Подвижка переходов с перекладкой проводников"), {}, {}, "move");
  add("Cmd_MoveCompsVias", tr("Подвижка компонентов и переходов с перекладкой проводников"),
      tr("Подвижка компонентов и переходов с перекладкой проводников"), {}, {}, "move");
  add("Cmd_Teardrops", tr("Капельки"), tr("Капельки"), {}, {}, "teardrop")->setCheckable(true);
  add("Cmd_RecalcEdited", tr("Расчёт формы: только изменённые проводники"),
      tr("F5 без выделения пересчитывает только проводники, изменённые с прошлого расчёта"), {}, {})
      ->setCheckable(true);
  addGroup("Accel_RecalcWires", {"Cmd_RecalcArcs", "Cmd_RecalcAny", "Cmd_Recalc45"}, "Cmd_RecalcAny");
  addGroup("Accel_RefineWires", {"Cmd_RefineLayers", "Cmd_RefineSame"}, "Cmd_RefineLayers");
  addGroup("Accel_AutoStart", {"Cmd_MoveVias", "Cmd_MoveViasRefine", "Cmd_MoveCompsVias"}, "Cmd_MoveVias");

  // ---- Ручная прокладка, выделение, слои, схемы (hotkeys only)
  add("Accel_Cancel", tr("Снять выделение/режим выделения"), {}, kSelect, {key("Esc"), key("Shift+Esc")});
  add("Accel_DelLast", tr("Отменить последнее действие"), {}, kManRoute, {key("Backspace")});
  add("Accel_NavTarget", tr("Выбрать новую цель"), {}, kManRoute, {key("Q")});
  add("Accel_Route2Target", tr("Проложить проводник автоматически"), {}, kManRoute, {key(Qt::Key_Semicolon)});
  add("Accel_ToogleGrid", tr("Вкл/выкл привязку к сетке"), {}, kManRoute, {key("G")})->setCheckable(true);
  add("Accel_ToogleOrtho", tr("Вкл/выкл привязку к углу, кратному 45"), {}, kManRoute, {key("O")})->setCheckable(true);
  add("Accel_ToogleOrthoNeighbour", tr("Привязать другой инцидентный сегмент"), {}, kManRoute, {key("P")});
  add("Accel_SwapZipNets", tr("Переключить цепи у дифф. пары"), {}, kManRoute, {key("Alt+Space")});
  add("Accel_SetActiveLayer0", tr("Нижний металлический слой"), {}, kLayer, {key("0")});
  add("Accel_SetActiveLayer1", tr("Металлический слой  1 (верхний)"), {}, kLayer, {key("1")});
  for (int i = 2; i <= 9; ++i)
    add(QString("Accel_SetActiveLayer%1").arg(i), tr("Металлический слой  %1").arg(i), {}, kLayer, {key(Qt::Key_0 + i)});
  for (int i = 0; i < 20; ++i) add(QString("Accel_VisibilityScheme_%1").arg(i), tr("Схема отображения %1").arg(i), {}, kVisScheme);
  for (int i = 0; i < 20; ++i) add(QString("Accel_ColorScheme_%1").arg(i), tr("Цветовая схема %1").arg(i), {}, kColScheme);
}

QAction* Commands::add(const QString& id, const QString& text, const QString& tip, const QString& group,
                       QList<QKeySequence> keys, const QString& icon) {
  auto* a = new QAction(text, this);
  a->setObjectName(id);
  a->setToolTip(tip.isEmpty() ? QString(text).remove('&') : tip);
  if (!icon.isEmpty()) a->setIcon(QIcon(":/icons/" + icon + ".svg"));
  a->setShortcuts(keys);
  a->setShortcutContext(Qt::WindowShortcut);
  a->setEnabled(false);
  window_->addAction(a);
  actions_.insert(id, a);
  info_.push_back({id, group, keys});
  return a;
}

void Commands::addGroup(const QString& id, const QStringList& subs, const QString& current) {
  groups_.push_back({id, subs, current});
  // The group command runs the current sub-mode.
  connect((*this)[id], &QAction::triggered, this, [this, id] {
    const CommandGroup* g = group(id);
    if (QAction* a = g ? (*this)[g->current] : nullptr; a && a->isEnabled()) a->trigger();
  });
}

QAction* Commands::operator[](const QString& id) const {
  QAction* a = actions_.value(id);
  Q_ASSERT_X(a, "Commands", qPrintable("unknown command " + id));
  return a;
}

QAction* Commands::bind(const QString& id, std::function<void()> fn, bool needsBoard) {
  QAction* a = (*this)[id];
  connect(a, &QAction::triggered, this, [fn = std::move(fn)] { fn(); });
  bound_[id] = true;
  needsBoard_[id] = needsBoard;
  a->setEnabled(!needsBoard || boardOpen_);
  // A group becomes available as soon as one of its sub-modes is.
  for (auto& g : groups_)
    if (g.subs.contains(id)) {
      QAction* ga = (*this)[g.id];
      if (!bound_.value(g.id)) {
        bound_[g.id] = true;
        needsBoard_[g.id] = needsBoard;
      }
      needsBoard_[g.id] = needsBoard_[g.id] && needsBoard;
      ga->setEnabled(!needsBoard_[g.id] || boardOpen_);
      // The default sub-mode may be one we do not implement: fall back to the first bound one.
      if (!(*this)[g.current]->isEnabled() && !bound_.value(g.current)) g.current = id;
    }
  return a;
}

void Commands::setBoardOpen(bool open) {
  boardOpen_ = open;
  for (auto it = bound_.cbegin(); it != bound_.cend(); ++it)
    if (needsBoard_.value(it.key())) (*this)[it.key()]->setEnabled(open);
}

const CommandGroup* Commands::group(const QString& id) const {
  for (auto& g : groups_)
    if (g.id == id) return &g;
  return nullptr;
}

void Commands::setCurrent(const QString& groupId, const QString& sub) {
  for (auto& g : groups_)
    if (g.id == groupId && g.subs.contains(sub) && g.current != sub) {
      g.current = sub;
      emit currentChanged(groupId);
    }
}

QList<QKeySequence> Commands::defaults(const QString& id) const {
  for (auto& i : info_)
    if (i.id == id) return i.defaults;
  return {};
}

void Commands::setShortcuts(const QString& id, const QList<QKeySequence>& keys) {
  if (QAction* a = actions_.value(id)) a->setShortcuts(keys);
}

QHash<QString, QList<QKeySequence>> Commands::overrides() const {
  QHash<QString, QList<QKeySequence>> o;
  for (auto& i : info_)
    if (QAction* a = actions_.value(i.id); a && a->shortcuts() != i.defaults) o.insert(i.id, a->shortcuts());
  return o;
}

void Commands::applyOverrides(const QHash<QString, QList<QKeySequence>>& o) {
  for (auto it = o.cbegin(); it != o.cend(); ++it) setShortcuts(it.key(), it.value());
}

void Commands::resetShortcuts() {
  for (auto& i : info_) setShortcuts(i.id, i.defaults);
}

void Commands::fill(QMenu* menu, const QStringList& ids) const {
  for (auto& id : ids) {
    if (id == "-") menu->addSeparator();
    else menu->addAction((*this)[id]);
  }
}

void Commands::fill(QToolBar* bar, const QStringList& ids) const {
  for (auto& id : ids) {
    if (id == "-") bar->addSeparator();
    else bar->addAction((*this)[id]);
  }
}

}  // namespace xr::gui
