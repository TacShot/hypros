#!/bin/bash

# Install Yay if not already installed
if ! command -v yay &> /dev/null; then
  echo "Yay not found. Installing Yay..."
  cd /opt
  git clone https://aur.archlinux.org/yay.git
  chown -R root:root yay
  cd yay
  sudo -u root makepkg -si --noconfirm
fi

# Install required packages with Yay
yay -S --noconfirm hyprland networkmanager waybar bluez-utils blueman cava fastfetch pipewire pipewire-alsa pipewire-pulse bash hyprland-hyde-theme bt-dualboot

# Enable essential services
systemctl enable NetworkManager
systemctl enable bluetooth

# Notify completion
echo "All packages have been installed and essential services enabled."

# Optional: Reboot after installation
# read -p "Press any key to reboot..." -n1 -s
# reboot
