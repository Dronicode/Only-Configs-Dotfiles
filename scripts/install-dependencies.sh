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
    sudo pacman -S --needed --noconfirm eza fzf zsh neovim tmux git npm lazygit htop
    
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
    yay -S --noconfirm autojump
}

install_debian() {
    echo "Detected Debian/Ubuntu - using apt"
    sudo apt update
    sudo apt install -y zsh fzf autojump tmux git curl npm nodejs build-essential htop

    # Install lazygit if available in apt repositories
    if ! command -v lazygit &> /dev/null; then
        echo "Installing lazygit..."
        if ! sudo apt install -y lazygit; then
            echo "⚠️  Could not install lazygit via apt. Install manually from: https://github.com/jesseduffield/lazygit"
        fi
    fi
    
    # Install newer Neovim (Debian/Ubuntu repos have old versions)
    echo "Checking Neovim version..."
    
    # Check if nvim 0.11+ is already installed
    if command -v nvim &> /dev/null; then
        NVIM_VERSION=$(nvim --version | head -1 | grep -oP 'v?\K[0-9]+\.[0-9]+' | head -1)
        MAJOR=$(echo "$NVIM_VERSION" | cut -d. -f1)
        MINOR=$(echo "$NVIM_VERSION" | cut -d. -f2)
        
        if [ "$MAJOR" -gt 0 ] || ([ "$MAJOR" -eq 0 ] && [ "$MINOR" -ge 11 ]); then
            echo "✓ Neovim $NVIM_VERSION already installed"
        else
            echo "Neovim $NVIM_VERSION found, but need 0.11+. Upgrading..."
            NEED_INSTALL=true
        fi
    else
        echo "Neovim not found. Installing..."
        NEED_INSTALL=true
    fi
    
    if [ "$NEED_INSTALL" = true ]; then
        ARCH=$(uname -m)
        
        if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "armv7l" ]; then
            echo "ARM architecture - downloading tarball..."
            cd /tmp
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz
            sudo tar -xzf nvim-linux-arm64.tar.gz -C /usr/local --strip-components=1
            rm nvim-linux-arm64.tar.gz
            echo "✓ Neovim installed"
        else
            echo "x86_64 architecture - using AppImage..."
            sudo apt install -y libfuse2
            cd /tmp
            curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
            chmod u+x nvim.appimage
            sudo mv nvim.appimage /usr/local/bin/nvim
            echo "✓ Neovim installed"
        fi
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
    arch|manjaro|endeavouros|steamos)
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
        echo "  - lazygit"
        echo "  - htop"
        exit 1
        ;;
esac

echo "✓ Dependencies installed successfully"