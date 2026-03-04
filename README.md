# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

Depending on your OS:

- Mac use Brew 
- Linux/WSL2 use your package manager (`sudo apt install`, `pacman -S` etc.)

### Git

```bash
brew install git
```

### Stow

```bash
brew install stow
```

## Installation

First, clone out the dotfiles repo in your $HOME directory using git

```bash
git clone https://github.com/rosscondie/.dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks

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
