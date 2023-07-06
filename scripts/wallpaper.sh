#!/usr/bin/bash
source $(pwd)/utils/backup_and_copy.sh

# Remove backup file first if exist
# Backup the file
# Copy config
backup_and_copy "Pictures" "$HOME"

betterlockscreen -u $HOME/Pictures/wallpapers

# Focus script
DIRECTORY=$(pwd)
sudo chown -R root:root $DIRECTORY/utils/focus.sh
sudo cp $DIRECTORY/utils/focus.sh /usr/local/bin/focus
