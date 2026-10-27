#!/bin/bash
# Screenshots for sway (same behaviour as the niri binds).
#   sway-shot.sh region   -> pick an area, save + copy to clipboard
#   sway-shot.sh edit     -> pick an area, save + open in Gradia
#   sway-shot.sh window   -> focused window, save + copy
#   sway-shot.sh freeze   -> focused monitor, no slurp (keeps hover tooltips), open in Gradia
set -eu
exec >>"$HOME/.cache/sway-shot.log" 2>&1
echo "$(date "+%F %T") sway-shot.sh $*"
dir="$HOME/Pictures/Screenshots"
mkdir -p "$dir"
file="$dir/$(date '+%d-%m-%Y %H-%M-%S').png"
case "${1:-region}" in
  region) geom="$(slurp)" ;;
  edit)   geom="$(slurp)" ;;
  window) geom="$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" ;;
  freeze) geom="" ;;   # whole focused monitor, no slurp, so hover tooltips survive
esac
if [ -n "$geom" ]; then
  grim -g "$geom" "$file"
else
  grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused).name')" "$file"
fi
if [ "${1:-region}" = edit ] || [ "${1:-region}" = freeze ]; then
  flatpak run be.alexandervanhee.gradia "$file"
else
  wl-copy < "$file"
  notify-send -i "$file" "Screenshot saved" "Copied to clipboard" 2>/dev/null || true
fi
