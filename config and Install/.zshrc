# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# ============================================
# PASTE FIX - Add this for proper paste handling
# ============================================

# Fix for paste issues - this disables magic functions that interfere with paste
DISABLE_MAGIC_FUNCTIONS="true"

# Also add this for better paste performance
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# ============================================
# PLUGINS - Define ALL plugins BEFORE sourcing oh-my-zsh
# ============================================

# Define ALL plugins here before sourcing oh-my-zsh.sh
plugins=(
    git
    zsh-autosuggestions
)

# Source oh-my-zsh.sh AFTER defining plugins
source $ZSH/oh-my-zsh.sh

# ============================================
# USER CONFIGURATION
# ============================================

# Preferred editor
# export EDITOR='vim' or 'nvim'

# ============================================
# HISTORY CONFIGURATION
# ============================================

# History file location
HISTFILE=~/.zsh_history

# Number of commands saved in history file
SAVEHIST=10000

# Number of commands loaded into memory
HISTSIZE=10000

# History options
setopt appendhistory
setopt share_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify

# ============================================
# AUTO-SUGGESTIONS CONFIGURATION
# ============================================

# Load zsh-autosuggestions if not loaded by oh-my-zsh
if ! command -v _zsh_autosuggest_bind_widgets >/dev/null 2>&1; then
    if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    elif [ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi
fi

# Configure autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8a8a,bold"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Accept suggestions on partial accept
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
    forward-word
    emacs-forward-word
    vi-forward-word
    vi-forward-blank-word
    vi-forward-blank-word-end
    vi-forward-word-end
)

# ============================================
# KEY BINDINGS (Paste-friendly)
# ============================================

# Disable some bindings during paste to avoid interference
paste-init() {
    OLD_ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${ZSH_AUTOSUGGEST_ACCEPT_WIDGETS[@]})
    ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
}

paste-end() {
    ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(${OLD_ZSH_AUTOSUGGEST_ACCEPT_WIDGETS[@]})
    unset OLD_ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
    zle autosuggest-fetch
}

zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Ctrl+R for reverse history search
bindkey '^R' history-incremental-search-backward

# ============================================
# COMPLETION
# ============================================

autoload -Uz compinit && compinit
autoload -Uz colors && colors

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# ============================================
# ALIASES
# ============================================

PROMPT='%F{green}%n@archlinux%f %F{blue}%~%f %F{red}➜%f '
alias dow="cd ~/Downloads"
alias de="cd ~/Desktop"

# ============================================
# FINAL INITIALIZATION
# ============================================

# Clear and fetch initial suggestions
if command -v autosuggest-fetch >/dev/null 2>&1; then
    zle autosuggest-fetch
fi
