#!/usr/bin/bash

pacman -S --needed --noconfirm zsh

# FzF install
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cp -rf .zshenv $home/
cp -rf .config/zsh $home/.config
source $home/.zshenv

chsh -s /usr/bin/zsh
