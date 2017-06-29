#!/bin/bash

complete -C aws_completer aws
export AWS_DEFAULT_REGION=us-east-1

. $HOME/.bashrc.d/base-common
. $HOME/.bashrc.d/base-osx
. $HOME/.bashrc.d/tmux
. $HOME/.bashrc.d/git
