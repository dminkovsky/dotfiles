#!/bin/bash

complete -C aws_completer aws
export AWS_DEFAULT_REGION=us-east-1

alias dps='docker ps'
alias di='docker images'
alias dl='docker logs'
alias drma='docker rm $(docker ps -a -q) 2> /dev/null'
alias drmi='docker rmi $(docker images --filter="dangling=true" -a -q) 2> /dev/null'
alias dc='docker-compose'
alias dm='docker-machine'

. $HOME/.bashrc.d/base-common
. $HOME/.bashrc.d/base-osx
. $HOME/.bashrc.d/tmux
. $HOME/.bashrc.d/git
