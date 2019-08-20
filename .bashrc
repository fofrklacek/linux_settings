#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make __git_ps1 available
if [ -e "/usr/share/git/completion/git-prompt.sh" ] ; then # Arch
	source "/usr/share/git/completion/git-prompt.sh" 
elif [ -e "/etc/bash_completion.d/git-prompt" ] ; then # Ubuntu
	source "/etc/bash_completion.d/git-prompt" 
fi

# Change lolor of prompt
PS1='\[\e]0;\u@\h: \w\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[01;33m\]$(__git_ps1 " [%s]")\[\033[00m\]\$ ' 

# Source bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# git setup
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto verbose"


