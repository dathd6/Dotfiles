#!/usr/bin/bash

pacman -S --needed --noconfirm nodejs npm ripgrep

cp -rf ../.config/nvim $home/.config
vim +PackerSync
