#!/bin/bash

set -e

echo "[HEADLESS] Starte Headless-Setup für Debian/Ubuntu..."

# --- Apt Tools ---
echo "[HEADLESS] Installiere Grundpakete mit APT..."
sudo apt update
sudo apt install -y \
  nala git curl tmux fzf \
  ffmpeg p7zip-full jq poppler-utils fd-find \
  ripgrep zoxide imagemagick

# --- Homebrew ---
echo "[HEADLESS] Installiere Homebrew..."
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# --- brew: gcc, nvim, yazi ---
echo "[HEADLESS] Installiere gcc (für brew builds)..."
brew install gcc

echo "[HEADLESS] Installiere neovim und yazi über brew..."
brew install neovim yazi

# --- Hinweis ---
echo "[HEADLESS] Setup abgeschlossen. Starte deine Shell neu oder führe 'source ~/.bashrc' aus."
