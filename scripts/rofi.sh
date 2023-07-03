#!/usr/bin/bash
source $(pwd)/utils/backup_and_copy.sh

# Remove backup file first if exist
# Backup the file
# Copy config
backup_and_copy "rofi" "$HOME/.config"
