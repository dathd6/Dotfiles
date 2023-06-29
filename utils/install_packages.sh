#!/usr/bin/bash

install_packages() {
  new_packages=("$@")
  for package in "${new_packages[@]}"; do
    if [[ $(yay -Qi "$package" 2>/dev/null | grep Version | awk '{print $3}') == $(yay -Qi "$package" 2>/dev/null | grep Installed | awk '{print $4}') ]]; then
        echo -e "${RED}$package is already installed with the latest version.${NC}"
    else
        echo -e "${GREEN}Installing $package...${NC}"
        yay -S --noconfirm "$package"
    fi
  done
}
