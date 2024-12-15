###################
## AUTO-COMPLETE ##
###################
autoload -Uz compinit
compinit

#############
## ALIASES ##
#############
alias cd='z'

# Quality of life
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bat='bat --theme=tokyonight_night'
alias cx='chmod +x'

# Vim related
alias :q='exit'

# Cargo
alias cbr='cargo build --release'
alias cb='cargo build'
alias cip='cargo install --path .'

# Hyprland
alias window-class='hyprctl clients -j | jq ".[].class" -r'

# tmux
alias rename-session='tmux rename-session'
alias rename-window='tmux rename-window'

alias mox='/home/dlurak/Dotfiles/scripts/shell/moxide.sh'

##############
## Sourcing ##
##############
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

##############
## SETTINGS ##
##############
bindkey -v
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erease

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

nitch
