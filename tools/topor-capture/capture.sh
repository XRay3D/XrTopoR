#!/bin/bash
# capture.sh PROJECT.fsproj DOCUMENT SECONDS OUTDIR — runs TopoR's autorouter on a document of a TopoR project and
# records it: frames of the main window every second and the variant files (.fsb) as they appear (frames.sh), then
# stops TopoR. Nothing of the user's TopoR is touched:
#   - TopoR runs from a clone of the Wine prefix, ~/.wine-xrcap (its own wineserver, its own settings);
#   - the project must lie in a short path TopoR accepts (~/Документы/TopoR/XrCapture/...), not in the scratchpad;
#   - DISPLAY: the user's screen :0 (TopoR's autorouting dialog does not answer the accessibility queries on a
#     headless kwin_wayland --virtual display, so the start button cannot be found there); the real mouse moves
#     twice, to open the document and to press «Запустить».
# The clone is made once (btrfs reflinks, ~4 GB apparent):
#   prefix windows, Program Files*, ProgramData, *.reg, dosdevices, users/Public, AppData/Roaming/Eremex, and empty
#   AppData/Local/Temp + the profile's links (without them TopoR says «Неверно задано имя каталога»).
set -u
PROJ=$1; DOC=$2; SECS=$3; OUT=$4
HERE=$(cd "$(dirname "$0")" && pwd)
export WINUI_WINEPREFIX=$HOME/.wine-xrcap WINEPREFIX=$HOME/.wine-xrcap DISPLAY=${DISPLAY_CAPTURE:-:0} WINEDEBUG=-all
export WINUI_CACHE=$OUT/winui-cache PROJECT_DIR=$(dirname "$(realpath "$PROJ")")
log() { echo "[$(date +%T)] $*"; }
wait_for() {  # wait_for PATTERN TIMEOUT: a window line matching PATTERN
  local t=0
  until winui windows 2>/dev/null | grep -q "$1"; do
    sleep 2
    t=$((t + 2))
    if [ $t -ge "$2" ]; then return 1; fi
  done
  return 0  # (an until's status is its body's last command's)
}
mkdir -p "$OUT"
[ -d "$WINEPREFIX/drive_c/Program Files/TopoR Lite" ] || { echo "no capture prefix $WINEPREFIX (see the header)"; exit 2; }
wineserver -k 2>/dev/null; sleep 1
CFG=$WINEPREFIX/drive_c/users/x-ray/AppData/Roaming/Eremex/TopoR/TopoR_7.0.cfg
sed -i '/<recentfile /d' "$CFG"
find "$WINEPREFIX/drive_c/users/x-ray/AppData/Roaming/Eremex/TopoR/Autosave" -mindepth 1 -delete 2>/dev/null
find "$PROJECT_DIR" -maxdepth 1 -name '.lock*' -delete
# Documents the project lists but the disk no longer has (TopoR adds the .fsx of an imported .fst, and crashes on
# one that is gone): out of the project.
grep -o 'File path="[^"]*"' "$PROJ" | sed 's/File path=".\\\(.*\)"/\1/' | while read -r f; do
  [ -e "$PROJECT_DIR/$f" ] || sed -i "/File path=\".\\\\$f\"/d" "$PROJ"
done
# The document opens with the project when marked opened.
sed -i "s|<File path=\".\\\\$DOC.fsx\" isopened=\"0\"|<File path=\".\\\\$DOC.fsx\" isopened=\"1\"|" "$PROJ"
WP=$(echo "Z:$(realpath "$PROJ")" | tr / '\\')
(cd "$WINEPREFIX/drive_c/Program Files/TopoR Lite/BIN" && nohup wine TopoR.exe "$WP" > "$OUT/topor.log" 2>&1 &)
wait_for FS_MainFrame 300 || { log "TopoR did not start"; exit 1; }
sleep 6
winui place -w class:FS_MainFrame > /dev/null
ITEM=$(winui --timeout 60 find -w class:FS_MainFrame --name "$DOC" --all 2>/dev/null | awk -v d="'$DOC'" '$2 == "text" && $3 == d {print $1; exit}')
[ -n "$ITEM" ] || { log "no project item $DOC"; exit 1; }
winui --timeout 60 click -w "${ITEM%%/*}" --path "$ITEM" --double --method mouse > /dev/null
# Only a .fst in the project: the import wizard («Импорт», then «Готово» adding the design to this project).
if [ ! -e "$PROJECT_DIR/$DOC.fsx" ]; then
  wait_for "Мастер импорта" 60 || { log "no import wizard"; winui windows; exit 1; }
  winui --timeout 150 click -w "Мастер импорта" --id finish_btn > /dev/null
  sleep 8
  winui --timeout 150 click -w "Мастер импорта" --id finish_btn > /dev/null
fi
wait_for "Редактор ПП - $DOC" 120 || { log "the document did not open"; winui windows; exit 1; }
sleep 4
if winui windows | grep -q "#32770"; then log "a dialog is open:"; winui windows; exit 1; fi
log "opened $DOC"
PID=$(pgrep -f "TopoR.exe.*$(basename "$PROJ")" | head -1)
ticks() { awk '{print $14 + $15}' "/proc/$PID/stat" 2>/dev/null || echo 0; }
# MODE=f5 (or f6, f7): TopoR's own procedure on the design as it is (our routing realised by TopoR), then the main
# window and its status line («... мм, переходов: V, нарушений: N») once TopoR has been idle for 5 s.
if [ "${MODE:-route}" != route ]; then
  winui shot -w class:FS_MainFrame -o "$OUT/before.png" > /dev/null
  for step in ${MODE//,/ }; do  # f5,f7: one after another, each to the end (TopoR idle for 5 s)
    case $step in f5) CMD=7044 ;; f6) CMD=7043 ;; f7) CMD=8002 ;; *) log "unknown step $step"; exit 1 ;; esac
    winui cmd -w class:FS_MainFrame "$CMD" > /dev/null
    idle=0
    for _ in $(seq 3600); do
      a=$(ticks); sleep 1; b=$(ticks)
      if [ $((b - a)) -lt 5 ]; then idle=$((idle + 1)); else idle=0; fi
      [ $idle -ge 5 ] && break
    done
    winui shot -w class:FS_MainFrame -o "$OUT/after_$step.png" > /dev/null
    echo "$step: $(winui --timeout 60 find -w class:FS_MainFrame --name "нарушений" --regex --all 2>/dev/null | grep -o "'[^']*нарушений[^']*'" | head -1)" | tee -a "$OUT/status.txt"
  done
  log "$MODE done"
  wineserver -k
  exit 0
fi
winui cmd -w class:FS_MainFrame 70d3 > /dev/null
wait_for "Автоматическая трассировка" 60 || { log "no autorouting dialog"; exit 1; }
# «Запустить» by its place, 186 x 34 px from the dialog's lower right corner: the walk of the dialog (UIA) to find
# it by id takes 25 s with few nets and minutes with a hundred (the net table). The click's own check of the result
# times out once TopoR is busy routing — that is the sign it started: TopoR's CPU load.
sleep 3
# The dialog answers no accessibility query once its net table is long (it hung TopoR's window thread): the real
# mouse goes to the screen point, with the main window as the helper's target.
read -r X Y W H < <(winui windows | grep -m1 'Автоматическая трассировка' | sed -E 's/.* (-?[0-9]+),(-?[0-9]+) ([0-9]+)x([0-9]+) .*/\1 \2 \3 \4/')
MAIN=$(winui windows | awk '/FS_MainFrame/{print $1; exit}')
winui --timeout 30 click -w "$MAIN" --path "$MAIN" --at "$((X + W - 186)),$((Y + H - 34))" --method mouse --no-verify > /dev/null 2>&1 &
started=0
for _ in $(seq 20); do
  a=$(ticks); sleep 1; b=$(ticks)
  # more than half a core in that second (100 ticks a second)
  if [ $((b - a)) -gt 50 ]; then started=1; break; fi
done
[ $started = 1 ] || { log "the routing did not start"; exit 1; }
log "started"
"$HERE/frames.sh" "$OUT" "$SECS" 1
log "stopping"
wineserver -k
log "done: $(ls "$OUT/frames" | wc -l) frames, $(ls "$OUT/fsb" | wc -l) variants"
