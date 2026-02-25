# Core motions and operators

## Global

| Shortcut / Command | Mode    | Action (mnemonic)                     | Defined In |
| ------------------ | ------- | ------------------------------------- | ---------- |
| `:h {keyword}`     | Command | open \[h]elp for keyword              | Built-in   |
| `:sav[eas] {file}` | Command | save buffer as {file}                 | Built-in   |
| `:clo[se]`         | Command | close current pane                    | Built-in   |
| `:ter[minal]`      | Command | open an embedded terminal             | Built-in   |
| `K`                | Normal  | open `man` page for word under cursor | Built-in   |

_Tip_: run `vimtutor` to learn the first commands quickly.

## Exiting

| Command             | Mode    | Action (mnemonic)            | Defined In |
| ------------------- | ------- | ---------------------------- | ---------- |
| `:w`                | Command | \[w]rite buffer (stay open)  | Built-in   |
| `:w !sudo tee %`    | Command | write current file with sudo | Built-in   |
| `:wq` / `:x` / `ZZ` | Command | write and quit               | Built-in   |
| `:q` / `:q!` / `ZQ` | Command | \[q]uit / force quit         | Built-in   |
| `:wqa`              | Command | write and quit \[a]ll tabs   | Built-in   |

## Cursor movement

| Shortcut                 | Mode          | Action (mnemonic)                         | Defined In |
| ------------------------ | ------------- | ----------------------------------------- | ---------- |
| `h`/`j`/`k`/`l`          | Normal/Visual | basic left/down/up/right                  | Built-in   |
| `gj` / `gk`              | Normal/Visual | wrapped line down/up                      | Built-in   |
| `H` / `M` / `L`          | Normal        | screen top / middle / bottom line         | Built-in   |
| `w` / `W`                | Normal/Visual | next \[w]ord start / WORD start           | Built-in   |
| `e` / `E`                | Normal/Visual | word \[e]nd / WORD end                    | Built-in   |
| `b` / `B`                | Normal/Visual | previous \[b]word start / WORD start      | Built-in   |
| `ge` / `gE`              | Normal/Visual | previous word \[e]nd / WORD end           | Built-in   |
| `%`                      | Normal/Visual | match \[p]air ((), {}, \[])               | Built-in   |
| `0` / `^`                | Normal/Visual | line start / first non-blank              | Built-in   |
| `$` / `g_`               | Normal/Visual | line end / last non-blank                 | Built-in   |
| `gg` / `G`               | Normal/Visual | go to file top / bottom                   | Built-in   |
| `{count}gg` / `{count}G` | Normal        | go to line {count}                        | Built-in   |
| `gd` / `gD`              | Normal        | go to local / global declaration          | Built-in   |
| `f{char}` / `F{char}`    | Normal/Visual | find forward/backward char                | Built-in   |
| `t{char}` / `T{char}`    | Normal/Visual | find \[t]ill before char forward/backward | Built-in   |
| `;` / `,`                | Normal/Visual | repeat last find forward / backward       | Built-in   |
| `{` / `}`                | Normal/Visual | previous / next paragraph or block        | Built-in   |
| `(` / `)`                | Normal/Visual | previous / next sentence                  | Built-in   |
| `zz` / `zt` / `zb`       | Normal        | center / top / bottom cursor line         | Built-in   |
| `Ctrl-e` / `Ctrl-y`      | Normal        | scroll view down / up one line            | Built-in   |
| `Ctrl-f` / `Ctrl-b`      | Normal        | page \[f]orward / \[b]ack                 | Built-in   |
| `Ctrl-d` / `Ctrl-u`      | Normal        | half-page \[d]own / \[u]p                 | Built-in   |
| `Ctrl-]`                 | Normal        | jump to tag under cursor                  | Built-in   |

_Tip_: prefix any motion with a count, e.g. `4j` moves down four lines.

## Editing

| Shortcut     | Mode   | Action (mnemonic)                | Defined In |
| ------------ | ------ | -------------------------------- | ---------- |
| `r{char}`    | Normal | replace one char with {char}     | Built-in   |
| `R`          | Normal | replace/overwrite until `Esc`    | Built-in   |
| `J` / `gJ`   | Normal | join with space / without space  | Built-in   |
| `gwip`       | Normal | reflow paragraph                 | Built-in   |
| `g~{motion}` | Normal | toggle case over motion          | Built-in   |
| `gu{motion}` | Normal | make motion lowercase            | Built-in   |
| `gU{motion}` | Normal | make motion UPPERCASE            | Built-in   |
| `cc` / `C`   | Normal | change entire line / to end      | Built-in   |
| `c$`         | Normal | change to line end               | Built-in   |
| `ciw`        | Normal | change \[i]nner word             | Built-in   |
| `cw` / `ce`  | Normal | change to word end               | Built-in   |
| `s` / `S`    | Normal | \[s]ubstitute char / line        | Built-in   |
| `xp`         | Normal | transpose two letters            | Built-in   |
| `u` / `U`    | Normal | undo / restore last changed line | Built-in   |
| `Ctrl-r`     | Normal | redo                             | Built-in   |
| `.`          | Normal | repeat last command              | Built-in   |

## Cut and paste

| Shortcut / Command   | Mode    | Action (mnemonic)                                   | Defined In |
| -------------------- | ------- | --------------------------------------------------- | ---------- |
| `yy` / `2yy` / `Y`   | Normal  | yank line(s) / yank to line end                     | Built-in   |
| `yw` / `yiw` / `yaw` | Normal  | yank to next word / \[i]nner word / \[a] word+space | Built-in   |
| `p` / `P`            | Normal  | paste after / before cursor                         | Built-in   |
| `gp` / `gP`          | Normal  | paste and leave cursor after pasted text            | Built-in   |
| `dd` / `2dd`         | Normal  | delete (cut) line(s)                                | Built-in   |
| `dw` / `diw` / `daw` | Normal  | delete to word / delete inner word / delete a word  | Built-in   |
| `d$` / `D`           | Normal  | delete to end of line                               | Built-in   |
| `x`                  | Normal  | delete character                                    | Built-in   |
| `:3,5d`              | Command | delete lines 3-5                                    | Built-in   |
| `:.,$d` / `:.,1d`    | Command | delete from cursor to end / to start                | Built-in   |
| `:10,1d`             | Command | delete lines 10 down to 1                           | Built-in   |
| `:g/{pat}/d`         | Command | delete all lines matching pattern                   | Built-in   |
| `:g!/{pat}/d`        | Command | delete lines not matching pattern                   | Built-in   |
| `]p`                 | Normal  | paste and auto-indent to current line               | Built-in   |

## Insert mode — inserting/appending

| Shortcut                    | Mode   | Action (mnemonic)                           | Defined In |
| --------------------------- | ------ | ------------------------------------------- | ---------- |
| `i` / `I`                   | Normal | insert \[i]n place / \[I] at line start     | Built-in   |
| `a` / `A`                   | Normal | insert \[a]fter cursor / \[A]ppend line end | Built-in   |
| `o` / `O`                   | Normal | open new line below / above and insert      | Built-in   |
| `ea`                        | Normal | \[a]ppend at end of word                    | Built-in   |
| `Ctrl-h` / `Ctrl-w`         | Insert | delete char / delete previous \[w]ord       | Built-in   |
| `Ctrl-j`                    | Insert | insert line break                           | Built-in   |
| `Ctrl-t` / `Ctrl-d`         | Insert | indent / de-indent one shiftwidth           | Built-in   |
| `Ctrl-n` / `Ctrl-p`         | Insert | insert next / previous completion match     | Built-in   |
| `Ctrl-r{x}`                 | Insert | insert contents of register {x}             | Built-in   |
| `Ctrl-o{cmd}`               | Insert | one Normal command then return to insert    | Built-in   |
| `Esc` / `Ctrl-c` / `Ctrl-[` | Insert | exit to Normal                              | Built-in   |

## Indent text

| Shortcut / Command | Mode   | Action (mnemonic)                          | Defined In |
| ------------------ | ------ | ------------------------------------------ | ---------- |
| `>>` / `<<`        | Normal | indent / de-indent one shiftwidth          | Built-in   |
| `>%` / `<%`        | Normal | indent / de-indent block at matching brace | Built-in   |
| `>ib` / `>at`      | Normal | indent inner block () / block <>           | Built-in   |
| `3==`              | Normal | reindent 3 lines                           | Built-in   |
| `=%` / `=iB`       | Normal | reindent block at brace / inner {}         | Built-in   |
| `gg=G`             | Normal | reindent entire buffer                     | Built-in   |
| `]p`               | Normal | paste and adjust indent to current line    | Built-in   |

## Search and replace

| Shortcut / Command      | Mode    | Action (mnemonic)                     | Defined In |
| ----------------------- | ------- | ------------------------------------- | ---------- |
| `/pattern` / `?pattern` | Normal  | search forward / backward for pattern | Built-in   |
| `\vpattern`             | Normal  | very-magic regex (less escaping)      | Built-in   |
| `n` / `N`               | Normal  | repeat search next / previous         | Built-in   |
| `:%s/old/new/g`         | Command | substitute old→new in file            | Built-in   |
| `:%s/old/new/gc`        | Command | substitute in file with confirm       | Built-in   |
| `:s/old/new/g`          | Command | substitute in current line            | Built-in   |
| `:noh[lsearch]`         | Command | clear search highlight                | Built-in   |

## Marking text (visual mode)

| Shortcut           | Mode   | Action (mnemonic)                | Defined In |
| ------------------ | ------ | -------------------------------- | ---------- |
| `v` / `V`          | Normal | visual char / linewise           | Built-in   |
| `Ctrl-v`           | Normal | visual block mode                | Built-in   |
| `o` / `O`          | Visual | move to other end / other corner | Built-in   |
| `aw` / `ab` / `aB` | Visual | \[a] word / block () / block {}  | Built-in   |
| `at`               | Visual | \[a] block <> tags               | Built-in   |
| `ib` / `iB` / `it` | Visual | \[i]nner block () / {} / <> tags | Built-in   |
| `Esc` / `Ctrl-c`   | Visual | exit visual mode                 | Built-in   |

_Tip_: `(` or `{` can substitute for `b`/`B` in block selections.

## Visual commands

| Shortcut  | Mode   | Action (mnemonic)               | Defined In |
| --------- | ------ | ------------------------------- | ---------- |
| `>` / `<` | Visual | shift text right / left         | Built-in   |
| `y`       | Visual | yank marked text                | Built-in   |
| `d`       | Visual | delete marked text              | Built-in   |
| `~`       | Visual | toggle case                     | Built-in   |
| `u` / `U` | Visual | lowercase / UPPERCASE selection | Built-in   |

## Registers

| Command / Shortcut | Mode    | Action (mnemonic)                    | Defined In |
| ------------------ | ------- | ------------------------------------ | ---------- |
| `:reg[isters]`     | Command | show register contents               | Built-in   |
| `"xy` / `"xp`      | Normal  | yank into / paste from register \[x] | Built-in   |
| `"+y` / `"+p`      | Normal  | yank / paste via system clipboard    | Built-in   |

_Tip_: Registers persist in `~/.viminfo`. Special registers: `0` last yank, `"` unnamed, `%` current file, `#` alternate file, `*`/`+` clipboards, `/` last search, `:` last command, `.` last insert, `-` small delete, `=` expression, `_` black hole.

## Marks and positions

| Command / Shortcut  | Mode    | Action (mnemonic)                     | Defined In |
| ------------------- | ------- | ------------------------------------- | ---------- |
| `:marks`            | Command | list marks                            | Built-in   |
| `m{a-zA-Z}`         | Normal  | set mark letter                       | Built-in   |
| `` `{mark}` ``      | Normal  | jump to mark line                     | Built-in   |
| `` `'{mark}` ``     | Normal  | jump to mark line start               | Built-in   |
| `y` `` `{mark}` ``  | Normal  | yank to mark                          | Built-in   |
| `` `0``             | Normal  | go to last exit position              | Built-in   |
| `` `"``             | Normal  | go to last edited position in file    | Built-in   |
| `` `.``             | Normal  | go to last change                     | Built-in   |
| ` ` ``              | Normal  | go back to position before last jump  | Built-in   |
| `:ju[mps]`          | Command | list jumps                            | Built-in   |
| `Ctrl-i` / `Ctrl-o` | Normal  | jump list newer / older               | Built-in   |
| `:changes`          | Command | list changes                          | Built-in   |
| `g,` / `g;`         | Normal  | newer / older position in change list | Built-in   |
| `Ctrl-]`            | Normal  | jump to tag under cursor              | Built-in   |

_Tip_: Backtick `` ` `` jumps to exact column; apostrophe `'` jumps to line start for a mark.

## Macros

| Shortcut         | Mode   | Action (mnemonic)          | Defined In |
| ---------------- | ------ | -------------------------- | ---------- |
| `q{reg}` ... `q` | Normal | record macro into register | Built-in   |
| `@{reg}`         | Normal | play macro from register   | Built-in   |
| `@@`             | Normal | rerun last macro           | Built-in   |

## Search in multiple files

| Command                  | Mode    | Action (mnemonic)              | Defined In |
| ------------------------ | ------- | ------------------------------ | ---------- |
| `:vim[grep] /pat/ **/*`  | Command | search pattern across files    | Built-in   |
| `:cn[ext]` / `:cp[rev]`  | Command | next / previous quickfix match | Built-in   |
| `:cope[n]` / `:ccl[ose]` | Command | open / close quickfix window   | Built-in   |

## Tabs

| Shortcut / Command           | Mode    | Action (mnemonic)                         | Defined In |
| ---------------------------- | ------- | ----------------------------------------- | ---------- |
| `:tabnew {file}`             | Command | open {file} in new tab                    | Built-in   |
| `Ctrl-w T`                   | Normal  | move current split to its own tab         | Built-in   |
| `gt` / `gT`                  | Normal  | next / previous tab                       | Built-in   |
| `#gt`                        | Normal  | go to tab number #                        | Built-in   |
| `:tabn[ext]` / `:tabp[rev]`  | Command | next / previous tab                       | Built-in   |
| `:tabm[ove] {#}`             | Command | move tab to index {#}                     | Built-in   |
| `:tabc[lose]` / `:tabo[nly]` | Command | close current tab / close all but current | Built-in   |
| `:tabdo {cmd}`               | Command | run {cmd} across all tabs                 | Built-in   |

## Working with multiple files & windows

| Shortcut / Command             | Mode    | Action (mnemonic)                      | Defined In |
| ------------------------------ | ------- | -------------------------------------- | ---------- |
| `:e[dit] {file}`               | Command | edit file in new buffer                | Built-in   |
| `:bn[ext]` / `:bp[rev]`        | Command | next / previous buffer                 | Built-in   |
| `:bd[elete]`                   | Command | delete buffer                          | Built-in   |
| `:b[uffer]{#}` / `:b {file}`   | Command | jump to buffer by index / name         | Built-in   |
| `:ls` / `:buffers`             | Command | list buffers                           | Built-in   |
| `:sp[lit] {file}`              | Command | horizontal split opening file          | Built-in   |
| `:vs[plit] {file}`             | Command | vertical split opening file            | Built-in   |
| `:vert ba[ll]` / `:tab ba[ll]` | Command | open all buffers vertically / in tabs  | Built-in   |
| `Ctrl-w s` / `Ctrl-w v`        | Normal  | split window horizontally / vertically | Built-in   |
| `Ctrl-w w` / `Ctrl-w q`        | Normal  | cycle windows / quit current window    | Built-in   |
| `Ctrl-w x`                     | Normal  | exchange with next window              | Built-in   |
| `Ctrl-w =`                     | Normal  | equalize window sizes                  | Built-in   |
| `Ctrl-w h/j/k/l`               | Normal  | move to left/down/up/right window      | Built-in   |
| `Ctrl-w H/J/K/L`               | Normal  | move window far left/bottom/top/right  | Built-in   |

## Diff & folds

| Shortcut / Command | Mode    | Action (mnemonic)                            | Defined In |
| ------------------ | ------- | -------------------------------------------- | ---------- |
| `zf{motion}`       | Normal  | define fold over motion                      | Built-in   |
| `zd`               | Normal  | delete fold under cursor                     | Built-in   |
| `za` / `zA`        | Normal  | toggle fold (one level / all levels)         | Built-in   |
| `zo` / `zc`        | Normal  | open / close fold under cursor               | Built-in   |
| `zr` / `zm`        | Normal  | reduce (open) / more (close) folds one level | Built-in   |
| `zi`               | Normal  | toggle folding functionality                 | Built-in   |
| `]c` / `[c`        | Normal  | next / previous diff change                  | Built-in   |
| `do` / `dp`        | Normal  | diffget (obtain) / diffput (apply)           | Built-in   |
| `:diffthis`        | Command | make current window part of diff             | Built-in   |
| `:dif[fupdate]`    | Command | update differences                           | Built-in   |
| `:diffo[ff]`       | Command | switch off diff mode for current window      | Built-in   |

_Tip_: start Vim as `vimdiff file1 file2` for a diff session; uppercase fold commands act recursively.
