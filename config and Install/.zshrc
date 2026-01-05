# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
plugins=(git zsh-autosuggestions)
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ============================================
# HISTORY-BASED AUTO-SUGGESTIONS
# ============================================

# Enable history search
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu

# Load zsh-autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ============================================
# HISTORY CONFIGURATION
# ============================================

# History file location
HISTFILE=~/.zsh_history

# Number of commands saved in history file
SAVEHIST=10000

# Number of commands loaded into memory
HISTSIZE=10000

# Append to history file instead of overwriting
setopt appendhistory

# Share history between terminals
setopt share_history

# Append history incrementally
setopt inc_append_history

# Save timestamp with history
setopt extended_history

# Remove duplicates when trimming history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_save_no_dups

# Ignore commands starting with space
setopt hist_ignore_space

# Reduce unnecessary whitespace
setopt hist_reduce_blanks

# Verify history expansion
setopt hist_verify

# ============================================
# AUTO-SUGGESTION CUSTOMIZATION
# ============================================

# Suggestion strategy (default is history, then completion)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Use async suggestions (faster)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Suggestion highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8a8a,bold"

# Disable suggestions for large buffers (performance)
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
# KEY BINDINGS
# ============================================

# Accept entire suggestion with right arrow
bindkey '^[[C' forward-word
bindkey '^[OC' forward-word

# Accept suggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# Accept next word of suggestion with Ctrl+F
bindkey '^f' autosuggest-partial-accept

# Execute suggestion without accepting (Ctrl+Enter)
bindkey '^[^M' autosuggest-execute

# Clear suggestion with Ctrl+G
bindkey '^g' autosuggest-clear

# Toggle suggestions with Ctrl+X Ctrl+A
bindkey '^X^A' autosuggest-toggle

# ============================================
# HISTORY SEARCH KEYBINDINGS
# ============================================

# Up/Down arrows search history based on current input
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

# Ctrl+R for reverse history search (like bash)
bindkey '^R' history-incremental-search-backward

# Ctrl+S for forward history search
bindkey '^S' history-incremental-search-forward

# ============================================
# SMART HISTORY COMPLETION
# ============================================

# Enable menu completion
zstyle ':completion:*' menu select

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Group completions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# ============================================
# CUSTOM WIDGETS FOR BETTER SUGGESTIONS
# ============================================

# Accept suggestion and execute immediately
accept-and-execute() {
    zle autosuggest-accept
    zle accept-line
}
zle -N accept-and-execute
bindkey '^J' accept-and-execute  # Ctrl+J

# Cycle through suggestions
cycle-suggestions() {
    zle autosuggest-fetch
}
zle -N cycle-suggestions
bindkey '^T' cycle-suggestions  # Ctrl+T

# ============================================
# PERFORMANCE OPTIMIZATIONS
# ============================================

# Throttle autosuggestions for performance
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Async buffer for better performance
ZSH_AUTOSUGGEST_ASYNC_FD=1

# ============================================
# VISUAL ENHANCEMENTS
# ============================================

# Show suggestion source (history vs completion)
ZSH_AUTOSUGGEST_SHOW_SOURCE=1

# Add slight delay before showing suggestions (ms)
ZSH_AUTOSUGGEST_DELAY=0.2

# ============================================
# IGNORE PATTERNS
# ============================================

# Commands that won't be suggested again
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(exit|clear|ls|pwd|cd *|cd|kill *|kill)"
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="(git *|sudo *|man *|* --help)"

# ============================================
# FINAL SETUP
# ============================================

# Enable all zsh features
autoload -Uz compinit && compinit

# Enable colors
autoload -Uz colors && colors

# Apply configurations
if [[ -n $ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE ]]; then
    _zsh_autosuggest_bind_widgets
fi

PROMPT='%F{green}%n@archlinux%f %F{blue}%~%f %F{red}➜%f '
alias dow="cd ~/Downloads"
alias de="cd ~/Desktop"

