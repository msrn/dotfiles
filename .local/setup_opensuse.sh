#!/bin/bash
packages_add=(
    keepassxc
    git
    nextcloud-desktop
    gvim
    htop
    opi
    zsh
)

sudo zypper in -l ${packages_add[@]}

chsh -s $(command -v zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
