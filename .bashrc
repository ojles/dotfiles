#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias dot='git --git-dir $HOME/.dotfiles --work-tree=$HOME'
alias cw='cd ~/workspace/c'
alias leet='cd ~/workspace/c/leetcode'
alias gl='cd ~/workspace/gl'
