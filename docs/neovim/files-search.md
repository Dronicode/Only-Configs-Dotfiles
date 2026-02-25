# Files & Search

## Telescope: Files & Buffers

| Shortcut     | Mode   | Action (mnemonic)             | Defined In              |
| ------------ | ------ | ----------------------------- | ----------------------- |
| `<leader>sf` | Normal | \[s]earch \[f]iles            | `plugins/telescope.lua` |
| `<leader>sb` | Normal | \[s]earch existing \[b]uffers | `plugins/telescope.lua` |
| `<leader>so` | Normal | \[s]earch \[o]ldfiles recent  | `plugins/telescope.lua` |
| `<leader>sm` | Normal | \[s]earch \[m]arks            | `plugins/telescope.lua` |

## Telescope: Content Search

| Shortcut      | Mode   | Action (mnemonic)                      | Defined In              |
| ------------- | ------ | -------------------------------------- | ----------------------- |
| `<leader>sgr` | Normal | \[s]earch by \[g]rep (\[r]ipgrep live) | `plugins/telescope.lua` |
| `<leader>sw`  | Normal | \[s]earch current \[w]ord              | `plugins/telescope.lua` |
| `<leader>s/`  | Normal | \[s]earch \[/] open buffers live grep  | `plugins/telescope.lua` |
| `<leader>/`   | Normal | \[/] fuzzy in current buffer           | `plugins/telescope.lua` |
| `<leader>st`  | Normal | \[s]earch \[t]oggle hidden files       | `plugins/telescope.lua` |

## Telescope: LSP & Diagnostics Pickers

| Shortcut      | Mode   | Action (mnemonic)                  | Defined In              |
| ------------- | ------ | ---------------------------------- | ----------------------- |
| `<leader>sd`  | Normal | \[s]earch \[d]iagnostics           | `plugins/telescope.lua` |
| `<leader>sds` | Normal | \[s]earch \[d]ocument \[s]ymbols   | `plugins/telescope.lua` |
| `<leader>sh`  | Normal | \[s]earch \[h]elp tags             | `plugins/telescope.lua` |
| `<leader>sr`  | Normal | \[s]earch \[r]esume last picker    | `plugins/telescope.lua` |
| `<leader>da`  | Normal | \[d]iagnostics \[a]ll (Trouble)    | `plugins/trouble.lua`   |
| `<leader>db`  | Normal | \[d]iagnostics \[b]uffer (Trouble) | `plugins/trouble.lua`   |

## Telescope: Git Pickers (duplicated in Git sheet)

| Shortcut      | Mode   | Action (mnemonic)                  | Defined In              |
| ------------- | ------ | ---------------------------------- | ----------------------- |
| `<leader>sgf` | Normal | \[s]earch \[g]it \[f]iles          | `plugins/telescope.lua` |
| `<leader>sgc` | Normal | \[s]earch \[g]it \[c]ommits        | `plugins/telescope.lua` |
| `<leader>sgh` | Normal | \[s]earch \[g]it \[h]istory (file) | `plugins/telescope.lua` |
| `<leader>sgb` | Normal | \[s]earch \[g]it \[b]ranches       | `plugins/telescope.lua` |
| `<leader>sgs` | Normal | \[s]earch \[g]it \[s]tatus         | `plugins/telescope.lua` |

### Telescope Picker Navigation

| Shortcut | Mode   | Action (mnemonic)      | Scope          |
| -------- | ------ | ---------------------- | -------------- |
| `<C-k>`  | Insert | move \[k] up results   | all pickers    |
| `<C-j>`  | Insert | move \[j] down results | all pickers    |
| `<C-l>`  | Insert | se\[l]ect/open         | all pickers    |
| `q`      | Normal | \[q]uit picker         | all pickers    |
| `d`      | Normal | \[d]elete buffer entry | buffers picker |
| `l`      | Normal | se\[l]ect/open         | buffers picker |

## File Explorer (Neo-tree)

| Shortcut     | Mode   | Action (mnemonic)                | Defined In            |
| ------------ | ------ | -------------------------------- | --------------------- |
| `<leader>es` | Normal | \[e]xplorer \[s]idebar toggle    | `plugins/neotree.lua` |
| `<leader>ef` | Normal | \[e]xplorer \[f]loating toggle   | `plugins/neotree.lua` |
| `<leader>eg` | Normal | \[e]xplorer \[g]it status window | `plugins/neotree.lua` |

### Neo-tree Navigation

| Shortcut | Mode   | Action (mnemonic)  | Scope           |
| -------- | ------ | ------------------ | --------------- |
| `Enter`  | Normal | open/expand node   | neo-tree window |
| `a`      | Normal | \[a]dd file/dir    | neo-tree window |
| `d`      | Normal | \[d]elete file/dir | neo-tree window |
| `r`      | Normal | \[r]ename file/dir | neo-tree window |
| `c`      | Normal | \[c]opy file/dir   | neo-tree window |
| `x`      | Normal | \[x]cut file/dir   | neo-tree window |
| `p`      | Normal | \[p]aste file/dir  | neo-tree window |
| `q`      | Normal | \[q]uit explorer   | neo-tree window |
