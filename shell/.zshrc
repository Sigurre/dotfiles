# .zshrc
ZSH_BASE=$HOME/.dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen.zsh # Load Antigen

#Source our extra directories
source ~/.aliases
source ~/.functions
source ~/.antigenrc

#Change the visual editor to neovim
export VISUAL=nvim;
export EDITOR=nvim;

# Export black
export PATH="/Users/gaj/Library/Python/3.8/lib/python/site-packages/black:$PATH"
