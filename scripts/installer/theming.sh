#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source "$BASE_DIR/scripts/installer/helper.sh"

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

# Bibata cursor
run_command "tar -xvf $BASE_DIR/assets/cursor/Bibata-Modern-Ice.tar.xz -C /usr/share/icons/" "Install Bibata-Modern-Ice as the cursor theme" "yes"

# Gnome extension
# Openbar, for theming
run_command "ln --symbolic $BASE_DIR/assets/extension/openbar@neuromorph /home/$SUDO_USER/.local/share/gnome-shell/extensions"
# SDDM astro theme
run_command "yay -S --sudoloop --noconfirm sddm-astronaut-theme" "install SDDM Theme" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/sddm/sddm.conf /etc/ " "Apply SDDM Theme" "yes"

# run_command "pacman -S --noconfirm nwg-look" "Install nwg-look for GTK theme management" "yes" "no"
#
# run_command "pacman -S --noconfirm qt5ct qt6ct kvantum" "Install Qt5, Qt6 Settings, and Kvantum theme engines" "yes" "no"
#
# run_command "tar -xvf $BASE_DIR/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/" "Install Catppuccin Mocha GTK theme" "yes"
#
# run_command "tar -xvf $BASE_DIR/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/" "Install Tela Circle Dracula icon theme" "yes"
#
# run_command "yay -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Install Catppuccin theme for Kvantum" "yes" "no"

# Add instructions to configure theming
# print_info "\nPost-installation instructions:"
# print_bold_blue "Set themes and icons:"
# echo "   - Run 'nwg-look' and  set the global GTK and icon theme"
# echo "   - Open 'kvantummanager' (run with sudo for system-wide changes) to select and apply the Catppuccin theme"
# echo "   - Open 'qt6ct' to set the icon theme"

echo "------------------------------------------------------------------------"
