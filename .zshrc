# Allow emacs-like keybinding to jump around in the terminal
bindkey -e
# Allow substitution in prompt
setopt prompt_subst
# Allow case insensitive completion
autoload -U colors && colors
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Enable history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt inc_append_history
alias history='history 0'

# Smart search when using arrow up and down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# Have a working DEL key :o
bindkey "^[[3~" delete-char

# Useful environment variables
export EDITOR="hx"
export PS1="%{$(tput setaf 231)%}%n%{$(tput setaf 231)%}@%{$(tput setaf 231)%}%m %{$(tput setaf 33)%}%1~ %{$(tput sgr0)%}%# "

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'

