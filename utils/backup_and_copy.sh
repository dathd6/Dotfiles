#!/usr/bin/bash

backup_and_copy() {
  FILENAME="$1"
  CONFIG_DIR="$2"

  rm -rf $CONFIG_DIR/$FILENAME.bak
  mv $CONFIG_DIR/$FILENAME $CONFIG_DIR/$FILENAME.bak
  cp -rf $(pwd)/config/$FILENAME $CONFIG_DIR/$FILENAME
}
