# My dotfiles

- Clone into home
    ```bash
    git clone https://github.com/msal4/dotfiles.git $HOME/dotfiles
    ```

- Symlink the needed config
    ```bash
    ln -nfs $HOME/dotfiles/vim $HOME/.vim
    ln -s $HOME/dotfiles/tmux.conf $HOME/.tmux.conf
    ```
**Note:** don't use relative paths.
