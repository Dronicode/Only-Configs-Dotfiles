# LSP & Diagnostics

## Diagnostics Navigation

| Shortcut     | Mode   | Action (mnemonic)                     | Defined In         |
| ------------ | ------ | ------------------------------------- | ------------------ |
| `[d`         | Normal | previous \[d]iagnostic + float        | `core/keymaps.lua` |
| `]d`         | Normal | next \[d]iagnostic + float            | `core/keymaps.lua` |
| `<leader>dd` | Normal | \[d]iagnostic \[d]etail float         | `core/keymaps.lua` |
| `<leader>dq` | Normal | \[d]iagnostic \[q]uick list (loclist) | `core/keymaps.lua` |

## Trouble.nvim (Diagnostics Viewer)

| Shortcut     | Mode   | Action (mnemonic)                  | Defined In            |
| ------------ | ------ | ---------------------------------- | --------------------- |
| `<leader>da` | Normal | \[d]iagnostics \[a]ll (project)    | `plugins/trouble.lua` |
| `<leader>db` | Normal | \[d]iagnostics \[b]uffer (current) | `plugins/trouble.lua` |
| `<leader>dl` | Normal | \[d]iagnostics \[l]ocation list    | `plugins/trouble.lua` |
| `<leader>dq` | Normal | \[d]iagnostics \[q]uickfix list    | `plugins/trouble.lua` |

## LSP Actions

| Shortcut     | Mode   | Action (mnemonic)               | Defined In           |
| ------------ | ------ | ------------------------------- | -------------------- |
| `gd`         | Normal | \[g]oto \[d]efinition           | `core/keymaps.lua`   |
| `gD`         | Normal | \[g]oto \[D]eclaration          | `core/keymaps.lua`   |
| `gr`         | Normal | \[g]oto \[r]eferences           | `core/keymaps.lua`   |
| `gi`         | Normal | \[g]oto \[i]mplementation       | `core/keymaps.lua`   |
| `gt`         | Normal | \[g]oto \[t]ype definition      | `core/keymaps.lua`   |
| `K`          | Normal | hover docs                      | `core/keymaps.lua`   |
| `<leader>k`  | Insert | signature help (\[k]ey info)    | `core/keymaps.lua`   |
| `<leader>ca` | Normal | \[c]ode \[a]ctions              | `core/keymaps.lua`   |
| `<leader>cf` | Normal | \[c]ode \[f]ormat buffer        | `core/keymaps.lua`   |
| `<leader>rn` | Normal | \[r]e\[n]ame symbol             | `core/keymaps.lua`   |
| `<leader>wa` | Normal | workspace \[a]dd                | `core/keymaps.lua`   |
| `<leader>wr` | Normal | workspace \[r]emove             | `core/keymaps.lua`   |
| `<leader>wl` | Normal | workspace \[l]ist               | `core/keymaps.lua`   |
| `<leader>nd` | Normal | \[n]eogen \[d]ocstring generate | `plugins/neogen.lua` |
