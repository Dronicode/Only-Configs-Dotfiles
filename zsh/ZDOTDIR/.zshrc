# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export VISUAL=nvim
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Minimal Zsh config
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

export FZF_BASE=/bin/fzf
export ZSH_CACHE_DIR="${ZDOTDIR}/cache"
autoload -Uz compinit
compinit -d $ZDOTDIR/.zcompdump

# Load Antidote
source $ZDOTDIR/antidote/antidote.zsh
antidote load $ZDOTDIR/plugins.txt


# Plugin-specific config
zstyle ':completion:*' cache-path $ZDOTDIR/.zcompcache
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':omz:plugins:alias-finder' autoload yes

# Keybindings and aliases
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

alias ../='cd ../'
alias ../../='cd ../../'
alias diff='colordiff -w'
alias diffy='colordiff -y -w -W=200'
alias ll='lsd -la'
alias xx='clear'

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
