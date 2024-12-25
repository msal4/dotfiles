#/bin/bash

ln -nfs $HOME/dotfiles/vim $HOME/.vim
mkdir -p $HOME/dotfiles/.config/nvim
ln -nfs $HOME/dotfiles/nvim $HOME/.config/nvim
ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
