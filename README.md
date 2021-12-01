Before running ./install to run the DotBot installer be sure to install brew and vim-plug

Brew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile    
eval "$(/opt/homebrew/bin/brew shellenv)"

Vim-Plug:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Remove any configurations on the system in the following directories:

~/.aliases
~/.functions
~/.zshrc
~/.tmux.conf
~/.config/nvim/init.vim
