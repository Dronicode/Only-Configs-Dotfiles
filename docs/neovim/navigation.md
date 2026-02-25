# Navigation & Movement

## Scrolling & Search Navigation

| Shortcut | Mode   | Action (mnemonic)                             | Defined In         |
| -------- | ------ | --------------------------------------------- | ------------------ |
| `<C-d>`  | Normal | half-page scroll \[d]own (centered)           | `core/keymaps.lua` |
| `<C-u>`  | Normal | half-page scroll \[u]p (centered)             | `core/keymaps.lua` |
| `n`      | Normal | \[n]avigate next search result (centered)     | `core/keymaps.lua` |
| `N`      | Normal | \[N]avigate previous search result (centered) | `core/keymaps.lua` |

## Code Navigation (Treesitter)

| Shortcut | Mode   | Action (mnemonic)                  | Defined In               |
| -------- | ------ | ---------------------------------- | ------------------------ |
| `]m`     | Normal | next \[m]ethod/ function start     | `plugins/treesitter.lua` |
| `]]`     | Normal | next class [[]start                | `plugins/treesitter.lua` |
| `]M`     | Normal | next \[M]ethod/ function end       | `plugins/treesitter.lua` |
| `][`     | Normal | next class end[]]                  | `plugins/treesitter.lua` |
| `[m`     | Normal | previous \[m]ethod/ function start | `plugins/treesitter.lua` |
| `[[`     | Normal | previous class [[]start            | `plugins/treesitter.lua` |
| `[M`     | Normal | previous \[M]ethod/ function end   | `plugins/treesitter.lua` |
| `[]`     | Normal | previous class end[]]              | `plugins/treesitter.lua` |
