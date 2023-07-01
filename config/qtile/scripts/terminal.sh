#!/usr/bin/bash

if tmux has-session; then
  alacritty -e tmux attach-session
else
  alacritty -e tmux new-session
fi

