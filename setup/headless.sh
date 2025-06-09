#!/bin/bash

set -e

echo "🧠 Starte Headless-Setup..."

# 🔧 Apt-Update und Grundpakete
sudo apt update && sudo apt install -y \
  curl git fzf tmux zoxide \
  ripgrep fd-find jq poppler-utils \
  imagemagick ffmpeg p7zip-full \
  build-essential

# 📦 Homebrew installieren
NONINTERACTIVE=1 bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 📌 Brew-Pfad in .bashrc ergänzen
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 🔧 GCC (Brew-Voraussetzung)
brew install gcc

# 🧠 Neovim & Yazi über Brew installieren
brew install neovim yazi

# 🖇️ Dotfiles übernehmen (Pfad ggf. anpassen)
# YADM übernimmt bereits Verlinkung, hier keine Symlinks nötig

echo "✅ Headless-Setup abgeschlossen. Starte neu oder öffne eine neue Shell."
