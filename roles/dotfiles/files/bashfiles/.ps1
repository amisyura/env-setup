export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM=auto
export PS1="[${c_user}\u${c_std}@${c_host}\h${c_std} \[\033[32m\]\w\[\033[33m\]\$(__git_ps1 ' (%s)')]\[\033[00m\] > "