#!/bin/bash

# Path setup

## Wipe paths before building up from /etc/paths
PATH=""

## Rebuild from /etc/paths
eval `/usr/libexec/path_helper -s`
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/local/share/npm/bin

# The rest
. $HOME/.bashrc

export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
