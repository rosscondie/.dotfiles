# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

Depending on your OS:

- Mac use Brew 
- Linux/WSL2 use your package manager (`sudo apt install`, `sudo dnf install`, `pacman -S` etc.)

### Git

```bash
brew install git
```

### Stow

```bash
brew install stow
```

### Additional Tools

These tools are used by the configurations in this repo:

#### Terminal & UI
- **Alacritty** - Terminal emulator
- **Wofi** - Application launcher (Wayland)
- **Nerd Fonts** - Specifically CaskaydiaMono Nerd Font

#### CLI Tools
- **fzf** - Fuzzy finder
- **fd** - Better find
- **eza** - Better ls
- **bat** - Better cat
- **zoxide** - Better cd
- **ripgrep** - Better grep

## Installation

Clone this repository to your $HOME directory:

```bash
git clone <repository-url>
cd dotfiles
```

Then use GNU stow to create symlinks

```bash
stow .
```

### Side Note: ⚠️

*Using GNU Stow with `.local` on WSL2 vs macOS*

On **macOS** running `stow .local` inside the `.dotfiles` directory worked as expected.

However on **Ubuntu/WSL2** it seems GNU Stow treats `.local` as a package folder (i.e. it tries to create `~/bin` instead of `~/.local/bin`).

To get around this run stow with the `--target` option to specify the target directory:

```bash
stow --target=$HOME/.local .local
```

After stowing tmux config, you need to be in a tmux session:

```bash
tmux new -s new-session
```

Once you source with `tmux source-file ~/.config/tmux/tmux.conf` the changes will apply and you can source any new changes with `prefix + r`

After watching [@tony-btw](https://www.youtube.com/@tony-btw) on YT I decided to go for the minimal tmux config without plugins.

You can find a link [here](https://www.tonybtw.com/tutorial/tmux/) to his setup and keybindings.

## Usage Tips

### Project Launcher Script

The `projects-wofi.sh` script allows you to quickly open projects in tmux sessions using wofi.

**Note:** The script is configured to search `~/dev` by default. Edit the script to change this to your preferred projects directory.

**Recommended keybinding:** `Super + P` (or your preferred shortcut)

Set this up in your DE/WM configuration:
- **GNOME:** Settings → Keyboard → Custom Shortcuts
- **KDE:** System Settings → Shortcuts → Custom Shortcuts
- **Hyprland/Sway:** Add to config: `bind = SUPER, P, exec, ~/.local/bin/projects-wofi.sh`
- **i3/bspwm:** Add to config: `bindsym $mod+p exec ~/.local/bin/projects-wofi.sh`
