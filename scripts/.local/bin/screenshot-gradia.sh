#!/bin/bash
FILE=$(mktemp /tmp/screenshot-XXXXXX.png)
grim -g "$(slurp)" "$FILE" && flatpak run be.alexandervanhee.gradia "$FILE"
