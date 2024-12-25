bindkey -v
bindkey fd vi-cmd-mode

eval $(/opt/homebrew/bin/brew shellenv)

export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'

alias vim=nvim

export DENO_INSTALL="/Users/ms/.deno"
export PATH="/Users/ms/.deno/bin:$PATH"
