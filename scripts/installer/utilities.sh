#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "yay -S --noconfirm hyprpanel" "Install Hyprpanel - Status Bar" "yes"
run_command "ln --symbolic $BASE_DIR/configs/hyprpanel /home/$SUDO_USER/.config/" "Copy Hyprpanel config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm rofi" "Install rofi - Application Launcher" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/rofi /home/$SUDO_USER/.config/" "Copy rofi config(s)" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "yay -S --sudoloop --noconfirm swww waypaper" "Install SWWW and Waypaper for wallpaper management" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/hypr/hyprlock.conf /home/$SUDO_USER/.config/hypr/" "Copy Hyprlock config" "yes" "no"

run_command "yay -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/wlogout /home/$SUDO_USER/.config/ && ln --symbolic $BASE_DIR/assets/wlogout /home/$SUDO_USER/.config/assets/" "Copy Wlogout config and assets" "yes" "no"

run_command "yay -S --sudoloop --noconfirm grimblast" "Install Grimblast - Screenshot tool" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hypridle" "Install Hypridle for idle management (Must)" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/hypr/hypridle.conf /home/$SUDO_USER/.config/hypr/" "Copy Hypridle config" "yes" "no"

echo "------------------------------------------------------------------------"
