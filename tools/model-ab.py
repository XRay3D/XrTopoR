#!/usr/bin/env python3
"""model-ab.py OLD NEW [-n RUNS] -- ARGS...  — two builds of xrtopor-cli run by turns on the same command, the
medians of their cycles, instructions and CPU seconds (perf stat; needs kernel.perf_event_paranoid <= 1).

The seconds of a run on this machine change with the power mode at the same count of cycles, and from run to run
by a tenth: a change is judged by the cycles of the two builds taken by turns, not by a stopwatch.

  tools/model-ab.py cli_old cli_new -- optimize board_f6.fst --model -o /tmp/x.fst
"""
import statistics
import subprocess
import sys
import tempfile


def main():
    if "--" not in sys.argv or len(sys.argv) < 5:
        sys.exit(__doc__)
    at = sys.argv.index("--")
    head, args = sys.argv[1:at], sys.argv[at + 1:]
    runs = 3
    if "-n" in head:
        runs = int(head[head.index("-n") + 1])
        del head[head.index("-n"):head.index("-n") + 2]
    old, new = head
    res = {old: [], new: []}
    with tempfile.NamedTemporaryFile(suffix=".csv") as st:
        for _ in range(runs):
            for binary in (old, new):
                subprocess.run(["perf", "stat", "-e", "cycles,instructions,task-clock", "-x,", "-o", st.name, binary] + args,
                               stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=False)
                got = {}
                for line in open(st.name):
                    f = line.strip().split(",")
                    if len(f) > 2 and f[0].replace(".", "").isdigit():
                        got[f[2].split(":")[0]] = float(f[0])
                res[binary].append(got)
    med = {b: {k: statistics.median(x.get(k, 0.0) for x in r) for k in ("cycles", "instructions", "task-clock")} for b, r in res.items()}
    for b in (old, new):
        m = med[b]
        print(f"{b}: cycles {m['cycles'] / 1e9:7.2f}e9  instructions {m['instructions'] / 1e9:7.2f}e9  cpu {m['task-clock'] / 1000:6.2f} s")
    if med[old]["cycles"] > 0:
        print(f"cycles {100 * (med[new]['cycles'] / med[old]['cycles'] - 1):+.1f} %, instructions "
              f"{100 * (med[new]['instructions'] / med[old]['instructions'] - 1):+.1f} %")


if __name__ == "__main__":
    main()
