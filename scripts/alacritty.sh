#!/usr/bin/bash

pacman -S --needed --noconfirm alacritty
cp -rf ../.config/alacritty $home/.config
