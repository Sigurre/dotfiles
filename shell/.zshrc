# .zshrc
ZSH_BASE=$HOME/.dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen.zsh # Load Antigen

source ~/.aliases # Source some extra files
source ~/.functions

antigen use oh-my-zsh # Yes, I want to use Oh My ZSH

# Terminal stuff
antigen bundle git
antigen bundle jump
antigen bundle web-search
# The following bundles are from https://josnun.github.io/posts/managing-dotfiles-and-zsh-with-dotbot-and-antigen/
# They're disabled until I can research them
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting

case `uname` in
  Darwin)
    # Commands for macos go here
    antigen bundle macos
  ;;
  Linux)
    # Commands for Linux go here
  ;;
esac

# Set the theme
antigen theme theunraveler

# And lastly, apply the Antigen stuff
antigen apply

