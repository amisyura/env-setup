for file in `find {{ dotfiles_dir  }} -type f`; do
  source $file;
done;
unset file;