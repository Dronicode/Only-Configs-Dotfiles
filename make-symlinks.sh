#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config/eza"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/zsh/cache/completions"

# Eza - link theme file only
ln -sf "$SCRIPT_DIR/eza/theme.yml" "$HOME/.config/eza/theme.yml"
echo "✓ Linked eza/theme.yml"

# Nvim - link entire directory (nvim creates files elsewhere)
ln -sf "$SCRIPT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sfn "$SCRIPT_DIR/nvim/lua" "$HOME/.config/nvim/lua"
echo "✓ Linked nvim config"

# Tmux - link config file only
ln -sf "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
echo "✓ Linked tmux.conf"

# Zsh - link specific files only (not cache/history)
ln -sf "$SCRIPT_DIR/zsh/ZDOTDIR/.aliases" "$HOME/.config/zsh/.aliases"
ln -sf "$SCRIPT_DIR/zsh/ZDOTDIR/.p10k.zsh" "$HOME/.config/zsh/.p10k.zsh"
ln -sf "$SCRIPT_DIR/zsh/ZDOTDIR/.zshrc" "$HOME/.config/zsh/.zshrc"
ln -sf "$SCRIPT_DIR/zsh/ZDOTDIR/plugins.txt" "$HOME/.config/zsh/plugins.txt"
echo "✓ Linked zsh config files"

# Zsh system environment (requires sudo)
echo "Linking /etc/zsh/zshenv (requires sudo)..."
if sudo ln -sf "$SCRIPT_DIR/zsh/etc/zsh/zshenv" /etc/zsh/zshenv 2>/dev/null; then
    echo "✓ Linked /etc/zsh/zshenv"
else
    echo "Failed to link /etc/zsh/zshenv"
    echo "Run manually: sudo ln -sf $SCRIPT_DIR/zsh/etc/zsh/zshenv /etc/zsh/zshenv"
fi

echo "✓ Symlinks created"
