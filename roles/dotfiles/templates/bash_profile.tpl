#
#{{ file_gen_flag }}
#

# Including files for git
for file in `find {{ bashfiles_dir  }} -type f -name '.*'`; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#php 5.6 path
#export PATH="$(brew --prefix php56)/bin:$PATH"
