# Configuration and plugins

---

## Mouse Support

Enabled by default (`set -g mouse on`): click to select pane or window, drag borders to resize, scroll to navigate history, double-click word, triple-click line, drag to select (auto-copies with tmux-yank).

## Status Bar

Left: session name. Right: hostname, date (YYYY-MM-DD), time (HH:MM). Theme: Tokyo Night. Refresh: every 1s.

## Configuration Details

### Settings

| Setting            | Value        | Defined In |
| ------------------ | ------------ | ---------- |
| Prefix key         | Ctrl-b       | tmux.conf  |
| Escape time        | 500ms        | tmux.conf  |
| History limit      | 10,000 lines | tmux.conf  |
| Mouse support      | Enabled      | tmux.conf  |
| Base index         | 1 (not 0)    | tmux.conf  |
| Window renaming    | Automatic    | tmux.conf  |
| Window renumbering | Enabled      | tmux.conf  |

### Installed Plugins

1. tpm (plugin manager)
2. tmux-sensible
3. fabioluciano/tmux-tokyo-night (theme)
4. christoomey/vim-tmux-navigator
5. tmux-plugins/tmux-prefix-highlight
6. tmux-plugins/tmux-resurrect
7. tmux-plugins/tmux-sidebar
8. tmux-plugins/tmux-yank

### Plugin Management Commands

```bash
# Install new plugins (after adding to config)
Prefix I

# Update plugins
Prefix U

# Uninstall removed plugins
Prefix Alt-u
```

## Custom Keybinding Highlights

1. Prefix > — horizontal split (instead of %)
2. Prefix < — vertical split (instead of ")
3. Vim-style navigation — Ctrl-h/j/k/l across tmux and nvim
4. Pane paths — new panes inherit current pane's directory
