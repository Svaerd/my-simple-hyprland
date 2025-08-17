#!/bin/bash

BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Update the system
# echo "Updating the system..."
# sudo pacman -Syu --noconfirm

# Define the package files
PACKAGES_FILE="$BASE_DIR/scripts/extra_pkgs/pkgs_list.lst"

# You can update the list manually by changing the ".lst" file or even using your own file
# OR, you could also
# Use "sudo pacman -Qqe" to fetch your current explicitly installed packages -- aka. update the packages list with your current explicitly installed packages

# Check if the official packages file exists
if [[ -f "$PACKAGES_FILE" ]]; then
	echo "Installing official packages from $PACKAGES_FILE..."
	while IFS= read -r PACKAGE; do
		if [[ ! -z "$PACKAGE" ]]; then
			yay -S --noconfirm "$PACKAGE"
		fi
	done <"$PACKAGES_FILE"
else
	echo "File $PACKAGES_FILE not found!"
fi

echo "Installation complete!"
