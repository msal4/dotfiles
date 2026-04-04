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
setopt inc_append_history

alias icat="kitten icat"

export GPG_TTY=$(tty)

[[ -f ~/.env_vars ]] && source ~/.env_vars
