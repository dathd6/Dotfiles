#!/usr/bin/bash
source $(pwd)/utils/backup_and_copy.sh

# Remove backup file first if exist
# Backup the file
# Copy config
backup_and_copy "wallpaper" "$HOME/Pictures"
backup_and_copy ".icons" "$HOME"
backup_and_copy ".themes" "$HOME"
backup_and_copy "fonts" "$HOME/.local/share"
backup_and_copy "gtk3.0" "$HOME/.config"
backup_and_copy "gtk4.0" "$HOME/.config"

# Setup SDDM
sudo chown -R root:root $(pwd)/config/sugar-candy
sudo chown -R root:root $(pwd)/config/kde-settings.config
sudo cp -rf $(pwd)/config/sugar-candy /usr/share/sddm/themes/
sudo cp -rf $(pwd)/config/kde-settings.config /etc/sddm.conf.d/
