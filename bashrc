export PASSWORD_STORE_X_SELECTION=primary
export EDITOR=vi

parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n'
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
