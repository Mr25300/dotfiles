# This is run only inside interactive shells (terminal)

# LOAD P10K INSTANT PROMPT

if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-$USER.zsh" ]]; then
    source "$XDG_CACHE_HOME/p10k-instant-prompt-$USER.zsh" # To make instant prompt work
fi


# EDITING MODE

set -o vi
setopt interactivecomments # Allows comments in interactive shell

export KEYTIMEOUT=1 # Reduces wait time after escape


# HISTORY

HISTFILE="$ZSH_STATE_DIR/history"
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


# ALIASES

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -lathr'

alias grep='grep --color=auto'


# SOURCING

# Fuzzyfinding

# History Search: Ctrl + R
# File Search: Ctrl + T
# Directory Jump: Alt + C

if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
else
    echo "fzf not installed"
fi

# Plugins

if [[ ! -r ~/.local/share/znap/znap.zsh ]]; then
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.local/share/znap
fi

source ~/.local/share/znap/znap.zsh

# Autocomplete Style

zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' delay 0
zstyle ':autocomplete:*' add-semicolon no
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''

# Load Plugins

znap source romkatv/powerlevel10k
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-syntax-highlighting

# Load Theme Configuration

source "$ZDOTDIR/p10k.zsh" # Run 'p10k configure' to change
