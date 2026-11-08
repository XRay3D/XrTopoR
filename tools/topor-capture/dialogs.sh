#!/bin/bash
# dialogs.sh OUTDIR SECONDS — while TopoR works (opening a variant, a procedure), every 0.3 s: the windows of the
# capture TopoR; each dialog that appears is shot (OUTDIR/dlg_<t>_<hwnd>.png) and its texts listed once a second
# (OUTDIR/dialogs.txt). For the progress windows whose stages tell what TopoR does.
set -u
OUT=$1; SECS=$2
mkdir -p "$OUT"
t0=$(date +%s.%N)
declare -A shot last
while :; do
  el=$(echo "$(date +%s.%N) - $t0" | bc)
  (( $(echo "$el >= $SECS" | bc) )) && break
  while read -r h rest; do
    [ -n "$h" ] || continue
    if [ -z "${shot[$h]:-}" ]; then
      shot[$h]=1
      winui shot -w "$h" -o "$OUT/dlg_$(printf %06.1f "$el")_$h.png" > /dev/null 2>&1
      echo "$(printf %6.1f "$el") new $h $rest" >> "$OUT/dialogs.txt"
    fi
    sec=${el%.*}
    if [ "${last[$h]:-}" != "$sec" ]; then
      last[$h]=$sec
      texts=$(winui --timeout 3 tree -w "$h" --no-uia 2>/dev/null | grep -oE "'[^']+'" | sort -u | tr '\n' ' ')
      [ -n "$texts" ] && echo "$(printf %6.1f "$el") $h $texts" >> "$OUT/dialogs.txt"
    fi
  done < <(winui windows 2>/dev/null | grep -v FS_MainFrame | grep "TopoR.exe")
  sleep 0.3
done
