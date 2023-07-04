#!/usr/bin/bash
source $(pwd)/utils/install_packages.sh

packages=(
        adduser
        bat
        betterlockscreen
        bitwarden
        bluez-utils
        docker
        dunst
	qtile
	tmux
        feh
        ffmpeg
        tree
        git
	ripgrep
        ibus ibus-unikey
        lazygit
        libnotify
        mypy
        network-manager-applet
        nodejs
        npm
        # nvidia-dkms
        nvidia-settings
        lib32-nvidia-utils
        rofi
        starship
        stubtest
        picom-jonaburg-git
        xsel
        xss-lock
        xorg-xbacklight
	zsh
)

# Applications
applications=(
        alacritty
        anki
        brave-browser
        flameshot
        gnome-calculator
        lxappearance
	libvirt qemu virt-manager
        morgen-bin
        neovim
        notion-app
        obs-studio
        obsidian
        thunar
        thunderbird
        todoist-appimage
        steam
        spotify
        zathura zathura-pdf-poppler zathura-cb zathura-ps zathura-djvu
)

# Python packages
python_packages=(
        python-pip
        python-pandas
        python-xlib
        python-dbus
        python-dbus-next
        python-virtualenv
        python-iwlib
)

# Font packages
font_packages=(
        ttf-font-awesome
        ttf-jetbrains-mono
        ttf-meslo-nerd
        ttf-opensans
)

# Update packages
yay -Syu

# Install all packages, dependencies and applications
install_packages "${packages[@]}"
install_packages "${font_packages[@]}"
install_packages "${python_packages[@]}"
install_packages "${applications[@]}"
