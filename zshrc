export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*}"'
export GOPATH=$(go env GOPATH)
export PATH=$HOME/dev/flutter/bin:$GOPATH/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/13/bin:$PATH
