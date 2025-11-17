#!/bin/bash

# Define the options with icons for a more visual menu
options="  Logout\n  Reboot\n  Shutdown\n  Lock"

# Use wofi to present the options as a dynamic menu
# The -p flag sets a prompt text for the menu
chosen=$(echo -e "$options" | wofi --dmenu -p "Power Menu")

# Execute a command based on the user's choice
case "$chosen" in
  "  Logout")
    hyprctl dispatch exit
    ;;
  "  Reboot")
    systemctl reboot
    ;;
  "  Shutdown")
    systemctl poweroff
    ;;
  "  Lock")
    swaylock
    ;;
  *)
    # Exit if the user presses escape or clicks outside the menu
    exit 1
    ;;
esac