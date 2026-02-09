PROMPT='%F{green}%n@%m%f %F{blue}%~%f $ '
RPROMPT='%(?.%F{green}.%F{red})%(?..[%?]) %T%f'

bindkey -v

alias vim=nvim

bindkey fd vi-cmd-mode

export PATH="$HOME/.local/bin:$PATH"

if [ -e /opt/nvim-linu-x86_x64/bin/nvim ]; then
  export PATH="/opt/nvim-linux-x86_64/bin:$PATH"
fi

export TERM=xterm-256color

export PATH=~/.node_modules/bin:$PATH
export PATH=~/go/bin:$PATH

# opencode
export PATH=$HOME/.opencode/bin:$PATH
export PATH="/home/sal/.bun/bin:$PATH"
