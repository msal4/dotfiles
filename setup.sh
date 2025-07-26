#/bin/bash

eval "$(/opt/homebrew/bin/brew shellenv)"

ln -nfs $(pwd)/vim $HOME/.vim
mkdir -p .config/nvim
ln -nfs $(pwd)/nvim $HOME/.config/nvim
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/dotfiles/zprofile $HOME/.zprofile
