# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#############
## ALIASES ##
#############
alias t='tmuxinator start $(tmuxinator completions start | fzf)'

# Quality of life
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias bat='bat --theme=tokyonight_night'

# Vim related
alias :q='exit'
alias :q='exit'
alias :vim='nvim' # I often have this typo

# Cargo
alias cbr='cargo build --release'
alias cb='cargo build'
alias cip='cargo install --path .'

# Hyprland
alias window-class='hyprctl clients -j | jq ".[].class" -r'

# tmux
alias rename-session='tmux rename-session'
alias rename-window='tmux rename-window'

############
## Prompt ##
############
PS1='\e[35m[\t] \e[32m\u@\h\e[39m:\e[36m\w\n\e[39m$ '

##############
## Sourcing ##
##############
source /usr/share/nvm/init-nvm.sh 2>/dev/null

###############
## VARIABLES ##
###############
export EDITOR="nvim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:/home/dlurak/.local/bin:/home/dlurak/.cargo/bin:$PATH

neofetch 
