#!/usr/bin/bash

configuration() {
  SETUP="$1"
  COMMAND="$2"
  echo -e "${GREEN}#########################################"
  echo -e "${RED}# ${SETUP}"
  echo -e "${GREEN}#########################################${NC}"
  read -p "Install all the ${SETUP}? (Y/n): " choice
  choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')  # Convert to lowercase
  if [[ -z $choice || $choice == "y" ]]; then
    # Execute the command
    eval "$COMMAND"
    echo -e "${GREEN}Success:${NC} Done setup ${SETUP}."
  else
    echo -e "${RED}Not Install any ${SETUP}."
  fi
}
