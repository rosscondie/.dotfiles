#!/usr/bin/env python3
# Searchable list of Sway keybindings (like niri's Super+? overlay).
# Read live from ~/.config/sway/config, so it stays up to date when binds change.
import os, re, subprocess

cfg = os.path.expanduser("~/.config/sway/config")
mod = "Super"
nice = [  # (regex on the command, friendly text)
    (r"sway-ws\.sh focus (\d)", r"Go to workspace \1 (this monitor)"),
    (r"sway-ws\.sh move (\d)", r"Move window to workspace \1 and follow"),
    (r"exec alacritty", "Terminal"), (r"exec wofi$", "App launcher"),
    (r"exec firefox", "Firefox"), (r"exec goland", "GoLand"),
    (r"projects-wofi", "Projects picker"), (r"exec swaylock", "Lock screen"),
    (r"launcher \"/emo", "Emoji picker"), (r"panel-toggle clipboard", "Clipboard history"),
    (r"panel-toggle session", "Session menu (log out / reboot)"),
    (r"nightlight-toggle", "Night light"), (r"control-center", "Control center"),
    (r"settings-toggle", "Noctalia settings"),
    (r"window-switcher hold", "Window switcher (hold Alt, tap Tab)"),
    (r"window-switcher$", "Window switcher (all open windows)"), (r"sway-keys", "This list"),
    (r"sway-shot\.sh region", "Screenshot region (save + copy)"),
    (r"sway-shot\.sh edit", "Screenshot region, edit in Gradia"),
    (r"sway-shot\.sh window", "Screenshot focused window (save + copy)"),
    (r"set-volume .*\+", "Volume up"), (r"set-volume .*-$", "Volume down"),
    (r"SINK@ toggle", "Mute"), (r"SOURCE@ toggle", "Mic mute"),
    (r"set \+10%", "Brightness up"), (r"set 10%-", "Brightness down"),
    (r"^kill$", "Close window"), (r"^fullscreen$", "Fullscreen (covers bar)"), (r"layout toggle tabbed split", "Maximize / restore (like niri)"),
    (r"focus next sibling", "Next window / tab"), (r"focus prev sibling", "Previous window / tab"), (r"^floating toggle$", "Float / unfloat window"),
    (r"layout toggle split", "Flip split (side-by-side / stacked)"),
    (r"layout tabbed", "Tabbed layout"), (r"^splitv$", "Next window opens below"),
    (r"^splith$", "Next window opens beside"),
    (r"^focus output (\w+)", r"Focus monitor \1"),
    (r"move container to output (\w+)", r"Move window to monitor \1"),
    (r"^focus (\w+)$", r"Focus window \1"), (r"^move (\w+)$", r"Move window \1"),
    (r"mode \"resize\"", "Resize mode (H/J/K/L, Enter to finish)"),
    (r"^reload$", "Reload Sway config"), (r"swaymsg exit", "Log out of Sway"),
]
rows = []
for line in open(cfg):
    m = re.match(r"\s*bindsym\s+((?:--\S+\s+)*)(\S+)\s+(.*)", line)
    if not m or line.startswith((" ", "\t")):  # skip binds inside the resize mode block
        continue
    key, cmd = m.group(2), m.group(3).strip()
    key = key.replace("$mod", mod).replace("Mod1", "Alt").replace("$left", "H").replace("$right", "L") \
             .replace("$up", "K").replace("$down", "J").replace("XF86", "").replace("+", " + ")
    desc = cmd
    for pat, txt in nice:
        if re.search(pat, cmd):
            desc = re.sub(r".*" + pat + r".*", txt, cmd) if "\\" in txt else txt
            break
    rows.append(f"{key:<28} {desc}")
subprocess.run(["wofi", "--dmenu", "--prompt", "Keybindings", "--insensitive",
                "--width", "900", "--height", "700", "--cache-file", "/dev/null"],
               input="\n".join(rows), text=True)
