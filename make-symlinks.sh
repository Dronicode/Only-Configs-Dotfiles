#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to safely create symlink (backs up existing files/dirs)
safe_link() {
    local source="$1"
    local target="$2"
    local use_n="${3:-false}"
    
    # Backup existing file or directory if not already a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        local backup="${target}.old.$(date +%Y%m%d_%H%M%S)"
        echo "  Backing up: $target → $backup"
        mv "$target" "$backup"
    fi
    
    # Create symlink
    if [ "$use_n" = "true" ]; then
        ln -sfn "$source" "$target"
    else
        ln -sf "$source" "$target"
    fi
}

mkdir -p "$HOME/.config/eza"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/tmux"
mkdir -p "$HOME/.config/wezterm"
mkdir -p "$HOME/.config/zsh/cache/completions"

# Eza - link theme file only
safe_link "$SCRIPT_DIR/eza/theme.yml" "$HOME/.config/eza/theme.yml"
echo "✓ Linked eza/theme.yml"

# Nvim - link entire directory (nvim creates files elsewhere)
safe_link "$SCRIPT_DIR/nvim/init.lua" "$HOME/.config/nvim/init.lua"
safe_link "$SCRIPT_DIR/nvim/lua" "$HOME/.config/nvim/lua" true
echo "✓ Linked nvim config"

# Tmux - link config file only
safe_link "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
echo "✓ Linked tmux.conf"

# WezTerm - link config file only
safe_link "$SCRIPT_DIR/wezterm/.wezterm.lua" "$HOME/.config/wezterm/.wezterm.lua"
echo "✓ Linked wezterm config"

# Zsh - link specific files only (not cache/history)
safe_link "$SCRIPT_DIR/zsh/ZDOTDIR/.aliases" "$HOME/.config/zsh/.aliases"
safe_link "$SCRIPT_DIR/zsh/ZDOTDIR/.keybinds" "$HOME/.config/zsh/.keybinds"
safe_link "$SCRIPT_DIR/zsh/ZDOTDIR/.p10k.zsh" "$HOME/.config/zsh/.p10k.zsh"
safe_link "$SCRIPT_DIR/zsh/ZDOTDIR/.zshrc" "$HOME/.config/zsh/.zshrc"
safe_link "$SCRIPT_DIR/zsh/ZDOTDIR/plugins.txt" "$HOME/.config/zsh/plugins.txt"
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
