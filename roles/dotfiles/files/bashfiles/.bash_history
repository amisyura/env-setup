# extend bash history
shopt -s histappend
shopt -s cdspell # fix spelling
shopt -s dirspell
shopt -s globstar # ls **/*.mp3

PROMT_COMMAND="history -a"
HISTSIZE=5000

export HISTCONTROL=ignoredups


