#!/bin/bash

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source "$BASE_DIR/scripts/installer/helper.sh"

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

# Update package
run_command "pacman -Syyu --noconfirm" "Update package database and upgrade packages (Recommended)" "yes" # no

# Install yay if not installed already
if command -v yay >/dev/null; then
	print_info "Skipping yay installation (already installed)."
elif run_command "pacman -S --noconfirm --needed git base-devel" "Install YAY (Must)/Breaks the script" "yes"; then #
	run_command "git clone https://aur.archlinux.org/yay.git && cd yay" "Clone YAY (Must)/Breaks the script" "no" "no"
	run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Build YAY (Must)/Breaks the script" "no" "no"
fi

# Configuring audio and brightness
run_command "pacman -S --noconfirm pipewire wireplumber pamixer brightnessctl" "Configuring audio and brightness (Recommended)" "yes"

# Bluetooth
run_command "pacman -S --noconfirm bluez bluez-utils && systemctl enable Bluetooth" "Install and enable Bluetooth" "yes"

# Fonts
run_command "pacman -S --noconfirm ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono" "Installing Nerd Fonts and Symbols (Recommended)" "yes"

run_command "yay -S --sudoloop --noconfirm sddm-astronaut-theme 
&& touch /etc/sddm.conf 
&& echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf" "Install SDDM Theme and apply"


# Kitty
run_command "pacman -S --noconfirm kitty" "Install Kitty - Terminal emulator (Recommended)" "yes"
run_command "ln --symbolic $BASE_DIR/configs/kitty /home/$SUDO_USER/.config/" "Symlink Catppuccin theme configuration for Kitty terminal" "yes"

# Neovim
run_command "pacman -S --noconfirm nvim" "Install nvim - terminal based text editor" "yes"
run_command "ln --symbolic $BASE_DIR/configs/nvim /home/$SUDO_USER/.config/" "Symlink nvim config" "yes"

# tar and 7zip
run_command "pacman -S --noconfirm tar 7zip" "Install tar for extracting files (Must)/needed for copying themes" "yes"

# Gnome
# run_command "pacman -S --noconfirm gnome-shell" "Install Gnome for easier theming" "yes"

# Flatpak
run_command "pacman -S --noconfirm flatpak" "Install flatpak - Linux application sandboxing and distribution framework" "yes"

# SDDM
run_command "pacman -S --noconfirm sddm && systemctl enable sddm.service" "Install and enable SDDM (Recommended)" "yes"

# Browser
run_command "yay -S --sudoloop --noconfirm vivaldi" "Install Vivaldi Browser" "yes" "no"

echo "------------------------------------------------------------------------"
