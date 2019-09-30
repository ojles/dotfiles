# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=st-256color
export PS1="[\u@\h \[\033[32m\]\w\[\033[00m\]]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

. ~/.scripts/aliases.bash
. ~/.scripts/git-completion.bash
. ~/.scripts/ssh-find-agent.sh
. ~/.vim/plugged/gruvbox/gruvbox_256palette.sh


ssh-find-agent -a
if [ -z "$SSH_AUTH_SOCK" ]
then
   eval $(ssh-agent) > /dev/null
   ssh-add -l > /dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
fi

function parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias lsql='mysql -uroot -pqwertyui'
alias cl='cd ~/workspace/botscrew/cl'
alias wd='cd ~/workspace/botscrew'
