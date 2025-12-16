# Zsh Configuration Cheatsheet

**Shell:** Zsh with Antidote plugin manager
**Theme:** Powerlevel10k

---

## Clipboard Operations

### System Clipboard Integration

**Copy to clipboard:**

```bash
# Pipe command output to clipboard
command | xclip -selection clipboard         # Linux (X11)
command | wl-copy                            # Linux (Wayland)
command | pbcopy                             # macOS

# Copy file contents
cat file.txt | xclip -selection clipboard
```

**Paste from clipboard:**

```bash
# Paste clipboard contents
xclip -selection clipboard -o               # Linux (X11)
wl-paste                                     # Linux (Wayland)
pbpaste                                      # macOS

# Paste and pipe to command
xclip -selection clipboard -o | command
```

**Terminal shortcuts:**

- `Ctrl+Shift+C` - Copy selected text (most Linux terminals)
- `Ctrl+Shift+V` - Paste from clipboard (most Linux terminals)
- Middle mouse button - Paste primary selection (Linux)

---

## Key Bindings

### Command Line Editing (Emacs mode)

| Shortcut | Action                      | Note    |
| -------- | --------------------------- | ------- |
| `Ctrl+A` | Move to start of line       | Default |
| `Ctrl+E` | Move to end of line         | Default |
| `Ctrl+K` | Kill (cut) to end of line   | Default |
| `Ctrl+U` | Kill (cut) to start of line | Default |
| `Ctrl+W` | Kill (cut) previous word    | Default |
| `Ctrl+Y` | Yank (paste) killed text    | Default |
| `Ctrl+L` | Clear screen                | Default |
| `Ctrl+R` | Reverse history search      | Default |
| `Ctrl+S` | Forward history search      | Default |
| `Ctrl+C` | Cancel current command      | Default |
| `Ctrl+D` | Exit shell (or delete char) | Default |
| `Ctrl+Z` | Suspend current process     | Default |

### History Navigation (Custom)

| Shortcut         | Action                        | Defined In                              |
| ---------------- | ----------------------------- | --------------------------------------- |
| `↑` (Up arrow)   | History substring search up   | `.zshrc` (zsh-history-substring-search) |
| `↓` (Down arrow) | History substring search down | `.zshrc` (zsh-history-substring-search) |

**How it works:** Start typing a command, then use arrow keys to search through history for commands that START with what you typed.

Example:

```bash
# Type: git
# Press ↑: cycles through "git commit", "git push", "git pull", etc.
```

---

## File Navigation

### Custom Aliases

| Alias    | Command     | Defined In |
| -------- | ----------- | ---------- |
| `~/`     | `cd ~`      | `.aliases` |
| `../`    | `cd ../`    | `.aliases` |
| `../../` | `cd ../../` | `.aliases` |

### Directory Navigation

- `cd -` - Go to previous directory
- `cd` or `cd ~` - Go to home directory
- `~` - Home directory shortcut (use in paths: `~/Documents`)

### Autojump Plugin

Once installed and trained, jump to frequently used directories:

```bash
j project      # Jump to ~/Projects/my-project
j doc          # Jump to ~/Documents
jc config      # Jump to directory and open child directory
```

### Interactive CD (zsh-interactive-cd)

- Type a partial path and press `Tab` to interactively browse directories
- Use arrow keys to navigate, `Enter` to select

---

## File Listing (eza)

### Custom Aliases

| Alias | Command                                                                                   | Description         | Defined In |
| ----- | ----------------------------------------------------------------------------------------- | ------------------- | ---------- |
| `ll`  | `eza -alThM --icons --git-ignore --git-repos-no-status --git -L2 --total-size --no-user`  | Detailed list view  | `.aliases` |
| `llb` | `eza -alThMB --icons --git-ignore --git-repos-no-status --git -L2 --total-size --no-user` | List with blocks    | `.aliases` |
| `llu` | `eza -alThM --icons --git-ignore --git-repos-no-status --git -L2 --total-size`            | List with user info | `.aliases` |

**Features:**

- `-a` - Show hidden files
- `-l` - Long format
- `-T` - Tree view (2 levels deep)
- `-h` - Human-readable sizes
- `-M` - Permission octal notation
- `--icons` - Show file type icons
- `--git` - Show git status
- `--total-size` - Show directory total size

---

## Fuzzy Finding (FZF)

The FZF plugin provides fuzzy finding capabilities:

### Key Bindings

| Shortcut | Action                            | Plugin |
| -------- | --------------------------------- | ------ |
| `Ctrl+R` | Fuzzy search command history      | fzf    |
| `Ctrl+T` | Fuzzy search files in current dir | fzf    |
| `Alt+C`  | Fuzzy search directories and cd   | fzf    |

### Usage Examples

```bash
# Search history (Ctrl+R)
# Type partial command, use arrow keys to select, Enter to execute

# Insert file path (Ctrl+T)
nvim <Ctrl+T>  # Opens fuzzy file finder, selected path inserted

# Change directory (Alt+C)
<Alt+C>  # Opens directory finder, cd's to selected directory
```

### Command Line Usage

```bash
# Fuzzy find and open file
nvim $(fzf)

# Fuzzy find and kill process
kill -9 $(ps aux | fzf | awk '{print $2}')

# Fuzzy search and preview files
fzf --preview 'cat {}'
```

---

## Git Shortcuts

The OMZ Git plugin provides numerous aliases:

### Common Git Aliases

| Alias  | Command                       | Description                          |
| ------ | ----------------------------- | ------------------------------------ |
| `g`    | `git`                         | Git command                          |
| `ga`   | `git add`                     | Stage files                          |
| `gaa`  | `git add --all`               | Stage all changes                    |
| `gb`   | `git branch`                  | List branches                        |
| `gba`  | `git branch -a`               | List all branches (including remote) |
| `gbd`  | `git branch -d`               | Delete branch                        |
| `gc`   | `git commit -v`               | Commit with diff                     |
| `gc!`  | `git commit -v --amend`       | Amend last commit                    |
| `gcm`  | `git checkout main`           | Checkout main branch                 |
| `gco`  | `git checkout`                | Checkout branch/file                 |
| `gd`   | `git diff`                    | Show unstaged changes                |
| `gds`  | `git diff --staged`           | Show staged changes                  |
| `gf`   | `git fetch`                   | Fetch from remote                    |
| `gl`   | `git pull`                    | Pull from remote                     |
| `glog` | `git log --oneline --graph`   | Pretty log                           |
| `gp`   | `git push`                    | Push to remote                       |
| `gpf`  | `git push --force-with-lease` | Force push (safer)                   |
| `grb`  | `git rebase`                  | Rebase                               |
| `grbi` | `git rebase -i`               | Interactive rebase                   |
| `gst`  | `git status`                  | Show status                          |
| `gsta` | `git stash push`              | Stash changes                        |
| `gstp` | `git stash pop`               | Apply and remove stash               |

**View all git aliases:**

```bash
alias | grep git
```

---

## Python Shortcuts

### Pip Plugin Aliases

| Alias   | Command                           | Description               |
| ------- | --------------------------------- | ------------------------- |
| `pipi`  | `pip install`                     | Install package           |
| `pipup` | `pip install --upgrade`           | Upgrade package           |
| `pipu`  | `pip uninstall`                   | Uninstall package         |
| `pipir` | `pip install -r requirements.txt` | Install from requirements |

### Python Plugin

Provides completion for Python commands and virtual environment support.

---

## Docker Shortcuts

### Docker Plugin Aliases

| Alias   | Command           | Description                  |
| ------- | ----------------- | ---------------------------- |
| `dps`   | `docker ps`       | List running containers      |
| `dpsa`  | `docker ps -a`    | List all containers          |
| `di`    | `docker images`   | List images                  |
| `drm`   | `docker rm`       | Remove container             |
| `drmi`  | `docker rmi`      | Remove image                 |
| `dex`   | `docker exec -it` | Execute command in container |
| `dlog`  | `docker logs`     | Show container logs          |
| `dlogf` | `docker logs -f`  | Follow container logs        |
| `drun`  | `docker run`      | Run container                |
| `drit`  | `docker run -it`  | Run container interactively  |

### Docker Compose Plugin Aliases

| Alias   | Command                  | Description               |
| ------- | ------------------------ | ------------------------- |
| `dco`   | `docker-compose`         | Docker compose command    |
| `dcup`  | `docker-compose up`      | Start services            |
| `dcupd` | `docker-compose up -d`   | Start services (detached) |
| `dcdn`  | `docker-compose down`    | Stop services             |
| `dcl`   | `docker-compose logs`    | Show logs                 |
| `dclf`  | `docker-compose logs -f` | Follow logs               |
| `dcps`  | `docker-compose ps`      | List services             |
| `dcr`   | `docker-compose restart` | Restart services          |
| `dcb`   | `docker-compose build`   | Build services            |

---

## NPM Shortcuts

### NPM Plugin Aliases

| Alias  | Command       | Description            |
| ------ | ------------- | ---------------------- |
| `npmg` | `npm i -g`    | Install globally       |
| `npmi` | `npm install` | Install dependencies   |
| `npms` | `npm start`   | Run start script       |
| `npmt` | `npm test`    | Run tests              |
| `npmr` | `npm run`     | Run script             |
| `npmD` | `npm i -D`    | Install dev dependency |

---

## Miscellaneous Aliases

| Alias     | Command                  | Description                        | Defined In |
| --------- | ------------------------ | ---------------------------------- | ---------- |
| `xx`      | `clear`                  | Clear terminal                     | `.aliases` |
| `diff`    | `colordiff -w`           | Colored diff (ignore whitespace)   | `.aliases` |
| `diffy`   | `colordiff -y -w -W=200` | Side-by-side colored diff          | `.aliases` |
| `ssh`     | `ssh.exe`                | Use Windows SSH (WSL specific)     | `.aliases` |
| `ssh-add` | `ssh-add.exe`            | Use Windows ssh-add (WSL specific) | `.aliases` |

---

## Auto-suggestions

The `zsh-autosuggestions` plugin suggests commands as you type based on history:

- **Accept suggestion:** `→` (Right arrow) or `End`
- **Accept next word:** `Ctrl+→`
- **Suggestions appear in gray** as you type

---

## Powerlevel10k Prompt

### Customization

- Run `p10k configure` to customize your prompt
- Configuration stored in: `~/.config/zsh/.p10k.zsh`

### Prompt Segments

Your prompt can show:

- Current directory
- Git branch and status
- Command execution time
- Error status
- Python/Node/Go version
- Time
- And much more!

---

## Configuration Details

### Files & Locations

| File             | Location                     | Purpose                         |
| ---------------- | ---------------------------- | ------------------------------- |
| `zshenv`         | `/etc/zsh/zshenv`            | Sets ZDOTDIR to `~/.config/zsh` |
| `.zshrc`         | `~/.config/zsh/.zshrc`       | Main config file                |
| `.aliases`       | `~/.config/zsh/.aliases`     | Custom aliases                  |
| `.p10k.zsh`      | `~/.config/zsh/.p10k.zsh`    | Powerlevel10k config            |
| `plugins.txt`    | `~/.config/zsh/plugins.txt`  | Plugin list for Antidote        |
| History          | `~/.config/zsh/.zsh_history` | Command history                 |
| Completion cache | `~/.config/zsh/.zcompcache`  | Completion cache                |

### Settings

| Setting      | Value         | Defined In                 |
| ------------ | ------------- | -------------------------- |
| History size | 1000 commands | `.zshrc`                   |
| Editor       | nvim          | `.zshrc` (VISUAL variable) |
| Key bindings | Emacs mode    | `.zshrc`                   |
| Locale       | en_GB.UTF-8   | `.zshrc`                   |
| FZF base     | /bin/fzf      | `.zshrc`                   |

### Installed Plugins

**OMZ Plugins:**

- `alias-finder` - Find aliases for commands
- `autojump` - Smart directory jumping
- `docker` - Docker aliases and completion
- `docker-compose` - Docker Compose aliases
- `fzf` - Fuzzy finder integration
- `gh` - GitHub CLI integration
- `git` - Extensive git aliases
- `golang` - Go development shortcuts
- `npm` - NPM aliases
- `pip` - Python pip aliases
- `python` - Python completion
- `zsh-interactive-cd` - Interactive directory browsing

**Additional Plugins:**

- `fast-syntax-highlighting` - Faster syntax highlighting
- `zsh-completions` - Additional completion definitions
- `powerlevel10k` - Feature-rich prompt theme
- `zsh-autosuggestions` - Command suggestions from history
- `zsh-history-substring-search` - Better history search

---

## Tips & Workflows

### Command History Workflow

```bash
# Start typing command
git pu

# Press ↑ to cycle through commands starting with "git pu"
# Shows: git push, git pull, etc.

# Or use Ctrl+R for fuzzy search
<Ctrl+R> git push  # Fuzzy search through all history
```

### FZF Integration Workflow

```bash
# Quick file editing
nvim <Ctrl+T>
# Opens fuzzy finder, select file, nvim opens it

# Quick directory change
<Alt+C>
# Browse directories, select one, instantly cd there

# Kill process interactively
kill -9 $(ps aux | fzf)
# Browse running processes, select one, kill it
```

### Alias Discovery

```bash
# Find aliases for a command
alias-finder "git status"
# Shows: gst, gstat, etc.

# Enable automatic alias finding
# Add to .zshrc: zstyle ':omz:plugins:alias-finder' autoload yes
```

### Git Workflow Example

```bash
gst           # Check status
ga .          # Stage all changes
gc            # Commit with message
gp            # Push to remote
```

### Docker Workflow Example

```bash
dcupd         # Start services in background
dclf          # Follow logs
dcps          # Check running services
dcdn          # Stop everything
```

---

## Custom Configuration Highlights

### Your Unique Customizations:

1. **ZDOTDIR** - Config stored in `~/.config/zsh` (not default `~`)
2. **History substring search** - Arrow keys search by what you've typed
3. **Eza aliases** - Highly customized file listing with icons and git status
4. **WSL integration** - SSH aliases point to Windows executables
5. **Emacs key bindings** - `bindkey -e` for Emacs-style editing
6. **Auto tmux disabled** - Commented out auto-start tmux code (can be enabled)

---

## Advanced Tips

### Plugin Management (Antidote)

```bash
# Update all plugins
# Edit ~/.config/zsh/plugins.txt, then:
antidote load ~/.config/zsh/plugins.txt

# Bundle a new plugin
# Add line to plugins.txt:
# username/repo-name

# Then reload:
source ~/.config/zsh/.zshrc
```

### Completion System

```bash
# Rebuild completion cache
rm ~/.config/zsh/.zcompdump
compinit

# Enable completion menu selection
# Already configured: zstyle ':completion:*' menu select
# Navigate with arrow keys, Enter to select
```

### History Management

```bash
# Search history
history | grep command

# Execute command from history
!123          # Execute command #123
!!            # Execute last command
!$            # Last argument of previous command
!*            # All arguments of previous command

# History expansion
^old^new      # Replace old with new in last command
```

### Environment Variables

```bash
# Current working variables:
echo $VISUAL        # nvim
echo $LANG          # en_GB.UTF-8
echo $ZDOTDIR       # ~/.config/zsh
echo $ZSH_CACHE_DIR # ~/.config/zsh/cache
```

---

## Troubleshooting

### Common Issues

**Slow startup:**

```bash
# Profile zsh startup
time zsh -i -c exit

# Disable plugins one by one in plugins.txt to identify culprit
```

**Completion not working:**

```bash
# Rebuild completion cache
rm ~/.config/zsh/.zcompdump*
compinit -d ~/.config/zsh/.zcompdump
```

**Aliases not loading:**

```bash
# Check if .aliases is sourced
source ~/.config/zsh/.aliases

# Or reload entire config
source ~/.config/zsh/.zshrc
```
