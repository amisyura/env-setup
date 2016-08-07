GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

export PS1="${c_user}\u${c_std}@${c_host}\h ${c_green}\w${c_std}${c_yellow} \$(__git_ps1_mod)${c_std}🌶${c_reset}  "