PROMPT='%F{green}%n@%m%f %F{blue}%~%f $ '
RPROMPT='%(?.%F{green}.%F{red})%(?..[%?]) %T%f'

bindkey -v

alias vim=nvim

bindkey fd vi-cmd-mode

export PATH="$HOME/.local/bin:$PATH"

if [ -e /opt/nvim-linux-x86_x64/bin/nvim ]; then
  export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
fi

export TERM=xterm-256color

export PATH=~/.node_modules/bin:$PATH
export PATH=~/go/bin:$PATH
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

export HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

alias icat="kitten icat"

export GPG_TTY=$(tty)

[[ -f ~/.env_vars ]] && source ~/.env_vars
