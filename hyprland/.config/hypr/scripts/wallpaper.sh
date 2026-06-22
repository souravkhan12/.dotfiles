#!/bin/sh
# Restarts wallpaper (swaybg or hyprpaper). Called on every config load via `exec =`
# so it also runs after `hyprctl reload` — unlike `exec-once`.

# Fallback image if only swaybg is available (hyprpaper uses hyprpaper.conf).
IMG="/home/skhan/Pictures/wallpapers/milky-way.jpg"

pkill -x swaybg 2>/dev/null
pkill -x hyprpaper 2>/dev/null

test -f "$IMG" || exit 0

# Prefer hyprpaper so ~/.config/hypr/hyprpaper.conf is used; swaybg ignores it.
if command -v hyprpaper >/dev/null 2>&1; then
  exec hyprpaper
fi

if command -v swaybg >/dev/null 2>&1; then
  exec swaybg -m fill -i "$IMG"
fi

command -v notify-send >/dev/null 2>&1 && \
  notify-send -u normal "Wallpaper" "Install: sudo dnf install swaybg"
exit 0
