#!/bin/bash
# autoroute-bench.sh OUTDIR [old|new|both] [extra args for route] — routes the benchmark boards with the old router
# (route), the new one (route --new) or both, and prints a table: DRC violations (unconnected apart), unrouted,
# vias, length, seconds. The routed boards stay in OUTDIR.
set -u
OUT=$1; WHICH=${2:-both}; shift; shift 2>/dev/null; EXTRA=("$@")
ROOT=$(cd "$(dirname "$0")/.." && pwd)
CLI=${CLI:-$HOME/build/XrTopoR-release/apps/xrtopor-cli}
D=$ROOT/tests/data
BUS=${BUS:-$HOME/Документы/TopoR/XrCapture/Buses}
BOARDS=(
  "$D/astable.kicad_pcb" "$D/tt.kicad_pcb" "$D/adg508f_single.dsn" "$D/el4134_pcad_ascii.pcb"
  "$D/topor/Example_05/MinVia_master.PCB" "$D/topor/Example_02/Placement_master.pcb" "$D/topor/Example_04/Arcs_master.pcb"
  "$D/topor/Example_03/arz_2L.fst"
)
for k in bus_straight bus_twisted bus_offset bus_cross bus_mixed smd_bus; do [ -e "$BUS/$k.fst" ] && BOARDS+=("$BUS/$k.fst"); done
mkdir -p "$OUT"
printf "%-24s %-4s %6s %6s %6s %9s %8s\n" board who drc unrout vias length,mm sec
for f in "${BOARDS[@]}"; do
  name=$(basename "$f"); name=${name%.*}
  for who in old new; do
    [ "$WHICH" = both ] || [ "$WHICH" = "$who" ] || continue
    o="$OUT/${who}_$name.fst"
    flag=(); [ $who = new ] && flag=(--new)
    s=$(date +%s.%N)
    timeout 1800 "$CLI" route "$f" "${flag[@]}" "${EXTRA[@]}" -o "$o" > "$OUT/${who}_$name.log" 2>&1
    sec=$(echo "$(date +%s.%N) - $s" | bc)
    drc=$("$CLI" drc "$o" --max 0 2>/dev/null | grep "^DRC")
    total=$(echo "$drc" | sed -n 's/DRC: \([0-9]*\) .*/\1/p')
    unc=$(echo "$drc" | sed -n 's/.*unconnected=\([0-9]*\).*/\1/p'); unc=${unc:-0}
    info=$("$CLI" info "$o" 2>/dev/null)
    vias=$(echo "$info" | awk '/^vias/{print $2}')
    len=$("$CLI" report "$o" 2>/dev/null | sed -n 's/.*[Tt]otal[^0-9]*\([0-9.]*\) mm.*/\1/p' | head -1)
    printf "%-24s %-4s %6s %6s %6s %9s %8.1f\n" "$name" $who $((${total:-0} - unc)) "$unc" "${vias:-?}" "${len:-?}" "$sec"
  done
done
