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
  until winui windows 2>/dev/null | grep -q "$1"; do sleep 2; t=$((t + 2)); [ $t -ge "$2" ] && return 1; done
}
mkdir -p "$OUT"
[ -d "$WINEPREFIX/drive_c/Program Files/TopoR Lite" ] || { echo "no capture prefix $WINEPREFIX (see the header)"; exit 2; }
wineserver -k 2>/dev/null; sleep 1
CFG=$WINEPREFIX/drive_c/users/x-ray/AppData/Roaming/Eremex/TopoR/TopoR_7.0.cfg
sed -i '/<recentfile /d' "$CFG"
find "$WINEPREFIX/drive_c/users/x-ray/AppData/Roaming/Eremex/TopoR/Autosave" -mindepth 1 -delete 2>/dev/null
find "$PROJECT_DIR" -maxdepth 1 -name '.lock*' -delete
# The document opens with the project when marked opened.
sed -i "s|<File path=\".\\\\$DOC.fsx\" isopened=\"0\"|<File path=\".\\\\$DOC.fsx\" isopened=\"1\"|" "$PROJ"
WP=$(echo "Z:$(realpath "$PROJ")" | tr / '\\')
(cd "$WINEPREFIX/drive_c/Program Files/TopoR Lite/BIN" && nohup wine TopoR.exe "$WP" > "$OUT/topor.log" 2>&1 &)
wait_for FS_MainFrame 120 || { log "TopoR did not start"; exit 1; }
sleep 6
winui place -w class:FS_MainFrame > /dev/null
ITEM=$(winui --timeout 60 find -w class:FS_MainFrame --name "$DOC" --all 2>/dev/null | awk -v d="'$DOC'" '$2 == "text" && $3 == d {print $1; exit}')
[ -n "$ITEM" ] || { log "no project item $DOC"; exit 1; }
winui --timeout 60 click -w "${ITEM%%/*}" --path "$ITEM" --double --method mouse > /dev/null
wait_for "Редактор ПП - $DOC" 120 || { log "the document did not open"; winui windows; exit 1; }
sleep 4
if winui windows | grep -q "#32770"; then log "a dialog is open:"; winui windows; exit 1; fi
log "opened $DOC"
winui cmd -w class:FS_MainFrame 70d3 > /dev/null
wait_for "Автоматическая трассировка" 60 || { log "no autorouting dialog"; exit 1; }
# The walk of the dialog (UIA) takes ~25 s; then the click is by the cached path.
winui --timeout 280 find -w "Автоматическая трассировка" --id btn_start > /dev/null
"$HERE/frames.sh" "$OUT" "$SECS" 1 &
FR=$!
winui --timeout 280 click -w "Автоматическая трассировка" --id btn_start --method mouse --no-verify > /dev/null
log "started"
wait $FR
log "stopping"
wineserver -k
log "done: $(ls "$OUT/frames" | wc -l) frames, $(ls "$OUT/fsb" | wc -l) variants"
