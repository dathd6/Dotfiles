#!/usr/bin/bash


FILENAME=nvim
CONFIG_DIR=$HOME/.config

rm -rf $CONFIG_DIR/$FILENAME.bak
mv $CONFIG_DIR/$FILENAME $CONFIG_DIR/$FILENAME.bak

git clone --depth 1 https://github.com/AstroNvim/AstroNvim $CONFIG_DIR/$FILENAME
cp -rf $(pwd)/config/nvim $HOME/.config/nvim/lua/user
