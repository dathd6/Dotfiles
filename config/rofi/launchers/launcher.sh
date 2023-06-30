#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/theme"
theme='minimalism'

## Run
rofi \
    -show run \
    -theme ${dir}/${theme}.rasi
