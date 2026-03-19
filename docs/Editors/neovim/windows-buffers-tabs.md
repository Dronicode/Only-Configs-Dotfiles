# Windows, Buffers, Tabs

## Buffer Management

| Shortcut       | Mode    | Action (mnemonic)                        | Defined In               |
| -------------- | ------- | ---------------------------------------- | ------------------------ |
| `<Tab>`        | Normal  | next buffer (cycle right)                | `plugins/bufferline.lua` |
| `<S-Tab>`      | Normal  | previous buffer (cycle left)             | `plugins/bufferline.lua` |
| `<leader>x`    | Normal  | buffer e\[x]it (keeps layout)            | `core/keymaps.lua`       |
| `<leader>B`    | Normal  | new \[B]uffer                            | `core/keymaps.lua`       |
| `:b <num>`     | Command | jump to \[b]uffer by number              | Built-in                 |
| `:b <name>`    | Command | jump to \[b]uffer by name (tab complete) | Built-in                 |
| `<leader>1..9` | Normal  | buffer jump number                       | `plugins/bufferline.lua` |

## Window Management

### Split Windows

| Shortcut     | Mode   | Action (mnemonic)            | Defined In         |
| ------------ | ------ | ---------------------------- | ------------------ |
| `<leader>>`  | Normal | split window vertical        | `core/keymaps.lua` |
| `<leader><`  | Normal | split window horizontal      | `core/keymaps.lua` |
| `<leader>se` | Normal | make \[s]plits \[e]qual size | `core/keymaps.lua` |
| `<leader>xs` | Normal | e\[x]it current \[s]plit     | `core/keymaps.lua` |
| `<leader>sx` | Normal | \[s]wap e\[x]isting splits   | `core/keymaps.lua` |

### Navigate Between Splits

| Shortcut | Mode   | Action (mnemonic)        | Defined In         |
| -------- | ------ | ------------------------ | ------------------ |
| `<C-k>`  | Normal | move to split \[k] above | `core/keymaps.lua` |
| `<C-j>`  | Normal | move to split \[j] below | `core/keymaps.lua` |
| `<C-h>`  | Normal | move to split \[h] left  | `core/keymaps.lua` |
| `<C-l>`  | Normal | move to split \[l] right | `core/keymaps.lua` |

### Resize Windows

| Shortcut    | Mode   | Action (mnemonic)     | Defined In         |
| ----------- | ------ | --------------------- | ------------------ |
| `<C-Up>`    | Normal | resize height \[up]   | `core/keymaps.lua` |
| `<C-Down>`  | Normal | resize height \[down] | `core/keymaps.lua` |
| `<C-Left>`  | Normal | resize width \[left]  | `core/keymaps.lua` |
| `<C-Right>` | Normal | resize width \[right] | `core/keymaps.lua` |

## Tab Management

| Shortcut     | Mode   | Action (mnemonic)  | Defined In         |
| ------------ | ------ | ------------------ | ------------------ |
| `<leader>tc` | Normal | \[t]ab \[c]reate   | `core/keymaps.lua` |
| `<leader>tx` | Normal | \[t]ab e\[x]it     | `core/keymaps.lua` |
| `<leader>tn` | Normal | \[t]ab \[n]ext     | `core/keymaps.lua` |
| `<leader>tp` | Normal | \[t]ab \[p]revious | `core/keymaps.lua` |
