#!/bin/bash
set -e
echo "📦 Installiere Headless-Tools (Ubuntu/Debian)..."
sudo apt update && sudo apt install -y \
  git yadm neovim tmux fzf ripgrep fd-find zoxide
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install yazi neovim
echo "✅ Headless-Setup abgeschlossen."
