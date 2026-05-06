# PATH CONFIGURATION

setopt extended_glob null_glob

path=(
    $path
    $HOME/.local/bin # For user-level applications
    $SCRIPTS
)

# Remove duplicate and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# HISTORY

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt inc_append_history
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# PROMPT

# PROMPT="[%n@%m %1~]# "

# PURE_GIT_PULL=0
#
# autoload -U promptinit; promptinit
# prompt pure


# ALIASES

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lathr'

alias grep='grep --color=auto'


# SOURCING

# Fuzzyfinding

# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

source <(fzf --zsh)
# History Search: Ctrl + R
# File Search: Ctrl + T
# Directory Jump: Alt + C

setopt interactivecomments

# Theme

source "$XDG_CACHE_HOME/p10k-instant-prompt-$USER.zsh" # To make instant prompt work

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source "$ZDOTDIR/p10k.zsh" # Run 'p10k configure' to change

# Autocomplete

PLUGINS=/usr/share/zsh/plugins

zstyle ':autocomplete:*' add-semicolon no

source "$PLUGINS/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Syntax Highlighting

source "$PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
