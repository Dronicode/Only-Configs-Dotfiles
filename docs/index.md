---
icon: lucide/rocket
---

# Documentation Map

- [Navigation](navigation.md)
- Editors & shells
  - [Neovim](neovim.md)
  - [Tmux](tmux.md)
  - [Wezterm](wezterm.md)
  - [Zsh](zsh.md)
- Tools
  - [Lazygit](lazygit.md)
  - [Htop](htop.md)

## Getting Started (clone & deploy)

```bash
git clone https://github.com/Dronicode/Only-Configs-Dotfiles.git
cd Only-Configs-Dotfiles
./deploy-dotfiles.sh
```

The deploy script will install dependencies and create symlinks for the configs. It prompts to switch your default shell to zsh; accept that when prompted for everything to work properly.
