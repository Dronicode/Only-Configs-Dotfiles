#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Dotfiles Deployment ==="
echo ""

# Make scripts executable
chmod +x "$SCRIPT_DIR/install-dependencies.sh"
chmod +x "$SCRIPT_DIR/make-symlinks.sh"

# Run install script
echo "Step 1: Installing dependencies..."
bash "$SCRIPT_DIR/install-dependencies.sh"
echo ""

# Run symlinks script
echo "Step 2: Creating symlinks..."
bash "$SCRIPT_DIR/make-symlinks.sh"
echo ""

echo "Step 3: Setting zsh as default shell..."
# Set zsh as default shell
SHELL_CHANGED=false
ZSH_PATH=$(grep -E '^/(usr/)?bin/zsh$' /etc/shells | head -1)
if [ -z "$ZSH_PATH" ]; then
    echo "⚠️  Could not find zsh in /etc/shells"
    echo "Available shells:"
    cat /etc/shells
else
    if [ "$SHELL" != "$ZSH_PATH" ]; then
        chsh -s "$ZSH_PATH"
        echo "✓ Default shell changed to zsh ($ZSH_PATH)"
        SHELL_CHANGED=true
    else
        echo "✓ Zsh is already the default shell"
    fi
fi
echo ""

echo "=== Deployment Complete ==="
echo ""

# Restart shell if it was changed, otherwise ask
if [ "$SHELL_CHANGED" = true ]; then
    echo "Restarting shell..."
    exec zsh
else
    read -p "Restart shell to apply config updates? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        exec zsh
    fi
fi