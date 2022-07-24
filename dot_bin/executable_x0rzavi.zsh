#### CONVENIENCES FOR ZSH

#### MODERN UNIX TOOLS
# <tool name> <link> 											<replaces> <gentoo ebuild>
#
# bat (https://github.com/sharkdp/bat) 							[cat] [sys-apps/bat]
# bat-extras (https://github.com/eth-p/bat-extras) 				[grep/man/less/watch/diff]
# exa (https://github.com/ogham/exa) 							[ls] [sys-apps/exa]
# dust (https://github.com/bootandy/dust) 						[du] [sys-apps/dust]
# duf (https://github.com/muesli/duf) 							[df] [sys-fs/duf]
# bottom (https://github.com/ClementTsang/bottom) 				[top] [sys-process/bottom]
# btop (https://github.com/aristocratos/btop) 					[top] [sys-process/btop]
# gdu (https://github.com/dundee/gdu) 							[ncdu] [sys-fs/gdu]
# doggo (https://github.com/mr-karan/doggo) 					[dig] [net-dns/doggo]
# ripgrep (https://github.com/BurntSushi/ripgrep) 				[grep] [sys-apps/ripgrep]
# ripgrep-all (https://github.com/phiresky/ripgrep-all) 		[grep] [sys-apps/ripgrep-all]
# git-delta (https://github.com/dandavison/delta) 				[diff] [dev-util/git-delta]
# sd (https://github.com/chmln/sd) 								[sed] [sys-apps/sd]
# fd (https://github.com/sharkdp/fd) 							[find] [sys-apps/fd]
# zoxide (https://github.com/ajeetdsouza/zoxide) 				[cd] [app-shells/zoxide]
# plocate (https://plocate.sesse.net) 							[locate] [sys-apps/plocate]
# procs (https://github.com/dalance/procs) 						[ps] [sys-apps/procs]
# gping (https://github.com/orf/gping) 							[ping] [net-misc/gping]
# fzf (https://github.com/junegunn/fzf) 						[misc] [app-shells/fzf]
# entr (https://github.com/eradman/entr) 						[misc] [app-admin/entr]
# moreutils (https://joeyh.name/code/moreutils) 				[misc] [sys-apps/moreutils]
# cheat (https://github.com/cheat/cheat) 						[misc] [app-misc/cheat]
# tldr (https://github.com/tldr-pages/tldr) 					[misc] [app-text/tldr]

#### DEFINE ALIASES
alias cat='bat'
#alias grep='batgrep --hidden'
alias grep='rg --pretty --hidden'
#alias man='batman'
#alias watch='batwatch --command'
#alias diff='batdiff'
alias diff='delta'
alias ls='exa --icons'
alias ll='exa --icons --long --all --group --git --group-directories-first'
alias du='dust --apparent-size'
alias df='duf'
alias ncdu='gdu --show-apparent-size --show-relative-size --max-cores 2'
alias find='fd --hidden --no-ignore --follow'
alias sed='sd'
alias ps='procs'
alias dig='doggo'
alias ping='gping'

#### SET SHELL OPTIONS: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt HIST_IGNORE_ALL_DUPS	# prevent history from recording duplicated entries even if they are not adjacent
setopt HIST_IGNORE_SPACE	# prevent particular entries from being recorded into a history by preceding them with at least one space
setopt HIST_ALLOW_CLOBBER	# save clobber overrides as is
setopt HIST_REDUCE_BLANKS	# tidy up the line when it is entered into the history by removing any excess blanks
setopt HIST_NO_STORE		# don't store history or fc commands
setopt NO_CLOBBER			# don't allow overwriting files generally ( use >| to override )
setopt AUTO_CD				# check to see if it's actually a directory. If it is, change to that directory
#setopt CORRECT				# enable autocorrection

#### ROOTLESS DOCKER
#export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

#### HEROKU AUTOCOMPLETE SETUP
#HEROKU_AC_ZSH_SETUP_PATH=/home/x0rzavi/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

#### HISTORY
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

#### HISTORY BASED AUTOCOMPLETION
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

#### AUTOCOMPLETION
autoload -Uz compinit
compinit
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

#### ZOXIDE
eval "$(zoxide init --cmd cd zsh)"

#### STARSHIP
eval "$(starship init zsh)"

#### SOURCE ADDITIONAL FILES
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
