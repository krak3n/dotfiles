# dotfiles

My dotfiles are managed using a `git --bare repository` with the working tree set to the `$HOME`
directory. This means files can be added where they are without the need for symbolic linking.

## Dependencies

Before installing ensure the following OS level dependencies are installed.

* `git`
* `zsh`
* `ohmyzsh`

## Installation

Run the following `git` commands:

```
git clone --bare https://github.com/krak3n/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
```
