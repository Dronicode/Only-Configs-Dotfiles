# Clipboard & Commands

**Prefix Key:** Ctrl-b (default)

## Clipboard Operations

### Quick Copy Mode Entry

| Shortcut | Mode   | Action (mnemonic)              | Note    |
| -------- | ------ | ------------------------------ | ------- |
| Prefix [ | Normal | enter copy mode                | Default |
| Prefix v | Normal | enter copy mode (quick \[v]is) | Custom  |

### Copy Mode (Vi-style)

#### Selection

| Shortcut | Mode      | Action (mnemonic)             |
| -------- | --------- | ----------------------------- |
| v        | Copy mode | begin visual selection        |
| C-v      | Copy mode | toggle rectangle (\[v] block) |
| y        | Copy mode | yank selection to buffer      |
| Escape   | Copy mode | cancel/exit copy mode         |

#### Navigation (vi keys in copy mode)

| Shortcut      | Mode      | Action (mnemonic)               |
| ------------- | --------- | ------------------------------- |
| h / j / k / l | Copy mode | move left / down / up / right   |
| w / b         | Copy mode | next \[w]ord / previous \[b]ord |
| g / G         | Copy mode | buffer start / buffer end       |
| f{char}       | Copy mode | find \[f]orward character       |
| ? / /         | Copy mode | search backward / forward       |

### Copy Mode with tmux-yank

| Shortcut | Mode      | Action (mnemonic)                         |
| -------- | --------- | ----------------------------------------- |
| y        | Copy mode | yank to system clipboard                  |
| Y        | Copy mode | yank then paste to command line (\[Y]ell) |

### Pasting

| Shortcut     | Mode   | Action (mnemonic)           | Note                       |
| ------------ | ------ | --------------------------- | -------------------------- |
| Prefix ]     | Normal | paste from tmux buffer      | Default tmux               |
| Ctrl+Shift+V | Shell  | paste from system clipboard | Terminal support dependent |
| Middle-click | Mouse  | paste from system clipboard | Requires mouse enabled     |

### Clipboard Workflow

1. Enter copy mode: Prefix [
2. Move with h/j/k/l, w/b, searches, etc.
3. Space to start selection, y to yank (tmux buffer or system via tmux-yank).
4. Paste with Prefix ] (tmux buffer) or Ctrl+Shift+V / middle-click (system clipboard).

---

## Tmux Commands

| Shortcut | Mode   | Action (mnemonic)     | Note         |
| -------- | ------ | --------------------- | ------------ |
| Prefix : | Normal | enter command prompt  | Default tmux |
| Prefix ? | Normal | list all key bindings | Default tmux |
| Prefix t | Normal | show \[t]ime          | Default tmux |

### Advanced Commands (examples)

```bash
# Enter command mode: Prefix :

# Resize pane to exact size
:resize-pane -D 10    # Down 10 lines
:resize-pane -U 5     # Up 5 lines
:resize-pane -L 20    # Left 20 columns
:resize-pane -R 15    # Right 15 columns

# Move pane to new window
:break-pane           # Move current pane to new window

# Join pane from another window
:join-pane -s :2      # Join pane from window 2

# Set pane title
:select-pane -T "My Title"

# Reload config
:source-file ~/.config/tmux/tmux.conf
```

### Scripting & Automation

```bash
# Create complex layouts programmatically
 tmux new-session -d -s dev
 tmux split-window -h
 tmux split-window -v
 tmux select-pane -t 0
 tmux send-keys 'nvim' C-m
 tmux attach -t dev
```

---

## Session Persistence (tmux-resurrect & tmux-continuum)

### Manual Saving & Restoring

| Shortcut      | Mode   | Action (mnemonic)       | Plugin         |
| ------------- | ------ | ----------------------- | -------------- |
| Prefix Ctrl-s | Normal | \[s]ave tmux session    | tmux-resurrect |
| Prefix Ctrl-r | Normal | \[r]estore tmux session | tmux-resurrect |

**What gets saved:** All windows, panes, layout, and running processes (with strategies for apps like nvim).

### Automatic Saving & Restoring (tmux-continuum)

- Saves sessions every 15 minutes and restores on tmux start automatically.
- First start after install attaches to the last saved session; subsequent starts resume the last layout.
- Manual usage still helpful before risky changes (Prefix Ctrl-s) or to recover (Prefix Ctrl-r).

**Check last saved snapshot:**

```bash
cat ~/.local/share/tmux/resurrect/last
```
