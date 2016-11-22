source {{ env_dir }}/git/git-prompt.sh
source {{ env_dir }}/git/git-completion.bash

function __git_ps1_mod {
  echo $(__git_ps1 '[ %s ]') | sed -e 's/%/💩 /;s/+/🐵 /;s/*/🙈 /;s/<>/🔗 /;s/</🛬 /;s/>/🛫 /;s/=//';
}

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

export PS1="${c_user}\u${c_std}@${c_host}\h ${c_green}\w${c_std}${c_yellow} \$(__git_ps1_mod)${c_std}🌶${c_reset}  "