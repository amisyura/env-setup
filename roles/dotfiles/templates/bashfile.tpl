#
#{{ file_gen_flag }}
#

# Including files for git
for file in `find {{ bashfiles_dir  }} -type f`; do
  source $file;
done;
unset file;