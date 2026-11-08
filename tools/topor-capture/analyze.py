#!/usr/bin/env python3
"""analyze.py OUTDIR — a summary of a capture.sh run, written to OUTDIR/summary.md and printed.

Variants: TopoR names them name_LLL-VVV[w|s][a][N].fsb (length mm, vias, weak/strict check). For each: when it was
first seen, and whether it is on the lower-left convex hull of (length, vias) — the variants optimal for some price
of a via — with that price interval in mm per via (Polubasov 2010, fig. 13).
Frames: the share of pixels that changed from the previous frame (ImageMagick `compare -metric AE`), to see when
TopoR redraws the board and how much.
"""
import os
import re
import subprocess
import sys


def variants(out):
    rows = []
    for f in sorted(os.listdir(os.path.join(out, "fsb"))):
        m = re.match(r"([\d.]+)_(.+)_(\d+)-(\d+)([ws]?)(a?)(\d*)\.fsb$", f)
        if m:
            rows.append(dict(t=float(m[1]), name=m[2], length=int(m[3]), vias=int(m[4]), check=m[5], file=f))
    return rows


def hull(points):
    """Lower-left convex hull of (length, vias): the points minimal for some L + price * V, price >= 0."""
    pts = sorted(set(points))
    out = []
    for p in pts:  # by length ascending; keep the lower convex chain with vias decreasing
        while out and out[-1][1] <= p[1]:
            p = None
            break
        if p is None:
            continue
        while len(out) >= 2:
            (x1, y1), (x2, y2) = out[-2], out[-1]
            if (x2 - x1) * (p[1] - y1) - (y2 - y1) * (p[0] - x1) <= 0:
                out.pop()
            else:
                break
        out.append(p)
    return out


def frame_changes(out):
    fr = os.path.join(out, "frames")
    names = sorted(os.listdir(fr))
    res = []
    for a, b in zip(names, names[1:]):
        r = subprocess.run(["compare", "-metric", "AE", os.path.join(fr, a), os.path.join(fr, b), "null:"],
                           capture_output=True, text=True)
        try:
            res.append(float(r.stderr.split()[0]))
        except (ValueError, IndexError):
            res.append(-1)
    return res


def main():
    out = sys.argv[1]
    lines = [f"# Capture {os.path.basename(os.path.abspath(out))}", ""]
    rows = variants(out)
    pts = hull([(r["length"], r["vias"]) for r in rows])
    lines.append(f"Variants: {len(rows)}; on the hull: {len(pts)}")
    lines.append("")
    lines.append("| t, s | length, mm | vias | check | hull | mm/via interval |")
    lines.append("|---|---|---|---|---|---|")
    for r in rows:
        p = (r["length"], r["vias"])
        interval = ""
        if p in pts:
            i = pts.index(p)
            # optimal for via prices between the slopes to its neighbours on the hull (sorted by length: the
            # shorter one has more vias, the longer fewer)
            lo = 0 if i == 0 else (p[0] - pts[i - 1][0]) / max(1, pts[i - 1][1] - p[1])
            hi = "inf" if i + 1 >= len(pts) else f"{(pts[i + 1][0] - p[0]) / max(1, p[1] - pts[i + 1][1]):.1f}"
            interval = f"{lo:.1f} .. {hi}"
        lines.append(f"| {r['t']:.1f} | {r['length']} | {r['vias']} | {r['check']} | {'*' if p in pts else ''} | {interval} |")
    ch = frame_changes(out)
    if ch:
        lines.append("")
        lines.append("Frames: changed pixels from the previous frame (first 30, then every 10th)")
        lines.append("")
        lines.append(" ".join(f"{i + 1}:{int(c)}" for i, c in enumerate(ch) if i < 30 or i % 10 == 0))
    text = "\n".join(lines) + "\n"
    with open(os.path.join(out, "summary.md"), "w") as f:
        f.write(text)
    print(text)


if __name__ == "__main__":
    main()
