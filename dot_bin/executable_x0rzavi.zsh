## Conveniences for zsh

# Modern UNIX tools
#
# bat (https://github.com/sharkdp/bat) [cat]
# bat-extras (https://github.com/eth-p/bat-extras) [grep/man/less/watch/diff]
# exa (https://github.com/ogham/exa) [ls]
# dust (https://github.com/bootandy/dust) [du]
# duf (https://github.com/muesli/duf) [df]
# bottom (https://github.com/ClementTsang/bottom) [top]
# btop (https://github.com/aristocratos/btop) [top]
# gdu (https://github.com/dundee/gdu) [ncdu]
# doggo (https://github.com/mr-karan/doggo) [dig]
# ripgrep (https://github.com/BurntSushi/ripgrep) [grep]
# ripgrep-all (https://github.com/phiresky/ripgrep-all) [grep]
# git-delta (https://github.com/dandavison/delta) [diff]
# sd (https://github.com/chmln/sd) [sed]
# fd (https://github.com/sharkdp/fd) [find]
# zoxide (https://github.com/ajeetdsouza/zoxide) [cd]
# plocate (https://plocate.sesse.net) [locate]
# procs (https://github.com/dalance/procs) [ps]
# gping (https://github.com/orf/gping) [ping]
# fzf (https://github.com/junegunn/fzf)
# entr (https://github.com/eradman/entr)
# moreutils (https://joeyh.name/code/moreutils)
# cheat (https://github.com/cheat/cheat)
# tldr (https://github.com/tldr-pages/tldr)

# Export environment variables.
export MICRO_TRUECOLOR=1
export EDITOR="code-insiders --wait"
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
alias find='fd --hidden --no-ignore --follow'
alias sed='sd'
alias ps='procs'
alias dig='doggo'
alias ping='gping'

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt hist_ignore_all_dups	# prevent history from recording duplicated entries
setopt hist_ignore_space	# prevent particular entries from being recorded into a history by preceding them with at least one space

# Rootless Docker
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/x0rzavi/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
