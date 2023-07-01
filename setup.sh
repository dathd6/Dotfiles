#!/usr/bin/bash
source $(pwd)/utils/configuration.sh
source $(pwd)/utils/color.sh

# Install dependencies, packages and applications
configuration "dependencies, packages and applications" "bash $(pwd)/scripts/packages.sh"

# Setup zsh
configuration "ZSH & Starship" "bash $(pwd)/scripts/zsh.sh"

# Setup Alacritty
configuration "Alacritty (Terminal)" "bash $(pwd)/scripts/alacritty.sh"

# Setup Zathura
configuration "Zathura (Document Viewer)" "bash $(pwd)/scripts/zathura.sh"

# Setup Zathura
configuration "Zathura (Document Viewer)" "bash $(pwd)/scripts/zathura.sh"

# Setup Flameshot
configuration "Flameshot (Screen saver)" "bash $(pwd)/scripts/flameshot.sh"

# Setup Rofi
configuration "Rofi (Quick Menu launchers, Power Menu, Wifi and Bluetooth)" "bash $(pwd)/scripts/rofi.sh"

# Setup Qtile
configuration "Qtile Tilling Window Manager" "bash $(pwd)/scripts/qtile.sh"

# Setup Dunst
configuration "Dunst (Notification notifier)" "bash $(pwd)/scripts/dunst.sh"

# Setup fzf
configuration "Fuzzy finder for prompt" "bash $(pwd)/scripts/fzf.sh"

# Setup Tmux
configuration "Tmux (Session)" "bash $(pwd)/scripts/tmux.sh"

# Setup UI
configuration "UI - GTK3/GTK4, Icons and Cursor theme & SDDM & Fonts" "bash $(pwd)/scripts/ui.sh"
