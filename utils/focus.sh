#!/bin/bash

# Function to format seconds to HH:MM:SS
format_time() {
  local seconds=$1
  local hours=$((seconds / 3600))
  local minutes=$(( (seconds % 3600) / 60))
  local seconds=$((seconds % 60))
  printf "%02d:%02d:%02d" $hours $minutes $seconds
}

# Function to convert time in HH:MM:SS format to seconds
convert_to_seconds() {
  local time=$1
  IFS=":" read -r hours minutes seconds <<< "$time"
  echo $((hours * 3600 + minutes * 60 + seconds))
}

# Countdown function
countdown() {
  local seconds=$1
  while [ $seconds -gt 0 ]; do
    printf "\r%s" "$(format_time $seconds)"
    sleep 1
    seconds=$((seconds - 1))
  done
  printf "\r%s" "$(format_time 0)"
  echo -e "\nCountdown finished!"
  clear
}

# Default countdown time in seconds (50 minutes)
default_time_in_seconds=$((50 * 60))

# Parse command line options
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -t|--time)
      time_in_seconds=$(convert_to_seconds $2)
      shift
      shift
      ;;
    *)
      shift
      ;;
  esac
done

# Use default time if no option is provided
if [ -z "$time_in_seconds" ]; then
  time_in_seconds=$default_time_in_seconds
fi

# Start the countdown
countdown $time_in_seconds

# Run the command after the countdown finishes
betterlockscreen -l blur

