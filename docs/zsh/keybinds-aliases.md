# Keybinds & Aliases

## Core Key Bindings (Emacs mode)

| Shortcut | Action                           | Note    |
| -------- | -------------------------------- | ------- |
| Ctrl+A/E | Move to start / end of line      | Default |
| Ctrl+K/U | Kill to end / start of line      | Default |
| Ctrl+W   | Kill previous word               | Default |
| Ctrl+Y   | Yank (paste) killed text         | Default |
| Ctrl+L   | Clear screen                     | Default |
| Ctrl+R/S | Reverse / forward history search | Default |
| Ctrl+C/D | Cancel command / exit shell      | Default |
| Ctrl+Z   | Suspend current process          | Default |

### History Navigation (substring search)

| Shortcut | Action                             | Defined In                                    |
| -------- | ---------------------------------- | --------------------------------------------- |
| ↑ / ↓    | History substring search up / down | ZDOTDIR/.zshrc (zsh-history-substring-search) |

## FZF Integration

| Shortcut | Action (mnemonic)                 | Defined In           |
| -------- | --------------------------------- | -------------------- |
| Ctrl+R   | Fuzzy search command history      | ZDOTDIR/.zshrc (fzf) |
| Ctrl+T   | Fuzzy search files in current dir | ZDOTDIR/.zshrc (fzf) |
| Alt+C    | Fuzzy search directories and cd   | ZDOTDIR/.zshrc (fzf) |

## Navigation Aliases

| Alias  | Command   | Description        | Defined In       |
| ------ | --------- | ------------------ | ---------------- |
| ../    | cd ../    | Up one directory   | ZDOTDIR/.aliases |
| ../../ | cd ../../ | Up two directories | ZDOTDIR/.aliases |
| ~      | cd ~      | Home directory     | ZDOTDIR/.aliases |

## File Listing (eza)

Current aliases:

| Alias  | Command                                                | Description                  | Defined In       |
| ------ | ------------------------------------------------------ | ---------------------------- | ---------------- |
| ll     | eza -alThM --icons --git --git-repos -L2 --total-size  | Detailed tree (2 levels)     | ZDOTDIR/.aliases |
| lli    | eza -alThM --icons --git --git-ignore -L2 --total-size | Detailed, respect .gitignore | ZDOTDIR/.aliases |
| llbyte | eza -alThMB --icons -L2 --total-size                   | Detailed with bytes          | ZDOTDIR/.aliases |

Legacy cheatsheet (if desired, add to .aliases): ll/llb/llu variations with git-ignore/no-user flags.

## Diff & Utility Aliases

| Alias | Command                | Description                     | Defined In       |
| ----- | ---------------------- | ------------------------------- | ---------------- |
| diff  | colordiff -w           | Colored diff, ignore whitespace | ZDOTDIR/.aliases |
| diffy | colordiff -y -w -W=200 | Side-by-side colored diff       | ZDOTDIR/.aliases |
| xx    | clear                  | Clear terminal                  | ZDOTDIR/.aliases |

## FZF / Navigation Examples

```bash
nvim $(fzf)              # Fuzzy find and open file
kill -9 $(ps aux | fzf | awk '{print $2}')  # Fuzzy kill
<Alt+C>                  # Fuzzy cd via fzf
```

## Git Shortcuts (OMZ git plugin)

| Alias     | Command                            | Description                    |
| --------- | ---------------------------------- | ------------------------------ |
| g         | git                                | Base git command               |
| ga/gaa    | git add / git add --all            | Stage file(s) / all            |
| gb/gba    | git branch / -a                    | List branches / all            |
| gbd       | git branch -d                      | Delete branch                  |
| gc/gc!    | git commit -v / --amend            | Commit / amend last            |
| gcm       | git checkout main                  | Checkout main                  |
| gco       | git checkout                       | Checkout branch/file           |
| gd/gds    | git diff / git diff --staged       | Show unstaged / staged changes |
| gf        | git fetch                          | Fetch remote                   |
| gl        | git pull                           | Pull                           |
| glog      | git log --oneline --graph          | Pretty log                     |
| gp/gpf    | git push / push --force-with-lease | Push / safe force push         |
| grb/grbi  | git rebase / -i                    | Rebase / interactive           |
| gst       | git status                         | Status                         |
| gsta/gstp | git stash push / pop               | Stash save / apply             |

## Python (pip plugin)

| Alias | Command                         | Description               |
| ----- | ------------------------------- | ------------------------- |
| pipi  | pip install                     | Install                   |
| pipup | pip install --upgrade           | Upgrade                   |
| pipu  | pip uninstall                   | Uninstall                 |
| pipir | pip install -r requirements.txt | Install from requirements |

## Docker & Compose Plugins

| Alias      | Command                  | Description                   |
| ---------- | ------------------------ | ----------------------------- |
| dps/dpsa   | docker ps / ps -a        | List running / all containers |
| di         | docker images            | List images                   |
| drm/drmi   | docker rm / rmi          | Remove container / image      |
| dex        | docker exec -it          | Exec into container           |
| dlog/dlogf | docker logs / -f         | Logs / follow logs            |
| drun/drit  | docker run / -it         | Run container (normal / tty)  |
| dco        | docker-compose           | Compose base                  |
| dcup/dcupd | docker-compose up / -d   | Start services (fg / det)     |
| dcdn       | docker-compose down      | Stop services                 |
| dcl/dclf   | docker-compose logs / -f | Logs / follow                 |
| dcps       | docker-compose ps        | List services                 |
| dcr        | docker-compose restart   | Restart services              |
| dcb        | docker-compose build     | Build services                |

## NPM Plugin

| Alias | Command     | Description            |
| ----- | ----------- | ---------------------- |
| npmg  | npm i -g    | Install globally       |
| npmi  | npm install | Install dependencies   |
| npms  | npm start   | Run start script       |
| npmt  | npm test    | Run tests              |
| npmr  | npm run     | Run script             |
| npmD  | npm i -D    | Install dev dependency |
