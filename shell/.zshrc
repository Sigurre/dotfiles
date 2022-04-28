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
