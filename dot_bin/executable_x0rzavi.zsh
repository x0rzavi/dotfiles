## Conveniences for zsh

# Modern UNIX tools
#
# bat (https://github.com/sharkdp/bat) [cat]
# bat-extras (https://github.com/eth-p/bat-extras) [grep/man/less/watch/diff]
# entr
# exa (https://github.com/ogham/exa) [ls]
# dust (https://github.com/bootandy/dust) [du]
# duf (https://github.com/muesli/duf) [df]
# bottom (https://github.com/ClementTsang/bottom) [top]
# btop (https://github.com/aristocratos/btop) [top]
# gdu (https://github.com/dundee/gdu) [ncdu]
# dog
# ripgrep
# git-delta
# sd
# fd
# zoxide
# procs
# fzf

# Export environment variables.
export MICRO_TRUECOLOR=1
export EDITOR="code --wait"
export GOBIN=$HOME/.bin

# Extend PATH.
path=(~/.local/bin ~/.bin $path)

# Source additional local files

# Define aliases.
alias cat='bat'
alias grep='batgrep --hidden'
alias man='batman'
alias watch='batwatch --command'
alias diff='batdiff'
alias ls='exa --icons'
alias ll='exa --icons --long --all --group --git --group-directories-first'
alias du='dust --apparent-size'
alias df='duf'
alias ncdu='gdu --show-apparent-size --show-relative-size'

alias find='fd --hidden'
alias ps='procs'
alias dig='dog'

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Rootless Docker
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt hist_ignore_all_dups	# prevent history from recording duplicated entries
setopt hist_ignore_space	# prevent particular entries from being recorded into a history by preceding them with at least one space

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/x0rzavi/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
