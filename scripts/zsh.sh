#!/usr/bin/bash

pacman -S --needed --noconfirm zsh

cp -rf ../.zshenv $home/
cp -rf ../.config/zsh $home/.config
source $home/.zshenv

chsh -s /usr/bin/zsh
