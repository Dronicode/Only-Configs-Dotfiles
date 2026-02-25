# Bookmarks & Undo

## Grapple (File Bookmarks)

| Shortcut     | Mode   | Action (mnemonic)           | Defined In            |
| ------------ | ------ | --------------------------- | --------------------- |
| `<leader>m`  | Normal | \[m]ark toggle current file | `plugins/grapple.lua` |
| `<leader>M`  | Normal | \[M]arked files list        | `plugins/grapple.lua` |
| `<leader>g1` | Normal | \[g]rapple jump \[1]        | `plugins/grapple.lua` |
| `<leader>g2` | Normal | \[g]rapple jump \[2]        | `plugins/grapple.lua` |
| `<leader>g3` | Normal | \[g]rapple jump \[3]        | `plugins/grapple.lua` |
| `<leader>g4` | Normal | \[g]rapple jump \[4]        | `plugins/grapple.lua` |

**Workflow:** Mark frequent files, then jump with `<leader>g1-4`.

## Undotree (Undo History)

| Shortcut    | Mode   | Action (mnemonic)        | Defined In             |
| ----------- | ------ | ------------------------ | ---------------------- |
| `<leader>u` | Normal | toggle \[u]ndotree panel | `plugins/undotree.lua` |

### Inside Undotree

| Shortcut  | Mode   | Action (mnemonic)      | Scope           |
| --------- | ------ | ---------------------- | --------------- |
| `<C-j>`   | Normal | move state \[j]down    | Undotree window |
| `<C-k>`   | Normal | move state \[k]up      | Undotree window |
| `<Enter>` | Normal | jump to selected state | Undotree window |
| `d`       | Normal | show \[d]iff for state | Undotree window |
| `q`       | Normal | \[q]uit undotree       | Undotree window |
