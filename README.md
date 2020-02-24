# dotfiles

My dotfiles are managed using a `git --bare repository` with the working tree set to the `$HOME`
directory. This means files can be added where they are without the need for symbolic linking.

## Dependencies

Before installing ensure the following OS level dependencies are installed.

* `git`
* `zsh`
* `ohmyzsh` with `zgen`
* `tmux` with `tpm`
* `neovim` with `vim-plug`

## Installation

Run one of the following commnads on your terminal:

### wget

```
sh -c "$(wget -O- https://raw.githubusercontent.com/krak3n/dotfiles/master/.config/dotfiles/tools/install.sh)"
```

### curl

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/krak3n/dotfiles/master/.config/dotfiles/tools/install.sh)"
```
