# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#############
## ALIASES ##
#############
alias cd='z'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias :q='exit'

# tmux
alias rename-session='tmux rename-session'
alias rename-windmw='tmux rename-window'

############
## Prompt ##
############
PS1='\e[35m[\t] \e[32m\u@\h\e[39m:\e[36m\w\n\e[39m$ '

##############
## Sourcing ##
##############
eval "$(zoxide init bash)"

set -o vi

nitch
