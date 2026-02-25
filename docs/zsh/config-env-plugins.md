# Environment, Config, Plugins

Shell: Zsh via Antidote · Theme: Powerlevel10k · Editor: nvim · Locale: en_GB.UTF-8

## Environment & History

| Setting / Env       | Value / Behavior                                             | Defined In     |
| ------------------- | ------------------------------------------------------------ | -------------- |
| VISUAL              | nvim                                                         | ZDOTDIR/.zshrc |
| LANG / LC_ALL       | en_GB.UTF-8                                                  | ZDOTDIR/.zshrc |
| EZA_CONFIG_DIR      | ~/.config/eza                                                | ZDOTDIR/.zshrc |
| FZF_BASE            | /bin/fzf                                                     | ZDOTDIR/.zshrc |
| PNPM_HOME           | ~/.local/share/pnpm (PATH prepended)                         | ZDOTDIR/.zshrc |
| HISTFILE            | $ZDOTDIR/.zsh_history                                        | ZDOTDIR/.zshrc |
| HISTSIZE / SAVEHIST | 50,000 / 50,000                                              | ZDOTDIR/.zshrc |
| History options     | append/share, ignore dups/leading space, trim blanks, verify | ZDOTDIR/.zshrc |

## FZF Defaults

- `FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-file ~/.config/fd/ignore'`
- CTRL-T/C/R and ALT-C reuse that command; completion/menu select enabled via `zstyle ':completion:*' menu select` and caching at `$ZDOTDIR/.zcompcache`.

## Clipboard Tips (terminals)

- Ctrl+Shift+C / Ctrl+Shift+V: copy/paste in most Linux terminals.
- Middle-click: paste primary selection (X11).
- Pipe to/from clipboard: `xclip -selection clipboard`, `wl-copy`, `pbcopy`; read with `xclip -o`, `wl-paste`, `pbpaste`.

## Plugins & Management

- Antidote auto-installs if missing, then loads `plugins.txt`.
- Completion cache: `$ZDOTDIR/.zcompcache`; history stored at `$ZDOTDIR/.zsh_history`.
- Powerlevel10k prompt sourced if present (`~/.config/zsh/.p10k.zsh`).
- Update plugins: edit `~/.config/zsh/plugins.txt`, then `antidote load ~/.config/zsh/plugins.txt` or reload `.zshrc`.

## Autosuggestions

`zsh-autosuggestions` shows gray suggestions from history. Accept with → or End; accept next word with Ctrl+→.

## Prompt & Titles

- Run `p10k configure` to tweak prompt (`~/.config/zsh/.p10k.zsh`).
- `precmd` sets terminal title to the current directory.

## Key Files & Paths

| File                    | Purpose                        |
| ----------------------- | ------------------------------ |
| ZDOTDIR/.zshrc          | Main config (env, plugins)     |
| ZDOTDIR/.aliases        | Aliases (nav, eza, diff, etc.) |
| ZDOTDIR/plugins.txt     | Plugin list for Antidote       |
| ~/.config/zsh/.p10k.zsh | Powerlevel10k config           |
