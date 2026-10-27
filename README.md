# My dotfiles

This directory contains the dotfiles for my system (Fedora + Sway/Niri, with Noctalia as the shell).

## Requirements

Install with your package manager (`sudo dnf install`, `sudo apt install`, `brew install` etc.)

- **git**
- **stow** - creates the symlinks

### Additional Tools

These tools are used by the configurations in this repo:

#### Desktop
- **Sway** / **Niri** - Wayland compositors
- **Noctalia** - Bar, panels, lock screen and theming
- **Fuzzel** - Application launcher (Wayland)
- **keyd** - Key remapping

#### Terminal & UI
- **Alacritty** / **Foot** - Terminal emulators
- **Nerd Fonts** - Specifically CaskaydiaMono Nerd Font

#### CLI Tools
- **fzf** - Fuzzy finder (plus [fzf-git.sh](https://github.com/junegunn/fzf-git.sh) cloned to `~/fzf-git.sh`)
- **fd** - Better find
- **eza** - Better ls
- **bat** - Better cat
- **zoxide** - Better cd
- **ripgrep** - Better grep
- **oh-my-zsh** - with `zsh-autosuggestions` and `zsh-syntax-highlighting`

## Layout

Each top-level folder is a stow **package**. Inside it, files sit at the same path they should have relative to `$HOME`:

```
.dotfiles/
├── zsh/.zshrc                          -> ~/.zshrc
├── shell/.config/shell/                -> ~/.config/shell/   (secrets + work templates)
├── tmux/.config/tmux/tmux.conf
├── nvim/.config/nvim/
├── alacritty/.config/alacritty/
├── foot/.config/foot/foot.ini
├── fuzzel/.config/fuzzel/fuzzel.ini
├── sway/.config/sway/config
├── niri/.config/niri/config.kdl
├── scripts/.local/bin/                 -> ~/.local/bin/      (tdl, projects launcher, sway helpers)
└── keyd/etc/keyd/default.conf          (not stowed - see keyd below)
```

## Installation

Clone this repository to your $HOME directory:

```bash
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles
```

Then stow the packages you want on this machine:

```bash
stow --no-folding zsh shell tmux nvim alacritty foot fuzzel sway niri scripts
```

- `stow zsh` links just one package, so you can pick what each machine gets
- `stow -D sway` removes a package's links again
- `stow -n -v <package>` is a dry run that shows what would happen
- `--no-folding` links individual files instead of whole folders, so generated files (e.g. Noctalia themes) stay out of the repo

If a config file already exists, stow refuses to overwrite it. To take the existing file **into** the repo and replace it with a link, use `stow --adopt <package>` and check `git diff` afterwards.

### Secrets

Tokens are **not** stored in this repo. `.zshrc` sources `~/.config/shell/secrets.zsh` if it exists, and that file is gitignored.

Work-specific settings (kube configs, private Go module host, VPN helpers) live in `~/.config/shell/work.zsh`, which is also gitignored and sourced if it exists.

On a new machine:

```bash
cp ~/.dotfiles/shell/.config/shell/secrets.zsh.example ~/.config/shell/secrets.zsh
cp ~/.dotfiles/shell/.config/shell/work.zsh.example ~/.config/shell/work.zsh
chmod 600 ~/.config/shell/secrets.zsh ~/.config/shell/work.zsh
# then fill in the values
```

### Noctalia generated files

Noctalia's theme templates write some files next to the configs. These are gitignored:

- `~/.config/fuzzel/themes/noctalia` (included from `fuzzel.ini`)
- `~/.config/sway/noctalia`
- `~/.config/niri/noctalia.kdl`

### Tmux

After stowing tmux config, you need to be in a tmux session:

```bash
tmux new -s new-session
```

Once you source with `tmux source-file ~/.config/tmux/tmux.conf` the changes will apply and you can source any new changes with `prefix + r`

After watching [@tony-btw](https://www.youtube.com/@tony-btw) on YT I decided to go for the minimal tmux config without plugins.

You can find a link [here](https://www.tonybtw.com/tutorial/tmux/) to his setup and keybindings.

## Usage Tips

### Project Launcher Script

The `projects-wofi.sh` script allows you to quickly open projects in tmux sessions using fuzzel.

**Note:** The script is configured to search `~/dev` by default. Edit the script to change this to your preferred projects directory.

**Keybinding:** `Super + P` (already set in the sway and niri configs)

### Tmux Dev Layout (`tdl`)

The `tdl` script opens a pre-configured tmux layout for development:

- **Left (main):** `nvim .`
- **Right (30%):** AI agent (defaults to `claude`)
- **Bottom strip (15%):** spare terminal

**Usage:**
```bash
tdl                                    # opens with claude
tdl aider                              # opens with aider
tdl "aider --model claude-opus-4-5"   # opens with a specific model
```

Detach cleanly from the session with `prefix + d`. Reattach later with `tmux a`.

### keyd

keyd handles low-level key remapping via a systemd service. The config is stored in this repo for reference but cannot be stowed as it lives in `/etc/keyd/` and requires root.

Current mappings:
- `capslock` — acts as `Escape` when tapped, `Control` when held

**Deploy:**
```bash
sudo cp keyd/etc/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
```
