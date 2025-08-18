#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

# Hyprpanel
run_command "yay -S --sudoloop --noconfirm ags-hyprpanel-git" "Install Hyprpanel - Status Bar" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/hyprpanel /home/$SUDO_USER/.config/" "Symlink Hyprpanel config" "yes"

# Rofi
run_command "yay -S --sudoloop --noconfirm rofi" "Install rofi - Application Launcher" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/rofi /home/$SUDO_USER/.config/" "Symlink rofi config(s)" "yes"

# Cliphist
run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

# Wallpaper
run_command "yay -S --sudoloop --noconfirm swww waypaper" "Install SWWW and Waypaper for wallpaper management" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/waypaper /home/$SUDO_USER/.config/" "yes"

# Wlogout
run_command "yay -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/wlogout /home/$SUDO_USER/.config/ && mkdir /home/$SUDO_USER/.config/assets && ln --symbolic $BASE_DIR/assets/wlogout /home/$SUDO_USER/.config/assets/" "Symlink Wlogout config and assets" "yes" "no"

# Grimblast, Screenshot
run_command "yay -S --sudoloop --noconfirm grimblast-git" "Install Grimblast - Screenshot tool" "yes" "no"

# Fish
run_command "pacman -S --noconfirm fish" "Install fish - The friendly interactive shell" "yes"
run_command "ln --symbolic $BASE_DIR/configs/fish /home/$SUDO_USER/.config/fish" "Symlink Fish config" "yes"
run_command "chsh --shell /usr/bin/fish" "Change login/default shell to Fish" "yes"

# Keyd
run_command "pacman -S --noconfirm keyd && systemctl enable --now keyd" "Install Keyd - A key remapping daemon for linux" "yes"
run_command "ln --symbolic $BASE_DIR/configs/keyd/default.conf /etc/keyd/ && keyd reload" "Symlink apply Keyd config" "yes"

# Fastfetch
run_command "pacman -S --noconfirm fastfetch" "Install Fastfetch - performance focus system information tool" "yes"
run_command "ln --symbolic $BASE_DIR/configs/fastfetch /home/$SUDO_USER/.config/fastfetch" "Symlink Fastfetch config" "yes"

# Yazi
run_command "pacman -S --noconfirm yazi" "Install Yazi - TUI file manager" "yes"
run_command "ln --symbolic $BASE_DIR/configs/yazi /home/$SUDO_USER/.config/yazi" "Symlink Yazi config" "yes"

echo "------------------------------------------------------------------------"
