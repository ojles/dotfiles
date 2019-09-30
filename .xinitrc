export LC_ALL="en_US.utf-8"
export LANG="$LC_ALL"
export EDITOR=vim
export PATH="$PATH:$HOME/.scripts/cmd"
export NNN_USE_EDITOR=1
systemctl --user set-environment DISPLAY=:0
exec i3
