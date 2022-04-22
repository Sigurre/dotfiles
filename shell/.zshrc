# .zshrc
ZSH_BASE=$HOME/.dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen.zsh # Load Antigen

source ~/.aliases # Source some extra files
source ~/.functions

antigen use oh-my-zsh # Yes, I want to use Oh My ZSH

# Terminal stuff/plugins
antigen bundle git
antigen bundle jump # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jump
antigen bundle web-search # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
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
#antigen theme dpoggi
#antigen theme jonathan
#antigen theme kolo
#antigen theme minimal
#antigen theme pygmalion
#https://github.com/spaceship-prompt/spaceship-prompt
antigen theme spaceship-prompt/spaceship-prompt
#https://github.com/geometry-zsh/geometry
#antigen theme geometry-zsh/geometry
#antigen theme theunraveler

# And lastly, apply the Antigen stuff
antigen apply

# Export black
export PATH="/Users/gaj/Library/Python/3.8/lib/python/site-packages/black:$PATH"
