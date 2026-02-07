# Neovim Configuration Cheatsheet

**Leader Key:** `Space`

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
| `<leader>w`   | Toggle floating file explorer     | `plugins/neotree.lua` |
| `<leader>e`   | Toggle left sidebar file explorer | `plugins/neotree.lua` |
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

## Telescope (Fuzzy Finder)

### File & Buffer Search

| Shortcut           | Action                         | Defined In              |
| ------------------ | ------------------------------ | ----------------------- |
| `<leader>sf`       | Search files                   | `plugins/telescope.lua` |
| `<leader>sb`       | Search existing buffers        | `plugins/telescope.lua` |
| `<leader><tab>`    | Search existing buffers (alt)  | `plugins/telescope.lua` |
| `<leader><leader>` | Find existing buffers (alt)    | `plugins/telescope.lua` |
| `<leader>so`       | Search recent files (oldfiles) | `plugins/telescope.lua` |
| `<leader>sm`       | Search marks                   | `plugins/telescope.lua` |

### Git Integration

| Shortcut      | Action                              | Defined In              |
| ------------- | ----------------------------------- | ----------------------- |
| `<leader>gf`  | Search git files                    | `plugins/telescope.lua` |
| `<leader>gc`  | Search git commits                  | `plugins/telescope.lua` |
| `<leader>gcf` | Search git commits for current file | `plugins/telescope.lua` |
| `<leader>gb`  | Search git branches                 | `plugins/telescope.lua` |
| `<leader>gs`  | Search git status (diff view)       | `plugins/telescope.lua` |

### Content Search

| Shortcut     | Action                           | Defined In              |
| ------------ | -------------------------------- | ----------------------- |
| `<leader>sg` | Live grep (search text in files) | `plugins/telescope.lua` |
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

### LSP Actions

- **Note:** LSP keybindings are typically available when an LSP server is attached:
  - `gd` - Go to definition (standard LSP)
  - `gD` - Go to declaration (standard LSP)
  - `gr` - Go to references (standard LSP)
  - `gi` - Go to implementation (standard LSP)
  - `K` - Hover documentation (standard LSP)
  - `<C-k>` - Signature help (insert mode, standard LSP)

---

## Code Editing

### Formatting

| Shortcut    | Action        | Defined In               |
| ----------- | ------------- | ------------------------ |
| `<leader>f` | Format buffer | `plugins/autoformat.lua` |

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

| Shortcut    | Action                   | Defined In               |
| ----------- | ------------------------ | ------------------------ |
| `<C-space>` | Init/increment selection | `plugins/treesitter.lua` |
| `<C-s>`     | Increment scope          | `plugins/treesitter.lua` |
| `<M-space>` | Decrement selection      | `plugins/treesitter.lua` |

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

## Installed LSP Servers

Your configuration includes LSP servers for:

- **Web:** CSS, ESLint, HTML, Tailwind CSS, TypeScript/JavaScript
- **Backend:** Go, Python (Pyright + Ruff), JSON
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
