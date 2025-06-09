#!/bin/bash

set -e

# 🎨 Minimales GUI Setup für Arch mit Hyperland & Flatpak

# 📦 Systempakete installieren
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  yadm git sudo bash-completion \
  neovim tmux fzf ripgrep fd zoxide \
  yazi jq poppler 7zip imagemagick ffmpeg \
  networkmanager network-manager-applet \
  pipewire pipewire-pulse wireplumber pavucontrol \
  kitty wofi waybar swww xdg-desktop-portal-hyprland xdg-utils \
  flatpak hyperland

# 🌐 Brave installieren (direkt via curl)
echo "🌐 Installiere Brave..."
curl -fsSLo brave.pkg.tar.zst https://mirror.brave.com/linux/latest/brave-browser-nightly-x86_64.pkg.tar.zst
sudo pacman -U --noconfirm brave.pkg.tar.zst

# 🛡️ Tailscale installieren
curl -fsSL https://tailscale.com/install.sh | sh

# 🧱 Flatpak installieren (falls noch nicht installiert)
if ! command -v flatpak &>/dev/null; then
  echo "📦 Installiere Flatpak..."
  sudo pacman -S --noconfirm flatpak
fi

# 🧱 Flatpak Anwendungen installieren
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.github.tchx84.Flatseal

# 🖼️ Wallpaper setzen
if command -v swww &>/dev/null; then
  echo "🌄 Setze Wallpaper..."
  swww init &
  sleep 1
  swww img "$HOME/wallpapers/diogenes.jpg"
fi

# ✅ Abschluss
echo "✅ GUI-Setup abgeschlossen. Bitte ab- und wieder anmelden oder neustarten."
echo "Starte Neovim einmal mit: nvim"

