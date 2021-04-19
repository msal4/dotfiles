# My dotfiles

- Clone into home
    ```bash
    git clone https://github.com/msal4/dotfiles.git $HOME/dotfiles
    ```

- Symlink the needed config
    ```bash
    ln -nfs $HOME/dotfiles/vim $HOME/.vim
    ```
**Note:** don't use relative paths.

Issues:
- At the time of writing this omnisharp doesn't support arm so to solve that you'd need to install it manually like this:
    ```bash
    arch -x86_64 /bin/sh '/Users/msal/dotfiles/vim/plugged/omnisharp-vim/installer/omnisharp-manager.sh'   -l '/Users/msal/.cache/omnisharp-vim/omnisharp-roslyn'
    ```
