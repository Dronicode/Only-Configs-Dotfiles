# Windows, Panes, Sessions

**Prefix Key:** Ctrl-b (default)

## Window Management

### Basic Window Operations

| Shortcut | Mode   | Action (mnemonic)     | Note         |
| -------- | ------ | --------------------- | ------------ |
| Prefix c | Normal | \[c]reate new window  | Default tmux |
| Prefix & | Normal | kill current window   | Confirms     |
| Prefix , | Normal | rename current window | Default tmux |
| Prefix w | Normal | list all \[w]indows   | Default tmux |

### Window Navigation

| Shortcut   | Mode   | Action (mnemonic)       | Note         |
| ---------- | ------ | ----------------------- | ------------ |
| Prefix n   | Normal | \[n]ext window          | Default tmux |
| Prefix p   | Normal | \[p]revious window      | Default tmux |
| Prefix 0-9 | Normal | switch to window number | Default tmux |
| Prefix l   | Normal | \[l]ast active window   | Default tmux |

### Session Switcher (fzf)

| Shortcut | Mode   | Action (mnemonic)             | Note              |
| -------- | ------ | ----------------------------- | ----------------- |
| Prefix s | Normal | fuzzy \[s]witch session (fzf) | Custom (uses fzf) |

How it works: Prefix s → fuzzy menu of sessions → type to filter → Enter to switch → Esc to cancel. (Replaces default Prefix ).

---

## Pane Management

### Creating Panes (custom bindings)

| Shortcut | Mode   | Action (mnemonic)                 | Defined In |
| -------- | ------ | --------------------------------- | ---------- |
| Prefix > | Normal | split horizontally (side by side) | tmux.conf  |
| Prefix < | Normal | split vertically (top/bottom)     | tmux.conf  |

_Defaults for reference: Prefix % (horizontal), Prefix " (vertical)._

### Pane Navigation (vim-tmux-navigator)

| Shortcut | Mode   | Action (mnemonic)  | Defined By         |
| -------- | ------ | ------------------ | ------------------ |
| Ctrl-h   | Normal | navigate \[h]left  | vim-tmux-navigator |
| Ctrl-j   | Normal | navigate \[j]down  | vim-tmux-navigator |
| Ctrl-k   | Normal | navigate \[k]up    | vim-tmux-navigator |
| Ctrl-l   | Normal | navigate \[l]right | vim-tmux-navigator |

**Important:** Works in both tmux and Neovim; non-prefix bindings are set so these keys fall back to tmux when needed.

### Pane Resizing

| Shortcut      | Mode   | Action (mnemonic) | Note         |
| ------------- | ------ | ----------------- | ------------ |
| Prefix Ctrl-↑ | Normal | resize pane up    | Default tmux |
| Prefix Ctrl-↓ | Normal | resize pane down  | Default tmux |
| Prefix Ctrl-← | Normal | resize pane left  | Default tmux |
| Prefix Ctrl-→ | Normal | resize pane right | Default tmux |

### Other Pane Operations

| Shortcut     | Mode   | Action (mnemonic)              | Note            |
| ------------ | ------ | ------------------------------ | --------------- |
| Prefix x     | Normal | kill current window (pane)     | Confirms        |
| Prefix z     | Normal | toggle pane zoom (fullscreen)  | Default tmux    |
| Prefix { / } | Normal | swap with previous / next pane | Default tmux    |
| Prefix q     | Normal | kill current pane              | Custom override |
| Prefix o     | Normal | cycle through panes            | Default tmux    |
| Prefix Space | Normal | cycle through layouts          | Default tmux    |

---

## Session Management

### Session Operations

| Shortcut | Mode   | Action (mnemonic)          | Note         |
| -------- | ------ | -------------------------- | ------------ |
| Prefix d | Normal | detach from session        | Default tmux |
| Prefix s | Normal | list all \[s]essions       | Default tmux |
| Prefix $ | Normal | rename current session     | Default tmux |
| Prefix ( | Normal | switch to previous session | Default tmux |
| Prefix ) | Normal | switch to next session     | Default tmux |

### Command Line Session Management

```bash
# Create new session
tmux new -s session_name

# List sessions
tmux ls

# Attach to session
tmux attach -t session_name

# Kill session
tmux kill-session -t session_name

# Kill all sessions except current
tmux kill-session -a

# Rename session
tmux rename-session -t old_name new_name
```

### Session Management Workflow

1. Create named sessions per project: `tmux new -s project1`, etc.
2. Detach with Prefix d; list/switch with Prefix s (fzf) or Prefix )/(.
3. Save state before shutdown: Prefix Ctrl-s (tmux-resurrect).
4. Restore after reboot: Prefix Ctrl-r.

## Efficient Layout Creation

1. Start with one pane.
2. Split horizontally: Prefix >.
3. Split vertically inside each: Prefix <.
4. Navigate with Ctrl-h/j/k/l.
5. Resize with Prefix Ctrl-arrow.
6. Save layout: Prefix Ctrl-s (tmux-resurrect).
