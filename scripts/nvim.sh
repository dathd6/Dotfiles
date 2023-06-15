#!/usr/bin/bash

pacman -S neovim

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
cp -rf .config/nvim/ ~/.config/nvim/lua/user
