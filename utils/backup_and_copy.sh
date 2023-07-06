#!/usr/bin/bash
source $(pwd)/utils/color.sh

backup_and_copy() {
  FILENAME="$1"
  CONFIG_DIR="$2"

  if test -e $CONFIG_DIR/.$FILENAME.bak; then
    read -p "Already backup !!! - Delete and backup another one .$FILENAME.bak ? (Y/n): " choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')  # Convert to lowercase
    if [[ -z $choice || $choice == "y" ]]; then
      rm -rf $CONFIG_DIR/.$FILENAME.bak
      mv $CONFIG_DIR/$FILENAME $CONFIG_DIR/.$FILENAME.bak
      echo -e "${GREEN}Generate new backup .$FILENAME.bak"
    else
      echo -e "${RED}Skip backup"
    fi
  else
    mv $CONFIG_DIR/$FILENAME $CONFIG_DIR/.$FILENAME.bak
    echo -e "${GREEN}Generate backup .$FILENAME.bak"
  fi

  cp -rf $(pwd)/config/$FILENAME $CONFIG_DIR/$FILENAME
}
