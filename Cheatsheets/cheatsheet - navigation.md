# Combined Navigation Cheatsheet — Action-first, tables

Use this as a quick reference: each row is an action, columns are `WezTerm · Tmux · Neovim`.

## leader / prefix keys

| WezTerm | Tmux              | Neovim           |
| ------- | ----------------- | ---------------- |
| n/a     | `Prefix` = Ctrl-b | `Leader` = Space |

## Panes

Panes are the split views inside a tab/window. Use these for layout and switching focus.

| Action           | WezTerm             | Tmux                | Neovim        |
| ---------------- | ------------------- | ------------------- | ------------- |
| Vertical split   | `Alt+Shift+>`       | `Prefix >`          | `<leader>>`   |
| Horizontal split | `Alt+Shift+<`       | `Prefix <`          | `<leader><`   |
| Close pane       | `Alt+Shift+q`       | `Prefix q`          | `<leader>q`   |
| Move focus       | `Alt+Shift+h/j/k/l` | `Ctrl-h/j/k/l`      | `<C-h/j/k/l>` |
| Resize pane      | `Alt+Shift+Arrow`   | `Prefix Ctrl+Arrow` | `<C-Arrow>`   |
| Cycle panes      | n/a                 | `Prefix o`          | `<C-w>w/W`    |

Notes:

- Navigation fallthrough: Neovim uses `Ctrl-h/j/k/l` to move between splits. With `christoomey/vim-tmux-navigator` installed and the corresponding tmux non-prefix binds enabled, the same `Ctrl-h/j/k/l` will automatically move to the adjacent tmux pane when Neovim has no split in that direction.

## Tabs / Windows (top-level)

Tabs (WezTerm), windows (tmux), and tabpages (Neovim) are top-level containers for panes.

| Action          | WezTerm           | Tmux (window)    | Neovim              |
| --------------- | ----------------- | ---------------- | ------------------- |
| New             | `Alt+Shift+c`     | `Prefix c`       | `<leader>tc`        |
| Close           | `Alt+Shift+x`     | `Prefix x`       | `<leader>tx`        |
| Next / Previous | `Alt+n` / `Alt+p` | `Prefix n` / `p` | `<leader>tn` / `tp` |
| Rename          | `Alt+Shift+,`     | `Prefix ,`       | `:file`             |

Note: The Neovim built-in tabline is hidden in this setup (`vim.o.showtabline = 0`). Tab mappings (e.g. `<leader>tc`, `<leader>tx`) still function.

## Buffers

| Action                   | WezTerm | Tmux | Neovim                                           |
| ------------------------ | ------- | ---- | ------------------------------------------------ |
| Next / Prev              | n/a     | n/a  | `<Tab>` / `<S-Tab>`                              |
| Jump to buffer by number | n/a     | n/a  | `<leader>1..9` (jump to buffer N via bufferline) |
| Close buffer             | n/a     | n/a  | `:bd`                                            |

Notes:

- `:bd` (buffer delete) removes the buffer from Neovim's buffer list but leaves the window layout intact. Use `:bd` (or `<leader>x` in this config) when you want to close the file but keep your splits/windows. `:q` closes the current window; if it was the last window it quits Neovim. Use `:q` when you want to close a split or exit Neovim.

## Sessions / Workspaces

| Action        | WezTerm | Tmux                         | Neovim |
| ------------- | ------- | ---------------------------- | ------ |
| New session   | n/a     | `tmux new -s name`           | n/a    |
| List / attach | n/a     | `tmux ls` / `tmux attach -t` | n/a    |
| Rename        | n/a     | `tmux rename-session`        | n/a    |

## Search in terminal

| Action                               | WezTerm            | Tmux               | Neovim |
| ------------------------------------ | ------------------ | ------------------ | ------ |
| Search terminal history (scrollback) | `Ctrl+Shift+f`     | n/a                | n/a    |
| Search terminal window (quicksearch) | `Ctrl+Shift+Space` | `Prefix [`+`?`/`/` | n/a    |

## Search in files

| Action                                  | WezTerm | Tmux | Neovim        |
| --------------------------------------- | ------- | ---- | ------------- |
| Search word (regex) in current buffer   | n/a     | n/a  | `/`           |
| Search word (fuzzy) in current buffer   | n/a     | n/a  | `<leader>/`   |
| Search word (grep) in open buffers      | n/a     | n/a  | `<leader>s/`  |
| Search word (grep) in CWD               | n/a     | n/a  | `<leader>sg`  |
| Search word under cursor (grep) in CWD  | n/a     | n/a  | `<leader>sw`  |
| Search file (all) by name in CWD        | n/a     | n/a  | `<leader>sf`  |
| Search file (git tracked) in repository | n/a     | n/a  | `<leader>gf`  |
| Search file by name in history (old)    | n/a     | n/a  | `<leader>so`  |
| Search open buffers                     | n/a     | n/a  | `<leader>sb`  |
| Search LSP (document symbols)           | n/a     | n/a  | `<leader>sds` |
| Search diagnostics                      | n/a     | n/a  | `<leader>sd`  |
| Search help                             | n/a     | n/a  | `<leader>sh`  |
| Search git repository commits           | n/a     | n/a  | `<leader>gc`  |
| Search git repository branches          | n/a     | n/a  | `<leader>gb`  |
