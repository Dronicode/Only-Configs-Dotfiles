---
icon: lucide/rocket
---

# **O**nly **C**onfigs & **D**ocumentation

Editors

- [Neovim](Editors/neovim/index.md)

Shells

- [Tmux](Shells/tmux/index.md)
- [Wezterm](Shells/wezterm.md)
- [Zsh](Shells/zsh/index.md)

Tools

- [Htop](Tools/htop.md)
- [Lazygit](Tools/lazygit.md)

## Getting Started (clone & deploy)

```bash
git clone https://github.com/Dronicode/Only-Configs-Dotfiles.git
cd Only-Configs-Dotfiles
./deploy-dotfiles.sh
```

The deploy script will install dependencies and create symlinks for the configs. It prompts to switch your default shell to zsh; accept that when prompted for everything to work properly.
