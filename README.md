# My dotfiles

## Setup
- Clone project
    ```bash
    git clone https://github.com/msal4/dotfiles.git $HOME/dotfiles
    ```
- Ensure you're in the dotfiles directory for the shell script to work properly
    ```bash
    cd dotfiles
    ```
- Link dotfiles
    ```bash
     ./setup
    ```
- Or manually by symlinkng the needed config
    ```bash
    ln -nfs $(pwd)/dotfiles/vim $HOME/.vim
    mkdir -p .config/nvim
    ln -nfs $(pwd)/dotfiles/nvim $HOME/.config/nvim
    ln -s $(pwd)/dotfiles/tmux.conf $HOME/.tmux.conf
    ln -s $(pwd)/dotfiles/zshrc $HOME/.zshrc
    ```
**Note:** don't use relative paths.
