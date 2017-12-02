[user]
    name = {{ username }}
    email = {{ useremail }}
[github]
    name = {{ username }}
[i18n]
    commitEncoding = utf-8
[alias]
    hist = log --date=short --pretty=format:\"%h %ad |    %ae (%an)    |  %s%d\"
    myhist = hist --all --author={{ username }}
    co = checkout
    ci = commit
    st = status
    br = branch
    su = submodule
    p = push
    pu = push -u origin
[color]
    branch = auto
    diff = auto
    status = auto
    interactive = auto
    ui = true
    pager = true
[color "branch"]
    current = green reverse
    local = yellow
    remote = cyan
[color "diff"]
    meta = yellow bold
    frag = magenta bold
    old = red bold
    new = green bold
[color "status"]
    added = yellow
    changed = green
    untracked = cyan
[apply]
    whitespace = fix
[push]
    default = simple
[rebase]
    autosquash = true
[pull]
    rebase = true
[rerere]
    enabled = true                             
[filter "lfs"]
    clean = git lfs clean %f
    smudge = git lfs smudge %f
    required = true
[core]
    excludesfile = {{ env_dir }}/git/.gitignore
    editor = "vim"
