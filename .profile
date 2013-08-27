LANG="ko_KR.UTF-8"

alias tmux="TERM=screen-256color-bce tmux"
export TERM="xterm-256color"

export PS1="\[$(tput bold)\]\[$(tput setaf 2)\][\[$(tput setaf 7)\]\u@\h \w\[$(tput setaf 2)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export HISTTIMEFORMAT="%F %T "
export HISTFILESIZE=1000000000 HISTSIZE=1000000
export GIT_EDITOR="/usr/bin/vim"
