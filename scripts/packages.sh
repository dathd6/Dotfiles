#!/usr/bin/bash

packages=(
        adduser
        bat
        betterlockscreen
        bitwarden
        blueman
        docker
        dunst
	qtile
	tmux
        feh
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

# Update packages
yay -Syu

# Install packages
for package in "${packages[@]}"; do
        if [[ $(yay -Qi "$package" 2>/dev/null | grep Version | awk '{print $3}') == $(yay -Qi "$package" 2>/dev/null | grep Installed | awk '{print $4}') ]]; then
            echo -e "${RED}$package is already installed with the latest version.${NC}"
        else
            echo -e "${GREEN}Installing $package...${NC}"
            yay -S --noconfirm "$package"
        fi
done

for package in "${python_packages[@]}"; do
        if [[ $(yay -Qi "$package" 2>/dev/null | grep Version | awk '{print $3}') == $(yay -Qi "$package" 2>/dev/null | grep Installed | awk '{print $4}') ]]; then
            echo -e "${RED}$package is already installed with the latest version.${NC}"
        else
            echo -e "${GREEN}Installing $package...${NC}"
            yay -S --noconfirm "$package"
        fi
done

for package in "${applications[@]}"; do
        if [[ $(yay -Qi "$package" 2>/dev/null | grep Version | awk '{print $3}') == $(yay -Qi "$package" 2>/dev/null | grep Installed | awk '{print $4}') ]]; then
            echo -e "${RED}$package is already installed with the latest version.${NC}"
        else
            echo -e "${GREEN}Installing $package...${NC}"
            yay -S --noconfirm "$package"
        fi
done
