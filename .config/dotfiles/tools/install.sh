#!/bin/sh

CWD=$(pwd)

echo "Changing directory to $HOME"
cd $HOME

while true; do
    read -p "Backup that would be overwritten by checkout? [Y/n]: " yn
    case $yn in
        [Yy]* ) BACKUP=1; break;;
        [Nn]* ) BACKUP=0; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Cloning repository to $HOME/.dotfiles"
git clone --bare https://github.com/krak3n/dotfiles.git $HOME/.dotfiles

if [[ $BACKUP == 1 ]]; then
	echo "Backing up local files to .dotfiles.bk"

	mkdir $HOME/.dotfiles.bk
	git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dotfiles.bk/{}
fi

if [[ $BACKUP == 0 ]]; then
	git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm -rf {}
fi

git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no

if [ "$(uname)" == "Darwin" ]; then

  echo "Installing xcode-select --install"
  sudo xcode-select --install

  if [[ $(command -v brew) == "" ]]; then
    echo "Installing Hombrew on macOS"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo "Installing Dependencies using Homebrew on macOS"

  brew bundle --global
fi

echo "Installing g Golang Version Manager"

export GOROOT=~/.local/share/go/root
export GOPATH=~/.local/share/go/path

curl -sSL https://git.io/g-install | sh -s

unset GOROOT
unset GOPATH

echo "Restarting zsh Shell"

exec zsh

echo "Installation Complete"

echo "Changing directory back to $CWD"
cd $CWD
