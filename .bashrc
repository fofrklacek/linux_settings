#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

##### load support functions #####
[ -e ~/.scripts/system/bash_support ] && source ~/.scripts/system/bash_support || return

##### PS1 setup #####

# Make __git_ps1 available
if [ -e "/usr/share/git/completion/git-prompt.sh" ] ; then # Arch
	source "/usr/share/git/completion/git-prompt.sh" 
elif [ -e "/etc/bash_completion.d/git-prompt" ] ; then # Ubuntu
	source "/etc/bash_completion.d/git-prompt" 
fi

function return_val {
	RETVAL=$?
	[ $RETVAL -eq 0 ] || echo "[${RETVAL}]"
}

# Change color of prompt
PS1='\[\033[01;32m\]$(return_val)\[\e]0;\u@\h: \w\a\]\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[01;33m\]$(__git_ps1 " [%s]")\[\033[00m\]\$ ' 

##### PS1 end #####

# Source bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# git setup
if check git
then
	export GIT_PS1_SHOWDIRTYSTATE=1
	export GIT_PS1_SHOWSTASHSTATE=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWUPSTREAM="auto verbose"
fi

# man color scheme
if check man
then
	export LESS_TERMCAP_mb=$'\e[1;32m'
	export LESS_TERMCAP_md=$'\e[1;32m'
	export LESS_TERMCAP_me=$'\e[0m'
	export LESS_TERMCAP_se=$'\e[0m'
	export LESS_TERMCAP_so=$'\e[01;33m'
	export LESS_TERMCAP_ue=$'\e[0m'
	export LESS_TERMCAP_us=$'\e[1;4;31m'
fi
