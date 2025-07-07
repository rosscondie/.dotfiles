# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

Depending on your OS:

- Mac use Brew 
- Linux/WSL2 use your package manager (`sudo apt install`, `pacman -S` etc.)

### Tmux Plugin Manager (TPM)

This repo uses [TPM](https://github.com/tmux-plugins/tpm) to manage tmux plugins, including colorschemes and key bindings.

You need to install TPM manually by cloning it to your local tmux plugins directory:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, clone out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/rosscondie/.dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

After stowing tmux config, ensure TPM is intalled and plugins are loaded:

```bash
tmux source-file ~/.tmux.conf
```

Then inside a tmux session press `prefix + I` to install plugins.

Check `.tmux.conf` for the `prefix` key binding. It is usually set to `Ctrl + b` but I find `Ctrl + a` works better for me.
