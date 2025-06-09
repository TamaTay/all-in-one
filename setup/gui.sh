#!/bin/bash

set -e

echo "[GUI] Starte GUI-Setup für Arch-basiertes System..."

# --- Basispakete ---
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  hyprland kitty waybar wofi \
  swww zoxide ripgrep fd fzf \
  ffmpeg jq poppler imagemagick \
  7zip git curl tmux neovim yazi

# --- YAY installieren (falls nicht vorhanden) ---
if ! command -v yay &>/dev/null; then
  echo "[GUI] yay nicht gefunden – wird installiert..."
  git clone https://aur.archlinux.org/yay.git ~/yay-build
  cd ~/yay-build
  makepkg -si --noconfirm
  cd ~
  rm -rf ~/yay-build
fi

# --- resvg aus dem AUR ---
yay -S --noconfirm resvg

# --- NerdFonts manuell installieren ---
echo "[GUI] Lade NerdFonts (Hack)..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip
unzip -o Hack.zip && rm Hack.zip
fc-cache -fv

# --- Wallpaper mit swww setzen (falls Datei existiert) ---
if [ -f ~/.config/swww/wallpaper.jpg ]; then
  echo "[GUI] Wallpaper wird gesetzt..."
  swww init & sleep 1
  swww img ~/.config/swww/wallpaper.jpg
fi

# --- Hinweis ---
echo "[GUI] Setup abgeschlossen. Starte dein System neu oder logge dich neu ein."
