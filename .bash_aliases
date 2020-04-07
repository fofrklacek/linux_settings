SCRIPT_DIR="~/.scripts"
NOEXEC="nonexecutable"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -hlF'
alias la='ls -AhlF'
alias l='ls -CF'

#changes vim to updated vim
alias vim="$SCRIPT_DIR/$NOEXEC/updated_vim"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
## alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#changes clasical top to htop
alias top='htop'

#Shortcut for mips(assembly program)
## alias mars='java -jar ~/programs/Mars.jar'

#add own scripts to path
PATH="$PATH:$SCRIPT_DIR/executable"
PATH="$PATH:$SCRIPT_DIR/utils"

#compiler shortcut
## alias g='g++ -Wall -pedantic -fsanitize=address -g '

#arduino IDE
## alias arduino='/home/radek/Documents/ARD/arduino-1.8.8/arduino'

#folowing commands throw away error and opens in background
## alias firefox='firefox 2>/dev/null &'
## alias spotify='spotify 2>/dev/null &'
## alias rhythmbox='rhythmbox 2>/dev/null &'
## alias virtualbox='virtualbox 2>/dev/null &'

alias find='find 2>/dev/null '

#starts pdf/jpeg viewer
## alias image='eog'

alias mp3="$SCRIPT_DIR/$NOEXEC/tmux_updated"

########AUTOCOMPLETE functions#################

#ssh server
## function ssh_server {
## 	~/scripts/ssh_server "$1"
## }

if [ -x /usr/bin/sensors ]
then
	alias sensors="$SCRIPT_DIR/$NOEXEC/sensors_updated"
fi

if [ -x /usr/bin/aft-mtp-cli ]
then
	alias phone_connect='aft-mtp-cli'
fi
