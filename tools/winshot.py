#!/usr/bin/env python3
"""winshot — снимок окна по pid, имени или X11-id, в том числе свёрнутого.

    tools/winshot.py --name topor                 # окно TopoR (Wine) → winshot-TopoR.png
    tools/winshot.py --pid 1746956 -o shot.png
    tools/winshot.py --id 0x1e00001
    tools/winshot.py --list                       # все окна (X11 и Wayland)
    tools/winshot.py --name topor --all           # все окна процесса, не только главное

Имя ищется без учёта регистра как подстрока заголовка, WM_CLASS, comm процесса
и имени исполняемого файла (для Wine: «TopoR.exe»).

Два пути съёмки:

* X11 / XWayland (Wine, Qt с QT_QPA_PLATFORM=xcb, …): содержимое окна читается
  XGetImage'ем прямо из его offscreen-буфера, окно может быть перекрыто другими.
  Свёрнутое окно в XWayland размаплено (буфера нет), поэтому на время снимка оно
  разворачивается XMapWindow'ом и сразу сворачивается обратно XIconifyWindow'ом
  (на экране мелькнёт на ~полсекунды; фокус X11 не трогается).

* Нативные Wayland-окна: KWin ScreenShot2 по DBus (список окон — через
  KWin-скрипт). KWin пускает в этот интерфейс только процессы, чей desktop-файл
  содержит X-KDE-DBUS-Restricted-Interfaces=org.kde.KWin.ScreenShot2; без этого
  скрипт печатает, что сделать (см. --kwin-auth-hint).

Зависимости: python3, libX11, Pillow; для Wayland-пути ещё python3-dbus и PyGObject.
"""

import argparse
import ctypes
import ctypes.util
import json
import os
import re
import subprocess
import sys
import tempfile
import threading
import time

from PIL import Image

# ----------------------------------------------------------------------------- X11

Window = ctypes.c_ulong
Atom = ctypes.c_ulong
AnyPropertyType = 0
ZPixmap = 2
IsViewable = 2
NormalState, IconicState = 1, 3


class XWindowAttributes(ctypes.Structure):
    _fields_ = [
        ("x", ctypes.c_int), ("y", ctypes.c_int),
        ("width", ctypes.c_int), ("height", ctypes.c_int),
        ("border_width", ctypes.c_int), ("depth", ctypes.c_int),
        ("visual", ctypes.c_void_p), ("root", Window),
        ("c_class", ctypes.c_int), ("bit_gravity", ctypes.c_int),
        ("win_gravity", ctypes.c_int), ("backing_store", ctypes.c_int),
        ("backing_planes", ctypes.c_ulong), ("backing_pixel", ctypes.c_ulong),
        ("save_under", ctypes.c_int), ("colormap", ctypes.c_ulong),
        ("map_installed", ctypes.c_int), ("map_state", ctypes.c_int),
        ("all_event_masks", ctypes.c_long), ("your_event_mask", ctypes.c_long),
        ("do_not_propagate_mask", ctypes.c_long), ("override_redirect", ctypes.c_int),
        ("screen", ctypes.c_void_p),
    ]


class XImage(ctypes.Structure):
    _fields_ = [
        ("width", ctypes.c_int), ("height", ctypes.c_int), ("xoffset", ctypes.c_int),
        ("format", ctypes.c_int), ("data", ctypes.c_void_p), ("byte_order", ctypes.c_int),
        ("bitmap_unit", ctypes.c_int), ("bitmap_bit_order", ctypes.c_int),
        ("bitmap_pad", ctypes.c_int), ("depth", ctypes.c_int), ("bytes_per_line", ctypes.c_int),
        ("bits_per_pixel", ctypes.c_int), ("red_mask", ctypes.c_ulong),
        ("green_mask", ctypes.c_ulong), ("blue_mask", ctypes.c_ulong),
    ]


XErrorHandler = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_void_p, ctypes.c_void_p)


class X11:
    """Минимальная обёртка над libX11 через ctypes (без python-xlib)."""

    def __init__(self):
        path = ctypes.util.find_library("X11") or "libX11.so.6"
        X = self.X = ctypes.CDLL(path)
        X.XOpenDisplay.restype = ctypes.c_void_p
        X.XOpenDisplay.argtypes = [ctypes.c_char_p]
        X.XCloseDisplay.argtypes = [ctypes.c_void_p]
        X.XDefaultRootWindow.restype = Window
        X.XDefaultRootWindow.argtypes = [ctypes.c_void_p]
        X.XInternAtom.restype = Atom
        X.XInternAtom.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_int]
        X.XGetWindowProperty.argtypes = [
            ctypes.c_void_p, Window, Atom, ctypes.c_long, ctypes.c_long, ctypes.c_int, Atom,
            ctypes.POINTER(Atom), ctypes.POINTER(ctypes.c_int), ctypes.POINTER(ctypes.c_ulong),
            ctypes.POINTER(ctypes.c_ulong), ctypes.POINTER(ctypes.c_void_p)]
        X.XGetWindowAttributes.argtypes = [ctypes.c_void_p, Window, ctypes.POINTER(XWindowAttributes)]
        X.XIconifyWindow.argtypes = [ctypes.c_void_p, Window, ctypes.c_int]
        X.XMapWindow.argtypes = [ctypes.c_void_p, Window]
        X.XSync.argtypes = [ctypes.c_void_p, ctypes.c_int]
        X.XFree.argtypes = [ctypes.c_void_p]
        X.XGetImage.restype = ctypes.POINTER(XImage)
        X.XGetImage.argtypes = [ctypes.c_void_p, Window, ctypes.c_int, ctypes.c_int,
                                ctypes.c_uint, ctypes.c_uint, ctypes.c_ulong, ctypes.c_int]
        X.XDefaultScreen.argtypes = [ctypes.c_void_p]
        X.XSetErrorHandler.restype = XErrorHandler
        X.XSetErrorHandler.argtypes = [XErrorHandler]
        # Ошибки X (BadWindow на исчезнувшем окне и т.п.) не должны убивать процесс.
        self._handler = XErrorHandler(lambda d, e: 0)
        X.XSetErrorHandler(self._handler)
        self.dpy = X.XOpenDisplay(None)
        if not self.dpy:
            raise RuntimeError("не удалось открыть X-дисплей (DISPLAY=%r)" % os.environ.get("DISPLAY"))
        self.root = X.XDefaultRootWindow(self.dpy)
        self._atoms = {}

    def close(self):
        self.X.XCloseDisplay(self.dpy)

    def atom(self, name):
        if name not in self._atoms:
            self._atoms[name] = self.X.XInternAtom(self.dpy, name.encode(), 0)
        return self._atoms[name]

    def prop(self, win, name):
        """(format, bytes) свойства или (0, b'')."""
        typ, fmt, n, after = Atom(), ctypes.c_int(), ctypes.c_ulong(), ctypes.c_ulong()
        data = ctypes.c_void_p()
        r = self.X.XGetWindowProperty(self.dpy, win, self.atom(name), 0, 1 << 20, 0, AnyPropertyType,
                                      ctypes.byref(typ), ctypes.byref(fmt), ctypes.byref(n),
                                      ctypes.byref(after), ctypes.byref(data))
        if r != 0 or not data.value or n.value == 0:
            if data.value:
                self.X.XFree(data)
            return 0, b""
        # format 32 хранится как C long (8 байт на x86_64)
        unit = {8: 1, 16: 2, 32: ctypes.sizeof(ctypes.c_long)}[fmt.value]
        raw = ctypes.string_at(data.value, n.value * unit)
        self.X.XFree(data)
        return fmt.value, raw

    def prop_longs(self, win, name):
        fmt, raw = self.prop(win, name)
        if fmt != 32:
            return []
        size = ctypes.sizeof(ctypes.c_long)
        return [int.from_bytes(raw[i:i + size], sys.byteorder) for i in range(0, len(raw), size)]

    def prop_text(self, win, name):
        fmt, raw = self.prop(win, name)
        if fmt != 8:
            return ""
        return raw.decode("utf-8", "replace")

    def attrs(self, win):
        a = XWindowAttributes()
        if self.X.XGetWindowAttributes(self.dpy, win, ctypes.byref(a)) == 0:
            return None
        return a

    def client_list(self):
        return self.prop_longs(self.root, "_NET_CLIENT_LIST")

    def window_info(self, win):
        a = self.attrs(win)
        if a is None:
            return None
        pid = self.prop_longs(win, "_NET_WM_PID")
        wm_state = self.prop_longs(win, "WM_STATE")
        cls = self.prop_text(win, "WM_CLASS").split("\0")
        name = self.prop_text(win, "_NET_WM_NAME") or self.prop_text(win, "WM_NAME").rstrip("\0")
        return {
            "backend": "x11", "xid": win, "pid": pid[0] if pid else 0,
            "caption": name, "cls": cls[1] if len(cls) > 1 and cls[1] else (cls[0] if cls else ""),
            "w": a.width, "h": a.height,
            "minimized": (wm_state[0] == IconicState) if wm_state else (a.map_state != IsViewable),
            "viewable": a.map_state == IsViewable,
            "transient": bool(self.prop_longs(win, "WM_TRANSIENT_FOR")),
        }

    def windows(self):
        out = []
        for w in self.client_list():
            info = self.window_info(w)
            if info:
                out.append(info)
        return out

    def map(self, win):
        self.X.XMapWindow(self.dpy, win)
        self.X.XSync(self.dpy, 0)

    def iconify(self, win):
        self.X.XIconifyWindow(self.dpy, win, self.X.XDefaultScreen(self.dpy))
        self.X.XSync(self.dpy, 0)

    def wait_viewable(self, win, timeout):
        t0 = time.monotonic()
        while time.monotonic() - t0 < timeout:
            a = self.attrs(win)
            if a is not None and a.map_state == IsViewable:
                return True
            time.sleep(0.05)
        return False

    def grab(self, win):
        a = self.attrs(win)
        if a is None or a.map_state != IsViewable:
            raise RuntimeError("окно 0x%x не отображается (map_state=%s)" % (win, a.map_state if a else None))
        img = self.X.XGetImage(self.dpy, win, 0, 0, a.width, a.height, ~0 & 0xFFFFFFFFFFFFFFFF, ZPixmap)
        if not img:
            raise RuntimeError("XGetImage не вернул изображение для 0x%x" % win)
        im = img.contents
        try:
            if im.bits_per_pixel != 32:
                raise RuntimeError("неподдерживаемая глубина: %d bpp" % im.bits_per_pixel)
            raw = ctypes.string_at(im.data, im.bytes_per_line * im.height)
            mode = "BGRX" if im.red_mask == 0xFF0000 else "RGBX"
            return Image.frombuffer("RGB", (im.width, im.height), raw, "raw", mode, im.bytes_per_line, 1).copy()
        finally:
            self.X.XFree(im.data)
            self.X.XFree(img)


def x11_capture(x, win, settle, map_timeout, keep_restored=False):
    """Снимок X11-окна; свёрнутое — развернуть, снять, свернуть обратно."""
    a = x.attrs(win)
    if a is None:
        raise RuntimeError("окно 0x%x не существует" % win)
    was_hidden = a.map_state != IsViewable
    if was_hidden:
        x.map(win)
        if not x.wait_viewable(win, map_timeout):
            x.iconify(win)
            raise RuntimeError("окно 0x%x не стало видимым за %.1f с (другой рабочий стол?)" % (win, map_timeout))
        time.sleep(settle)  # дать приложению перерисоваться после expose
    try:
        return x.grab(win)
    finally:
        if was_hidden and not keep_restored:
            x.iconify(win)


# ----------------------------------------------------------------------------- KWin (Wayland)

KWIN_ENUM_SCRIPT = """
let r = [];
for (const w of workspace.windowList()) {
  r.push({id: w.internalId.toString(), pid: w.pid, caption: w.caption, cls: w.resourceClass,
          minimized: w.minimized, normal: w.normalWindow, w: w.width, h: w.height});
}
callDBus("%(svc)s", "/", "%(svc)s", "Windows", JSON.stringify(r));
"""

KWIN_AUTH_HINT = """\
KWin не разрешает этому процессу снимать окна (org.kde.KWin.ScreenShot2.Error.NoAuthorized).
KWin проверяет /proc/<pid>/exe вызывающего процесса и ищет desktop-файл с таким Exec
и полем X-KDE-DBUS-Restricted-Interfaces. Чтобы разрешить (это откроет интерфейс
ВСЕМ процессам этого интерпретатора python), создайте файл
  ~/.local/share/applications/winshot.desktop :
    [Desktop Entry]
    Type=Application
    Name=winshot
    NoDisplay=true
    Exec=%(exe)s
    X-KDE-DBUS-Restricted-Interfaces=org.kde.KWin.ScreenShot2
и выполните kbuildsycoca6.
Альтернатива без этого: запускать приложение как X11-окно (Qt: QT_QPA_PLATFORM=xcb),
тогда работает X11-путь."""


def _kwin_modules():
    try:
        import dbus  # noqa: F401
        import dbus.service  # noqa: F401
        from dbus.mainloop.glib import DBusGMainLoop  # noqa: F401
        from gi.repository import GLib  # noqa: F401
        return True
    except Exception:
        return False


def kwin_windows(timeout=3.0):
    """Окна по версии KWin (и X11, и Wayland); [] если KWin/DBus недоступны."""
    if not _kwin_modules():
        return []
    import dbus
    import dbus.service
    from dbus.mainloop.glib import DBusGMainLoop
    from gi.repository import GLib

    DBusGMainLoop(set_as_default=True)
    try:
        bus = dbus.SessionBus()
        if not bus.name_has_owner("org.kde.KWin"):
            return []
    except Exception:
        return []
    svc = "org.xrtopor.winshot.p%d" % os.getpid()
    loop = GLib.MainLoop()
    result = []

    class Sink(dbus.service.Object):
        @dbus.service.method(svc, in_signature="s")
        def Windows(self, s):
            result.extend(json.loads(s))
            loop.quit()

    name = dbus.service.BusName(svc, bus)
    sink = Sink(bus, "/")
    plugin = "xrtopor_winshot_%d" % os.getpid()
    with tempfile.TemporaryDirectory() as d:
        path = os.path.join(d, "enum.js")
        with open(path, "w") as f:
            f.write(KWIN_ENUM_SCRIPT % {"svc": svc})
        sc = bus.get_object("org.kde.KWin", "/Scripting")
        try:
            sc.loadScript(path, plugin, dbus_interface="org.kde.kwin.Scripting", signature="ss")
            sc.start(dbus_interface="org.kde.kwin.Scripting")
            GLib.timeout_add(int(timeout * 1000), loop.quit)
            loop.run()
        finally:
            try:
                sc.unloadScript(plugin, dbus_interface="org.kde.kwin.Scripting")
            except Exception:
                pass
    del sink, name
    out = []
    for w in result:
        out.append({"backend": "kwin", "uuid": w["id"], "pid": w["pid"], "caption": w["caption"],
                    "cls": w["cls"], "w": w["w"], "h": w["h"], "minimized": w["minimized"],
                    "viewable": not w["minimized"], "transient": not w["normal"]})
    return out


class KWinNotAuthorized(RuntimeError):
    pass


def kwin_capture(uuid, decoration=False):
    import dbus
    bus = dbus.SessionBus()
    ss = bus.get_object("org.kde.KWin", "/org/kde/KWin/ScreenShot2")
    r, w = os.pipe()
    chunks = []

    def reader():
        while True:
            c = os.read(r, 1 << 20)
            if not c:
                break
            chunks.append(c)

    t = threading.Thread(target=reader, daemon=True)
    t.start()
    opts = {"include-decoration": decoration, "include-cursor": False, "native-resolution": True}
    try:
        meta = ss.CaptureWindow(uuid, opts, dbus.types.UnixFd(w), dbus_interface="org.kde.KWin.ScreenShot2",
                                signature="sa{sv}h", timeout=30)
    except dbus.DBusException as e:
        os.close(w)
        if "NoAuthorized" in e.get_dbus_name():
            raise KWinNotAuthorized("KWin не разрешает этому процессу снимать окна (см. --kwin-auth-hint)")
        raise RuntimeError("KWin ScreenShot2: %s: %s" % (e.get_dbus_name(), e.get_dbus_message()))
    os.close(w)
    t.join(30)
    os.close(r)
    data = b"".join(chunks)
    width, height, stride, fmt = int(meta["width"]), int(meta["height"]), int(meta["stride"]), int(meta["format"])
    # QImage::Format: 4 RGB32, 5 ARGB32, 6 ARGB32_Premultiplied (little-endian → BGR[A])
    raw = {4: ("RGB", "BGRX"), 5: ("RGBA", "BGRA"), 6: ("RGBA", "BGRa")}.get(fmt)
    if raw is None:
        raise RuntimeError("KWin вернул неподдерживаемый формат QImage %d" % fmt)
    if len(data) < stride * height:
        raise RuntimeError("KWin прислал %d байт, ожидалось %d" % (len(data), stride * height))
    return Image.frombuffer(raw[0], (width, height), data, "raw", raw[1], stride, 1).copy()


# ----------------------------------------------------------------------------- выбор окна

def proc_names(pid):
    names = set()
    try:
        with open("/proc/%d/comm" % pid) as f:
            names.add(f.read().strip())
        with open("/proc/%d/cmdline" % pid, "rb") as f:
            argv0 = f.read().split(b"\0")[0].decode("utf-8", "replace")
        names.add(argv0)
        names.add(re.split(r"[\\/]", argv0)[-1])  # для Wine: C:\...\TopoR.exe → TopoR.exe
    except OSError:
        pass
    return names


def match_rank(win, args):
    """None — не подходит; иначе ранг: 0 имя процесса/класс целиком, 1 их подстрока, 2 подстрока заголовка."""
    if args.id is not None:
        return 0 if win.get("xid") == args.id else None
    if args.pid is not None and win["pid"] != args.pid:
        return None
    if not args.name:
        return 0
    needle = args.name.lower()
    ids = {n.lower() for n in proc_names(win["pid"]) | {win["cls"]} if n}
    if needle in ids or needle in {re.sub(r"\.exe$", "", n) for n in ids}:
        return 0
    if any(needle in n for n in ids):
        return 1
    if needle in win["caption"].lower():
        return 2
    return None


def select(allwins, args):
    """Окна лучшего ранга совпадения (чтобы «topor» не ловил Dolphin с «topor» в заголовке)."""
    ranked = [(r, w) for w in allwins if (r := match_rank(w, args)) is not None]
    if not ranked:
        return []
    best = min(r for r, _ in ranked)
    return [w for r, w in ranked if r == best]


def pick(cands):
    """Главное окно: обычные (не transient) крупнее 16 px, самое большое по площади."""
    real = [w for w in cands if w["w"] * w["h"] >= 16 * 16]
    normal = [w for w in real if not w["transient"]] or real or cands
    return max(normal, key=lambda w: w["w"] * w["h"])


def safe_name(s):
    s = re.sub(r"[^\w.-]+", "_", s, flags=re.UNICODE).strip("_")
    return s[:60] or "window"


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0], epilog=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    sel = ap.add_argument_group("выбор окна")
    sel.add_argument("--pid", type=int, help="pid процесса-владельца окна")
    sel.add_argument("--name", help="подстрока заголовка / WM_CLASS / имени процесса")
    sel.add_argument("--id", type=lambda s: int(s, 0), help="X11 window id (0x...)")
    sel.add_argument("--all", action="store_true", help="снять все подходящие окна, а не только главное")
    ap.add_argument("-o", "--output", help="файл PNG (по умолчанию winshot-<имя>.png; с --all — суффикс id)")
    ap.add_argument("--list", action="store_true", help="перечислить окна и выйти")
    ap.add_argument("--delay", type=float, default=0.0, help="пауза перед снимком, с")
    ap.add_argument("--settle", type=float, default=0.5, help="пауза на перерисовку после развёртывания, с")
    ap.add_argument("--map-timeout", type=float, default=3.0, help="сколько ждать появления свёрнутого окна, с")
    ap.add_argument("--keep-restored", action="store_true", help="не сворачивать окно обратно")
    ap.add_argument("--decoration", action="store_true", help="KWin-путь: включить рамку окна")
    ap.add_argument("--backend", choices=["auto", "x11", "kwin"], default="auto")
    ap.add_argument("--kwin-auth-hint", action="store_true", help="показать, как разрешить KWin-путь, и выйти")
    args = ap.parse_args()

    if args.kwin_auth_hint:
        print(KWIN_AUTH_HINT % {"exe": os.path.realpath("/proc/self/exe")})
        return 0

    x = None
    xwins = []
    if args.backend in ("auto", "x11"):
        try:
            x = X11()
            xwins = x.windows()
        except Exception as e:
            if args.backend == "x11":
                raise
            print("x11: %s" % e, file=sys.stderr)
    kwins = []
    if args.backend in ("auto", "kwin"):
        kwins = kwin_windows()
        # KWin видит и X11-окна; их снимаем X11-путём, оставляем только нативные Wayland
        seen = {(w["pid"], w["caption"]) for w in xwins}
        kwins = [w for w in kwins if (w["pid"], w["caption"]) not in seen]
    allwins = xwins + kwins

    if args.list:
        print("%-10s %-8s %-9s %-24s %-11s %s" % ("id", "pid", "size", "class", "state", "caption"))
        for w in allwins:
            wid = "0x%x" % w["xid"] if w["backend"] == "x11" else "wl"
            state = "minimized" if w["minimized"] else ("hidden" if not w["viewable"] else "")
            print("%-10s %-8d %-9s %-24s %-11s %s" % (wid, w["pid"], "%dx%d" % (w["w"], w["h"]),
                                                      w["cls"][:24], state, w["caption"]))
        return 0

    if args.id is None and args.pid is None and not args.name:
        ap.error("укажите --pid, --name или --id (или --list)")

    cands = select(allwins, args)
    if not cands:
        print("окно не найдено (--list покажет доступные)", file=sys.stderr)
        return 1
    if args.all:
        targets = [w for w in cands if w["w"] * w["h"] >= 16 * 16] or cands
    else:
        targets = [pick(cands)]

    if args.delay > 0:
        time.sleep(args.delay)

    rc = 0
    need_hint = False
    for w in targets:
        tag = "0x%x" % w["xid"] if w["backend"] == "x11" else w["uuid"].strip("{}")[:8]
        try:
            if w["backend"] == "x11":
                img = x11_capture(x, w["xid"], args.settle, args.map_timeout, args.keep_restored)
            else:
                img = kwin_capture(w["uuid"], args.decoration)
        except RuntimeError as e:
            print("%s [%s]: %s" % (w["caption"] or w["cls"], tag, e), file=sys.stderr)
            need_hint |= isinstance(e, KWinNotAuthorized)
            rc = 1
            continue
        if args.output and not args.all:
            out = args.output
        else:
            base = args.output[:-4] if args.output and args.output.lower().endswith(".png") else (
                args.output or "winshot-" + safe_name(w["caption"] or w["cls"] or str(w["pid"])))
            out = "%s-%s.png" % (base, tag) if args.all else base + ".png"
        img.save(out)
        print("%s  %dx%d  %s%s" % (out, img.width, img.height, w["caption"] or w["cls"],
                                   "  (было свёрнуто)" if w["minimized"] else ""))
    if need_hint:
        print("\n" + KWIN_AUTH_HINT % {"exe": os.path.realpath("/proc/self/exe")}, file=sys.stderr)
    if x:
        x.close()
    return rc


if __name__ == "__main__":
    sys.exit(main())
