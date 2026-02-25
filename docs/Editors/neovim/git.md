# Git

## Telescope: Git

| Shortcut      | Mode   | Action (mnemonic)                  | Defined In              |
| ------------- | ------ | ---------------------------------- | ----------------------- |
| `<leader>sgf` | Normal | \[s]earch \[g]it \[f]iles          | `plugins/telescope.lua` |
| `<leader>sgc` | Normal | \[s]earch \[g]it \[c]ommits        | `plugins/telescope.lua` |
| `<leader>sgh` | Normal | \[s]earch \[g]it \[h]istory (file) | `plugins/telescope.lua` |
| `<leader>sgb` | Normal | \[s]earch \[g]it \[b]ranches       | `plugins/telescope.lua` |
| `<leader>sgs` | Normal | \[s]earch \[g]it \[s]tatus         | `plugins/telescope.lua` |

## Lazygit

| Shortcut     | Mode   | Action (mnemonic)                          | Defined In            |
| ------------ | ------ | ------------------------------------------ | --------------------- |
| `<leader>gg` | Normal | \[g]it GUI lazy\[g]it                      | `plugins/lazygit.lua` |
| `<leader>gf` | Normal | \[g]it GUI current \[f]ile focus (lazygit) | `plugins/lazygit.lua` |

## Diffview

| Shortcut      | Mode   | Action (mnemonic)                      | Defined In             |
| ------------- | ------ | -------------------------------------- | ---------------------- |
| `<leader>gd`  | Normal | \[g]it \[d]iffview open                | `plugins/diffview.lua` |
| `<leader>gce` | Normal | \[g]it diffview \[c]lose \[e]verything | `plugins/diffview.lua` |

### Diffview Navigation (inside)

| Shortcut | Mode   | Action (mnemonic)              | Scope          |
| -------- | ------ | ------------------------------ | -------------- |
| `q`      | Normal | \[q]uit diffview window        | diffview panel |
| `<Tab>`  | Normal | cycle file \[l]ist             | diffview panel |
| `/`      | Normal | \[s]earch in diff              | diffview panel |
| `dd`     | Normal | toggle \[d]iff \[d]etails/stat | diffview panel |

## Gitsigns

### Hunk Navigation

| Shortcut | Mode   | Action (mnemonic)     | Defined In             |
| -------- | ------ | --------------------- | ---------------------- |
| `]c`     | Normal | next git \[c]hunk     | `plugins/gitsigns.lua` |
| `[c`     | Normal | previous git \[c]hunk | `plugins/gitsigns.lua` |

### Hunk Actions

| Shortcut     | Mode            | Action (mnemonic)              | Defined In             |
| ------------ | --------------- | ------------------------------ | ---------------------- |
| `<leader>hs` | Normal/Visual   | \[h]unk \[s]tage               | `plugins/gitsigns.lua` |
| `<leader>hr` | Normal/Visual   | \[h]unk \[r]eset               | `plugins/gitsigns.lua` |
| `<leader>hS` | Normal          | \[h]unk \[S]tage buffer        | `plugins/gitsigns.lua` |
| `<leader>hu` | Normal          | \[h]unk \[u]ndo stage          | `plugins/gitsigns.lua` |
| `<leader>hR` | Normal          | \[h]unk buffer \[R]eset        | `plugins/gitsigns.lua` |
| `<leader>hp` | Normal          | \[h]unk \[p]review             | `plugins/gitsigns.lua` |
| `<leader>hb` | Normal          | \[h]unk \[b]lame line          | `plugins/gitsigns.lua` |
| `<leader>hd` | Normal          | \[h]unk \[d]iff                | `plugins/gitsigns.lua` |
| `ih`         | Operator/Visual | select git \[h]unk text object | `plugins/gitsigns.lua` |
