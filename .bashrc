if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi
# if [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
# fi

##############
# Networking #
##############

function proxy()
{
    export http_proxy="http://localhost:8888"
    export ftp_proxy="ftp://localhost:8888"
    echo "localhost:8888"
}

function noproxy()
{
    export http_proxy=""
    export ftp_proxy=""
}

# get the current IP adresses on eth0
function myip() 
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' | sed -e s/adr:// | sed -e s/inet6://)
    echo $MY_IP
}

# baskcup shortcuts
alias rcp='rsync -avz --ignore-existing --progress --rsh "ssh -l nojhan" '
alias rcp_443='rsync -avz --ignore-existing --progress --rsh "ssh -p 443 -l nojhan" '


###################
# File management #
###################

# Find a file with a pattern in name from the current directory
# ff name
function ff()
{ find . -type f -iname '*'$*'*' -ls ; }

# move to ~/.Trash instead of rm a file
function del()
{
    for i in $* ; do
        mv $i ~/.Trash
    done
}

# move backup files to trash
alias clean='mv *~ ~/.Trash/'

# Prevents accidentally clobbering files.
alias mv='mv -i'
alias mkdir='mkdir -p'

# The 'ls' family (this assumes you use the GNU ls))
# Mispelling on azerty keyboards
alias lks='ls'
alias ks='ls'
alias ms='ls'

alias ls='ls -hF --color'       # add colors for filetype recognition
alias l='ls -1'
alias la='ls -Al'               # show hidden files
alias lx='ls -lXB'              # sort by extension
alias lk='ls -lSr'              # sort by size
alias lc='ls -lcr'              # sort by change time  
alias lu='ls -lur'              # sort by access time   
alias lr='ls -lR'               # recursive ls
alias lt='ls -ltr'              # sort by date
alias lm='ls -al --color=none|less'  # pipe through 'less'
alias ll='ls -l'
alias tree='tree -Csu'          # nice alternative to 'ls'

# nautilus file manager in browser mode without destkop management
alias nautile='nautilus --no-desktop --browser'

# Make a directory and move to it
function md() {
    mkdir $1
    cd $1
}


#############
# Processes #
#############

alias psg='ps aux|grep ' # grep a process


##########
# Coding #
##########

alias agrep="ack-grep"

# repeat n times command
# repeat 10 echo "ok"
function repeat()
{
    local i max
    max=$1; shift;
    for ((i=1; i <= max ; i++)); do  # --> C-like syntax
        eval "$@";
    done
}

# ipython shell with correct default apps
alias ipy='ipython -pylab -p scipy --editor="gvim"'

# colored gcc output using the colout command
alias cgcc="colout :[0-9]+: yellow standard | colout error | colout warning magenta | colout pragma green standard"


#################
# Configuration #
#################

# alias I want to learn
function h()
{
echo "la : show hidden files"
echo "lx : sort by extension"
echo "lk : sort by size"
echo "lc : sort by change time"
echo "lu : sort by access time"
echo "lr : recursive ls"
echo "lt : sort by date"
echo "lm : pipe through 'less'"
echo "md : mkdir, cd"
echo "tree : nice alternative to 'ls'"
echo "ff [pattern] : find a file with a pattern in name"
echo "myip : show the IP address of eth0"
echo "repeat [n] [command] : repeat n times command"
echo "clean : remove backip files (*~)"
echo "psg : ps aux | grep "
echo "rcp : copy with rsync/ssh"
}

# default editor
export EDITOR='gvim'

# do not permits to recall dangerous commands in bash history
export HISTIGNORE='&:[bf]g:exit:*>|*::*rm*-rf*:*rm*-f*'
# append history rather than overwrite
shopt -s histappend
# one command per line
shopt -s cmdhist
unset HISTFILESIZE
HISTSIZE=1000000
# ignore commands that start with a space AND duplicate commands
HISTCONTROL=ignoreboth
# add the full date and time to lines
HISTTIMEFORMAT='%F %T '
# store history immediately
#; history -n'

# Manually switch to the bépo keyboard layout
alias bepo="setxkbmap -layout fr -variant bepo -option"

# Super nice prompt
source ~/.prompt.bash

# Added by autojump install.sh
#source /etc/profile.d/autojump.bash

# print a vim fortune at startup
#/usr/games/fortune vimtips

