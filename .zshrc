# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

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
