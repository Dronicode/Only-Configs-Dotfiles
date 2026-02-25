# Terminal

## Open/Toggle Terminals

| Shortcut     | Mode   | Action (mnemonic)                 | Defined In               |
| ------------ | ------ | --------------------------------- | ------------------------ |
| `<leader>tt` | Normal | \[t]erminal horizontal \[t]oggle  | `plugins/toggleterm.lua` |
| `<leader>tf` | Normal | \[t]erminal \[f]loat toggle       | `plugins/toggleterm.lua` |
| `<leader>tl` | Normal | \[t]erminal \[l]azygit            | `plugins/toggleterm.lua` |
| `<leader>th` | Normal | \[t]erminal \[h]top               | `plugins/toggleterm.lua` |
| `<C-\>`      | Normal | toggle terminal (default mapping) | `plugins/toggleterm.lua` |

## Terminal Buffer Navigation

| Shortcut      | Mode                     | Action (mnemonic)                  | Defined In               |
| ------------- | ------------------------ | ---------------------------------- | ------------------------ |
| `Esc`         | Terminal                 | e\[s]cape to normal mode           | `plugins/toggleterm.lua` |
| `jk`          | Terminal                 | exit insert → normal (same as Esc) | `plugins/toggleterm.lua` |
| `<C-h/j/k/l>` | Terminal                 | move to window \[h]/\[j]/\[k]/\[l] | `plugins/toggleterm.lua` |
| `<C-w>`       | Terminal                 | enter window command prefix        | `plugins/toggleterm.lua` |
| `q`           | Terminal                 | \[q]uit terminal window            | `plugins/toggleterm.lua` |
| `q`           | Normal (terminal buffer) | \[q]uit terminal window            | `plugins/toggleterm.lua` |

**Notes:** Terminal buffers persist across buffers. Exit to Normal to navigate splits; Lazygit/htop floats strip terminal-mode mappings to avoid conflicts.
