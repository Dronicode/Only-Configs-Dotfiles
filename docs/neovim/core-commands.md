# Core Commands & Modes

## Modes & Exits

| Shortcut              | Mode          | Action (mnemonic)                                                                             | Defined In |
| --------------------- | ------------- | --------------------------------------------------------------------------------------------- | ---------- |
| `i` / `a` / `I` / `A` | Normal        | insert \[i]n place / insert \[a]fter cursor / \[I]nsert at line start / \[A]ppend end of line | Built-in   |
| `o` / `O`             | Normal        | new line \[o]below / \[O]above                                                                | Built-in   |
| `Esc` / `Ctrl-c`      | Insert/Visual | exit to Normal                                                                                | Built-in   |
| `Ctrl-[`              | Insert/Visual | exit to Normal                                                                                | Built-in   |

## Files, Buffers, Tabs

| Shortcut / Command       | Mode    | Action (mnemonic)            | Defined In |
| ------------------------ | ------- | ---------------------------- | ---------- |
| `:w`                     | Command | \[w]rite buffer              | Built-in   |
| `:q` / `:q!`             | Command | \[q]uit / force quit         | Built-in   |
| `:wq` / `:x`             | Command | \[w]rite and \[q]uit         | Built-in   |
| `:qa!`                   | Command | quit \[a]ll (force)          | Built-in   |
| `:edit file`             | Command | open file                    | Built-in   |
| `:ls` / `:buffers`       | Command | list buffers                 | Built-in   |
| `:b#`                    | Command | last buffer                  | Built-in   |
| `:b {num}` / `:b {name}` | Command | switch buffer by number/name | Built-in   |
| `:tabnew` / `:tabclose`  | Command | new tab / close tab          | Built-in   |
| `:split` / `:vsplit`     | Command | horizontal/\[v]ertical split | Built-in   |

## Registers, Macros, Repeats

| Shortcut       | Mode   | Action (mnemonic)                | Defined In |
| -------------- | ------ | -------------------------------- | ---------- |
| `"{reg}`       | Normal | use register for next yank/paste | Built-in   |
| `q{reg} ... q` | Normal | record macro to \[r]egister      | Built-in   |
| `@{reg}`       | Normal | play macro from register         | Built-in   |
| `@@`           | Normal | repeat last macro                | Built-in   |
| `.`            | Normal | repeat last change               | Built-in   |

## Folding, Spelling, Misc

| Shortcut / Command           | Mode    | Action (mnemonic)                    | Defined In |
| ---------------------------- | ------- | ------------------------------------ | ---------- |
| `zc` / `zo` / `za`           | Normal  | \[c]lose / \[o]pen / toggle\[a] fold | Built-in   |
| `:set wrap!`                 | Command | toggle line \[w]rap                  | Built-in   |
| `:set number relativenumber` | Command | show absolute+relative numbers       | Built-in   |
| `:set list!`                 | Command | toggle invisible chars               | Built-in   |
| `:noh`                       | Command | clear search highlight               | Built-in   |

## Recording Inserts in Visual Block

| Shortcut                              | Mode         | Action (mnemonic)                 | Defined In |
| ------------------------------------- | ------------ | --------------------------------- | ---------- |
| `Ctrl-v` + select + `I{text}` + `Esc` | Visual Block | insert {text} on block then apply | Built-in   |
| `Ctrl-v` + select + `A{text}` + `Esc` | Visual Block | append {text} on block            | Built-in   |
