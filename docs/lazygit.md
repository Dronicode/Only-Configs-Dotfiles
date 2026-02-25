# Lazygit

Config: configs/lazygit/config.yml (Tokyo Night-inspired colors: cyan active border, purple inactive/options, red unstaged, teal cherry-pick, dark blue selection background, light fg).

## Basics

| Shortcut       | Context | Action (mnemonic)                         |
| -------------- | ------- | ----------------------------------------- |
| ?              | Any     | show full keymap/help                     |
| q              | Any     | quit panel / go back / exit               |
| Tab            | Any     | cycle focus between panels                |
| j / k or ↓ / ↑ | Any     | move down / up in list                    |
| Enter / l      | Any     | open selected item (diff/commit/log view) |
| h              | Any     | go back (close opened view)               |
| g              | Any     | refresh status from git                   |

## Staging & Diff (files / hunks / lines)

| Shortcut | Action (mnemonic)                            | Note               |
| -------- | -------------------------------------------- | ------------------ |
| Space    | toggle stage/unstage selected file/hunk/line | Default            |
| a        | stage/unstage \[a]ll                         | Default            |
| u        | unstage selected file/hunk                   | Default            |
| x        | discard (reset) selection                    | Confirmed prompt   |
| o        | open file in $EDITOR                         | Uses VISUAL/EDITOR |

## Commit, Branch, Remote

| Shortcut | Action (mnemonic)                       | Note    |
| -------- | --------------------------------------- | ------- |
| c        | new \[c]ommit (opens editor/message)    | Default |
| A        | amend last commit                       | Default |
| p        | \[p]ush                                 | Default |
| P        | \[P]ull (fetch + merge/rebase per cfg)  | Default |
| F        | \[F]etch                                | Default |
| b        | \[b]ranch menu (checkout/create/delete) | Default |
| r        | \[r]ebase/interactive options           | Default |
| m        | \[m]erge/cherry-pick menu               | Default |

## Logs & Stash

| Shortcut | Action (mnemonic)              |
| -------- | ------------------------------ |
| v        | view commit/hunk details       |
| t        | create \[t]ag from commit      |
| s        | stash menu (save/apply/drop)   |
| S        | stage stash pop (if available) |

## Tips

- Press ? anytime to confirm the current keymap; bindings can vary by version or personal overrides.
- Tab/Shift-Tab can help move focus between left/right panes depending on context.
- Space toggles stage at the current granularity (file → hunk → line). Use arrow keys to move between hunks.
- Use `g` to refresh if the working tree changes outside lazygit.
- Respect your git configs (signing, pull.rebase, etc.); lazygit shells out to git.
