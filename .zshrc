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

# Set VCS information (git prompt)
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
() {
    local formats="(%b%c%u) "
    local actionformats="${formats}%{${fg[default]}%} xx %{${fg[green]}%}%a"
    zstyle ':vcs_info:*:*' formats           $formats
    zstyle ':vcs_info:*:*' actionformats     $actionformats
    zstyle ':vcs_info:*:*' stagedstr         "%{${fg[green]}%}✗%f"
    zstyle ':vcs_info:*:*' unstagedstr       "%{${fg[yellow]}%}✗%f"
    zstyle ':vcs_info:*:*' check-for-changes true
}
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Useful environment variables
export EDITOR="hx"
export PS1="%{$(tput setaf 15)%}%n%{$(tput setaf 220)%}@%{$(tput setaf 15)%}%m %{$(tput setaf 122)%}%1~ %{$(tput sgr0)%}$ "

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'

# Update PATH here
export PATH="$PATH:$HOME/tools/flutter/bin"
