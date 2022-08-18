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
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
# Smart search when using arrow up and down
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

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
export EDITOR="nvim"
PROMPT='%F{33}u%f%F{39}s%f%F{38}e%f%F{44}r%f%F{50}@%m:%f%F{212}%1~/%f %F{44}%#%f ${vcs_info_msg_0_}'

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi=nvim
alias sudo='sudo ' # nice trick to allow checking for an alias after sudo
alias wgu='sudo wg-quick up'
alias wgd='sudo wg-quick down'
alias ga='git add'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias gl='git pull'
