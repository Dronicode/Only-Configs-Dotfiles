# Editing, Comments, Text Objects

## Formatting

| Shortcut     | Mode   | Action (mnemonic)          | Defined In               |
| ------------ | ------ | -------------------------- | ------------------------ |
| `<leader>cf` | Normal | \[c]ode \[f]ormat via LSP  | `core/keymaps.lua`       |
| `<leader>f`  | Normal | \[f]ormat buffer (Conform) | `plugins/autoformat.lua` |

## Commenting (Comment.nvim)

| Shortcut     | Mode   | Action (mnemonic)                | Defined In            |
| ------------ | ------ | -------------------------------- | --------------------- |
| `gcc`        | Normal | toggle line \[c]omment           | `plugins/comment.lua` |
| `gbc`        | Normal | toggle \[b]lock \[c]omment       | `plugins/comment.lua` |
| `gc{motion}` | Normal | \[c]omment motion (e.g., `gc3j`) | `plugins/comment.lua` |
| `gc`         | Visual | \[c]omment selection             | `plugins/comment.lua` |
| `gcd`        | Normal | insert comment \[d]own below     | `plugins/comment.lua` |
| `gcu`        | Normal | insert comment \[u]p above       | `plugins/comment.lua` |
| `gcA`        | Normal | append comment at line end       | `plugins/comment.lua` |

## Surround (nvim-surround)

| Shortcut | Mode   | Action (mnemonic)                              | Example             | Defined In             |
| -------- | ------ | ---------------------------------------------- | ------------------- | ---------------------- |
| `ysiw"`  | Normal | \[y]ank \[s]urround \[i]nner \[w]ord with "    | `hello` → `"hello"` | `plugins/surround.lua` |
| `cs"'`   | Normal | \[c]hange \[s]urround " to '                   | `"hi"` → `'hi'`     | `plugins/surround.lua` |
| `ds"`    | Normal | \[d]elete \[s]urround "                        | `"hi"` → `hi`       | `plugins/surround.lua` |
| `ysip{`  | Normal | \[y]ank \[s]urround \[i]nner \[p]aragraph `{}` | wraps paragraph     | `plugins/surround.lua` |
| `yslb`   | Normal | \[y]ank \[s]urround \[l]ine with `b` ()        | wraps line          | `plugins/surround.lua` |

**Common brackets:** `(`, `)`, `[`, `]`, `{`, `}`, `<`, `>`, `"`

## Text Objects (Treesitter)

| Shortcut | Mode            | Action (mnemonic)        | Defined In               |
| -------- | --------------- | ------------------------ | ------------------------ |
| `aa`     | Visual/Operator | select outer \[a]rgument | `plugins/treesitter.lua` |
| `ia`     | Visual/Operator | select inner \[a]rgument | `plugins/treesitter.lua` |
| `af`     | Visual/Operator | select outer \[f]unction | `plugins/treesitter.lua` |
| `if`     | Visual/Operator | select inner \[f]unction | `plugins/treesitter.lua` |
| `ac`     | Visual/Operator | select outer \[c]lass    | `plugins/treesitter.lua` |
| `ic`     | Visual/Operator | select inner \[c]lass    | `plugins/treesitter.lua` |

## Swapping Parameters

| Shortcut    | Mode   | Action (mnemonic)                | Defined In               |
| ----------- | ------ | -------------------------------- | ------------------------ |
| `<leader>a` | Normal | swap parameter \[a]fter (next)   | `plugins/treesitter.lua` |
| `<leader>A` | Normal | swap parameter \[A]before (prev) | `plugins/treesitter.lua` |

## Incremental Selection

| Shortcut | Mode          | Action (mnemonic)           | Defined In               |
| -------- | ------------- | --------------------------- | ------------------------ |
| `<C-i>`  | Normal/Visual | init/\[i]ncrement selection | `plugins/treesitter.lua` |
| `<C-s>`  | Normal/Visual | increment \[s]cope          | `plugins/treesitter.lua` |
| `<M-i>`  | Normal/Visual | decrement selection         | `plugins/treesitter.lua` |
