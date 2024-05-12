# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#############
## ALIASES ##
#############
alias ls='ls --color=auto'
alias grep='grep --color=auto'

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
export PATH="$PATH:/home/dlurak/.cargo/bin"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export EDITOR="nvim"

neofetch 
