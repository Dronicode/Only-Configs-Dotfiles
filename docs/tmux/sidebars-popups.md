# Sidebars & Popups

**Prefix Key:** Ctrl-b (default)

## File Sidebar (tmux-sidebar plugin)

The sidebar provides a file tree view of your current directory with icons (using eza).

### Opening the sidebar

| Shortcut   | Mode   | Action (mnemonic)            | Note                 |
| ---------- | ------ | ---------------------------- | -------------------- |
| Prefix T   | Normal | toggle sidebar (\[T]ree)     | Standard (try first) |
| Prefix C-f | Normal | toggle sidebar (alt \[f]ile) | Alternative          |

If neither works, reload tmux config: Prefix : → `source-file ~/.config/tmux/tmux.conf` → try again.

### Using the sidebar

| Shortcut | Mode    | Action (mnemonic)  | Note                                   |
| -------- | ------- | ------------------ | -------------------------------------- |
| Enter    | Sidebar | open file/folder   | Open selected file or expand directory |
| q        | Sidebar | close sidebar      | Exit sidebar view                      |
| j / k    | Sidebar | navigate down / up | Move between files                     |
| h / l    | Sidebar | collapse / expand  | Fold/unfold directories                |
| /        | Sidebar | search             | Depends on plugin version              |

The sidebar shows file/folder icons via eza, matching your nvim neo-tree and zsh `ll` output.

---

## Sidebar Toggles (alternate bindings)

| Shortcut         | Mode   | Action (mnemonic)                  | Plugin       |
| ---------------- | ------ | ---------------------------------- | ------------ |
| Prefix Tab       | Normal | toggle sidebar directory \[t]ree   | tmux-sidebar |
| Prefix Backspace | Normal | toggle sidebar \[b]rowse file list | tmux-sidebar |

---

## Quick Popups

Open temporary overlay windows for quick tasks without disrupting your layout. Press Prefix f then the second key:

| Shortcut   | Mode   | Action (mnemonic)             | Working Dir      |
| ---------- | ------ | ----------------------------- | ---------------- |
| Prefix f g | Normal | popup git status (\[g]it) 80% | Current pane dir |
| Prefix f c | Normal | popup \[c]md terminal 80%     | Current pane dir |
| Prefix f h | Normal | popup terminal at \[h]ome 80% | Home directory   |

**Features:**

- Popups appear as overlays over your current layout.
- Close with `exit` or Ctrl-d to return to normal view.
- `fg` for quick git status; `fc` for a project-scoped shell; `fh` for system tasks from home.
