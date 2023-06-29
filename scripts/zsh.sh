#!/usr/bin/bash
source $(pwd)/utils/backup_and_copy.sh

# Change zsh as default prompt
chsh -s /usr/bin/zsh

# Remove backup file first if exist
# Backup the file
# Copy config
backup_and_copy ".zshenv" "$HOME"
backup_and_copy "starship" "$HOME/.config"
backup_and_copy "zsh" "$HOME/.config"
