#
# Oh My ZSH
#

fpath=("$HOME/.completions" $fpath)

[[ -z $precmd_functions ]] && precmd_functions=()

export PATH="/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
export EDITOR='nvim'
export FZF_BASE=$HOME/.fzf
export CLOUDSDK_HOME=$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

###################
# Pre run scripts
###################

if [ -d $HOME/.zsh.pre.d ]; then
	for file in $HOME/.zsh.pre.d/**/*(.); do source $file; done
fi

###################
# Plugins
###################

# Zgen Plugin Manager
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  zgen oh-my-zsh

	# SSH
  zgen oh-my-zsh plugins/ssh-agent

	# UX
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/direnv
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/fzf
  zgen load chrissicool/zsh-256color

	# Platforms / Utils
  zgen oh-my-zsh plugins/aws
  zgen oh-my-zsh plugins/gcloud
  zgen load krak3n/zsh-gcloud-prompt
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/helm
  zgen oh-my-zsh plugins/terraform
  zgen load superbrothers/zsh-kubectl-prompt

	# Languages
  zgen oh-my-zsh plugins/golang

	# Theme
  zgen load krak3n/zsh-theme krak3n.zsh-theme

  zgen save
fi

#
# Plugin Agnostic Settings
#

autoload -U colors; colors
autoload -Uz url-quote-magic

zle -N self-insert url-quote-magic

autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Go Version Manager
export GOROOT="$HOME/.local/share/go/root"
export GOPATH="$HOME/.local/share/go/path"

export PATH="$GOPATH/bin:$PATH"

alias g="$GOPATH/bin/g"

# # Copy / Paste integration aliases
if (( $+commands[xclip] )); then
	alias cc='xclip -selection clipboard'
	alias cv='xclip -selection clipboard -o'
fi

# Copy / Paste integration aliases
if (( $+commands[pbcopy] )); then
	alias cc='pbcopy'
fi

if (( $+commands[pbpaste] )); then
	alias cv='pbpaste'
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# Pulumi
#

# add Pulumi to the PATH
if [ -d $HOME/.pulumi/bin ]; then
	export PATH=$PATH:$HOME/.pulumi/bin
fi

# lua
alias luamake=/Users/chris/.config/nvim/lua-language-server/3rd/luamake/luamake

###################
# Post run scripts
###################

if [ -d $HOME/.zsh.post.d ]; then
	for file in $HOME/.zsh.post.d/**/*(.); do source $file; done
fi
