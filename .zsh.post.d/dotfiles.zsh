alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

untracked=$(dots config --get --local status.showUntrackedFiles)

if [[ $untracked != "no" ]]; then
	dots config --local status.showUntrackedFiles no
fi
