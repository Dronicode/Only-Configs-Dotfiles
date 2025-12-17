#!/usr/bin/env bash
set -e

echo "Installing dependencies..."

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    OS="unknown"
fi

install_arch() {
    echo "Detected Arch Linux - using pacman"
    sudo pacman -S --needed --noconfirm eza fzf zsh neovim tmux git npm
    
    # Install yay if not present (needed for AUR packages)
    if ! command -v yay &> /dev/null; then
        echo "Installing yay (AUR helper)..."
        sudo pacman -S --needed --noconfirm base-devel git
        cd /tmp
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd -
        rm -rf /tmp/yay
        echo "✓ yay installed"
    fi
    
    # Install autojump from AUR
    echo "Installing autojump from AUR..."
    yay -S --needed --noconfirm autojump
}

install_debian() {
    echo "Detected Debian/Ubuntu - using apt"
    sudo apt update
    sudo apt install -y zsh fzf autojump tmux git curl npm nodejs build-essential
    
    # Install newer Neovim (Debian/Ubuntu repos have old versions)
    echo "Installing Neovim (latest stable via AppImage)..."
    if ! command -v nvim &> /dev/null || [ "$(nvim --version | head -1 | cut -d' ' -f2 | cut -d'.' -f1-2)" != "0.11" ]; then
        # Install FUSE for AppImage support
        sudo apt install -y libfuse2
        
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x nvim.appimage
        sudo mv nvim.appimage /usr/local/bin/nvim
        echo "✓ Neovim installed"
    else
        echo "✓ Neovim already up to date"
    fi
    
    # eza requires manual installation on Debian/Ubuntu
    if ! command -v eza &> /dev/null; then
        echo "Installing eza..."
        sudo mkdir -p /etc/apt/keyrings
        wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
        echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
        sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
        sudo apt update
        sudo apt install -y eza
    fi
}

# Install based on OS
case "$OS" in
    arch|manjaro|endeavouros)
        install_arch
        ;;
    ubuntu|debian|pop|linuxmint)
        install_debian
        ;;
    *)
        echo "⚠️  Warning: Unsupported OS detected: $OS"
        echo "Please manually install the following packages:"
        echo "  - eza (https://github.com/eza-community/eza)"
        echo "  - autojump"
        echo "  - fzf"
        echo "  - zsh"
        echo "  - neovim"
        echo "  - tmux"
        echo "  - git"
        exit 1
        ;;
esac

echo "✓ Dependencies installed successfully"

