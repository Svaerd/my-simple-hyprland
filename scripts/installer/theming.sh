#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source "$BASE_DIR/scripts/installer/helper.sh"

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

# Bibata cursor
run_command "tar -xvf $BASE_DIR/assets/cursor/Bibata-Modern-Ice.tar.xz -C /usr/share/icons/" "Install Bibata-Modern-Ice as the cursor theme" "yes"

# SDDM astro theme
run_command "yay -S --sudoloop --noconfirm sddm-astronaut-theme" "install SDDM Theme" "yes" "no"
run_command "ln --symbolic $BASE_DIR/configs/sddm/sddm.conf /etc/ " "Apply SDDM Theme" "yes"

run_command "pacman -S --noconfirm gtk-engine-murrine" "require to apply gtk2 themes" "yes"

run_command "pacman -S --noconfirm nwg-look" "Install nwg-look for GTK theme management" "yes"

# Kvantum
run_command "pacman -S --noconfirm qt5ct qt6ct kvantum" "Install Qt5, Qt6 Settings, and Kvantum theme engines" "yes"
run_command "ln --symbolic $BASE_DIR/configs/Kvantum /home/$SUDO_USER/.config/ " "Apply Kvantum Theme" "yes" "no"

# GTK theme
run_command "7z x $BASE_DIR/assets/themes/Catppuccin-Dark-Macchiato.zip -o/usr/share/themes/" "Move Catppuccin Macchiato GTK theme to themes directory" "yes"

# Tela-circle-dracula
# run_command "tar -xvf $BASE_DIR/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/" "Move Tela Circle Dracula icon theme to icons directory" "yes"
#
# run_command "yay -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Install Catppuccin theme for Kvantum" "yes" "no"

# Add instructions to configure theming
# print_info "\nPost-installation instructions:"
# print_bold_blue "Set themes and icons:"
print_bold_blue "   - Run 'nwg-look' and  set the global GTK and icon theme"
# echo "   - Open 'kvantummanager' (run with sudo for system-wide changes) to select and apply the Catppuccin theme"
# echo "   - Open 'qt6ct' to set the icon theme"

echo "------------------------------------------------------------------------"
