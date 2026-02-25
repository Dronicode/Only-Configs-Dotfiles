# Windows, Buffers, Tabs

## Window Management

### Split Windows

| Shortcut     | Mode   | Action (mnemonic)            | Defined In         |
| ------------ | ------ | ---------------------------- | ------------------ |
| `<leader>>`  | Normal | split window \[v]ertical     | `core/keymaps.lua` |
| `<leader><`  | Normal | split window \[h]orizontal   | `core/keymaps.lua` |
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
| `<C-Up>`    | Normal | resize height \[u]p   | `core/keymaps.lua` |
| `<C-Down>`  | Normal | resize height \[d]own | `core/keymaps.lua` |
| `<C-Left>`  | Normal | resize width \[l]eft  | `core/keymaps.lua` |
| `<C-Right>` | Normal | resize width \[r]ight | `core/keymaps.lua` |

## Buffer Management

| Shortcut       | Mode    | Action (mnemonic)                        | Defined In               |
| -------------- | ------- | ---------------------------------------- | ------------------------ |
| `<Tab>`        | Normal  | next \[b]uffer (cycle right)             | `plugins/bufferline.lua` |
| `<S-Tab>`      | Normal  | previous \[b]uffer (cycle left)          | `plugins/bufferline.lua` |
| `<leader>x`    | Normal  | \[b]uffer close (keep layout)            | `core/keymaps.lua`       |
| `<leader>b`    | Normal  | \[b]uffer new/blank                      | `core/keymaps.lua`       |
| `:b <num>`     | Command | jump to buffer by \[n]umber              | Built-in                 |
| `:b <name>`    | Command | jump to buffer by \[n]ame (tab complete) | Built-in                 |
| `<leader>1..9` | Normal  | \[b]uffer jump number                    | `plugins/bufferline.lua` |

## Tab Management

| Shortcut     | Mode   | Action (mnemonic)  | Defined In         |
| ------------ | ------ | ------------------ | ------------------ |
| `<leader>tc` | Normal | \[t]ab \[c]reate   | `core/keymaps.lua` |
| `<leader>tx` | Normal | \[t]ab e\[x]it     | `core/keymaps.lua` |
| `<leader>tn` | Normal | \[t]ab \[n]ext     | `core/keymaps.lua` |
| `<leader>tp` | Normal | \[t]ab \[p]revious | `core/keymaps.lua` |
