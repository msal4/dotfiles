# My dotfiles

## Setup
- Clone into home
    ```bash
    git clone https://github.com/msal4/dotfiles.git $HOME/dotfiles
    ```
- Link dotfiles
    ```bash
     ./setup.sh
    ```
- Or manually by symlinkng the needed config
    ```bash
    ln -nfs $HOME/dotfiles/vim $HOME/.vim
    ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
    ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
    ```
**Note:** don't use relative paths.
