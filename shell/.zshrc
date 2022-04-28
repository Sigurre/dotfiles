# .zshrc
ZSH_BASE=$HOME/.dotfiles # Base directory for ZSH configuration

source $ZSH_BASE/antigen.zsh # Load Antigen
# Load Antigen config
source ~/.antigenrc

#Source our extra directories
source ~/.aliases
source ~/.functions

#Change the visual editor to neovim
export VISUAL=nvim;
export EDITOR=nvim;
