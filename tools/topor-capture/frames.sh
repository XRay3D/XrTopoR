#!/bin/bash
# frames.sh OUTDIR SECONDS [PERIOD] — snapshots of TopoR's main window and the autoroute variant files while it routes.
# Runs against the capture TopoR (WINUI_WINEPREFIX, DISPLAY of the headless display, see capture.sh). Writes
#   OUTDIR/frames/NNNNN.png      the main window, every PERIOD seconds (default 1)
#   OUTDIR/frames.tsv            frame number, seconds since start, window title
#   OUTDIR/fsb/<t>_<name>.fsb    each variant file as it appears in the project's autoroute_* directory
# The project directory is taken from PROJECT_DIR.
set -u
OUT=$1; SECS=$2; PERIOD=${3:-1}
: "${PROJECT_DIR:?PROJECT_DIR: the TopoR project directory}"
mkdir -p "$OUT/frames" "$OUT/fsb"
t0=$(date +%s.%N)
n=0
declare -A seen
while :; do
  now=$(date +%s.%N)
  el=$(echo "$now - $t0" | bc)
  if (( $(echo "$el >= $SECS" | bc) )); then break; fi
  f=$(printf "%s/frames/%05d.png" "$OUT" $n)
  title=$(winui shot -w class:FS_MainFrame -o "$f" 2>/dev/null | sed -n "s/.*0x[0-9a-f]* '\(.*\)')$/\1/p")
  printf "%d\t%.2f\t%s\n" $n "$el" "$title" >> "$OUT/frames.tsv"
  for v in "$PROJECT_DIR"/autoroute_*/*.fsb; do
    [ -e "$v" ] || continue
    if [ -z "${seen[$v]:-}" ]; then
      seen[$v]=1
      cp "$v" "$OUT/fsb/$(printf %06.1f "$el")_$(basename "$v")"
    fi
  done
  n=$((n + 1))
  rest=$(echo "$PERIOD - ($(date +%s.%N) - $now)" | bc)
  if (( $(echo "$rest > 0" | bc) )); then sleep "$rest"; fi
done
echo "$n frames, $(ls "$OUT/fsb" | wc -l) variants"
