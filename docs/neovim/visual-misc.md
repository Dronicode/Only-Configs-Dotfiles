# Visual Mode, Clipboard, Misc

## Visual Mode Operations

| Shortcut | Mode   | Action (mnemonic)                    | Defined In         |
| -------- | ------ | ------------------------------------ | ------------------ |
| `<`      | Visual | indent \[<] left keep selection      | `core/keymaps.lua` |
| `>`      | Visual | indent \[>] right keep selection     | `core/keymaps.lua` |
| `p`      | Visual | \[p]aste replace without losing yank | `core/keymaps.lua` |

## Clipboard Operations

| Shortcut | Mode          | Action (mnemonic)                         | Defined In         |
| -------- | ------------- | ----------------------------------------- | ------------------ |
| `y`      | Normal/Visual | \[y]ank to system clipboard (unnamedplus) | `core/options.lua` |
| `p`      | Normal/Visual | \[p]aste from system clipboard            | `core/options.lua` |
| `"_`     | Normal/Visual | \["]\_ blackhole (delete/no copy)         | Built-in           |

## Miscellaneous

| Shortcut     | Mode   | Action (mnemonic)           | Defined In         |
| ------------ | ------ | --------------------------- | ------------------ |
| `x`          | Normal | delete char without copying | `core/keymaps.lua` |
| `<leader>lw` | Normal | toggle \[l]ine \[w]rap      | `core/keymaps.lua` |
