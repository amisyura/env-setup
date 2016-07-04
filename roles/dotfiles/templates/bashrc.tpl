# Including dotfiles
for file in `find {{ dotfiles_dir  }} -type f -name '.*'`; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Including files for git
for file in `find {{ gitfiles_dir  }} -type f -name '.*'`; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

#php 5.6 path
#export PATH="$(brew --prefix php56)/bin:$PATH"