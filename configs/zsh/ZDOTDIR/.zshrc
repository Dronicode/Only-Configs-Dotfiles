# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export VISUAL=nvim
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export EZA_CONFIG_DIR=~/.config/eza
export FZF_BASE=/bin/fzf
export ZSH_CACHE_DIR="${ZDOTDIR}/cache"
export CONF="$HOME/.config"

# History and completion settings
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# Better history sharing and behavior
setopt APPEND_HISTORY          # Append history when shell exits (not immediately)
setopt SHARE_HISTORY           # Share history between sessions (after appending)
setopt HIST_IGNORE_DUPS        # Don't record duplicates
setopt HIST_IGNORE_SPACE       # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks
setopt HIST_VERIFY             # Verify before executing from history

autoload -Uz compinit
compinit -d $ZDOTDIR/.zcompdump

# Auto-install Antidote if not present
if [[ ! -d $ZDOTDIR/antidote ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/antidote
fi

# Load Antidote
source $ZDOTDIR/antidote/antidote.zsh
antidote load $ZDOTDIR/plugins.txt

# Plugin-specific config
zstyle ':completion:*' cache-path $ZDOTDIR/.zcompcache
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':omz:plugins:alias-finder' autoload yes

# FZF Integration
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --ignore-file ~/.config/fd/ignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS='--reverse --sort'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# FZF keybindings
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Load keybindings
if [ -f "$ZDOTDIR/.keybinds" ]; then
    source "$ZDOTDIR/.keybinds"
fi

# Load aliases
if [ -f "$ZDOTDIR/.aliases" ]; then
    source "$ZDOTDIR/.aliases"
fi

# Load other env vars and secrets
if [ -f "$ZDOTDIR/.zsh_work_env" ]; then
    source "$ZDOTDIR/.zsh_work_env"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Set terminal title to basename of current directory for tab titles
precmd() { print -Pn "\e]0;%~\a" }

# pnpm
export PNPM_HOME="/home/luffy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

. "$HOME/.local/bin/env"
