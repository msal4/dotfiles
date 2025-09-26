#/bin/bash

mkdir -p .config/nvim
ln -nfs $(pwd)/nvim $HOME/.config/nvim
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/zshrc $HOME/.zshrc
