#!/bin/bash

function dotz {
    /usr/bin/git --git-dir=$HOME/.my-cfg/ --work-tree=$HOME $@
}

command -v /usr/bin/git &>/dev/null || { echo >&2 "Git not installed"; exit 1; }  

git clone --bare https://github.com/msrn/dotfiles.git $HOME/.my-cfg
dotz checkout
if [ $? = 0 ]; then
    echo "Config cloned";
else
    mkdir -p .my-cfg-backup
    dotz checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .my-cfg-backup/{}
    echo "Old files backed up to .my-cgf-backup";
fi;

dotz checkout
dotz config --local status.showUntrackedFiles no

