# Terminal

## Open/Toggle Terminals

| Shortcut     | Mode   | Action (mnemonic)          | Defined In           |
| ------------ | ------ | -------------------------- | -------------------- |
| `<leader>tt` | Normal | \[t]oggle \[t]erminal      | `plugins/snacks.lua` |
| `<leader>th` | Normal | \[t]oggle floating \[h]top | `plugins/snacks.lua` |

## Terminal Buffer Navigation

| Shortcut      | Mode                     | Action (mnemonic)                  | Defined In           |
| ------------- | ------------------------ | ---------------------------------- | -------------------- |
| `Esc`         | Terminal                 | e\[s]cape to normal mode           | `plugins/snacks.lua` |
| `jk`          | Terminal                 | exit insert → normal (same as Esc) | `plugins/snacks.lua` |
| `<C-h/j/k/l>` | Terminal/Normal (term)   | move to window \[h]/\[j]/\[k]/\[l] | `plugins/snacks.lua` |
| `<C-w>`       | Terminal/Normal (term)   | enter window command prefix        | `plugins/snacks.lua` |
| `q`           | Terminal                 | \[q]uit terminal window            | `plugins/snacks.lua` |
| `q`           | Normal (terminal buffer) | \[q]uit terminal window            | `plugins/snacks.lua` |

**Notes:** Terminal defaults to a horizontal window at the bottom. `htop` opens in a floating terminal. Exit to Normal to navigate splits.
