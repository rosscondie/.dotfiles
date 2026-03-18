#!/bin/bash
set -eu

terminal="alacritty"

# Find all directories recursively under ~/dev
configs="$(find "$HOME/dev" -mindepth 1 -maxdepth 2 -type d -printf '%P\n' 2>/dev/null)"
[ -n "$configs" ] || exit 0

# Pick a repo using Wofi
chosen="$(printf '%s\n' "$configs" | wofi --dmenu --prompt 'Projects:' --insensitive)"
[ -n "$chosen" ] || exit 0

dir="$HOME/dev/$chosen"

# Launch terminal with tmux session
$terminal -e tmux new-session -As "$chosen" -c "$dir" &
