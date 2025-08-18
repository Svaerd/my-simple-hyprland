#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for hypr section"
print_info "\nStarting hypr setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm hyprland" "Install Hyprland (Must)" "yes"
run_command "mkdir -p /home/$SUDO_USER/.config/hypr/ && ln --symbolic $BASE_DIR/configs/hypr/hyprland.conf /home/$SUDO_USER/.config/hypr/" "Create symbolic link for hyprland config (Must)" "yes"

run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Install XDG desktop portal for Hyprland" "yes"

run_command "pacman -S --noconfirm hyprpolkitagent" "Install Hypr Polkit agent for authentication dialogs" "yes"

# Hypr utils
run_command "yay -S --sudoloop --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes" "no"

run_command "yay -S --sudoloop --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/hypr/hyprlock.conf /home/$SUDO_USER/.config/hypr/" "Symlink Hyprlock config" "yes"

run_command "yay -S --sudoloop --noconfirm hypridle" "Install Hypridle for idle management (Must)" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/hypr/hypridle.conf /home/$SUDO_USER/.config/hypr/" "Symlink Hypridle config" "yes"

# run_command "pacman -S --noconfirm dunst" "Install Dunst notification daemon" "yes"
# run_command "ln --symbolic $BASE_DIR/configs/dunst /home/$SUDO_USER/.config/" "Symlink dunst config" "yes"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Install QT support on wayland" "yes"

echo "------------------------------------------------------------------------"
