---
icon: lucide/rocket
---

# Documentation Map

Editors & shells

- [Neovim](Editors/neovim.md)
- [Tmux](Shells/tmux.md)
- [Wezterm](Shells/wezterm.md)
- [Zsh](Shells/zsh.md)

Tools

- [Lazygit](Tools/lazygit.md)
- [Htop](Tools/htop.md)

Also useful

- [Navigation](navigation.md)

## Getting Started (clone & deploy)

```bash
git clone https://github.com/Dronicode/Only-Configs-Dotfiles.git
cd Only-Configs-Dotfiles
./deploy-dotfiles.sh
```

The deploy script will install dependencies and create symlinks for the configs. It prompts to switch your default shell to zsh; accept that when prompted for everything to work properly.
