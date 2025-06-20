#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Starting dotfiles setup..."

# -----------------------------
# Sanity check
# -----------------------------
if ! command -v yay >/dev/null 2>&1; then
  echo "❌ 'yay' not found. Please install yay manually first."
  exit 1
fi

# -----------------------------
# Install pacman packages
# -----------------------------
if [[ -f pacman-packages.txt ]]; then
  echo "📦 Installing pacman packages..."
  sudo pacman -Syu --needed --noconfirm $(< pacman-packages.txt)
else
  echo "⚠️  pacman-packages.txt not found, skipping."
fi

# -----------------------------
# Install AUR packages
# -----------------------------
if [[ -f aur-packages.txt ]]; then
  echo "📦 Installing AUR packages..."
  yay -S --needed --noconfirm $(< aur-packages.txt)
else
  echo "⚠️  aur-packages.txt not found, skipping."
fi

# Install TPM (Tmux Plugin Manager)
echo "🔧 Installing TPM (Tmux Plugin Manager)..."
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ -d "$TPM_DIR" ]; then
    echo "✅ TPM already installed at $TPM_DIR"
else
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "✅ TPM installed"
fi

# -----------------------------
# Stow dotfiles (every subdir)
# -----------------------------
echo "🔗 Stowing dotfiles..."
cd "$(dirname "$0")" || exit 1

for dir in */ ; do
  [[ "$dir" =~ ^(pacman-packages.txt|aur-packages.txt)$ ]] && continue
  [[ -d "$dir" ]] && echo " → $dir" && stow --adopt "${dir%/}"
done

# -----------------------------
# Set Zsh as default shell
# -----------------------------
if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo "🐚 Changing default shell to zsh..."
  chsh -s /usr/bin/zsh
fi

echo "✅ Setup complete. You may want to restart your shell."
