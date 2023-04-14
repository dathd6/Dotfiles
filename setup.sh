#!/usr/bin/bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Parse command-line options
while [[ $# -gt 0 ]]; do
  case $1 in
    -u|--user)
      user="$2"
      shift 2
      ;;
    *)
      echo "Invalid option: $1" >&2
      exit 1
      ;;
  esac
done

# Check that user option is set
if [[ -z "$user" ]]; then
  echo "User option (--user or -u) is required"
  exit 1
fi

home="/home/$user"

# Update packages
pacman -Sy
echo -e "${GREEN}Success:${NC} Done update package."

# Autoupdate mirrorlist
bash ./scripts/reflector.sh
echo -e "${GREEN}Success:${NC} Done setup reflector."
