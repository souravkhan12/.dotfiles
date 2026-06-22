#!/usr/bin/env sh
# Brightness / volume keys → PipeWire + brightnessctl with Mako OSD (progress + replace).
set -eu

# Same notification "slot" per category so rapid keypresses update one toast.
osd_notify() {
  _id=$1
  _title=$2
  _pct=$3
  _body=${4:-}
  _icon=${5:-}
  if [ "$_pct" -lt 0 ]; then _pct=0; fi
  if [ "$_pct" -gt 100 ]; then _pct=100; fi
  if [ -n "$_icon" ]; then
    notify-send -a "Hypr OSD" -t 900 -i "$_icon" \
      -h "string:x-canonical-private-synchronous:${_id}" \
      -h "int:value:${_pct}" \
      "$_title" "${_body:-${_pct}%}"
  else
    notify-send -a "Hypr OSD" -t 900 \
      -h "string:x-canonical-private-synchronous:${_id}" \
      -h "int:value:${_pct}" \
      "$_title" "${_body:-${_pct}%}"
  fi
}

brightness_pct() {
  cur=$(brightnessctl get 2>/dev/null || echo 0)
  max=$(brightnessctl max 2>/dev/null || echo 1)
  if [ "$max" -eq 0 ]; then max=1; fi
  echo $((100 * cur / max))
}

# Papirus / notification-* names match mako icon-path
brightness_icon() {
  pct=$1
  if [ "$pct" -le 0 ]; then echo notification-display-brightness-off; return; fi
  if [ "$pct" -le 25 ]; then echo notification-display-brightness-low; return; fi
  if [ "$pct" -le 50 ]; then echo notification-display-brightness-medium; return; fi
  if [ "$pct" -le 75 ]; then echo notification-display-brightness-high; return; fi
  echo notification-display-brightness-full
}

volume_line() {
  wpctl get-volume "${1:-@DEFAULT_AUDIO_SINK@}" 2>/dev/null || echo "Volume: 0"
}

volume_icon() {
  line=$1
  echo "$line" | grep -q MUTED && echo notification-audio-volume-muted && return
  pct=$(echo "$line" | awk '{print int($2 * 100 + 0.5)}')
  if [ "$pct" -eq 0 ]; then echo notification-audio-volume-muted; return; fi
  if [ "$pct" -lt 34 ]; then echo notification-audio-volume-low; return; fi
  if [ "$pct" -lt 67 ]; then echo notification-audio-volume-medium; return; fi
  echo notification-audio-volume-high
}

case "${1:-}" in
brightness-up)
  brightnessctl set +5% >/dev/null 2>&1 || exit 0
  b=$(brightness_pct)
  osd_notify hypr-brightness "Brightness" "$b" "" "$(brightness_icon "$b")"
  ;;
brightness-down)
  brightnessctl set 5%- >/dev/null 2>&1 || exit 0
  b=$(brightness_pct)
  osd_notify hypr-brightness "Brightness" "$b" "" "$(brightness_icon "$b")"
  ;;
volume-up)
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+ >/dev/null 2>&1 || exit 0
  line=$(volume_line @DEFAULT_AUDIO_SINK@)
  if echo "$line" | grep -q MUTED; then
    osd_notify hypr-volume "Volume" 0 "Muted" "$(volume_icon "$line")"
  else
    pct=$(echo "$line" | awk '{print int($2 * 100 + 0.5)}')
    osd_notify hypr-volume "Volume" "$pct" "" "$(volume_icon "$line")"
  fi
  ;;
volume-down)
  wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%- >/dev/null 2>&1 || exit 0
  line=$(volume_line @DEFAULT_AUDIO_SINK@)
  if echo "$line" | grep -q MUTED; then
    osd_notify hypr-volume "Volume" 0 "Muted" "$(volume_icon "$line")"
  else
    pct=$(echo "$line" | awk '{print int($2 * 100 + 0.5)}')
    osd_notify hypr-volume "Volume" "$pct" "" "$(volume_icon "$line")"
  fi
  ;;
mute)
  wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle >/dev/null 2>&1 || exit 0
  line=$(volume_line @DEFAULT_AUDIO_SINK@)
  if echo "$line" | grep -q MUTED; then
    osd_notify hypr-volume "Volume" 0 "Muted" audio-volume-muted
  else
    pct=$(echo "$line" | awk '{print int($2 * 100 + 0.5)}')
    osd_notify hypr-volume "Volume" "$pct" "Sound on" "$(volume_icon "$line")"
  fi
  ;;
mic-mute)
  wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle >/dev/null 2>&1 || exit 0
  line=$(volume_line @DEFAULT_AUDIO_SOURCE@)
  if echo "$line" | grep -q MUTED; then
    osd_notify hypr-mic "Microphone" 0 "Muted" notification-microphone-sensitivity-muted
  else
    pct=$(echo "$line" | awk '{print int($2 * 100 + 0.5)}')
    osd_notify hypr-mic "Microphone" "$pct" "Live" notification-microphone-sensitivity-high
  fi
  ;;
*)
  echo "usage: $0 brightness-up|brightness-down|volume-up|volume-down|mute|mic-mute" >&2
  exit 1
  ;;
esac
