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
fish_add_path ~/.local/bin/

# npm configuration
set -gx npm_config_prefix "$HOME/.local"

# rsync as cp/mv alternative
alias cpr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1"
alias mvr="rsync --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-f
iles"
alias nv="nvim"

if status --is-interactive
    DISPLAY=:0 SSH_ASKPASS="$HOME/.ssh/.sshkey" keychain --eval --quiet --quick id_ed25519 | source
    printf 'hack' | gpg --clearsign --pinentry-mode loopback --passphrase-file="$HOME/.gnupg/.gpgkey" > /dev/null
end
