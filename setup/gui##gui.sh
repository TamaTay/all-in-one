#!/bin/bash
set -e
echo "📦 Installiere GUI-Komponenten (Arch)..."
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  kitty wofi waybar swww \
  networkmanager network-manager-applet \
  pipewire pipewire-pulse wireplumber pavucontrol \
  flatpak hyperland
echo "✅ GUI-Setup abgeschlossen."
