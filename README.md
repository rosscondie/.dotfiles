# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

Depending on OS.

Mac use Brew or Linux/WSL2 use whatever package manager you have `sudo apt install`, `pacman -S` etc...

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/rosscondie/.dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
