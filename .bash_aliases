# system
alias poweroff="sudo shutdown -h now"
alias reboot="sudo shutdown -r now"
alias meminfo="free -m -l -t"
alias df="df -H"
alias du="du -ch"
alias ll="ls -l"
alias la="ls -a"
alias lsh="ls -lhXG"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias chown="chown --preserve-root"
alias chmod="chmod --preserve-root"
alias chgrp="alias --preserve-root"
alias ps="ps -ef"
alias psa="ps ax"
alias top="htop"
alias less="less -X"
alias rmcache='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

# dev
alias vi="vim"
alias svi="sudo vim"
alias emacs="emacs -nw"

# networking
alias wget="wget -c"
alias myip="curl http://ipecho.net/plain; echo"

# apt
alias apti="sudo apt install -V"
alias aptupd="sudo apt-get update"
alias aptupg="sudo apt-get upgrade -y"
alias aptcl="sudo apt-cache --list"
alias aptrm="sudo apt-get remove"
alias aptpurge="sudo apt-get remove --purge"

# useful
alias grep="grep --color -n -i"
alias cat="cat -s"

# services
alias rapache="sudo service apache2 restart"
alias stopapache="sudo service apache2 stop"
alias rnginx="sudo service nginx restart"
alias stopnginx="sudo service nginx stop"

# compile
alias cc="gcc -g3 -Wall -pedantic -std=c11"
