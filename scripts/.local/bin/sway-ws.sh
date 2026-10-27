#!/bin/bash
# Per-monitor workspaces for sway, like niri: Super+N goes to workspace N *on the focused monitor*.
# Workspaces are named "N:<output>" (e.g. "2:eDP-1"), so every monitor has its own 1-9.
# The Noctalia bar shows just the number. Each monitor's bar lists only its own workspaces.
#   sway-ws.sh focus N   -> go to workspace N on this monitor
#   sway-ws.sh move N    -> send the focused window to workspace N on this monitor, and follow it
#   sway-ws.sh init      -> at login, put workspace 1 on every monitor
set -eu
out="$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')"
case "${1:-}" in
  focus) swaymsg "workspace \"$2:$out\"" >/dev/null ;;
  move)  swaymsg "move container to workspace \"$2:$out\"; workspace \"$2:$out\"" >/dev/null ;;
  init)
    for o in $(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name'); do
      swaymsg "focus output $o; workspace \"1:$o\"" >/dev/null
    done
    swaymsg "focus output eDP-1" >/dev/null 2>&1 || true ;;
esac
