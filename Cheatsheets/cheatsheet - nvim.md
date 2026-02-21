# Neovim Configuration Cheatsheet

**Leader Key:** `Space`

---

## Which-Key (Keybinding Discovery)

**What it does:** After pressing `<leader>` (space), which-key shows a popup menu with all available keybindings and their descriptions. This helps you discover and remember shortcuts.

**Usage:**

1. Press `<leader>` (space) and **wait ~300ms** (or immediately see popup)
2. A popup appears showing all available `<leader>` prefixed keybindings
3. Press the next key to execute that command or see sub-commands
4. Press `Escape` to close without executing

**Example:**

- Press `<leader>` → see all available commands
- Press `<leader>c` → see all commands starting with `<leader>c` (code actions, comments, etc.)
- Press `<leader>ca` → executes code action

This is especially useful when you don't remember the exact key combination—just press leader and browse!

---

## Clipboard Operations

- **System Clipboard:** Automatically synced with system clipboard via `clipboard=unnamedplus`
  - `y` - Yank (copy) to system clipboard
  - `p` - Paste from system clipboard
  - `"_` - Use blackhole register (delete without copying)

---

## File Explorer (Neo-tree)

| Shortcut      | Action                            | Defined In            |
| ------------- | --------------------------------- | --------------------- |
| `<leader>es`  | Toggle left sidebar file explorer | `plugins/neotree.lua` |
| `<leader>ef`  | Toggle floating file explorer     | `plugins/neotree.lua` |
| `<leader>ngs` | Open git status window            | `plugins/neotree.lua` |

### Neo-tree Navigation (within file explorer):

- `Enter` - Open file/expand directory
- `a` - Add new file/directory
- `d` - Delete file/directory
- `r` - Rename file/directory
- `c` - Copy file/directory
- `x` - Cut file/directory
- `p` - Paste file/directory
- `q` - Close neo-tree

---

## Terminal (Toggleterm)

| Shortcut | Action          | Defined In               |
| -------- | --------------- | ------------------------ |
| `Ctrl+\` | Toggle terminal | `plugins/toggleterm.lua` |

**Features:**

- Embedded terminal inside nvim (alternative to tmux splits)
- Persists when you switch buffers
- Auto-closes when exiting shell
- Use `Escape` to exit terminal mode and return to normal vim mode

---

## Telescope (Fuzzy Finder)

### File & Buffer Search

| Shortcut     | Action                         | Defined In              |
| ------------ | ------------------------------ | ----------------------- |
| `<leader>sf` | Search files                   | `plugins/telescope.lua` |
| `<leader>sb` | Search existing buffers        | `plugins/telescope.lua` |
| `<leader>so` | Search recent files (oldfiles) | `plugins/telescope.lua` |
| `<leader>sm` | Search marks                   | `plugins/telescope.lua` |

### Git Integration

| Shortcut     | Action                                | Defined In              |
| ------------ | ------------------------------------- | ----------------------- |
| `<leader>sgf` | Search git files                      | `plugins/telescope.lua` |
| `<leader>sgc` | Search git commits                    | `plugins/telescope.lua` |
| `<leader>sgh` | Search git history (commits for file) | `plugins/telescope.lua` |
| `<leader>sgb` | Search git branches                   | `plugins/telescope.lua` |
| `<leader>sgs` | Search git status (diff view)         | `plugins/telescope.lua` |

### Content Search

| Shortcut     | Action                           | Defined In              |
| ------------ | -------------------------------- | ----------------------- |
| `<leader>sgr` | Live grep (search text in files) | `plugins/telescope.lua` |
| `<leader>sw` | Search current word under cursor | `plugins/telescope.lua` |
| `<leader>s/` | Live grep in open files          | `plugins/telescope.lua` |
| `<leader>/`  | Fuzzy search in current buffer   | `plugins/telescope.lua` |

### LSP & Diagnostics

| Shortcut      | Action                      | Defined In              |
| ------------- | --------------------------- | ----------------------- |
| `<leader>sd`  | Search diagnostics          | `plugins/telescope.lua` |
| `<leader>sds` | Search LSP document symbols | `plugins/telescope.lua` |
| `<leader>sh`  | Search help tags            | `plugins/telescope.lua` |
| `<leader>sr`  | Resume last search          | `plugins/telescope.lua` |
| `<leader>da`  | Trouble: all diagnostics    | `plugins/trouble.lua`   |
| `<leader>db`  | Trouble: buffer diagnostics | `plugins/trouble.lua`   |

### Telescope Navigation (within finder):

- **Insert Mode:**
  - `<C-k>` - Move to previous result
  - `<C-j>` - Move to next result
  - `<C-l>` - Open file
- **Normal Mode:**
  - `q` - Close telescope
  - `d` - Delete buffer (in buffer picker)
  - `l` - Select/open file (in buffer picker)

---

## Git Integration (Gitsigns)

### Hunk Navigation

| Shortcut | Action            | Defined In             |
| -------- | ----------------- | ---------------------- |
| `]c`     | Next git hunk     | `plugins/gitsigns.lua` |
| `[c`     | Previous git hunk | `plugins/gitsigns.lua` |

### Hunk Actions

| Shortcut     | Action                     | Mode            | Defined In             |
| ------------ | -------------------------- | --------------- | ---------------------- |
| `<leader>hs` | Stage hunk                 | Normal/Visual   | `plugins/gitsigns.lua` |
| `<leader>hr` | Reset hunk                 | Normal/Visual   | `plugins/gitsigns.lua` |
| `<leader>hS` | Stage entire buffer        | Normal          | `plugins/gitsigns.lua` |
| `<leader>hu` | Undo last stage            | Normal          | `plugins/gitsigns.lua` |
| `<leader>hR` | Reset entire buffer        | Normal          | `plugins/gitsigns.lua` |
| `<leader>hp` | Preview hunk               | Normal          | `plugins/gitsigns.lua` |
| `<leader>hb` | Show blame for line (full) | Normal          | `plugins/gitsigns.lua` |
| `<leader>hd` | Diff hunk                  | Normal          | `plugins/gitsigns.lua` |
| `ih`         | Select hunk (text object)  | Operator/Visual | `plugins/gitsigns.lua` |

---

## File Bookmarking (Grapple)

Quickly mark important files and jump between them without needing to search.

| Shortcut     | Action                 | Defined In            |
| ------------ | ---------------------- | --------------------- |
| `<leader>m`  | Toggle current file    | `plugins/grapple.lua` |
| `<leader>M`  | Show marked files list | `plugins/grapple.lua` |
| `<leader>g1` | Jump to marked file 1  | `plugins/grapple.lua` |
| `<leader>g2` | Jump to marked file 2  | `plugins/grapple.lua` |
| `<leader>g3` | Jump to marked file 3  | `plugins/grapple.lua` |
| `<leader>g4` | Jump to marked file 4  | `plugins/grapple.lua` |

**Workflow:** Mark files you frequently jump between (config files, main app file, tests), then use `<leader>g1-4` for instant navigation.

---

## Git Diffview

Side-by-side file diffs with full project context. Complements Gitsigns for complex merges and reviewing changes.

| Shortcut      | Action         | Defined In             |
| ------------- | -------------- | ---------------------- |
| `<leader>gd`  | Open Diffview  | `plugins/diffview.lua` |
| `<leader>gce` | Close Diffview | `plugins/diffview.lua` |

**Inside Diffview:**

- `q` - Close Diffview
- `<Tab>` - Cycle through files
- `/` - Search in diff
- `dd` - Toggle diff stat

---

## Undo History (Undotree)

Graphical undo/redo browser. See all your edits as a tree with branches so you never lose work to undo.

| Shortcut    | Action          | Defined In             |
| ----------- | --------------- | ---------------------- |
| `<leader>u` | Toggle undotree | `plugins/undotree.lua` |

**Inside Undotree:**

- `<C-j>` / `<C-k>` - Move between undo states
- `<Enter>` - Jump to selected state
- `d` - Show diff of that state
- `q` - Close undotree

**When useful:** Made 20 edits, want to go back to edit #10 but keep the ability to get back to #15 without re-typing everything.

---

## Buffer Management

**Note:** Buffer numbers are visible in the bufferline at the top of your screen.

| Shortcut       | Action                                       | Defined In               |
| -------------- | -------------------------------------------- | ------------------------ |
| `<Tab>`        | Next buffer (moves right in bufferline)      | `plugins/bufferline.lua` |
| `<S-Tab>`      | Previous buffer (moves left in bufferline)   | `plugins/bufferline.lua` |
| `<leader>x`    | Close buffer (preserves window layout)       | `core/keymaps.lua`       |
| `<leader>b`    | Open new empty buffer                        | `core/keymaps.lua`       |
| `:b <num>`     | Jump to buffer by number (e.g., `:b 3`)      | Built-in                 |
| `:b <name>`    | Jump to buffer by name (with Tab completion) | Built-in                 |
| `<leader>1..9` | Jump to buffer by number (via bufferline)    | `plugins/bufferline.lua` |

---

## Window Management

### Split Windows

| Shortcut     | Action                        | Defined In         |
| ------------ | ----------------------------- | ------------------ |
| `<leader>>`  | Split window vertically       | `core/keymaps.lua` |
| `<leader><`  | Split window horizontally     | `core/keymaps.lua` |
| `<leader>se` | Make split windows equal size | `core/keymaps.lua` |
| `<leader>xs` | Close current split window    | `core/keymaps.lua` |
| `<leader>sx` | Swap split windows            | `core/keymaps.lua` |

### Navigate Between Splits

| Shortcut | Action              | Defined In         |
| -------- | ------------------- | ------------------ |
| `<C-k>`  | Move to split above | `core/keymaps.lua` |
| `<C-j>`  | Move to split below | `core/keymaps.lua` |
| `<C-h>`  | Move to split left  | `core/keymaps.lua` |
| `<C-l>`  | Move to split right | `core/keymaps.lua` |

### Resize Windows

| Shortcut    | Action          | Defined In         |
| ----------- | --------------- | ------------------ |
| `<C-Up>`    | Decrease height | `core/keymaps.lua` |
| `<C-Down>`  | Increase height | `core/keymaps.lua` |
| `<C-Left>`  | Decrease width  | `core/keymaps.lua` |
| `<C-Right>` | Increase width  | `core/keymaps.lua` |

---

## Tab Management

| Shortcut     | Action             | Defined In         |
| ------------ | ------------------ | ------------------ |
| `<leader>tc` | Open new tab       | `core/keymaps.lua` |
| `<leader>tx` | Close current tab  | `core/keymaps.lua` |
| `<leader>tn` | Go to next tab     | `core/keymaps.lua` |
| `<leader>tp` | Go to previous tab | `core/keymaps.lua` |

---

## Navigation & Movement

### Vertical Scrolling (Centered)

| Shortcut | Action                           | Defined In         |
| -------- | -------------------------------- | ------------------ |
| `<C-d>`  | Scroll down half page (centered) | `core/keymaps.lua` |
| `<C-u>`  | Scroll up half page (centered)   | `core/keymaps.lua` |

### Search Navigation (Centered)

| Shortcut | Action                            | Defined In         |
| -------- | --------------------------------- | ------------------ |
| `n`      | Next search result (centered)     | `core/keymaps.lua` |
| `N`      | Previous search result (centered) | `core/keymaps.lua` |

### Code Navigation (Treesitter)

| Shortcut | Action                        | Defined In               |
| -------- | ----------------------------- | ------------------------ |
| `]m`     | Go to next function start     | `plugins/treesitter.lua` |
| `]]`     | Go to next class start        | `plugins/treesitter.lua` |
| `]M`     | Go to next function end       | `plugins/treesitter.lua` |
| `][`     | Go to next class end          | `plugins/treesitter.lua` |
| `[m`     | Go to previous function start | `plugins/treesitter.lua` |
| `[[`     | Go to previous class start    | `plugins/treesitter.lua` |
| `[M`     | Go to previous function end   | `plugins/treesitter.lua` |
| `[]`     | Go to previous class end      | `plugins/treesitter.lua` |

---

## LSP & Diagnostics

### Diagnostics Navigation

| Shortcut    | Action                           | Defined In         |
| ----------- | -------------------------------- | ------------------ |
| `[d`        | Go to previous diagnostic        | `core/keymaps.lua` |
| `]d`        | Go to next diagnostic            | `core/keymaps.lua` |
| `<leader>d` | Open floating diagnostic message | `core/keymaps.lua` |
| `<leader>q` | Open diagnostics list            | `core/keymaps.lua` |

### Trouble.nvim - Diagnostics Viewer

Beautiful panel showing LSP diagnostics (errors, warnings, info, hints) with filtering options.

| Shortcut     | Action                                 | Defined In            |
| ------------ | -------------------------------------- | --------------------- |
| `<leader>da` | Show all diagnostics (entire project)  | `plugins/trouble.lua` |
| `<leader>db` | Show diagnostics (current buffer only) | `plugins/trouble.lua` |
| `<leader>dl` | Show location list                     | `plugins/trouble.lua` |
| `<leader>dq` | Show quickfix list                     | `plugins/trouble.lua` |

### LSP Actions

| Shortcut     | Action                            | Mode   | Defined In           |
| ------------ | --------------------------------- | ------ | -------------------- |
| `gd`         | Go to definition                  | Normal | `core/keymaps.lua`   |
| `gD`         | Go to declaration                 | Normal | `core/keymaps.lua`   |
| `gr`         | Go to references                  | Normal | `core/keymaps.lua`   |
| `gi`         | Go to implementation              | Normal | `core/keymaps.lua`   |
| `gt`         | Go to type definition             | Normal | `core/keymaps.lua`   |
| `K`          | Hover documentation               | Normal | `core/keymaps.lua`   |
| `<leader>k`  | Signature help                    | Insert | `core/keymaps.lua`   |
| `<leader>ca` | Code actions (fixes, refactoring) | Normal | `core/keymaps.lua`   |
| `<leader>cf` | Format buffer                     | Normal | `core/keymaps.lua`   |
| `<leader>rn` | Rename symbol                     | Normal | `core/keymaps.lua`   |
| `<leader>wa` | Add workspace folder              | Normal | `core/keymaps.lua`   |
| `<leader>wr` | Remove workspace folder           | Normal | `core/keymaps.lua`   |
| `<leader>wl` | List workspace folders            | Normal | `core/keymaps.lua`   |
| `<leader>nd` | Generate docstring (Neogen)       | Normal | `plugins/neogen.lua` |

---

## Code Editing

### Formatting

| Shortcut     | Action              | Defined In         |
| ------------ | ------------------- | ------------------ |
| `<leader>cf` | Format buffer (LSP) | `core/keymaps.lua` |

### Commenting (Comment.nvim)

| Shortcut | Action                                    | Mode   | Defined In            |
| -------- | ----------------------------------------- | ------ | --------------------- |
| `gcc`    | Toggle line comment                       | Normal | `plugins/comment.lua` |
| `gbc`    | Toggle block comment                      | Normal | `plugins/comment.lua` |
| `gc`     | Toggle comment with motion (e.g., `gc3j`) | Normal | `plugins/comment.lua` |
| `gc`     | Toggle comment on selection               | Visual | `plugins/comment.lua` |
| `gcd`    | Insert comment below ([d]own)             | Normal | `plugins/comment.lua` |
| `gcu`    | Insert comment above ([u]p)               | Normal | `plugins/comment.lua` |
| `gcA`    | Insert comment at end of line             | Normal | `plugins/comment.lua` |

**Examples:**

- `gc3j` - Comment current line + 3 lines below
- `gc5k` - Comment current line + 5 lines above
- `gcap` - Comment entire paragraph
- `gcip` - Comment inner paragraph

### Surround (nvim-surround)

Manipulate brackets, quotes, and tags on existing text.

| Shortcut | Action                           | Example                   | Defined In             |
| -------- | -------------------------------- | ------------------------- | ---------------------- |
| `ysiw"`  | [Y]ank and [s]urround [iw]ord    | `hello` → `"hello"`       | `plugins/surround.lua` |
| `cs"'`   | [C]hange [s]urrounding quotes    | `"hi"` → `'hi'`           | `plugins/surround.lua` |
| `ds"`    | [D]elete [s]urrounding quotes    | `"hi"` → `hi`             | `plugins/surround.lua` |
| `ysip{`  | Surround [i]nner [p]aragraph     | Wraps paragraph with `{}` | `plugins/surround.lua` |
| `yslb`   | Surround current [l]ine with `b` | Wraps line with `()`      | `plugins/surround.lua` |

**Common brackets:** `(`, `)`, `[`, `]`, `{`, `}`, `<`, `>`, `"`

**Mnemonic:**

- `ys` = [y]ank and [s]urround (add)
- `cs` = [c]hange [s]urrounding
- `ds` = [d]elete [s]urrounding

### Text Objects (Treesitter)

| Shortcut | Action                 | Defined In               |
| -------- | ---------------------- | ------------------------ |
| `aa`     | Select outer parameter | `plugins/treesitter.lua` |
| `ia`     | Select inner parameter | `plugins/treesitter.lua` |
| `af`     | Select outer function  | `plugins/treesitter.lua` |
| `if`     | Select inner function  | `plugins/treesitter.lua` |
| `ac`     | Select outer class     | `plugins/treesitter.lua` |
| `ic`     | Select inner class     | `plugins/treesitter.lua` |

### Swapping Parameters

| Shortcut    | Action                       | Defined In               |
| ----------- | ---------------------------- | ------------------------ |
| `<leader>a` | Swap with next parameter     | `plugins/treesitter.lua` |
| `<leader>A` | Swap with previous parameter | `plugins/treesitter.lua` |

### Incremental Selection

| Shortcut | Action                   | Defined In               |
| -------- | ------------------------ | ------------------------ |
| `<C-i>`  | Init/increment selection | `plugins/treesitter.lua` |
| `<C-s>`  | Increment scope          | `plugins/treesitter.lua` |
| `<M-i>`  | Decrement selection      | `plugins/treesitter.lua` |

---

## Visual Mode Operations

| Shortcut | Action                           | Defined In         |
| -------- | -------------------------------- | ------------------ |
| `<`      | Indent left (stay in visual)     | `core/keymaps.lua` |
| `>`      | Indent right (stay in visual)    | `core/keymaps.lua` |
| `p`      | Paste without losing yanked text | `core/keymaps.lua` |

---

## Miscellaneous

| Shortcut     | Action                           | Defined In         |
| ------------ | -------------------------------- | ------------------ |
| `x`          | Delete character without copying | `core/keymaps.lua` |
| `<leader>lw` | Toggle line wrapping             | `core/keymaps.lua` |

---

## Autocompletion (Blink.cmp)

### Insert Mode Completion

- **Default preset keybindings:**
  - `<C-y>` - Accept completion
  - `<C-space>` - Open menu or toggle docs
  - `<C-n>` / `<Down>` - Next item
  - `<C-p>` / `<Up>` - Previous item
  - `<C-e>` - Hide menu
  - `<C-k>` - Toggle signature help
  - `<Tab>` / `<S-Tab>` - Navigate snippet expansion

---

## AI Code Assistance (GitHub Copilot)

### Inline Code Suggestions

AI-powered code suggestions that are context-aware to your codebase.

| Shortcut | Action            | Mode   | Defined In                 |
| -------- | ----------------- | ------ | -------------------------- |
| `<C-J>`  | Accept suggestion | Insert | `plugins/copilot-chat.lua` |

### Copilot Chat Commands

Interactive chat with AI for code explanation, review, fixes, tests, and more.

| Shortcut     | Action         | Mode          | Defined In                 |
| ------------ | -------------- | ------------- | -------------------------- |
| `<leader>cc` | Toggle chat    | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>cq` | Quick question | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>ce` | Explain code   | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>cr` | Review code    | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>cx` | Fix code       | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>co` | Optimize code  | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>ct` | Generate tests | Normal/Visual | `plugins/copilot-chat.lua` |
| `<leader>cd` | Generate docs  | Normal/Visual | `plugins/copilot-chat.lua` |

**Usage Examples:**

- Select code and press `<leader>ce` → AI explains what it does
- At cursor position, `<leader>cc` → Toggle chat panel for conversation
- Visual selection + `<leader>ct` → Generate unit tests
- `<leader>cq` → Ask a quick question without opening chat panel

**Note:** Requires active GitHub Copilot subscription and authentication.

---

## Installed LSP Servers

Your configuration includes LSP servers for:

- **Web:** CSS, ESLint, HTML, Tailwind CSS, TypeScript/JavaScript
- **Backend:** Go, Python (ty + Ruff), JSON
- **DevOps:** Bash, Docker, Docker Compose, Helm, YAML
- **Mobile/JVM:** Java (jdtls), Kotlin, XML
- **Documentation:** LaTeX (texlab), Markdown (marksman), Grammar (ltex)
- **Data:** SQL
- **Lua:** Lua LS (for Neovim config)

---

## Important Configuration Details

### Clipboard

- **System integration:** Enabled via `clipboard=unnamedplus` in `core/options.lua`
- All yank/delete operations automatically sync with system clipboard
- Use `"_` prefix for operations that shouldn't affect clipboard (e.g., `"_x`)

### Display Settings

- Line numbers: Relative + absolute
- Scroll offset: 15 lines above/below cursor
- Tab width: 4 spaces
- Wrap: Disabled by default (toggle with `<leader>lw`)

### File Ignoring (Telescope)

- Automatically ignores: `node_modules`, `.git`, `.venv`
- Shows hidden files by default

---

## Custom Keybinding Patterns

### Your Unique Customizations:

1. **`x` for deletion** - Deletes without copying to register (different from default)
2. **Centered scrolling** - All scroll operations center the cursor
3. **Visual mode paste** - Preserves the yank register when pasting
4. **Split navigation** - Uses `<C-hjkl>` instead of `<C-w>hjkl`
5. **Tab for buffers** - `<Tab>` cycles buffers (not common default)
6. **Parameter swapping** - `<leader>a/A` for swapping function parameters
