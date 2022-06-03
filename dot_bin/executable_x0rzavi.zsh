# Modern UNIX
#
# bat
# exa
# dust
# duf
# gdu
# dog
# ripgrep
# git-delta
# sd
# fd
# zoxide
# procs
# fzf

# Export environment variables.
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme Dracula'"
export FZF_DEFAULT_OPTS='--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# Extend PATH.
path=(~/.local/bin ~/.bin $path)

# Export environment variables.
export MICRO_TRUECOLOR=1
export EDITOR="code --wait"
export GOBIN=$HOME/.bin
#export QT_QPA_PLATFORM=wayland
#export MOZ_ENABLE_WAYLAND=1
#export MOZ_WEBRENDER=1
#export XDG_CURRENT_DESKTOP=sway
#export GTK_USE_PORTAL=0

# Source additional local files if they exist.
source $HOME/.bin/chezmoi.zsh

# Define aliases.
alias ls='exa --icons'
alias ll='exa --icons --long --all --group --git'
alias cat='bat --theme Dracula'
alias diff='delta'
alias du='dust --reverse'
alias df='duf'
alias find='fd --hidden'
alias grep='rg --pretty --hidden'
alias ps='procs'
alias ncdu='gdu'
alias dig='dog'

# Zoxide
eval "$(zoxide init --cmd cd zsh)"

# Rootless Docker
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt hist_ignore_all_dups	# prevent history from recording duplicated entries
setopt hist_ignore_space	# prevent particular entries from being recorded into a history by preceding them with at least one space
