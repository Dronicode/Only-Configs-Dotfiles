# WezTerm

Modifiers: Alt+Shift for panes/tabs · Alt for tab cycling · Ctrl+Shift for copy/search · Mouse selection copies to clipboard and primary.

## Panes

| Action                              | Keybinding              | Notes                      |
| ----------------------------------- | ----------------------- | -------------------------- |
| Focus pane left / down / up / right | Alt+Shift+h / j / k / l | Matches Neovim hjkl motion |
| Split right (vertical divider)      | Alt+Shift+>             | New pane on the right      |
| Split down (horizontal divider)     | Alt+Shift+<             | New pane below             |
| Resize pane                         | Alt+Shift+Arrow         | Adjusts by 5 cells         |
| Zoom/unzoom pane                    | Alt+Shift+z             | Toggle max pane            |
| Close pane                          | Alt+Shift+q             | Prompts to confirm         |

## Tabs

| Action              | Keybinding    | Notes             |
| ------------------- | ------------- | ----------------- |
| New tab             | Alt+Shift+c   |                   |
| Close tab           | Alt+Shift+x   | Confirmed close   |
| Next / Previous tab | Alt+n / Alt+p |                   |
| Rename tab          | Alt+Shift+,   | Prompts for title |

## Copy, Paste, and Search

| Action                             | Keybinding                 | Notes                                         |
| ---------------------------------- | -------------------------- | --------------------------------------------- |
| Copy selection                     | Ctrl+Shift+c               | Copies to clipboard and primary               |
| Paste from clipboard               | Ctrl+Shift+v               |                                               |
| Quick select (URLs, paths, hashes) | Ctrl+Shift+Space           | Selects and copies match                      |
| Search scrollback                  | Ctrl+Shift+f               | Uses current selection or empty query         |
| Mouse copy / paste                 | Select text / Middle click | Selection copies; middle click pastes primary |

## Font Size

| Action   | Keybinding |
| -------- | ---------- |
| Increase | Ctrl+=     |
| Decrease | Ctrl+-     |
| Reset    | Ctrl+0     |

## Notes

- No leader key, just modifiers; all bindings are direct to match tmux/Neovim directions.
- Status line shows a custom workspace name when set; hidden when using the default workspace.
