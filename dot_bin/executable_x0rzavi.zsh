# Description: User agnostic conveniences for ZSH

# List of modern UNIX tool replacements
# bat (https://github.com/sharkdp/bat)			[cat] [sys-apps/bat]
# bat-extras (https://github.com/eth-p/bat-extras)	[grep/man/less/watch/diff] [sys-apps/bat-extras]
# exa (https://github.com/ogham/exa)			[ls] [sys-apps/exa]
# dust (https://github.com/bootandy/dust)		[du] [sys-apps/dust]
# duf (https://github.com/muesli/duf)			[df] [sys-fs/duf]
# bottom (https://github.com/ClementTsang/bottom)	[top] [sys-process/bottom]
# btop (https://github.com/aristocratos/btop)		[top] [sys-process/btop]
# gdu (https://github.com/dundee/gdu)			[ncdu] [sys-fs/gdu]
# doggo (https://github.com/mr-karan/doggo)		[dig] [net-dns/doggo]
# ripgrep (https://github.com/BurntSushi/ripgrep)	[grep] [sys-apps/ripgrep]
# ripgrep-all (https://github.com/phiresky/ripgrep-all)	[grep] [sys-apps/ripgrep-all]
# git-delta (https://github.com/dandavison/delta)	[diff] [dev-util/git-delta]
# sd (https://github.com/chmln/sd)			[sed] [sys-apps/sd]
# fd (https://github.com/sharkdp/fd)			[find] [sys-apps/fd]
# zoxide (https://github.com/ajeetdsouza/zoxide)	[cd] [app-shells/zoxide]
# plocate (https://plocate.sesse.net)			[locate] [sys-apps/plocate]
# procs (https://github.com/dalance/procs)		[ps] [sys-apps/procs]
# gping (https://github.com/orf/gping)			[ping] [net-misc/gping]
# fzf (https://github.com/junegunn/fzf)			[misc] [app-shells/fzf]
# entr (https://github.com/eradman/entr)		[misc] [app-admin/entr]
# moreutils (https://joeyh.name/code/moreutils)		[misc] [sys-apps/moreutils]
# cheat (https://github.com/cheat/cheat)		[misc] [app-misc/cheat]
# tldr (https://github.com/tldr-pages/tldr)		[misc] [app-text/tldr]

# Variables
x0rzavi_home='/home/x0rzavi'

# Define command aliases
alias cat='bat'
alias grep='batgrep --hidden --pager less'
#alias grep='rg --pretty --hidden'
alias man='batman'
alias watch='batwatch --interval 1 --command'
alias diff='batdiff'
#alias diff='delta'
alias ls='exa --icons'
alias ll='exa --icons --long --all --group --git --group-directories-first'
alias du='dust --apparent-size'
alias df='duf'
alias ncdu='gdu --show-apparent-size --show-relative-size --max-cores 2'
alias find='fd --hidden --no-ignore --follow'
alias sed='sd'
alias ps='procs'
#alias dig='doggo'
alias ping='gping'

# Define general task aliases
alias update='sudo emaint -A sync'
alias upgrade='sudo emerge --update --newuse --deep --with-bdeps=y @world'
alias clean='sudo emerge --depclean ; sudo eclean-dist --deep'
alias perf="sudo ${x0rzavi_home}/.bin/mode.sh -p"

# Set ZSH options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt HIST_IGNORE_ALL_DUPS	# prevent history from recording duplicated entries even if they are not adjacent
setopt HIST_IGNORE_SPACE	# prevent particular entries from being recorded into a history by preceding them with at least one space
setopt HIST_ALLOW_CLOBBER	# save clobber overrides as is
setopt HIST_REDUCE_BLANKS	# tidy up the line when it is entered into the history by removing any excess blanks
setopt HIST_NO_STORE		# don't store history or fc commands
setopt HIST_EXPIRE_DUPS_FIRST	# remove duplicates before unique entries when trimmed
setopt SHARE_HISTORY		# share command history data
setopt INC_APPEND_HISTORY	# append history immediately without waiting for shell to exit
setopt NO_CLOBBER		# don't allow overwriting files generally ( use >| to override )
setopt AUTO_CD			# check to see if it's actually a directory. If it is, change to that directory
#setopt MENU_COMPLETE		# one completion is always inserted completely, then when you hit TAB it changes to the next,
#setopt CORRECT			# enable autocorrection

# ZSH history options
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=2000
SAVEHIST=1000

# History based autocompletion
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keybindings
source ${x0rzavi_home}/.zkbd/keymaps
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" end-of-buffer-or-history
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-beginning-search
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Autocompletion options
autoload -Uz compinit
compinit
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' menu select=3
zstyle ':completion:*' rehash true

# Initialize zoxide
eval "$(zoxide init --cmd cd zsh)"

# Initialize starship
eval "$(starship init zsh)"

# Source additional files
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
