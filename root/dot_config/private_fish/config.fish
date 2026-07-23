# environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim

if status is-interactive
    atuin init fish | source

    # https://github.com/atuinsh/atuin/issues/1302
    function _atuin_postexec --on-event fish_postexec
        set -l s $status
        if test -n "$ATUIN_HISTORY_ID"
            ATUIN_LOG=error setsid -f atuin history end --exit $s -- $ATUIN_HISTORY_ID &>/dev/null
        end
        set --erase ATUIN_HISTORY_ID
    end
end
