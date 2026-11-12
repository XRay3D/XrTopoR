#!/bin/bash
# model-bench.sh OUTDIR [BASEDIR] [extra boards...] — F5 -> F6 -> F7 on the model for the benchmark boards
# (xrtopor-cli reshape | refine | optimize --model), the outputs kept in OUTDIR. Per board: the seconds of each
# command, then of the result of F7: the DRC's violations (unconnected apart), the unrouted connections, the length
# and the vias. With BASEDIR (an OUTDIR of an earlier run; "-" for none): whether each result of F7 is the same file
# (but for its date) or, if not, how its measures moved.
#
# The seconds wobble (this laptop: 1.6 times with the power mode at the same count of cycles): for the speed of a
# change use model-ab.py. CLI=... takes another binary.
set -u
OUT=${1:?OUTDIR}; BASE=${2:--}; shift; shift 2>/dev/null
ROOT=$(cd "$(dirname "$0")/.." && pwd)
CLI=${CLI:-$HOME/build/XrTopoR-release/apps/xrtopor-cli}
D=$ROOT/tests/data/topor
BOARDS=("$D/Example_04/Arcs_master_f6.fst" "$D/Example_03/arz_2L.fst" "$D/Example_03/arz_4L.fst" "$D/AMK310/AMK310_MCU_V2.fst" "$@")
mkdir -p "$OUT"
measures() {  # of a board: "violations unrouted length vias"
  local drc tot unc rep
  drc=$("$CLI" drc "$1" --max 0 2>/dev/null | grep ^DRC)
  tot=$(echo "$drc" | sed -n 's/DRC: \([0-9]*\) .*/\1/p'); unc=$(echo "$drc" | sed -n 's/.*unconnected=\([0-9]*\).*/\1/p')
  rep=$("$CLI" report "$1" 2>/dev/null | grep -m1 -i "total length")
  echo "$(( ${tot:-0} - ${unc:-0} )) ${unc:-0} $(echo "$rep" | sed -n 's/.*total length \([0-9.]*\) mm.*/\1/p') $(echo "$rep" | sed -n 's/.*vias: \([0-9]*\).*/\1/p')"
}
printf "%-16s %6s %6s %6s | %5s %5s %9s %5s | %s\n" board F5,s F6,s F7,s drc unrt len,mm vias "against $BASE"
for f in "${BOARDS[@]}"; do
  [ -e "$f" ] || { echo "missing $f"; continue; }
  n=$(basename "${f%.*}")
  run() { local s; s=$(date +%s.%N); "$CLI" "$@" > "$OUT/$n.$1.log" 2>&1; echo "$(date +%s.%N) - $s" | bc; }
  t5=$(run reshape "$f" --model -o "$OUT/${n}_f5.fst")
  t6=$(run refine "$OUT/${n}_f5.fst" --model -o "$OUT/${n}_f6.fst")
  t7=$(run optimize "$OUT/${n}_f6.fst" --model -o "$OUT/${n}_f7.fst")
  read -r drc unc len vias <<< "$(measures "$OUT/${n}_f7.fst")"
  cmp="-"
  if [ "$BASE" != "-" ] && [ -e "$BASE/${n}_f7.fst" ]; then
    if diff -q -I Date "$BASE/${n}_f7.fst" "$OUT/${n}_f7.fst" > /dev/null; then cmp="the same file"
    else read -r bd bu bl bv <<< "$(measures "$BASE/${n}_f7.fst")"; cmp="was $bd / $bu / $bl / $bv"; fi
  fi
  printf "%-16s %6.2f %6.2f %6.2f | %5s %5s %9s %5s | %s\n" "${n:0:16}" "$t5" "$t6" "$t7" "$drc" "$unc" "$len" "$vias" "$cmp"
done
