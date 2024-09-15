source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
  :
end

function fetch
  fastfetch -l arch
end

# extend PATH
fish_add_path ~/.bin ~/.local/bin/

# npm configuration
set -gx npm_config_prefix "$HOME/.local"

# rsync as cp/mv alternative
alias cpr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1"
alias mvr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-f
iles"

# command replacements
alias nv="nvim"
alias nvk='NVIM_APPNAME="nvim-kickstart" nvim'
# function cat; bat $argv 2> /dev/null || command cat $argv; end
# function grep; batgrep --ignore-case --hidden $argv 2> /dev/null || command grep --ignore-case $argv; end
# function man; batman $argv 2> /dev/null || command man $argv; end
# function watch; batwatch --interval 1 --command $argv 2> /dev/null || command watch --interval 1 $argv; end
# function diff; batdiff --delta $argv 2> /dev/null || command diff $argv; end
# function ls; exa --icons $argv 2> /dev/null || command ls $argv; end
# function ll; exa --icons --long --all --group --git --group-directories-first $argv 2> /dev/null || command ls --almost-all --human-readable -l $argv; end
# function du; dust $argv 2> /dev/null || command du --human-readable --summarize $argv; end
# function df; duf $argv 2> /dev/null || command df --human-readable $argv; end
# function ncdu; gdu --show-relative-size --max-cores 4 $argv 2> /dev/null || command ncdu $argv; end
# function find; fd --hidden --no-ignore --follow $argv 2> /dev/null || command find $argv; end
# function sed; sd $argv 2> /dev/null || command sed $argv; end
# function ps; procs $argv 2> /dev/null || command ps axu $argv; end
# function dig; doggo $argv 2> /dev/null || command dig $argv; end
# function ping; gping $argv 2> /dev/null || command ping $argv; end

if status --is-interactive
  DISPLAY=:0 SSH_ASKPASS="$HOME/.ssh/.sshkey" keychain --eval --quiet --quick id_ed25519 | source
  set -gx GPG_TTY $(tty)
  printf 'hack' | gpg --clearsign --pinentry-mode loopback --passphrase-file="$HOME/.gnupg/.gpgkey" > /dev/null
end

zoxide init fish --cmd cd | source
