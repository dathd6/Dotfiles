#!/usr/bin/bash
source $(pwd)/utils/configuration.sh
source $(pwd)/utils/color.sh

# Install dependencies, packages and applications
configuration "dependencies, packages and applications" "bash $(pwd)/scripts/packages.sh"

# Setup zsh
configuration "ZSH & Starship" "bash $(pwd)/scripts/zsh.sh"
