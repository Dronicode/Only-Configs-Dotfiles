# Tmux Configuration Cheatsheet

**Prefix Key:** `Ctrl-b` (default)

---

## Clipboard Operations

### Quick Copy Mode Entry

| Shortcut      | Action                  | Note       |
| ------------- | ----------------------- | ---------- |
| `Prefix [`    | Enter copy mode         | Default    |
| `Prefix v`    | Enter copy mode (quick) | Custom     |

### Copy Mode (Vi-style)

**Selection:**

| Shortcut | Action                   | Mode       |
| -------- | ------------------------ | ---------- |
| `v`      | Begin selection          | Copy mode  |
| `C-v`    | Toggle rectangle select  | Copy mode  |
| `y`      | Copy selection           | Copy mode  |
| `Escape` | Cancel/exit copy mode    | Copy mode  |

**Navigation (standard vi keys in copy mode):**

- `h/j/k/l` - Move cursor (left/down/up/right)
- `w` - Jump to next word
- `b` - Jump to previous word
- `G` - Jump to end of buffer
- `g` - Jump to start of buffer
- `f{char}` - Jump to character
- `?` - Search backward
- `/` - Search forward

**Copy Mode with tmux-yank plugin:**

| Shortcut | Action                                    | Mode      |
| -------- | ----------------------------------------- | --------- |
| `y`      | Copy selection to system clipboard        | Copy mode |
| `Y`      | Copy selection and paste to command line | Copy mode |

**Pasting:**

| Shortcut    | Action                  | Note                             |
| ----------- | ----------------------- | -------------------------------- |
| `Prefix ]`  | Paste from tmux buffer  | Default tmux                     |
| `Ctrl+Shift+V` | Paste from system     | Linux terminal (if supported)    |
| Middle-click | Paste from system       | If mouse is enabled              |

---

## File Sidebar (tmux-sidebar plugin)

The sidebar provides a file tree view of your current directory with icons (using eza).

**Opening the sidebar:**

The tmux-sidebar plugin uses the following keybindings (try them in order):

| Shortcut   | Action              | Note           |
| ---------- | ------------------- | -------------- |
| `Prefix T` | Toggle sidebar      | Standard (try first) |
| `Prefix C-f` | Toggle sidebar    | Alternative   |

If neither works, reload tmux config: `Prefix :` → `source-file ~/.config/tmux/tmux.conf` → try again

**Using the sidebar:**

Once open:

| Shortcut | Action           | Note |
| -------- | ---------------- | ---- |
| `Enter`  | Open file/folder | Open selected file or expand directory |
| `q`      | Close sidebar    | Exit sidebar view |
| `j/k`    | Navigate up/down | Move between files |
| `h/l`    | Collapse/expand  | Fold/unfold directories |
| `/`      | Search           | Search for files (depends on plugin version) |

The sidebar shows file/folder icons via **eza**, matching your nvim neo-tree and zsh `ll` output.

---

## Window Management

### Basic Window Operations

| Shortcut   | Action                | Note                  |
| ---------- | --------------------- | --------------------- |
| `Prefix c` | Create new window     | Default tmux          |
| `Prefix &` | Kill current window   | Asks for confirmation |
| `Prefix ,` | Rename current window | Default tmux          |
| `Prefix w` | List all windows      | Default tmux          |

### Window Navigation

| Shortcut     | Action                       | Note         |
| ------------ | ---------------------------- | ------------ |
| `Prefix n`   | Next window                  | Default tmux |
| `Prefix p`   | Previous window              | Default tmux |
| `Prefix 0-9` | Switch to window number      | Default tmux |
| `Prefix l`   | Switch to last active window | Default tmux |

### Session Management

| Shortcut | Action                              | Note                |
| -------- | ----------------------------------- | ------------------- |
| `Prefix s` | Fuzzy switch session                | Custom (uses fzf)   |

**How it works:**
- Press `Prefix s` (Ctrl-b then s)
- A fuzzy search menu appears with all your sessions
- Type to filter sessions
- Press Enter to switch to selected session
- Press Escape to cancel

(Default tmux session listing is `Prefix)`; this replaces it with fuzzy search)

---

## Pane Management

### Creating Panes (Custom Bindings)

| Shortcut   | Action                            | Defined In  |
| ---------- | --------------------------------- | ----------- |
| `Prefix >` | Split horizontally (side by side) | `tmux.conf` |
| `Prefix <` | Split vertically (top/bottom)     | `tmux.conf` |

**Note:** These are custom shortcuts that differ from tmux defaults:

- Default horizontal split: `Prefix %`
- Default vertical split: `Prefix "`

### Pane Navigation (vim-tmux-navigator plugin)

The `vim-tmux-navigator` plugin provides seamless navigation between tmux panes and vim splits:

| Shortcut | Action         | Defined By         |
| -------- | -------------- | ------------------ |
| `Ctrl-h` | Navigate left  | vim-tmux-navigator |
| `Ctrl-j` | Navigate down  | vim-tmux-navigator |
| `Ctrl-k` | Navigate up    | vim-tmux-navigator |
| `Ctrl-l` | Navigate right | vim-tmux-navigator |

**Important:** These shortcuts work both in tmux AND nvim, allowing seamless navigation!

Note: This repo's `tmux.conf` includes non-prefix bindings so tmux will accept `Ctrl-h/j/k/l` directly (no `Prefix` required). That enables `vim-tmux-navigator` to fall back from Neovim to tmux when Neovim has no split in that direction. Reload tmux config after changes with `tmux source-file ~/.config/tmux/tmux.conf`.

### Pane Resizing

| Shortcut        | Action            | Note         |
| --------------- | ----------------- | ------------ |
| `Prefix Ctrl-↑` | Resize pane up    | Default tmux |
| `Prefix Ctrl-↓` | Resize pane down  | Default tmux |
| `Prefix Ctrl-←` | Resize pane left  | Default tmux |
| `Prefix Ctrl-→` | Resize pane right | Default tmux |

### Other Pane Operations

| Shortcut       | Action                        | Note                  |
| -------------- | ----------------------------- | --------------------- |
| `Prefix x`     | Kill current window           | Asks for confirmation |
| `Prefix z`     | Toggle pane zoom (fullscreen) | Default tmux          |
| `Prefix {`     | Swap with previous pane       | Default tmux          |
| `Prefix }`     | Swap with next pane           | Default tmux          |
| `Prefix q`     | Kill current pane             | (custom - now kills pane) |
| `Prefix o`     | Cycle through panes           | Default tmux          |
| `Prefix Space` | Cycle through layouts         | Default tmux          |

---

## Session Management

### Session Operations

| Shortcut   | Action                     | Note         |
| ---------- | -------------------------- | ------------ |
| `Prefix d` | Detach from session        | Default tmux |
| `Prefix s` | List all sessions          | Default tmux |
| `Prefix $` | Rename current session     | Default tmux |
| `Prefix (` | Switch to previous session | Default tmux |
| `Prefix )` | Switch to next session     | Default tmux |

### Command Line Session Management

```bash
# Create new session
tmux new -s session_name

# List sessions
tmux ls

# Attach to session
tmux attach -t session_name
tmux a -t session_name

# Kill session
tmux kill-session -t session_name

# Kill all sessions except current
tmux kill-session -a

# Rename session
tmux rename-session -t old_name new_name
```

---

## Tmux Commands

| Shortcut   | Action                | Note         |
| ---------- | --------------------- | ------------ |
| `Prefix :` | Enter command mode    | Default tmux |
| `Prefix ?` | List all key bindings | Default tmux |
| `Prefix t` | Show time             | Default tmux |

---

## Session Persistence (tmux-resurrect & tmux-continuum)

### Manual Saving & Restoring

The `tmux-resurrect` plugin saves and restores tmux sessions manually:

| Shortcut        | Action               | Plugin         |
| --------------- | -------------------- | -------------- |
| `Prefix Ctrl-s` | Save tmux session    | tmux-resurrect |
| `Prefix Ctrl-r` | Restore tmux session | tmux-resurrect |

**What gets saved:** All windows, panes, layout, and running processes (with strategy for specific apps like nvim).

### Automatic Saving & Restoring (tmux-continuum)

`tmux-continuum` automatically saves your session every 15 minutes and restores it when tmux starts—no manual intervention needed.

**Auto-restore behavior:**
- On first tmux start after install: You'll be attached to the last saved session automatically
- Subsequent starts: Same session and layout restored
- Sessions are auto-saved every 15 minutes in background

**When to use manually:**
- `Prefix Ctrl-s` - Save before something risky (e.g., major refactoring)
- `Prefix Ctrl-r` - Restore if something corrupts (though auto-restore usually handles it)

**How to check what was saved:**
```bash
cat ~/.local/share/tmux/resurrect/last  # Shows timestamp and details of last save
```

---**What gets saved:**

- All sessions, windows, and panes
- Window/pane layouts
- Current working directory
- Running programs (limited)

---

## Sidebar (tmux-sidebar)

The `tmux-sidebar` plugin provides a directory tree:

| Shortcut           | Action                             | Plugin       |
| ------------------ | ---------------------------------- | ------------ |
| `Prefix Tab`       | Toggle sidebar with directory tree | tmux-sidebar |
| `Prefix Backspace` | Toggle sidebar with file list      | tmux-sidebar |

---

## Quick Popups

Open temporary overlay windows for quick tasks without disrupting your layout. Press `Prefix f` then the second key:

| Shortcut   | Action                           | Working Dir      |
| ---------- | -------------------------------- | ---------------- |
| `Prefix f g` | Open git status popup (80%)      | Current pane dir |
| `Prefix f c` | Open terminal popup (80%)        | Current pane dir |
| `Prefix f h` | Open terminal popup (80%)        | Home directory   |

**Features:**
- Popups appear as overlays over your current layout
- Close with `exit` or `Ctrl-d` to return to normal view
- `fg` - Perfect for quick git status checks
- `fc` - Terminal in current project directory
- `fh` - Terminal starting from home (good for system tasks)
- Useful for quick commands without disrupting split layout

---

## Mouse Support

**Enabled** by default in your config (`set -g mouse on`):

- Click to select pane
- Click on window name to switch
- Drag pane borders to resize
- Scroll to navigate history
- Double-click to select word
- Triple-click to select line
- Click and drag to select text (auto-copies with tmux-yank)

---

## Status Bar

Your status bar shows:

- **Left:** Session name
- **Right:** Hostname, date (YYYY-MM-DD), and time (HH:MM)
- **Theme:** Tokyo Night
- **Refresh:** Every 1 second

---

## Configuration Details

### Settings

| Setting            | Value        | Defined In  |
| ------------------ | ------------ | ----------- |
| Prefix key         | `Ctrl-b`     | `tmux.conf` |
| Escape time        | 500ms        | `tmux.conf` |
| History limit      | 10,000 lines | `tmux.conf` |
| Mouse support      | Enabled      | `tmux.conf` |
| Base index         | 1 (not 0)    | `tmux.conf` |
| Window renaming    | Automatic    | `tmux.conf` |
| Window renumbering | Enabled      | `tmux.conf` |

### Installed Plugins

1. **tpm** - Tmux Plugin Manager (required)
2. **tmux-sensible** - Sensible default settings
3. **fabioluciano/tmux-tokyo-night** - Tokyo Night theme
4. **christoomey/vim-tmux-navigator** - Seamless vim/tmux navigation
5. **tmux-plugins/tmux-prefix-highlight** - Highlights when prefix is active
6. **tmux-plugins/tmux-resurrect** - Save/restore sessions
7. **tmux-plugins/tmux-sidebar** - Directory tree sidebar
8. **tmux-plugins/tmux-yank** - Copy to system clipboard

### Plugin Management Commands

```bash
# Install new plugins (after adding to config)
Prefix I (capital i)

# Update plugins
Prefix U (capital u)

# Uninstall plugins (after removing from config)
Prefix Alt-u
```

---

## Custom Keybinding Highlights

### Your Unique Customizations:

1. **`Prefix >`** - Horizontal split (instead of default `%`)
2. **`Prefix <`** - Vertical split (instead of default `"`)
3. **Vim-style navigation** - `Ctrl-hjkl` works seamlessly between tmux and nvim
4. **Pane paths** - New panes open in the current pane's directory

---

## Tips & Workflows

### Clipboard Workflow

1. **Copy from tmux to system:**

   - Enter copy mode: `Prefix [`
   - Navigate to text
   - Press `Space` to start selection
   - Navigate to select text
   - Press `y` to copy to system clipboard
   - Exit with `q` or `Escape`

2. **Paste into tmux:**
   - From tmux buffer: `Prefix ]`
   - From system clipboard: `Ctrl+Shift+V` (Linux terminal) or middle mouse button

### Session Management Workflow

```bash
# Create a named session for each project
tmux new -s project1
tmux new -s project2

# Detach with Prefix d
# List and switch with Prefix s

# Save session state before shutting down
# Prefix Ctrl-s

# Restore after reboot
# Prefix Ctrl-r
```

### Efficient Layout Creation

1. Start with one pane
2. Split horizontally: `Prefix >`
3. Split vertically in each pane: `Prefix <`
4. Navigate with `Ctrl-hjkl`
5. Resize as needed with `Prefix Ctrl-arrows`
6. Save layout: `Prefix Ctrl-s`

---

## Advanced Commands

### Command Mode Examples

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
