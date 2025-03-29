#!/usr/bin/env bash
set -e

echo "🌿 Setting up your dotfiles from nix-dots..."

REPO="https://github.com/DanielisMellow/nix-dots"
DOTFILES_DIR="$HOME/.nix-dots"
CONFIG_DIR="$HOME/.config"
PICTURES_DIR="$HOME/Pictures/wallpapers"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# ───────────────
# 📦 Clone dotfiles repo
# ───────────────
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "📥 Cloning nix-dots to $DOTFILES_DIR..."
    git clone "$REPO" "$DOTFILES_DIR"
else
    echo "🔁 nix-dots already exists at $DOTFILES_DIR"
fi

# ───────────────
# 🔗 Link .config directories
# ───────────────
echo "🔗 Linking .config folders..."
for dir in "$DOTFILES_DIR/.config/"*; do
    name=$(basename "$dir")
    target="$CONFIG_DIR/$name"

    # Remove real folders (not symlinks)
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "🧼 Removing existing $target (real directory)..."
        rm -rf "$target"
    fi

    echo " ⤷ $name → $target"
    ln -sfn "$dir" "$target"
done

# ───────────────
# 🔗 Link .tmux.conf
# ───────────────
echo "🔗 Linking .tmux.conf..."
if [ -e "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo "🧼 Removing existing ~/.tmux.conf (real file)..."
    rm -f "$HOME/.tmux.conf"
fi
ln -sfn "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"

# ───────────────
# 🔗 Link .icons
# ───────────────
echo "🎨 Linking .icons..."
if [ -e "$HOME/.icons" ] && [ ! -L "$HOME/.icons" ]; then
    echo "🧼 Removing existing ~/.icons (real directory)..."
    rm -rf "$HOME/.icons"
fi
ln -sfn "$DOTFILES_DIR/.icons" "$HOME/.icons"

# ───────────────
# 🧩 Tmux Plugin Manager (TPM)
# ───────────────
echo "🔌 Installing Tmux Plugin Manager (TPM)..."
if [ ! -d "$TPM_DIR" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "🌀 TPM already installed at $TPM_DIR"
fi

# ───────────────
# 🌄 Copy wallpapers
# ───────────────
echo "🖼️ Moving wallpapers to $PICTURES_DIR..."
mkdir -p "$PICTURES_DIR"
cp -r "$DOTFILES_DIR/wallpapers/"* "$PICTURES_DIR/" 2>/dev/null || echo "⚠️ No wallpapers to copy."

# ───────────────
# ✅ Done
# ───────────────
echo ""
echo "✅ nix-dots setup complete!"
echo "👉 Open tmux and press prefix + I to install plugins"
