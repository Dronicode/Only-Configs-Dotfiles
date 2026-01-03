# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VISUAL=nvim
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export EZA_CONFIG_DIR=~/.config/eza
export FZF_BASE=/bin/fzf
export ZSH_CACHE_DIR="${ZDOTDIR}/cache"

# History and completion settings
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

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

# Auto-start or attach to tmux session (works, but messes with the integrated terminal in VSC and haven't fixed yet)
# if command -v tmux >/dev/null 2>&1; then
#   # Only run if not already inside tmux
#   if [ -z "$TMUX" ]; then
#     # Prefer session named "Luffy"
#     if tmux has-session -t Luffy 2>/dev/null; then
#       exec tmux attach-session -t Luffy
#     else
#       # If any session exists, attach to the first one
#       existing_session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | head -n 1)
#       if [ -n "$existing_session" ]; then
#         exec tmux attach-session -t "$existing_session"
#       else
#         # No sessions exist, create "Luffy"
#         exec tmux new-session -s Luffy
#       fi
#     fi
#   fi
# fi
