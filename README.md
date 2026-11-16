# XrTopoR

Редактор печатных плат с топологическим трассировщиком в духе TopoR: трассы под любым углом и дугами,
без сетки, топология первична — геометрия вычисляется из неё. C++26, Qt 6, CGAL, Boost.

## Сборка

```sh
cmake --preset release          # GCC 16 из /opt/gcc-16, C++26
cmake --build --preset release
ctest --preset release          # юнит-тесты + GUI-тесты (offscreen)
```

Цели: `xrtopor` (GUI), `xrtopor-cli`, библиотеки `xrgeom`, `xrcore`, `xrio`, `xrdrc`, `xrrouter`, `xrgui`.

## Форматы

| Формат | Чтение | Запись |
|---|---|---|
| KiCad `.kicad_pcb` (6–11) + `.kicad_pro` (классы цепей) | да | да (исходный файл патчится: размещение и разводка, остальное сохраняется) |
| Specctra `.dsn` / `.ses` | да | да |
| P-CAD 2002 ASCII `.pcb` | да | — |
| Gerber RS-274X (X2) + Excellon | — | да |
| SVG (просмотр) | — | да |

## CLI

```sh
xrtopor-cli info    board.kicad_pcb
xrtopor-cli route   board.dsn -o routed.ses [--passes 6] [--via-cost 3] [--no-vias] [--nets a,b] [--svg out.svg]
xrtopor-cli drc     board.kicad_pcb [--max N]
xrtopor-cli convert board.pcb out.kicad_pcb
xrtopor-cli import-ses board.dsn routes.ses -o out.dsn
xrtopor-cli gerber  board.kicad_pcb outdir/
xrtopor-cli svg     board.kicad_pcb out.svg
```

## Сборки и выпуски

GitHub Actions (`.github/workflows/release.yml`, как в GERBER_X3) собирает XrTopoR для Linux (Debian sid, GCC 16) и
Windows (MSYS2 UCRT64) и выкладывает самодостаточные архивы в Releases:

- каждый push в `main` — пред-выпуск `continuous`;
- тег версии — выпуск этой версии: `git tag 0.2 && git push origin 0.2`.

Версия, ветка или тег, коммит и дата сборки — в «Справка › О программе» (кнопка «Скопировать сведения») и в
`xrtopor --version`, `xrtopor-cli --version`; номер версии — `project(... VERSION)` в `CMakeLists.txt`.

## MCP-сервер (для ИИ-агентов)

Редактор может работать как MCP-сервер (Model Context Protocol): агент читает, правит и разводит открытую плату
теми же процедурами, что и пользователь, каждая его правка — шаг «Отменить». По умолчанию выключен.

```sh
xrtopor --mcp board.fst          # HTTP на http://127.0.0.1:7417/mcp на этот запуск (--mcp 7420 — другой порт)
xrtopor --mcp-stdio board.fst    # JSON-RPC построчно на stdin/stdout (клиент сам запускает процесс)
```

Постоянно — «Настройки программы › Общие › MCP-сервер». Слушает только 127.0.0.1; запросы со страниц других
сайтов (заголовок `Origin`) отклоняются. Claude Code подключается через `.mcp.json` в корне репозитория, описание
работы для агента — `.claude/skills/xrtopor/SKILL.md`.

Инструменты: `info`, `open`, `save`; `nets`, `net`, `components`, `component`, `ratsnest`, `region`, `rules`, `log`;
`route` (связь по топологической модели, как инструмент «Прокладка»), `add_track`, `add_via`, `delete`, `unroute`,
`move_component`, `fix`, `flex_fix`, `undo`, `redo`; `autoroute` (F11), `autoroute_variants`, `autoroute_open`,
`reshape` (F5), `refine` (F6), `optimize` (F7), `drc`, `fill`, `job`; `screenshot`, `view`, `select`, `set_layer`,
`commands`, `command`. Координаты в мм.

## GUI: горячие клавиши (как в TopoR)

| Клавиша | Действие |
|---|---|
| `R` | режим прокладки проводников: клик по площадке — старт, клики — точки, клик по площадке той же цепи / Enter / двойной клик — финиш |
| `V` | во время прокладки — переходное отверстие и смена слоя; иначе режим постановки переходов |
| `L` | следующий медный слой (при прокладке — через переход) |
| `1`…`9`, `0` | активный медный слой (0 — нижний) |
| `O` / `A` | ограничение 45° / режим дуг (дуга касательна к предыдущему сегменту) |
| `W` | ширина проводника |
| `Backspace` | убрать последний сегмент при прокладке |
| `Esc` | отмена прокладки / режим выделения |
| `Space`, `Shift+Space` | повернуть компонент на −90° / +90° |
| `Del` | удалить выделенное |
| `N` | показать/скрыть связи |
| `Shift+S` | только активный медный слой |
| `Ctrl+B` | показать плату целиком |
| `F9` | DRC |
| `F10` | автотрассировка (в фоне, с отменой) |
| `Ctrl+Z` / `Ctrl+Y` | отмена / повтор |
| колесо / средняя или правая кнопка | масштаб / панорамирование |

Резиновый сегмент при прокладке краснеет, если нарушает зазор (онлайн-DRC).

## Трассировщик (`src/router/topo`)

1. `TopoMesh` — ограниченная триангуляция Делоне (CGAL) по центрам и углам площадок, переходным отверстиям,
   кандидатам переходов и контуру платы.
2. `TopoRouter` — поиск A* по состояниям (треугольник, ребро входа, позиция в порядке пересечений) с
   проверкой планарности хорд, негоциация перегрузок рёбер (PathFinder), rip-up & reroute, переходы в
   вершинах-кандидатах, геометрическая обратная связь (реализация → проверка → штраф → перетрассировка).
3. `Realizer` — для каждой топологии: воронка в триангуляции препятствий, вложенность трасс вокруг
   общих препятствий, утолщение в касательные отрезки + дуги.

Отладочные переменные окружения: `XR_SKETCH=1` (выдать топологические эскизы вместо геометрии),
`XR_DEBUG`, `XR_DEBUG2`, `XR_DEBUG3`, `XR_DEBUG4`, `XR_NONEST`.

## Тестовые платы

`tests/data/`: платы KiCad (`astable`, `tt`, `adg508f_tester_v11`), DSN/SES (`adg508f_single`),
P-CAD ASCII (`el4134_pcad_ascii.pcb`), примеры TopoR (`topor/Example_0x`: мастера + разводки `.fst`).
