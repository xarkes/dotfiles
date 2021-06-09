# Path to your oh-my-zsh installation.
export ZSH="/home/antide/.local/share/zsh"
export ZDOTDIR="/home/antide/.local/share/zsh/zcomp"
export EDITOR="nvim"
ZSH_THEME="gianu"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
alias vi=nvim
alias em='TERM=alacritty-direct emacs -nw'
alias emc='TERM=alacritty-direct emacsclient -t'
alias sudo='sudo ' # nice trick to allow checking for an alias after sudo
alias wgu='sudo wg-quick up'
alias wgd='sudo wg-quick down'
alias ssh='TERM=xterm-256color ssh'
alias nv='/home/antide/tools/neovide/target/release/neovide'

